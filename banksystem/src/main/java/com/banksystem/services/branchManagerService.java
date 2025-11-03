package com.banksystem.services;


import com.banksystem.dto.TellerDTO;
import com.banksystem.entity.Branch;
import com.banksystem.entity.ChargesBook;
import com.banksystem.entity.LoanApplication;
import com.banksystem.entity.Teller;
import com.banksystem.enums.BankType;
import com.banksystem.exception.BusinessRuleException;
import com.banksystem.repository.BranchRepository;
import com.banksystem.repository.ChargesBookRepository;
import com.banksystem.repository.LoanApplicationRepository;
import com.banksystem.repository.TellerRepository;
import jakarta.validation.Valid;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class branchManagerService {

    private final BranchRepository branchRepository;
    private final TellerRepository tellerRepository;
    private final LoanApplicationRepository loanApplicationRepository;
    private final ChargesBookRepository chargesBookRepository;

    public branchManagerService(BranchRepository branchRepository, TellerRepository tellerRepository, LoanApplicationRepository loanApplicationRepository, ChargesBookRepository chargesBookRepository) {
        this.branchRepository = branchRepository;
        this.tellerRepository = tellerRepository;
        this.loanApplicationRepository = loanApplicationRepository;
        this.chargesBookRepository = chargesBookRepository;
    }

    @Transactional
    public  Teller addTeller(@Valid TellerDTO tellerDTO) {
        // branch-exist add birectional return
        Branch branch =branchRepository.findById(tellerDTO.getBranchId()).orElseThrow(()-> new BusinessRuleException("Branch not found with id "+tellerDTO.getBranchId()));
        Teller teller = new Teller();
        teller.setFullName(tellerDTO.getFirstName()+tellerDTO.getLastName());
        teller.setUsername(tellerDTO.getUsername());
        teller.setEmail(tellerDTO.getEmail());
        teller.setIsActive(true);
        teller.setCreatedAt(LocalDateTime.now());
        teller.setPasswordHash(tellerDTO.getPassword());

        branch.getTellers().add(teller);
        teller.setBranch(branch);
        Teller savedTeller = tellerRepository.save(teller);

        return savedTeller;
    }


    public  void deactivateTeller(Long tellerId) {
        Teller teller = tellerRepository.findById(tellerId).orElseThrow(() -> new BusinessRuleException("Teller id"+ tellerId));
        teller.setIsActive(false);
        tellerRepository.save(teller);
    }


    public  List<Teller> getTellersByBranch(Long branchId) {
        if (!branchRepository.existsById(branchId)) {
            throw new BusinessRuleException("Branch id "+ branchId);
        }

        return tellerRepository.findByBranchIdAndIsActive(branchId, true);
    }


}
