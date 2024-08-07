-----------------------------
-- Cleanup
-----------------------------
DELETE FROM MIG_DATA_CLEANUP_REPORT;

-----------------------------
-- Customer
-----------------------------
-- CU001
--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'CU001');
--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV001SIBS', 'SIBS', 'CU001');
--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CU001');
--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'CU001');
--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID / -, Error Message', 'SIBS', 'CU001');

--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
--	(SELECT 'Cleanup', COALESCE(KEY1_VALUE,'-') || ' / ' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'CU001' 
--     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CU001');

    
-----------------------------
-- AA
-----------------------------
-- CA001
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CA001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV002SIBS', 'SIBS', 'HP2', 'CA001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CA001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CA001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID , SIBS AA Number , LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, AA Create Date, AA Approved Date, Approved Date, Offer Date, Date Offer Accepted, Document Status, Facility Status, Application Type, Application Law Type, Error Message', 'SIBS', 'HP2', 'CA001');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ' , ' || COALESCE(KEY4_VALUE,'-') || ' , ' || COALESCE(KEY5_VALUE,'-') || ' , ' || COALESCE(KEY6_VALUE,'-') || ' , ' || COALESCE(KEY7_VALUE,'-') || ' , ' || COALESCE(KEY8_VALUE,'-') || ' , ' || 
	COALESCE(KEY9_VALUE,'-') || ' , ' || COALESCE(KEY10_VALUE,'-') || ' , ' || COALESCE(KEY11_VALUE,'-') || ' , ' || COALESCE(KEY12_VALUE,'-') || ' , ' || COALESCE(KEY13_VALUE,'-') || ' , ' || COALESCE(KEY14_VALUE,'-') || ' , ' || 
	COALESCE(KEY15_VALUE,'-') || ' , ' || COALESCE(KEY16_VALUE,'-') || ' , ' || COALESCE(KEY1_VALUE,'-') || ' , ' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CA001' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA001' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON');

-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CA001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV002SIBS', 'SIBS', 'MO2', 'CA001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CA001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CA001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID , SIBS AA Number , LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, AA Create Date, AA Approved Date, Approved Date, Offer Date, Date Offer Accepted, Document Status, Facility Status, Application Type, Application Law Type, Error Message', 'SIBS', 'MO2', 'CA001');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ' , ' || COALESCE(KEY4_VALUE,'-') || ' , ' || COALESCE(KEY5_VALUE,'-') || ' , ' || COALESCE(KEY6_VALUE,'-') || ' , ' || COALESCE(KEY7_VALUE,'-') || ' , ' || COALESCE(KEY8_VALUE,'-') || ' , ' || 
	COALESCE(KEY9_VALUE,'-') || ' , ' || COALESCE(KEY10_VALUE,'-') || ' , ' || COALESCE(KEY11_VALUE,'-') || ' , ' || COALESCE(KEY12_VALUE,'-') || ' , ' || COALESCE(KEY13_VALUE,'-') || ' , ' || COALESCE(KEY14_VALUE,'-') || ' , ' || 
	COALESCE(KEY15_VALUE,'-') || ' , ' || COALESCE(KEY16_VALUE,'-') || ' , ' || COALESCE(KEY1_VALUE,'-') || ' , ' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CA001' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA001' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON');

-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CA001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV002SIBS', 'SIBS', 'SF2', 'CA001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CA001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CA001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID , SIBS AA Number , LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, AA Create Date, AA Approved Date, Approved Date, Offer Date, Date Offer Accepted, Document Status, Facility Status, Application Type, Application Law Type, Error Message', 'SIBS', 'SF2', 'CA001');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ' , ' || COALESCE(KEY4_VALUE,'-') || ' , ' || COALESCE(KEY5_VALUE,'-') || ' , ' || COALESCE(KEY6_VALUE,'-') || ' , ' || COALESCE(KEY7_VALUE,'-') || ' , ' || COALESCE(KEY8_VALUE,'-') || ' , ' || 
	COALESCE(KEY9_VALUE,'-') || ' , ' || COALESCE(KEY10_VALUE,'-') || ' , ' || COALESCE(KEY11_VALUE,'-') || ' , ' || COALESCE(KEY12_VALUE,'-') || ' , ' || COALESCE(KEY13_VALUE,'-') || ' , ' || COALESCE(KEY14_VALUE,'-') || ' , ' || 
	COALESCE(KEY15_VALUE,'-') || ' , ' || COALESCE(KEY16_VALUE,'-') || ' , ' || COALESCE(KEY1_VALUE,'-') || ' , ' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CA001' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA001' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON');

-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CA001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV002SIBS', 'SIBS', 'ISL2', 'CA001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CA001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CA001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, AA Create Date, AA Approved Date, Approved Date, Offer Date, Date Offer Accepted, Document Status, Facility Status, Application Type, Application Law Type, Error Message', 'SIBS', 'ISL2', 'CA001');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ' , ' || COALESCE(KEY4_VALUE,'-') || ' , ' || COALESCE(KEY5_VALUE,'-') || ' , ' || COALESCE(KEY6_VALUE,'-') || ' , ' || COALESCE(KEY7_VALUE,'-') || ' , ' || COALESCE(KEY8_VALUE,'-') || ' , ' || 
	COALESCE(KEY9_VALUE,'-') || ' , ' || COALESCE(KEY10_VALUE,'-') || ' , ' || COALESCE(KEY11_VALUE,'-') || ' , ' || COALESCE(KEY12_VALUE,'-') || ' , ' || COALESCE(KEY13_VALUE,'-') || ' , ' || COALESCE(KEY14_VALUE,'-') || ' , ' || 
	COALESCE(KEY15_VALUE,'-') || ' , ' || COALESCE(KEY16_VALUE,'-') || ' , ' || COALESCE(KEY1_VALUE,'-') || ' , ' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CA001' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA001' AND KEY2_VALUE = 'ISL');


-----------------------------
-- Joint Borrower
-----------------------------    
-- CA002
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CA002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV003SIBS', 'SIBS', 'HP2', 'CA002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CA002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CA002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, Joint Borrower Indicator, Joint Borrower CIF ID, AA Create Date, Approved Date, Offer Date, Date Offer Accepted, Document Status, Facility Status, Application Type, Application Law Type, Error Message', 'SIBS', 'HP2', 'CA002');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || COALESCE(KEY14_VALUE,'-') || ',' || 
	COALESCE(KEY15_VALUE,'-') || ',' || COALESCE(KEY16_VALUE,'-') || ',' || COALESCE(KEY17_VALUE,'-') || ',' || COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CA002' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA002' AND KEY2_VALUE = 'CON');

 
-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CA002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV003SIBS', 'SIBS', 'ISL2', 'CA002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CA002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CA002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, Joint Borrower Indicator, Joint Borrower CIF ID, AA Create Date, Approved Date, Offer Date, Date Offer Accepted, Document Status, Facility Status, Application Type, Application Law Type, Error Message', 'SIBS', 'ISL2', 'CA002');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || COALESCE(KEY14_VALUE,'-') || ',' || 
	COALESCE(KEY15_VALUE,'-') || ',' || COALESCE(KEY16_VALUE,'-') || ',' || COALESCE(KEY17_VALUE,'-') || ',' || COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CA002' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA002' AND KEY2_VALUE = 'ISL');

 
-----------------------------
-- Facility
-----------------------------    
-- CA003_1
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CA003_1');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV004SIBS', 'SIBS', 'HP2', 'CA003_1');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CA003_1');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CA003_1');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, AA Create Date, Approved Date, Offer Date, Date Offer Accepted, Application Type, Application Law Type, Error Message', 'SIBS', 'HP2', 'CA003_1');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	-- COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CA003_1' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_1' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON');
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || COALESCE(KEY13_VALUE,''-'') || '','' || COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''HP2'', ''CA003_1'' 
 FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CA003_1'' AND KEY1_VALUE = ''HP'' AND KEY2_VALUE = ''CON'') OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');	 

commit;
 
-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CA003_1');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV004SIBS', 'SIBS', 'MO2', 'CA003_1');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CA003_1');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CA003_1');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, AA Create Date, Approved Date, Offer Date, Date Offer Accepted, Application Type, Application Law Type, Error Message', 'SIBS', 'MO2', 'CA003_1');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	-- COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CA003_1' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_1' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON');
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || COALESCE(KEY13_VALUE,''-'') || '','' || COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''MO2'', ''CA003_1'' 
 FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CA003_1'' AND KEY1_VALUE = ''MO'' AND KEY2_VALUE = ''CON'') OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');	 

commit;
 
-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CA003_1');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV004SIBS', 'SIBS', 'SF2', 'CA003_1');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CA003_1');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CA003_1');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, AA Create Date, Approved Date, Offer Date, Date Offer Accepted, Application Type, Application Law Type, Error Message', 'SIBS', 'SF2', 'CA003_1');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	-- COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CA003_1' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_1' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON');
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || COALESCE(KEY13_VALUE,''-'') || '','' || COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''SF2'', ''CA003_1'' 
 FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CA003_1'' AND KEY1_VALUE = ''SF'' AND KEY2_VALUE = ''CON'') OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');	 

commit;
 
-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CA003_1');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV004SIBS', 'SIBS', 'ISL2', 'CA003_1');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CA003_1');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CA003_1');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, AA Create Date, Approved Date, Offer Date, Date Offer Accepted, Application Type, Application Law Type, Error Message', 'SIBS', 'ISL2', 'CA003_1');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	-- COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CA003_1' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_1' AND KEY2_VALUE = 'ISL');
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || COALESCE(KEY13_VALUE,''-'') || '','' || COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''ISL2'', ''CA003_1'' 
 FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CA003_1'' AND KEY2_VALUE = ''ISL'') OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');	 

commit;
 
-- CA003_2
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CA003_2');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV005SIBS', 'SIBS', 'HP2', 'CA003_2');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CA003_2');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CA003_2');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, AA Create Date, Approved Date, Offer Date, Date Offer Accepted, Application Type, Application Law Type, Error Message', 'SIBS', 'HP2', 'CA003_2');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CA003_2' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_2' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON');

-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CA003_2');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV005SIBS', 'SIBS', 'MO2', 'CA003_2');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CA003_2');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CA003_2');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, AA Create Date, Approved Date, Offer Date, Date Offer Accepted, Application Type, Application Law Type, Error Message', 'SIBS', 'MO2', 'CA003_2');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CA003_2' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_2' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON');

-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CA003_2');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV005SIBS', 'SIBS', 'SF2', 'CA003_2');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CA003_2');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CA003_2');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, AA Create Date, Approved Date, Offer Date, Date Offer Accepted, Application Type, Application Law Type, Error Message', 'SIBS', 'SF2', 'CA003_2');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CA003_2' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_2' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON');

-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CA003_2');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV005SIBS', 'SIBS', 'ISL2', 'CA003_2');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CA003_2');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CA003_2');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, AA Create Date, Approved Date, Offer Date, Date Offer Accepted, Application Type, Application Law Type, Error Message', 'SIBS', 'ISL2', 'CA003_2');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,''-'') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CA003_2' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_2' AND KEY2_VALUE = 'ISL');
 
-- CA003_3
--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CA003_3');
--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV006SIBS', 'SIBS', 'HP2', 'CA003_3');
--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CA003_3');
--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CA003_3');
--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Limit ID / AA Number /Facility Code / Facility Sequence / Officer Seq No, Error Message', 'SIBS', 'HP2', 'CA003_3');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY1_VALUE,'-') || ' / ' || COALESCE(KEY2_VALUE,'-') || ' / ' || COALESCE(KEY3_VALUE,'-') || ' / ' || COALESCE(KEY4_VALUE,'-') || ' / ' || COALESCE(KEY5_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CA003_3' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_3');
	 
--Call SYSPROC.ADMIN_CMD('LOAD FROM 
--(SELECT ''Cleanup'', COALESCE(KEY1_VALUE,''-'') || '' / '' || COALESCE(KEY2_VALUE,''-'') || '' / '' || COALESCE(KEY3_VALUE,''-'') || '' / '' || COALESCE(KEY4_VALUE,''-'') || '' / '' || COALESCE(KEY5_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''HP2'', ''CA003_3'' 
--     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CA003_3'') OF CURSOR 
--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;
 
-- CA003_4
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CA003_4');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV007SIBS', 'SIBS', 'HP2', 'CA003_4');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CA003_4');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CA003_4');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, AA Create Date, Approved Date, Offer Date, Date Offer Accepted, Application Type, Application Law Type, Error Message', 'SIBS', 'HP2', 'CA003_4');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CA003_4' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_4' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON');
 
-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CA003_4');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV007SIBS', 'SIBS', 'MO2', 'CA003_4');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CA003_4');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CA003_4');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, AA Create Date, Approved Date, Offer Date, Date Offer Accepted, Application Type, Application Law Type, Error Message', 'SIBS', 'MO2', 'CA003_4');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CA003_4' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_4' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON');
 
-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CA003_4');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV007SIBS', 'SIBS', 'SF2', 'CA003_4');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CA003_4');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CA003_4');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, AA Create Date, Approved Date, Offer Date, Date Offer Accepted, Application Type, Application Law Type, Error Message', 'SIBS', 'SF2', 'CA003_4');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CA003_4' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_4' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON');
 
-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CA003_4');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV007SIBS', 'SIBS', 'ISL2', 'CA003_4');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CA003_4');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CA003_4');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Branch Code, AA Create Date, Approved Date, Offer Date, Date Offer Accepted, Application Type, Application Law Type, Error Message', 'SIBS', 'ISL2', 'CA003_4');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CA003_4' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_4' AND KEY2_VALUE = 'ISL');

-- CA003_5
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CA003_5');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV008SIBS', 'SIBS', 'HP2', 'CA003_5');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CA003_5');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CA003_5');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Limit ID / AA Number /Facility Code / Facility Sequence, Error Message', 'SIBS', 'HP2', 'CA003_5');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
-- 	(SELECT 'Cleanup', COALESCE(KEY1_VALUE,'-') || ' / ' || COALESCE(KEY2_VALUE,'-') || ' / ' || COALESCE(KEY3_VALUE,'-') || ' / ' || COALESCE(KEY4_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CA003_5' 
--      FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_5');
 
-- CA003_6
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CA003_6');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV009SIBS', 'SIBS', 'HP2', 'CA003_6');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CA003_6');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CA003_6');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Limit ID / AA Number /Facility Code / Facility Sequence / Tier Seq No, Error Message', 'SIBS', 'HP2', 'CA003_6');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
-- 	(SELECT 'Cleanup', COALESCE(KEY1_VALUE,'-') || ' / ' || COALESCE(KEY2_VALUE,'-') || ' / ' || COALESCE(KEY3_VALUE,'-') || ' / ' || COALESCE(KEY4_VALUE,'-') || ' / ' || COALESCE(KEY5_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CA003_6' 
--      FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_6');
 
-- CA003_7
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CA003_7');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV010SIBS', 'SIBS', 'HP2', 'CA003_7');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CA003_7');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CA003_7');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Limit ID / AA Number /Facility Code / Facility Sequence, Error Message', 'SIBS', 'HP2', 'CA003_7');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
-- 	(SELECT 'Cleanup', COALESCE(KEY1_VALUE,'-') || ' / ' || COALESCE(KEY2_VALUE,'-') || ' / ' || COALESCE(KEY3_VALUE,'-') || ' / ' || COALESCE(KEY4_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CA003_7' 
--      FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_7');
 
-- CA003_8
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CA003_8');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV011SIBS', 'SIBS', 'HP2', 'CA003_8');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CA003_8');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CA003_8');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Limit ID / AA Number /Facility Code / Facility Sequence, Error Message', 'SIBS', 'HP2', 'CA003_8');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
-- 	(SELECT 'Cleanup', COALESCE(KEY1_VALUE,'-') || ' / ' || COALESCE(KEY2_VALUE,'-') || ' / ' || COALESCE(KEY3_VALUE,'-') || ' / ' || COALESCE(KEY4_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CA003_8' 
--      FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003_8');
 
 
-----------------------------
-- Limit-Account
-----------------------------    
-- CA004
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CA004');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV016SIBS', 'SIBS', 'HP2', 'CA004');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CA004');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CA004');
-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Limit ID/ AA Number / External System Account No / Account Sequence, Error Message', 'SIBS', 'HP2', 'CA004');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
-- 	(SELECT 'Cleanup', COALESCE(KEY1_VALUE,'-') || ' / ' || COALESCE(KEY2_VALUE,'-') || ' / ' || COALESCE(KEY3_VALUE,'-') || ' / ' || COALESCE(KEY4_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CA004' 
--      FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA004');
 
 
 
-----------------------------
-- Collateral
-----------------------------
-- CO001:AB
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP1', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV018SIBS', 'SIBS', 'HP1', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP1', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP1', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'HP1', 'CO001');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	--COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP1', 'CO001' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO001' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN001', 'COM001', 'MANYEAR', 'NONOMV', 'ABPMO')); 
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''HP1'', ''CO001'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO001'' AND KEY1_VALUE = ''HP'' AND KEY2_VALUE = ''CON'' AND ERROR_CODE IN (''MAN001'', ''COM001'', ''MANYEAR'', ''NONOMV'', ''ABPMO'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV018SIBS', 'SIBS', 'HP2', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'HP2', 'CO001');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	--COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CO001' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO001' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN002', 'COM002')); 
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''HP2'', ''CO001'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO001'' AND KEY1_VALUE = ''HP'' AND KEY2_VALUE = ''CON'' AND ERROR_CODE IN (''MAN002'', ''COM002'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;

-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO1', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV018SIBS', 'SIBS', 'MO1', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO1', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO1', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'MO1', 'CO001');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	--COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO1', 'CO001' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO001' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN001', 'COM001', 'MANYEAR', 'NONOMV')); 
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''MO1'', ''CO001'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO001'' AND KEY1_VALUE = ''MO'' AND KEY2_VALUE = ''CON'' AND ERROR_CODE IN (''MAN001'', ''COM001'', ''MANYEAR'', ''NONOMV'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV018SIBS', 'SIBS', 'MO2', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'MO2', 'CO001');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	--COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CO001' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO001' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN002', 'COM002')); 
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''MO2'', ''CO001'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO001'' AND KEY1_VALUE = ''MO'' AND KEY2_VALUE = ''CON'' AND ERROR_CODE IN (''MAN002'', ''COM002'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;
 
-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF1', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV018SIBS', 'SIBS', 'SF1', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF1', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF1', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'SF1', 'CO001');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	--COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF1', 'CO001' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO001' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN001', 'COM001', 'MANYEAR', 'NONOMV')); 
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''SF1'', ''CO001'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO001'' AND KEY1_VALUE = ''SF'' AND KEY2_VALUE = ''CON'' AND ERROR_CODE IN (''MAN001'', ''COM001'', ''MANYEAR'', ''NONOMV'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV018SIBS', 'SIBS', 'SF2', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'SF2', 'CO001');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	--COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CO001' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO001' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN002', 'COM002')); 
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''SF2'', ''CO001'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO001'' AND KEY1_VALUE = ''SF'' AND KEY2_VALUE = ''CON'' AND ERROR_CODE IN (''MAN002'', ''COM002'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;
 
-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL1', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV018SIBS', 'SIBS', 'ISL1', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL1', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL1', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'ISL1', 'CO001');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	--COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL1', 'CO001' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO001' AND KEY2_VALUE = 'ISL' AND ERROR_CODE IN ('MAN001', 'COM001', 'MANYEAR', 'NONOMV')); 
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''ISL1'', ''CO001'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO001'' AND KEY2_VALUE = ''ISL'' AND ERROR_CODE IN (''MAN001'', ''COM001'', ''MANYEAR'', ''NONOMV'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV018SIBS', 'SIBS', 'ISL2', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CO001');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'ISL2', 'CO001');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	--COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CO001' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO001' AND KEY2_VALUE = 'ISL' AND ERROR_CODE IN ('MAN002', 'COM002')); 
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''ISL2'', ''CO001'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO001'' AND KEY2_VALUE = ''ISL'' AND ERROR_CODE IN (''MAN002'', ''COM002'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;

-- CO002:AB-Gold
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CO002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV019SIBS', 'SIBS', 'HP2', 'CO002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CO002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CO002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'HP2', 'CO002');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CO002' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO002' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON'); 
 
-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CO002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV019SIBS', 'SIBS', 'MO2', 'CO002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CO002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CO002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'MO2', 'CO002');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CO002' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO002' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON'); 
 
-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CO002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV019SIBS', 'SIBS', 'SF2', 'CO002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CO002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CO002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'SF2', 'CO002');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CO002' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO002' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON'); 
 
-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CO002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV019SIBS', 'SIBS', 'ISL2', 'CO002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CO002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CO002');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'ISL2', 'CO002');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CO002' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO002' AND KEY2_VALUE = 'ISL'); 
 
-- CO005:CS
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CO005');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV022SIBS', 'SIBS', 'HP2', 'CO005');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CO005');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CO005');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'HP2', 'CO005');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CO005' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO005' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON');

-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CO005');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV022SIBS', 'SIBS', 'MO2', 'CO005');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CO005');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CO005');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'MO2', 'CO005');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CO005' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO005' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON');

-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CO005');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV022SIBS', 'SIBS', 'SF2', 'CO005');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CO005');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CO005');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'SF2', 'CO005');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CO005' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO005' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON');

-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CO005');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV022SIBS', 'SIBS', 'ISL2', 'CO005');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CO005');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CO005');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'ISL2', 'CO005');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CO005' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO005' AND KEY2_VALUE = 'ISL');

    
-- CO008:MS
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP1', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV024SIBS', 'SIBS', 'HP1', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP1', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP1', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'HP1', 'CO008');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP1', 'CO008' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO008' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN001', 'STKCODE'));

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV024SIBS', 'SIBS', 'HP2', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'HP2', 'CO008');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CO008' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO008' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN002'));

-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO1', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV024SIBS', 'SIBS', 'MO1', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO1', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO1', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'MO1', 'CO008');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO1', 'CO008' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO008' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN001', 'STKCODE'));

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV024SIBS', 'SIBS', 'MO2', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'MO2', 'CO008');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CO008' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO008' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN002'));

-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF1', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV024SIBS', 'SIBS', 'SF1', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF1', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF1', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'SF1', 'CO008');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF1', 'CO008' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO008' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN001', 'STKCODE'));

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV024SIBS', 'SIBS', 'SF2', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'SF2', 'CO008');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CO008' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO008' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN002'));

-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL1', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV024SIBS', 'SIBS', 'ISL1', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL1', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL1', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'ISL1', 'CO008');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL1', 'CO008' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO008' AND KEY2_VALUE = 'ISL' AND ERROR_CODE IN ('MAN001', 'STKCODE'));

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV024SIBS', 'SIBS', 'ISL2', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CO008');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'ISL2', 'CO008');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CO008' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO008' AND KEY2_VALUE = 'ISL' AND ERROR_CODE IN ('MAN002'));

-- CO009:PT
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP1', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV025SIBS', 'SIBS', 'HP1', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP1', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP1', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'HP1', 'CO009');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	--COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP1', 'CO009' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO009' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN001', 'SPPCMV', 'PTPHP'));
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''HP1'', ''CO009'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO009'' AND KEY1_VALUE = ''HP'' AND KEY2_VALUE = ''CON'' AND ERROR_CODE IN (''MAN001'', ''SPPCMV'', ''PTPHP'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');	

commit;		 

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV025SIBS', 'SIBS', 'HP2', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'HP2', 'CO009');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	--COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CO009' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO009' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN002', 'COM001', 'TENERR'));
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''HP2'', ''CO009'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO009'' AND KEY1_VALUE = ''HP'' AND KEY2_VALUE = ''CON'' AND ERROR_CODE IN (''MAN002'', ''COM001'', ''TENERR'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');	

commit;		 

-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO1', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV025SIBS', 'SIBS', 'MO1', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO1', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO1', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'MO1', 'CO009');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	--COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO1', 'CO009' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO009' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN001', 'SPPCMV', 'PTPHP'));
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''MO1'', ''CO009'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO009'' AND KEY1_VALUE = ''MO'' AND KEY2_VALUE = ''CON'' AND ERROR_CODE IN (''MAN001'', ''SPPCMV'', ''PTPHP'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');	

commit;		 

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV025SIBS', 'SIBS', 'MO2', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'MO2', 'CO009');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	--COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CO009' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO009' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN002', 'COM001', 'TENERR'));
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''MO2'', ''CO009'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO009'' AND KEY1_VALUE = ''MO'' AND KEY2_VALUE = ''CON'' AND ERROR_CODE IN (''MAN002'', ''COM001'', ''TENERR'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');	

commit;		 

-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF1', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV025SIBS', 'SIBS', 'SF1', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF1', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF1', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'SF1', 'CO009');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	--COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF1', 'CO009' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO009' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN001', 'SPPCMV', 'PTPHP'));
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''SF1'', ''CO009'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO009'' AND KEY1_VALUE = ''SF'' AND KEY2_VALUE = ''CON'' AND ERROR_CODE IN (''MAN001'', ''SPPCMV'', ''PTPHP'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');	

commit;		 

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV025SIBS', 'SIBS', 'SF2', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'SF2', 'CO009');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	--COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CO009' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO009' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MAN002', 'COM001', 'TENERR'));
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''SF2'', ''CO009'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO009'' AND KEY1_VALUE = ''SF'' AND KEY2_VALUE = ''CON'' AND ERROR_CODE IN (''MAN002'', ''COM001'', ''TENERR'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');	

commit;		 

-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL1', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV025SIBS', 'SIBS', 'ISL1', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL1', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL1', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'ISL1', 'CO009');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	--COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL1', 'CO009' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO009' AND KEY2_VALUE = 'ISL' AND ERROR_CODE IN ('MAN001', 'SPPCMV', 'PTPHP'));
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''ISL1'', ''CO009'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO009'' AND KEY2_VALUE = ''ISL'' AND ERROR_CODE IN (''MAN001'', ''SPPCMV'', ''PTPHP'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');	

commit;		 

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV025SIBS', 'SIBS', 'ISL2', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'ISL2', 'CO009');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	--COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CO009' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO009' AND KEY2_VALUE = 'ISL' AND ERROR_CODE IN ('MAN002', 'COM001', 'TENERR'));
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''ISL2'', ''CO009'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO009'' AND KEY2_VALUE = ''ISL'' AND ERROR_CODE IN (''MAN002'', ''COM001'', ''TENERR'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');	

commit;		 

-- MUKIM & DISTRICT
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'CON3', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV025SIBS', 'SIBS', 'CON3', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CON3', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'CON3', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Property Address, Property Address 2, Property Address 3, Mukim, District', 'SIBS', 'CON3', 'CO009');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || 
	-- COALESCE(KEY8_VALUE,'-'), 'SIBS', 'CON3', 'CO009' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO009' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON' AND ERROR_CODE IN ('MUDIS'));
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', ''"'' || COALESCE(KEY3_VALUE,''-'') || ''","'' || COALESCE(KEY4_VALUE,''-'') || ''","'' || COALESCE(KEY5_VALUE,''-'') || ''","'' || COALESCE(KEY6_VALUE,''-'') || ''","'' || COALESCE(KEY7_VALUE,''-'') || ''","'' || COALESCE(KEY8_VALUE,''-'') || ''","'' || 
	COALESCE(KEY1_VALUE,''-'') || ''","'' || COALESCE(KEY2_VALUE,''-'') || ''","'' || COALESCE(KEY9_VALUE,''-'') || ''","'' || COALESCE(KEY10_VALUE,''-'') || ''","'' || COALESCE(KEY11_VALUE,''-'') || ''","'' || COALESCE(KEY12_VALUE,''-'') || ''","'' || 
	COALESCE(KEY13_VALUE,''-'') || ''","'' || COALESCE(KEY14_VALUE,''-'') || ''","'' || COALESCE(KEY15_VALUE,''-'') || ''",'' || ''Please select'' || '','' || ''Please select'' , ''SIBS'', ''CON3'', ''CO009'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO009'' AND KEY2_VALUE = ''CON'' AND ERROR_CODE IN (''MUDIS'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');	

commit;		 

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL3', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV025SIBS', 'SIBS', 'ISL3', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL3', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL3', 'CO009');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Property Address, Property Address 2, Property Address 3, Mukim, District', 'SIBS', 'ISL3', 'CO009');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || 
	-- COALESCE(KEY8_VALUE,'-'), 'SIBS', 'ISL3', 'CO009' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO009' AND KEY1_VALUE = 'ISL' AND ERROR_CODE IN ('MUDIS'));
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', ''"'' || COALESCE(KEY3_VALUE,''-'') || ''","'' || COALESCE(KEY4_VALUE,''-'') || ''","'' || COALESCE(KEY5_VALUE,''-'') || ''","'' || COALESCE(KEY6_VALUE,''-'') || ''","'' || COALESCE(KEY7_VALUE,''-'') || ''","'' || COALESCE(KEY8_VALUE,''-'') || ''","'' || 
	COALESCE(KEY1_VALUE,''-'') || ''","'' || COALESCE(KEY2_VALUE,''-'') || ''","'' || COALESCE(KEY9_VALUE,''-'') || ''","'' || COALESCE(KEY10_VALUE,''-'') || ''","'' || COALESCE(KEY11_VALUE,''-'') || ''","'' || COALESCE(KEY12_VALUE,''-'') || ''","'' || 
	COALESCE(KEY13_VALUE,''-'') || ''","'' || COALESCE(KEY14_VALUE,''-'') || ''","'' || COALESCE(KEY15_VALUE,''-'') || ''",'' || ''Please select'' || '','' || ''Please select'' , ''SIBS'', ''ISL3'', ''CO009'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO009'' AND KEY2_VALUE = ''ISL'' AND ERROR_CODE IN (''MUDIS'')) OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');	

commit;		 

-- CO010:GT
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CO010');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV026SIBS', 'SIBS', 'HP2', 'CO010');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CO010');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CO010');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'HP2', 'CO010');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CO010' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO010' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON');

-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CO010');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV026SIBS', 'SIBS', 'MO2', 'CO010');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CO010');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CO010');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'MO2', 'CO010');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CO010' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO010' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON');

-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CO010');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV026SIBS', 'SIBS', 'SF2', 'CO010');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CO010');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CO010');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'SF2', 'CO010');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CO010' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO010' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON');

-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CO010');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV026SIBS', 'SIBS', 'ISL2', 'CO010');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CO010');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CO010');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'ISL2', 'CO010');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CO010' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO010' AND KEY2_VALUE = 'ISL');

-- CO011:OT
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CO011');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV027SIBS', 'SIBS', 'HP2', 'CO011');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CO011');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CO011');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'HP2', 'CO011');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CO011' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO011' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON');

-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CO011');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV027SIBS', 'SIBS', 'MO2', 'CO011');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CO011');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CO011');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'MO2', 'CO011');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CO011' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO011' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON');

-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CO011');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV027SIBS', 'SIBS', 'SF2', 'CO011');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CO011');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CO011');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'SF2', 'CO011');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CO011' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO011' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON');

-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CO011');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV027SIBS', 'SIBS', 'ISL2', 'CO011');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CO011');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CO011');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'ISL2', 'CO011');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CO011' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO011' AND KEY2_VALUE = 'ISL');

-- CO012:IN
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CO012');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV028SIBS', 'SIBS', 'HP2', 'CO012');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CO012');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CO012');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'HP2', 'CO012');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CO012' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO012' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON');

-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CO012');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV028SIBS', 'SIBS', 'MO2', 'CO012');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CO012');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CO012');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'MO2', 'CO012');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CO012' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO012' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON');

-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CO012');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV028SIBS', 'SIBS', 'SF2', 'CO012');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CO012');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CO012');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'SF2', 'CO012');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CO012' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO012' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON');

-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CO012');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV028SIBS', 'SIBS', 'ISL2', 'CO012');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CO012');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CO012');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'ISL2', 'CO012');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CO012' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO012' AND KEY2_VALUE = 'ISL');

-- CO014:CL
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CO014');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV030SIBS', 'SIBS', 'HP2', 'CO014');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CO014');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CO014');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'HP2', 'CO014');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CO014' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO014' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON');    

-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CO014');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV030SIBS', 'SIBS', 'MO2', 'CO014');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CO014');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CO014');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'MO2', 'CO014');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CO014' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO014' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON');    

-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CO014');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV030SIBS', 'SIBS', 'SF2', 'CO014');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CO014');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CO014');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'SF2', 'CO014');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CO014' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO014' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON');    

-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CO014');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV030SIBS', 'SIBS', 'ISL2', 'CO014');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CO014');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CO014');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'ISL2', 'CO014');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CO014' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO014' AND KEY2_VALUE = 'ISL');    

-- CO015:VL
--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CO015');
--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV031SIBS', 'SIBS', 'HP2', 'CO015');
--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CO015');
--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CO015');
--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Security ID, Error Message', 'SIBS', 'HP2', 'CO015');

--INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
--	(SELECT 'Cleanup', COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CO015' 
--     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO015');    

-- CO016:INS Policy
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CO016');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV032SIBS', 'SIBS', 'HP2', 'CO016');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CO016');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CO016');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Policy Number, Error Message', 'SIBS', 'HP2', 'CO016');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CO016' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO016' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON');    

-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CO016');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV032SIBS', 'SIBS', 'MO2', 'CO016');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CO016');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CO016');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Policy Number, Error Message', 'SIBS', 'MO2', 'CO016');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CO016' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO016' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON');    

-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CO016');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV032SIBS', 'SIBS', 'SF2', 'CO016');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CO016');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CO016');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Policy Number, Error Message', 'SIBS', 'SF2', 'CO016');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CO016' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO016' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON');    

-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CO016');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV032SIBS', 'SIBS', 'ISL2', 'CO016');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CO016');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CO016');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Policy Number, Error Message', 'SIBS', 'ISL2', 'CO016');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CO016' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO016' AND KEY2_VALUE = 'ISL');    

-- CO017:CD
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CO017');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV033SIBS', 'SIBS', 'HP2', 'CO017');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CO017');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CO017');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Ranking of Security, Error Message', 'SIBS', 'HP2', 'CO017');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	-- COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CO017' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO017' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON');    
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || COALESCE(KEY13_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''HP2'', ''CO017'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO017'' AND KEY1_VALUE = ''HP'' AND KEY2_VALUE = ''CON'') OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;

-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CO017');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV033SIBS', 'SIBS', 'MO2', 'CO017');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CO017');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CO017');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Ranking of Security, Error Message', 'SIBS', 'MO2', 'CO017');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	-- COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CO017' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO017' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON');    
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || COALESCE(KEY13_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''MO2'', ''CO017'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO017'' AND KEY1_VALUE = ''MO'' AND KEY2_VALUE = ''CON'') OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;

-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CO017');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV033SIBS', 'SIBS', 'SF2', 'CO017');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CO017');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CO017');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Ranking of Security, Error Message', 'SIBS', 'SF2', 'CO017');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	-- COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CO017' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO017' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON');    
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || COALESCE(KEY13_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''SF2'', ''CO017'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO017'' AND KEY1_VALUE = ''SF'' AND KEY2_VALUE = ''CON'') OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;

-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CO017');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV033SIBS', 'SIBS', 'ISL2', 'CO017');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CO017');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CO017');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Ranking of Security, Error Message', 'SIBS', 'ISL2', 'CO017');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	-- COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CO017' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO017' AND KEY2_VALUE = 'ISL');    
	 
Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || COALESCE(KEY13_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''ISL2'', ''CO017'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO017'' AND KEY2_VALUE = ''ISL'') OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;

-- CO018:Pledgor
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CO018');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV034SIBS', 'SIBS', 'HP2', 'CO018');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CO018');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CO018');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Pledgor CIF ID, Error Message', 'SIBS', 'HP2', 'CO018');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	-- COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CO018' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO018' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON');   

Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || COALESCE(KEY13_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''HP2'', ''CO018'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO018'' AND KEY1_VALUE = ''HP'' AND KEY2_VALUE = ''CON'') OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;

-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CO018');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV034SIBS', 'SIBS', 'MO2', 'CO018');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CO018');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CO018');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Pledgor CIF ID, Error Message', 'SIBS', 'MO2', 'CO018');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	-- COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CO018' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO018' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON');   

Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || COALESCE(KEY13_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''MO2'', ''CO018'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO018'' AND KEY1_VALUE = ''MO'' AND KEY2_VALUE = ''CON'') OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;

-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CO018');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV034SIBS', 'SIBS', 'SF2', 'CO018');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CO018');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CO018');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Pledgor CIF ID, Error Message', 'SIBS', 'SF2', 'CO018');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	-- COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CO018' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO018' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON');   

Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || COALESCE(KEY13_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''SF2'', ''CO018'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO018'' AND KEY1_VALUE = ''SF'' AND KEY2_VALUE = ''CON'') OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;

-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CO018');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV034SIBS', 'SIBS', 'ISL2', 'CO018');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CO018');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CO018');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Pledgor CIF ID, Error Message', 'SIBS', 'ISL2', 'CO018');

-- INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	-- (SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	-- COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || COALESCE(KEY13_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CO018' 
     -- FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO018' AND KEY2_VALUE = 'ISL');   

Call SYSPROC.ADMIN_CMD('LOAD FROM 
(SELECT ''Cleanup'', COALESCE(KEY3_VALUE,''-'') || '','' || COALESCE(KEY4_VALUE,''-'') || '','' || COALESCE(KEY5_VALUE,''-'') || '','' || COALESCE(KEY6_VALUE,''-'') || '','' || COALESCE(KEY7_VALUE,''-'') || '','' || COALESCE(KEY8_VALUE,''-'') || '','' || 
	COALESCE(KEY1_VALUE,''-'') || '','' || COALESCE(KEY2_VALUE,''-'') || '','' || COALESCE(KEY9_VALUE,''-'') || '','' || COALESCE(KEY10_VALUE,''-'') || '','' || COALESCE(KEY11_VALUE,''-'') || '','' || COALESCE(KEY12_VALUE,''-'') || '','' || COALESCE(KEY13_VALUE,''-'') || '','' || ERROR_MSG, ''SIBS'', ''ISL2'', ''CO018'' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = ''SIBS'' AND INTERFACE_ID = ''CO018'' AND KEY2_VALUE = ''ISL'') OF CURSOR 
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)');		 

commit;

-- CO019:Pledge
-- HP
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'HP2', 'CO019');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV035SIBS', 'SIBS', 'HP2', 'CO019');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'HP2', 'CO019');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'HP2', 'CO019');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'HP2', 'CO019');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'HP2', 'CO019' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO019' AND KEY1_VALUE = 'HP' AND KEY2_VALUE = 'CON');    

-- MO
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'MO2', 'CO019');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV035SIBS', 'SIBS', 'MO2', 'CO019');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'MO2', 'CO019');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'MO2', 'CO019');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'MO2', 'CO019');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'MO2', 'CO019' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO019' AND KEY1_VALUE = 'MO' AND KEY2_VALUE = 'CON');    

-- SF
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'SF2', 'CO019');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV035SIBS', 'SIBS', 'SF2', 'CO019');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'SF2', 'CO019');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'SF2', 'CO019');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'SF2', 'CO019');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'SF2', 'CO019' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO019' AND KEY1_VALUE = 'SF' AND KEY2_VALUE = 'CON');    

-- ISL
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Data Cleanup Report for Migration', 'SIBS', 'ISL2', 'CO019');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report for migration template: CV035SIBS', 'SIBS', 'ISL2', 'CO019');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'ISL2', 'CO019');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'Records requiring cleanup:', 'SIBS', 'ISL2', 'CO019');
INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID) VALUES ('Cleanup', 'CIF ID, SIBS AA Number, LOS AA Number, Limit ID, Facility Code, Facility Sequence, Application Type, Application Law Type, Security ID, Branch Code, Source Security Sub-Type, CMS Security Sub-Type, Error Message', 'SIBS', 'ISL2', 'CO019');

INSERT INTO MIG_DATA_CLEANUP_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, CRITERIA, INTERFACE_ID)
	(SELECT 'Cleanup', COALESCE(KEY3_VALUE,'-') || ',' || COALESCE(KEY4_VALUE,'-') || ',' || COALESCE(KEY5_VALUE,'-') || ',' || COALESCE(KEY6_VALUE,'-') || ',' || COALESCE(KEY7_VALUE,'-') || ',' || COALESCE(KEY8_VALUE,'-') || ',' || 
	COALESCE(KEY1_VALUE,'-') || ',' || COALESCE(KEY2_VALUE,'-') || ',' || COALESCE(KEY9_VALUE,'-') || ',' || COALESCE(KEY10_VALUE,'-') || ',' || COALESCE(KEY11_VALUE,'-') || ',' || COALESCE(KEY12_VALUE,'-') || ',' || ERROR_MSG, 'SIBS', 'ISL2', 'CO019' 
     FROM MIG_DATA_CLEANUP WHERE SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO019' AND KEY2_VALUE = 'ISL');    

