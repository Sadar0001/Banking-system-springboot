package com.banksystem.repository;


import com.banksystem.entity.BranchManager;
import org.springframework.data.jpa.repository.JpaRepository;

public interface branchManagerRepository extends JpaRepository<BranchManager, Integer> {
}
