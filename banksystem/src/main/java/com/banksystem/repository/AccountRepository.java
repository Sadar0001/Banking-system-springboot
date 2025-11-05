
package com.banksystem.repository;

import com.banksystem.entity.Account;
import com.banksystem.entity.Customer;
import com.banksystem.enums.AccountType;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface AccountRepository extends JpaRepository<Account, Long> {

    List<Account> findByCustomer(Customer customer);

    boolean existsByCustomerAndAccountType(Customer customer, AccountType accountType);

    Account findByAccountNumber(String accountNumber);
}
