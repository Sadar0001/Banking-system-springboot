package com.banksystem.services;

import com.banksystem.entity.Account;
import com.banksystem.entity.Transaction;
import com.banksystem.enums.AccountStatus;
import com.banksystem.exception.BusinessRuleException;
import com.banksystem.repository.AccountRepository;
import com.banksystem.repository.CentralBankRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.banksystem.entity.*;
import com.banksystem.enums.AccountStatus;
import com.banksystem.enums.RequestStatus;
import com.banksystem.exception.BusinessRuleException;
import com.banksystem.repository.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

    @Service
    public class TellerService {

        private final AccountRepository accountRepository;
        private final TellerRepository tellerRepository;
        private final CardRequestRepository cardRequestRepository;
        private final AccountRequestRepository accountRequestRepository;
        private final ChequeBookRequestRepository chequeBookRequestRepository;
        private final DebitCardRepository debitCardRepository;
        private final DebitCardRulesRepository debitCardRulesRepository;
        private final ChequeBookRepository chequeBookRepository;
        private final CustomerRepository customerRepository;

        public TellerService(AccountRepository accountRepository,
                             TellerRepository tellerRepository,
                             CardRequestRepository cardRequestRepository,
                             ChequeBookRequestRepository chequeBookRequestRepository,
                             DebitCardRepository debitCardRepository,
                             DebitCardRulesRepository debitCardRulesRepository,
                             ChequeBookRepository chequeBookRepository,
                             CustomerRepository customerRepository,
                             AccountRequestRepository accountRequestRepository) {
            this.accountRepository = accountRepository;
            this.tellerRepository = tellerRepository;
            this.cardRequestRepository = cardRequestRepository;
            this.accountRequestRepository = accountRequestRepository;
            this.chequeBookRequestRepository = chequeBookRequestRepository;
            this.debitCardRepository = debitCardRepository;
            this.debitCardRulesRepository = debitCardRulesRepository;
            this.chequeBookRepository = chequeBookRepository;
            this.customerRepository = customerRepository;
        }

        // ==================== HELPER METHODS ====================

        private Teller getTellerAndVerifyBranch(Long tellerId, Long requestBranchId) {
            Teller teller = tellerRepository.findById(tellerId)
                    .orElseThrow(() -> new BusinessRuleException("Teller not found"));

            if (!teller.getBranch().getId().equals(requestBranchId)) {
                throw new BusinessRuleException("This request belongs to a different branch");
            }

            return teller;
        }

        // ==================== ACCOUNT REQUESTS ====================


        public List<AccountRequest> getPendingAccountRequests(Long tellerId) {
            Teller teller = tellerRepository.findById(tellerId)
                    .orElseThrow(() -> new BusinessRuleException("Teller not found"));

            return accountRequestRepository.findPendingAccountRequestsByBranch( // CHANGE THIS
                    teller.getBranch().getId(), RequestStatus.PENDING);
        }

        @Transactional
        public Account approveAccountRequest(Long tellerId, Long requestId) {
            AccountRequest request = accountRequestRepository.findById(requestId)
                    .orElseThrow(() -> new BusinessRuleException("Account request not found"));

            getTellerAndVerifyBranch(tellerId, request.getCustomer().getBranch().getId());

            if (request.getStatus() != RequestStatus.PENDING) {
                throw new BusinessRuleException("Request is not in pending status");
            }

            // Create new account
            Account account = new Account();
            account.setCustomer(request.getCustomer());
            account.setBranch(request.getCustomer().getBranch());
            account.setAccountNumber(generateAccountNumber());
            account.setAccountType(request.getAccountType());
            account.setCurrentBalance(request.getInitialDeposit());
            account.setAvailableBalance(request.getInitialDeposit());
            account.setStatus(AccountStatus.ACTIVE);
            account.setOpenedDate(LocalDateTime.now());
            account.setCreatedAt(LocalDateTime.now());

            Account savedAccount = accountRepository.save(account);

            // Update request status
            request.setStatus(RequestStatus.APPROVED);
            request.setProcessedAt(LocalDateTime.now());
            accountRequestRepository.save(request);

            return savedAccount;
        }

        @Transactional
        public void rejectAccountRequest(Long tellerId, Long requestId, String reason) {
            AccountRequest request = accountRequestRepository.findById(requestId)
                    .orElseThrow(() -> new BusinessRuleException("Account request not found"));

            getTellerAndVerifyBranch(tellerId, request.getCustomer().getBranch().getId());

            if (request.getStatus() != RequestStatus.PENDING) {
                throw new BusinessRuleException("Request is not in pending status");
            }

            request.setStatus(RequestStatus.REJECTED);
            request.setRejectionReason(reason);
            request.setProcessedAt(LocalDateTime.now());
            accountRequestRepository.save(request);
        }

        // ==================== DEBIT CARD REQUESTS ====================

        public List<CardRequest> getPendingCardRequests(Long tellerId) {
            Teller teller = tellerRepository.findById(tellerId)
                    .orElseThrow(() -> new BusinessRuleException("Teller not found"));

            return cardRequestRepository.findByBranchAndStatus(
                    teller.getBranch().getId(), RequestStatus.PENDING);
        }

        @Transactional
        public DebitCard approveCardRequest(Long tellerId, Long requestId) {
            CardRequest request = cardRequestRepository.findById(requestId)
                    .orElseThrow(() -> new BusinessRuleException("Card request not found"));

            Teller teller = getTellerAndVerifyBranch(tellerId,
                    request.getAccount().getBranch().getId());

            if (request.getStatus() != RequestStatus.PENDING) {
                throw new BusinessRuleException("Request is not in pending status");
            }

            // Get card rules
            DebitCardRules cardRules = debitCardRulesRepository
                    .findByHeadBankAndCardType(
                            request.getAccount().getBranch().getHeadBank(),
                            request.getCardType())
                    .orElseThrow(() -> new BusinessRuleException("Card rules not found for this card type"));

            // Create debit card
            DebitCard debitCard = new DebitCard();
            debitCard.setAccount(request.getAccount());
            debitCard.setDebitCardRules(cardRules);
            debitCard.setCardNumber(generateCardNumber());
            debitCard.setCvv(generateCVV());
            debitCard.setExpiryDate(LocalDateTime.now().plusYears(5));
            debitCard.setIsActive(true);
            debitCard.setIsBlocked(false);
            debitCard.setCreatedAt(LocalDateTime.now());

            DebitCard savedCard = debitCardRepository.save(debitCard);

            // Update request
            request.setStatus(RequestStatus.ISSUED);
            request.setProcessedBy(teller);
            request.setProcessedAt(LocalDateTime.now());
            cardRequestRepository.save(request);

            return savedCard;
        }

        @Transactional
        public void rejectCardRequest(Long tellerId, Long requestId, String reason) {
            CardRequest request = cardRequestRepository.findById(requestId)
                    .orElseThrow(() -> new BusinessRuleException("Card request not found"));

            Teller teller = getTellerAndVerifyBranch(tellerId,
                    request.getAccount().getBranch().getId());

            if (request.getStatus() != RequestStatus.PENDING) {
                throw new BusinessRuleException("Request is not in pending status");
            }

            request.setStatus(RequestStatus.REJECTED);
            request.setRejectionReason(reason);
            request.setProcessedBy(teller);
            request.setProcessedAt(LocalDateTime.now());
            cardRequestRepository.save(request);
        }

        // ==================== CHEQUE BOOK REQUESTS ====================

        public List<ChequeBookRequest> getPendingChequeBookRequests(Long tellerId) {
            Teller teller = tellerRepository.findById(tellerId)
                    .orElseThrow(() -> new BusinessRuleException("Teller not found"));

            return chequeBookRequestRepository.findByBranchAndStatus(
                    teller.getBranch().getId(), RequestStatus.PENDING);
        }

        @Transactional
        public ChequeBook approveChequeBookRequest(Long tellerId, Long requestId) {
            ChequeBookRequest request = chequeBookRequestRepository.findById(requestId)
                    .orElseThrow(() -> new BusinessRuleException("Cheque book request not found"));

            Teller teller = getTellerAndVerifyBranch(tellerId,
                    request.getAccount().getBranch().getId());

            if (request.getStatus() != RequestStatus.PENDING) {
                throw new BusinessRuleException("Request is not in pending status");
            }

            // Create cheque book
            ChequeBook chequeBook = new ChequeBook();
            chequeBook.setAccount(request.getAccount());
            chequeBook.setChequeBookNumber(generateChequeBookNumber());
            chequeBook.setStartingChequeNumber(generateStartingChequeNumber());
            chequeBook.setNumberOfLeaves(request.getNumberOfLeaves());
            chequeBook.setLeavesUsed(0);
            chequeBook.setIsActive(true);
            chequeBook.setIssuedDate(LocalDateTime.now());
            chequeBook.setCreatedAt(LocalDateTime.now());

            ChequeBook savedChequeBook = chequeBookRepository.save(chequeBook);

            // Update request
            request.setStatus(RequestStatus.ISSUED);
            request.setProcessedBy(teller);
            request.setProcessedAt(LocalDateTime.now());
            chequeBookRequestRepository.save(request);

            return savedChequeBook;
        }

        @Transactional
        public void rejectChequeBookRequest(Long tellerId, Long requestId, String reason) {
            ChequeBookRequest request = chequeBookRequestRepository.findById(requestId)
                    .orElseThrow(() -> new BusinessRuleException("Cheque book request not found"));

            Teller teller = getTellerAndVerifyBranch(tellerId,
                    request.getAccount().getBranch().getId());

            if (request.getStatus() != RequestStatus.PENDING) {
                throw new BusinessRuleException("Request is not in pending status");
            }

            request.setStatus(RequestStatus.REJECTED);
            request.setRejectionReason(reason);
            request.setProcessedBy(teller);
            request.setProcessedAt(LocalDateTime.now());
            chequeBookRequestRepository.save(request);
        }

        // ==================== CUSTOMER MANAGEMENT ====================

        public List<Customer> getBranchCustomers(Long tellerId) {
            Teller teller = tellerRepository.findById(tellerId)
                    .orElseThrow(() -> new BusinessRuleException("Teller not found"));

            return customerRepository.findByBranch(teller.getBranch());
        }

        @Transactional
        public Customer updateCustomerDetails(Long tellerId, Long customerId, Customer updatedDetails) {
            Teller teller = tellerRepository.findById(tellerId)
                    .orElseThrow(() -> new BusinessRuleException("Teller not found"));

            Customer customer = customerRepository.findById(customerId)
                    .orElseThrow(() -> new BusinessRuleException("Customer not found"));

            // Verify customer belongs to teller's branch
            if (!customer.getBranch().getId().equals(teller.getBranch().getId())) {
                throw new BusinessRuleException("Customer belongs to a different branch");
            }

            // Update allowed fields
            if (updatedDetails.getEmail() != null) {
                customer.setEmail(updatedDetails.getEmail());
            }
            if (updatedDetails.getPhone() != null) {
                customer.setPhone(updatedDetails.getPhone());
            }
            if (updatedDetails.getAddress() != null) {
                customer.setAddress(updatedDetails.getAddress());
            }

            customer.setUpdatedAt(LocalDateTime.now());
            return customerRepository.save(customer);
        }

        // ==================== HELPER METHODS FOR GENERATION ====================


        private String generateAccountNumber() {
            return "ACC" + System.currentTimeMillis() +
                    UUID.randomUUID().toString().substring(0, 6).toUpperCase();
        }

        private String generateCardNumber() {
            // Generate 16-digit card number
            StringBuilder cardNumber = new StringBuilder("4532"); // Visa prefix
            for (int i = 0; i < 12; i++) {
                cardNumber.append((int) (Math.random() * 10));
            }
            return cardNumber.toString();
        }

        private String generateCVV() {
            return String.format("%03d", (int) (Math.random() * 1000));
        }

        private String generateChequeBookNumber() {
            return "CHQ" + System.currentTimeMillis() +
                    UUID.randomUUID().toString().substring(0, 4).toUpperCase();
        }

        private Long generateStartingChequeNumber() {
            return System.currentTimeMillis() % 1000000;
        }

        // ==================== ACCOUNT VALIDATION ====================

        public boolean validateAccountForTransaction(Account account) {
            Account ac = accountRepository.findById(account.getId())
                    .orElseThrow(() -> new BusinessRuleException("Account id" + account.getId()));
            return ac.getStatus() == AccountStatus.ACTIVE;
        }
    }


