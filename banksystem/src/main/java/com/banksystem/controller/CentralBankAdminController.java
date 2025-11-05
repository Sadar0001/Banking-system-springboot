package com.banksystem.controller;

import com.banksystem.dto.ApiResponse;
import com.banksystem.dto.HeadBankDTO;
import com.banksystem.entity.ChargesBook;
import com.banksystem.entity.HeadBank;
import com.banksystem.enums.BankType;
import com.banksystem.exception.ResourceNotFoundException;
import com.banksystem.repository.CentralBankRepository;
import com.banksystem.repository.HeadBankRepository;
import com.banksystem.services.CentralBankAdminServices;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/central-bank")
@Slf4j
public class CentralBankAdminController {

    private final CentralBankRepository centralBankRepository;
    private final CentralBankAdminServices centralBankAdminServices;
    private final HeadBankRepository headBankRepository;

    public CentralBankAdminController(CentralBankRepository centralBankRepository, CentralBankAdminServices centralBankAdminServices, HeadBankRepository headBankRepository) {
        this.centralBankRepository = centralBankRepository;
        this.centralBankAdminServices = centralBankAdminServices;
        this.headBankRepository = headBankRepository;
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


    // get all banks earning or centralbank earning
}
