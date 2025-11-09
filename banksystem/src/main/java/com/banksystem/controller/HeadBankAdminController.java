package com.banksystem.controller;

import com.banksystem.dto.*;
import com.banksystem.entity.*;
import com.banksystem.enums.BankType;
import com.banksystem.exception.ResourceNotFoundException;
import com.banksystem.repository.HeadBankRepository;
import com.banksystem.services.ChargesService;
import com.banksystem.services.DebitCardRulesService;
import com.banksystem.services.HeadBankAdminSerivice;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/api/headBank")
@Slf4j
public class HeadBankAdminController {
    private final HeadBankAdminSerivice headBankAdminSerivice;
    private final ChargesService chargesService;
    private final HeadBankRepository headBankRepository;
    private final DebitCardRulesService debitCardRulesService;

    public HeadBankAdminController(HeadBankAdminSerivice headBankAdminSerivice, ChargesService chargesService, HeadBankRepository headBankRepository, DebitCardRulesService debitCardRulesService) {
        this.headBankAdminSerivice = headBankAdminSerivice;
        this.chargesService = chargesService;
        this.headBankRepository = headBankRepository;
        this.debitCardRulesService = debitCardRulesService;
    }
    // ad branch

    @PostMapping("add_branch")
    public ResponseEntity<ApiResponse<Branch>> addBranch(@RequestBody BranchDTO branchDTO) {
        log.info("Adding branch to head Bank {}:", branchDTO.getBranchCode());
        Branch branch = headBankAdminSerivice.addBranch(branchDTO);
        log.info("successfully created branch {}:", branch.getBranchCode());
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("Branch deactivated successfully", null));
    }

    //deactivate  branch
    @DeleteMapping("deactivate_branch/{branchId}")
    public ResponseEntity<ApiResponse<Branch>> deactivateBranch(@PathVariable long branchId) {
        log.info("Deactivating branch {}:", branchId);
        headBankAdminSerivice.deactivateBranch(branchId);
        log.info("successfully deactivated branch {}:", branchId);
        return ResponseEntity.status(HttpStatus.OK).body(ApiResponse.success("Branch deactivated successfully", null));
    }

    // add branch manager
    @PostMapping("/branch_manager/add")
    public ResponseEntity<ApiResponse<BranchManager>> addBranchManager(@Valid @RequestBody BranchManagerDTO branchManagerDTO) {
        log.info("adding branch manager to branch : {}", branchManagerDTO.getFirstName() + " " + branchManagerDTO.getLastName());
        BranchManager branchManager = headBankAdminSerivice.addBranchManager(branchManagerDTO);
        log.info("succesfully added branch manager {}", branchManager.getFullName());
        return ResponseEntity.status(HttpStatus.CREATED).body(ApiResponse.success("Branch manager deactivated successfully", null));
    }

    @DeleteMapping("branch_manager/deactive/{managerId}")
    public ResponseEntity<ApiResponse<BranchManager>> deactivateBranchManager(@PathVariable Long managerId) {
        log.info("deactivating branch manager {}:", managerId);
        BranchManager branchManager=headBankAdminSerivice.deactivateManager(managerId);
        log.info("successfully deactivated branch manager {}:", branchManager.getFullName());
        return ResponseEntity.status(HttpStatus.OK).body(ApiResponse.success("Branch manager deactivated successfully", null));
    }

    // get all loan offers
    @GetMapping("/loan-offers/all/{headBankId}")
    public ResponseEntity<ApiResponse<List<LoanOffers>>> getAllLoanOffers(@PathVariable Long headBankId) {
        log.info("getting loan offers from headbank {}:", headBankId);
        List<LoanOffers> ls=headBankAdminSerivice.getAllLoanOffers(headBankId);
        log.info("successfully getting loan offers from headbank {}:", headBankId);
        return  ResponseEntity.status(HttpStatus.OK).body(ApiResponse.success("LoanOffers found successfully", ls));
    }

    //create loan offers
    @PostMapping("create-loan-offers")
    public ResponseEntity<ApiResponse<LoanOffers>> addLoanOffers(@RequestBody LoanOfferDTO loanOfferDTO) {
        log.info("adding new loan offer {}", loanOfferDTO.getName());
        headBankAdminSerivice.addLoanOffer(loanOfferDTO);
        log.info("successfully added loan offers {}", loanOfferDTO.getName());
        return ResponseEntity.status(HttpStatus.CREATED).body(ApiResponse.success("Added enw loan offer successfully", null));

    }
    // update loan offers

    @PutMapping("/loan-offers/{id}")
    public ResponseEntity<ApiResponse<LoanOffers>> updateLoanOffer(@PathVariable Long id, @Valid @RequestBody LoanOfferDTO offerDTO) {
        log.info("Received request to update loan offer with ID: {}", id);
        LoanOffers updatedOffer = headBankAdminSerivice.updateLoanOffer(id, offerDTO);
        log.info("Successfully updated loan offer with ID: {}", id);
        return ResponseEntity.ok(ApiResponse.success("Loan offer updated successfully", updatedOffer));
    }

    @DeleteMapping("/{headBankId}/loan-offers/deactive/{id}")
    public ResponseEntity<ApiResponse<LoanOffers>> deactivateLoanOffer(@PathVariable Long headBankId,@PathVariable Long id) {
        log.info("deactivating loan offer with ID: {}", id);
        LoanOffers loanOffers=headBankAdminSerivice.deactivateLoanOffers(headBankId,id);
        log.info("successfully deactivated loan offer with ID: {}", id);
        return ResponseEntity.ok(ApiResponse.success("Loan offer updated successfully", loanOffers));
    }

    //headbank eanrign get
    @GetMapping("/headBank-earning")
    public ResponseEntity<ApiResponse<BigDecimal>> getHeadBankEarnings(@RequestParam Long headBankId) {
        log.info("Received request to get head bank earnings for ID: {}", headBankId);
        BigDecimal earnings = headBankAdminSerivice.getHeadBankEarning(headBankId);
        return ResponseEntity.status(HttpStatus.ACCEPTED).body(ApiResponse.success("Head bank earnings retrieved successfully", earnings));
    }

    // get branch earing
    @GetMapping("/bank-earning")
    public ResponseEntity<ApiResponse<BigDecimal>> getBankEarnings(@RequestParam Long bankId) {
        log.info("Received request to get  bank earnings for ID: {}", bankId);
        BigDecimal earnings = headBankAdminSerivice.getBankEarning(bankId);
        return ResponseEntity.status(HttpStatus.ACCEPTED).body(ApiResponse.success(" bank earnings retrieved successfully", earnings));
    }

    // ==================== CHARGES ENDPOINTS ====================

    /**
     * Get charges by date range for Head Bank
     * Example: /api/headBank/charges/date-range?headBankId=1&startDate=2024-01-01T00:00:00&endDate=2024-12-31T23:59:59
     */
    @GetMapping("/charges/date-range")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getHeadBankChargesByDateRange(
            @RequestParam Long headBankId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime endDate) {

        log.info("Fetching Head Bank charges for ID: {}, date range: {} to {}", headBankId, startDate, endDate);
        Map<String, Object> charges = chargesService.getChargesByDateRange(
                headBankId, BankType.HEAD_BANK, startDate, endDate);
        log.info("Successfully retrieved charges for Head Bank ID: {}", headBankId);
        return ResponseEntity.ok(ApiResponse.success("Charges retrieved successfully", charges));
    }

    /**
     * Get last month charges for Head Bank
     * Example: /api/headBank/charges/last-month?headBankId=1
     */
    @GetMapping("/charges/last-month")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getHeadBankChargesLastMonth(
            @RequestParam Long headBankId) {

        log.info("Fetching Head Bank charges for last month, ID: {}", headBankId);
        Map<String, Object> charges = chargesService.getChargesLastMonth(
                headBankId, BankType.HEAD_BANK);
        log.info("Successfully retrieved last month charges for Head Bank ID: {}", headBankId);
        return ResponseEntity.ok(ApiResponse.success("Last month charges retrieved successfully", charges));
    }

    /**
     * Get last year charges for Head Bank (grouped by month)
     * Example: /api/headBank/charges/last-year?headBankId=1
     */
    @GetMapping("/charges/last-year")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getHeadBankChargesLastYear(
            @RequestParam Long headBankId) {

        log.info("Fetching Head Bank charges for last year, ID: {}", headBankId);
        Map<String, Object> charges = chargesService.getChargesLastYear(
                headBankId, BankType.HEAD_BANK);
        log.info("Successfully retrieved last year charges for Head Bank ID: {}", headBankId);
        return ResponseEntity.ok(ApiResponse.success("Last year charges retrieved successfully", charges));
    }

    /**
     * Get charges detail for a specific transaction
     * Example: /api/headBank/charges/transaction/123
     */
    @GetMapping("/charges/transaction/{transactionId}")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getTransactionChargesDetail(
            @PathVariable Long transactionId) {

        log.info("Fetching charge details for transaction ID: {}", transactionId);
        Map<String, Object> charges = chargesService.getTransactionChargesDetail(transactionId);
        log.info("Successfully retrieved charge details for transaction ID: {}", transactionId);
        return ResponseEntity.ok(ApiResponse.success("Transaction charges retrieved successfully", charges));
    }

    /**
     * Add new debit card rules
     * POST /api/headBank/debit-card-rules
     */
    @PostMapping("/debit-card-rules")
    public ResponseEntity<ApiResponse<DebitCardRules>> addDebitCardRules(
            @Valid @RequestBody DebitCardRulesDTO rulesDTO) {
        log.info("Adding new debit card rules for card type: {}", rulesDTO.getCardType());
        DebitCardRules debitCardRules = debitCardRulesService.addDebitCardRules(rulesDTO);
        log.info("Successfully added debit card rules with ID: {}", debitCardRules.getId());
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("Debit card rules created successfully", debitCardRules));
    }

    /**
     * Update existing debit card rules
     * PUT /api/headBank/debit-card-rules/{rulesId}
     */
    @PutMapping("/debit-card-rules/{rulesId}")
    public ResponseEntity<ApiResponse<DebitCardRules>> updateDebitCardRules(
            @PathVariable Long rulesId,
            @Valid @RequestBody DebitCardRulesDTO rulesDTO) {
        log.info("Updating debit card rules with ID: {}", rulesId);
        DebitCardRules updatedRules = debitCardRulesService.updateDebitCardRules(rulesId, rulesDTO);
        log.info("Successfully updated debit card rules with ID: {}", rulesId);
        return ResponseEntity.ok(ApiResponse.success("Debit card rules updated successfully", updatedRules));
    }

    /**
     * Deactivate debit card rules
     * DELETE /api/headBank/debit-card-rules/{rulesId}
     */
    @DeleteMapping("/debit-card-rules/{rulesId}")
    public ResponseEntity<ApiResponse<Void>> deactivateDebitCardRules(@PathVariable Long rulesId) {
        log.info("Deactivating debit card rules with ID: {}", rulesId);
        debitCardRulesService.deactivateDebitCardRules(rulesId);
        log.info("Successfully deactivated debit card rules with ID: {}", rulesId);
        return ResponseEntity.ok(ApiResponse.success("Debit card rules deactivated successfully", null));
    }

    /**
     * Get all debit card rules for head bank
     * GET /api/headBank/debit-card-rules/head-bank/{headBankId}
     */
    @GetMapping("/debit-card-rules/head-bank/{headBankId}")
    public ResponseEntity<ApiResponse<List<DebitCardRules>>> getAllDebitCardRulesByHeadBank(
            @PathVariable Long headBankId) {
        log.info("Fetching all debit card rules for head bank ID: {}", headBankId);
        List<DebitCardRules> rules = debitCardRulesService.getAllDebitCardRulesByHeadBank(headBankId);
        log.info("Successfully retrieved {} debit card rules", rules.size());
        return ResponseEntity.ok(ApiResponse.success("Debit card rules retrieved successfully", rules));
    }

    /**
     * Get all branches of head bank
     * GET /api/headBank/branches/{headBankId}
     */
    @GetMapping("/branches/{headBankId}")
    public ResponseEntity<ApiResponse<List<Branch>>> getAllBranchesByHeadBank(@PathVariable Long headBankId) {
        log.info("Fetching all branches for head bank ID: {}", headBankId);

        HeadBank headBank = headBankRepository.findById(headBankId)
                .orElseThrow(() -> new ResourceNotFoundException("HeadBank", "id", headBankId));

        List<Branch> branches = headBank.getBranches().stream()
                .filter(Branch::getIsActive)
                .toList();

        log.info("Successfully retrieved {} branches", branches.size());
        return ResponseEntity.ok(ApiResponse.success("Branches retrieved successfully", branches));
    }
}