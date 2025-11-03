package com.banksystem.services;

import com.banksystem.dto.TransactionDto;
import com.banksystem.entity.Charges;
import com.banksystem.entity.ChargesBook;
import com.banksystem.entity.Transaction;
import com.banksystem.enums.BankType;
import com.banksystem.enums.TransactionType;
import com.banksystem.repository.ChargesBookRepository;
import com.banksystem.repository.ChargesRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ChargesService {

    private final ChargesBookRepository chargesBookRepository;
    private final ChargesRepository chargesRepository;

    public ChargesService(ChargesBookRepository chargesBookRepository, ChargesRepository chargesRepository) {
        this.chargesBookRepository = chargesBookRepository;
        this.chargesRepository = chargesRepository;
    }

    // Only CREATE charges, don't save them yet
    public List<Charges> getChargesList(TransactionDto transactionDto) {
        List<ChargesBook> chargesBooks = chargesBookRepository.getAllValidCharges(
                transactionDto.getBankId(),
                transactionDto.getBankType(),
                transactionDto.getTransactionType(),
                transactionDto.getAmount()
        );

        List<Charges> chargesList = new ArrayList<>();
        for (ChargesBook cb : chargesBooks) {
            Charges c = new Charges();
            c.setBankType(cb.getBankType());
            c.setBankId(cb.getBankId());
            c.setChargedAmount(cb.getFeeAmount());
            chargesList.add(c);
        }
        return chargesList;
    }
}