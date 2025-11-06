package com.banksystem.repository;


import com.banksystem.entity.BranchManager;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface BranchManagerRepository extends JpaRepository<BranchManager, Long> {
    // Custom queries can be added here if needed
}