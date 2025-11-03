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
    public ResponseEntity<ApiResponse<List<HeadBank>>> getHeadBanks(){
        List<HeadBank> headBanks=centralBankAdminServices.getAllBanks();
        return ResponseEntity.ok(ApiResponse.success("Head banks successfully",headBanks));

    }

///***********************************************************************
// ChargesBook
// ******************************************/
//
//    // add chageesbook
//    @PostMapping("chargesBook/add")
//    public ResponseEntity<ApiResponse<ChargesBook>> addCharges(@RequestBody ChargesBook chargesBook){
//        ChargesBook chargesBook1=centralBankAdminServices.addCharge(chargesBook);
//        return ResponseEntity.status(HttpStatus.CREATED)
//                .body(ApiResponse.success("charge successfully" , chargesBook1));
//    }
//
//    // Get all active charges by bank ID and bank type
//    @GetMapping("chargesBook/bank/{bankId}/type/{bankType}")
//    public ResponseEntity<ApiResponse<List<ChargesBook>>> getChargesByBankId(@PathVariable Long bankId,@PathVariable BankType bankType) {
//        List<ChargesBook> charges = centralBankAdminServices.getChargesByBankId(bankId,bankType);
//        return ResponseEntity.ok(ApiResponse.success("Charges retrieved successfully", charges));
//    }
//
//    // Get all charges (active + inactive) by bank ID
//    @GetMapping("chargesBook/bank/{bankId}/type/{bankType}/all")
//    public ResponseEntity<ApiResponse<List<ChargesBook>>> getAllChargesByBankId(@PathVariable Long bankId,@PathVariable BankType bankType) {
//        List<ChargesBook> charges = centralBankAdminServices.getAllChargesByBankId(bankId,bankType);
//        return ResponseEntity.ok(ApiResponse.success("All charges retrieved successfully", charges));
//    }
//
//    // Update charges
//    @PutMapping("chargesBook/update/{id}")
//    public ResponseEntity<ApiResponse<ChargesBook>> updateCharges(
//            @PathVariable Long id,
//            @RequestBody ChargesBook chargesBook) {
//        ChargesBook updatedCharges = centralBankAdminServices.updateCharge(id, chargesBook);
//        return ResponseEntity.ok(ApiResponse.success("Charge updated successfully", updatedCharges));
//    }
//
//    // Delete (soft delete - make inactive)
//    @DeleteMapping("chargesBook/delete/{id}")
//    public ResponseEntity<ApiResponse<String>> deleteCharges(@PathVariable Long id) {
//        centralBankAdminServices.deleteCharge(id);
//        return ResponseEntity.ok(ApiResponse.success("Charge deleted successfully", null));
//    }
//
//    // Get specific charge by ID
//    @GetMapping("chargesBook/{id}")
//    public ResponseEntity<ApiResponse<ChargesBook>> getChargeById(@PathVariable Long id) {
//        ChargesBook charge = centralBankAdminServices.getChargeById(id);
//        return ResponseEntity.ok(ApiResponse.success("Charge retrieved successfully", charge));
//    }
//
//
//
///***********************************************************************
// ******************************************/


    // services for central bank customers
    // services for system managemnt
    // dashboard
    // get all banks earning or centralbank earning
}
