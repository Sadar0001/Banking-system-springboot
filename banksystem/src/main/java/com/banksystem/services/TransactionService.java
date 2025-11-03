package com.banksystem.services;


import com.banksystem.dto.TransactionDto;
import com.banksystem.entity.Account;
import com.banksystem.entity.Charges;
import com.banksystem.entity.Transaction;
import com.banksystem.enums.AccountStatus;
import com.banksystem.enums.TransactionStatus;
import com.banksystem.exception.BusinessRuleException;
import com.banksystem.repository.AccountRepository;
import com.banksystem.repository.ChargesRepository;
import com.banksystem.repository.TransactionRepository;
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

    public TransactionService(ChargesService chargesService,
                              AccountRepository accountRepository,
                              TransactionRepository transactionRepository,
                              ChargesRepository chargesRepository) {
        this.chargesService = chargesService;
        this.accountRepository = accountRepository;
        this.transactionRepository = transactionRepository;
        this.chargesRepository = chargesRepository;
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

        // 4. Calculate charges
        List<Charges> charges = chargesService.getChargesList(transactionDto);
        BigDecimal totalCharges = BigDecimal.ZERO;

        for (Charges charge : charges) {
            totalCharges = totalCharges.add(BigDecimal.valueOf(charge.getChargedAmount()));
        }

        BigDecimal netAmount = transactionDto.getAmount().subtract(totalCharges);

        // 5. Check sufficient balance (amount + charges)
        if (senderAccount.getAvailableBalance().compareTo(transactionDto.getAmount()) < 0) {
            throw new BusinessRuleException("Insufficient balance. Required: " + transactionDto.getAmount()
                    + ", Available: " + senderAccount.getAvailableBalance());
        }

        // 6. Create and save transaction
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

        // 7. Associate charges with transaction and save
        for (Charges charge : charges) {
            charge.setTransaction(savedTransaction);
        }
        chargesRepository.saveAll(charges);

        // 8. Update sender balances (deduct amount + charges)
        senderAccount.setCurrentBalance(senderAccount.getCurrentBalance().subtract(transactionDto.getAmount()));
        senderAccount.setAvailableBalance(senderAccount.getAvailableBalance().subtract(transactionDto.getAmount()));

        // 9. Update receiver balances (credit full amount)
        receiverAccount.setCurrentBalance(receiverAccount.getCurrentBalance().add(netAmount));
        receiverAccount.setAvailableBalance(receiverAccount.getAvailableBalance().add(netAmount));

        // 10. Save updated accounts
        accountRepository.save(senderAccount);
        accountRepository.save(receiverAccount);

        return savedTransaction;
    }

    private String generateTransactionReference() {
        return "TXN" + System.currentTimeMillis() + "-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
}

