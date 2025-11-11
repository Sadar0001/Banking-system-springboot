package com.banksystem.controller;

import com.banksystem.dto.ApiResponse;
import com.banksystem.entity.ChargesBook;
import com.banksystem.enums.BankType;
import com.banksystem.services.ChargesBookService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/chargesBook")
public class ChargesBookController {


    private final ChargesBookService chargesBookService;
    public ChargesBookController(ChargesBookService chargesBookService) {
        this.chargesBookService = chargesBookService;
    }

    // add chageesbook
    @PostMapping("chargesBook/add")
    public ResponseEntity<ApiResponse<ChargesBook>> addCharges(@RequestBody ChargesBook chargesBook){
        ChargesBook chargesBook1=chargesBookService.addCharge(chargesBook);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success("charge successfully" , chargesBook1));
    }

    // Get all active charges by bank ID and bank type
    @GetMapping("chargesBook/bank/{bankId}/type/{bankType}")
    public ResponseEntity<ApiResponse<List<ChargesBook>>> getChargesByBankId(@PathVariable Long bankId, @PathVariable BankType bankType) {
        List<ChargesBook> charges = chargesBookService.getChargesByBankId(bankId,bankType);
        return ResponseEntity.ok(ApiResponse.success("Charges retrieved successfully", charges));
    }

    // Get all charges (active + inactive) by bank ID
    @GetMapping("chargesBook/bank/{bankId}/type/{bankType}/all")
    public ResponseEntity<ApiResponse<List<ChargesBook>>> getAllChargesByBankId(@PathVariable Long bankId,@PathVariable BankType bankType) {
        List<ChargesBook> charges = chargesBookService.getAllChargesByBankId(bankId,bankType);
        return ResponseEntity.ok(ApiResponse.success("All charges retrieved successfully", charges));
    }

    // Update charges
    @PutMapping("chargesBook/update/{id}")
    public ResponseEntity<ApiResponse<ChargesBook>> updateCharges(
            @PathVariable Long id,
            @RequestBody ChargesBook chargesBook) {
        ChargesBook updatedCharges = chargesBookService.updateCharge(id, chargesBook);
        return ResponseEntity.ok(ApiResponse.success("Charge updated successfully", updatedCharges));
    }

    // Delete (soft delete - make inactive)
    @DeleteMapping("chargesBook/delete/{id}")
    public ResponseEntity<ApiResponse<String>> deleteCharges(@PathVariable Long id) {
        chargesBookService.deleteCharge(id);
        return ResponseEntity.ok(ApiResponse.success("Charge deleted successfully", null));
    }


    @GetMapping("chargesBook/{id}")
    public ResponseEntity<ApiResponse<ChargesBook>> getChargeById(@PathVariable Long id) {
        ChargesBook charge = chargesBookService.getChargeById(id);
        return ResponseEntity.ok(ApiResponse.success("Charge retrieved successfully", charge));
    }
}
