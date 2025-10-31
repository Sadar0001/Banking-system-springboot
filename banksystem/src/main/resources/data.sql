-- ==============================
-- Central Bank
-- ==============================
INSERT INTO central_bank (id, name, code, address, contact_email, contact_phone, created_at, updated_at)
VALUES
    (1, 'Reserve Bank of India', 'RBI001', 'Mumbai, Maharashtra, India', 'contact@rbi.org.in', '+91-22-12345678', NOW(), NOW());


-- ==============================
-- Central Bank Admins (3)
-- ==============================
INSERT INTO central_bank_admin (id, central_bank_id, username, email, password_hash, full_name, role, is_active, created_at, last_login)
VALUES
    (1, 1, 'admin_rbi1', 'admin1@rbi.org.in', 'hashed_password_1', 'Ramesh Kumar', 'central_admin', true, NOW(), NOW()),
    (2, 1, 'admin_rbi2', 'admin2@rbi.org.in', 'hashed_password_2', 'Suresh Mehta', 'central_admin', true, NOW(), NOW()),
    (3, 1, 'admin_rbi3', 'admin3@rbi.org.in', 'hashed_password_3', 'Anita Sharma', 'central_admin', true, NOW(), NOW());


-- ==============================
-- Head Banks (5)
-- ==============================
INSERT INTO head_bank (id, central_bank_id, name, code, address, contact_email, contact_phone, routing_number, is_active, created_at, updated_at)
VALUES
    (1, 1, 'State Bank of India', 'SBI001', 'Nariman Point, Mumbai', 'contact@sbi.co.in', '+91-22-9876543210', 'SBIINBB001', true, NOW(), NOW()),
    (2, 1, 'Punjab National Bank', 'PNB001', 'New Delhi', 'contact@pnb.co.in', '+91-11-76543210', 'PNBINBB001', true, NOW(), NOW()),
    (3, 1, 'Bank of Baroda', 'BOB001', 'Vadodara, Gujarat', 'contact@bob.co.in', '+91-265-1234567', 'BOBINBB001', true, NOW(), NOW()),
    (4, 1, 'Canara Bank', 'CAN001', 'Bengaluru, Karnataka', 'contact@canarabank.com', '+91-80-23456789', 'CNRBINBB001', true, NOW(), NOW()),
    (5, 1, 'Axis Bank', 'AXS001', 'Mumbai, Maharashtra', 'contact@axisbank.com', '+91-22-9988776655', 'AXISINBB001', true, NOW(), NOW());


-- ==============================
-- Branches for State Bank of India (Head Bank ID: 1)
-- ==============================
INSERT INTO branch (head_bank_id, branch_code, name, address, contact_email, contact_phone, ifsc_code, is_active, created_at, updated_at) VALUES
                                                                                                                                              (1, 'SBI001001', 'SBI Nariman Point', 'Nariman Point, Mumbai', 'narinman@sbi.co.in', '+91-22-11111111', 'SBIN0000001', true, NOW(), NOW()),
                                                                                                                                              (1, 'SBI001002', 'SBI Fort Branch', 'Fort, Mumbai', 'fort@sbi.co.in', '+91-22-11111112', 'SBIN0000002', true, NOW(), NOW()),
                                                                                                                                              (1, 'SBI001003', 'SBI Andheri Branch', 'Andheri East, Mumbai', 'andheri@sbi.co.in', '+91-22-11111113', 'SBIN0000003', true, NOW(), NOW()),
                                                                                                                                              (1, 'SBI001004', 'SBI Bandra Branch', 'Bandra West, Mumbai', 'bandra@sbi.co.in', '+91-22-11111114', 'SBIN0000004', true, NOW(), NOW());

-- ==============================
-- Branches for Punjab National Bank (Head Bank ID: 2)
-- ==============================
INSERT INTO branch (head_bank_id, branch_code, name, address, contact_email, contact_phone, ifsc_code, is_active, created_at, updated_at) VALUES
                                                                                                                                              (2, 'PNB001001', 'PNB Parliament Street', 'Parliament Street, New Delhi', 'parliament@pnb.co.in', '+91-11-22222221', 'PUNB0000001', true, NOW(), NOW()),
                                                                                                                                              (2, 'PNB001002', 'PNB Connaught Place', 'Connaught Place, New Delhi', 'cp@pnb.co.in', '+91-11-22222222', 'PUNB0000002', true, NOW(), NOW()),
                                                                                                                                              (2, 'PNB001003', 'PNB Chandni Chowk', 'Chandni Chowk, Delhi', 'chandnichowk@pnb.co.in', '+91-11-22222223', 'PUNB0000003', true, NOW(), NOW()),
                                                                                                                                              (2, 'PNB001004', 'PNB Karol Bagh', 'Karol Bagh, New Delhi', 'karolbagh@pnb.co.in', '+91-11-22222224', 'PUNB0000004', true, NOW(), NOW());

-- ==============================
-- Branches for Bank of Baroda (Head Bank ID: 3)
-- ==============================
INSERT INTO branch (head_bank_id, branch_code, name, address, contact_email, contact_phone, ifsc_code, is_active, created_at, updated_at) VALUES
                                                                                                                                              (3, 'BOB001001', 'BOB Vadodara Main', 'Race Course Circle, Vadodara', 'main@bob.co.in', '+91-265-3333331', 'BARB0VADODA', true, NOW(), NOW()),
                                                                                                                                              (3, 'BOB001002', 'BOB Alkapuri', 'Alkapuri, Vadodara', 'alkapuri@bob.co.in', '+91-265-3333332', 'BARB0ALKAPU', true, NOW(), NOW()),
                                                                                                                                              (3, 'BOB001003', 'BOB Sayajigunj', 'Sayajigunj, Vadodara', 'sayajigunj@bob.co.in', '+91-265-3333333', 'BARB0SAYAJI', true, NOW(), NOW()),
                                                                                                                                              (3, 'BOB001004', 'BOB Ahmedabad CG Road', 'CG Road, Ahmedabad', 'ahmedabad@bob.co.in', '+91-79-3333334', 'BARB0CGROAD', true, NOW(), NOW());

-- ==============================
-- Branches for Canara Bank (Head Bank ID: 4)
-- ==============================
INSERT INTO branch (head_bank_id, branch_code, name, address, contact_email, contact_phone, ifsc_code, is_active, created_at, updated_at) VALUES
                                                                                                                                              (4, 'CAN001001', 'Canara Bank MG Road', 'MG Road, Bengaluru', 'mgroad@canarabank.com', '+91-80-44444441', 'CNRB0000001', true, NOW(), NOW()),
                                                                                                                                              (4, 'CAN001002', 'Canara Bank Koramangala', 'Koramangala, Bengaluru', 'koramangala@canarabank.com', '+91-80-44444442', 'CNRB0000002', true, NOW(), NOW()),
                                                                                                                                              (4, 'CAN001003', 'Canara Bank Whitefield', 'Whitefield, Bengaluru', 'whitefield@canarabank.com', '+91-80-44444443', 'CNRB0000003', true, NOW(), NOW()),
                                                                                                                                              (4, 'CAN001004', 'Canara Bank Jayanagar', 'Jayanagar, Bengaluru', 'jayanagar@canarabank.com', '+91-80-44444444', 'CNRB0000004', true, NOW(), NOW());

-- ==============================
-- Branches for Axis Bank (Head Bank ID: 5)
-- ==============================
INSERT INTO branch (head_bank_id, branch_code, name, address, contact_email, contact_phone, ifsc_code, is_active, created_at, updated_at) VALUES
                                                                                                                                              (5, 'AXS001001', 'Axis Bank Lower Parel', 'Lower Parel, Mumbai', 'lowerparel@axisbank.com', '+91-22-55555551', 'UTIB0000001', true, NOW(), NOW()),
                                                                                                                                              (5, 'AXS001002', 'Axis Bank Powai', 'Powai, Mumbai', 'powai@axisbank.com', '+91-22-55555552', 'UTIB0000002', true, NOW(), NOW()),
                                                                                                                                              (5, 'AXS001003', 'Axis Bank Thane', 'Thane West, Mumbai', 'thane@axisbank.com', '+91-22-55555553', 'UTIB0000003', true, NOW(), NOW()),
                                                                                           (5, 'AXS001004', 'Axis Bank Vashi', 'Vashi, Navi Mumbai', 'vashi@axisbank.com', '+91-22-55555554', 'UTIB0000004', true, NOW(), NOW());


-- ==============================
-- Branch Managers for State Bank of India Branches
-- ==============================
INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (1, 'sbi_nariman_mgr', 'manager.nariman@sbi.co.in', 'hashed_password_123', 'Rajesh Patil', 'branch_manager', true, NOW(), NOW());

INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (2, 'sbi_fort_mgr', 'manager.fort@sbi.co.in', 'hashed_password_124', 'Priya Singh', 'branch_manager', true, NOW(), NOW());

INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (3, 'sbi_andheri_mgr', 'manager.andheri@sbi.co.in', 'hashed_password_125', 'Amit Desai', 'branch_manager', true, NOW(), NOW());

INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (4, 'sbi_bandra_mgr', 'manager.bandra@sbi.co.in', 'hashed_password_126', 'Neha Sharma', 'branch_manager', true, NOW(), NOW());

-- ==============================
-- Branch Managers for Punjab National Bank Branches
-- ==============================
INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (5, 'pnb_parliament_mgr', 'manager.parliament@pnb.co.in', 'hashed_password_127', 'Vikram Gupta', 'branch_manager', true, NOW(), NOW());

INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (6, 'pnb_cp_mgr', 'manager.cp@pnb.co.in', 'hashed_password_128', 'Sunita Reddy', 'branch_manager', true, NOW(), NOW());

INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (7, 'pnb_chandni_mgr', 'manager.chandni@pnb.co.in', 'hashed_password_129', 'Alok Kumar', 'branch_manager', true, NOW(), NOW());

INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (8, 'pnb_karolbagh_mgr', 'manager.karolbagh@pnb.co.in', 'hashed_password_130', 'Pooja Verma', 'branch_manager', true, NOW(), NOW());

-- ==============================
-- Branch Managers for Bank of Baroda Branches
-- ==============================
INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (9, 'bob_vadodara_mgr', 'manager.main@bob.co.in', 'hashed_password_131', 'Sanjay Patel', 'branch_manager', true, NOW(), NOW());

INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (10, 'bob_alkapuri_mgr', 'manager.alkapuri@bob.co.in', 'hashed_password_132', 'Kiran Joshi', 'branch_manager', true, NOW(), NOW());

INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (11, 'bob_sayajigunj_mgr', 'manager.sayajigunj@bob.co.in', 'hashed_password_133', 'Rahul Shah', 'branch_manager', true, NOW(), NOW());

INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (12, 'bob_ahmedabad_mgr', 'manager.ahmedabad@bob.co.in', 'hashed_password_134', 'Meera Desai', 'branch_manager', true, NOW(), NOW());

-- ==============================
-- Branch Managers for Canara Bank Branches
-- ==============================
INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (13, 'canara_mgroad_mgr', 'manager.mgroad@canarabank.com', 'hashed_password_135', 'Anand Rao', 'branch_manager', true, NOW(), NOW());

INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (14, 'canara_koramangala_mgr', 'manager.koramangala@canarabank.com', 'hashed_password_136', 'Deepa Nair', 'branch_manager', true, NOW(), NOW());

INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (15, 'canara_whitefield_mgr', 'manager.whitefield@canarabank.com', 'hashed_password_137', 'Siddharth Iyer', 'branch_manager', true, NOW(), NOW());

INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (16, 'canara_jayanagar_mgr', 'manager.jayanagar@canarabank.com', 'hashed_password_138', 'Lakshmi Menon', 'branch_manager', true, NOW(), NOW());

-- ==============================
-- Branch Managers for Axis Bank Branches
-- ==============================
INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (17, 'axis_lowerparel_mgr', 'manager.lowerparel@axisbank.com', 'hashed_password_139', 'Rohan Mehta', 'branch_manager', true, NOW(), NOW());

INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (18, 'axis_powai_mgr', 'manager.powai@axisbank.com', 'hashed_password_140', 'Nisha Choudhary', 'branch_manager', true, NOW(), NOW());

INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (19, 'axis_thane_mgr', 'manager.thane@axisbank.com', 'hashed_password_141', 'Arun Singh', 'branch_manager', true, NOW(), NOW());

INSERT INTO branch_manager (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
    (20, 'axis_vashi_mgr', 'manager.vashi@axisbank.com', 'hashed_password_142', 'Swati Kapoor', 'branch_manager', true, NOW(), NOW());



