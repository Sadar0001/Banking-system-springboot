package com.banksystem.services;

import com.banksystem.entity.Account;
import com.banksystem.entity.Transaction;
import com.banksystem.enums.AccountStatus;
import com.banksystem.exception.BusinessRuleException;
import com.banksystem.repository.AccountRepository;
import com.banksystem.repository.CentralBankRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Service
public class TellerService {


    private final AccountRepository accountRepository;

    public TellerService(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }

//    @Transactional
//    public Transaction depositCash(Long accountId, BigDecimal amount, String description) {
//        Account account = accountRepository.findById(accountId).orElseThrow(()-> new BusinessRuleException("Account id"+ accountId));
//
//        validateAccountForTransaction(account);
//        // cut charges for the bank
//
//        // Update account balance
//        BigDecimal newBalance = account.getCurrentBalance().add(amount);
//        account.setCurrentBalance(newBalance);
//        account.setUpdatedAt(LocalDateTime.now());
//        accountRepository.save(account);
//
//        // Create transaction record
//        Transaction transaction = createTransaction(account, null, amount,
//                TransactionType.DEPOSIT, description, TransactionStatus.COMPLETED);
//
//        log.info("Successfully deposited {} to account ID: {}", amount, accountId);
//        return transaction;
//    }

    public boolean validateAccountForTransaction(Account account) {
        Account ac= accountRepository.findById(account.getId()).orElseThrow(()-> new BusinessRuleException("Account id"+ account.getId()));
        return ac.getStatus()== AccountStatus.ACTIVE;
    }






}
