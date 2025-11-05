package com.banksystem.services;


import com.banksystem.dto.BranchDTO;
import com.banksystem.dto.BranchManagerDTO;
import com.banksystem.dto.DebitCardRulesDTO;
import com.banksystem.dto.LoanOfferDTO;
import com.banksystem.entity.*;
import com.banksystem.exception.BusinessRuleException;
import com.banksystem.repository.BranchRepository;
import com.banksystem.repository.HeadBankRepository;
import com.banksystem.repository.LoanOffersRepository;
import com.banksystem.repository.branchManagerRepository;
import jakarta.validation.Valid;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Service
public class HeadBankAdminSerivice {

    private final BranchRepository branchRepository;
    private final HeadBankRepository headBankRepository;
    private final branchManagerRepository branchManagerRepository;
    private final LoanOffersRepository loanOffersRepository;

    public HeadBankAdminSerivice(BranchRepository branchRepository, HeadBankRepository headBankRepository, branchManagerRepository branchManagerRepository, LoanOffersRepository loanOffersRepository) {
        this.branchRepository = branchRepository;
        this.headBankRepository = headBankRepository;
        this.branchManagerRepository = branchManagerRepository;
        this.loanOffersRepository = loanOffersRepository;
    }

    @Transactional
    public Branch addBranch(BranchDTO branchDTO){
        // if head bank exist
        // if branch already exist
        // biredcitinal add, save ,return
        Branch old_branch=branchRepository.findByBranchCode(branchDTO.getBranchCode());
        if(old_branch!=null){
            throw new BusinessRuleException("Branch already exists"+branchDTO.getBranchCode());
        }

        Branch branch = new Branch();
        branch.setName(branchDTO.getName());
        branch.setBranchCode(branchDTO.getBranchCode());
        branch.setIfscCode(branchDTO.getIfscCode());
        branch.setAddress(branchDTO.getAddress());
        branch.setContactPhone(branchDTO.getContactNumber());
        branch.setContactEmail(branchDTO.getEmail());
        branch.setIsActive(true);
        branch.setCreatedAt(LocalDateTime.now());

        HeadBank headBank =headBankRepository.getById(branchDTO.getHeadBankId());
        branch.setHeadBank(headBank);
        headBank.getBranches().add(branch);
        branchRepository.save(branch);

        return branch;

    }

    @Transactional
    public void deactivateBranch(long branchId) {
        // find deactivate bidirection save
       Branch branch=branchRepository.findById(branchId).orElseThrow(()-> new BusinessRuleException("branch not found with id "+branchId));
       branch.setIsActive(false);
       HeadBank headBank=headBankRepository.getById(branch.getHeadBank().getId());
       headBank.getBranches().remove(branch);
       headBankRepository.save(headBank);

    }

    @Transactional
    public BranchManager addBranchManager(@Valid BranchManagerDTO managerDTO) {
        // add if adready manager exist in this
        // add save return
        Branch branch=branchRepository.findById(managerDTO.getBranchId()).orElseThrow(()-> new BusinessRuleException("branch not found with id "+managerDTO.getBranchId()));

        BranchManager manager = new BranchManager();
        manager.setFullName(managerDTO.getFirstName()+managerDTO.getLastName()+managerDTO.getLastName());
        manager.setUsername(managerDTO.getUsername());
        manager.setEmail(managerDTO.getEmail());
        manager.setBranch(branch);
        manager.setIsActive(true);
        manager.setCreatedAt(LocalDateTime.now());

        BranchManager savedManager = branchManagerRepository.save(manager);
        return savedManager;
    }


    @Transactional
    public void addLoanOffer(LoanOfferDTO offerDTO) {
        // head bank exist
        // add bidifrectional  return
        HeadBank headBank=headBankRepository.findById(offerDTO.getHeadBankId()).orElseThrow(()->new BusinessRuleException("head bank not found with id "+offerDTO.getHeadBankId()));

        LoanOffers loanOffer = new LoanOffers();
        loanOffer.setLoanType(offerDTO.getLoanType());
        loanOffer.setOfferName(offerDTO.getName());
        loanOffer.setInterestRate(offerDTO.getInterestRate());
        loanOffer.setMinAmount(offerDTO.getMinAmount());
        loanOffer.setMaxAmount(offerDTO.getMaxAmount());
        loanOffer.setMinTenureMonths(offerDTO.getMinTenure());
        loanOffer.setMaxTenureMonths(offerDTO.getMaxTenure());
        loanOffer.setIsActive(true);
        loanOffer.setCreatedAt(LocalDateTime.now());


        loanOffer.setHeadBank(headBank);
        loanOffersRepository.save(loanOffer);
    }


    @Transactional
    public LoanOffers updateLoanOffer(Long offerId, LoanOfferDTO offerDTO) {


        LoanOffers existingOffer = loanOffersRepository.findById(offerId)
                .orElseThrow(() -> new BusinessRuleException("LoanOffers id"+ offerId));

        // Update fields
        existingOffer.setOfferName(offerDTO.getName());
        existingOffer.setInterestRate(offerDTO.getInterestRate());
        existingOffer.setMinAmount(offerDTO.getMinAmount());
        existingOffer.setMaxAmount(offerDTO.getMaxAmount());
        existingOffer.setMinTenureMonths(offerDTO.getMinTenure());
        existingOffer.setMaxTenureMonths(offerDTO.getMaxTenure());
        existingOffer.setUpdatedAt(LocalDateTime.now());

        LoanOffers updatedOffer = loanOffersRepository.save(existingOffer);

        return updatedOffer;
    }


    public BigDecimal getHeadBankEarning(Long headBankId) {
        HeadBank headBank=headBankRepository.findById(headBankId).orElseThrow(()->new BusinessRuleException("head bank not found with id "+headBankId));
        return headBank.getTotalEarning();
    }

    public BigDecimal getBankEarning(Long bankId) {
        Branch branch=branchRepository.findById(bankId).orElseThrow(()->new BusinessRuleException(" bank branch not found with id "+bankId));
        return branch.getTotalEarning();
    }

//    public DebitCardRules createDebitCardRules(@Valid DebitCardRulesDTO rulesDTO) {
//
////    }
}
