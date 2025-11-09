package com.banksystem.repository;


import com.banksystem.entity.BranchManager;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import java.util.Optional;


@Repository
public interface BranchManagerRepository extends JpaRepository<BranchManager, Long> {
    Optional<BranchManager> findByBranchId(Long branchId);
    // Custom queries can be added here if needed
}