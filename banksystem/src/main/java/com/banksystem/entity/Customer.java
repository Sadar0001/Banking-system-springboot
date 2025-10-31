package com.banksystem.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "customer")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "branch_id", nullable = false)
    @JsonIgnore
    private Branch branch;

    @Column(name = "customer_id", nullable = false, unique = true, length = 50)
    private String customerId;

    @Column(name = "first_name", nullable = false, length = 100)
    private String firstName;

    @Column(name = "last_name", nullable = false, length = 100)
    private String lastName;

    private String email;

    private String phone;

    @Column(name = "date_of_birth")
    private LocalDate dateOfBirth;

    private String address;

    @Column(name = "aadhar_number", unique = true, length = 20)
    private String aadharNumber;

    @Column(name = "pan_number", unique = true, length = 20)
    private String panNumber;

//    @Enumerated(EnumType.STRING)
//    @Column(name = "kyc_status", length = 20)
//    private KycStatus kycStatus = KycStatus.PENDING;

    @Column(name = "is_active")
    private Boolean isActive = true;

    @Column(name = "transaction_pin_hash")
    private String transactionPinHash;


    @Column(name = "created_at")
    private LocalDateTime createdAt = LocalDateTime.now();

    @Column(name = "updated_at")
    private LocalDateTime updatedAt = LocalDateTime.now();

//    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL)
//    @JsonIgnore
//    private List<Account> accounts;

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL)
    @JsonIgnore
    private List<LoanApplication> loanApplications;

//    @OneToMany(mappedBy = "requestedBy")
//    @JsonIgnore
//    private List<CardRequest> cardRequests;

    @Column(name = "pin_locked_until")
    private LocalDateTime pinLockedUntil;

//    @OneToMany(mappedBy = "requestedBy")
//    @JsonIgnore
//    private List<ChequeBookRequest> chequeBookRequests;
}