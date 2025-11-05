package com.banksystem.services;

import com.banksystem.dto.TransactionDto;
import com.banksystem.entity.*;
import com.banksystem.enums.AccountStatus;
import com.banksystem.enums.BankType;
import com.banksystem.enums.TransactionStatus;
import com.banksystem.exception.BusinessRuleException;
import com.banksystem.repository.*;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class TransactionService {

    private final ChargesService chargesService;
    private final AccountRepository accountRepository;
    private final TransactionRepository transactionRepository;
    private final ChargesRepository chargesRepository;
    private final BranchRepository branchRepository;
    private final HeadBankRepository headBankRepository;
    private final CentralBankRepository centralBankRepository;

    public TransactionService(ChargesService chargesService,
                              AccountRepository accountRepository,
                              TransactionRepository transactionRepository,
                              ChargesRepository chargesRepository,
                              BranchRepository branchRepository,
                              HeadBankRepository headBankRepository,
                              CentralBankRepository centralBankRepository) {
        this.chargesService = chargesService;
        this.accountRepository = accountRepository;
        this.transactionRepository = transactionRepository;
        this.chargesRepository = chargesRepository;
        this.branchRepository = branchRepository;
        this.headBankRepository = headBankRepository;
        this.centralBankRepository = centralBankRepository;
    }

    @Transactional
    public Transaction makeTransaction(TransactionDto transactionDto) {
        // 1. Validate sender account
        Account senderAccount = accountRepository.findByAccountNumber(transactionDto.getSenderAccountNumber());
        if (senderAccount == null) {
            throw new BusinessRuleException("Sender account not found");
        }

        // 2. Validate receiver account
        Account receiverAccount = accountRepository.findByAccountNumber(transactionDto.getReceiverAccountNumber());
        if (receiverAccount == null) {
            throw new BusinessRuleException("Receiver account not found");
        }

        // 3. Check account statuses
        if (!senderAccount.getStatus().equals(AccountStatus.ACTIVE)) {
            throw new BusinessRuleException("Sender account is not active");
        }

        if (!receiverAccount.getStatus().equals(AccountStatus.ACTIVE)) {
            throw new BusinessRuleException("Receiver account is not active");
        }

        // 4. Get branch hierarchy (Branch -> Head Bank -> Central Bank)
        Branch branch = senderAccount.getBranch();
        HeadBank headBank = branch.getHeadBank();
        CentralBank centralBank = headBank.getCentralBank();

        // 5. Collect charges from all three levels
        List<Charges> allCharges = new ArrayList<>();

        // Branch charges
        TransactionDto branchDto = createTransactionDto(transactionDto, branch.getId(), BankType.BANK_BRANCH);
        allCharges.addAll(chargesService.getChargesList(branchDto));

        // Head Bank charges
        TransactionDto headBankDto = createTransactionDto(transactionDto, headBank.getId(), BankType.HEAD_BANK);
        allCharges.addAll(chargesService.getChargesList(headBankDto));

        // Central Bank charges
        TransactionDto centralBankDto = createTransactionDto(transactionDto, centralBank.getId(), BankType.CENTRAL_BANK);
        allCharges.addAll(chargesService.getChargesList(centralBankDto));

        // 6. Calculate total charges
        BigDecimal totalCharges = BigDecimal.ZERO;
        for (Charges charge : allCharges) {
            totalCharges = totalCharges.add(BigDecimal.valueOf(charge.getChargedAmount()));
        }

        BigDecimal netAmount = transactionDto.getAmount().subtract(totalCharges);

        // 7. Check sufficient balance (amount should cover transaction amount)
        if (senderAccount.getAvailableBalance().compareTo(transactionDto.getAmount()) < 0) {
            throw new BusinessRuleException("Insufficient balance. Required: " + transactionDto.getAmount()
                    + ", Available: " + senderAccount.getAvailableBalance());
        }

        // 8. Create and save transaction
        Transaction newTransaction = new Transaction();
        newTransaction.setFromAccount(senderAccount);
        newTransaction.setToAccount(receiverAccount);
        newTransaction.setAmount(transactionDto.getAmount());
        newTransaction.setTransactionType(transactionDto.getTransactionType());
        newTransaction.setDescription(transactionDto.getDescription());
        newTransaction.setTransactionReference(generateTransactionReference());
        newTransaction.setTotalCharges(totalCharges);
        newTransaction.setNetAmount(netAmount);
        newTransaction.setStatus(TransactionStatus.COMPLETED);

        Transaction savedTransaction = transactionRepository.save(newTransaction);

        // 9. Associate charges with transaction and save
        for (Charges charge : allCharges) {
            charge.setTransaction(savedTransaction);
        }
        chargesRepository.saveAll(allCharges);

        // 10. Update sender balances (deduct full amount)
        senderAccount.setCurrentBalance(senderAccount.getCurrentBalance().subtract(transactionDto.getAmount()));
        senderAccount.setAvailableBalance(senderAccount.getAvailableBalance().subtract(transactionDto.getAmount()));

        // 11. Update receiver balances (credit net amount after charges)
        receiverAccount.setCurrentBalance(receiverAccount.getCurrentBalance().add(netAmount));
        receiverAccount.setAvailableBalance(receiverAccount.getAvailableBalance().add(netAmount));

        // 12. Distribute charges to banks (THIS IS THE KEY PART!)
        distributeChargesToBanks(allCharges);

        // 13. Save updated accounts
        accountRepository.save(senderAccount);
        accountRepository.save(receiverAccount);

        return savedTransaction;
    }

    /**
     * Helper method to create TransactionDto for each bank level
     */

    @Transactional
    public TransactionDto createTransactionDto(TransactionDto original, Long bankId, BankType bankType) {
        TransactionDto dto = new TransactionDto();
        dto.setSenderAccountNumber(original.getSenderAccountNumber());
        dto.setReceiverAccountNumber(original.getReceiverAccountNumber());
        dto.setBankId(bankId);
        dto.setBankType(bankType);
        dto.setTransactionType(original.getTransactionType());
        dto.setAccountHolderType(original.getAccountHolderType());
        dto.setAmount(original.getAmount());
        dto.setDescription(original.getDescription());
        dto.setTransactionStatus(original.getTransactionStatus());
        return dto;
    }

    /**
     * Distributes transaction charges to Central Bank, Head Bank, and Branch
     */

    @Transactional
    public void distributeChargesToBanks(List<Charges> charges) {
        for (Charges charge : charges) {
            BigDecimal chargeAmount = BigDecimal.valueOf(charge.getChargedAmount());

            switch (charge.getBankType()) {
                case CENTRAL_BANK:
                    // Add to Central Bank earnings
                    centralBankRepository.findById(charge.getBankId()).ifPresent(centralBank -> {
                        BigDecimal currentEarning = centralBank.getTotalEarning() != null ?
                                centralBank.getTotalEarning() : BigDecimal.ZERO;
                        centralBank.setTotalEarning(currentEarning.add(chargeAmount));
                        centralBankRepository.save(centralBank);
                    });
                    break;

                case HEAD_BANK:
                    // Add to Head Bank earnings
                    headBankRepository.findById(charge.getBankId()).ifPresent(headBank -> {
                        BigDecimal currentEarning = headBank.getTotalEarning() != null ?
                                headBank.getTotalEarning() : BigDecimal.ZERO;
                        headBank.setTotalEarning(currentEarning.add(chargeAmount));
                        headBankRepository.save(headBank);
                    });
                    break;

                case BANK_BRANCH:
                    // Add to Branch earnings
                    branchRepository.findById(charge.getBankId()).ifPresent(branch -> {
                        BigDecimal currentEarning = branch.getTotalEarning() != null ?
                                branch.getTotalEarning() : BigDecimal.ZERO;
                        branch.setTotalEarning(currentEarning.add(chargeAmount));
                        branchRepository.save(branch);
                    });
                    break;

                default:
                    throw new BusinessRuleException("Unknown bank type: " + charge.getBankType());
            }
        }
    }

    private String generateTransactionReference() {
        return "TXN" + System.currentTimeMillis() + "-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
}