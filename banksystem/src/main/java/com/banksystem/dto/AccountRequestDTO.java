
package com.banksystem.dto;

import com.banksystem.enums.AccountType;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Data;
import java.math.BigDecimal;

@Data
public class AccountRequestDTO {
    @NotNull(message = "Account type is required")
    private AccountType accountType;

    @NotNull(message = "Initial deposit is required")
    @Positive(message = "Initial deposit must be positive")
    private BigDecimal initialDeposit;
}
