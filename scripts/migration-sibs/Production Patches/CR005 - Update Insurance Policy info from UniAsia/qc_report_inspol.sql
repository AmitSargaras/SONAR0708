----------------------------------
-- QC REPORT - Error Report
----------------------------------
INSERT INTO PATCH_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ERROR', 'QC Report - error report on cause of failure during validation ', 'SIBS', 'CO016');
INSERT INTO PATCH_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ERROR', 'Report for CR005 - Update Insurance Policy info from UniAsia', 'SIBS', 'CO016');
INSERT INTO PATCH_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ERROR', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO016');
INSERT INTO PATCH_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ERROR', 'Records patched(s): ' || (SELECT char(COUNT(*)) FROM PATCH_CO016_IN WHERE IS_VALID = 'Y'), 'SIBS', 'CO016');
INSERT INTO PATCH_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ERROR', 'AA NUMBER , COLLATERAL NAME , POLICY SEQ NUMBER , INSURANCE POLICY NUMBER , INSURER NAME , ERROR MESSAGE ', 'SIBS', 'CO016');

INSERT INTO PATCH_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ERROR', COALESCE(AA_NUMBER,'-') || ' , ' || COALESCE(SECURITY_REF_NOTE,'-') || ' , ' || COALESCE(POLICY_SEQ_NO,'-') 
		|| ' , ' || COALESCE(POLICY_NUMBER,'-') || ' , ' || COALESCE(INSURER_NAME,'-') || ' , ' || COALESCE(ERROR_MSG, '-'), 'SIBS', 'CO016' 
     FROM PATCH_CO016_IN WHERE IS_VALID = 'N');
	 
----------------------------------
-- QC REPORT - Valid Report
----------------------------------	 
INSERT INTO PATCH_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ISVALID', 'QC Report - total count of valid record going to be updated ', 'SIBS', 'CO016');
INSERT INTO PATCH_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ISVALID', 'Report for CR005 - Update Insurance Policy info from UniAsia', 'SIBS', 'CO016');
INSERT INTO PATCH_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ISVALID', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO016');
INSERT INTO PATCH_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ISVALID', 'Total Number of Records', 'SIBS', 'CO016');

INSERT INTO PATCH_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ISVALID', CHAR(COUNT(*)), 'SIBS', 'CO016' FROM MIG_CO016_CU WHERE IS_VALID = 'Y');

----------------------------------
-- QC REPORT - Updated Report
----------------------------------	 
INSERT INTO PATCH_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('UPDATED', 'QC Report - total count of valid record updated', 'SIBS', 'CO016');
INSERT INTO PATCH_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('UPDATED', 'Report for CR005 - Update Insurance Policy info from UniAsia', 'SIBS', 'CO016');
INSERT INTO PATCH_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('UPDATED', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO016');
INSERT INTO PATCH_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('UPDATED', 'Total Number of Records', 'SIBS', 'CO016');

INSERT INTO PATCH_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'UPDATED', 'Insurance Policy: ,' || CHAR(COUNT(*)), 'SIBS', 'CO016' FROM CMS_INSURANCE_POLICY cust, PATCH_CO016_IN mig
		WHERE col.SOURCE_ID = 'SIBS' AND col.INSURANCE_POLICY_ID = mig.cms_act_insr_id AND col.CMS_COLLATERAL_ID = mig.cms_act_col_id AND mig.IS_VALID = 'Y');
