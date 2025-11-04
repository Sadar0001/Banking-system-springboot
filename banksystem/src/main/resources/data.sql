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

--*********************


-- ==============================
-- Tellers for State Bank of India Branches (4 branches)
-- ==============================
-- SBI Nariman Point (Branch ID: 1)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (1, 'sbi_nariman_teller1', 'teller1.nariman@sbi.co.in', 'hashed_password_t1', 'Rahul Verma', 'teller', true, NOW(), NOW()),
                                                                                                                       (1, 'sbi_nariman_teller2', 'teller2.nariman@sbi.co.in', 'hashed_password_t2', 'Priya Deshmukh', 'teller', true, NOW(), NOW());

-- SBI Fort Branch (Branch ID: 2)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (2, 'sbi_fort_teller1', 'teller1.fort@sbi.co.in', 'hashed_password_t3', 'Amit Singh', 'teller', true, NOW(), NOW()),
                                                                                                                       (2, 'sbi_fort_teller2', 'teller2.fort@sbi.co.in', 'hashed_password_t4', 'Neha Patil', 'teller', true, NOW(), NOW());

-- SBI Andheri Branch (Branch ID: 3)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (3, 'sbi_andheri_teller1', 'teller1.andheri@sbi.co.in', 'hashed_password_t5', 'Rajesh Nair', 'teller', true, NOW(), NOW()),
                                                                                                                       (3, 'sbi_andheri_teller2', 'teller2.andheri@sbi.co.in', 'hashed_password_t6', 'Sneha Iyer', 'teller', true, NOW(), NOW());

-- SBI Bandra Branch (Branch ID: 4)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (4, 'sbi_bandra_teller1', 'teller1.bandra@sbi.co.in', 'hashed_password_t7', 'Vikram Rao', 'teller', true, NOW(), NOW()),
                                                                                                                       (4, 'sbi_bandra_teller2', 'teller2.bandra@sbi.co.in', 'hashed_password_t8', 'Anjali Menon', 'teller', true, NOW(), NOW());

-- ==============================
-- Tellers for Punjab National Bank Branches (4 branches)
-- ==============================
-- PNB Parliament Street (Branch ID: 5)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (5, 'pnb_parliament_teller1', 'teller1.parliament@pnb.co.in', 'hashed_password_t9', 'Sanjay Gupta', 'teller', true, NOW(), NOW()),
                                                                                                                       (5, 'pnb_parliament_teller2', 'teller2.parliament@pnb.co.in', 'hashed_password_t10', 'Pooja Sharma', 'teller', true, NOW(), NOW());

-- PNB Connaught Place (Branch ID: 6)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (6, 'pnb_cp_teller1', 'teller1.cp@pnb.co.in', 'hashed_password_t11', 'Rohit Kumar', 'teller', true, NOW(), NOW()),
                                                                                                                       (6, 'pnb_cp_teller2', 'teller2.cp@pnb.co.in', 'hashed_password_t12', 'Divya Reddy', 'teller', true, NOW(), NOW());

-- PNB Chandni Chowk (Branch ID: 7)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (7, 'pnb_chandni_teller1', 'teller1.chandni@pnb.co.in', 'hashed_password_t13', 'Alok Verma', 'teller', true, NOW(), NOW()),
                                                                                                                       (7, 'pnb_chandni_teller2', 'teller2.chandni@pnb.co.in', 'hashed_password_t14', 'Sunita Singh', 'teller', true, NOW(), NOW());

-- PNB Karol Bagh (Branch ID: 8)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (8, 'pnb_karolbagh_teller1', 'teller1.karolbagh@pnb.co.in', 'hashed_password_t15', 'Manoj Tiwari', 'teller', true, NOW(), NOW()),
                                                                                                                       (8, 'pnb_karolbagh_teller2', 'teller2.karolbagh@pnb.co.in', 'hashed_password_t16', 'Kavita Joshi', 'teller', true, NOW(), NOW());

-- ==============================
-- Tellers for Bank of Baroda Branches (4 branches)
-- ==============================
-- BOB Vadodara Main (Branch ID: 9)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (9, 'bob_vadodara_teller1', 'teller1.main@bob.co.in', 'hashed_password_t17', 'Raj Patel', 'teller', true, NOW(), NOW()),
                                                                                                                       (9, 'bob_vadodara_teller2', 'teller2.main@bob.co.in', 'hashed_password_t18', 'Mira Desai', 'teller', true, NOW(), NOW());

-- BOB Alkapuri (Branch ID: 10)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (10, 'bob_alkapuri_teller1', 'teller1.alkapuri@bob.co.in', 'hashed_password_t19', 'Ketan Shah', 'teller', true, NOW(), NOW()),
                                                                                                                       (10, 'bob_alkapuri_teller2', 'teller2.alkapuri@bob.co.in', 'hashed_password_t20', 'Naina Joshi', 'teller', true, NOW(), NOW());

-- BOB Sayajigunj (Branch ID: 11)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (11, 'bob_sayajigunj_teller1', 'teller1.sayajigunj@bob.co.in', 'hashed_password_t21', 'Harsh Mehta', 'teller', true, NOW(), NOW()),
                                                                                                                       (11, 'bob_sayajigunj_teller2', 'teller2.sayajigunj@bob.co.in', 'hashed_password_t22', 'Dipika Patel', 'teller', true, NOW(), NOW());

-- BOB Ahmedabad CG Road (Branch ID: 12)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (12, 'bob_ahmedabad_teller1', 'teller1.ahmedabad@bob.co.in', 'hashed_password_t23', 'Vivek Sharma', 'teller', true, NOW(), NOW()),
                                                                                                                       (12, 'bob_ahmedabad_teller2', 'teller2.ahmedabad@bob.co.in', 'hashed_password_t24', 'Rina Gupta', 'teller', true, NOW(), NOW());

-- ==============================
-- Tellers for Canara Bank Branches (4 branches)
-- ==============================
-- Canara Bank MG Road (Branch ID: 13)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (13, 'canara_mgroad_teller1', 'teller1.mgroad@canarabank.com', 'hashed_password_t25', 'Arun Kumar', 'teller', true, NOW(), NOW()),
                                                                                                                       (13, 'canara_mgroad_teller2', 'teller2.mgroad@canarabank.com', 'hashed_password_t26', 'Lakshmi Nair', 'teller', true, NOW(), NOW());

-- Canara Bank Koramangala (Branch ID: 14)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (14, 'canara_koramangala_teller1', 'teller1.koramangala@canarabank.com', 'hashed_password_t27', 'Suresh Iyer', 'teller', true, NOW(), NOW()),
                                                                                                                       (14, 'canara_koramangala_teller2', 'teller2.koramangala@canarabank.com', 'hashed_password_t28', 'Geeta Rao', 'teller', true, NOW(), NOW());

-- Canara Bank Whitefield (Branch ID: 15)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (15, 'canara_whitefield_teller1', 'teller1.whitefield@canarabank.com', 'hashed_password_t29', 'Ramesh Menon', 'teller', true, NOW(), NOW()),
                                                                                                                       (15, 'canara_whitefield_teller2', 'teller2.whitefield@canarabank.com', 'hashed_password_t30', 'Anita Nair', 'teller', true, NOW(), NOW());

-- Canara Bank Jayanagar (Branch ID: 16)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (16, 'canara_jayanagar_teller1', 'teller1.jayanagar@canarabank.com', 'hashed_password_t31', 'Prakash Shetty', 'teller', true, NOW(), NOW()),
                                                                                                                       (16, 'canara_jayanagar_teller2', 'teller2.jayanagar@canarabank.com', 'hashed_password_t32', 'Shweta Kamath', 'teller', true, NOW(), NOW());

-- ==============================
-- Tellers for Axis Bank Branches (4 branches)
-- ==============================
-- Axis Bank Lower Parel (Branch ID: 17)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (17, 'axis_lowerparel_teller1', 'teller1.lowerparel@axisbank.com', 'hashed_password_t33', 'Rohan Malhotra', 'teller', true, NOW(), NOW()),
                                                                                                                       (17, 'axis_lowerparel_teller2', 'teller2.lowerparel@axisbank.com', 'hashed_password_t34', 'Nidhi Chawla', 'teller', true, NOW(), NOW());

-- Axis Bank Powai (Branch ID: 18)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (18, 'axis_powai_teller1', 'teller1.powai@axisbank.com', 'hashed_password_t35', 'Amit Choudhary', 'teller', true, NOW(), NOW()),
                                                                                                                       (18, 'axis_powai_teller2', 'teller2.powai@axisbank.com', 'hashed_password_t36', 'Priya Agarwal', 'teller', true, NOW(), NOW());

-- Axis Bank Thane (Branch ID: 19)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (19, 'axis_thane_teller1', 'teller1.thane@axisbank.com', 'hashed_password_t37', 'Vikas Singh', 'teller', true, NOW(), NOW()),
                                                                                                                       (19, 'axis_thane_teller2', 'teller2.thane@axisbank.com', 'hashed_password_t38', 'Swati Pandey', 'teller', true, NOW(), NOW());

-- Axis Bank Vashi (Branch ID: 20)
INSERT INTO teller (branch_id, username, email, password_hash, full_name, role, is_active, created_at, last_login) VALUES
                                                                                                                       (20, 'axis_vashi_teller1', 'teller1.vashi@axisbank.com', 'hashed_password_t39', 'Anil Kapoor', 'teller', true, NOW(), NOW()),
                                                                                                                       (20, 'axis_vashi_teller2', 'teller2.vashi@axisbank.com', 'hashed_password_t40', 'Madhuri Sharma', 'teller', true, NOW(), NOW());


--*************************************
-- ==============================
-- Customers for State Bank of India Branches (4 branches)
-- ==============================
-- SBI Nariman Point (Branch ID: 1)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (1, 'SBI001CUST001', 'Rahul', 'Sharma', 'rahul.sharma@email.com', '+91-9876543210', '1985-03-15', '12 Marine Drive, Mumbai', '123456789012', 'ABCDE1234F', true, 'hashed_pin_1', NOW(), NOW()),
                                                                                                                                                                                                   (1, 'SBI001CUST002', 'Priya', 'Patil', 'priya.patil@email.com', '+91-9876543211', '1990-07-22', '45 Nariman Point, Mumbai', '123456789013', 'BCDEF1234G', true, 'hashed_pin_2', NOW(), NOW());

-- SBI Fort Branch (Branch ID: 2)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (2, 'SBI002CUST001', 'Amit', 'Verma', 'amit.verma@email.com', '+91-9876543212', '1988-11-30', '23 Fort Street, Mumbai', '123456789014', 'CDEFG1234H', true, 'hashed_pin_3', NOW(), NOW()),
                                                                                                                                                                                                   (2, 'SBI002CUST002', 'Neha', 'Singh', 'neha.singh@email.com', '+91-9876543213', '1992-04-18', '78 Churchgate, Mumbai', '123456789015', 'DEFGH1234I', true, 'hashed_pin_4', NOW(), NOW());

-- SBI Andheri Branch (Branch ID: 3)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (3, 'SBI003CUST001', 'Raj', 'Desai', 'raj.desai@email.com', '+91-9876543214', '1983-09-10', '56 Andheri East, Mumbai', '123456789016', 'EFGHI1234J', true, 'hashed_pin_5', NOW(), NOW()),
                                                                                                                                                                                                   (3, 'SBI003CUST002', 'Sneha', 'Joshi', 'sneha.joshi@email.com', '+91-9876543215', '1995-12-25', '34 Andheri West, Mumbai', '123456789017', 'FGHIJ1234K', true, 'hashed_pin_6', NOW(), NOW());

-- SBI Bandra Branch (Branch ID: 4)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (4, 'SBI004CUST001', 'Vikram', 'Rao', 'vikram.rao@email.com', '+91-9876543216', '1987-06-14', '89 Bandra West, Mumbai', '123456789018', 'GHIJK1234L', true, 'hashed_pin_7', NOW(), NOW()),
                                                                                                                                                                                                   (4, 'SBI004CUST002', 'Anjali', 'Menon', 'anjali.menon@email.com', '+91-9876543217', '1991-02-28', '67 Hill Road, Bandra', '123456789019', 'HIJKL1234M', true, 'hashed_pin_8', NOW(), NOW());

-- ==============================
-- Customers for Punjab National Bank Branches (4 branches)
-- ==============================
-- PNB Parliament Street (Branch ID: 5)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (5, 'PNB001CUST001', 'Sanjay', 'Gupta', 'sanjay.gupta@email.com', '+91-9876543218', '1980-05-20', '12 Parliament Street, Delhi', '123456789020', 'IJKLM1234N', true, 'hashed_pin_9', NOW(), NOW()),
                                                                                                                                                                                                   (5, 'PNB001CUST002', 'Pooja', 'Sharma', 'pooja.sharma@email.com', '+91-9876543219', '1989-08-12', '45 Connaught Place, Delhi', '123456789021', 'JKLMN1234O', true, 'hashed_pin_10', NOW(), NOW());

-- PNB Connaught Place (Branch ID: 6)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (6, 'PNB002CUST001', 'Rohit', 'Kumar', 'rohit.kumar@email.com', '+91-9876543220', '1984-03-08', '23 CP Central, Delhi', '123456789022', 'KLMNO1234P', true, 'hashed_pin_11', NOW(), NOW()),
                                                                                                                                                                                                   (6, 'PNB002CUST002', 'Divya', 'Reddy', 'divya.reddy@email.com', '+91-9876543221', '1993-11-15', '78 Janpath, Delhi', '123456789023', 'LMNOP1234Q', true, 'hashed_pin_12', NOW(), NOW());

-- PNB Chandni Chowk (Branch ID: 7)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (7, 'PNB003CUST001', 'Alok', 'Verma', 'alok.verma@email.com', '+91-9876543222', '1986-07-30', '56 Chandni Chowk, Delhi', '123456789024', 'MNOPQ1234R', true, 'hashed_pin_13', NOW(), NOW()),
                                                                                                                                                                                                   (7, 'PNB003CUST002', 'Sunita', 'Singh', 'sunita.singh@email.com', '+91-9876543223', '1994-04-05', '34 Dariba Kalan, Delhi', '123456789025', 'NOPQR1234S', true, 'hashed_pin_14', NOW(), NOW());

-- PNB Karol Bagh (Branch ID: 8)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (8, 'PNB004CUST001', 'Manoj', 'Tiwari', 'manoj.tiwari@email.com', '+91-9876543224', '1982-12-18', '89 Karol Bagh, Delhi', '123456789026', 'OPQRS1234T', true, 'hashed_pin_15', NOW(), NOW()),
                                                                                                                                                                                                   (8, 'PNB004CUST002', 'Kavita', 'Joshi', 'kavita.joshi@email.com', '+91-9876543225', '1988-09-22', '67 Ajmal Khan Road, Delhi', '123456789027', 'PQRST1234U', true, 'hashed_pin_16', NOW(), NOW());

-- ==============================
-- Customers for Bank of Baroda Branches (4 branches)
-- ==============================
-- BOB Vadodara Main (Branch ID: 9)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (9, 'BOB001CUST001', 'Raj', 'Patel', 'raj.patel@email.com', '+91-9876543226', '1979-06-25', '12 Race Course, Vadodara', '123456789028', 'QRSTU1234V', true, 'hashed_pin_17', NOW(), NOW()),
                                                                                                                                                                                                   (9, 'BOB001CUST002', 'Mira', 'Desai', 'mira.desai@email.com', '+91-9876543227', '1990-01-14', '45 Alkapuri, Vadodara', '123456789029', 'RSTUV1234W', true, 'hashed_pin_18', NOW(), NOW());

-- BOB Alkapuri (Branch ID: 10)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (10, 'BOB002CUST001', 'Ketan', 'Shah', 'ketan.shah@email.com', '+91-9876543228', '1985-10-08', '23 Alkapuri Road, Vadodara', '123456789030', 'STUVW1234X', true, 'hashed_pin_19', NOW(), NOW()),
                                                                                                                                                                                                   (10, 'BOB002CUST002', 'Naina', 'Joshi', 'naina.joshi@email.com', '+91-9876543229', '1992-03-30', '78 RC Dutt Road, Vadodara', '123456789031', 'TUVWX1234Y', true, 'hashed_pin_20', NOW(), NOW());

-- BOB Sayajigunj (Branch ID: 11)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (11, 'BOB003CUST001', 'Harsh', 'Mehta', 'harsh.mehta@email.com', '+91-9876543230', '1983-08-17', '56 Sayajigunj, Vadodara', '123456789032', 'UVWXY1234Z', true, 'hashed_pin_21', NOW(), NOW()),
                                                                                                                                                                                                   (11, 'BOB003CUST002', 'Dipika', 'Patel', 'dipika.patel@email.com', '+91-9876543231', '1987-05-11', '34 Karelibaug, Vadodara', '123456789033', 'VWXYZ1234A', true, 'hashed_pin_22', NOW(), NOW());

-- BOB Ahmedabad CG Road (Branch ID: 12)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (12, 'BOB004CUST001', 'Vivek', 'Sharma', 'vivek.sharma@email.com', '+91-9876543232', '1981-04-03', '89 CG Road, Ahmedabad', '123456789034', 'WXYZA1234B', true, 'hashed_pin_23', NOW(), NOW()),
                                                                                                                                                                                                   (12, 'BOB004CUST002', 'Rina', 'Gupta', 'rina.gupta@email.com', '+91-9876543233', '1995-11-28', '67 Navrangpura, Ahmedabad', '123456789035', 'XYZAB1234C', true, 'hashed_pin_24', NOW(), NOW());

-- ==============================
-- Customers for Canara Bank Branches (4 branches)
-- ==============================
-- Canara Bank MG Road (Branch ID: 13)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (13, 'CAN001CUST001', 'Arun', 'Kumar', 'arun.kumar@email.com', '+91-9876543234', '1984-02-16', '12 MG Road, Bengaluru', '123456789036', 'YZABC1234D', true, 'hashed_pin_25', NOW(), NOW()),
                                                                                                                                                                                                   (13, 'CAN001CUST002', 'Lakshmi', 'Nair', 'lakshmi.nair@email.com', '+91-9876543235', '1989-09-09', '45 Brigade Road, Bengaluru', '123456789037', 'ZABCD1234E', true, 'hashed_pin_26', NOW(), NOW());

-- Canara Bank Koramangala (Branch ID: 14)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (14, 'CAN002CUST001', 'Suresh', 'Iyer', 'suresh.iyer@email.com', '+91-9876543236', '1986-12-24', '23 Koramangala, Bengaluru', '123456789038', 'ABCDE5678F', true, 'hashed_pin_27', NOW(), NOW()),
                                                                                                                                                                                                   (14, 'CAN002CUST002', 'Geeta', 'Rao', 'geeta.rao@email.com', '+91-9876543237', '1993-07-07', '78 5th Block, Bengaluru', '123456789039', 'BCDEF5678G', true, 'hashed_pin_28', NOW(), NOW());

-- Canara Bank Whitefield (Branch ID: 15)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (15, 'CAN003CUST001', 'Ramesh', 'Menon', 'ramesh.menon@email.com', '+91-9876543238', '1980-10-31', '56 Whitefield, Bengaluru', '123456789040', 'CDEFG5678H', true, 'hashed_pin_29', NOW(), NOW()),
                                                                                                                                                                                                   (15, 'CAN003CUST002', 'Anita', 'Nair', 'anita.nair@email.com', '+91-9876543239', '1988-05-19', '34 ITPL Road, Bengaluru', '123456789041', 'DEFGH5678I', true, 'hashed_pin_30', NOW(), NOW());

-- Canara Bank Jayanagar (Branch ID: 16)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (16, 'CAN004CUST001', 'Prakash', 'Shetty', 'prakash.shetty@email.com', '+91-9876543240', '1982-03-12', '89 Jayanagar 4th Block, Bengaluru', '123456789042', 'EFGHI5678J', true, 'hashed_pin_31', NOW(), NOW()),
                                                                                                                                                                                                   (16, 'CAN004CUST002', 'Shweta', 'Kamath', 'shweta.kamath@email.com', '+91-9876543241', '1991-08-26', '67 9th Cross, Jayanagar', '123456789043', 'FGHIJ5678K', true, 'hashed_pin_32', NOW(), NOW());

-- ==============================
-- Customers for Axis Bank Branches (4 branches)
-- ==============================
-- Axis Bank Lower Parel (Branch ID: 17)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (17, 'AXS001CUST001', 'Rohan', 'Malhotra', 'rohan.malhotra@email.com', '+91-9876543242', '1987-01-05', '12 Lower Parel, Mumbai', '123456789044', 'GHIJK5678L', true, 'hashed_pin_33', NOW(), NOW()),
                                                                                                                                                                                                   (17, 'AXS001CUST002', 'Nidhi', 'Chawla', 'nidhi.chawla@email.com', '+91-9876543243', '1994-06-20', '45 Phoenix Mills, Mumbai', '123456789045', 'HIJKL5678M', true, 'hashed_pin_34', NOW(), NOW());

-- Axis Bank Powai (Branch ID: 18)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (18, 'AXS002CUST001', 'Amit', 'Choudhary', 'amit.choudhary@email.com', '+91-9876543244', '1985-11-15', '23 Hiranandani, Powai', '123456789046', 'IJKLM5678N', true, 'hashed_pin_35', NOW(), NOW()),
                                                                                                                                                                                                   (18, 'AXS002CUST002', 'Priya', 'Agarwal', 'priya.agarwal@email.com', '+91-9876543245', '1990-04-08', '78 Lake Homes, Powai', '123456789047', 'JKLMN5678O', true, 'hashed_pin_36', NOW(), NOW());

-- Axis Bank Thane (Branch ID: 19)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (19, 'AXS003CUST001', 'Vikas', 'Singh', 'vikas.singh@email.com', '+91-9876543246', '1983-07-22', '56 Thane West, Mumbai', '123456789048', 'KLMNO5678P', true, 'hashed_pin_37', NOW(), NOW()),
                                                                                                                                                                                                   (19, 'AXS003CUST002', 'Swati', 'Pandey', 'swati.pandey@email.com', '+91-9876543247', '1989-12-11', '34 Ghodbunder Road, Thane', '123456789049', 'LMNOP5678Q', true, 'hashed_pin_38', NOW(), NOW());

-- Axis Bank Vashi (Branch ID: 20)
INSERT INTO customer (branch_id, customer_id, first_name, last_name, email, phone, date_of_birth, address, aadhar_number, pan_number, is_active, transaction_pin_hash, created_at, updated_at) VALUES
                                                                                                                                                                                                   (20, 'AXS004CUST001', 'Anil', 'Kapoor', 'anil.kapoor@email.com', '+91-9876543248', '1978-09-18', '89 Vashi Sector 17, Navi Mumbai', '123456789050', 'MNOPQ5678R', true, 'hashed_pin_39', NOW(), NOW()),
                                                                                                                                                                                                   (20, 'AXS004CUST002', 'Madhuri', 'Sharma', 'madhuri.sharma@email.com', '+91-9876543249', '1986-02-14', '67 Palm Beach Road, Navi Mumbai', '123456789051', 'NOPQR5678S', true, 'hashed_pin_40', NOW(), NOW());

--********************************
-- Insert accounts for customers with different types and statuses
INSERT INTO account (customer_id, branch_id, account_number, account_type, current_balance, available_balance, currency, status, opened_date, created_at, updated_at) VALUES

-- SBI Branches (Head Bank: SBI)
-- Customer 1: Rahul Sharma (SBI001CUST001) - SAVINGS & CURRENT accounts
(1, 1, 'SBI001001SAV001', 'SAVINGS', 50000.00, 50000.00, 'INR', 'ACTIVE', '2024-01-15 10:00:00', NOW(), NOW()),
(1, 1, 'SBI001001CUR001', 'CURRENT', 150000.00, 150000.00, 'INR', 'ACTIVE', '2024-02-20 11:30:00', NOW(), NOW()),

-- Customer 2: Priya Patil (SBI001CUST002) - SAVINGS & LOAN accounts
(2, 1, 'SBI001002SAV001', 'SAVINGS', 75000.00, 75000.00, 'INR', 'ACTIVE', '2024-01-16 09:15:00', NOW(), NOW()),
(2, 1, 'SBI001002LOA001', 'LOAN', -500000.00, -500000.00, 'INR', 'ACTIVE', '2024-03-10 14:20:00', NOW(), NOW()),

-- Customer 3: Amit Verma (SBI002CUST001) - SAVINGS & CURRENT accounts
(3, 2, 'SBI002001SAV001', 'SAVINGS', 60000.00, 60000.00, 'INR', 'ACTIVE', '2024-01-17 13:45:00', NOW(), NOW()),
(3, 2, 'SBI002001CUR001', 'CURRENT', 200000.00, 200000.00, 'INR', 'ACTIVE', '2024-02-25 15:30:00', NOW(), NOW()),

-- Customer 4: Neha Singh (SBI002CUST002) - SAVINGS & FROZEN accounts
(4, 2, 'SBI002002SAV001', 'SAVINGS', 45000.00, 45000.00, 'INR', 'ACTIVE', '2024-01-18 11:20:00', NOW(), NOW()),
(4, 2, 'SBI002002SAV002', 'SAVINGS', 30000.00, 0.00, 'INR', 'FROZEN', '2023-12-05 10:00:00', NOW(), NOW()),

-- PNB Branches (Head Bank: PNB)
-- Customer 9: Sanjay Gupta (PNB001CUST001) - SAVINGS & CURRENT accounts
(9, 5, 'PNB001001SAV001', 'SAVINGS', 80000.00, 80000.00, 'INR', 'ACTIVE', '2024-01-19 14:30:00', NOW(), NOW()),
(9, 5, 'PNB001001CUR001', 'CURRENT', 180000.00, 180000.00, 'INR', 'ACTIVE', '2024-02-28 16:45:00', NOW(), NOW()),

-- Customer 10: Pooja Sharma (PNB001CUST002) - SAVINGS & LOAN accounts
(10, 5, 'PNB001002SAV001', 'SAVINGS', 55000.00, 55000.00, 'INR', 'ACTIVE', '2024-01-20 10:15:00', NOW(), NOW()),
(10, 5, 'PNB001002LOA001', 'LOAN', -300000.00, -300000.00, 'INR', 'ACTIVE', '2024-03-15 12:30:00', NOW(), NOW()),

-- Customer 11: Rohit Kumar (PNB002CUST001) - CURRENT & INACTIVE accounts
(11, 6, 'PNB002001CUR001', 'CURRENT', 220000.00, 220000.00, 'INR', 'ACTIVE', '2024-01-21 15:20:00', NOW(), NOW()),
(11, 6, 'PNB002001SAV001', 'SAVINGS', 35000.00, 35000.00, 'INR', 'INACTIVE', '2023-11-10 09:00:00', NOW(), NOW()),

-- Customer 12: Divya Reddy (PNB002CUST002) - SAVINGS & CLOSED accounts
(12, 6, 'PNB002002SAV001', 'SAVINGS', 90000.00, 90000.00, 'INR', 'ACTIVE', '2024-01-22 11:45:00', NOW(), NOW()),
(12, 6, 'PNB002002SAV002', 'SAVINGS', 0.00, 0.00, 'INR', 'CLOSED', '2023-10-15 14:00:00', NOW(), NOW()),

-- BOB Branches (Head Bank: BOB)
-- Customer 17: Raj Patel (BOB001CUST001) - SAVINGS & CURRENT accounts
(17, 9, 'BOB001001SAV001', 'SAVINGS', 70000.00, 70000.00, 'INR', 'ACTIVE', '2024-01-23 13:30:00', NOW(), NOW()),
(17, 9, 'BOB001001CUR001', 'CURRENT', 160000.00, 160000.00, 'INR', 'ACTIVE', '2024-03-05 17:20:00', NOW(), NOW()),

-- Customer 18: Mira Desai (BOB001CUST002) - SAVINGS & LOAN accounts
(18, 9, 'BOB001002SAV001', 'SAVINGS', 48000.00, 48000.00, 'INR', 'ACTIVE', '2024-01-24 10:40:00', NOW(), NOW()),
(18, 9, 'BOB001002LOA001', 'LOAN', -400000.00, -400000.00, 'INR', 'ACTIVE', '2024-03-20 15:10:00', NOW(), NOW()),

-- Canara Bank Branches (Head Bank: CAN)
-- Customer 25: Arun Kumar (CAN001CUST001) - SAVINGS & CURRENT accounts
(25, 13, 'CAN001001SAV001', 'SAVINGS', 85000.00, 85000.00, 'INR', 'ACTIVE', '2024-01-25 14:15:00', NOW(), NOW()),
(25, 13, 'CAN001001CUR001', 'CURRENT', 190000.00, 190000.00, 'INR', 'ACTIVE', '2024-03-08 16:30:00', NOW(), NOW()),

-- Customer 26: Lakshmi Nair (CAN001CUST002) - SAVINGS & FROZEN accounts
(26, 13, 'CAN001002SAV001', 'SAVINGS', 62000.00, 62000.00, 'INR', 'ACTIVE', '2024-01-26 11:25:00', NOW(), NOW()),
(26, 13, 'CAN001002SAV002', 'SAVINGS', 25000.00, 0.00, 'INR', 'FROZEN', '2023-12-20 13:45:00', NOW(), NOW()),

-- Axis Bank Branches (Head Bank: AXS)
-- Customer 33: Rohan Malhotra (AXS001CUST001) - CURRENT & SAVINGS accounts
(33, 17, 'AXS001001CUR001', 'CURRENT', 210000.00, 210000.00, 'INR', 'ACTIVE', '2024-01-27 15:50:00', NOW(), NOW()),
(33, 17, 'AXS001001SAV001', 'SAVINGS', 95000.00, 95000.00, 'INR', 'ACTIVE', '2024-01-28 09:30:00', NOW(), NOW()),

-- Customer 34: Nidhi Chawla (AXS001CUST002) - SAVINGS & LOAN accounts
(34, 17, 'AXS001002SAV001', 'SAVINGS', 58000.00, 58000.00, 'INR', 'ACTIVE', '2024-01-29 12:15:00', NOW(), NOW()),
(34, 17, 'AXS001002LOA001', 'LOAN', -350000.00, -350000.00, 'INR', 'ACTIVE', '2024-03-25 14:40:00', NOW(), NOW());

-- Continue with more customers as needed...


-- ==============================
-- Charges Book Data
-- ==============================

-- ==============================
-- Charges for State Bank of India (Head Bank ID: 1, Branch IDs: 1-4)
-- ==============================

-- Branch Level Charges for SBI Nariman Point (Branch ID: 1)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Small Transfer Fee', 10.00, 1, 'BANK_BRANCH', 'TRANSFER', 0.0, 5000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Medium Transfer Fee', 25.00, 1, 'BANK_BRANCH', 'TRANSFER', 5000.0, 50000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Large Transfer Fee', 50.00, 1, 'BANK_BRANCH', 'TRANSFER', 50000.0, 500000.0, true, NOW(), NOW()),
                                                                                                                                                   ('ATM Withdrawal Fee', 5.00, 1, 'BANK_BRANCH', 'WITHDRAWAL', 0.0, 10000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Counter Withdrawal Fee', 15.00, 1, 'BANK_BRANCH', 'WITHDRAWAL', 10000.0, 100000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Cash Deposit Fee', 0.00, 1, 'BANK_BRANCH', 'DEPOSIT', 0.0, 50000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Large Deposit Fee', 10.00, 1, 'BANK_BRANCH', 'DEPOSIT', 50000.0, 1000000.0, true, NOW(), NOW());

-- Branch Level Charges for SBI Fort (Branch ID: 2)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Small Transfer Fee', 10.00, 2, 'BANK_BRANCH', 'TRANSFER', 0.0, 5000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Medium Transfer Fee', 25.00, 2, 'BANK_BRANCH', 'TRANSFER', 5000.0, 50000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Large Transfer Fee', 50.00, 2, 'BANK_BRANCH', 'TRANSFER', 50000.0, 500000.0, true, NOW(), NOW()),
                                                                                                                                                   ('ATM Withdrawal Fee', 5.00, 2, 'BANK_BRANCH', 'WITHDRAWAL', 0.0, 10000.0, true, NOW(), NOW());

-- Branch Level Charges for SBI Andheri (Branch ID: 3)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Small Transfer Fee', 12.00, 3, 'BANK_BRANCH', 'TRANSFER', 0.0, 5000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Medium Transfer Fee', 28.00, 3, 'BANK_BRANCH', 'TRANSFER', 5000.0, 50000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Large Transfer Fee', 55.00, 3, 'BANK_BRANCH', 'TRANSFER', 50000.0, 500000.0, true, NOW(), NOW());

-- Branch Level Charges for SBI Bandra (Branch ID: 4)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Small Transfer Fee', 10.00, 4, 'BANK_BRANCH', 'TRANSFER', 0.0, 5000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Medium Transfer Fee', 25.00, 4, 'BANK_BRANCH', 'TRANSFER', 5000.0, 50000.0, true, NOW(), NOW());

-- ==============================
-- Charges for Punjab National Bank (Head Bank ID: 2, Branch IDs: 5-8)
-- ==============================

-- Branch Level Charges for PNB Parliament Street (Branch ID: 5)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Basic Transfer Fee', 8.00, 5, 'BANK_BRANCH', 'TRANSFER', 0.0, 3000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Standard Transfer Fee', 20.00, 5, 'BANK_BRANCH', 'TRANSFER', 3000.0, 40000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Premium Transfer Fee', 45.00, 5, 'BANK_BRANCH', 'TRANSFER', 40000.0, 400000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Withdrawal Charge', 7.00, 5, 'BANK_BRANCH', 'WITHDRAWAL', 0.0, 15000.0, true, NOW(), NOW());

-- Branch Level Charges for PNB Connaught Place (Branch ID: 6)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Basic Transfer Fee', 8.00, 6, 'BANK_BRANCH', 'TRANSFER', 0.0, 3000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Standard Transfer Fee', 20.00, 6, 'BANK_BRANCH', 'TRANSFER', 3000.0, 40000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Premium Transfer Fee', 45.00, 6, 'BANK_BRANCH', 'TRANSFER', 40000.0, 400000.0, true, NOW(), NOW());

-- Branch Level Charges for PNB Chandni Chowk (Branch ID: 7)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Basic Transfer Fee', 9.00, 7, 'BANK_BRANCH', 'TRANSFER', 0.0, 3000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Standard Transfer Fee', 22.00, 7, 'BANK_BRANCH', 'TRANSFER', 3000.0, 40000.0, true, NOW(), NOW());

-- Branch Level Charges for PNB Karol Bagh (Branch ID: 8)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Basic Transfer Fee', 8.00, 8, 'BANK_BRANCH', 'TRANSFER', 0.0, 3000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Standard Transfer Fee', 20.00, 8, 'BANK_BRANCH', 'TRANSFER', 3000.0, 40000.0, true, NOW(), NOW());

-- ==============================
-- Charges for Bank of Baroda (Head Bank ID: 3, Branch IDs: 9-12)
-- ==============================

-- Branch Level Charges for BOB Vadodara Main (Branch ID: 9)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Micro Transfer Fee', 5.00, 9, 'BANK_BRANCH', 'TRANSFER', 0.0, 2000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Small Transfer Fee', 15.00, 9, 'BANK_BRANCH', 'TRANSFER', 2000.0, 20000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Medium Transfer Fee', 30.00, 9, 'BANK_BRANCH', 'TRANSFER', 20000.0, 100000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Large Transfer Fee', 60.00, 9, 'BANK_BRANCH', 'TRANSFER', 100000.0, 1000000.0, true, NOW(), NOW());

-- Branch Level Charges for BOB Alkapuri (Branch ID: 10)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Micro Transfer Fee', 5.00, 10, 'BANK_BRANCH', 'TRANSFER', 0.0, 2000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Small Transfer Fee', 15.00, 10, 'BANK_BRANCH', 'TRANSFER', 2000.0, 20000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Medium Transfer Fee', 30.00, 10, 'BANK_BRANCH', 'TRANSFER', 20000.0, 100000.0, true, NOW(), NOW());

-- Branch Level Charges for BOB Sayajigunj (Branch ID: 11)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Micro Transfer Fee', 6.00, 11, 'BANK_BRANCH', 'TRANSFER', 0.0, 2000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Small Transfer Fee', 18.00, 11, 'BANK_BRANCH', 'TRANSFER', 2000.0, 20000.0, true, NOW(), NOW());

-- Branch Level Charges for BOB Ahmedabad (Branch ID: 12)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Micro Transfer Fee', 5.00, 12, 'BANK_BRANCH', 'TRANSFER', 0.0, 2000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Small Transfer Fee', 15.00, 12, 'BANK_BRANCH', 'TRANSFER', 2000.0, 20000.0, true, NOW(), NOW());

-- ==============================
-- Charges for Canara Bank (Head Bank ID: 4, Branch IDs: 13-16)
-- ==============================

-- Branch Level Charges for Canara MG Road (Branch ID: 13)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Express Transfer Fee', 12.00, 13, 'BANK_BRANCH', 'TRANSFER', 0.0, 10000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Premium Transfer Fee', 35.00, 13, 'BANK_BRANCH', 'TRANSFER', 10000.0, 100000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Corporate Transfer Fee', 75.00, 13, 'BANK_BRANCH', 'TRANSFER', 100000.0, 1000000.0, true, NOW(), NOW());

-- Branch Level Charges for Canara Koramangala (Branch ID: 14)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Express Transfer Fee', 12.00, 14, 'BANK_BRANCH', 'TRANSFER', 0.0, 10000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Premium Transfer Fee', 35.00, 14, 'BANK_BRANCH', 'TRANSFER', 10000.0, 100000.0, true, NOW(), NOW());

-- Branch Level Charges for Canara Whitefield (Branch ID: 15)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Express Transfer Fee', 13.00, 15, 'BANK_BRANCH', 'TRANSFER', 0.0, 10000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Premium Transfer Fee', 38.00, 15, 'BANK_BRANCH', 'TRANSFER', 10000.0, 100000.0, true, NOW(), NOW());

-- Branch Level Charges for Canara Jayanagar (Branch ID: 16)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Express Transfer Fee', 12.00, 16, 'BANK_BRANCH', 'TRANSFER', 0.0, 10000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Premium Transfer Fee', 35.00, 16, 'BANK_BRANCH', 'TRANSFER', 10000.0, 100000.0, true, NOW(), NOW());

-- ==============================
-- Charges for Axis Bank (Head Bank ID: 5, Branch IDs: 17-20)
-- ==============================

-- Branch Level Charges for Axis Lower Parel (Branch ID: 17)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Quick Transfer Fee', 7.00, 17, 'BANK_BRANCH', 'TRANSFER', 0.0, 5000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Standard Transfer Fee', 18.00, 17, 'BANK_BRANCH', 'TRANSFER', 5000.0, 50000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Priority Transfer Fee', 40.00, 17, 'BANK_BRANCH', 'TRANSFER', 50000.0, 500000.0, true, NOW(), NOW()),
                                                                                                                                                   ('VIP Transfer Fee', 100.00, 17, 'BANK_BRANCH', 'TRANSFER', 500000.0, 10000000.0, true, NOW(), NOW());

-- Branch Level Charges for Axis Powai (Branch ID: 18)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Quick Transfer Fee', 7.00, 18, 'BANK_BRANCH', 'TRANSFER', 0.0, 5000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Standard Transfer Fee', 18.00, 18, 'BANK_BRANCH', 'TRANSFER', 5000.0, 50000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Priority Transfer Fee', 40.00, 18, 'BANK_BRANCH', 'TRANSFER', 50000.0, 500000.0, true, NOW(), NOW());

-- Branch Level Charges for Axis Thane (Branch ID: 19)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Quick Transfer Fee', 8.00, 19, 'BANK_BRANCH', 'TRANSFER', 0.0, 5000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Standard Transfer Fee', 20.00, 19, 'BANK_BRANCH', 'TRANSFER', 5000.0, 50000.0, true, NOW(), NOW());

-- Branch Level Charges for Axis Vashi (Branch ID: 20)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Quick Transfer Fee', 7.00, 20, 'BANK_BRANCH', 'TRANSFER', 0.0, 5000.0, true, NOW(), NOW()),
                                                                                                                                                   ('Standard Transfer Fee', 18.00, 20, 'BANK_BRANCH', 'TRANSFER', 5000.0, 50000.0, true, NOW(), NOW());

-- ==============================
-- Head Bank Level Charges
-- ==============================

-- SBI Head Bank (Head Bank ID: 1)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Inter-branch Transfer Fee', 15.00, 1, 'HEAD_BANK', 'TRANSFER', 0.0, 100000.0, true, NOW(), NOW()),
                                                                                                                                                   ('High Value Transfer Fee', 50.00, 1, 'HEAD_BANK', 'TRANSFER', 100000.0, 10000000.0, true, NOW(), NOW());

-- PNB Head Bank (Head Bank ID: 2)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Inter-branch Transfer Fee', 12.00, 2, 'HEAD_BANK', 'TRANSFER', 0.0, 100000.0, true, NOW(), NOW()),
                                                                                                                                                   ('High Value Transfer Fee', 45.00, 2, 'HEAD_BANK', 'TRANSFER', 100000.0, 10000000.0, true, NOW(), NOW());

-- BOB Head Bank (Head Bank ID: 3)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Inter-branch Transfer Fee', 10.00, 3, 'HEAD_BANK', 'TRANSFER', 0.0, 100000.0, true, NOW(), NOW()),
                                                                                                                                                   ('High Value Transfer Fee', 40.00, 3, 'HEAD_BANK', 'TRANSFER', 100000.0, 10000000.0, true, NOW(), NOW());

-- Canara Head Bank (Head Bank ID: 4)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Inter-branch Transfer Fee', 18.00, 4, 'HEAD_BANK', 'TRANSFER', 0.0, 100000.0, true, NOW(), NOW()),
                                                                                                                                                   ('High Value Transfer Fee', 55.00, 4, 'HEAD_BANK', 'TRANSFER', 100000.0, 10000000.0, true, NOW(), NOW());

-- Axis Head Bank (Head Bank ID: 5)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Inter-branch Transfer Fee', 8.00, 5, 'HEAD_BANK', 'TRANSFER', 0.0, 100000.0, true, NOW(), NOW()),
                                                                                                                                                   ('High Value Transfer Fee', 35.00, 5, 'HEAD_BANK', 'TRANSFER', 100000.0, 10000000.0, true, NOW(), NOW());

-- ==============================
-- Central Bank Level Charges
-- ==============================

-- Reserve Bank of India (Central Bank ID: 1)
INSERT INTO charges_book (fee_name, fee_amount, bank_id, bank_type, transaction_type, min_value, max_value, is_active, created_at, updated_at) VALUES
                                                                                                                                                   ('Regulatory Transfer Fee', 5.00, 1, 'CENTRAL_BANK', 'TRANSFER', 0.0, 1000000.0, true, NOW(), NOW()),
