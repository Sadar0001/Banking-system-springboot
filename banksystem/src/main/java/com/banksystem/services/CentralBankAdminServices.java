package com.banksystem.services;


import com.banksystem.dto.ApiResponse;
import com.banksystem.dto.HeadBankDTO;
import com.banksystem.entity.CentralBank;
import com.banksystem.entity.HeadBank;
import com.banksystem.exception.BusinessRuleException;
import com.banksystem.exception.ResourceNotFoundException;
import com.banksystem.repository.BranchRepository;
import com.banksystem.repository.CentralBankRepository;
import com.banksystem.repository.HeadBankRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;

import java.time.LocalDateTime;
import java.util.List;


@Service
public class CentralBankAdminServices {

    private final HeadBankRepository headBankRepository;
    private final CentralBankRepository centralBankRepository;
    private final BranchRepository branchRepository;

    public CentralBankAdminServices(HeadBankRepository headBankRepository, CentralBankRepository centralBankRepository, BranchRepository branchRepository) {
        this.headBankRepository = headBankRepository;
        this.centralBankRepository = centralBankRepository;
        this.branchRepository = branchRepository;
    }

    public HeadBank addHeadBank( HeadBankDTO headBankDTO){

        CentralBank centralBank = centralBankRepository.findById(headBankDTO.getCentralBankId())
                .orElseThrow(() -> new ResourceNotFoundException("CentralBank", "id", headBankDTO.getCentralBankId()));


        // check if this head bank already exist
        if(headBankRepository.findByName(headBankDTO.getName()).isPresent()){
            throw new BusinessRuleException("Head Bank already exists"+headBankDTO.getName());
        }
        // create head bank , bidirection relation, save it and return
        HeadBank newHeadBank=new HeadBank();
        newHeadBank.setName(headBankDTO.getName());
        newHeadBank.setCode(headBankDTO.getCode());
        newHeadBank.setRoutingNumber(headBankDTO.getRoutingNumber());
        newHeadBank.setAddress(headBankDTO.getAddress());
        newHeadBank.setContactPhone(headBankDTO.getContactNumber());
        newHeadBank.setContactEmail(headBankDTO.getEmail());
        newHeadBank.setIsActive(true);
        newHeadBank.setCreatedAt(LocalDateTime.now());

        // bidirectional
        newHeadBank.setCentralBank(centralBank);
        centralBank.getHeadBanks().add(newHeadBank);
        HeadBank headBank_saved=headBankRepository.save(newHeadBank);

        return headBank_saved;

    }


    //deactivate  head bank
    @Transactional
    public void  deActivateHeadBank(Long bankId){

        //check if bank exist
        // check if any brach is active
        // deactivate the bank and save
        HeadBank headBank=headBankRepository.findById(bankId).orElseThrow(() -> new ResourceNotFoundException("HeadBank", "id", bankId));
        if(headBank.getIsActive()==false){
            throw new BusinessRuleException("Head Bank is already not active");
        }

        if(!branchRepository.findByHeadBank(headBank).isEmpty()){
            throw new BusinessRuleException("There are active branch of this bank ,first need to deactivate them "+headBank.getName());
        }

        headBank.setIsActive(false);
        headBankRepository.save(headBank);

    }

    public List<HeadBank> getAllBanks() {
        List<HeadBank> headBanks=headBankRepository.findAll();
        return headBanks;
    }
}
