-- Insert Central Bank
INSERT INTO central_bank (id, name, code, address, contact_email, contact_phone, total_earning, created_at, updated_at)
VALUES
    (1, 'National Central Bank', 'NCB001', '123 Central Plaza, Capital City', 'contact@nationalcentralbank.com', '+1-555-100-0000', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Head Banks (3 head banks belonging to the central bank)
INSERT INTO head_bank (id, central_bank_id, name, code, address, contact_email, contact_phone, routing_number, total_earning, is_active, created_at, updated_at)
VALUES
    (1, 1, 'Metropolitan Head Bank', 'MHB001', '456 Downtown Avenue, Metro City', 'info@metropolitanbank.com', '+1-555-100-1001', 'RT001100100', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 1, 'Global Trust Head Bank', 'GTH002', '789 International Street, Global City', 'support@globaltrust.com', '+1-555-100-1002', 'RT001100200', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, 1, 'United Financial Head Bank', 'UFH003', '321 Commerce Road, United City', 'admin@unitedfinancial.com', '+1-555-100-1003', 'RT001100300', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Central Bank Admin
INSERT INTO central_bank_admin (id, central_bank_id, username, email, password_hash, full_name, role, is_active, created_at, last_login)
VALUES
    (1, 1, 'central_admin', 'admin@nationalcentralbank.com', '$2a$10$hashedpassword12345678901234567890', 'John Central Administrator', 'central_admin', true, CURRENT_TIMESTAMP, NULL);

-- Insert Head Bank Admins (one for each head bank)
INSERT INTO head_bank_admin (id, head_bank_id, username, email, password_hash, full_name, role, is_active, created_at, last_login)
VALUES
    (1, 1, 'metro_admin', 'admin@metropolitanbank.com', '$2a$10$hashedpassword12345678901234567891', 'Sarah Metropolitan Manager', 'head_bank_admin', true, CURRENT_TIMESTAMP, NULL),
    (2, 2, 'global_admin', 'admin@globaltrust.com', '$2a$10$hashedpassword12345678901234567892', 'Michael Global Director', 'head_bank_admin', true, CURRENT_TIMESTAMP, NULL),
    (3, 3, 'united_admin', 'admin@unitedfinancial.com', '$2a$10$hashedpassword12345678901234567893', 'Emily United Supervisor', 'head_bank_admin', true, CURRENT_TIMESTAMP, NULL);


-- ****************************************************************************
-- Insert Loan Offers for Metropolitan Head Bank (ID: 1)
INSERT INTO loan_offers (head_bank_id, offer_name, interest_rate, min_amount, max_amount, min_tenure_months, max_tenure_months, eligibility_criteria, is_active, loan_type, created_at, updated_at)
VALUES
    (1, 'Metro Personal Loan', 8.50, 5000.00, 50000.00, 12, 60, '{"minIncome": 25000, "minCreditScore": 650, "employmentType": ["SALARIED", "SELF_EMPLOYED"]}', true, 'PERSONAL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (1, 'Metro Home Loan', 6.75, 50000.00, 500000.00, 60, 240, '{"minIncome": 50000, "minCreditScore": 700, "propertyAge": "NEW", "employmentType": ["SALARIED"]}', true, 'HOME', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (1, 'Metro Car Loan', 7.25, 10000.00, 100000.00, 12, 84, '{"minIncome": 30000, "minCreditScore": 600, "vehicleAge": "NEW", "employmentType": ["SALARIED", "SELF_EMPLOYED"]}', true, 'CAR', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Loan Offers for Global Trust Head Bank (ID: 2)
INSERT INTO loan_offers (head_bank_id, offer_name, interest_rate, min_amount, max_amount, min_tenure_months, max_tenure_months, eligibility_criteria, is_active, loan_type, created_at, updated_at)
VALUES
    (2, 'Global Personal Plus', 9.00, 10000.00, 100000.00, 6, 84, '{"minIncome": 30000, "minCreditScore": 680, "employmentType": ["SALARIED", "SELF_EMPLOYED", "BUSINESS"]}', true, 'PERSONAL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 'Global Education Loan', 5.50, 20000.00, 200000.00, 24, 120, '{"minIncome": 0, "minCreditScore": 0, "courseType": ["UNDERGRADUATE", "POSTGRADUATE"], "institutionType": ["ACCREDITED"]}', true, 'EDUCATION', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 'Global Dream Home', 6.25, 75000.00, 750000.00, 84, 360, '{"minIncome": 60000, "minCreditScore": 720, "propertyAge": "ANY", "employmentType": ["SALARIED", "SELF_EMPLOYED"]}', true, 'HOME', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Loan Offers for United Financial Head Bank (ID: 3)
INSERT INTO loan_offers (head_bank_id, offer_name, interest_rate, min_amount, max_amount, min_tenure_months, max_tenure_months, eligibility_criteria, is_active, loan_type, created_at, updated_at)
VALUES
    (3, 'United Quick Personal', 10.50, 2000.00, 25000.00, 3, 36, '{"minIncome": 20000, "minCreditScore": 550, "employmentType": ["SALARIED", "SELF_EMPLOYED", "STUDENT"]}', true, 'PERSONAL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, 'United Auto Finance', 8.75, 15000.00, 150000.00, 12, 96, '{"minIncome": 35000, "minCreditScore": 620, "vehicleAge": "UP_TO_5_YEARS", "employmentType": ["SALARIED", "SELF_EMPLOYED"]}', true, 'CAR', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, 'United Career Education', 6.00, 15000.00, 150000.00, 18, 96, '{"minIncome": 0, "minCreditScore": 600, "courseType": ["VOCATIONAL", "CERTIFICATION", "DEGREE"], "coBorrowerRequired": true}', true, 'EDUCATION', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Debit Card Rules for Metropolitan Head Bank (ID: 1)
INSERT INTO debit_card_rules (head_bank_id, card_type, daily_withdrawal_limit, daily_transaction_limit, international_usage, annual_fee, is_active, created_at)
VALUES
    (1, 'Standard Debit Card', 500.00, 2000.00, false, 0.00, true, CURRENT_TIMESTAMP),
    (1, 'Premium Debit Card', 1000.00, 5000.00, true, 50.00, true, CURRENT_TIMESTAMP),
    (1, 'Platinum Debit Card', 2000.00, 10000.00, true, 100.00, true, CURRENT_TIMESTAMP);

-- Insert Debit Card Rules for Global Trust Head Bank (ID: 2)
INSERT INTO debit_card_rules (head_bank_id, card_type, daily_withdrawal_limit, daily_transaction_limit, international_usage, annual_fee, is_active, created_at)
VALUES
    (2, 'Basic Debit Card', 300.00, 1500.00, false, 0.00, true, CURRENT_TIMESTAMP),
    (2, 'Gold Debit Card', 1500.00, 7500.00, true, 75.00, true, CURRENT_TIMESTAMP),
    (2, 'World Debit Card', 3000.00, 15000.00, true, 150.00, true, CURRENT_TIMESTAMP);

-- Insert Debit Card Rules for United Financial Head Bank (ID: 3)
INSERT INTO debit_card_rules (head_bank_id, card_type, daily_withdrawal_limit, daily_transaction_limit, international_usage, annual_fee, is_active, created_at)
VALUES
    (3, 'Student Debit Card', 200.00, 1000.00, false, 0.00, true, CURRENT_TIMESTAMP),
    (3, 'Everyday Debit Card', 750.00, 3000.00, true, 25.00, true, CURRENT_TIMESTAMP),
    (3, 'Elite Debit Card', 2500.00, 12500.00, true, 125.00, true, CURRENT_TIMESTAMP);


--****************************************************************************************
-- Insert Branches for Metropolitan Head Bank (ID: 1)
INSERT INTO branch (head_bank_id, branch_code, name, address, contact_email, contact_phone, ifsc_code, total_earning, is_active, created_at, updated_at)
VALUES
    (1, 'MHB001-BR001', 'Metropolitan Downtown Branch', '123 Main Street, Metro City', 'downtown@metropolitanbank.com', '+1-555-200-1001', 'MHB0010001', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (1, 'MHB001-BR002', 'Metropolitan Uptown Branch', '456 Oak Avenue, Metro City', 'uptown@metropolitanbank.com', '+1-555-200-1002', 'MHB0010002', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (1, 'MHB001-BR003', 'Metropolitan Suburban Branch', '789 Pine Road, Suburbia', 'suburban@metropolitanbank.com', '+1-555-200-1003', 'MHB0010003', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Branches for Global Trust Head Bank (ID: 2)
INSERT INTO branch (head_bank_id, branch_code, name, address, contact_email, contact_phone, ifsc_code, total_earning, is_active, created_at, updated_at)
VALUES
    (2, 'GTH002-BR001', 'Global Trust City Center', '321 Global Plaza, Global City', 'citycenter@globaltrust.com', '+1-555-200-2001', 'GTH0020001', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 'GTH002-BR002', 'Global Trust Financial District', '654 Commerce Street, Global City', 'financial@globaltrust.com', '+1-555-200-2002', 'GTH0020002', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 'GTH002-BR003', 'Global Trust Harbor Branch', '987 Bay View Road, Port City', 'harbor@globaltrust.com', '+1-555-200-2003', 'GTH0020003', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Branches for United Financial Head Bank (ID: 3)
INSERT INTO branch (head_bank_id, branch_code, name, address, contact_email, contact_phone, ifsc_code, total_earning, is_active, created_at, updated_at)
VALUES
    (3, 'UFH003-BR001', 'United Financial Main Branch', '147 United Square, United City', 'main@unitedfinancial.com', '+1-555-200-3001', 'UFH0030001', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, 'UFH003-BR002', 'United Financial Westside Branch', '258 Western Avenue, United City', 'westside@unitedfinancial.com', '+1-555-200-3002', 'UFH0030002', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, 'UFH003-BR003', 'United Financial Eastgate Branch', '369 Eastern Boulevard, Eastgate', 'eastgate@unitedfinancial.com', '+1-555-200-3003', 'UFH0030003', 0, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Branch Managers for Metropolitan Head Bank Branches
INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login)
VALUES
    (1, 'metro_downtown_mgr', 'downtown.manager@metropolitanbank.com', '$2a$10$hashedpassword12345678901234567894', 'Robert Downtown Manager', 'branch_manager', true, CURRENT_TIMESTAMP, NULL),
    (2, 'metro_uptown_mgr', 'uptown.manager@metropolitanbank.com', '$2a$10$hashedpassword12345678901234567895', 'Jennifer Uptown Manager', 'branch_manager', true, CURRENT_TIMESTAMP, NULL),
    (3, 'metro_suburban_mgr', 'suburban.manager@metropolitanbank.com', '$2a$10$hashedpassword12345678901234567896', 'David Suburban Manager', 'branch_manager', true, CURRENT_TIMESTAMP, NULL);

-- Insert Branch Managers for Global Trust Head Bank Branches
INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login)
VALUES
    (4, 'global_citycenter_mgr', 'citycenter.manager@globaltrust.com', '$2a$10$hashedpassword12345678901234567897', 'Lisa City Center Manager', 'branch_manager', true, CURRENT_TIMESTAMP, NULL),
    (5, 'global_financial_mgr', 'financial.manager@globaltrust.com', '$2a$10$hashedpassword12345678901234567898', 'James Financial Manager', 'branch_manager', true, CURRENT_TIMESTAMP, NULL),
    (6, 'global_harbor_mgr', 'harbor.manager@globaltrust.com', '$2a$10$hashedpassword12345678901234567899', 'Karen Harbor Manager', 'branch_manager', true, CURRENT_TIMESTAMP, NULL);

-- Insert Branch Managers for United Financial Head Bank Branches
INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login)
VALUES
    (7, 'united_main_mgr', 'main.manager@unitedfinancial.com', '$2a$10$hashedpassword12345678901234567900', 'Thomas Main Manager', 'branch_manager', true, CURRENT_TIMESTAMP, NULL),
    (8, 'united_westside_mgr', 'westside.manager@unitedfinancial.com', '$2a$10$hashedpassword12345678901234567901', 'Patricia Westside Manager', 'branch_manager', true, CURRENT_TIMESTAMP, NULL),
    (9, 'united_eastgate_mgr', 'eastgate.manager@unitedfinancial.com', '$2a$10$hashedpassword12345678901234567902', 'Richard Eastgate Manager', 'branch_manager', true, CURRENT_TIMESTAMP, NULL);


--*********************************************************************************
-- ****************************************************************************************
-- Insert Charges Book for Central Bank (ID: 1)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, max_value, min_value, is_active, created_at, updated_at)
VALUES
    -- Central Bank Transaction Fees
    ('Inter-Bank Transfer Fee', 2.50, 1, 'CENTRAL_BANK', 'TRANSFER', 10000.00, 1.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Central Processing Fee', 1.00, 1, 'CENTRAL_BANK', 'TRANSFER', 50000.00, 100.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Loan Disbursement Fee', 0.5, 1, 'CENTRAL_BANK', 'LOAN_DISBURSEMENT', 1000000.00, 1000.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Central Bank Withdrawal Fee', 0.25, 1, 'CENTRAL_BANK', 'WITHDRAWAL', 5000.00, 100.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Charges Book for Metropolitan Head Bank (ID: 1)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, max_value, min_value, is_active, created_at, updated_at)
VALUES
    -- Metropolitan Head Bank Fees
    ('Metro Transfer Fee - Domestic', 1.50, 1, 'HEAD_BANK', 'TRANSFER', 5000.00, 1.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Metro Transfer Fee - International', 15.00, 1, 'HEAD_BANK', 'TRANSFER', 20000.00, 100.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Metro Withdrawal Fee - Own ATM', 0.00, 1, 'HEAD_BANK', 'WITHDRAWAL', 1000.00, 1.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Metro Withdrawal Fee - Other ATM', 2.00, 1, 'HEAD_BANK', 'WITHDRAWAL', 1000.00, 1.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Metro Loan Processing Fee', 1.0, 1, 'HEAD_BANK', 'LOAN_DISBURSEMENT', 500000.00, 5000.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Metro Bill Payment Fee', 1.00, 1, 'HEAD_BANK', 'BILL_PAYMENT', 5000.00, 10.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Charges Book for Global Trust Head Bank (ID: 2)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, max_value, min_value, is_active, created_at, updated_at)
VALUES
    -- Global Trust Head Bank Fees
    ('Global Transfer Fee - Standard', 2.00, 2, 'HEAD_BANK', 'TRANSFER', 10000.00, 1.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Global Transfer Fee - Express', 5.00, 2, 'HEAD_BANK', 'TRANSFER', 50000.00, 100.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Global Withdrawal Fee - Domestic', 1.50, 2, 'HEAD_BANK', 'WITHDRAWAL', 2000.00, 1.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Global Withdrawal Fee - International', 5.00, 2, 'HEAD_BANK', 'WITHDRAWAL', 1000.00, 1.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Global Loan Service Fee', 0.75, 2, 'HEAD_BANK', 'LOAN_REPAYMENT', 100000.00, 100.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Global Deposit Fee - Cash', 0.50, 2, 'HEAD_BANK', 'DEPOSIT', 10000.00, 100.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Charges Book for United Financial Head Bank (ID: 3)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, max_value, min_value, is_active, created_at, updated_at)
VALUES
    -- United Financial Head Bank Fees
    ('United Transfer Fee - Online', 0.50, 3, 'HEAD_BANK', 'TRANSFER', 5000.00, 1.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('United Transfer Fee - Branch', 2.00, 3, 'HEAD_BANK', 'TRANSFER', 10000.00, 1.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('United Withdrawal Fee - Standard', 1.00, 3, 'HEAD_BANK', 'WITHDRAWAL', 1500.00, 1.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('United Loan Application Fee', 50.00, 3, 'HEAD_BANK', 'LOAN_DISBURSEMENT', 1000000.00, 1000.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('United Bill Payment Convenience Fee', 2.50, 3, 'HEAD_BANK', 'BILL_PAYMENT', 10000.00, 50.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('United Cash Deposit Fee', 1.00, 3, 'HEAD_BANK', 'DEPOSIT', 5000.00, 500.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Charges Book for Branch Banks (using first branch of each head bank as example)
-- Metropolitan Downtown Branch (ID: 1)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, max_value, min_value, is_active, created_at, updated_at)
VALUES
    ('Branch Counter Service Fee', 3.00, 1, 'BANK_BRANCH', 'TRANSFER', 5000.00, 1.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Branch Cash Withdrawal Fee', 2.00, 1, 'BANK_BRANCH', 'WITHDRAWAL', 5000.00, 100.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Branch Cash Deposit Fee', 1.50, 1, 'BANK_BRANCH', 'DEPOSIT', 10000.00, 100.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Branch Check Processing Fee', 5.00, 1, 'BANK_BRANCH', 'DEPOSIT', 50000.00, 100.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Global Trust City Center Branch (ID: 4)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, max_value, min_value, is_active, created_at, updated_at)
VALUES
    ('City Center Service Fee', 2.50, 4, 'BANK_BRANCH', 'TRANSFER', 3000.00, 1.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('City Center Cash Handling Fee', 2.00, 4, 'BANK_BRANCH', 'DEPOSIT', 8000.00, 200.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('City Center Document Fee', 10.00, 4, 'BANK_BRANCH', 'LOAN_DISBURSEMENT', 100000.00, 1000.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- United Financial Main Branch (ID: 7)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, max_value, min_value, is_active, created_at, updated_at)
VALUES
    ('Main Branch Processing Fee', 4.00, 7, 'BANK_BRANCH', 'TRANSFER', 10000.00, 1.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Main Branch Cash Fee', 3.00, 7, 'BANK_BRANCH', 'WITHDRAWAL', 5000.00, 500.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Main Branch Loan Service Charge', 25.00, 7, 'BANK_BRANCH', 'LOAN_REPAYMENT', 50000.00, 100.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Main Branch Bill Payment Fee', 3.00, 7, 'BANK_BRANCH', 'BILL_PAYMENT', 5000.00, 100.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Specialized fees for different transaction types across all bank types
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, max_value, min_value, is_active, created_at, updated_at)
VALUES
    -- Low value transaction fees
    ('Micro Transaction Fee', 0.10, 1, 'CENTRAL_BANK', 'TRANSFER', 100.00, 0.01, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Small Transfer Fee', 0.25, 2, 'HEAD_BANK', 'TRANSFER', 500.00, 1.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- High value transaction fees (percentage based)
    ('Large Transfer Surcharge', 0.001, 1, 'CENTRAL_BANK', 'TRANSFER', 1000000.00, 10000.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Premium Service Fee', 0.002, 3, 'HEAD_BANK', 'TRANSFER', 500000.00, 50000.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- International transaction fees
    ('Foreign Currency Fee', 0.03, 2, 'HEAD_BANK', 'TRANSFER', 50000.00, 1000.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Cross Border Fee', 2.5, 1, 'CENTRAL_BANK', 'TRANSFER', 100000.00, 1000.00, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


-- ****************************************************************************************
-- Insert Tellers for Metropolitan Head Bank Branches (2 tellers per branch)
-- Branch 1: Metropolitan Downtown Branch
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login)
VALUES
    (1, 'teller_downtown_01', 'teller1.downtown@metropolitanbank.com', '$2a$10$hashedpassword12345678901234567903', 'Alice Johnson', 'teller', true, CURRENT_TIMESTAMP, NULL),
    (1, 'teller_downtown_02', 'teller2.downtown@metropolitanbank.com', '$2a$10$hashedpassword12345678901234567904', 'Brian Smith', 'teller', true, CURRENT_TIMESTAMP, NULL);

-- Branch 2: Metropolitan Uptown Branch
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login)
VALUES
    (2, 'teller_uptown_01', 'teller1.uptown@metropolitanbank.com', '$2a$10$hashedpassword12345678901234567905', 'Carol Williams', 'teller', true, CURRENT_TIMESTAMP, NULL),
    (2, 'teller_uptown_02', 'teller2.uptown@metropolitanbank.com', '$2a$10$hashedpassword12345678901234567906', 'Daniel Brown', 'teller', true, CURRENT_TIMESTAMP, NULL);

-- Branch 3: Metropolitan Suburban Branch
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login)
VALUES
    (3, 'teller_suburban_01', 'teller1.suburban@metropolitanbank.com', '$2a$10$hashedpassword12345678901234567907', 'Emma Davis', 'teller', true, CURRENT_TIMESTAMP, NULL),
    (3, 'teller_suburban_02', 'teller2.suburban@metropolitanbank.com', '$2a$10$hashedpassword12345678901234567908', 'Frank Miller', 'teller', true, CURRENT_TIMESTAMP, NULL);

-- Insert Tellers for Global Trust Head Bank Branches
-- Branch 4: Global Trust City Center
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login)
VALUES
    (4, 'teller_citycenter_01', 'teller1.citycenter@globaltrust.com', '$2a$10$hashedpassword12345678901234567909', 'Grace Wilson', 'teller', true, CURRENT_TIMESTAMP, NULL),
    (4, 'teller_citycenter_02', 'teller2.citycenter@globaltrust.com', '$2a$10$hashedpassword12345678901234567910', 'Henry Moore', 'teller', true, CURRENT_TIMESTAMP, NULL);

-- Branch 5: Global Trust Financial District
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login)
VALUES
    (5, 'teller_financial_01', 'teller1.financial@globaltrust.com', '$2a$10$hashedpassword12345678901234567911', 'Ivy Taylor', 'teller', true, CURRENT_TIMESTAMP, NULL),
    (5, 'teller_financial_02', 'teller2.financial@globaltrust.com', '$2a$10$hashedpassword12345678901234567912', 'Jack Anderson', 'teller', true, CURRENT_TIMESTAMP, NULL);

-- Branch 6: Global Trust Harbor Branch
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login)
VALUES
    (6, 'teller_harbor_01', 'teller1.harbor@globaltrust.com', '$2a$10$hashedpassword12345678901234567913', 'Katie Thomas', 'teller', true, CURRENT_TIMESTAMP, NULL),
    (6, 'teller_harbor_02', 'teller2.harbor@globaltrust.com', '$2a$10$hashedpassword12345678901234567914', 'Leo Jackson', 'teller', true, CURRENT_TIMESTAMP, NULL);

-- Insert Tellers for United Financial Head Bank Branches
-- Branch 7: United Financial Main Branch
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login)
VALUES
    (7, 'teller_main_01', 'teller1.main@unitedfinancial.com', '$2a$10$hashedpassword12345678901234567915', 'Mia White', 'teller', true, CURRENT_TIMESTAMP, NULL),
    (7, 'teller_main_02', 'teller2.main@unitedfinancial.com', '$2a$10$hashedpassword12345678901234567916', 'Noah Harris', 'teller', true, CURRENT_TIMESTAMP, NULL);

-- Branch 8: United Financial Westside Branch
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login)
VALUES
    (8, 'teller_westside_01', 'teller1.westside@unitedfinancial.com', '$2a$10$hashedpassword12345678901234567917', 'Olivia Martin', 'teller', true, CURRENT_TIMESTAMP, NULL),
    (8, 'teller_westside_02', 'teller2.westside@unitedfinancial.com', '$2a$10$hashedpassword12345678901234567918', 'Paul Thompson', 'teller', true, CURRENT_TIMESTAMP, NULL);

-- Branch 9: United Financial Eastgate Branch
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login)
VALUES
    (9, 'teller_eastgate_01', 'teller1.eastgate@unitedfinancial.com', '$2a$10$hashedpassword12345678901234567919', 'Quinn Garcia', 'teller', true, CURRENT_TIMESTAMP, NULL),
    (9, 'teller_eastgate_02', 'teller2.eastgate@unitedfinancial.com', '$2a$10$hashedpassword12345678901234567920', 'Rachel Martinez', 'teller', true, CURRENT_TIMESTAMP, NULL);

-- ****************************************************************************************
-- Insert Customers for Metropolitan Head Bank Branches (4 customers per branch)
-- Branch 1: Metropolitan Downtown Branch
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at)
VALUES
    (1, 'CUST-MHB001-001', 'John', 'Doe', 'john.doe@email.com', '+1-555-300-1001', '1985-03-15', '123 Main Street, Metro City', '123456789012', 'ABCDE1234F', true, '$2a$10$pinhash123456789012345678901', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (1, 'CUST-MHB001-002', 'Jane', 'Smith', 'jane.smith@email.com', '+1-555-300-1002', '1990-07-22', '456 Oak Avenue, Metro City', '123456789013', 'ABCDE1235G', true, '$2a$10$pinhash123456789012345678902', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (1, 'CUST-MHB001-003', 'Robert', 'Johnson', 'robert.johnson@email.com', '+1-555-300-1003', '1982-11-30', '789 Pine Road, Metro City', '123456789014', 'ABCDE1236H', true, '$2a$10$pinhash123456789012345678903', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (1, 'CUST-MHB001-004', 'Sarah', 'Wilson', 'sarah.wilson@email.com', '+1-555-300-1004', '1995-05-18', '321 Elm Street, Metro City', '123456789015', 'ABCDE1237I', true, '$2a$10$pinhash123456789012345678904', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Branch 2: Metropolitan Uptown Branch
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at)
VALUES
    (2, 'CUST-MHB001-005', 'Michael', 'Brown', 'michael.brown@email.com', '+1-555-300-1005', '1988-09-12', '654 Maple Avenue, Metro City', '123456789016', 'ABCDE1238J', true, '$2a$10$pinhash123456789012345678905', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 'CUST-MHB001-006', 'Emily', 'Davis', 'emily.davis@email.com', '+1-555-300-1006', '1992-12-25', '987 Cedar Road, Metro City', '123456789017', 'ABCDE1239K', true, '$2a$10$pinhash123456789012345678906', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 'CUST-MHB001-007', 'David', 'Miller', 'david.miller@email.com', '+1-555-300-1007', '1980-02-14', '147 Birch Lane, Metro City', '123456789018', 'ABCDE1240L', true, '$2a$10$pinhash123456789012345678907', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 'CUST-MHB001-008', 'Lisa', 'Taylor', 'lisa.taylor@email.com', '+1-555-300-1008', '1993-08-08', '258 Walnut Street, Metro City', '123456789019', 'ABCDE1241M', true, '$2a$10$pinhash123456789012345678908', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Branch 3: Metropolitan Suburban Branch
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at)
VALUES
    (3, 'CUST-MHB001-009', 'James', 'Anderson', 'james.anderson@email.com', '+1-555-300-1009', '1975-04-03', '369 Spruce Avenue, Suburbia', '123456789020', 'ABCDE1242N', true, '$2a$10$pinhash123456789012345678909', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, 'CUST-MHB001-010', 'Amanda', 'Thomas', 'amanda.thomas@email.com', '+1-555-300-1010', '1987-06-19', '741 Oak Lane, Suburbia', '123456789021', 'ABCDE1243O', true, '$2a$10$pinhash123456789012345678910', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, 'CUST-MHB001-011', 'Christopher', 'Jackson', 'christopher.jackson@email.com', '+1-555-300-1011', '1991-01-28', '852 Pine Street, Suburbia', '123456789022', 'ABCDE1244P', true, '$2a$10$pinhash123456789012345678911', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, 'CUST-MHB001-012', 'Michelle', 'White', 'michelle.white@email.com', '+1-555-300-1012', '1984-10-11', '963 Maple Road, Suburbia', '123456789023', 'ABCDE1245Q', true, '$2a$10$pinhash123456789012345678912', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Customers for Global Trust Head Bank Branches
-- Branch 4: Global Trust City Center
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at)
VALUES
    (4, 'CUST-GTH002-001', 'Daniel', 'Harris', 'daniel.harris@email.com', '+1-555-300-2001', '1986-03-22', '123 Global Plaza, Global City', '223456789012', 'BCDEF1234G', true, '$2a$10$pinhash123456789012345678913', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (4, 'CUST-GTH002-002', 'Jennifer', 'Clark', 'jennifer.clark@email.com', '+1-555-300-2002', '1994-07-15', '456 International Street, Global City', '223456789013', 'BCDEF1235H', true, '$2a$10$pinhash123456789012345678914', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (4, 'CUST-GTH002-003', 'Kevin', 'Lewis', 'kevin.lewis@email.com', '+1-555-300-2003', '1979-11-08', '789 World Avenue, Global City', '223456789014', 'BCDEF1236I', true, '$2a$10$pinhash123456789012345678915', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (4, 'CUST-GTH002-004', 'Nicole', 'Walker', 'nicole.walker@email.com', '+1-555-300-2004', '1988-05-30', '321 Universe Road, Global City', '223456789015', 'BCDEF1237J', true, '$2a$10$pinhash123456789012345678916', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Branch 5: Global Trust Financial District
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at)
VALUES
    (5, 'CUST-GTH002-005', 'Matthew', 'Hall', 'matthew.hall@email.com', '+1-555-300-2005', '1983-09-14', '654 Finance Street, Global City', '223456789016', 'BCDEF1238K', true, '$2a$10$pinhash123456789012345678917', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (5, 'CUST-GTH002-006', 'Stephanie', 'Allen', 'stephanie.allen@email.com', '+1-555-300-2006', '1996-12-03', '987 Commerce Avenue, Global City', '223456789017', 'BCDEF1239L', true, '$2a$10$pinhash123456789012345678918', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (5, 'CUST-GTH002-007', 'Andrew', 'Young', 'andrew.young@email.com', '+1-555-300-2007', '1977-02-18', '147 Business Lane, Global City', '223456789018', 'BCDEF1240M', true, '$2a$10$pinhash123456789012345678919', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (5, 'CUST-GTH002-008', 'Rebecca', 'King', 'rebecca.king@email.com', '+1-555-300-2008', '1990-08-27', '258 Corporate Road, Global City', '223456789019', 'BCDEF1241N', true, '$2a$10$pinhash123456789012345678920', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Branch 6: Global Trust Harbor Branch
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at)
VALUES
    (6, 'CUST-GTH002-009', 'Joshua', 'Scott', 'joshua.scott@email.com', '+1-555-300-2009', '1989-04-11', '369 Harbor View, Port City', '223456789020', 'BCDEF1242O', true, '$2a$10$pinhash123456789012345678921', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (6, 'CUST-GTH002-010', 'Elizabeth', 'Green', 'elizabeth.green@email.com', '+1-555-300-2010', '1981-06-25', '741 Bay Street, Port City', '223456789021', 'BCDEF1243P', true, '$2a$10$pinhash123456789012345678922', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (6, 'CUST-GTH002-011', 'Ryan', 'Adams', 'ryan.adams@email.com', '+1-555-300-2011', '1993-01-09', '852 Ocean Avenue, Port City', '223456789022', 'BCDEF1244Q', true, '$2a$10$pinhash123456789012345678923', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (6, 'CUST-GTH002-012', 'Samantha', 'Nelson', 'samantha.nelson@email.com', '+1-555-300-2012', '1985-10-22', '963 Marina Road, Port City', '223456789023', 'BCDEF1245R', true, '$2a$10$pinhash123456789012345678924', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Customers for United Financial Head Bank Branches
-- Branch 7: United Financial Main Branch
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at)
VALUES
    (7, 'CUST-UFH003-001', 'Brandon', 'Baker', 'brandon.baker@email.com', '+1-555-300-3001', '1984-03-08', '123 United Square, United City', '323456789012', 'CDEFG1234H', true, '$2a$10$pinhash123456789012345678925', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (7, 'CUST-UFH003-002', 'Lauren', 'Carter', 'lauren.carter@email.com', '+1-555-300-3002', '1991-07-19', '456 Federal Street, United City', '323456789013', 'CDEFG1235I', true, '$2a$10$pinhash123456789012345678926', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (7, 'CUST-UFH003-003', 'Justin', 'Mitchell', 'justin.mitchell@email.com', '+1-555-300-3003', '1978-11-02', '789 National Avenue, United City', '323456789014', 'CDEFG1236J', true, '$2a$10$pinhash123456789012345678927', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (7, 'CUST-UFH003-004', 'Amber', 'Perez', 'amber.perez@email.com', '+1-555-300-3004', '1987-05-14', '321 State Road, United City', '323456789015', 'CDEFG1237K', true, '$2a$10$pinhash123456789012345678928', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Branch 8: United Financial Westside Branch
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at)
VALUES
    (8, 'CUST-UFH003-005', 'Tyler', 'Roberts', 'tyler.roberts@email.com', '+1-555-300-3005', '1982-09-26', '654 Western Avenue, United City', '323456789016', 'CDEFG1238L', true, '$2a$10$pinhash123456789012345678929', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (8, 'CUST-UFH003-006', 'Megan', 'Turner', 'megan.turner@email.com', '+1-555-300-3006', '1995-12-17', '987 Pacific Street, United City', '323456789017', 'CDEFG1239M', true, '$2a$10$pinhash123456789012345678930', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (8, 'CUST-UFH003-007', 'Alexander', 'Phillips', 'alexander.phillips@email.com', '+1-555-300-3007', '1976-02-28', '147 Sunset Boulevard, United City', '323456789018', 'CDEFG1240N', true, '$2a$10$pinhash123456789012345678931', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (8, 'CUST-UFH003-008', 'Victoria', 'Campbell', 'victoria.campbell@email.com', '+1-555-300-3008', '1989-08-05', '258 Mountain View, United City', '323456789019', 'CDEFG1241O', true, '$2a$10$pinhash123456789012345678932', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Branch 9: United Financial Eastgate Branch
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at)
VALUES
    (9, 'CUST-UFH003-009', 'Nathan', 'Parker', 'nathan.parker@email.com', '+1-555-300-3009', '1980-04-13', '369 Eastern Boulevard, Eastgate', '323456789020', 'CDEFG1242P', true, '$2a$10$pinhash123456789012345678933', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (9, 'CUST-UFH003-010', 'Christina', 'Evans', 'christina.evans@email.com', '+1-555-300-3010', '1992-06-29', '741 Sunrise Avenue, Eastgate', '323456789021', 'CDEFG1243Q', true, '$2a$10$pinhash123456789012345678934', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (9, 'CUST-UFH003-011', 'Jonathan', 'Edwards', 'jonathan.edwards@email.com', '+1-555-300-3011', '1983-01-15', '852 River Side, Eastgate', '323456789022', 'CDEFG1244R', true, '$2a$10$pinhash123456789012345678935', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (9, 'CUST-UFH003-012', 'Danielle', 'Collins', 'danielle.collins@email.com', '+1-555-300-3012', '1997-10-07', '963 Lake View, Eastgate', '323456789023', 'CDEFG1245S', true, '$2a$10$pinhash123456789012345678936', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


--**************************************************************************
-- ****************************************************************************************
-- Insert Accounts for Customers (2 accounts per customer - SAVINGS and CURRENT)
-- Customer 1-4: Metropolitan Downtown Branch
INSERT INTO account (customer_id, branch_id, account_number, account_type, current_balance, available_balance, currency, account_holder_type, status, opened_date, created_at, updated_at)
VALUES
    -- Customer 1: John Doe
    (1, 1, 'ACC-MHB001-001-S', 'SAVINGS', 50000.00, 50000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (1, 1, 'ACC-MHB001-001-C', 'CURRENT', 150000.00, 150000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 2: Jane Smith
    (2, 1, 'ACC-MHB001-002-S', 'SAVINGS', 75000.00, 75000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 1, 'ACC-MHB001-002-C', 'CURRENT', 200000.00, 200000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 3: Robert Johnson
    (3, 1, 'ACC-MHB001-003-S', 'SAVINGS', 30000.00, 30000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 4: Sarah Wilson
    (4, 1, 'ACC-MHB001-004-S', 'SAVINGS', 45000.00, 45000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Customer 5-8: Metropolitan Uptown Branch
INSERT INTO account (customer_id, branch_id, account_number, account_type, current_balance, available_balance, currency, account_holder_type, status, opened_date, created_at, updated_at)
VALUES
    -- Customer 5: Michael Brown
    (5, 2, 'ACC-MHB001-005-S', 'SAVINGS', 60000.00, 60000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (5, 2, 'ACC-MHB001-005-C', 'CURRENT', 180000.00, 180000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 6: Emily Davis
    (6, 2, 'ACC-MHB001-006-S', 'SAVINGS', 35000.00, 35000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 7: David Miller
    (7, 2, 'ACC-MHB001-007-S', 'SAVINGS', 80000.00, 80000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (7, 2, 'ACC-MHB001-007-C', 'CURRENT', 250000.00, 250000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 8: Lisa Taylor
    (8, 2, 'ACC-MHB001-008-S', 'SAVINGS', 25000.00, 25000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Customer 9-12: Metropolitan Suburban Branch
INSERT INTO account (customer_id, branch_id, account_number, account_type, current_balance, available_balance, currency, account_holder_type, status, opened_date, created_at, updated_at)
VALUES
    -- Customer 9: James Anderson
    (9, 3, 'ACC-MHB001-009-S', 'SAVINGS', 120000.00, 120000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (9, 3, 'ACC-MHB001-009-C', 'CURRENT', 300000.00, 300000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 10: Amanda Thomas
    (10, 3, 'ACC-MHB001-010-S', 'SAVINGS', 55000.00, 55000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 11: Christopher Jackson
    (11, 3, 'ACC-MHB001-011-S', 'SAVINGS', 40000.00, 40000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (11, 3, 'ACC-MHB001-011-C', 'CURRENT', 120000.00, 120000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 12: Michelle White
    (12, 3, 'ACC-MHB001-012-S', 'SAVINGS', 28000.00, 28000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Customer 13-16: Global Trust City Center Branch
INSERT INTO account (customer_id, branch_id, account_number, account_type, current_balance, available_balance, currency, account_holder_type, status, opened_date, created_at, updated_at)
VALUES
    -- Customer 13: Daniel Harris
    (13, 4, 'ACC-GTH002-001-S', 'SAVINGS', 70000.00, 70000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (13, 4, 'ACC-GTH002-001-C', 'CURRENT', 220000.00, 220000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 14: Jennifer Clark
    (14, 4, 'ACC-GTH002-002-S', 'SAVINGS', 48000.00, 48000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 15: Kevin Lewis
    (15, 4, 'ACC-GTH002-003-S', 'SAVINGS', 95000.00, 95000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (15, 4, 'ACC-GTH002-003-C', 'CURRENT', 280000.00, 280000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 16: Nicole Walker
    (16, 4, 'ACC-GTH002-004-S', 'SAVINGS', 32000.00, 32000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Customer 17-20: Global Trust Financial District Branch
INSERT INTO account (customer_id, branch_id, account_number, account_type, current_balance, available_balance, currency, account_holder_type, status, opened_date, created_at, updated_at)
VALUES
    -- Customer 17: Matthew Hall
    (17, 5, 'ACC-GTH002-005-S', 'SAVINGS', 85000.00, 85000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (17, 5, 'ACC-GTH002-005-C', 'CURRENT', 190000.00, 190000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 18: Stephanie Allen
    (18, 5, 'ACC-GTH002-006-S', 'SAVINGS', 42000.00, 42000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 19: Andrew Young
    (19, 5, 'ACC-GTH002-007-S', 'SAVINGS', 110000.00, 110000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (19, 5, 'ACC-GTH002-007-C', 'CURRENT', 320000.00, 320000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 20: Rebecca King
    (20, 5, 'ACC-GTH002-008-S', 'SAVINGS', 38000.00, 38000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Customer 21-24: Global Trust Harbor Branch
INSERT INTO account (customer_id, branch_id, account_number, account_type, current_balance, available_balance, currency, account_holder_type, status, opened_date, created_at, updated_at)
VALUES
    -- Customer 21: Joshua Scott
    (21, 6, 'ACC-GTH002-009-S', 'SAVINGS', 67000.00, 67000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (21, 6, 'ACC-GTH002-009-C', 'CURRENT', 210000.00, 210000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 22: Elizabeth Green
    (22, 6, 'ACC-GTH002-010-S', 'SAVINGS', 52000.00, 52000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 23: Ryan Adams
    (23, 6, 'ACC-GTH002-011-S', 'SAVINGS', 78000.00, 78000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (23, 6, 'ACC-GTH002-011-C', 'CURRENT', 240000.00, 240000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 24: Samantha Nelson
    (24, 6, 'ACC-GTH002-012-S', 'SAVINGS', 29000.00, 29000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Customer 25-28: United Financial Main Branch
INSERT INTO account (customer_id, branch_id, account_number, account_type, current_balance, available_balance, currency, account_holder_type, status, opened_date, created_at, updated_at)
VALUES
    -- Customer 25: Brandon Baker
    (25, 7, 'ACC-UFH003-001-S', 'SAVINGS', 88000.00, 88000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (25, 7, 'ACC-UFH003-001-C', 'CURRENT', 260000.00, 260000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 26: Lauren Carter
    (26, 7, 'ACC-UFH003-002-S', 'SAVINGS', 46000.00, 46000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 27: Justin Mitchell
    (27, 7, 'ACC-UFH003-003-S', 'SAVINGS', 125000.00, 125000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (27, 7, 'ACC-UFH003-003-C', 'CURRENT', 350000.00, 350000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 28: Amber Perez
    (28, 7, 'ACC-UFH003-004-S', 'SAVINGS', 34000.00, 34000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Customer 29-32: United Financial Westside Branch
INSERT INTO account (customer_id, branch_id, account_number, account_type, current_balance, available_balance, currency, account_holder_type, status, opened_date, created_at, updated_at)
VALUES
    -- Customer 29: Tyler Roberts
    (29, 8, 'ACC-UFH003-005-S', 'SAVINGS', 72000.00, 72000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (29, 8, 'ACC-UFH003-005-C', 'CURRENT', 230000.00, 230000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 30: Megan Turner
    (30, 8, 'ACC-UFH003-006-S', 'SAVINGS', 39000.00, 39000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 31: Alexander Phillips
    (31, 8, 'ACC-UFH003-007-S', 'SAVINGS', 98000.00, 98000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (31, 8, 'ACC-UFH003-007-C', 'CURRENT', 290000.00, 290000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 32: Victoria Campbell
    (32, 8, 'ACC-UFH003-008-S', 'SAVINGS', 41000.00, 41000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Customer 33-36: United Financial Eastgate Branch
INSERT INTO account (customer_id, branch_id, account_number, account_type, current_balance, available_balance, currency, account_holder_type, status, opened_date, created_at, updated_at)
VALUES
    -- Customer 33: Nathan Parker
    (33, 9, 'ACC-UFH003-009-S', 'SAVINGS', 63000.00, 63000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (33, 9, 'ACC-UFH003-009-C', 'CURRENT', 270000.00, 270000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 34: Christina Evans
    (34, 9, 'ACC-UFH003-010-S', 'SAVINGS', 54000.00, 54000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 35: Jonathan Edwards
    (35, 9, 'ACC-UFH003-011-S', 'SAVINGS', 89000.00, 89000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (35, 9, 'ACC-UFH003-011-C', 'CURRENT', 310000.00, 310000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Customer 36: Danielle Collins
    (36, 9, 'ACC-UFH003-012-S', 'SAVINGS', 37000.00, 37000.00, 'INR', 'CUSTOMER', 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ****************************************************************************************
-- Insert Loan Applications for Different Customers
-- PENDING Loan Applications
INSERT INTO loan_application (customer_id, loan_offer_id, requested_amount, requested_tenure_months, purpose, status, created_at, updated_at)
VALUES
    -- Metropolitan Bank Customers
    (1, 1, 25000.00, 24, 'Home renovation', 'PENDING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, 3, 35000.00, 36, 'Car purchase', 'PENDING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (5, 1, 15000.00, 18, 'Personal expenses', 'PENDING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Global Trust Bank Customers
    (13, 4, 45000.00, 48, 'Business expansion', 'PENDING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (15, 6, 200000.00, 240, 'House construction', 'PENDING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (17, 5, 75000.00, 60, 'Higher education', 'PENDING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- United Financial Bank Customers
    (25, 7, 12000.00, 12, 'Emergency expenses', 'PENDING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (27, 9, 50000.00, 48, 'Professional certification', 'PENDING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (29, 8, 45000.00, 36, 'Vehicle upgrade', 'PENDING', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- APPROVED Loan Applications
INSERT INTO loan_application (customer_id, loan_offer_id, requested_amount, requested_tenure_months, purpose, status, approved_by, approved_amount, approved_tenure_months, approved_at, created_at, updated_at)
VALUES
    -- Metropolitan Bank - Approved by Branch Manager 1
    (2, 2, 300000.00, 180, 'New house purchase', 'APPROVED', 1, 280000.00, 180, CURRENT_TIMESTAMP, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 10 DAY), CURRENT_TIMESTAMP),
    (4, 1, 20000.00, 24, 'Wedding expenses', 'APPROVED', 1, 20000.00, 24, CURRENT_TIMESTAMP, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 8 DAY), CURRENT_TIMESTAMP),

    -- Global Trust Bank - Approved by Branch Manager 4
    (14, 4, 60000.00, 36, 'Medical treatment', 'APPROVED', 4, 60000.00, 36, CURRENT_TIMESTAMP, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 15 DAY), CURRENT_TIMESTAMP),
    (16, 5, 100000.00, 72, 'Masters degree', 'APPROVED', 4, 100000.00, 72, CURRENT_TIMESTAMP, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 12 DAY), CURRENT_TIMESTAMP),

    -- United Financial Bank - Approved by Branch Manager 7
    (26, 7, 18000.00, 18, 'Home appliances', 'APPROVED', 7, 18000.00, 18, CURRENT_TIMESTAMP, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 7 DAY), CURRENT_TIMESTAMP),
    (28, 8, 60000.00, 48, 'Car loan', 'APPROVED', 7, 60000.00, 48, CURRENT_TIMESTAMP, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 5 DAY), CURRENT_TIMESTAMP);

-- REJECTED Loan Applications
INSERT INTO loan_application (customer_id, loan_offer_id, requested_amount, requested_tenure_months, purpose, status, approved_by, rejection_reason, created_at, updated_at)
VALUES
    -- Metropolitan Bank - Rejected by Branch Manager 2
    (6, 1, 50000.00, 60, 'Vacation', 'REJECTED', 2, 'Loan amount exceeds eligibility criteria based on income', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 20 DAY), CURRENT_TIMESTAMP),
    (8, 3, 80000.00, 60, 'Luxury car', 'REJECTED', 2, 'Insufficient credit score for requested amount', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 18 DAY), CURRENT_TIMESTAMP),

    -- Global Trust Bank - Rejected by Branch Manager 5
    (18, 4, 80000.00, 48, 'Business startup', 'REJECTED', 5, 'High risk business category', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 25 DAY), CURRENT_TIMESTAMP),
    (20, 6, 500000.00, 300, 'Commercial property', 'REJECTED', 5, 'Requested amount exceeds maximum limit for residential property', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 22 DAY), CURRENT_TIMESTAMP),

    -- United Financial Bank - Rejected by Branch Manager 8
    (30, 7, 25000.00, 24, 'Debt consolidation', 'REJECTED', 8, 'Existing loan obligations too high', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 14 DAY), CURRENT_TIMESTAMP),
    (32, 9, 120000.00, 84, 'Overseas education', 'REJECTED', 8, 'Institution not in approved list', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 16 DAY), CURRENT_TIMESTAMP);

-- Mixed status applications for remaining customers
INSERT INTO loan_application (customer_id, loan_offer_id, requested_amount, requested_tenure_months, purpose, status, created_at, updated_at)
VALUES
    -- More PENDING applications
    (7, 2, 180000.00, 120, 'Plot purchase', 'PENDING', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY), CURRENT_TIMESTAMP),
    (9, 1, 30000.00, 36, 'Home furniture', 'PENDING', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY), CURRENT_TIMESTAMP),
    (19, 4, 55000.00, 42, 'Medical emergency', 'PENDING', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 4 DAY), CURRENT_TIMESTAMP),
    (21, 5, 80000.00, 60, 'Engineering degree', 'PENDING', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY), CURRENT_TIMESTAMP),
    (31, 8, 35000.00, 30, 'Motorcycle purchase', 'PENDING', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 6 DAY), CURRENT_TIMESTAMP),
    (33, 7, 15000.00, 12, 'Short term needs', 'PENDING', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 5 DAY), CURRENT_TIMESTAMP);


--****************************************************************************************
-- ****************************************************************************************
-- Insert Card Requests (Mix of PENDING, APPROVED, REJECTED, ISSUED)
INSERT INTO card_request (requested_by, account_id, card_type, status, processed_by, rejection_reason, created_at, processed_at)
VALUES
    -- PENDING Card Requests
    (1, 1, 'Standard Debit Card', 'PENDING', NULL, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 5 DAY), NULL),
    (3, 5, 'Premium Debit Card', 'PENDING', NULL, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY), NULL),
    (5, 7, 'Platinum Debit Card', 'PENDING', NULL, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY), NULL),
    (13, 19, 'Basic Debit Card', 'PENDING', NULL, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 4 DAY), NULL),
    (15, 22, 'Gold Debit Card', 'PENDING', NULL, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY), NULL),
    (25, 37, 'Student Debit Card', 'PENDING', NULL, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 6 DAY), NULL),
    (27, 40, 'Everyday Debit Card', 'PENDING', NULL, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY), NULL),
    (29, 43, 'Elite Debit Card', 'PENDING', NULL, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY), NULL),

    -- APPROVED Card Requests (ready for issuance)
    (2, 3, 'Premium Debit Card', 'APPROVED', 1, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 10 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY)),
    (4, 6, 'Standard Debit Card', 'APPROVED', 1, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 8 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY)),
    (14, 21, 'Gold Debit Card', 'APPROVED', 7, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 12 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY)),
    (16, 24, 'Basic Debit Card', 'APPROVED', 7, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 9 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY)),
    (26, 39, 'Everyday Debit Card', 'APPROVED', 13, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 7 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY)),
    (28, 42, 'Student Debit Card', 'APPROVED', 13, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 5 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY)),

    -- REJECTED Card Requests
    (6, 9, 'Platinum Debit Card', 'REJECTED', 2, 'Account balance too low for Platinum card eligibility', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 15 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 10 DAY)),
    (8, 12, 'Premium Debit Card', 'REJECTED', 2, 'Customer requested card type not available for SAVINGS account', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 12 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 8 DAY)),
    (18, 27, 'World Debit Card', 'REJECTED', 8, 'International usage not allowed for this account type', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 18 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 12 DAY)),
    (20, 30, 'Gold Debit Card', 'REJECTED', 8, 'Minimum balance requirement not met', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 14 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 9 DAY)),
    (30, 45, 'Elite Debit Card', 'REJECTED', 15, 'Account too new for premium card issuance', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 11 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 6 DAY)),
    (32, 48, 'Premium Debit Card', 'REJECTED', 15, 'Multiple card requests pending verification', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 9 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 4 DAY)),

    -- ISSUED Card Requests (already processed and cards issued)
    (7, 10, 'Standard Debit Card', 'ISSUED', 3, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 20 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 15 DAY)),
    (9, 13, 'Premium Debit Card', 'ISSUED', 3, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 18 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 13 DAY)),
    (19, 28, 'Gold Debit Card', 'ISSUED', 9, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 16 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 11 DAY)),
    (21, 31, 'Basic Debit Card', 'ISSUED', 9, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 14 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 9 DAY)),
    (31, 46, 'Everyday Debit Card', 'ISSUED', 16, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 12 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 7 DAY)),
    (33, 49, 'Student Debit Card', 'ISSUED', 16, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 10 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 5 DAY));

-- ****************************************************************************************
-- Insert Cheque Book Requests (Mix of PENDING, APPROVED, REJECTED, ISSUED)
INSERT INTO cheque_book_request (requested_by, account_id, number_of_leaves, status, processed_by, rejection_reason, created_at, processed_at)
VALUES
    -- PENDING Cheque Book Requests
    (2, 4, 50, 'PENDING', NULL, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 4 DAY), NULL),
    (4, 6, 25, 'PENDING', NULL, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY), NULL),
    (6, 9, 100, 'PENDING', NULL, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 5 DAY), NULL),
    (14, 21, 50, 'PENDING', NULL, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY), NULL),
    (16, 24, 25, 'PENDING', NULL, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 6 DAY), NULL),
    (26, 39, 100, 'PENDING', NULL, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY), NULL),
    (28, 42, 50, 'PENDING', NULL, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY), NULL),
    (30, 45, 25, 'PENDING', NULL, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY), NULL),

    -- APPROVED Cheque Book Requests
    (1, 2, 50, 'APPROVED', 1, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 12 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 5 DAY)),
    (3, 5, 25, 'APPROVED', 1, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 10 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY)),
    (13, 20, 100, 'APPROVED', 7, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 15 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 8 DAY)),
    (15, 23, 50, 'APPROVED', 7, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 8 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY)),
    (25, 38, 25, 'APPROVED', 13, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 9 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 4 DAY)),
    (27, 41, 100, 'APPROVED', 13, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 7 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY)),

    -- REJECTED Cheque Book Requests
    (5, 8, 100, 'REJECTED', 2, 'CURRENT account already has active cheque book', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 20 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 15 DAY)),
    (7, 11, 50, 'REJECTED', 2, 'Account has insufficient transaction history', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 18 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 12 DAY)),
    (17, 26, 25, 'REJECTED', 8, 'Maximum cheque book limit reached for this account', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 16 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 10 DAY)),
    (19, 29, 100, 'REJECTED', 8, 'Account under review - cannot issue cheque book', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 14 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 8 DAY)),
    (29, 44, 50, 'REJECTED', 15, 'Recent cheque bounce history', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 11 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 6 DAY)),
    (31, 47, 25, 'REJECTED', 15, 'Account balance below minimum requirement', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 9 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 4 DAY)),

    -- ISSUED Cheque Book Requests
    (8, 12, 25, 'ISSUED', 3, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 25 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 20 DAY)),
    (10, 15, 50, 'ISSUED', 3, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 22 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 17 DAY)),
    (18, 27, 100, 'ISSUED', 9, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 20 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 15 DAY)),
    (20, 30, 50, 'ISSUED', 9, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 18 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 13 DAY)),
    (32, 48, 25, 'ISSUED', 16, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 16 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 11 DAY)),
    (34, 51, 100, 'ISSUED', 16, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 14 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 9 DAY));

-- ****************************************************************************************
-- Insert Cheque Books (for ISSUED cheque book requests)
INSERT INTO cheque_book (account_id, cheque_book_number, starting_cheque_number, number_of_leaves, leaves_used, is_active, issued_date, created_at)
VALUES
    -- For ISSUED cheque book requests
    (12, 'CHQ-MHB001-001', 100001, 25, 3, true, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 20 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 20 DAY)),
    (15, 'CHQ-MHB001-002', 100026, 50, 12, true, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 17 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 17 DAY)),
    (27, 'CHQ-GTH002-001', 200001, 100, 25, true, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 15 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 15 DAY)),
    (30, 'CHQ-GTH002-002', 200101, 50, 8, true, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 13 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 13 DAY)),
    (48, 'CHQ-UFH003-001', 300001, 25, 0, true, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 11 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 11 DAY)),
    (51, 'CHQ-UFH003-002', 300026, 100, 15, true, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 9 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 9 DAY)),

    -- Additional cheque books for accounts with APPROVED requests
    (2, 'CHQ-MHB001-003', 100076, 50, 0, true, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 5 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 5 DAY)),
    (5, 'CHQ-MHB001-004', 100126, 25, 0, true, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY)),
    (20, 'CHQ-GTH002-003', 200151, 100, 0, true, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 8 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 8 DAY)),
    (23, 'CHQ-GTH002-004', 200251, 50, 0, true, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY)),
    (38, 'CHQ-UFH003-003', 300126, 25, 0, true, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 4 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 4 DAY)),
    (41, 'CHQ-UFH003-004', 300151, 100, 0, true, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY));

-- ****************************************************************************************
-- Insert Debit Cards (for ISSUED card requests)
INSERT INTO debit_card (account_id, card_rules_id, card_number, cvv, expiry_date, is_active, is_blocked, blocked_at, created_at)
VALUES
    -- Metropolitan Bank Cards
    (10, 1, '4111111111111001', '123', DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 YEAR), true, false, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 15 DAY)),
    (13, 2, '4111111111111002', '456', DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 YEAR), true, false, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 13 DAY)),

    -- Global Trust Bank Cards
    (28, 5, '5111111111112001', '789', DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 YEAR), true, false, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 11 DAY)),
    (31, 4, '5111111111112002', '321', DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 YEAR), true, false, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 9 DAY)),

    -- United Financial Bank Cards
    (46, 8, '6111111111113001', '654', DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 YEAR), true, false, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 7 DAY)),
    (49, 7, '6111111111113002', '987', DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 YEAR), true, false, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 5 DAY)),

    -- Additional cards for APPROVED requests
    (3, 2, '4111111111111003', '234', DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 YEAR), true, false, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY)),
    (6, 1, '4111111111111004', '567', DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 YEAR), true, false, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY)),
    (21, 5, '5111111111112003', '890', DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 YEAR), true, false, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY)),
    (24, 4, '5111111111112004', '432', DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 YEAR), true, false, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY)),
    (39, 8, '6111111111113003', '765', DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 YEAR), true, false, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY)),
    (42, 7, '6111111111113004', '098', DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 YEAR), true, false, NULL, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY)),

    -- One blocked card for demonstration
    (10, 1, '4111111111111999', '999', DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 YEAR), true, true, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 5 DAY), DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 30 DAY));


-- ****************************************************************************************
-- Insert Account Requests (Mix of PENDING, APPROVED, REJECTED, ISSUED)
INSERT INTO account_request (customer_id, account_type, initial_deposit, status, rejection_reason, created_at, processed_at)
VALUES
    -- PENDING Account Requests
    (1, 'CURRENT', 50000.00, 'PENDING', NULL, CURRENT_TIMESTAMP, NULL),
    (3, 'SAVINGS', 25000.00, 'PENDING', NULL, CURRENT_TIMESTAMP, NULL),
    (5, 'CURRENT', 75000.00, 'PENDING', NULL, CURRENT_TIMESTAMP, NULL),
    (13, 'SAVINGS', 30000.00, 'PENDING', NULL, CURRENT_TIMESTAMP, NULL),
    (15, 'CURRENT', 100000.00, 'PENDING', NULL, CURRENT_TIMESTAMP, NULL),
    (25, 'SAVINGS', 20000.00, 'PENDING', NULL, CURRENT_TIMESTAMP, NULL),
    (27, 'CURRENT', 80000.00, 'PENDING', NULL, CURRENT_TIMESTAMP, NULL),
    (29, 'SAVINGS', 35000.00, 'PENDING', NULL, CURRENT_TIMESTAMP, NULL),

    -- APPROVED Account Requests
    (2, 'CURRENT', 100000.00, 'APPROVED', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (4, 'SAVINGS', 40000.00, 'APPROVED', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (14, 'CURRENT', 120000.00, 'APPROVED', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (16, 'SAVINGS', 35000.00, 'APPROVED', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (26, 'CURRENT', 90000.00, 'APPROVED', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (28, 'SAVINGS', 45000.00, 'APPROVED', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- REJECTED Account Requests
    (6, 'CURRENT', 20000.00, 'REJECTED', 'Insufficient initial deposit for CURRENT account', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (8, 'SAVINGS', 5000.00, 'REJECTED', 'Minimum balance requirement not met', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (18, 'CURRENT', 150000.00, 'REJECTED', 'Document verification failed', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (20, 'SAVINGS', 25000.00, 'REJECTED', 'KYC documents incomplete', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (30, 'CURRENT', 60000.00, 'REJECTED', 'Existing account limit reached', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (32, 'SAVINGS', 15000.00, 'REJECTED', 'Address verification pending', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- ISSUED Account Requests
    (7, 'CURRENT', 80000.00, 'ISSUED', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (9, 'SAVINGS', 50000.00, 'ISSUED', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (19, 'CURRENT', 110000.00, 'ISSUED', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (21, 'SAVINGS', 40000.00, 'ISSUED', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (31, 'CURRENT', 95000.00, 'ISSUED', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (33, 'SAVINGS', 30000.00, 'ISSUED', NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ****************************************************************************************
-- Insert Loan Accounts (linking to existing CURRENT accounts)
INSERT INTO loan_account (account_id, loan_offer_id, loan_amount, disbursed_amount, outstanding_balance, interest_rate, tenure_months, start_date, end_date, status, emi_amount, next_emi_date, created_at, updated_at)
VALUES
    -- Metropolitan Bank Loan Accounts (using existing CURRENT accounts)
    (2, 2, 280000.00, 280000.00, 275000.00, 6.75, 180, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 180 MONTH), 'ACTIVE', 2450.00, DATE_ADD(CURRENT_DATE, INTERVAL 15 DAY), CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (4, 1, 20000.00, 20000.00, 19500.00, 8.50, 24, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 24 MONTH), 'ACTIVE', 950.00, DATE_ADD(CURRENT_DATE, INTERVAL 10 DAY), CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- Global Trust Bank Loan Accounts (using existing CURRENT accounts)
    (20, 4, 60000.00, 60000.00, 59000.00, 9.00, 36, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 36 MONTH), 'ACTIVE', 1900.00, DATE_ADD(CURRENT_DATE, INTERVAL 5 DAY), CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (23, 5, 100000.00, 100000.00, 98000.00, 5.50, 72, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 72 MONTH), 'ACTIVE', 1550.00, DATE_ADD(CURRENT_DATE, INTERVAL 12 DAY), CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- United Financial Bank Loan Accounts (using existing CURRENT accounts)
    (38, 7, 18000.00, 18000.00, 17500.00, 10.50, 18, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 18 MONTH), 'ACTIVE', 1050.00, DATE_ADD(CURRENT_DATE, INTERVAL 8 DAY), CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (41, 8, 60000.00, 60000.00, 59000.00, 8.75, 48, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 48 MONTH), 'ACTIVE', 1450.00, DATE_ADD(CURRENT_DATE, INTERVAL 20 DAY), CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


--********************************************
-- ****************************************************************************************
-- Insert Sample Transactions with Charges
-- ****************************************************************************************

-- TRANSFER Transactions (Between different accounts)
INSERT INTO transactions (from_account_id, to_account_id, transaction_type, amount, currency, description, transaction_reference, total_charges, status, fee_amount, net_amount, transaction_date, created_at)
VALUES
    -- Transfer within same branch (Metropolitan Downtown)
    (1, 3, 'TRANSFER', 5000.00, 'INR', 'Fund transfer to Jane Smith', 'TXN-MHB001-001', 17.50, 'COMPLETED', 17.50, 4982.50, '2025-11-06 10:15:30', '2025-11-06 10:15:30'),
    (3, 1, 'TRANSFER', 3000.00, 'INR', 'Repayment from Jane Smith', 'TXN-MHB001-002', 12.50, 'COMPLETED', 12.50, 2987.50, '2025-11-06 14:20:15', '2025-11-06 14:20:15'),

    -- Transfer between different head banks
    (1, 19, 'TRANSFER', 10000.00, 'INR', 'Business payment to Global Trust', 'TXN-MHB001-003', 45.00, 'COMPLETED', 45.00, 9955.00, '2025-11-06 16:45:00', '2025-11-06 16:45:00'),
    (19, 37, 'TRANSFER', 15000.00, 'INR', 'Vendor payment to United Financial', 'TXN-GTH002-001', 52.50, 'COMPLETED', 52.50, 14947.50, '2025-11-07 09:30:00', '2025-11-07 09:30:00'),

    -- Large value transfers
    (2, 4, 'TRANSFER', 50000.00, 'INR', 'Business fund transfer', 'TXN-MHB001-004', 125.00, 'COMPLETED', 125.00, 49875.00, '2025-11-07 11:20:45', '2025-11-07 11:20:45'),
    (20, 23, 'TRANSFER', 75000.00, 'INR', 'Corporate transfer', 'TXN-GTH002-002', 187.50, 'COMPLETED', 187.50, 74812.50, '2025-11-07 14:35:20', '2025-11-07 14:35:20'),

    -- Small value transfers
    (5, 6, 'TRANSFER', 1000.00, 'INR', 'Personal transfer', 'TXN-MHB001-005', 8.50, 'COMPLETED', 8.50, 991.50, '2025-11-08 08:15:00', '2025-11-08 08:15:00'),
    (21, 22, 'TRANSFER', 2000.00, 'INR', 'Friend payment', 'TXN-GTH002-003', 11.00, 'COMPLETED', 11.00, 1989.00, '2025-11-08 10:45:30', '2025-11-08 10:45:30');

-- WITHDRAWAL Transactions
INSERT INTO transactions (from_account_id, to_account_id, transaction_type, amount, currency, description, transaction_reference, total_charges, status, fee_amount, net_amount, transaction_date, created_at)
VALUES
    -- ATM Withdrawals
    (1, NULL, 'WITHDRAWAL', 5000.00, 'INR', 'ATM Cash withdrawal', 'TXN-MHB001-006', 15.00, 'COMPLETED', 15.00, 4985.00, '2025-11-06 12:30:00', '2025-11-06 12:30:00'),
    (3, NULL, 'WITHDRAWAL', 3000.00, 'INR', 'ATM Withdrawal - Shopping', 'TXN-MHB001-007', 10.00, 'COMPLETED', 10.00, 2990.00, '2025-11-07 15:45:00', '2025-11-07 15:45:00'),
    (19, NULL, 'WITHDRAWAL', 10000.00, 'INR', 'ATM Cash withdrawal', 'TXN-GTH002-004', 25.00, 'COMPLETED', 25.00, 9975.00, '2025-11-08 11:20:00', '2025-11-08 11:20:00'),

    -- Branch counter withdrawals
    (2, NULL, 'WITHDRAWAL', 25000.00, 'INR', 'Counter withdrawal - Business', 'TXN-MHB001-008', 35.00, 'COMPLETED', 35.00, 24965.00, '2025-11-07 10:15:00', '2025-11-07 10:15:00'),
    (20, NULL, 'WITHDRAWAL', 15000.00, 'INR', 'Counter withdrawal', 'TXN-GTH002-005', 27.50, 'COMPLETED', 27.50, 14972.50, '2025-11-08 14:30:00', '2025-11-08 14:30:00');

-- DEPOSIT Transactions
INSERT INTO transactions (from_account_id, to_account_id, transaction_type, amount, currency, description, transaction_reference, total_charges, status, fee_amount, net_amount, transaction_date, created_at)
VALUES
    -- Cash deposits
    (NULL, 1, 'DEPOSIT', 20000.00, 'INR', 'Cash deposit - Business', 'TXN-MHB001-009', 12.50, 'COMPLETED', 12.50, 19887.50, '2025-11-06 09:15:00', '2025-11-06 09:15:00'),
    (NULL, 3, 'DEPOSIT', 15000.00, 'INR', 'Cash deposit - Salary', 'TXN-MHB001-010', 10.00, 'COMPLETED', 10.00, 14990.00, '2025-11-07 16:20:00', '2025-11-07 16:20:00'),
    (NULL, 19, 'DEPOSIT', 30000.00, 'INR', 'Cash deposit - Business', 'TXN-GTH002-006', 18.75, 'COMPLETED', 18.75, 29981.25, '2025-11-08 13:45:00', '2025-11-08 13:45:00'),

    -- Check deposits
    (NULL, 2, 'DEPOSIT', 50000.00, 'INR', 'Check deposit - Client payment', 'TXN-MHB001-011', 22.50, 'COMPLETED', 22.50, 49977.50, '2025-11-07 11:30:00', '2025-11-07 11:30:00'),
    (NULL, 20, 'DEPOSIT', 25000.00, 'INR', 'Check deposit', 'TXN-GTH002-007', 15.00, 'COMPLETED', 15.00, 24985.00, '2025-11-08 15:20:00', '2025-11-08 15:20:00');

-- BILL_PAYMENT Transactions
INSERT INTO transactions (from_account_id, to_account_id, transaction_type, amount, currency, description, transaction_reference, total_charges, status, fee_amount, net_amount, transaction_date, created_at)
VALUES
    -- Utility bill payments
    (1, NULL, 'BILL_PAYMENT', 2500.00, 'INR', 'Electricity bill payment', 'TXN-MHB001-012', 8.50, 'COMPLETED', 8.50, 2491.50, '2025-11-06 17:30:00', '2025-11-06 17:30:00'),
    (3, NULL, 'BILL_PAYMENT', 1800.00, 'INR', 'Water bill payment', 'TXN-MHB001-013', 7.25, 'COMPLETED', 7.25, 1792.75, '2025-11-07 18:15:00', '2025-11-07 18:15:00'),
    (19, NULL, 'BILL_PAYMENT', 3500.00, 'INR', 'Internet bill payment', 'TXN-GTH002-008', 11.50, 'COMPLETED', 11.50, 3488.50, '2025-11-08 16:45:00', '2025-11-08 16:45:00'),

    -- Credit card payments
    (2, NULL, 'BILL_PAYMENT', 15000.00, 'INR', 'Credit card payment', 'TXN-MHB001-014', 25.00, 'COMPLETED', 25.00, 14975.00, '2025-11-07 19:20:00', '2025-11-07 19:20:00'),
    (20, NULL, 'BILL_PAYMENT', 12000.00, 'INR', 'Credit card payment', 'TXN-GTH002-009', 20.00, 'COMPLETED', 20.00, 11980.00, '2025-11-08 17:30:00', '2025-11-08 17:30:00');

-- LOAN_REPAYMENT Transactions
INSERT INTO transactions (from_account_id, to_account_id, transaction_type, amount, currency, description, transaction_reference, total_charges, status, fee_amount, net_amount, transaction_date, created_at)
VALUES
    -- Loan EMI payments
    (1, NULL, 'LOAN_REPAYMENT', 2450.00, 'INR', 'Home loan EMI payment', 'TXN-MHB001-015', 12.25, 'COMPLETED', 12.25, 2437.75, '2025-11-06 10:00:00', '2025-11-06 10:00:00'),
    (3, NULL, 'LOAN_REPAYMENT', 950.00, 'INR', 'Personal loan EMI', 'TXN-MHB001-016', 8.50, 'COMPLETED', 8.50, 941.50, '2025-11-07 10:00:00', '2025-11-07 10:00:00'),
    (19, NULL, 'LOAN_REPAYMENT', 1900.00, 'INR', 'Business loan EMI', 'TXN-GTH002-010', 10.75, 'COMPLETED', 10.75, 1889.25, '2025-11-08 10:00:00', '2025-11-08 10:00:00');

-- PENDING and FAILED Transactions for demonstration
INSERT INTO transactions (from_account_id, to_account_id, transaction_type, amount, currency, description, transaction_reference, total_charges, status, fee_amount, net_amount, transaction_date, created_at)
VALUES
    -- Pending transactions
    (1, 5, 'TRANSFER', 8000.00, 'INR', 'Pending transfer', 'TXN-MHB001-017', 20.00, 'PENDING', 20.00, 7980.00, '2025-11-09 09:00:00', '2025-11-09 09:00:00'),
    (19, 21, 'TRANSFER', 12000.00, 'INR', 'Pending business transfer', 'TXN-GTH002-011', 30.00, 'PENDING', 30.00, 11970.00, '2025-11-09 10:30:00', '2025-11-09 10:30:00'),

    -- Failed transactions
    (3, NULL, 'WITHDRAWAL', 20000.00, 'INR', 'Failed withdrawal - Limit exceeded', 'TXN-MHB001-018', 0.00, 'FAILED', 0.00, 20000.00, '2025-11-09 11:45:00', '2025-11-09 11:45:00'),
    (20, NULL, 'TRANSFER', 50000.00, 'INR', 'Failed transfer - Insufficient funds', 'TXN-GTH002-012', 0.00, 'FAILED', 0.00, 50000.00, '2025-11-09 14:20:00', '2025-11-09 14:20:00');

-- ****************************************************************************************
-- Insert Charges for Transactions
-- ****************************************************************************************

-- Charges for TRANSFER transactions
INSERT INTO charges (transaction_id, fee_name, bank_type, charged_amount, bank_id, created_at)
VALUES
    -- Transfer TXN-MHB001-001 (5000 INR)
    (1, 'Metro Transfer Fee - Domestic', 'HEAD_BANK', 1.50, 1, '2025-11-06 10:15:30'),
    (1, 'Central Processing Fee', 'CENTRAL_BANK', 1.00, 1, '2025-11-06 10:15:30'),
    (1, 'Branch Counter Service Fee', 'BANK_BRANCH', 15.00, 1, '2025-11-06 10:15:30'),

    -- Transfer TXN-MHB001-003 (10000 INR - Inter-bank)
    (3, 'Metro Transfer Fee - International', 'HEAD_BANK', 15.00, 1, '2025-11-06 16:45:00'),
    (3, 'Inter-Bank Transfer Fee', 'CENTRAL_BANK', 2.50, 1, '2025-11-06 16:45:00'),
    (3, 'Cross Border Fee', 'CENTRAL_BANK', 2.50, 1, '2025-11-06 16:45:00'),
    (3, 'Branch Processing Fee', 'BANK_BRANCH', 25.00, 1, '2025-11-06 16:45:00'),

    -- Transfer TXN-GTH002-001 (15000 INR - Inter-bank)
    (4, 'Global Transfer Fee - Express', 'HEAD_BANK', 5.00, 2, '2025-11-07 09:30:00'),
    (4, 'Inter-Bank Transfer Fee', 'CENTRAL_BANK', 2.50, 1, '2025-11-07 09:30:00'),
    (4, 'Foreign Currency Fee', 'HEAD_BANK', 45.00, 2, '2025-11-07 09:30:00'),

    -- Large Transfer TXN-MHB001-004 (50000 INR)
    (5, 'Metro Transfer Fee - Domestic', 'HEAD_BANK', 1.50, 1, '2025-11-07 11:20:45'),
    (5, 'Large Transfer Surcharge', 'CENTRAL_BANK', 50.00, 1, '2025-11-07 11:20:45'),
    (5, 'Branch Counter Service Fee', 'BANK_BRANCH', 73.50, 1, '2025-11-07 11:20:45'),

    -- Small Transfer TXN-MHB001-005 (1000 INR)
    (7, 'Small Transfer Fee', 'HEAD_BANK', 0.25, 2, '2025-11-08 08:15:00'),
    (7, 'Micro Transaction Fee', 'CENTRAL_BANK', 0.10, 1, '2025-11-08 08:15:00'),
    (7, 'Branch Processing Fee', 'BANK_BRANCH', 8.15, 1, '2025-11-08 08:15:00');

-- Charges for WITHDRAWAL transactions
INSERT INTO charges (transaction_id, fee_name, bank_type, charged_amount, bank_id, created_at)
VALUES
    -- Withdrawal TXN-MHB001-006 (5000 INR - ATM)
    (9, 'Metro Withdrawal Fee - Other ATM', 'HEAD_BANK', 2.00, 1, '2025-11-06 12:30:00'),
    (9, 'Central Bank Withdrawal Fee', 'CENTRAL_BANK', 0.25, 1, '2025-11-06 12:30:00'),
    (9, 'Branch Cash Withdrawal Fee', 'BANK_BRANCH', 12.75, 1, '2025-11-06 12:30:00'),

    -- Withdrawal TXN-MHB001-008 (25000 INR - Counter)
    (12, 'Metro Withdrawal Fee - Other ATM', 'HEAD_BANK', 2.00, 1, '2025-11-07 10:15:00'),
    (12, 'Central Bank Withdrawal Fee', 'CENTRAL_BANK', 1.25, 1, '2025-11-07 10:15:00'),
    (12, 'Branch Cash Withdrawal Fee', 'BANK_BRANCH', 31.75, 1, '2025-11-07 10:15:00'),

    -- Withdrawal TXN-GTH002-005 (15000 INR - Counter)
    (13, 'Global Withdrawal Fee - Domestic', 'HEAD_BANK', 1.50, 2, '2025-11-08 14:30:00'),
    (13, 'Central Bank Withdrawal Fee', 'CENTRAL_BANK', 0.75, 1, '2025-11-08 14:30:00'),
    (13, 'City Center Cash Handling Fee', 'BANK_BRANCH', 25.25, 4, '2025-11-08 14:30:00');

-- Charges for DEPOSIT transactions
INSERT INTO charges (transaction_id, fee_name, bank_type, charged_amount, bank_id, created_at)
VALUES
    -- Deposit TXN-MHB001-009 (20000 INR - Cash)
    (14, 'Global Deposit Fee - Cash', 'HEAD_BANK', 0.50, 2, '2025-11-06 09:15:00'),
    (14, 'Branch Cash Deposit Fee', 'BANK_BRANCH', 12.00, 1, '2025-11-06 09:15:00'),

    -- Deposit TXN-MHB001-011 (50000 INR - Check)
    (17, 'Branch Check Processing Fee', 'BANK_BRANCH', 5.00, 1, '2025-11-07 11:30:00'),
    (17, 'Central Processing Fee', 'CENTRAL_BANK', 1.00, 1, '2025-11-07 11:30:00'),
    (17, 'Branch Service Fee', 'BANK_BRANCH', 16.50, 1, '2025-11-07 11:30:00'),

    -- Deposit TXN-GTH002-007 (25000 INR - Check)
    (18, 'Branch Check Processing Fee', 'BANK_BRANCH', 5.00, 4, '2025-11-08 15:20:00'),
    (18, 'City Center Service Fee', 'BANK_BRANCH', 10.00, 4, '2025-11-08 15:20:00');

-- Charges for BILL_PAYMENT transactions
INSERT INTO charges (transaction_id, fee_name, bank_type, charged_amount, bank_id, created_at)
VALUES
    -- Bill Payment TXN-MHB001-012 (2500 INR)
    (19, 'Metro Bill Payment Fee', 'HEAD_BANK', 1.00, 1, '2025-11-06 17:30:00'),
    (19, 'Central Processing Fee', 'CENTRAL_BANK', 1.00, 1, '2025-11-06 17:30:00'),
    (19, 'Branch Service Fee', 'BANK_BRANCH', 6.50, 1, '2025-11-06 17:30:00'),

    -- Bill Payment TXN-GTH002-008 (3500 INR)
    (21, 'United Bill Payment Convenience Fee', 'HEAD_BANK', 2.50, 3, '2025-11-08 16:45:00'),
    (21, 'Central Processing Fee', 'CENTRAL_BANK', 1.00, 1, '2025-11-08 16:45:00'),
    (21, 'Main Branch Bill Payment Fee', 'BANK_BRANCH', 8.00, 7, '2025-11-08 16:45:00'),

    -- Credit Card Payment TXN-MHB001-014 (15000 INR)
    (23, 'Metro Bill Payment Fee', 'HEAD_BANK', 1.00, 1, '2025-11-07 19:20:00'),
    (23, 'Premium Service Fee', 'HEAD_BANK', 30.00, 3, '2025-11-07 19:20:00'),
    (23, 'Branch Processing Fee', 'BANK_BRANCH', -6.00, 1, '2025-11-07 19:20:00'); -- Negative fee for demonstration

-- Charges for LOAN_REPAYMENT transactions
INSERT INTO charges (transaction_id, fee_name, bank_type, charged_amount, bank_id, created_at)
VALUES
    -- Loan Repayment TXN-MHB001-015 (2450 INR)
    (25, 'Global Loan Service Fee', 'HEAD_BANK', 0.75, 2, '2025-11-06 10:00:00'),
    (25, 'Central Processing Fee', 'CENTRAL_BANK', 1.00, 1, '2025-11-06 10:00:00'),
    (25, 'Main Branch Loan Service Charge', 'BANK_BRANCH', 10.50, 7, '2025-11-06 10:00:00'),

    -- Loan Repayment TXN-GTH002-010 (1900 INR)
    (27, 'Global Loan Service Fee', 'HEAD_BANK', 0.75, 2, '2025-11-08 10:00:00'),
    (27, 'Central Processing Fee', 'CENTRAL_BANK', 1.00, 1, '2025-11-08 10:00:00'),
    (27, 'City Center Document Fee', 'BANK_BRANCH', 9.00, 4, '2025-11-08 10:00:00');

-- Charges for PENDING transactions (will be applied when completed)
INSERT INTO charges (transaction_id, fee_name, bank_type, charged_amount, bank_id, created_at)
VALUES
    -- Pending Transfer TXN-MHB001-017
    (29, 'Metro Transfer Fee - Domestic', 'HEAD_BANK', 1.50, 1, '2025-11-09 09:00:00'),
    (29, 'Central Processing Fee', 'CENTRAL_BANK', 1.00, 1, '2025-11-09 09:00:00'),
    (29, 'Branch Counter Service Fee', 'BANK_BRANCH', 17.50, 1, '2025-11-09 09:00:00');

-- ****************************************************************************************
-- Update account balances based on transactions (for COMPLETED transactions only)
-- Using MySQL compatible syntax
-- ****************************************************************************************

-- Update FROM account balances for transfers and withdrawals
UPDATE account a
    JOIN transactions t ON a.id = t.from_account_id
    SET
        a.current_balance = a.current_balance - (t.amount + t.total_charges),
        a.available_balance = a.available_balance - (t.amount + t.total_charges)
WHERE t.status = 'COMPLETED'
  AND t.transaction_type IN ('TRANSFER', 'WITHDRAWAL', 'BILL_PAYMENT', 'LOAN_REPAYMENT');

-- Update TO account balances for transfers and deposits
UPDATE account a
    JOIN transactions t ON a.id = t.to_account_id
    SET
        a.current_balance = a.current_balance + (t.amount - t.total_charges),
        a.available_balance = a.available_balance + (t.amount - t.total_charges)
WHERE t.status = 'COMPLETED'
  AND t.transaction_type IN ('TRANSFER', 'DEPOSIT');

-- ****************************************************************************************
-- Update bank earnings based on charges
-- ****************************************************************************************

-- Update Central Bank earnings
UPDATE central_bank
SET total_earning = total_earning + (
    SELECT COALESCE(SUM(charged_amount), 0)
    FROM charges
    WHERE bank_type = 'CENTRAL_BANK'
      AND created_at >= '2025-11-06 00:00:00'
)
WHERE id = 1;

-- Update Head Bank earnings for Metropolitan Head Bank (ID: 1)
UPDATE head_bank
SET total_earning = total_earning + (
    SELECT COALESCE(SUM(charged_amount), 0)
    FROM charges
    WHERE bank_type = 'HEAD_BANK' AND bank_id = 1
      AND created_at >= '2025-11-06 00:00:00'
)
WHERE id = 1;

-- Update Head Bank earnings for Global Trust Head Bank (ID: 2)
UPDATE head_bank
SET total_earning = total_earning + (
    SELECT COALESCE(SUM(charged_amount), 0)
    FROM charges
    WHERE bank_type = 'HEAD_BANK' AND bank_id = 2
      AND created_at >= '2025-11-06 00:00:00'
)
WHERE id = 2;

-- Update Head Bank earnings for United Financial Head Bank (ID: 3)
UPDATE head_bank
SET total_earning = total_earning + (
    SELECT COALESCE(SUM(charged_amount), 0)
    FROM charges
    WHERE bank_type = 'HEAD_BANK' AND bank_id = 3
      AND created_at >= '2025-11-06 00:00:00'
)
WHERE id = 3;

-- Update Branch earnings for Metropolitan Downtown Branch (ID: 1)
UPDATE branch
SET total_earning = total_earning + (
    SELECT COALESCE(SUM(charged_amount), 0)
    FROM charges
    WHERE bank_type = 'BANK_BRANCH' AND bank_id = 1
      AND created_at >= '2025-11-06 00:00:00'
)
WHERE id = 1;

-- Update Branch earnings for Global Trust City Center (ID: 4)
UPDATE branch
SET total_earning = total_earning + (
    SELECT COALESCE(SUM(charged_amount), 0)
    FROM charges
    WHERE bank_type = 'BANK_BRANCH' AND bank_id = 4
      AND created_at >= '2025-11-06 00:00:00'
)
WHERE id = 4;

-- Update Branch earnings for United Financial Main Branch (ID: 7)
UPDATE branch
SET total_earning = total_earning + (
    SELECT COALESCE(SUM(charged_amount), 0)
    FROM charges
    WHERE bank_type = 'BANK_BRANCH' AND bank_id = 7
      AND created_at >= '2025-11-06 00:00:00'
)
WHERE id = 7;