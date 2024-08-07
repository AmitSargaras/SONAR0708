-----------------------------
-- Cleanup
-----------------------------
-- DELETE FROM MIG_QC_REPORT;		//Use drop and recreate mig report - much faster

/* ---------------------------  QC 3 ----------------------------   */ 
-----------------------------
-- Customer
-----------------------------
-- CU001
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Error', 'QC Report 3 for Migration', 'SIBS', 'CU001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Error', 'Report for migration template: CV001SIBS', 'SIBS', 'CU001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Error', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CU001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Error', 'Records with Error(s):', 'SIBS', 'CU001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Error', 'CIF ID / -, Error Message', 'SIBS', 'CU001');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'Error', COALESCE(KEY1_VALUE,'-') || ' / ' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'CU001' 
     FROM MIG_ERROR_LOG WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CU001');

    
-----------------------------
-- AA
-----------------------------
-- CA001
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Error', 'QC Report 3 for Migration', 'SIBS', 'CA001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Error', 'Report for migration template: CV002SIBS', 'SIBS', 'CA001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Error', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Error', 'Records with Error(s):', 'SIBS', 'CA001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Error', 'CIF ID / AA Number / LOS AA Number, Error Message', 'SIBS', 'CA001');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'Error', COALESCE(KEY1_VALUE,'-') || ' / ' || COALESCE(KEY2_VALUE,'-') || ' / ' || COALESCE(KEY3_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'CA001' 
     FROM MIG_ERROR_LOG WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA001');


-----------------------------
-- Joint Borrower
-----------------------------    
-- CA002
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Error', 'QC Report 3 for Migration', 'SIBS', 'CA002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Error', 'Report for migration template: CV003SIBS', 'SIBS', 'CA002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Error', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Error', 'Records with Error(s):', 'SIBS', 'CA002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Error', 'CIF ID / AA Number, Error Message', 'SIBS', 'CA002');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'Error', COALESCE(KEY1_VALUE,'-') || ' / ' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'CA002' 
     FROM MIG_ERROR_LOG WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA002');

 
/* ---------------------------  QC 4 ----------------------------   */ 
-----------------------------
-- Customer
-----------------------------
-- CU001
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('IsValid', 'QC Report 4 for Migration', 'SIBS', 'CU001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('IsValid', 'Report for migration template: CV001SIBS', 'SIBS', 'CU001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('IsValid', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CU001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('IsValid', 'Total Number of Records', 'SIBS', 'CU001');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'IsValid', CHAR(COUNT(*)), 'SIBS', 'CU001' FROM MIG_CU001_CU WHERE IS_VALID = 'Y');

    
-----------------------------
-- AA
-----------------------------
-- CA001
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('IsValid', 'QC Report 4 for Migration', 'SIBS', 'CA001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('IsValid', 'Report for migration template: CV002SIBS', 'SIBS', 'CA001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('IsValid', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('IsValid', 'Total Number of Records', 'SIBS', 'CA001');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'IsValid', CHAR(COUNT(*)), 'SIBS', 'CA001' FROM MIG_CA001_AA WHERE IS_VALID = 'Y');


-----------------------------
-- Joint Borrower
-----------------------------    
-- CA002
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('IsValid', 'QC Report 4 for Migration', 'SIBS', 'CA002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('IsValid', 'Report for migration template: CV003SIBS', 'SIBS', 'CA002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('IsValid', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('IsValid', 'Total Number of Records', 'SIBS', 'CA002');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'IsValid', CHAR(COUNT(*)), 'SIBS', 'CA002' FROM MIG_CA002_JB WHERE IS_VALID = 'Y');

 
/* ---------------------------  QC 5 ----------------------------   */ 
-----------------------------
-- Customer
-----------------------------
-- CU001
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Migrated', 'QC Report 5 for Migration', 'SIBS', 'CU001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Migrated', 'Report for migration template: CV001SIBS', 'SIBS', 'CU001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Migrated', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CU001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Migrated', 'Total Number of Records', 'SIBS', 'CU001');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'Migrated', 'Customer,' || CHAR(COUNT(*)), 'SIBS', 'CU001' FROM SCI_LE_MAIN_PROFILE cust, MIG_CU001_CU mig
		WHERE cust.CMS_LE_MAIN_PROFILE_ID = mig.CMS_LE_MAIN_PROFILE_ID AND cust.SOURCE_ID = 'SIBS' AND mig.IS_VALID = 'Y');

    
-----------------------------
-- AA
-----------------------------
-- CA001
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Migrated', 'QC Report 5 for Migration', 'SIBS', 'CA001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Migrated', 'Report for migration template: CV002SIBS', 'SIBS', 'CA001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Migrated', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA001');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Migrated', 'Total Number of Records', 'SIBS', 'CA001');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'Migrated', 'AA,' || CHAR(COUNT(*)), 'SIBS', 'CA001' FROM SCI_LSP_LMT_PROFILE aa, MIG_CA001_AA mig
		WHERE aa.LOS_BCA_REF_NUM = mig.LOS_BCA_REF_NUM AND aa.SOURCE_ID = 'RLOS' AND mig.IS_VALID = 'Y');


-----------------------------
-- Joint Borrower
-----------------------------    
-- CA002
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Migrated', 'QC Report 5 for Migration', 'SIBS', 'CA002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Migrated', 'Report for migration template: CV003SIBS', 'SIBS', 'CA002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Migrated', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('Migrated', 'Total Number of Records', 'SIBS', 'CA002');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'Migrated', 'Joint Borrower,' || CHAR(COUNT(*)), 'SIBS', 'CA002' FROM SCI_LSP_JOINT_BORROWER jb, MIG_CA002_JB mig
		WHERE jb.CMS_LMP_LIMIT_PROFILE_ID = mig.CMS_ACT_LMT_PROFILE_ID AND jb.LJB_LE_ID = mig.CIF_ID AND jb.SOURCE_ID = 'SIBS' AND mig.IS_VALID = 'Y');

   