-----------------------------
-- Cleanup
-----------------------------
DELETE FROM MIG_QC_REPORT;

-----------------------------
-- Customer
-----------------------------
-- CU002
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'ARBS', 'CU002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CU002', 'ARBS', 'CU002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'ARBS', 'CU002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'ARBS', 'CU002');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'ARBS', 'CU002' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'ARBS' AND INTERFACE_ID= 'CU002' AND ERROR_CODE = 'BizErr003');
	
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'SEMA', 'CU002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CU002', 'SEMA', 'CU002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SEMA', 'CU002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'SEMA', 'CU002');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'SEMA', 'CU002' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'SEMA' AND INTERFACE_ID= 'CU002' AND ERROR_CODE = 'BizErr003');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'FINS', 'CU002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CU002', 'FINS', 'CU002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'FINS', 'CU002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'FINS', 'CU002');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'FINS', 'CU002' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'FINS' AND INTERFACE_ID= 'CU002' AND ERROR_CODE = 'BizErr003');

-- CU003
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'ARBS', 'CU003');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CU003', 'ARBS', 'CU003');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'ARBS', 'CU003');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'ARBS', 'CU003');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'ARBS', 'CU003' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'ARBS' AND INTERFACE_ID= 'CU003' AND ERROR_CODE = 'BizErr003');

-- CU004
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'SEMA', 'CU004');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CU004', 'SEMA', 'CU004');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SEMA', 'CU004');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'SEMA', 'CU004');
--
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
--	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'SEMA', 'CU004' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'SEMA' AND INTERFACE_ID= 'CU004' AND ERROR_CODE = 'BizErr003');

	
-----------------------------
-- Credit Application (CA)
-----------------------------
-- CA001
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'ARBS', 'CA001');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA001', 'ARBS', 'CA001');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'ARBS', 'CA001');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'ARBS', 'CA001');
--
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
--	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'ARBS', 'CA001' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'ARBS' AND INTERFACE_ID= 'CA001' AND ERROR_CODE = 'BizErr003');
--
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'SEMA', 'CA001');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA001', 'SEMA', 'CA001');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SEMA', 'CA001');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'SEMA', 'CA001');
--
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
--	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'SEMA', 'CA001' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'SEMA' AND INTERFACE_ID= 'CA001' AND ERROR_CODE = 'BizErr003');
--
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'BOST', 'CA001');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA001', 'BOST', 'CA001');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'BOST', 'CA001');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'BOST', 'CA001');
--
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
--	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'BOST', 'CA001' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'BOST' AND INTERFACE_ID= 'CA001' AND ERROR_CODE = 'BizErr003');
--
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'FINS', 'CA001');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA001', 'FINS', 'CA001');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'FINS', 'CA001');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'FINS', 'CA001');
--
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
--	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'FINS', 'CA001' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'FINS' AND INTERFACE_ID= 'CA001' AND ERROR_CODE = 'BizErr003');
	
-- CA002
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'ARBS', 'CA002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA002', 'ARBS', 'CA002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'ARBS', 'CA002');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'ARBS', 'CA002');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'ARBS', 'CA002' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'ARBS' AND INTERFACE_ID= 'CA002' AND ERROR_CODE = 'BizErr003');

-- CA003
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'ARBS', 'CA003');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA003', 'ARBS', 'CA003');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'ARBS', 'CA003');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'ARBS', 'CA003');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'ARBS', 'CA003' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'ARBS' AND INTERFACE_ID= 'CA003' AND ERROR_CODE = 'BizErr003');

-- CA004
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'ARBS', 'CA004');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA004', 'ARBS', 'CA004');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'ARBS', 'CA004');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'ARBS', 'CA004');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'ARBS', 'CA004' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'ARBS' AND INTERFACE_ID= 'CA004' AND ERROR_CODE = 'BizErr003');

-- CA005
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'ARBS', 'CA005');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA005', 'ARBS', 'CA005');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'ARBS', 'CA005');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'ARBS', 'CA005');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'ARBS', 'CA005' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'ARBS' AND INTERFACE_ID= 'CA005' AND ERROR_CODE = 'BizErr003');

-- CA006
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'TSPR', 'CA006');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA006', 'TSPR', 'CA006');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'TSPR', 'CA006');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'TSPR', 'CA006');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'TSPR', 'CA006' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'TSPR' AND INTERFACE_ID= 'CA006' AND ERROR_CODE = 'BizErr003');

-- CA007 N/A

-- CA008
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'TSPR', 'CA008');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA008', 'TSPR', 'CA008');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'TSPR', 'CA008');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'TSPR', 'CA008');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'TSPR', 'CA008' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'TSPR' AND INTERFACE_ID= 'CA008' AND ERROR_CODE = 'BizErr003');

-- CA009 N/A

-- CA010
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'TSPR', 'CA010');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA008', 'TSPR', 'CA010');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'TSPR', 'CA010');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'TSPR', 'CA010');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'TSPR', 'CA010' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'TSPR' AND INTERFACE_ID= 'CA010' AND ERROR_CODE = 'BizErr003');

-- CA011 N/A

-- CA012
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'SEMA', 'CA012');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA012', 'SEMA', 'CA012');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SEMA', 'CA012');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'SEMA', 'CA012');
--
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
--	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'SEMA', 'CA012' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'SEMA' AND INTERFACE_ID= 'CA012' AND ERROR_CODE = 'BizErr003');

-- CA015
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'BOST', 'CA015');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA015', 'BOST', 'CA015');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'BOST', 'CA015');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'BOST', 'CA015');
--
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
--	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'BOST', 'CA015' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'BOST' AND INTERFACE_ID= 'CA015' AND ERROR_CODE = 'BizErr003');

-- CA016
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'QUAN', 'CA016');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA016', 'QUAN', 'CA016');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'QUAN', 'CA016');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'QUAN', 'CA016');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'QUAN', 'CA016' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'QUAN' AND INTERFACE_ID= 'CA016' AND ERROR_CODE = 'BizErr003');

-- CA017
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'FINS', 'CA017');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA017', 'FINS', 'CA017');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'FINS', 'CA017');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'FINS', 'CA017');
--
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
--	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'FINS', 'CA017' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'FINS' AND INTERFACE_ID= 'CA017' AND ERROR_CODE = 'BizErr003');

-- CA018
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'FINS', 'CA018');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA018', 'FINS', 'CA018');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'FINS', 'CA018');
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'FINS', 'CA018');
--
--INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
--	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'FINS', 'CA018' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'FINS' AND INTERFACE_ID= 'CA018' AND ERROR_CODE = 'BizErr003');

-- CA019
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'ARBS', 'CA019');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CA019', 'ARBS', 'CA019');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'ARBS', 'CA019');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'ARBS', 'CA019');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'ARBS', 'CA019' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'ARBS' AND INTERFACE_ID= 'CA019' AND ERROR_CODE = 'BizErr003');


-----------------------------
-- Collateral
-----------------------------
-- CO006
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'ARBS', 'CO006');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CO006', 'ARBS', 'CO006');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'ARBS', 'CO006');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'ARBS', 'CO006');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'ARBS', 'CO006' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'ARBS' AND INTERFACE_ID= 'CO006' AND ERROR_CODE = 'BizErr003');

-- CO016
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'ARBS', 'CO016');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CO016', 'ARBS', 'CO016');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'ARBS', 'CO016');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'ARBS', 'CO016');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'ARBS', 'CO016' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'ARBS' AND INTERFACE_ID= 'CO016' AND ERROR_CODE = 'BizErr003');

-- CO017
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'ARBS', 'CO017');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CO017', 'ARBS', 'CO017');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'ARBS', 'CO017');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'ARBS', 'CO017');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'ARBS', 'CO017' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'ARBS' AND INTERFACE_ID= 'CO017' AND ERROR_CODE = 'BizErr003');

-- CO018
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'ARBS', 'CO018');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CO018', 'ARBS', 'CO018');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'ARBS', 'CO018');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'ARBS', 'CO018');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'ARBS', 'CO018' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'ARBS' AND INTERFACE_ID= 'CO018' AND ERROR_CODE = 'BizErr003');

-- CO020
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'SEMA', 'CO020');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CO020', 'SEMA', 'CO020');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SEMA', 'CO020');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'SEMA', 'CO020');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'SEMA', 'CO020' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'SEMA' AND INTERFACE_ID= 'CO020' AND ERROR_CODE = 'BizErr003');

-- CO021
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'TSPR', 'CO021');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CO021', 'TSPR', 'CO021');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'TSPR', 'CO021');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'TSPR', 'CO021');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'TSPR', 'CO021' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'TSPR' AND INTERFACE_ID= 'CO021' AND ERROR_CODE = 'BizErr003');

-- CO022
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'BOST', 'CO022');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CO022', 'BOST', 'CO022');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'BOST', 'CO022');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'BOST', 'CO022');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'BOST', 'CO022' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'BOST' AND INTERFACE_ID= 'CO022' AND ERROR_CODE = 'BizErr003');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'STBG', 'CO022');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CO022', 'STBG', 'CO022');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'STBG', 'CO022');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'STBG', 'CO022');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'STBG', 'CO022' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'STBG' AND INTERFACE_ID= 'CO022' AND ERROR_CODE = 'BizErr003');

-- CO023
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'BOST', 'CO023');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CO023', 'BOST', 'CO023');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'BOST', 'CO023');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'BOST', 'CO023');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'BOST', 'CO023' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'BOST' AND INTERFACE_ID= 'CO023' AND ERROR_CODE = 'BizErr003');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'STBG', 'CO023');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CO023', 'STBG', 'CO023');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'STBG', 'CO023');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'STBG', 'CO023');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'STBG', 'CO023' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'STBG' AND INTERFACE_ID= 'CO023' AND ERROR_CODE = 'BizErr003');

-- CO024
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'STBG', 'CO024');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CO024', 'STBG', 'CO024');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'STBG', 'CO024');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'STBG', 'CO024');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'STBG', 'CO024' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'STBG' AND INTERFACE_ID= 'CO024' AND ERROR_CODE = 'BizErr003');

-- CO025
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'QC Report 3f for Migration', 'BOST', 'CO025');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report for migration template: CO025', 'BOST', 'CO025');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'BOST', 'CO025');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrLink', 'CIF / AA number / Facility ID / Security ID / ID / Key , Missing Linkages', 'BOST', 'CO025');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ErrLink', '''' || COALESCE(KEY1_VALUE,'-') || ',' || ERROR_MSG, 'BOST', 'CO025' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'BOST' AND INTERFACE_ID= 'CO025' AND ERROR_CODE = 'BizErr003');

COMMIT;
