package com.banksystem.repository;

import com.banksystem.entity.LoanOffers;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LoanOffersRepository extends JpaRepository<LoanOffers,Long> {
}
