package com.banksystem.controller;

import com.banksystem.dto.ApiResponse;
import com.banksystem.dto.HeadBankDTO;
import com.banksystem.entity.HeadBank;
import com.banksystem.enums.BankType;
import com.banksystem.repository.CentralBankRepository;
import com.banksystem.repository.HeadBankRepository;
import com.banksystem.services.CentralBankAdminServices;
import com.banksystem.services.ChargesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/central-bank")
@Slf4j
public class CentralBankAdminController {

    private final CentralBankRepository centralBankRepository;
    private final CentralBankAdminServices centralBankAdminServices;
    private final HeadBankRepository headBankRepository;
    private final ChargesService chargesService;

    public CentralBankAdminController(CentralBankRepository centralBankRepository, CentralBankAdminServices centralBankAdminServices, HeadBankRepository headBankRepository, ChargesService chargesService) {
        this.centralBankRepository = centralBankRepository;
        this.centralBankAdminServices = centralBankAdminServices;
        this.headBankRepository = headBankRepository;
        this.chargesService = chargesService;
    }

    // services for head bank
    // add head bank
    @PostMapping("/add/head-bank")
    public ResponseEntity<ApiResponse<HeadBank>> addHeadBank(@RequestBody HeadBankDTO headBankDTO){

        log.info("adding head bank with name : {}",headBankDTO.getName());
       HeadBank saved_headBank=centralBankAdminServices.addHeadBank(headBankDTO);
       log.info("successfully added head bank with name {}:",saved_headBank.getName());
       return ResponseEntity.status(HttpStatus.CREATED)
               .body(ApiResponse.success("Head bank Successfully created",saved_headBank));
    }

    @DeleteMapping("/deactive/{headBankId}")
    public ResponseEntity<ApiResponse<String>> deleteHeadBank(@PathVariable("headBankId") Long headBankId){
        log.info("deleting head bank with id {}",headBankId);
        centralBankAdminServices.deActivateHeadBank(headBankId);
        log.info("deleted sucessfully  head bank with id {}",headBankId);
        return ResponseEntity.ok().body(ApiResponse.success("Seccuesfully deactiviated the headbank","deactviated account"));
    }

    // get all head bank and its bracnhes details
    @GetMapping("/headBanks")
    public ResponseEntity<ApiResponse<List<HeadBank>>> getHeadBanks() {
        List<HeadBank> headBanks = centralBankAdminServices.getAllBanks();
        return ResponseEntity.ok(ApiResponse.success("Head banks successfully", headBanks));

    }

    // ==================== CHARGES ENDPOINTS ====================

    /**
     * Get charges by date range for Central Bank
     * Example: /api/central-bank/charges/date-range?centralBankId=1&startDate=2024-01-01T00:00:00&endDate=2024-12-31T23:59:59
     */
    @GetMapping("/charges/date-range")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getCentralBankChargesByDateRange(
            @RequestParam Long centralBankId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime endDate) {

        log.info("Fetching Central Bank charges for ID: {}, date range: {} to {}", centralBankId, startDate, endDate);
        Map<String, Object> charges = chargesService.getChargesByDateRange(
                centralBankId, BankType.CENTRAL_BANK, startDate, endDate);
        log.info("Successfully retrieved charges for Central Bank ID: {}", centralBankId);
        return ResponseEntity.ok(ApiResponse.success("Charges retrieved successfully", charges));
    }

    /**
     * Get last month charges for Central Bank
     * Example: /api/central-bank/charges/last-month?centralBankId=1
     */
    @GetMapping("/charges/last-month")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getCentralBankChargesLastMonth(
            @RequestParam Long centralBankId) {

        log.info("Fetching Central Bank charges for last month, ID: {}", centralBankId);
        Map<String, Object> charges = chargesService.getChargesLastMonth(
                centralBankId, BankType.CENTRAL_BANK);
        log.info("Successfully retrieved last month charges for Central Bank ID: {}", centralBankId);
        return ResponseEntity.ok(ApiResponse.success("Last month charges retrieved successfully", charges));
    }

    /**
     * Get last year charges for Central Bank (grouped by month)
     * Example: /api/central-bank/charges/last-year?centralBankId=1
     */
    @GetMapping("/charges/last-year")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getCentralBankChargesLastYear(
            @RequestParam Long centralBankId) {

        log.info("Fetching Central Bank charges for last year, ID: {}", centralBankId);
        Map<String, Object> charges = chargesService.getChargesLastYear(
                centralBankId, BankType.CENTRAL_BANK);
        log.info("Successfully retrieved last year charges for Central Bank ID: {}", centralBankId);
        return ResponseEntity.ok(ApiResponse.success("Last year charges retrieved successfully", charges));
    }

    /**
     * Get charges detail for a specific transaction
     * Example: /api/central-bank/charges/transaction/123
     */
    @GetMapping("/charges/transaction/{transactionId}")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getTransactionChargesDetail(
            @PathVariable Long transactionId) {

        log.info("Fetching charge details for transaction ID: {}", transactionId);
        Map<String, Object> charges = chargesService.getTransactionChargesDetail(transactionId);
        log.info("Successfully retrieved charge details for transaction ID: {}", transactionId);
        return ResponseEntity.ok(ApiResponse.success("Transaction charges retrieved successfully", charges));
    }



    @GetMapping("/transactions/date-range")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getAllTransactionsWithChargesByDateRange(
            @RequestParam Long centralBankId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime endDate) {

        log.info("Fetching all transactions with charges for Central Bank ID: {}, date range: {} to {}",
                centralBankId, startDate, endDate);
        Map<String, Object> transactions = chargesService.getAllTransactionsWithChargesByDateRange(
                centralBankId, BankType.CENTRAL_BANK, startDate, endDate);
        log.info("Successfully retrieved transactions with charges for Central Bank ID: {}", centralBankId);
        return ResponseEntity.ok(ApiResponse.success("Transactions with charges retrieved successfully", transactions));
    }

}
