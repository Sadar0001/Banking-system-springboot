package com.banksystem.controller;


import com.banksystem.dto.ApiResponse;
import com.banksystem.dto.TellerDTO;
import com.banksystem.entity.LoanApplication;
import com.banksystem.entity.Teller;
import com.banksystem.services.branchManagerService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/branch-manager")
@Slf4j
public class BranchManagerController {
    @Autowired
    private branchManagerService branchManagerService;

    BranchManagerController(branchManagerService branchManagerService) {
        this.branchManagerService = branchManagerService;
    }

    // add teller
    @PostMapping("/tellers")
    public ResponseEntity<ApiResponse<Teller>> addTeller(@Valid @RequestBody TellerDTO tellerDTO) {
        log.info("Received request to add new teller: {}", tellerDTO.getUsername());
        Teller teller =branchManagerService.addTeller(tellerDTO);
        log.info("succesfully  added new teller: {}", tellerDTO.getUsername());
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("Teller created successfully", teller));
    }
    // deactivate teller
    @DeleteMapping("/tellers/{id}")
    public ResponseEntity<ApiResponse<Void>> deactivateTeller(@PathVariable Long id) {
        log.info("Received request to deactivate teller with ID: {}", id);
        branchManagerService.deactivateTeller(id);
        log.info("Succesfully deactviated teller with ID: {}", id);
        return ResponseEntity.status(HttpStatus.NO_CONTENT)
                .body(ApiResponse.success("Teller deactivated successfully", null));
    }

    // get teller
    @GetMapping("/tellers/{branchId}")
    public ResponseEntity<ApiResponse<List<Teller>>> getTellersByBranch(@PathVariable Long branchId) {
        log.info("Received request to get tellers for branch ID: {}", branchId);
        List<Teller> tellers = branchManagerService.getTellersByBranch(branchId);
        log.info("Successfully got all tellers for branch ID: {}", branchId);
        return ResponseEntity.ok(ApiResponse.success("Tellers retrieved successfully", tellers));
    }

    // get pending loan applcaition

    // approvw loan application
    // reject loan application
    // freezeaccount
    // unfreezeaccount
    // closeaccount
    // get branch earning
    // get branch loan statistics
    // get transaction statistics
    // get all customer of branch and details
    // get all branch account
}
