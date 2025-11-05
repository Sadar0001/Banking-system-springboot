
package com.banksystem.repository;

import com.banksystem.entity.DebitCardRules;
import com.banksystem.entity.HeadBank;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface DebitCardRulesRepository extends JpaRepository<DebitCardRules, Long> {

    Optional<DebitCardRules> findByHeadBankAndCardType(HeadBank headBank, String cardType);
}
