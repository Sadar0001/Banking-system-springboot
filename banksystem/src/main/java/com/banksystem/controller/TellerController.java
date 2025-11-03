package com.banksystem.controller;


import com.banksystem.dto.ApiResponse;
import com.banksystem.entity.Transaction;
import com.banksystem.services.TellerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;

@RestController
@RequestMapping("/api/teller")
@Slf4j
public class TellerController {
    private final TellerService tellerService;

    public TellerController(TellerService tellerService) {
        this.tellerService = tellerService;
    }

//    // deposit cash to cusotmer account
//    @PostMapping("/transactions/deposit")
//    public ResponseEntity<ApiResponse<Transaction>> depositCash(@RequestParam Long accountId, @RequestParam BigDecimal amount) {
//        log.info("Received request to deposit {} to account ID: {}", amount, accountId);
//        Transaction transaction = tellerService.depositCash(accountId, amount);
//        log.info("Sucessfully deposited {} to account ID: {}", amount, accountId);
//        return ResponseEntity.ok(ApiResponse.success("Cash deposited successfully", transaction));
//    }
//    // withdraw cash from branch cusotmer account
    // get pending req for new account of customer
    // approve account after verification
    // reject  new account  request for cusotmer
    // update cusotmer details
    // get prendiring req for debit card
    // approce debit card req
    // denied debit card req
    // get all chique req
    // approve cheque req
    // deny chqeue req

}
