package com.banksystem.controller;

import com.banksystem.dto.*;
import com.banksystem.entity.Branch;
import com.banksystem.entity.BranchManager;
import com.banksystem.entity.LoanOffers;
import com.banksystem.services.HeadBankAdminSerivice;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/api/headBank")
@Slf4j
public class HeadBankAdminController {
    private final HeadBankAdminSerivice headBankAdminSerivice;

    public HeadBankAdminController(HeadBankAdminSerivice headBankAdminSerivice) {
        this.headBankAdminSerivice = headBankAdminSerivice;
    }
    // ad branch

    @PostMapping("add_branch")
    public ResponseEntity<ApiResponse<Branch>> addBranch(@RequestBody BranchDTO branchDTO){
        log.info("Adding branch to head Bank {}:",branchDTO.getBranchCode());
        Branch branch=headBankAdminSerivice.addBranch(branchDTO);
        log.info("successfully created branch {}:",branch.getBranchCode());
        return ResponseEntity.status(HttpStatus.NO_CONTENT)
                .body(ApiResponse.success("Branch deactivated successfully",null));
    }

    //deactivate  branch
    @DeleteMapping("deactivate_branch/{branchId}")
    public ResponseEntity<ApiResponse<Branch>> deactivateBranch(@RequestParam long  branchId){
        log.info("Deactivating branch {}:",branchId);
        headBankAdminSerivice.deactivateBranch(branchId);
        log.info("successfully deactivated branch {}:",branchId);
        return ResponseEntity.ok(ApiResponse.success("Branch deactivated successfully",null));
    }
    // add branch manager
    @PostMapping("/add-branch_manager")
    public ResponseEntity<ApiResponse<BranchManager>> addBranchManager(@Valid @RequestBody BranchManagerDTO branchManagerDTO){
        log.info("adding branch manager to branch : {}",branchManagerDTO.getFirstName()+" "+branchManagerDTO.getLastName());
        BranchManager branchManager=headBankAdminSerivice.addBranchManager(branchManagerDTO);
        log.info("succesfully added branch manager {}",branchManager.getFullName());
        return  ResponseEntity.status(HttpStatus.CREATED).body(ApiResponse.success("Branch manager deactivated successfully",null));
    }

    //create loan offers
    @PostMapping("create-loan-offers")
    public  ResponseEntity<ApiResponse<LoanOffers>> addLoanOffers(@RequestBody LoanOfferDTO loanOfferDTO){
        log.info("adding new loan offer {}",loanOfferDTO.getName());
        headBankAdminSerivice.addLoanOffer(loanOfferDTO);
        log.info("successfully added loan offers {}",loanOfferDTO.getName());
        return  ResponseEntity.status(HttpStatus.CREATED).body(ApiResponse.success("Added enw loan offer successfully",null));

    }
    // update loan offers

    @PutMapping("/loan-offers/{id}")
    public ResponseEntity<ApiResponse<LoanOffers>> updateLoanOffer(@PathVariable Long id, @Valid @RequestBody LoanOfferDTO offerDTO) {
        log.info("Received request to update loan offer with ID: {}", id);
        LoanOffers updatedOffer = headBankAdminSerivice.updateLoanOffer(id, offerDTO);
        log.info("Successfully updated loan offer with ID: {}", id);
        return ResponseEntity.ok(ApiResponse.success("Loan offer updated successfully", updatedOffer));
    }

    //headbank eanrign get
    @GetMapping("/headBank-earning")
    public ResponseEntity<ApiResponse<Long>> getHeadBankEarnings(@RequestParam Long headBankId) {
        log.info("Received request to get head bank earnings for ID: {}", headBankId);
        Long earnings=headBankAdminSerivice.getHeadBankEarning(headBankId);
        return ResponseEntity.status(HttpStatus.ACCEPTED).body(ApiResponse.success("Head bank earnings retrieved successfully", earnings));
    }

    // get branch earing
    @GetMapping("/bank-earning")
    public ResponseEntity<ApiResponse<Long>> getBankEarnings(@RequestParam Long bankId) {
        log.info("Received request to get  bank earnings for ID: {}", bankId);
        Long earnings=headBankAdminSerivice.getBankEarning(bankId);
        return ResponseEntity.status(HttpStatus.ACCEPTED).body(ApiResponse.success(" bank earnings retrieved successfully", earnings));
    }

    // set debit card rules implemented later on
//    @PostMapping("/card-rules")
//    public ResponseEntity<ApiResponse<DebitCardRules>> setDebitCardRules(@Valid @RequestBody DebitCardRulesDTO rulesDTO) {
//        log.info("Received request to set debit card rules for card type: {}", rulesDTO.getCardType());
//        DebitCardRules rules = headBankAdminSerivice.createDebitCardRules(rulesDTO);
//        return ResponseEntity.status(HttpStatus.CREATED)
//                .body(ApiResponse.success("Debit card rules set successfully", rules));
//    }

    // get branch performacne matrices


}
