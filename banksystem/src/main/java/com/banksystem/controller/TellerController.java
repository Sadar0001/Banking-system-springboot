package com.banksystem.controller;

import com.banksystem.dto.ApiResponse;
import com.banksystem.dto.PendingSummaryDTO;
import com.banksystem.dto.RejectionDTO;
import com.banksystem.entity.*;
import com.banksystem.services.TellerService;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/teller")
@Slf4j
public class TellerController {

    private final TellerService tellerService;

    public TellerController(TellerService tellerService) {
        this.tellerService = tellerService;
    }

    // ==================== ACCOUNT REQUESTS ====================

    @GetMapping("/{tellerId}/accounts/requests/pending")
    public ResponseEntity<ApiResponse<List<AccountRequest>>> getPendingAccountRequests(
            @PathVariable Long tellerId) {
        log.info("Teller {} fetching pending account requests", tellerId);
        List<AccountRequest> requests = tellerService.getPendingAccountRequests(tellerId);
        log.info("Found {} pending account requests", requests.size());
        return ResponseEntity.ok(ApiResponse.success("Pending account requests retrieved successfully", requests));
    }

    @PostMapping("/{tellerId}/accounts/requests/{requestId}/approve")
    public ResponseEntity<ApiResponse<Account>> approveAccountRequest(
            @PathVariable Long tellerId,
            @PathVariable Long requestId) {
        log.info("Teller {} approving account request: {}", tellerId, requestId);
        Account account = tellerService.approveAccountRequest(tellerId, requestId);
        log.info("Account request {} approved successfully. New account number: {}", requestId, account.getAccountNumber());
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("Account request approved successfully", account));
    }

    @PostMapping("/{tellerId}/accounts/requests/{requestId}/reject")
    public ResponseEntity<ApiResponse<Void>> rejectAccountRequest(
            @PathVariable Long tellerId,
            @PathVariable Long requestId,
            @Valid @RequestBody RejectionDTO rejectionDTO) {
        log.info("Teller {} rejecting account request: {}", tellerId, requestId);
        tellerService.rejectAccountRequest(tellerId, requestId, rejectionDTO.getReason());
        log.info("Account request {} rejected successfully", requestId);
        return ResponseEntity.ok(ApiResponse.success("Account request rejected successfully", null));
    }

    // ==================== DEBIT CARD REQUESTS ====================

    @GetMapping("/{tellerId}/cards/requests/pending")
    public ResponseEntity<ApiResponse<List<CardRequest>>> getPendingCardRequests(
            @PathVariable Long tellerId) {
        log.info("Teller {} fetching pending card requests", tellerId);
        List<CardRequest> requests = tellerService.getPendingCardRequests(tellerId);
        log.info("Found {} pending card requests", requests.size());
        return ResponseEntity.ok(ApiResponse.success("Pending card requests retrieved successfully", requests));
    }

    @PostMapping("/{tellerId}/cards/requests/{requestId}/approve")
    public ResponseEntity<ApiResponse<DebitCard>> approveCardRequest(
            @PathVariable Long tellerId,
            @PathVariable Long requestId) {
        log.info("Teller {} approving card request: {}", tellerId, requestId);
        DebitCard debitCard = tellerService.approveCardRequest(tellerId, requestId);
        log.info("Card request {} approved successfully. Card number: {}", requestId, debitCard.getCardNumber());
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("Card request approved and card issued successfully", debitCard));
    }

    @PostMapping("/{tellerId}/cards/requests/{requestId}/reject")
    public ResponseEntity<ApiResponse<Void>> rejectCardRequest(
            @PathVariable Long tellerId,
            @PathVariable Long requestId,
            @Valid @RequestBody RejectionDTO rejectionDTO) {
        log.info("Teller {} rejecting card request: {}", tellerId, requestId);
        tellerService.rejectCardRequest(tellerId, requestId, rejectionDTO.getReason());
        log.info("Card request {} rejected successfully", requestId);
        return ResponseEntity.ok(ApiResponse.success("Card request rejected successfully", null));
    }

    // ==================== CHEQUE BOOK REQUESTS ====================

    @GetMapping("/{tellerId}/chequebooks/requests/pending")
    public ResponseEntity<ApiResponse<List<ChequeBookRequest>>> getPendingChequeBookRequests(
            @PathVariable Long tellerId) {
        log.info("Teller {} fetching pending cheque book requests", tellerId);
        List<ChequeBookRequest> requests = tellerService.getPendingChequeBookRequests(tellerId);
        log.info("Found {} pending cheque book requests", requests.size());
        return ResponseEntity.ok(ApiResponse.success("Pending cheque book requests retrieved successfully", requests));
    }

    @PostMapping("/{tellerId}/chequebooks/requests/{requestId}/approve")
    public ResponseEntity<ApiResponse<ChequeBook>> approveChequeBookRequest(
            @PathVariable Long tellerId,
            @PathVariable Long requestId) {
        log.info("Teller {} approving cheque book request: {}", tellerId, requestId);
        ChequeBook chequeBook = tellerService.approveChequeBookRequest(tellerId, requestId);
        log.info("Cheque book request {} approved successfully. Cheque book number: {}",
                requestId, chequeBook.getChequeBookNumber());
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("Cheque book request approved and issued successfully", chequeBook));
    }

    @PostMapping("/{tellerId}/chequebooks/requests/{requestId}/reject")
    public ResponseEntity<ApiResponse<Void>> rejectChequeBookRequest(
            @PathVariable Long tellerId,
            @PathVariable Long requestId,
            @Valid @RequestBody RejectionDTO rejectionDTO) {
        log.info("Teller {} rejecting cheque book request: {}", tellerId, requestId);
        tellerService.rejectChequeBookRequest(tellerId, requestId, rejectionDTO.getReason());
        log.info("Cheque book request {} rejected successfully", requestId);
        return ResponseEntity.ok(ApiResponse.success("Cheque book request rejected successfully", null));
    }


    @GetMapping("/{tellerId}/customers")
    public ResponseEntity<ApiResponse<List<Customer>>> getBranchCustomers(
            @PathVariable Long tellerId) {
        log.info("Teller {} fetching branch customers", tellerId);
        List<Customer> customers = tellerService.getBranchCustomers(tellerId);
        log.info("Found {} customers in the branch", customers.size());
        return ResponseEntity.ok(ApiResponse.success("Branch customers retrieved successfully", customers));
    }

    @PutMapping("/{tellerId}/customers/{customerId}")
    public ResponseEntity<ApiResponse<Customer>> updateCustomerDetails(
            @PathVariable Long tellerId,
            @PathVariable Long customerId,
            @RequestBody Customer updatedDetails) {
        log.info("Teller {} updating details for customer: {}", tellerId, customerId);
        Customer customer = tellerService.updateCustomerDetails(tellerId, customerId, updatedDetails);
        log.info("Customer {} details updated successfully", customerId);
        return ResponseEntity.ok(ApiResponse.success("Customer details updated successfully", customer));
    }

    // ==================== ACCOUNT VALIDATION ====================

    @GetMapping("/{tellerId}/accounts/{accountId}/validate")
    public ResponseEntity<ApiResponse<Boolean>> validateAccountForTransaction(
            @PathVariable Long tellerId,
            @PathVariable Long accountId) {
        log.info("Teller {} validating account: {} for transaction", tellerId, accountId);
        Account account = new Account();
        account.setId(accountId);
        boolean isValid = tellerService.validateAccountForTransaction(account);
        log.info("Account {} validation result: {}", accountId, isValid);
        return ResponseEntity.ok(ApiResponse.success(
                isValid ? "Account is active and valid" : "Account is not active",
                isValid));
    }

    // ==================== DASHBOARD & SUMMARY ====================

    @GetMapping("/{tellerId}/dashboard/summary")
    public ResponseEntity<ApiResponse<PendingSummaryDTO>> getPendingRequestsSummary(
            @PathVariable Long tellerId) {
        log.info("Teller {} fetching pending requests summary", tellerId);

        List<AccountRequest> accountRequests = tellerService.getPendingAccountRequests(tellerId);
        List<CardRequest> cardRequests = tellerService.getPendingCardRequests(tellerId);
        List<ChequeBookRequest> chequeBookRequests = tellerService.getPendingChequeBookRequests(tellerId);

        PendingSummaryDTO summary = new PendingSummaryDTO(
                accountRequests.size(),
                cardRequests.size(),
                chequeBookRequests.size()
        );

        log.info("Summary: {} account requests, {} card requests, {} cheque book requests",
                summary.getPendingAccountRequests(),
                summary.getPendingCardRequests(),
                summary.getPendingChequeBookRequests());

        return ResponseEntity.ok(ApiResponse.success("Pending requests summary retrieved successfully", summary));
    }

}