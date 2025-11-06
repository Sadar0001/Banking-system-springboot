package com.banksystem.controller;

import com.banksystem.dto.ApiResponse;
import com.banksystem.dto.TellerDTO;
import com.banksystem.entity.*;
import com.banksystem.enums.BankType;
import com.banksystem.services.ChargesService;
import com.banksystem.services.branchManagerService;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/branch-manager")
@Slf4j
public class BranchManagerController {

    @Autowired
    private branchManagerService branchManagerService;

    @Autowired
    private ChargesService chargesService;

    // Fix constructor to include both services
    public BranchManagerController(branchManagerService branchManagerService, ChargesService chargesService) {
        this.branchManagerService = branchManagerService;
        this.chargesService = chargesService;
    }

    // ==================== TELLER MANAGEMENT ====================

    @PostMapping("/tellers")
    public ResponseEntity<ApiResponse<Teller>> addTeller(@Valid @RequestBody TellerDTO tellerDTO) {
        log.info("Received request to add new teller: {}", tellerDTO.getUsername());
        Teller teller = branchManagerService.addTeller(tellerDTO);
        log.info("Successfully added new teller: {}", tellerDTO.getUsername());
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("Teller created successfully", teller));
    }

    @DeleteMapping("/tellers/{id}")
    public ResponseEntity<ApiResponse<Void>> deactivateTeller(@PathVariable Long id) {
        log.info("Received request to deactivate teller with ID: {}", id);
        branchManagerService.deactivateTeller(id);
        log.info("Successfully deactivated teller with ID: {}", id);
        return ResponseEntity.status(HttpStatus.NO_CONTENT)
                .body(ApiResponse.success("Teller deactivated successfully", null));
    }

    @GetMapping("/tellers/{branchId}")
    public ResponseEntity<ApiResponse<List<Teller>>> getTellersByBranch(@PathVariable Long branchId) {
        log.info("Received request to get tellers for branch ID: {}", branchId);
        List<Teller> tellers = branchManagerService.getTellersByBranch(branchId);
        log.info("Successfully got all tellers for branch ID: {}", branchId);
        return ResponseEntity.ok(ApiResponse.success("Tellers retrieved successfully", tellers));
    }

    // ==================== LOAN MANAGEMENT ====================

    /**
     * 1. Get pending loan applications
     */
    @GetMapping("/{branchManagerId}/loans/pending")
    public ResponseEntity<ApiResponse<List<LoanApplication>>> getPendingLoanApplications(
            @PathVariable Long branchManagerId) {
        log.info("Branch Manager {} fetching pending loan applications", branchManagerId);
        List<LoanApplication> applications = branchManagerService.getPendingLoanApplications(branchManagerId);
        log.info("Found {} pending loan applications", applications.size());
        return ResponseEntity.ok(ApiResponse.success("Pending loan applications retrieved successfully", applications));
    }

    /**
     * 2. Approve loan application
     */
    @PostMapping("/{branchManagerId}/loans/{loanApplicationId}/approve")
    public ResponseEntity<ApiResponse<LoanApplication>> approveLoanApplication(
            @PathVariable Long branchManagerId,
            @PathVariable Long loanApplicationId,
            @RequestParam BigDecimal approvedAmount,
            @RequestParam Integer approvedTenure) {
        log.info("Branch Manager {} approving loan application: {}", branchManagerId, loanApplicationId);
        LoanApplication application = branchManagerService.approveLoanApplication(
                branchManagerId, loanApplicationId, approvedAmount, approvedTenure);
        log.info("Loan application {} approved successfully", loanApplicationId);
        return ResponseEntity.ok(ApiResponse.success("Loan application approved successfully", application));
    }

    /**
     * 3. Reject loan application
     */
    @PostMapping("/{branchManagerId}/loans/{loanApplicationId}/reject")
    public ResponseEntity<ApiResponse<LoanApplication>> rejectLoanApplication(
            @PathVariable Long branchManagerId,
            @PathVariable Long loanApplicationId,
            @RequestParam String rejectionReason) {
        log.info("Branch Manager {} rejecting loan application: {}", branchManagerId, loanApplicationId);
        LoanApplication application = branchManagerService.rejectLoanApplication(
                branchManagerId, loanApplicationId, rejectionReason);
        log.info("Loan application {} rejected successfully", loanApplicationId);
        return ResponseEntity.ok(ApiResponse.success("Loan application rejected successfully", application));
    }

    // ==================== ACCOUNT MANAGEMENT ====================

    /**
     * 4. Freeze single account
     */
    @PutMapping("/{branchManagerId}/accounts/{accountId}/freeze")
    public ResponseEntity<ApiResponse<Void>> freezeAccount(
            @PathVariable Long branchManagerId,
            @PathVariable Long accountId) {
        log.info("Branch Manager {} freezing account: {}", branchManagerId, accountId);
        branchManagerService.freezeAccount(branchManagerId, accountId);
        log.info("Account {} frozen successfully", accountId);
        return ResponseEntity.ok(ApiResponse.success("Account frozen successfully", null));
    }

    /**
     * 5. Freeze all customer accounts
     */
    @PutMapping("/{branchManagerId}/customers/{customerId}/freeze-all")
    public ResponseEntity<ApiResponse<Void>> freezeAllCustomerAccounts(
            @PathVariable Long branchManagerId,
            @PathVariable Long customerId) {
        log.info("Branch Manager {} freezing all accounts for customer: {}", branchManagerId, customerId);
        branchManagerService.freezeAllCustomerAccounts(branchManagerId, customerId);
        log.info("All accounts for customer {} frozen successfully", customerId);
        return ResponseEntity.ok(ApiResponse.success("All customer accounts frozen successfully", null));
    }

    /**
     * 6. Unfreeze account
     */
    @PutMapping("/{branchManagerId}/accounts/{accountId}/unfreeze")
    public ResponseEntity<ApiResponse<Void>> unfreezeAccount(
            @PathVariable Long branchManagerId,
            @PathVariable Long accountId) {
        log.info("Branch Manager {} unfreezing account: {}", branchManagerId, accountId);
        branchManagerService.unfreezeAccount(branchManagerId, accountId);
        log.info("Account {} unfrozen successfully", accountId);
        return ResponseEntity.ok(ApiResponse.success("Account unfrozen successfully", null));
    }

    /**
     * 7. Close account
     */
    @DeleteMapping("/{branchManagerId}/accounts/{accountId}/close")
    public ResponseEntity<ApiResponse<Void>> closeAccount(
            @PathVariable Long branchManagerId,
            @PathVariable Long accountId) {
        log.info("Branch Manager {} closing account: {}", branchManagerId, accountId);
        branchManagerService.closeAccount(branchManagerId, accountId);
        log.info("Account {} closed successfully", accountId);
        return ResponseEntity.ok(ApiResponse.success("Account closed successfully", null));
    }

    // ==================== REPORTS & ANALYTICS ====================

    /**
     * 8. Get branch earning details by date range
     */
    @GetMapping("/{branchManagerId}/earnings")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getBranchEarningDetails(
            @PathVariable Long branchManagerId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime endDate) {
        log.info("Branch Manager {} fetching earnings from {} to {}", branchManagerId, startDate, endDate);

        // Get branch manager to get branch ID
        BranchManager branchManager = branchManagerService.getBranchManagerById(branchManagerId);
        Map<String, Object> earnings = branchManagerService.getBranchEarningDetails(
                branchManager.getBranch().getId(), startDate, endDate);

        log.info("Successfully retrieved earnings for branch manager: {}", branchManagerId);
        return ResponseEntity.ok(ApiResponse.success("Branch earnings retrieved successfully", earnings));
    }

    /**
     * 9. Get branch loan statistics
     */
    @GetMapping("/{branchManagerId}/loans/statistics")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getBranchLoanStatistics(
            @PathVariable Long branchManagerId) {
        log.info("Branch Manager {} fetching loan statistics", branchManagerId);

        BranchManager branchManager = branchManagerService.getBranchManagerById(branchManagerId);
        Map<String, Object> statistics = branchManagerService.getBranchLoanStatistics(
                branchManager.getBranch().getId());

        log.info("Successfully retrieved loan statistics for branch manager: {}", branchManagerId);
        return ResponseEntity.ok(ApiResponse.success("Loan statistics retrieved successfully", statistics));
    }

    /**
     * 10. Get transaction list by date range
     */
    @GetMapping("/{branchManagerId}/transactions")
    public ResponseEntity<ApiResponse<List<Transaction>>> getTransactionListByDateRange(
            @PathVariable Long branchManagerId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime endDate) {
        log.info("Branch Manager {} fetching transactions from {} to {}", branchManagerId, startDate, endDate);

        BranchManager branchManager = branchManagerService.getBranchManagerById(branchManagerId);
        List<Transaction> transactions = branchManagerService.getTransactionListByDateRange(
                branchManager.getBranch().getId(), startDate, endDate);

        log.info("Found {} transactions for branch manager: {}", transactions.size(), branchManagerId);
        return ResponseEntity.ok(ApiResponse.success("Transactions retrieved successfully", transactions));
    }

    /**
     * 11. Get all customers of the branch and their details
     */
    @GetMapping("/{branchManagerId}/customers")
    public ResponseEntity<ApiResponse<List<Customer>>> getAllCustomersByBranch(
            @PathVariable Long branchManagerId) {
        log.info("Branch Manager {} fetching all customers", branchManagerId);

        BranchManager branchManager = branchManagerService.getBranchManagerById(branchManagerId);
        List<Customer> customers = branchManagerService.getAllCustomersByBranch(
                branchManager.getBranch().getId());

        log.info("Found {} customers for branch manager: {}", customers.size(), branchManagerId);
        return ResponseEntity.ok(ApiResponse.success("Customers retrieved successfully", customers));
    }

    /**
     * 12. Get customer details with all accounts
     */
    @GetMapping("/{branchManagerId}/customers/{customerId}/details")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getCustomerDetailsWithAccounts(
            @PathVariable Long branchManagerId,
            @PathVariable Long customerId) {
        log.info("Branch Manager {} fetching detailed customer info for: {}", branchManagerId, customerId);

        Map<String, Object> customerDetails = branchManagerService.getCustomerDetailsWithAccounts(
                branchManagerId, customerId);

        log.info("Successfully retrieved customer details for: {}", customerId);
        return ResponseEntity.ok(ApiResponse.success("Customer details retrieved successfully", customerDetails));
    }

    /**
     * 13. Get all account details of the branch
     */
    @GetMapping("/{branchManagerId}/accounts")
    public ResponseEntity<ApiResponse<List<Account>>> getAllAccountsByBranch(
            @PathVariable Long branchManagerId) {
        log.info("Branch Manager {} fetching all accounts", branchManagerId);

        BranchManager branchManager = branchManagerService.getBranchManagerById(branchManagerId);
        List<Account> accounts = branchManagerService.getAllAccountsByBranch(
                branchManager.getBranch().getId());

        log.info("Found {} accounts for branch manager: {}", accounts.size(), branchManagerId);
        return ResponseEntity.ok(ApiResponse.success("Accounts retrieved successfully", accounts));
    }

    // ==================== CHARGES ENDPOINTS ====================

    /**
     * Get charges by date range for Branch
     * Example: /api/branch-manager/charges/date-range?branchId=1&startDate=2024-01-01T00:00:00&endDate=2024-12-31T23:59:59
     */
    @GetMapping("/charges/date-range")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getBranchChargesByDateRange(
            @RequestParam Long branchId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime endDate) {

        log.info("Fetching Branch charges for ID: {}, date range: {} to {}", branchId, startDate, endDate);
        Map<String, Object> charges = chargesService.getChargesByDateRange(
                branchId, BankType.BANK_BRANCH, startDate, endDate);
        log.info("Successfully retrieved charges for Branch ID: {}", branchId);
        return ResponseEntity.ok(ApiResponse.success("Charges retrieved successfully", charges));
    }

    /**
     * Get last month charges for Branch
     * Example: /api/branch-manager/charges/last-month?branchId=1
     */
    @GetMapping("/charges/last-month")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getBranchChargesLastMonth(
            @RequestParam Long branchId) {

        log.info("Fetching Branch charges for last month, ID: {}", branchId);
        Map<String, Object> charges = chargesService.getChargesLastMonth(
                branchId, BankType.BANK_BRANCH);
        log.info("Successfully retrieved last month charges for Branch ID: {}", branchId);
        return ResponseEntity.ok(ApiResponse.success("Last month charges retrieved successfully", charges));
    }

    /**
     * Get last year charges for Branch (grouped by month)
     * Example: /api/branch-manager/charges/last-year?branchId=1
     */
    @GetMapping("/charges/last-year")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getBranchChargesLastYear(
            @RequestParam Long branchId) {

        log.info("Fetching Branch charges for last year, ID: {}", branchId);
        Map<String, Object> charges = chargesService.getChargesLastYear(
                branchId, BankType.BANK_BRANCH);
        log.info("Successfully retrieved last year charges for Branch ID: {}", branchId);
        return ResponseEntity.ok(ApiResponse.success("Last year charges retrieved successfully", charges));
    }

    /**
     * Get charges detail for a specific transaction
     * Example: /api/branch-manager/charges/transaction/123
     */
    @GetMapping("/charges/transaction/{transactionId}")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getTransactionChargesDetail(
            @PathVariable Long transactionId) {

        log.info("Fetching charge details for transaction ID: {}", transactionId);
        Map<String, Object> charges = chargesService.getTransactionChargesDetail(transactionId);
        log.info("Successfully retrieved charge details for transaction ID: {}", transactionId);
        return ResponseEntity.ok(ApiResponse.success("Transaction charges retrieved successfully", charges));
    }
}