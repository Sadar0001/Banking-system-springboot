package com.banksystem.services;


import com.banksystem.dto.BranchDTO;
import com.banksystem.dto.BranchManagerDTO;
import com.banksystem.dto.DebitCardRulesDTO;
import com.banksystem.dto.LoanOfferDTO;
import com.banksystem.entity.*;
import com.banksystem.exception.BusinessRuleException;
import com.banksystem.exception.ResourceNotFoundException;
import com.banksystem.repository.*;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class HeadBankAdminSerivice {

    private final BranchRepository branchRepository;
    private final HeadBankRepository headBankRepository;
    private final LoanOffersRepository loanOffersRepository;
    private final DebitCardRulesRepository debitCardRulesRepository;
    private final BranchManagerRepository branchManagerRepository;

    public HeadBankAdminSerivice(BranchRepository branchRepository, HeadBankRepository headBankRepository, LoanOffersRepository loanOffersRepository, DebitCardRulesRepository debitCardRulesRepository, BranchManagerRepository branchManagerRepository) {
        this.branchRepository = branchRepository;
        this.headBankRepository = headBankRepository;
        this.loanOffersRepository = loanOffersRepository;
        this.debitCardRulesRepository = debitCardRulesRepository;
        this.branchManagerRepository = branchManagerRepository;
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
        Optional<BranchManager> branchManager=branchManagerRepository.findByBranchId(managerDTO.getBranchId());
        if(branchManager.isPresent()){
            throw new BusinessRuleException("Branch Manager  already exists for this brnach, manager id is "+branchManager.get().getId());
        }
        Branch branch=branchRepository.findById(managerDTO.getBranchId()).orElseThrow(()-> new BusinessRuleException("branch not found with id "+managerDTO.getBranchId()));

        BranchManager manager = new BranchManager();
        manager.setFullName(managerDTO.getFirstName()+managerDTO.getLastName()+managerDTO.getLastName());
        manager.setUsername(managerDTO.getUsername());
        manager.setEmail(managerDTO.getEmail());
        manager.setBranch(branch);
        manager.setIsActive(true);
        manager.setPasswordHash(managerDTO.getPassword());
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
        loanOffer.setEligibilityCriteria(offerDTO.getEligibilityCriteria());


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

    public List<DebitCardRules> getAllDebitCardRulesByHeadBank(Long headBankId) {
        log.info("Fetching all debit card rules for head bank ID: {}", headBankId);

        HeadBank headBank = headBankRepository.findById(headBankId)
                .orElseThrow(() -> new ResourceNotFoundException("HeadBank", "id", headBankId));

        // Use repository method instead of direct relationship
        return debitCardRulesRepository.findByHeadBankAndIsActive(headBank, true);
    }


    public BranchManager deactivateManager(long managerId) {
        BranchManager branchManager=branchManagerRepository.findById(managerId)  .orElseThrow(() -> {
            log.error("Manager with ID {} not found", managerId);
            return new RuntimeException("Manager id " + managerId + " not found");
        });
        branchManager.setIsActive(false);
        branchManagerRepository.save(branchManager);

        return branchManager;
    }

    public List<LoanOffers> getAllLoanOffers(Long headBankId) {
       return loanOffersRepository.findAllByHeadBankId(headBankId);
    }

    public LoanOffers deactivateLoanOffers(Long headBankId,Long id) {
        LoanOffers loanOffer = loanOffersRepository.findById(id)
                .orElseThrow(() -> new BusinessRuleException("Loan offer not found with id: " + id));
        if(!loanOffer.getHeadBank().getId().equals(headBankId)) {
            throw new BusinessRuleException("this loan offer is not of your Head Bank" + id);
        }
        loanOffer.setIsActive(false);
        return loanOffersRepository.save(loanOffer);
    }
}
