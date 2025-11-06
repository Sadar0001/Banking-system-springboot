package com.banksystem.controller;

import com.banksystem.dto.*;
import com.banksystem.entity.*;
import com.banksystem.services.CustomerService;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/customer")
@Slf4j
public class CustomerController {

    private final CustomerService customerService;

    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    // ==================== ACCOUNT REQUESTS ====================

    @PostMapping("/{customerId}/accounts/request")
    public ResponseEntity<ApiResponse<AccountRequest>> requestNewAccount(
            @PathVariable Long customerId,
            @Valid @RequestBody AccountRequestDTO requestDTO) {
        log.info("Customer {} requesting new {} account", customerId, requestDTO.getAccountType());
        AccountRequest accountRequest = customerService.createAccountRequest(customerId, requestDTO);
        log.info("Account request created successfully with ID: {}", accountRequest.getId());
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("Account request submitted successfully", accountRequest));
    }

    @GetMapping("/{customerId}/accounts/requests")
    public ResponseEntity<ApiResponse<List<AccountRequest>>> getMyAccountRequests(
            @PathVariable Long customerId) {
        log.info("Fetching account requests for customer: {}", customerId);
        List<AccountRequest> requests = customerService.getMyAccountRequests(customerId);
        return ResponseEntity.ok(ApiResponse.success("Account requests retrieved successfully", requests));
    }

    // ==================== LOAN APPLICATIONS ====================

    @PostMapping("/{customerId}/loans/apply")
    public ResponseEntity<ApiResponse<LoanApplication>> applyForLoan(
            @PathVariable Long customerId,
            @Valid @RequestBody LoanApplicationDTO loanDTO) {
        log.info("Customer {} applying for loan of amount: {}", customerId, loanDTO.getRequestedAmount());
        LoanApplication application = customerService.applyForLoan(customerId, loanDTO);
        log.info("Loan application submitted successfully with ID: {}", application.getId());
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("Loan application submitted successfully", application));
    }

    @GetMapping("/{customerId}/loans")
    public ResponseEntity<ApiResponse<List<LoanApplication>>> getMyLoanApplications(
            @PathVariable Long customerId) {
        log.info("Fetching loan applications for customer: {}", customerId);
        List<LoanApplication> applications = customerService.getMyLoanApplications(customerId);
        return ResponseEntity.ok(ApiResponse.success("Loan applications retrieved successfully", applications));
    }

    @GetMapping("/{customerId}/loans/offers")
    public ResponseEntity<ApiResponse<List<LoanOffers>>> getAvailableLoanOffers(
            @PathVariable Long customerId) {
        log.info("Fetching available loan offers for customer: {}", customerId);
        List<LoanOffers> offers = customerService.getAvailableLoanOffers(customerId);
        return ResponseEntity.ok(ApiResponse.success("Loan offers retrieved successfully", offers));
    }

    // ==================== DEBIT CARD REQUESTS ====================

    @PostMapping("/{customerId}/cards/request")
    public ResponseEntity<ApiResponse<CardRequest>> requestDebitCard(
            @PathVariable Long customerId,
            @Valid @RequestBody CardRequestDTO cardDTO) {
        log.info("Customer {} requesting debit card for account: {}", customerId, cardDTO.getAccountId());
        CardRequest cardRequest = customerService.requestDebitCard(customerId, cardDTO);
        log.info("Card request submitted successfully with ID: {}", cardRequest.getId());
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("Card request submitted successfully", cardRequest));
    }

    @GetMapping("/{customerId}/cards/requests")
    public ResponseEntity<ApiResponse<List<CardRequest>>> getMyCardRequests(
            @PathVariable Long customerId) {
        log.info("Fetching card requests for customer: {}", customerId);
        List<CardRequest> requests = customerService.getMyCardRequests(customerId);
        return ResponseEntity.ok(ApiResponse.success("Card requests retrieved successfully", requests));
    }

    @GetMapping("/{customerId}/cards")
    public ResponseEntity<ApiResponse<List<DebitCard>>> getMyCards(
            @PathVariable Long customerId) {
        log.info("Fetching all cards for customer: {}", customerId);
        List<DebitCard> cards = customerService.getMyCards(customerId);
        return ResponseEntity.ok(ApiResponse.success("Cards retrieved successfully", cards));
    }

    @PutMapping("/{customerId}/cards/{cardId}/block")
    public ResponseEntity<ApiResponse<Void>> blockCard(
            @PathVariable Long customerId,
            @PathVariable Long cardId) {
        log.info("Customer {} blocking card: {}", customerId, cardId);
        customerService.blockCard(customerId, cardId);
        log.info("Card {} blocked successfully", cardId);
        return ResponseEntity.ok(ApiResponse.success("Card blocked successfully", null));
    }

    @PutMapping("/{customerId}/cards/{cardId}/unblock")
    public ResponseEntity<ApiResponse<Void>> unblockCard(
            @PathVariable Long customerId,
            @PathVariable Long cardId,
            @RequestParam String transactionPin) {
        log.info("Customer {} unblocking card: {}", customerId, cardId);
        customerService.unblockCard(customerId, cardId, transactionPin);
        log.info("Card {} unblocked successfully", cardId);
        return ResponseEntity.ok(ApiResponse.success("Card unblocked successfully", null));
    }

    // ==================== CHEQUE BOOK REQUESTS ====================

    @PostMapping("/{customerId}/chequebooks/request")
    public ResponseEntity<ApiResponse<ChequeBookRequest>> requestChequeBook(
            @PathVariable Long customerId,
            @Valid @RequestBody ChequeBookRequestDTO chequeDTO) {
        log.info("Customer {} requesting cheque book for account: {}", customerId, chequeDTO.getAccountId());
        ChequeBookRequest request = customerService.requestChequeBook(customerId, chequeDTO);
        log.info("Cheque book request submitted successfully with ID: {}", request.getId());
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("Cheque book request submitted successfully", request));
    }

    @GetMapping("/{customerId}/chequebooks/requests")
    public ResponseEntity<ApiResponse<List<ChequeBookRequest>>> getMyChequeBookRequests(
            @PathVariable Long customerId) {
        log.info("Fetching cheque book requests for customer: {}", customerId);
        List<ChequeBookRequest> requests = customerService.getMyChequeBookRequests(customerId);
        return ResponseEntity.ok(ApiResponse.success("Cheque book requests retrieved successfully", requests));
    }

    // ==================== ACCOUNT DETAILS & TRANSACTIONS ====================

    @GetMapping("/{customerId}/accounts")
    public ResponseEntity<ApiResponse<List<Account>>> getMyAccounts(
            @PathVariable Long customerId) {
        log.info("Fetching all accounts for customer: {}", customerId);
        List<Account> accounts = customerService.getMyAccounts(customerId);
        return ResponseEntity.ok(ApiResponse.success("Accounts retrieved successfully", accounts));
    }

    @GetMapping("/{customerId}/accounts/{accountId}")
    public ResponseEntity<ApiResponse<Account>> getAccountDetails(
            @PathVariable Long customerId,
            @PathVariable Long accountId) {
        log.info("Fetching account details for customer: {} and account: {}", customerId, accountId);
        Account account = customerService.getAccountDetails(customerId, accountId);
        return ResponseEntity.ok(ApiResponse.success("Account details retrieved successfully", account));
    }

    @GetMapping("/{customerId}/accounts/{accountId}/transactions")
    public ResponseEntity<ApiResponse<List<Transaction>>> getTransactionHistory(
            @PathVariable Long customerId,
            @PathVariable Long accountId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        log.info("Fetching transaction history for customer: {}, account: {} from {} to {}",
                customerId, accountId, startDate, endDate);
        List<Transaction> transactions = customerService.getTransactionHistory(
                customerId, accountId, startDate, endDate);
        return ResponseEntity.ok(ApiResponse.success("Transaction history retrieved successfully", transactions));
    }


    @PutMapping("/{customerId}/pin/update")
    public ResponseEntity<ApiResponse<Void>> updateTransactionPin(
            @PathVariable Long customerId,
            @Valid @RequestBody UpdatePinDTO updatePinDTO) {
        log.info("Customer {} updating transaction PIN", customerId);
        customerService.updateTransactionPin(customerId, updatePinDTO.getOldPin(), updatePinDTO.getNewPin());
        log.info("Transaction PIN updated successfully for customer: {}", customerId);
        return ResponseEntity.ok(ApiResponse.success("Transaction PIN updated successfully", null));
    }
}