package com.banksystem.repository;


import com.banksystem.entity.Branch;
import com.banksystem.entity.HeadBank;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BranchRepository extends JpaRepository<Branch,Long> {

    List<Branch> findByHeadBank(HeadBank headBank);

    Branch findByBranchCode(String branchCode);
}
