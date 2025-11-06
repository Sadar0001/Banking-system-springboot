package com.banksystem.services;


import com.banksystem.dto.TellerDTO;
import com.banksystem.entity.*;
import com.banksystem.enums.AccountStatus;
import com.banksystem.enums.RequestStatus;
import com.banksystem.exception.BusinessRuleException;
import com.banksystem.exception.ResourceNotFoundException;
import com.banksystem.repository.*;
import jakarta.validation.Valid;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class branchManagerService {

    private final BranchRepository branchRepository;
    private final TellerRepository tellerRepository;
    private final LoanApplicationRepository loanApplicationRepository;
    private final ChargesBookRepository chargesBookRepository;
    private final AccountRepository accountRepository;
    private final CustomerRepository customerRepository;
    private final TransactionRepository transactionRepository;
    private final BranchManagerRepository branchManagerRepository;

    public branchManagerService(BranchRepository branchRepository, TellerRepository tellerRepository, LoanApplicationRepository loanApplicationRepository, ChargesBookRepository chargesBookRepository, AccountRepository accountRepository, CustomerRepository customerRepository, TransactionRepository transactionRepository, BranchManagerRepository branchManagerRepository) {
        this.branchRepository = branchRepository;
        this.tellerRepository = tellerRepository;
        this.loanApplicationRepository = loanApplicationRepository;
        this.chargesBookRepository = chargesBookRepository;
        this.accountRepository = accountRepository;
        this.customerRepository = customerRepository;
        this.transactionRepository = transactionRepository;
        this.branchManagerRepository = branchManagerRepository;
    }

    @Transactional
    public  Teller addTeller(@Valid TellerDTO tellerDTO) {
        // branch-exist add birectional return
        Branch branch =branchRepository.findById(tellerDTO.getBranchId()).orElseThrow(()-> new BusinessRuleException("Branch not found with id "+tellerDTO.getBranchId()));
        Teller teller = new Teller();
        teller.setFullName(tellerDTO.getFirstName()+tellerDTO.getLastName());
        teller.setUsername(tellerDTO.getUsername());
        teller.setEmail(tellerDTO.getEmail());
        teller.setIsActive(true);
        teller.setCreatedAt(LocalDateTime.now());
        teller.setPasswordHash(tellerDTO.getPassword());

        branch.getTellers().add(teller);
        teller.setBranch(branch);
        Teller savedTeller = tellerRepository.save(teller);

        return savedTeller;
    }


    public  void deactivateTeller(Long tellerId) {
        Teller teller = tellerRepository.findById(tellerId).orElseThrow(() -> new BusinessRuleException("Teller id"+ tellerId));
        teller.setIsActive(false);
        tellerRepository.save(teller);
    }


    public  List<Teller> getTellersByBranch(Long branchId) {
        if (!branchRepository.existsById(branchId)) {
            throw new BusinessRuleException("Branch id "+ branchId);
        }

        return tellerRepository.findByBranchIdAndIsActive(branchId, true);
    }


    // ==================== NEW METHODS FOR BRANCH MANAGER ====================

    /**
     * 1. Get pending loan applications for branch
     */
    public List<LoanApplication> getPendingLoanApplications(Long branchManagerId) {
        BranchManager branchManager = branchManagerRepository.findById(branchManagerId)
                .orElseThrow(() -> new ResourceNotFoundException("BranchManager", "id", branchManagerId));

        return loanApplicationRepository.findPendingApplicationsByBranch(branchManager.getBranch().getId());
    }

    /**
     * 2. Approve loan application
     */
    @Transactional
    public LoanApplication approveLoanApplication(Long branchManagerId, Long loanApplicationId,
                                                  BigDecimal approvedAmount, Integer approvedTenure) {
        BranchManager branchManager = branchManagerRepository.findById(branchManagerId)
                .orElseThrow(() -> new ResourceNotFoundException("BranchManager", "id", branchManagerId));

        LoanApplication loanApplication = loanApplicationRepository.findById(loanApplicationId)
                .orElseThrow(() -> new ResourceNotFoundException("LoanApplication", "id", loanApplicationId));

        // Verify loan application belongs to branch manager's branch
        if (!loanApplication.getCustomer().getBranch().getId().equals(branchManager.getBranch().getId())) {
            throw new BusinessRuleException("Loan application does not belong to your branch");
        }

        if (loanApplication.getStatus() != RequestStatus.PENDING) {
            throw new BusinessRuleException("Loan application is not in pending status");
        }

        loanApplication.setStatus(RequestStatus.APPROVED);
        loanApplication.setApprovedBy(branchManager);
        loanApplication.setApprovedAmount(approvedAmount);
        loanApplication.setApprovedTenureMonths(approvedTenure);
        loanApplication.setApprovedAt(LocalDateTime.now());

        return loanApplicationRepository.save(loanApplication);
    }

    /**
     * 3. Reject loan application
     */
    @Transactional
    public LoanApplication rejectLoanApplication(Long branchManagerId, Long loanApplicationId, String rejectionReason) {
        BranchManager branchManager = branchManagerRepository.findById(branchManagerId)
                .orElseThrow(() -> new ResourceNotFoundException("BranchManager", "id", branchManagerId));

        LoanApplication loanApplication = loanApplicationRepository.findById(loanApplicationId)
                .orElseThrow(() -> new ResourceNotFoundException("LoanApplication", "id", loanApplicationId));

        // Verify loan application belongs to branch manager's branch
        if (!loanApplication.getCustomer().getBranch().getId().equals(branchManager.getBranch().getId())) {
            throw new BusinessRuleException("Loan application does not belong to your branch");
        }

        if (loanApplication.getStatus() != RequestStatus.PENDING) {
            throw new BusinessRuleException("Loan application is not in pending status");
        }

        loanApplication.setStatus(RequestStatus.REJECTED);
        loanApplication.setRejectionReason(rejectionReason);
        loanApplication.setApprovedAt(LocalDateTime.now());

        return loanApplicationRepository.save(loanApplication);
    }

    /**
     * 4. Freeze customer account or all accounts
     */
    @Transactional
    public void freezeAccount(Long branchManagerId, Long accountId) {
        BranchManager branchManager = branchManagerRepository.findById(branchManagerId)
                .orElseThrow(() -> new ResourceNotFoundException("BranchManager", "id", branchManagerId));

        Account account = accountRepository.findById(accountId)
                .orElseThrow(() -> new ResourceNotFoundException("Account", "id", accountId));

        // Verify account belongs to branch manager's branch
        if (!account.getBranch().getId().equals(branchManager.getBranch().getId())) {
            throw new BusinessRuleException("Account does not belong to your branch");
        }

        account.setStatus(AccountStatus.FROZEN);
        accountRepository.save(account);
    }

    /**
     * 5. Freeze all accounts of a customer
     */
    @Transactional
    public void freezeAllCustomerAccounts(Long branchManagerId, Long customerId) {
        BranchManager branchManager = branchManagerRepository.findById(branchManagerId)
                .orElseThrow(() -> new ResourceNotFoundException("BranchManager", "id", branchManagerId));

        Customer customer = customerRepository.findById(customerId)
                .orElseThrow(() -> new ResourceNotFoundException("Customer", "id", customerId));

        // Verify customer belongs to branch manager's branch
        if (!customer.getBranch().getId().equals(branchManager.getBranch().getId())) {
            throw new BusinessRuleException("Customer does not belong to your branch");
        }

        List<Account> accounts = accountRepository.findByCustomer(customer);
        for (Account account : accounts) {
            account.setStatus(AccountStatus.FROZEN);
        }
        accountRepository.saveAll(accounts);
    }

    /**
     * 6. Unfreeze customer account
     */
    @Transactional
    public void unfreezeAccount(Long branchManagerId, Long accountId) {
        BranchManager branchManager = branchManagerRepository.findById(branchManagerId)
                .orElseThrow(() -> new ResourceNotFoundException("BranchManager", "id", branchManagerId));

        Account account = accountRepository.findById(accountId)
                .orElseThrow(() -> new ResourceNotFoundException("Account", "id", accountId));

        // Verify account belongs to branch manager's branch
        if (!account.getBranch().getId().equals(branchManager.getBranch().getId())) {
            throw new BusinessRuleException("Account does not belong to your branch");
        }

        account.setStatus(AccountStatus.ACTIVE);
        accountRepository.save(account);
    }

    /**
     * 7. Close account
     */
    @Transactional
    public void closeAccount(Long branchManagerId, Long accountId) {
        BranchManager branchManager = branchManagerRepository.findById(branchManagerId)
                .orElseThrow(() -> new ResourceNotFoundException("BranchManager", "id", branchManagerId));

        Account account = accountRepository.findById(accountId)
                .orElseThrow(() -> new ResourceNotFoundException("Account", "id", accountId));

        // Verify account belongs to branch manager's branch
        if (!account.getBranch().getId().equals(branchManager.getBranch().getId())) {
            throw new BusinessRuleException("Account does not belong to your branch");
        }

        if (account.getCurrentBalance().compareTo(BigDecimal.ZERO) != 0) {
            throw new BusinessRuleException("Cannot close account with balance. Please withdraw all funds first.");
        }

        account.setStatus(AccountStatus.CLOSED);
        account.setClosedDate(LocalDateTime.now());
        accountRepository.save(account);
    }

    /**
     * 8. Get branch earning details by date range
     */
    public Map<String, Object> getBranchEarningDetails(Long branchId, LocalDateTime startDate, LocalDateTime endDate) {
        Branch branch = branchRepository.findById(branchId)
                .orElseThrow(() -> new ResourceNotFoundException("Branch", "id", branchId));

        // This would typically involve a complex query to calculate earnings
        // For now, returning basic structure
        Map<String, Object> earnings = Map.of(
                "branchId", branchId,
                "branchName", branch.getName(),
                "startDate", startDate,
                "endDate", endDate,
                "totalEarnings", branch.getTotalEarning(),
                "periodEarnings", BigDecimal.ZERO, // This should be calculated from transactions
                "transactionCount", 0
        );

        return earnings;
    }

    /**
     * 9. Get branch loan statistics
     */
    public Map<String, Object> getBranchLoanStatistics(Long branchId) {
        Branch branch = branchRepository.findById(branchId)
                .orElseThrow(() -> new ResourceNotFoundException("Branch", "id", branchId));

        List<LoanApplication> allLoanApplications = loanApplicationRepository.findAll().stream()
                .filter(la -> la.getCustomer().getBranch().getId().equals(branchId))
                .collect(Collectors.toList());

        long pendingLoans = allLoanApplications.stream()
                .filter(la -> la.getStatus() == RequestStatus.PENDING)
                .count();

        long approvedLoans = allLoanApplications.stream()
                .filter(la -> la.getStatus() == RequestStatus.APPROVED)
                .count();

        long rejectedLoans = allLoanApplications.stream()
                .filter(la -> la.getStatus() == RequestStatus.REJECTED)
                .count();

        BigDecimal totalLoanAmount = allLoanApplications.stream()
                .map(LoanApplication::getRequestedAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        return Map.of(
                "branchId", branchId,
                "totalLoanApplications", allLoanApplications.size(),
                "pendingLoans", pendingLoans,
                "approvedLoans", approvedLoans,
                "rejectedLoans", rejectedLoans,
                "totalLoanAmount", totalLoanAmount
        );
    }

    /**
     * 10. Get transaction list by date range
     */
    public List<Transaction> getTransactionListByDateRange(Long branchId, LocalDateTime startDate, LocalDateTime endDate) {
        Branch branch = branchRepository.findById(branchId)
                .orElseThrow(() -> new ResourceNotFoundException("Branch", "id", branchId));

        // Get all accounts in the branch
        List<Account> branchAccounts = branch.getAccounts();

        // Get transactions for all accounts in the branch within date range
        return branchAccounts.stream()
                .flatMap(account -> transactionRepository.findByAccountAndDateRange(account, startDate, endDate).stream())
                .distinct()
                .collect(Collectors.toList());
    }

    /**
     * 11. Get all customers of the branch and their details
     */
    public List<Customer> getAllCustomersByBranch(Long branchId) {
        Branch branch = branchRepository.findById(branchId)
                .orElseThrow(() -> new ResourceNotFoundException("Branch", "id", branchId));

        return customerRepository.findByBranch(branch);
    }

    /**
     * 12. Get customer details with all accounts
     */
    public Map<String, Object> getCustomerDetailsWithAccounts(Long branchManagerId, Long customerId) {
        BranchManager branchManager = branchManagerRepository.findById(branchManagerId)
                .orElseThrow(() -> new ResourceNotFoundException("BranchManager", "id", branchManagerId));

        Customer customer = customerRepository.findById(customerId)
                .orElseThrow(() -> new ResourceNotFoundException("Customer", "id", customerId));

        // Verify customer belongs to branch manager's branch
        if (!customer.getBranch().getId().equals(branchManager.getBranch().getId())) {
            throw new BusinessRuleException("Customer does not belong to your branch");
        }

        List<Account> accounts = accountRepository.findByCustomer(customer);
        List<LoanApplication> loanApplications = loanApplicationRepository.findByCustomer(customer);

        return Map.of(
                "customer", customer,
                "accounts", accounts,
                "loanApplications", loanApplications,
                "totalAccounts", accounts.size(),
                "activeAccounts", accounts.stream().filter(acc -> acc.getStatus() == AccountStatus.ACTIVE).count()
        );
    }

    /**
     * 13. Get all account details of the branch
     */
    public List<Account> getAllAccountsByBranch(Long branchId) {
        Branch branch = branchRepository.findById(branchId)
                .orElseThrow(() -> new ResourceNotFoundException("Branch", "id", branchId));

        return branch.getAccounts();
    }

    /**
     * 14. Get branch manager by ID (helper method)
     */
    public BranchManager getBranchManagerById(Long branchManagerId) {
        return branchManagerRepository.findById(branchManagerId)
                .orElseThrow(() -> new ResourceNotFoundException("BranchManager", "id", branchManagerId));
    }
}
