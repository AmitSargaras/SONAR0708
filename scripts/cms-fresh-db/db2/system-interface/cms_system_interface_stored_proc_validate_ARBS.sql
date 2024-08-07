-- SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM, CLIMS_LOCAL@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CU001@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CU002@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CU003@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CA001@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CA002@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CA003@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CA004@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CA005@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO001@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO002@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO003@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO004@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO005@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO006@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO007@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO008@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO009@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO010@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO011@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO012@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO013@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO014@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO015@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO016@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO017@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CO018@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_CA019@
--DROP PROCEDURE SI_VALIDATE_TEMP_ARBS_PF003@

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CU001
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CU001', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CU001 a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
	    OR length(CIF_ID)=0
	    OR length(CUST_NAME_L)=0
	    OR length(CUST_NAME_S)=0
	    OR length(CUST_CLASS_CODE)=0
			OR length(CUST_CLASS_DESC)=0
			OR length(ID_TYPE_CODE)=0
			OR length(ID_TYPE_DESC)=0
			OR length(ID_NUMBER)=0
			OR (length(SECONDARY_ID_TYPE_CODE)>0 AND length(SECONDARY_ID_TYPE_DESC)=0)
			OR length(CUST_SEGMENT_CODE)=0
			OR length(CUST_SEGMENT_DESC)=0
			OR (length(INCOME_GROUP_CODE)>0 AND length(INCOME_GROUP_DESC)=0)
			OR (length(ISIC_CODE)>0 AND length(ISIC_DESC)=0)
			OR (length(PRIMARY_ADD_TYPE_CODE)>0 AND length(PRIMARY_ADD_TYPE_DESC)=0)
			OR (length(LANGUAGE_CODE)>0 AND length(LANGUAGE_DESC)=0)
			OR (length(SECONDARY_ADD_TYPE_CODE)>0 AND length(SECONDARY_ADD_TYPE_DESC)=0);

	    
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CU001', CIF_ID, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| SI_BVL(CIF_ID, ' [CIF_ID] ')
			|| SI_BVL(CUST_NAME_L, ' [CUST_NAME_L] ')
			|| SI_BVL(CUST_NAME_S, ' [CUST_NAME_S] ')
			|| SI_BVL(CUST_CLASS_CODE, ' [CUST_CLASS_CODE] ')
			|| SI_BVL(CUST_CLASS_DESC, ' [CUST_CLASS_DESC] ')
			|| SI_BVL(ID_TYPE_CODE, ' [ID_TYPE_CODE] ')
			|| SI_BVL(ID_TYPE_DESC, ' [ID_TYPE_DESC] ')
			|| SI_BVL(ID_NUMBER, ' [ID_NUMBER] ')
			||(CASE WHEN length(SECONDARY_ID_TYPE_CODE)>0 THEN SI_BVL(SECONDARY_ID_TYPE_DESC, ' [SECONDARY_ID_TYPE_DESC] ') ELSE '' END)
			|| SI_BVL(CUST_SEGMENT_CODE, ' [CUST_SEGMENT_CODE] ')
			|| SI_BVL(CUST_SEGMENT_DESC, ' [CUST_SEGMENT_DESC] ')
			||(CASE WHEN length(INCOME_GROUP_CODE)>0 THEN SI_BVL(INCOME_GROUP_DESC, ' [INCOME_GROUP_DESC] ') ELSE '' END)
			||(CASE WHEN length(ISIC_CODE)>0 THEN SI_BVL(ISIC_DESC, ' [ISIC_DESC] ') ELSE '' END)
			||(CASE WHEN length(PRIMARY_ADD_TYPE_CODE)>0 THEN SI_BVL(PRIMARY_ADD_TYPE_DESC, ' [PRIMARY_ADD_TYPE_DESC] ') ELSE '' END)
			||(CASE WHEN length(LANGUAGE_CODE)>0 THEN SI_BVL(LANGUAGE_DESC, ' [LANGUAGE_DESC] ') ELSE '' END)
			||(CASE WHEN length(SECONDARY_ADD_TYPE_CODE)>0 THEN SI_BVL(SECONDARY_ADD_TYPE_DESC, ' [SECONDARY_ADD_TYPE_DESC] ') ELSE '' END)
			|| ' is/are empty.'
	   FROM SI_TEMP_ARBS_CU001
	  WHERE is_valid = 'N');
	  
		CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CU001', 'ARBS', 2);
		commit;
		
		---------------------------------
		-- Check for duplicate records
		--
		---------------------------------
		
	  UPDATE SI_TEMP_ARBS_CU001 a set is_valid = 'N'
	  where a.cif_id in (select t.cif_id
	  	from SI_TEMP_ARBS_CU001 t
	  	group by t.cif_id
	  	having count(*) > 1)
	  and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	  (select current_timestamp, 'ARBS', 'CU001', cif_id, 'BizErr004', 
		'[M] Duplicate CIF Id [' 
	  	|| cif_id || '] - ' || trim(char(count(*))) || ' records found]'
	  from SI_TEMP_ARBS_CU001 where is_valid = 'N'
	  group by cif_id
	  having count(*) > 1);
		
		CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CU001', 'ARBS', 3);
		commit;
		
		----------------------------------------
		-- Check update status indicator
		-- for D where record non-exist in CLIMS
		--
		----------------------------------------
		
	  UPDATE SI_TEMP_ARBS_CU001 a set is_valid = 'N'
	  where a.UPDATE_STAT_IND = 'D'
			and a.cif_id not in (select b.LMP_LE_ID from SCI_LE_MAIN_PROFILE b where b.SOURCE_ID = 'ARBS')
	  	and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	  (select current_timestamp, 'ARBS', 'CU001', cif_id, 'BizErr004', 
		'[M] Failed to find deleted customer in CLIMS with CIF Id [' || cif_id || ']'
	  from SI_TEMP_ARBS_CU001 a where a.UPDATE_STAT_IND = 'D'
			and a.cif_id not in (select b.LMP_LE_ID from SCI_LE_MAIN_PROFILE b where b.SOURCE_ID = 'ARBS')
	  	and a.is_valid = 'N');
	  
	  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CU001', 'ARBS', 0);
END
@


CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CU002
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CU002', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CU002 a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
			OR length(CIF_ID)=0
			OR length(CREDIT_GRADE_TYPE)=0
			OR length(CREDIT_GRADE_VALUE)=0
			OR length(UPDATE_STAT_IND)=0;

	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CU002', cif_id, CREDIT_GRADE_TYPE, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| SI_BVL(cif_id, ' [CIF_ID] ')
			|| SI_BVL(CREDIT_GRADE_TYPE, ' [CREDIT_GRADE_TYPE] ')
			|| SI_BVL(CREDIT_GRADE_VALUE, ' [CREDIT_GRADE_VALUE] ')
			|| SI_BVL(UPDATE_STAT_IND, ' [UPDATE_STAT_IND] ')
			|| ' is/are empty.'
	   FROM SI_TEMP_ARBS_CU002
	  WHERE is_valid = 'N');
	  
		---------------------------------
		-- Check for duplicate records
		--
		---------------------------------
	  UPDATE SI_TEMP_ARBS_CU002 a set is_valid = 'N'
	  where exists (select 1
	  	from SI_TEMP_ARBS_CU002 t
			where t.CIF_ID=a.CIF_ID and t.CREDIT_GRADE_TYPE=a.CREDIT_GRADE_TYPE
	  	having count(*) > 1)
		and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	  (select current_timestamp, 'ARBS', 'CU002', cif_id, CREDIT_GRADE_TYPE, 'BizErr004', 
		'[M] Duplicate CIF and customer credit grade found for CIF Id [' 
	  	|| cif_id || '] Credit Grade Type [' || CREDIT_GRADE_TYPE || '] - ' || trim(char(count(*))) || ' records found]'
	  from SI_TEMP_ARBS_CU002 a
		where exists (select 1
	  	from SI_TEMP_ARBS_CU002 t
			where t.CIF_ID=a.CIF_ID and t.CREDIT_GRADE_TYPE=a.CREDIT_GRADE_TYPE
	  	having count(*) > 1)
		and is_valid = 'N'
		group by CIF_ID, CREDIT_GRADE_TYPE);
		
		-----------------------------------------
		-- Check for Dependency
		-- to check against SCI_LE_MAIN_PROFILE
		--
		-----------------------------------------
	
		UPDATE si_temp_arbs_cu002 a SET is_valid = 'N'
		WHERE NOT EXISTS (SELECT '1' FROM sci_le_main_profile
							WHERE lmp_le_id = a.cif_id
								AND source_id = 'ARBS');
								
		INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
		(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CU002', cif_id, CREDIT_GRADE_TYPE, 'BizErr003', 
		'[H] Failed to find customer info for CIF Id [' || cif_id || '] from ARBS CU001 interface file'
			FROM si_temp_arbs_cu002 
		WHERE is_valid = 'N'
			AND NOT EXISTS (SELECT '1' FROM sci_le_main_profile
							WHERE lmp_le_id = cif_id
								AND source_id = 'ARBS'));
								
		CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CU002', 'ARBS', 2);
		commit;
		
		----------------------------------------
		-- Check update status indicator
		-- for D where record non-exist in CLIMS
		--
		----------------------------------------
		
	  UPDATE SI_TEMP_ARBS_CU002 a set is_valid = 'N'
	  where a.UPDATE_STAT_IND = 'D'
			and not exists (select 1 from sci_le_credit_grade b, sci_le_main_profile mp 
				where mp.SOURCE_ID = 'ARBS'
					and a.cif_id = b.LCG_LE_ID
					and a.CREDIT_GRADE_TYPE = b.LCG_CRDT_GRADE_TYPE_VALUE
					and mp.cms_le_main_profile_id = b.cms_main_profile_id)
	  	and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	  (select current_timestamp, 'ARBS', 'CU002', cif_id, CREDIT_GRADE_TYPE,  'BizErr004', 
		'[M] Failed to find deleted customer credit grade in CLIMS with CIF Id [' || cif_id || '] Credit Grade Type [' || CREDIT_GRADE_TYPE || ']'
	  from SI_TEMP_ARBS_CU002 a
	  WHERE a.is_valid = 'N'
			and a.UPDATE_STAT_IND = 'D'
			and not exists (select 1 from sci_le_credit_grade b, sci_le_main_profile mp 
				where mp.SOURCE_ID = 'ARBS'
					and a.cif_id = b.LCG_LE_ID
					and a.CREDIT_GRADE_TYPE = b.LCG_CRDT_GRADE_TYPE_VALUE
					and mp.cms_le_main_profile_id = b.cms_main_profile_id));
	  
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CU002', 'ARBS', 0);  
END
@


CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CU003
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CU003', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CU003 a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
			OR length(OLD_CIF_ID)=0
			OR length(NEW_CIF_ID)=0;

	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CU003', OLD_CIF_ID, NEW_CIF_ID, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| SI_BVL(OLD_CIF_ID, ' [OLD_CIF_ID] ')
			|| SI_BVL(NEW_CIF_ID, ' [NEW_CIF_ID] ')
			|| ' is/are empty.'
	   FROM SI_TEMP_ARBS_CU003
	  WHERE is_valid = 'N');
	  
		---------------------------------
		-- Check for duplicate records
		--
		---------------------------------
		
	  UPDATE SI_TEMP_ARBS_CU003 a set is_valid = 'N'
	  where exists (select 1
	  	from SI_TEMP_ARBS_CU003 t
			where t.NEW_CIF_ID=a.NEW_CIF_ID and t.OLD_CIF_ID=a.OLD_CIF_ID
	  	having count(*) > 1)
		and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	  (select current_timestamp, 'ARBS', 'CU003',  OLD_CIF_ID, NEW_CIF_ID, 'BizErr004', 
		'[M] Duplicate OLD CIF ID [' || OLD_CIF_ID 
		|| '] NEW CIF ID [' || NEW_CIF_ID || '] - ' || trim(char(count(*))) || ' records found]'
	  from SI_TEMP_ARBS_CU003 a
		where exists (select 1
	  	from SI_TEMP_ARBS_CU003 t
			where t.NEW_CIF_ID=a.NEW_CIF_ID and t.OLD_CIF_ID=a.OLD_CIF_ID
	  	having count(*) > 1)
		and is_valid = 'N'
		group by OLD_CIF_ID, NEW_CIF_ID);
		
		-----------------------------------------
		-- Check for Dependency
		-- to check against SCI_LE_MAIN_PROFILE
		--
		-----------------------------------------
	
		UPDATE SI_TEMP_ARBS_CU003 a SET is_valid = 'N'
		WHERE NOT EXISTS (SELECT '1' FROM sci_le_main_profile
							WHERE lmp_le_id = a.NEW_CIF_ID
								AND source_id = 'ARBS')
					and is_valid = 'Y';
								
		INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
		(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CU003', OLD_CIF_ID, NEW_CIF_ID, 'BizErr003', 
		'[H] Failed to find customer info for CIF Id [' || NEW_CIF_ID ||'] from ARBS CU001 interface file'
			FROM SI_TEMP_ARBS_CU003 
		WHERE is_valid = 'N'
			AND NOT EXISTS (SELECT '1' FROM sci_le_main_profile
							WHERE lmp_le_id = NEW_CIF_ID
								AND source_id = 'ARBS'));
	  
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CU003', 'ARBS', 0);  
END
@


CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CA001
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA001', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CA001 a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
			OR length(CIF_ID)=0
			OR length(CIF_SOURCE)=0
			OR length(AA_NUMBER)=0
			OR length(JOINT_BORROWER_IND)=0
			OR AA_APPROVED_DATE is null
			OR length(ORI_LOC_COUNTRY)=0
			OR length(ORI_LOC_ORG_CODE)=0
			OR length(ORI_LOC_ORG_DESC)=0
			OR length(AA_STAT)=0
			OR AA_CREATE_DATE is null;

	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CA001', CIF_ID, AA_NUMBER, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| SI_BVL(CIF_ID, ' [CIF_ID] ')
			|| SI_BVL(CIF_SOURCE, ' [CIF_SOURCE] ')
			|| SI_BVL(AA_NUMBER, ' [AA_NUMBER] ')
			|| SI_BVL(JOINT_BORROWER_IND, ' [JOINT_BORROWER_IND] ')
			|| NVL2(char(AA_APPROVED_DATE), '', ' [AA_APPROVED_DATE] ')
			|| SI_BVL(ORI_LOC_COUNTRY, ' [ORI_LOC_COUNTRY] ')
			|| SI_BVL(ORI_LOC_ORG_CODE, ' [ORI_LOC_ORG_CODE] ')
			|| SI_BVL(ORI_LOC_ORG_DESC, ' [ORI_LOC_ORG_DESC] ')
			|| SI_BVL(AA_STAT, ' [AA_STAT] ')
			|| NVL2(char(AA_CREATE_DATE), '',  ' [AA_CREATE_DATE] ')
			|| ' is/are empty.'
	   FROM SI_TEMP_ARBS_CA001
	  WHERE is_valid = 'N');
		
		---------------------------------
		-- Check for duplicate records
		--
		---------------------------------
	  UPDATE SI_TEMP_ARBS_CA001 a set is_valid = 'N'
	  where a.AA_NUMBER in (select t.AA_NUMBER
	  	from SI_TEMP_ARBS_CA001 t
	  	group by t.AA_NUMBER
	  	having count(*) > 1)
	  and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	  (select current_timestamp, 'ARBS', 'CA001',  CIF_ID, AA_NUMBER, 'BizErr004', 
		'[M] Duplicate AA Number [' 
	  	|| AA_NUMBER || '] - ' || trim(char(count(*))) || ' records found]'
	  from SI_TEMP_ARBS_CA001 where is_valid = 'N'
	  group by CIF_ID, AA_NUMBER
	  having count(*) > 1);
		
		-----------------------------------------
		-- Check for Dependency
		-- to check against SCI_LE_MAIN_PROFILE
		--
		-----------------------------------------
	
		UPDATE SI_TEMP_ARBS_CA001 a SET is_valid = 'N'
		WHERE NOT EXISTS (SELECT '1' FROM sci_le_main_profile
							WHERE lmp_le_id = a.CIF_ID
								AND source_id = 'ARBS');
								
		INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
		(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CA001', CIF_ID, AA_NUMBER, 'BizErr003', 
		'[H] Failed to find customer info for CIF Id [' || CIF_ID || '] from ARBS CU001 interface file'
			FROM SI_TEMP_ARBS_CA001 
		WHERE is_valid = 'N'
			AND NOT EXISTS (SELECT '1' FROM sci_le_main_profile
							WHERE lmp_le_id = CIF_ID
								AND source_id = 'ARBS'));
	  
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA001', 'ARBS', 0);  
END
@


CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CA002
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA002', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CA002 a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
			OR length(CIF_ID)=0
			OR length(CIF_SOURCE)=0
			OR length(AA_NUMBER)=0;

	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CA002', CIF_ID, AA_NUMBER, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| SI_BVL(CIF_ID, ' [CIF_ID] ')
			|| SI_BVL(CIF_SOURCE, ' [CIF_SOURCE] ')
			|| SI_BVL(AA_NUMBER, ' [AA_NUMBER] ')
			|| ' is/are empty.'
	   FROM SI_TEMP_ARBS_CA002
	  WHERE is_valid = 'N');
		
		CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA002', 'ARBS', 2);
		
		---------------------------------
		-- Check for duplicate records
		--
		---------------------------------
		
		UPDATE SI_TEMP_ARBS_CA002 a set is_valid = 'N'
	  where (a.cif_id, a.AA_NUMBER) in (select t.cif_id, t.AA_NUMBER
	  	from SI_TEMP_ARBS_CA002 t
	  	group by t.cif_id, t.AA_NUMBER
	  	having count(*) > 1)
	  and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	  (select current_timestamp, 'ARBS', 'CA002',  CIF_ID, AA_NUMBER, 'BizErr004', 
		'[M] Duplicate joint borrower info found for CIF ID [' || CIF_ID 
		|| '] AA Number [' || AA_NUMBER || '] - ' || trim(char(count(*))) || ' records found]' 
	  from SI_TEMP_ARBS_CA002 a
		where (a.cif_id, a.AA_NUMBER) in (select t.cif_id, t.AA_NUMBER
	  	from SI_TEMP_ARBS_CA002 t
	  	group by t.cif_id, t.AA_NUMBER
	  	having count(*) > 1)
		and is_valid = 'N'
		group by CIF_ID, AA_NUMBER);
			
		-----------------------------------------
		-- Check for Dependency
		-- to check against SCI_LE_MAIN_PROFILE
		--
		-----------------------------------------
	
		UPDATE SI_TEMP_ARBS_CA002 a SET is_valid = 'N'
		WHERE NOT EXISTS (SELECT '1' FROM sci_le_main_profile
							WHERE lmp_le_id = a.CIF_ID
								AND source_id = 'ARBS')
					and is_valid = 'Y';
								
		INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
		(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CA002', CIF_ID, AA_NUMBER, 'BizErr003', 
		'[H] Failed to find customer info for CIF Id [' || CIF_ID ||'] from ARBS CU001 interface file'
			FROM SI_TEMP_ARBS_CA002 
		WHERE is_valid = 'N'
			AND NOT EXISTS (SELECT '1' FROM sci_le_main_profile
							WHERE lmp_le_id = CIF_ID
								AND source_id = 'ARBS'));
	 
	 CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA002', 'ARBS', 3);
	 
	 
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LSP_LMT_PROFILE
	--
	-----------------------------------------

	UPDATE SI_TEMP_ARBS_CA002 a SET is_valid = 'N'
	 WHERE NOT EXISTS (SELECT '1' FROM sci_lsp_lmt_profile
	 					WHERE llp_bca_ref_num = a.aa_number
	 					  AND source_id = 'ARBS')
					and is_valid = 'Y'; 
	 					  
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CA002', cif_id, aa_number, 'BizErr003', 
		'[H] Failed to find AA Number [' || aa_number || '] from ARBS CA001 interface file'
	   FROM SI_TEMP_ARBS_CA002
	  WHERE is_valid = 'N'
	    AND NOT EXISTS (SELECT '1' FROM sci_lsp_lmt_profile
	 					WHERE llp_bca_ref_num = aa_number
	 					  AND source_id = 'ARBS'));
							
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA002', 'ARBS', 0);  
END
@

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CA003
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA003', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CA003 a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
			OR length(CIF_ID)=0
			OR length(AA_NUMBER)=0
			OR length(LIMIT_ID)=0
			OR length(FACILITY_CODE)=0
			OR length(FACILITY_SEQ)=0
			OR length(ORI_LOC_COUNTRY)=0
			OR length(ORG_LOC_ORG_CODE)=0
			OR length(ORG_LOC_ORG_DESC)=0
			OR length(PRODUCT_TYPE_CODE)=0
			OR length(PRODUCT_TYPE_DESC)=0
			OR length(FACILITY_TYPE_CODE)=0
			OR length(FACILITY_TYPE_DESC)=0
			OR length(LIMIT_CURRENCY)=0
			OR length(LIMIT_AMT)=0
			OR (LIMIT_TENOR>0 and length(LIMIT_TENOR_UOM)=0)
			OR length(DRAWING_LIMIT_AMT)=0
			OR length(OUTSTANDING_AMT)=0
			OR length(LOAN_SECTOR_CODE) = 0
			OR length(LOAN_SECTOR_DESC) = 0
			OR length(DISBURSED_IND) = 0;

	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CA003', CIF_ID, AA_NUMBER, LIMIT_ID, FACILITY_CODE, trim(char(FACILITY_SEQ)), 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| SI_BVL(CIF_ID, ' [CIF_ID] ')
			|| SI_BVL(AA_NUMBER, ' [AA_NUMBER] ')
			|| SI_BVL(LIMIT_ID, ' [LIMIT_ID] ')
			|| SI_BVL(FACILITY_CODE, ' [FACILITY_CODE] ')
			|| NVL2(char(FACILITY_SEQ), '', ' [FACILITY_SEQ] ')
			|| SI_BVL(ORI_LOC_COUNTRY, ' [ORI_LOC_COUNTRY] ')
			|| SI_BVL(ORG_LOC_ORG_CODE, ' [ORG_LOC_ORG_CODE] ')
			|| SI_BVL(PRODUCT_TYPE_CODE, ' [PRODUCT_TYPE_CODE] ')
			|| SI_BVL(PRODUCT_TYPE_DESC, ' [PRODUCT_TYPE_DESC] ')
			|| SI_BVL(FACILITY_TYPE_CODE, ' [FACILITY_TYPE_CODE] ')
			|| SI_BVL(FACILITY_TYPE_DESC, ' [FACILITY_TYPE_DESC] ')
			|| SI_BVL(LIMIT_CURRENCY, ' [LIMIT_CURRENCY] ')
			|| NVL2(char(LIMIT_AMT), '', ' [LIMIT_AMT] ')
			||(CASE WHEN LIMIT_TENOR>0 THEN SI_BVL(LIMIT_TENOR_UOM, ' [LIMIT_TENOR_UOM] ') ELSE '' END)
			|| NVL2(char(DRAWING_LIMIT_AMT), '', ' [DRAWING_LIMIT_AMT] ')
			|| NVL2(char(OUTSTANDING_AMT), '', ' [OUTSTANDING_AMT] ')
			|| SI_BVL(LOAN_SECTOR_CODE, ' [LOAN_SECTOR_CODE] ')
			|| SI_BVL(LOAN_SECTOR_DESC, ' [LOAN_SECTOR_DESC] ')
			|| SI_BVL(DISBURSED_IND, ' [DISBURSED_IND] ')
			|| ' is/are empty.'
	   FROM SI_TEMP_ARBS_CA003
	  WHERE is_valid = 'N');
		
		CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA003', 'ARBS', 2);
		commit;
		-----------------------------------------
		-- Check for duplicate limit records
		--
		-----------------------------------------
		UPDATE SI_TEMP_ARBS_CA003 a set is_valid = 'N'
		where a.LIMIT_ID in (select t.LIMIT_ID
		from SI_TEMP_ARBS_CA003 t
		group by limit_id
		having count(*) > 1)
		and a.is_valid = 'Y';
		
		INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
		(select current_timestamp, 'ARBS', 'CA003', LIMIT_ID, 'BizErr004', 
			'[M] Duplicate limit info found for Limit Id ['
			|| limit_id || '] - ' || trim(char(count(*))) || ' records found]'
		from SI_TEMP_ARBS_CA003 where is_valid = 'N'
		group by limit_id
		having count(*) > 1);
	  
		-----------------------------------------
		-- Check for Dependency
		-- to check against SCI_LE_MAIN_PROFILE
		--
		-----------------------------------------
	
		UPDATE SI_TEMP_ARBS_CA003 a SET is_valid = 'N'
		WHERE NOT EXISTS (SELECT '1' FROM sci_le_main_profile
							WHERE lmp_le_id = a.CIF_ID
								AND source_id = 'ARBS');
								
		INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
		(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CA003', CIF_ID, AA_NUMBER, LIMIT_ID, FACILITY_CODE, trim(char(FACILITY_SEQ)), 'BizErr003', 
			'[H] Failed to find customer info for CIF Id [' || CIF_ID ||'] from ARBS CU001 interface file'
			FROM SI_TEMP_ARBS_CA003 
		WHERE is_valid = 'N'
			AND NOT EXISTS (SELECT '1' FROM sci_le_main_profile
							WHERE lmp_le_id = CIF_ID
								AND source_id = 'ARBS'));
		
		CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA003', 'ARBS', 3);
		commit;
		
		-----------------------------------------
		-- Check for Dependency
		-- to check against SCI_LSP_LMT_PROFILE
		--
		-----------------------------------------
		
		--------------------------------
		-- Set limit profile id
		--------------------------------
		UPDATE SI_TEMP_ARBS_CA003 a
		set cms_act_lmt_profile_id = (select cms_lsp_lmt_profile_id
									from sci_lsp_lmt_profile
									where llp_bca_ref_num = a.aa_number
									and source_id = 'ARBS');
									
		CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA003', 'ARBS', 31);
		commit;
									
	
		update si_temp_arbs_ca003 a set is_valid = 'N'
		where cms_act_lmt_profile_id is null;
		
-- 		UPDATE SI_TEMP_ARBS_CA003 a SET is_valid = 'N'
-- 		WHERE NOT EXISTS (SELECT '1' FROM sci_lsp_lmt_profile
-- 							WHERE llp_bca_ref_num = a.aa_number
-- 								AND source_id = 'ARBS');
								
-- 		INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
-- 		(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CA003', CIF_ID, AA_NUMBER, LIMIT_ID, FACILITY_CODE, trim(char(FACILITY_SEQ)), 'BizErr003', 
-- 				'[H] Failed to find AA info for AA Number [' || aa_number || '] from ARBS CA001 interface file'
-- 			FROM SI_TEMP_ARBS_CA003
-- 			WHERE is_valid = 'N'
-- 				AND NOT EXISTS (SELECT '1' FROM sci_lsp_lmt_profile
-- 							WHERE llp_bca_ref_num = aa_number
-- 								AND source_id = 'ARBS'));
								
		INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
		(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CA003', CIF_ID, AA_NUMBER, LIMIT_ID, FACILITY_CODE, trim(char(FACILITY_SEQ)), 'BizErr003', 
				'[H] Failed to find AA info for AA Number [' || aa_number || '] from ARBS CA001 interface file'
			FROM SI_TEMP_ARBS_CA003
			WHERE is_valid = 'N'
			and cms_act_lmt_profile_id is null);								
							
		CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA003', 'ARBS', 0);  
END
@

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CA004
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA004', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CA004 a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
			OR length(AA_NUMBER)=0
			OR length(FACILITY_CODE)=0
			OR length(FACILITY_SEQ)=0
			OR length(EXTERNAL_SYSTEM_ACCT_NO)=0
			OR length(LOC_COUNTRY)=0
			OR length(LOC_ORG_CODE)=0
			OR length(LOC_ORG_DESC)=0
			OR length(UPDATE_STAT_IND)=0;

	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CA004', AA_NUMBER, EXTERNAL_SYSTEM_ACCT_NO, trim(char(ACCT_SEQ)), 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| SI_BVL(AA_NUMBER, ' [AA_NUMBER] ')
			|| SI_BVL(FACILITY_CODE, ' [FACILITY_CODE] ')
			|| SI_BVL(char(FACILITY_SEQ), ' [FACILITY_SEQ] ')
			|| SI_BVL(EXTERNAL_SYSTEM_ACCT_NO, ' [EXTERNAL_SYSTEM_ACCT_NO] ')
			|| SI_BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
			|| SI_BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
			|| SI_BVL(LOC_ORG_DESC, ' [LOC_ORG_DESC] ')
			|| SI_BVL(UPDATE_STAT_IND, ' [UPDATE_STAT_IND] ')
			|| ' is/are empty.'
	   FROM SI_TEMP_ARBS_CA004
	  WHERE is_valid = 'N');
	  
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA004', 'ARBS', 2);
	commit;
	
	---------------------------------
	-- Check for duplicate records
	--
	---------------------------------
  UPDATE SI_TEMP_ARBS_CA004 a set is_valid = 'N'
  where (a.external_system_acct_no, acct_seq) in (select EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ
  	from SI_TEMP_ARBS_CA004 t
		group by EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ
		having count(*) > 1)
	and a.is_valid = 'Y';	
		
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CA004',  AA_NUMBER, EXTERNAL_SYSTEM_ACCT_NO, trim(char(ACCT_SEQ)), 'BizErr004', 
	'[M] Duplicate limit account info found for Account Number [' || EXTERNAL_SYSTEM_ACCT_NO 
	|| '] Account Sequence [' || trim(char(ACCT_SEQ)) || '] - ' || trim(char(count(*))) || ' records found]' 
  from SI_TEMP_ARBS_CA004 a
	where (EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ) in (select EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ
  	from SI_TEMP_ARBS_CA004 t
		group by EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ
  	having count(*) > 1)
		and is_valid = 'N'
	group by AA_NUMBER, EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ);		
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA004', 'ARBS', 3);		
	commit;
	
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LSP_APPR_LMTS
	--
	-----------------------------------------
	UPDATE SI_TEMP_ARBS_CA004 a SET is_valid = 'N'
	 WHERE NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
	 					WHERE LMT_BCA_REF_NUM = a.AA_NUMBER
							AND LMT_FAC_CODE = a.FACILITY_CODE
							AND LMT_FAC_SEQ = a.FACILITY_SEQ
	 					  AND source_id = 'ARBS')
		AND IS_VALID = 'Y';
	 					  
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CA004', AA_NUMBER, FACILITY_CODE, trim(char(FACILITY_SEQ)), 'BizErr003', 
			'[H] Failed to find limit info for AA Number [' || AA_NUMBER || '] Facility Code [' || FACILITY_CODE 
			|| '] Facility Sequence [' || trim(char(FACILITY_SEQ)) || '] from ARBS CA003 interface file'
	   FROM SI_TEMP_ARBS_CA004 a
	  WHERE is_valid = 'N'
	    AND NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
	 					WHERE LMT_BCA_REF_NUM = a.AA_NUMBER
							AND LMT_FAC_CODE = a.FACILITY_CODE
							AND LMT_FAC_SEQ = a.FACILITY_SEQ
	 					  AND source_id = 'ARBS'));
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA004', 'ARBS', 4);		
	commit;
	
	----------------------------------------
	-- Check update status indicator
	-- for D where record non-exist in CLIMS
	--
	----------------------------------------
  UPDATE SI_TEMP_ARBS_CA004 a set is_valid = 'N'
  where a.UPDATE_STAT_IND = 'D'
		and not exists (select 1 from SCI_LSP_SYS_XREF b
			where b.LSX_EXT_SYS_ACCT_NUM = a.EXTERNAL_SYSTEM_ACCT_NO 
				and b.LSX_EXT_SYS_ACCT_SEQ = a.ACCT_SEQ
				and b.LSX_EXT_SYS_CODE_VALUE='ARBS')
  	and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CA004', EXTERNAL_SYSTEM_ACCT_NO, trim(char(ACCT_SEQ)),  'BizErr004', 
	'[M] Failed to find deleted account in CLIMS with Account No [' || EXTERNAL_SYSTEM_ACCT_NO || '] Account Sequence [' || trim(char(ACCT_SEQ)) || ']'
  from SI_TEMP_ARBS_CA004 a
  WHERE a.is_valid = 'N'
		and a.UPDATE_STAT_IND = 'D'
		and not exists (select 1 from SCI_LSP_SYS_XREF b
			where b.LSX_EXT_SYS_ACCT_NUM = a.EXTERNAL_SYSTEM_ACCT_NO 
				and b.LSX_EXT_SYS_ACCT_SEQ = a.ACCT_SEQ
				and b.LSX_EXT_SYS_CODE_VALUE='ARBS'));

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA004', 'ARBS', 0);  
END
@

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CA005
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA005', 'ARBS', 1);

	---------------------------------------------------
	-- Populate cms actual limit and security Id
	--
	---------------------------------------------------
	lock table SI_TEMP_ARBS_CA005 in exclusive mode;
	UPDATE SI_TEMP_ARBS_CA005 t SET (CMS_ACT_LMT_ID, CMS_ACT_LMT_PROFILE_ID, SRC_LMT_ID) = 
	(select CMS_LSP_APPR_LMTS_ID, CMS_LIMIT_PROFILE_ID, LMT_ID from sci_lsp_appr_lmts 
			where LMT_BCA_REF_NUM = t.AA_NUMBER 
				AND LMT_FAC_CODE = t.FACILITY_CODE
				AND LMT_FAC_SEQ = t.FACILITY_SEQ
				and source_id = 'ARBS')
	where is_valid='Y';
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA005', 'ARBS', 11);
	COMMIT;
	
	CALL SI_RUNSTATS('SI_TEMP_ARBS_CA005');
	COMMIT;
	
	lock table SI_TEMP_ARBS_CA005 in exclusive mode;
	UPDATE SI_TEMP_ARBS_CA005 t SET STG_LMT_ID = 
	(SELECT staging_reference_id FROM transaction
			WHERE reference_id = (SELECT CMS_LSP_APPR_LMTS_ID 
					FROM sci_lsp_appr_lmts
						where t.AA_NUMBER = LMT_BCA_REF_NUM 
							AND t.FACILITY_CODE = LMT_FAC_CODE
							AND t.FACILITY_SEQ = LMT_FAC_SEQ
							and source_id = 'ARBS')
				AND transaction_type = 'LIMIT')
	where is_valid='Y';

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA005', 'ARBS', 12);
	COMMIT;
	
	lock table SI_TEMP_ARBS_CA005 in exclusive mode;
	UPDATE SI_TEMP_ARBS_CA005 t SET (cms_act_col_id, stg_col_id) =
	(SELECT reference_id , staging_reference_id
	   FROM cms_security sec, transaction trx
	  WHERE sec.cms_collateral_id = reference_id
		AND trx.transaction_type = 'COL'
		AND sec.source_id = 'ARBS'
		AND sec.sci_security_dtl_id = t.security_id)
	 WHERE is_valid = 'Y';
	commit;
	 
	CALL "SI_LOG_PROC_TIME"('SI_VALIDATE_TEMP_ARBS_CA005', 'ARBS', 2);
	commit;
		
	UPDATE SI_TEMP_ARBS_CA005 a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
	 		OR length(CIF_ID)=0
			OR length(AA_NUMBER)=0
			OR length(FACILITY_CODE)=0
			OR length(FACILITY_SEQ)=0
			OR length(SECURITY_ID)=0
			OR length(EXTERNAL_SYSTEM_ACCT_NO)=0
			OR length(UPDATE_STAT_IND)=0;

	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CA005', AA_NUMBER, FACILITY_CODE, trim(char(FACILITY_SEQ)), SECURITY_ID, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| SI_BVL(CIF_ID, ' [CIF_ID] ')
			|| SI_BVL(AA_NUMBER, ' [AA_NUMBER] ')
			|| SI_BVL(FACILITY_CODE, ' [FACILITY_CODE] ')
			|| NVL2(char(FACILITY_SEQ), '', ' [FACILITY_SEQ] ')
			|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
			|| SI_BVL(EXTERNAL_SYSTEM_ACCT_NO, ' [EXTERNAL_SYSTEM_ACCT_NO] ')
			|| SI_BVL(UPDATE_STAT_IND, ' [UPDATE_STAT_IND] ')
			|| ' is/are empty.'
	   FROM SI_TEMP_ARBS_CA005
	  WHERE is_valid = 'N');
	  
		CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA005', 'ARBS', 3);
		commit;
		
		---------------------------------
		-- Check for duplicate records
		--
		---------------------------------
--		update si_temp_arbs_ca005 a set is_valid = 'N'
--		where (aa_number, security_id, facility_code, facility_seq) in
--			(select aa_number, security_id, facility_code, facility_seq
--			from si_temp_arbs_ca005 t
--			group by aa_number, security_id, facility_code, facility_seq
--			having count(*) > 1)
--		and a.is_valid = 'Y';
--	  	
--	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
--	  (select current_timestamp, 'ARBS', 'CA005', AA_NUMBER, FACILITY_CODE, trim(char(FACILITY_SEQ)), SECURITY_ID, 'BizErr004', 
--		'[M] Duplicate limit security mapping info found for AA Number [' || AA_NUMBER 
--		|| '] Facility Code [' || FACILITY_CODE
--		|| '] Facility Sequence [' || trim(char(FACILITY_SEQ))
--		|| '] Security Id [' || SECURITY_ID
--		|| '] - ' || trim(char(count(*))) || ' records found]' 
--	  from SI_TEMP_ARBS_CA005 a
--		where (aa_number, security_id, facility_code, facility_seq) in 
--			(select aa_number, security_id, facility_code, facility_seq
--			from si_temp_arbs_ca005 t
--			group by aa_number, security_id, facility_code, facility_seq
--			having count(*) > 1)
--		and is_valid = 'N'
--		group by AA_NUMBER, SECURITY_ID, FACILITY_CODE, FACILITY_SEQ);		
--		
--		CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA005', 'ARBS', 4);
--		commit;

		-----------------------------------------
		-- Check for Dependency
		-- to check against CMS_SECURITY
		--
		-----------------------------------------
		UPDATE SI_TEMP_ARBS_CA005
		SET IS_VALID = 'N'
		WHERE SECURITY_ID IS NOT NULL
		AND NOT EXISTS
			(SELECT 1
			FROM CMS_SECURITY s
			WHERE s.sci_security_dtl_id = security_id
			AND s.source_id = 'ARBS')
		AND IS_VALID = 'Y';
		
		INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
		(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CA005',AA_NUMBER, FACILITY_CODE, trim(char(FACILITY_SEQ)), SECURITY_ID, 'BizErr003',
			'[H] Failed to find security info for Security ID [' || security_id ||'] from the respective Collaterals interface files.'
		FROM SI_TEMP_ARBS_CA005
		WHERE IS_VALID = 'N'
		AND SECURITY_ID IS NOT NULL
		AND NOT EXISTS
			(SELECT 1
			FROM CMS_SECURITY s
			WHERE s.sci_security_dtl_id = security_id
			AND s.source_id = 'ARBS'));	
		
		CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA005', 'ARBS', 5);
		commit;
		
		-----------------------------------------
		-- Check for Dependency
		-- to check against SCI_LSP_APPR_LMTS
		--
		-----------------------------------------
	
		UPDATE SI_TEMP_ARBS_CA005 a SET is_valid = 'N'
		WHERE NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
							WHERE LMT_BCA_REF_NUM = a.AA_NUMBER
								AND LMT_FAC_CODE = a.FACILITY_CODE
								AND LMT_FAC_SEQ = a.FACILITY_SEQ
								AND source_id = 'ARBS')
			AND IS_VALID = 'Y';
								
		INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
		(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CA005', AA_NUMBER, FACILITY_CODE, trim(char(FACILITY_SEQ)), SECURITY_ID, 'BizErr003', 
				'[H] Failed to find limit info for AA Number [' || AA_NUMBER || '] Facility Code [' || FACILITY_CODE 
				|| '] Facility Sequence [' || trim(char(FACILITY_SEQ)) || '] from ARBS CA003 interface'
			FROM SI_TEMP_ARBS_CA005 a
			WHERE is_valid = 'N'
				AND NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
							WHERE LMT_BCA_REF_NUM = a.AA_NUMBER
								AND LMT_FAC_CODE = a.FACILITY_CODE
								AND LMT_FAC_SEQ = a.FACILITY_SEQ
								AND source_id = 'ARBS'));
		
		CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA005', 'ARBS', 6);
		commit;
		
		----------------------------------------
		-- Check update status indicator
		-- for D where record non-exist in CLIMS
		--
		----------------------------------------
		UPDATE SI_TEMP_ARBS_CA005 a set is_valid = 'N'
		where a.UPDATE_STAT_IND = 'D'
			and not exists (select 1 from cms_limit_security_map b
				where b.CMS_COLLATERAL_ID = a.CMS_ACT_COL_ID
					and b.CMS_LSP_APPR_LMTS_ID = a.CMS_ACT_LMT_ID)
			and a.is_valid = 'Y';
			
		INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
		(select current_timestamp, 'ARBS', 'CA005', AA_NUMBER, FACILITY_CODE, trim(char(FACILITY_SEQ)), SECURITY_ID,  'BizErr004', 
		'[M] Failed to find deleted limit security mapping in ARBS not found with AA Number [' || AA_NUMBER || '] Facility Code [' || FACILITY_CODE 
				|| '] Facility Sequence [' || trim(char(FACILITY_SEQ)) || ']'
		from SI_TEMP_ARBS_CA005 a
		WHERE a.is_valid = 'N'
			and a.UPDATE_STAT_IND = 'D'
			and not exists (select 1 from cms_limit_security_map b
				where b.CMS_COLLATERAL_ID = a.CMS_ACT_COL_ID
					and b.CMS_LSP_APPR_LMTS_ID = a.CMS_ACT_LMT_ID));
				
		CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA005', 'ARBS', 0);  
END
@


CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CA019
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA019', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CA019 a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
	 		OR length(ACCT_NUMBER)=0
			OR length(AA_NUMBER)=0
			OR exists(select 1 from SCI_LSP_SYS_XREF 
				where LSX_BCA_REF_NUM = a.aa_number
					and LSX_EXT_SYS_ACCT_NUM=a.ACCT_NUMBER 
					and LSX_EXT_SYS_ACCT_TYPE='D'
					and LSX_EXT_SYS_CODE_VALUE='ARBS'
					and length(a.ACCT_NUMBER)>0
					and length(a.AA_NUMBER)>0
					and (length(FACILITY_CODE)=0 OR FACILITY_SEQ=0))
			OR length(DELINQUENT_IND)=0
			OR (length(CAR_CODE)>0 and length(CAR_DESC)=0);

	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CA019', ACCT_NUMBER, AA_NUMBER, FACILITY_CODE, trim(char(FACILITY_SEQ)), 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| SI_BVL(ACCT_NUMBER, ' [ACCT_NUMBER] ')
			|| SI_BVL(AA_NUMBER, ' [AA_NUMBER] ')
			|| (CASE WHEN (select 1 from SCI_LSP_SYS_XREF 
				where LSX_BCA_REF_NUM = aa_number
					and LSX_EXT_SYS_ACCT_NUM=ACCT_NUMBER 
					and LSX_EXT_SYS_ACCT_TYPE='D'
					and LSX_EXT_SYS_CODE_VALUE='ARBS'
					and length(ACCT_NUMBER)>0
					and length(AA_NUMBER)>0
					and length(FACILITY_CODE)=0)>0 THEN ' [FACILITY_CODE] ' ELSE '' END)
			|| (CASE WHEN (select 1 from SCI_LSP_SYS_XREF 
				where LSX_BCA_REF_NUM = aa_number
					and LSX_EXT_SYS_ACCT_NUM=ACCT_NUMBER 
					and LSX_EXT_SYS_ACCT_TYPE='D'
					and LSX_EXT_SYS_CODE_VALUE='ARBS'
					and length(ACCT_NUMBER)>0
					and length(AA_NUMBER)>0
					and FACILITY_SEQ=0)>0 THEN ' [FACILITY_SEQ] ' ELSE '' END)
			|| SI_BVL(DELINQUENT_IND, ' [DELINQUENT_IND] ')
			||(CASE WHEN length(CAR_CODE)>0 THEN SI_BVL(CAR_DESC, ' [CAR_DESC] ') ELSE '' END)
			|| ' is/are empty.'
	   FROM SI_TEMP_ARBS_CA019
	  WHERE is_valid = 'N');
		
	---------------------------------
	-- Check for duplicate records
	--
	---------------------------------
  UPDATE SI_TEMP_ARBS_CA019 a set is_valid = 'N'
  where a.ACCT_NUMBER in (select t.ACCT_NUMBER
  	from SI_TEMP_ARBS_CA019 t
  	group by t.ACCT_NUMBER
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CA019', ACCT_NUMBER, 'BizErr004', 
		'[M] Duplicate NPL info found for Account Number [' 
  	|| ACCT_NUMBER || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_CA019 where is_valid = 'N'
  group by ACCT_NUMBER
  having count(*) > 1);
		
	-----------------------------------------
	-- Check for Dependency
	-- to check against sci_lsp_sys_xref
	--
	-----------------------------------------

	UPDATE SI_TEMP_ARBS_CA019 a SET is_valid = 'N'
	 WHERE NOT EXISTS (SELECT '1' FROM sci_lsp_sys_xref
	 					WHERE LSX_BCA_REF_NUM = a.aa_number
							AND LSX_EXT_SYS_ACCT_NUM = ACCT_NUMBER
	 					  AND LSX_EXT_SYS_CODE_VALUE = 'ARBS');
	 					  
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CA019', ACCT_NUMBER, 'BizErr003', 
			'[H] Failed to find account info for Account Number [' || aa_number 
			||'] from ARBS CA004 interface file.'
	   FROM SI_TEMP_ARBS_CA019
	  WHERE is_valid = 'N'
	    AND NOT EXISTS (SELECT '1' FROM sci_lsp_sys_xref
	 					WHERE LSX_BCA_REF_NUM = aa_number
							AND LSX_EXT_SYS_ACCT_NUM = ACCT_NUMBER
	 					  AND LSX_EXT_SYS_CODE_VALUE = 'ARBS'));
							
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CA019', 'ARBS', 0);  
END
@

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_PF003
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_PF003', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_PF003 a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
	 		OR length(CURRENCY_CODE)=0
			OR length(CURRENCY_DESC)=0
			OR length(BUY_RATE)=0;

	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'PF003', CURRENCY_CODE, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| SI_BVL(CURRENCY_CODE, ' [CURRENCY_CODE] ')
			|| SI_BVL(CURRENCY_DESC, ' [CURRENCY_DESC] ')
			|| SI_BVL(char(BUY_RATE), ' [BUY_RATE] ')
			|| ' is/are empty.'
	   FROM SI_TEMP_ARBS_PF003
	  WHERE is_valid = 'N');

	---------------------------------
	-- Check for duplicate records
	--
	---------------------------------
  UPDATE SI_TEMP_ARBS_PF003 a set is_valid = 'N'
  where a.CURRENCY_CODE in (select t.CURRENCY_CODE
  	from SI_TEMP_ARBS_PF003 t
  	group by t.CURRENCY_CODE
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'PF003', CURRENCY_CODE, 'BizErr004', 
		'[M] Duplicate foreign exchange info for Currency Code [' 
  	|| CURRENCY_CODE || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_PF003 where is_valid = 'N'
  group by CURRENCY_CODE
  having count(*) > 1);
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_PF003', 'ARBS', 0);  
END
@

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO001
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO001', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO001
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(LOC_ORG_DESC)=0
		OR SECURITY_EXPIRY_DATE is null
		OR length(LEGAL_ENFORCEABILITY)=0
		OR LEGAL_ENFORCEABILITY_DATE is null
		OR SECURITY_PERFECTION_DATE is null
		OR length(ASSET_TYPE_CODE)=0
		OR length(ASSET_TYPE_DESC)=0
		OR length(PURCHASE_PRICE)=0
		OR length(PURCHASE_PRICE_CURRENCY)=0
		OR length(MANUFACTURE_YEAR)=0
		--OR length(MODEL_NO)=0
		OR length(RESIDUAL_ASSET_LIFE)=0
		OR length(RESIDUAL_ASSET_LIFE_UNIT)=0
		OR length(ASSET_VALUE)=0
		OR length(DOCUMENT_PERFECTION_AGE)=0
		--OR length(CHASSIS_NUMBER)=0
		OR length(INSURANCE_IND)=0
		OR length(AUTO_DR_COLLATERAL_FEE)=0
		OR length(DOWN_PAYMENT_TRADE_IN)=0
		OR length(DOWN_PAYMENT_CASH)=0
		OR length(FREIGHT_CHARGES)=0
		OR length(PRICE_LIST)=0;
		--OR length(PUBLIC_TRANSPORT)=0;
	
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO001', SECURITY_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| SI_BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| SI_BVL(CURRENCY, ' [CURRENCY] ')
		|| SI_BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
		|| SI_BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| SI_BVL(LOC_ORG_DESC, ' [LOC_ORG_DESC] ')
		|| NVL2(CHAR(SECURITY_EXPIRY_DATE), '', ' [SECURITY_EXPIRY_DATE] ')
		|| SI_BVL(LEGAL_ENFORCEABILITY, ' [LEGAL_ENFORCEABILITY] ')
		|| NVL2(CHAR(LEGAL_ENFORCEABILITY_DATE), '', ' [LEGAL_ENFORCEABILITY_DATE] ')
		|| NVL2(CHAR(SECURITY_PERFECTION_DATE), '', ' [SECURITY_PERFECTION_DATE] ')
		|| SI_BVL(ASSET_TYPE_CODE, ' [ASSET_TYPE_CODE] ')
		|| SI_BVL(ASSET_TYPE_DESC, ' [ASSET_TYPE_DESC] ')
		|| NVL2(char(PURCHASE_PRICE), '', ' [PURCHASE_PRICE] ')
		|| SI_BVL(PURCHASE_PRICE_CURRENCY, ' [PURCHASE_PRICE_CURRENCY] ')
		|| NVL2(char(MANUFACTURE_YEAR), '', ' [MANUFACTURE_YEAR] ')
		--|| SI_BVL(MODEL_NO, ' [MODEL_NO] ')
		|| NVL2(CHAR(RESIDUAL_ASSET_LIFE), '', ' [RESIDUAL_ASSET_LIFE] ')
		|| SI_BVL(RESIDUAL_ASSET_LIFE_UNIT, ' [RESIDUAL_ASSET_LIFE_UNIT] ')
		|| NVL2(char(ASSET_VALUE), '', ' [ASSET_VALUE] ')
		|| NVL2(CHAR(DOCUMENT_PERFECTION_AGE), '', ' [DOCUMENT_PERFECTION_AGE] ')
		--|| SI_BVL(CHASSIS_NUMBER, ' [CHASSIS_NUMBER] ')
		|| SI_BVL(INSURANCE_IND, ' [INSURANCE_IND] ')
		|| SI_BVL(AUTO_DR_COLLATERAL_FEE, ' [AUTO_CR_COLLATERAL_FEE] ')
		|| NVL2(char(DOWN_PAYMENT_TRADE_IN), '', ' [DOWN_PAYMENT_TRADE_IN] ')
		|| NVL2(char(DOWN_PAYMENT_CASH), '', ' [DOWN_PAYMENT_CASH] ')
		|| NVL2(char(FREIGHT_CHARGES), '', ' [FREIGHT_CHARGES] ')
		|| NVL2(char(PRICE_LIST), '', ' [PRICE_LIST] ')
		--|| SI_BVL(PUBLIC_TRANSPORT, ' [PUBLIC_TRANSPORT] ')
		|| ' is/are empty.'
	FROM SI_TEMP_ARBS_CO001
	WHERE IS_VALID = 'N');
	
	-----------------------------------------
	-- Check for duplicate security Id records
	--
	-----------------------------------------
	UPDATE SI_TEMP_ARBS_CO001 a set is_valid = 'N'
  where a.SECURITY_ID in (select t.SECURITY_ID
  	from SI_TEMP_ARBS_CO001 t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO001', SECURITY_ID, 'BizErr004', 
		'[M] Duplicate security info for Asset Based Vehicle, Plant and Equipment Security ID [' 
  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_CO001 where is_valid = 'N'
  group by SECURITY_ID
  having count(*) > 1);
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO001', 'ARBS', 2);
	commit;
	
	----------------------------------------
	-- Check update status indicator
	-- for D where record non-exist in CLIMS
	--
	----------------------------------------
  UPDATE SI_TEMP_ARBS_CO001 a set is_valid = 'N'
  where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO001', security_id, 'BizErr004', 
	'[M] Failed to find deleted security in CLIMS with Security Id [' || security_id || ']'
  from SI_TEMP_ARBS_CO001 a where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'N');

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO001', 'ARBS', 0);
END
@

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO002
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO002', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO002
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(LOC_ORG_DESC)=0
		OR length(LEGAL_ENFORCEABILITY)=0
		OR LEGAL_ENFORCEABILITY_DATE is null
		OR SECURITY_PERFECTION_DATE is null
		OR length(ASSET_TYPE_CODE)=0
		OR length(ASSET_TYPE_DESC)=0
		OR length(PURCHASE_PRICE)=0
		OR length(PURCHASE_PRICE_CURRENCY)=0
		OR length(GOLD_GRADE)=0
		OR length(GOLD_UNIT_PRICE)=0
		OR length(GOLD_UNIT_PRICE_UOM)=0
		OR length(GOLD_WEIGHT)=0
		OR length(GOLD_WEIGHT_UOM)=0
		OR length(CASH_VALUE_FOR_FORCE_SALE)=0;		
		
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO002', SECURITY_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| SI_BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| SI_BVL(CURRENCY, ' [CURRENCY] ')
		|| SI_BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
		|| SI_BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| SI_BVL(LOC_ORG_DESC, ' [LOC_ORG_DESC] ')
		|| SI_BVL(LEGAL_ENFORCEABILITY, ' [LEGAL_ENFORCEABILITY] ')
		|| NVL2(char(LEGAL_ENFORCEABILITY_DATE), '', ' [LEGAL_ENFORCEABILITY_DATE] ')
		|| NVL2(char(SECURITY_PERFECTION_DATE), '', ' [SECURITY_PERFECTION_DATE] ')
		|| SI_BVL(ASSET_TYPE_CODE, ' [ASSET_TYPE_CODE] ')
		|| SI_BVL(ASSET_TYPE_DESC, ' [ASSET_TYPE_DESC] ')
		|| NVL2(char(PURCHASE_PRICE), '', ' [PURCHASE_PRICE] ')
		|| SI_BVL(PURCHASE_PRICE_CURRENCY, ' [PURCHASE_PRICE_CURRENCY] ')	
		|| SI_BVL(GOLD_GRADE, ' [GOLD_GRADE] ')	
		|| NVL2(char(GOLD_UNIT_PRICE), '', ' [GOLD_UNIT_PRICE] ')	
		|| SI_BVL(GOLD_UNIT_PRICE_UOM, ' [GOLD_UNIT_PRICE_UOM] ')	
		|| NVL2(char(GOLD_WEIGHT), '', ' [GOLD_WEIGHT] ')	
		|| SI_BVL(GOLD_WEIGHT_UOM, ' [GOLD_WEIGHT_UOM] ')	
		|| SI_BVL(CASH_VALUE_FOR_FORCE_SALE, ' [CASH_VALUE_FOR_FORCE_SALE] ')
		|| ' is/are empty.'
	FROM SI_TEMP_ARBS_CO002
	WHERE IS_VALID = 'N');
	
	-----------------------------------------
	-- Check for duplicate security Id records
	--
	-----------------------------------------
	
	UPDATE SI_TEMP_ARBS_CO002 a set is_valid = 'N'
  where a.SECURITY_ID in (select t.SECURITY_ID
  	from SI_TEMP_ARBS_CO002 t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO002', SECURITY_ID, 'BizErr004', 
		'[M] Duplicate security info for Asset Based - Gold Security ID [' 
  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_CO002 where is_valid = 'N'
  group by SECURITY_ID
  having count(*) > 1);
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO002', 'ARBS', 2);
	commit;
	----------------------------------------
	-- Check update status indicator
	-- for D where record non-exist in CLIMS
	--
	----------------------------------------
  UPDATE SI_TEMP_ARBS_CO002 a set is_valid = 'N'
  where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO002', security_id, 'BizErr004', 
	'[M] Failed to find deleted security in CLIMS with Security Id [' || security_id || ']'
  from SI_TEMP_ARBS_CO002 a where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'N');
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO002', 'ARBS', 0);
END
@		

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO003
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO003', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO003
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(LOC_ORG_DESC)=0;
		
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO003', SECURITY_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| SI_BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| SI_BVL(CURRENCY, ' [CURRENCY] ')
		|| SI_BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
		|| SI_BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| SI_BVL(LOC_ORG_DESC, ' [LOC_ORG_DESC] ')		
		|| ' is/are empty.'
	FROM SI_TEMP_ARBS_CO003
	WHERE IS_VALID = 'N');
	
	-----------------------------------------
	-- Check for duplicate security Id records
	--
	-----------------------------------------
	
	UPDATE SI_TEMP_ARBS_CO003 a set is_valid = 'N'
  where a.SECURITY_ID in (select t.SECURITY_ID
  	from SI_TEMP_ARBS_CO003 t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO003', SECURITY_ID, 'BizErr004', 
		'[M] Duplicate security info for Asset Based Debenture (Miscellaneous) Security ID [' 
  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_CO003 where is_valid = 'N'
  group by SECURITY_ID
  having count(*) > 1);

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO003', 'ARBS', 2);
	commit;
	----------------------------------------
	-- Check update status indicator
	-- for D where record non-exist in CLIMS
	--
	----------------------------------------
  UPDATE SI_TEMP_ARBS_CO003 a set is_valid = 'N'
  where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO003', security_id, 'BizErr004', 
	'[M] Failed to find deleted security in CLIMS with Security Id [' || security_id || ']'
  from SI_TEMP_ARBS_CO003 a where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'N');

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO003', 'ARBS', 0);
END
@	


CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO004
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO004', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO004
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(LOC_ORG_DESC)=0;
		
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO004', SECURITY_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| SI_BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| SI_BVL(CURRENCY, ' [CURRENCY] ')
		|| SI_BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
		|| SI_BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| SI_BVL(LOC_ORG_DESC, ' [LOC_ORG_DESC] ')		
		|| ' is/are empty.'
	FROM SI_TEMP_ARBS_CO004
	WHERE IS_VALID = 'N');

	-----------------------------------------
	-- Check for duplicate security Id records
	--
	-----------------------------------------
	
	UPDATE SI_TEMP_ARBS_CO004 a set is_valid = 'N'
  where a.SECURITY_ID in (select t.SECURITY_ID
  	from SI_TEMP_ARBS_CO004 t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO004', SECURITY_ID, 'BizErr004', 
		'[M] Duplicate security info for Asset Based Debenture (Bonds Debenture) Security ID [' 
  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_CO004 where is_valid = 'N'
  group by SECURITY_ID
  having count(*) > 1);
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO004', 'ARBS', 2);
	commit;
	----------------------------------------
	-- Check update status indicator
	-- for D where record non-exist in CLIMS
	--
	----------------------------------------
  UPDATE SI_TEMP_ARBS_CO004 a set is_valid = 'N'
  where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO004', security_id, 'BizErr004', 
	'[M] Failed to find deleted security in CLIMS with Security Id [' || security_id || ']'
  from SI_TEMP_ARBS_CO004 a where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'N');
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO004', 'ARBS', 0);
END
@	

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO005
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO005', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO005
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(LOC_ORG_DESC)=0
		OR length(CUSTODIAN_TYPE)=0
		OR length(LEGAL_ENFORCEBILITY)=0
		OR LEGAL_ENFORCEBILITY_DATE is null
		OR SECURITY_PERFECTION_DATE is null;
		--OR length(INTEREST_CAPITAL)=0;
		
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO005', SECURITY_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| SI_BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| SI_BVL(CURRENCY, ' [CURRENCY] ')
		|| SI_BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
		|| SI_BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| SI_BVL(LOC_ORG_DESC, ' [LOC_ORG_DESC] ')
		|| SI_BVL(CUSTODIAN_TYPE, ' [CUSTODIAN_TYPE] ')
		|| SI_BVL(LEGAL_ENFORCEBILITY, ' [LEGAL_ENFORCEABILITY] ')
		|| NVL2(char(LEGAL_ENFORCEBILITY_DATE), '', ' [LEGAL_ENFORCEABILITY_DATE] ')
		|| NVL2(char(SECURITY_PERFECTION_DATE), '', ' [SECURITY_PERFECTION_DATE] ')	
		--|| SI_BVL(INTEREST_CAPITAL, ' [INTEREST_CAPITAL] ')	
		|| ' is/are empty.'		
	FROM SI_TEMP_ARBS_CO005
	WHERE IS_VALID = 'N');

	-----------------------------------------
	-- Check for duplicate security Id records
	--
	-----------------------------------------
	
	UPDATE SI_TEMP_ARBS_CO005 a set is_valid = 'N'
  where a.SECURITY_ID in (select t.SECURITY_ID
  	from SI_TEMP_ARBS_CO005 t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO005', SECURITY_ID, 'BizErr004', 
		'[M] Duplicate security info for Deposit Security ID [' 
  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_CO005 where is_valid = 'N'
  group by SECURITY_ID
  having count(*) > 1);
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO005', 'ARBS', 2);
	commit;
	----------------------------------------
	-- Check update status indicator
	-- for D where record non-exist in CLIMS
	--
	----------------------------------------
  UPDATE SI_TEMP_ARBS_CO005 a set is_valid = 'N'
  where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO005', security_id, 'BizErr004', 
	'[M] Failed to find deleted security in CLIMS with Security Id [' || security_id || ']'
  from SI_TEMP_ARBS_CO005 a where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'N');
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO005', 'ARBS', 0);
END
@

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO006
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO006', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO006
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
	OR length(REF_NO)=0
	OR length(RECEIPT_NUMBER)=0
	OR length(AMT_CURRENCY)=0
	OR length(AMT)=0
	OR length(THIRD_PARTY_BANK)=0
	OR length(FDR_RATE)=0
	OR ISSUE_DATE is null
	OR length(SECURITY_DEPOSIT)=0
	OR length(ACCT_TYPE)=0;
	
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO006', SECURITY_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(REF_NO, ' [REF_NO] ')
		|| SI_BVL(RECEIPT_NUMBER, '[RECEIPT_NUMBER] ')
		|| SI_BVL(AMT_CURRENCY, ' [AMT_CURRENCY] ')
		|| NVL2(char(AMT), '', ' [AMT] ')
		|| SI_BVL(THIRD_PARTY_BANK, ' [THIRD_PARTY_BANK] ')
		|| NVL2(char(FDR_RATE), '', ' [FDR_RATE] ')
		|| NVL2(char(ISSUE_DATE), '', ' [ISSUE_DATE] ')
		|| SI_BVL(SECURITY_DEPOSIT, ' [SECURITY_DEPOSIT] ')
		|| SI_BVL(ACCT_TYPE, ' [ACCT_TYPE] ')
		|| ' is/are empty.'				
	FROM SI_TEMP_ARBS_CO006
	WHERE IS_VALID = 'N');
	
	UPDATE SI_TEMP_ARBS_CO006
	SET IS_VALID = 'N'
	WHERE SECURITY_ID IS NOT NULL
	AND NOT EXISTS
		(SELECT 1
		FROM CMS_SECURITY s, CMS_CASH c
		WHERE s.sci_security_dtl_id = security_id
		AND s.source_id = 'ARBS'
		AND s.cms_collateral_id = c.cms_collateral_id)
	AND IS_VALID = 'Y';
	
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO006', SECURITY_ID, 'BizErr003',
		'[H] Failed to find security info for Deposit Security ID [' || security_id || '] from ARBS CO005 interface file'
	FROM SI_TEMP_ARBS_CO006
	WHERE IS_VALID = 'N'
	AND SECURITY_ID IS NOT NULL
	AND NOT EXISTS
		(SELECT 1
		FROM CMS_SECURITY s, CMS_CASH c
		WHERE s.sci_security_dtl_id = security_id
		AND s.source_id = 'ARBS'
		AND s.cms_collateral_id = c.cms_collateral_id));			
	
	-----------------------------------------
	-- Check for duplicate security Id records
	--
	-----------------------------------------
	
	UPDATE SI_TEMP_ARBS_CO006 a set is_valid = 'N'
  where a.SECURITY_ID in (select t.SECURITY_ID
  	from SI_TEMP_ARBS_CO006 t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO006', SECURITY_ID, 'BizErr004', 
		'[M] Duplicate security info for Deposit Security ID [' 
  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_CO006 where is_valid = 'N'
  group by SECURITY_ID
  having count(*) > 1);
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO006', 'ARBS', 0);
END
@	

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO007
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO007', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO007
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(LOC_ORG_DESC)=0
		OR length(LEGAL_ENFORCEABILITY)=0
		OR LEGAL_ENFORCEABILITY_DATE is null
		OR SECURITY_PERFECTION_DATE is null
		OR length(NUMBER_OF_UNITS)=0
		OR length(ISSUER_NAME)=0
		OR length(RECOGNIZED_EXCHANGE)=0;
		
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO007', SECURITY_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| SI_BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| SI_BVL(CURRENCY, ' [CURRENCY] ')
		|| SI_BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
		|| SI_BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| SI_BVL(LOC_ORG_DESC, ' [LOC_ORG_DESC] ')
		|| SI_BVL(LEGAL_ENFORCEABILITY, ' [LEGAL_ENFORCEABILITY] ')
		|| NVL2(char(LEGAL_ENFORCEABILITY_DATE), '', ' [LEGAL_ENFORCEABILITY_DATE] ')
		|| NVL2(char(SECURITY_PERFECTION_DATE), '', ' [SECURITY_PERFECTION_DATE] ')	
		|| NVL2(char(NUMBER_OF_UNITS), '', ' [NUMBER_OF_UNITS] ')	
		|| SI_BVL(ISSUER_NAME, ' [ISSUER_NAME] ')	
		|| SI_BVL(RECOGNIZED_EXCHANGE, ' [RECOGNIZED_EXCHANGE] ')			
		|| ' is/are empty.'						
	FROM SI_TEMP_ARBS_CO007
	WHERE IS_VALID = 'N');
	
	-----------------------------------------
	-- Check for duplicate security Id records
	--
	-----------------------------------------
	
	UPDATE SI_TEMP_ARBS_CO007 a set is_valid = 'N'
  where a.SECURITY_ID in (select t.SECURITY_ID
  	from SI_TEMP_ARBS_CO007 t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO007', SECURITY_ID, 'BizErr004', 
		'[M] Duplicate security info for Marketable Securities-Bonds Security ID [' 
  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_CO007 where is_valid = 'N'
  group by SECURITY_ID
  having count(*) > 1);
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO007', 'ARBS', 0);
END
@			
		
CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO008
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO008', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO008
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(LOC_ORG_DESC)=0
		OR length(TYPE)=0
		OR length(NUMBER_OF_UNITS)=0
		--OR length(STOCK_EXCHANGE_BOND_MARKET)=0
		--OR length(STOCK_CODE_BOND_CODE)=0
		OR length(RECOGNIZED_EXCHANGE)=0;
		
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO008', SECURITY_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| SI_BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| SI_BVL(CURRENCY, ' [CURRENCY] ')
		|| SI_BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
		|| SI_BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| SI_BVL(LOC_ORG_DESC, ' [LOC_ORG_DESC] ')
		|| SI_BVL(TYPE, ' [TYPE] ')			
		|| NVL2(char(NUMBER_OF_UNITS), '', ' [NUMBER_OF_UNITS] ')	
		|| SI_BVL(STOCK_EXCHANGE_BOND_MARKET, ' [STOCK_EXCHANGE_BOND_MARKET] ')	
		--|| SI_BVL(STOCK_CODE_BOND_CODE, ' [STOCK_CODE_BOND_CODE] ')			
		--|| SI_BVL(RECOGNIZED_EXCHANGE, ' [RECOGNIZED_EXCHANGE] ')			
		|| ' is/are empty.'						
	FROM SI_TEMP_ARBS_CO008
	WHERE IS_VALID = 'N');

	-----------------------------------------
	-- Check for duplicate security Id records
	--
	-----------------------------------------
	
	UPDATE SI_TEMP_ARBS_CO008 a set is_valid = 'N'
  where a.SECURITY_ID in (select t.SECURITY_ID
  	from SI_TEMP_ARBS_CO008 t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO008', SECURITY_ID, 'BizErr004', 
		'[M] Duplicate security info for Marketable Securities-Stocks Security ID [' 
  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_CO008 where is_valid = 'N'
  group by SECURITY_ID
  having count(*) > 1);
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO008', 'ARBS', 0);
END
@			

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO009
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO009', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO009
	SET IS_VALID = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(SECURITY_ID)=0
			OR length(SOURCE_SECURITY_TYPE)=0
			OR length(SOURCE_SECURITY_SUB_TYPE)=0
			OR length(CURRENCY)=0
			OR length(LOC_COUNTRY)=0
			OR length(LOC_ORG_CODE)=0
			OR length(LOC_ORG_DESC)=0
			OR length(LEGAL_ENFORCEABILITY)=0
			OR LEGAL_ENFORCEABILITY_DATE is null
			OR SECURITY_PERFECTION_DATE is null
			OR length(SALE_PURCHASE_AGREEMENT_VALUE)=0
			--OR SALE_PURCHASE_DATE is null
			OR length(TITLE_TYPE)=0
			OR length(POST_CODE)=0
			OR length(STATE_CODE)=0
			OR length(PROPERTY_USAGE)=0
			OR length(ABANDONED_PROJECT)=0
			OR length(PROPERTY_COMPLETED_FLAG)=0
			--OR (length(CATEGORY_OF_LAND_USE_CODE)>0 AND length(CATEGORY_OF_LAND_USE_DESC)=0) 
			--OR length(PROPERTY_TYPE_CODE)=0
			OR length(PROPERTY_TYPE_DESC)=0
			OR length(INSURANCE)=0;
		
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO009', SECURITY_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| SI_BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| SI_BVL(CURRENCY, ' [CURRENCY] ')
		|| SI_BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
		|| SI_BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| SI_BVL(LOC_ORG_DESC, ' [LOC_ORG_DESC] ')
		|| SI_BVL(LEGAL_ENFORCEABILITY, ' [LEGAL_ENFORCEABILITY] ')			
		|| NVL2(char(LEGAL_ENFORCEABILITY_DATE), '',  ' [LEGAL_ENFORCEABILITY_DATE] ')	
		|| NVL2(char(SECURITY_PERFECTION_DATE), '', ' [SECURITY_PERFECTION_DATE] ')	
		|| NVL2(char(SALE_PURCHASE_AGREEMENT_VALUE), '', ' [SALE_PURCHASE_AGREEMENT_VALUE] ')			
		--|| NVL2(char(SALE_PURCHASE_DATE), '', ' [SALE_PURCHASE_DATE] ')		
		|| SI_BVL(TITLE_TYPE, ' [TITLE_TYPE] ')
		|| SI_BVL(POST_CODE, ' [POST_CODE] ')
		|| SI_BVL(STATE_CODE, ' [STATE_CODE] ')
		|| SI_BVL(ABANDONED_PROJECT, ' [ABANDONED_PROJECT] ')
		|| SI_BVL(PROPERTY_USAGE, ' [PROPERTY_USAGE] ')
		|| SI_BVL(PROPERTY_COMPLETED_FLAG, ' [PROPERTY_COMPLETED_FLAG] ')
		--||(CASE WHEN length(CATEGORY_OF_LAND_USE_CODE)>0 THEN SI_BVL(CATEGORY_OF_LAND_USE_DESC, ' [CATEGORY_OF_LAND_USE_DESC] ') ELSE '' END)
		--|| SI_BVL(PROPERTY_TYPE_CODE, ' [PROPERTY_TYPE_CODE] ')
		|| SI_BVL(PROPERTY_TYPE_DESC, ' [PROPERTY_TYPE_DESC] ')
		|| SI_BVL(INSURANCE, ' [INSURANCE] ')
		|| ' is/are empty.'						
	FROM SI_TEMP_ARBS_CO009
	WHERE IS_VALID = 'N');
	
	-----------------------------------------
	-- Check for duplicate security Id records
	--
	-----------------------------------------
	
	UPDATE SI_TEMP_ARBS_CO009 a set is_valid = 'N'
  where a.SECURITY_ID in (select t.SECURITY_ID
  	from SI_TEMP_ARBS_CO009 t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO009', SECURITY_ID, 'BizErr004', 
		'[M] Duplicate security info for Property Security ID [' 
  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_CO009 where is_valid = 'N'
  group by SECURITY_ID
  having count(*) > 1);
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO009', 'ARBS', 2);
	commit;
	----------------------------------------
	-- Check update status indicator
	-- for D where record non-exist in CLIMS
	--
	----------------------------------------
  UPDATE SI_TEMP_ARBS_CO009 a set is_valid = 'N'
  where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'Y';
  
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO009', security_id, 'BizErr004', 
	'[M] Failed to find deleted security in CLIMS with Security Id [' || security_id || ']'
  from SI_TEMP_ARBS_CO009 a where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'N');
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO009', 'ARBS', 0);
END
@

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO010
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO010', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO010
	SET IS_VALID = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(SECURITY_ID)=0
			OR length(SOURCE_SECURITY_TYPE)=0
			OR length(SOURCE_SECURITY_SUB_TYPE)=0
			OR length(CURRENCY)=0
			OR length(LOC_COUNTRY)=0
			OR length(LOC_ORG_CODE)=0
			OR length(LOC_ORG_DESC)=0
			OR length(LEGAL_ENFORCEABILITY)=0
			OR LEGAL_ENFORCEABILITY_DATE is null
			OR SECURITY_PERFECTION_DATE is null
			OR length(GUARANTEE_AMT)=0
			OR length(INSURANCE)=0;

	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO010', SECURITY_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| SI_BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| SI_BVL(CURRENCY, ' [CURRENCY] ')
		|| SI_BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
		|| SI_BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| SI_BVL(LOC_ORG_DESC, ' [LOC_ORG_DESC] ')
		|| SI_BVL(LEGAL_ENFORCEABILITY, ' [LEGAL_ENFORCEABILITY] ')			
		|| NVL2(char(LEGAL_ENFORCEABILITY_DATE), '', ' [LEGAL_ENFORCEABILITY_DATE] ')	
		|| NVL2(char(SECURITY_PERFECTION_DATE), '', ' [SECURITY_PERFECTION_DATE] ')	
		|| SI_BVL(char(GUARANTEE_AMT), ' [SALE_PURCHASE_AGREEMENT_VALUE] ')			
		|| SI_BVL(INSURANCE, ' [INSURANCE] ')
		|| ' is/are empty.'						
	FROM SI_TEMP_ARBS_CO010
	WHERE IS_VALID = 'N');
	
	-----------------------------------------
	-- Check for duplicate security Id records
	--
	-----------------------------------------
	UPDATE SI_TEMP_ARBS_CO010 a set is_valid = 'N'
  where a.SECURITY_ID in (select t.SECURITY_ID
  	from SI_TEMP_ARBS_CO010 t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO010', SECURITY_ID, 'BizErr004', 
		'[M] Duplicate security info for Guarantees Security ID [' 
  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_CO010 where is_valid = 'N'
  group by SECURITY_ID
  having count(*) > 1);

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO010', 'ARBS', 2);
	commit;
	----------------------------------------
	-- Check update status indicator
	-- for D where record non-exist in CLIMS
	--
	----------------------------------------
  UPDATE SI_TEMP_ARBS_CO010 a set is_valid = 'N'
  where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'Y';
  
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO010', security_id, 'BizErr004', 
	'[M] Failed to find deleted security in CLIMS with Security Id [' || security_id || ']'
  from SI_TEMP_ARBS_CO010 a where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'N');
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO010', 'ARBS', 0);
END
@	

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO011
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO011', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO011
	SET IS_VALID = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(SECURITY_ID)=0
			OR length(SOURCE_SECURITY_TYPE)=0
			OR length(SOURCE_SECURITY_SUB_TYPE)=0
			OR length(LOC_ORG_CODE)=0
			OR length(LOC_ORG_DESC)=0
			OR length(DESC)=0;

	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO011', SECURITY_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| SI_BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| SI_BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| SI_BVL(LOC_ORG_DESC, ' [LOC_ORG_DESC] ')
		|| SI_BVL(DESC, ' [DESC] ')			
		|| ' is/are empty.'						
	FROM SI_TEMP_ARBS_CO011
	WHERE IS_VALID = 'N');

	-----------------------------------------
	-- Check for duplicate security Id records
	--
	-----------------------------------------
	
	UPDATE SI_TEMP_ARBS_CO011 a set is_valid = 'N'
  where a.SECURITY_ID in (select t.SECURITY_ID
  	from SI_TEMP_ARBS_CO011 t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO011', SECURITY_ID, 'BizErr004', 
		'[M] Duplicate security info for Others Security ID [' 
  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_CO011 where is_valid = 'N'
  group by SECURITY_ID
  having count(*) > 1);
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO011', 'ARBS', 2);
	commit;
	----------------------------------------
	-- Check update status indicator
	-- for D where record non-exist in CLIMS
	--
	----------------------------------------
  UPDATE SI_TEMP_ARBS_CO011 a set is_valid = 'N'
  where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'Y';
  
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO011', security_id, 'BizErr004', 
	'[M] Failed to find deleted security in CLIMS with Security Id [' || security_id || ']'
  from SI_TEMP_ARBS_CO011 a where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'N');	

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO011', 'ARBS', 0);
END
@	

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO012
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO012', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO012
	SET IS_VALID = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(SECURITY_ID)=0
			OR length(SOURCE_SECURITY_TYPE)=0
			OR length(SOURCE_SECURITY_SUB_TYPE)=0
			OR length(LOC_ORG_CODE)=0
			OR length(LOC_ORG_DESC)=0;

	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO012', SECURITY_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| SI_BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| SI_BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| SI_BVL(LOC_ORG_DESC, ' [LOC_ORG_DESC] ')	
		|| ' is/are empty.'						
	FROM SI_TEMP_ARBS_CO012
	WHERE IS_VALID = 'N');
	
	-----------------------------------------
	-- Check for duplicate security Id records
	--
	-----------------------------------------
	
	UPDATE SI_TEMP_ARBS_CO012 a set is_valid = 'N'
  where a.SECURITY_ID in (select t.SECURITY_ID
  	from SI_TEMP_ARBS_CO012 t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO012', SECURITY_ID, 'BizErr004', 
		'[M] Duplicate security info for Insurance Protection Security ID [' 
  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_CO012 where is_valid = 'N'
  group by SECURITY_ID
  having count(*) > 1);
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO012', 'ARBS', 2);
	commit;
	----------------------------------------
	-- Check update status indicator
	-- for D where record non-exist in CLIMS
	--
	----------------------------------------
  UPDATE SI_TEMP_ARBS_CO012 a set is_valid = 'N'
  where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'Y';
  
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO012', security_id, 'BizErr004', 
	'[M] Failed to find deleted security in CLIMS with Security Id [' || security_id || ']'
  from SI_TEMP_ARBS_CO012 a where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'N');	
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO012', 'ARBS', 0);
END
@	

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO013
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO013', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO013
	SET IS_VALID = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(SECURITY_ID)=0
			OR length(SOURCE_SECURITY_TYPE)=0
			OR length(SOURCE_SECURITY_SUB_TYPE)=0
			OR length(LOC_ORG_CODE)=0
			OR length(LOC_ORG_DESC)=0
			OR length(LEGAL_ENFORCEABILITY)=0
			OR LEGAL_ENFORCEABILITY_DATE is null
			OR SECURITY_PERFECTION_DATE is null;

	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO013', SECURITY_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| SI_BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| SI_BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| SI_BVL(LOC_ORG_DESC, ' [LOC_ORG_DESC] ')
		|| SI_BVL(LEGAL_ENFORCEABILITY, ' [LEGAL_ENFORCEABILITY] ')			
		|| NVL2(char(LEGAL_ENFORCEABILITY_DATE), '', ' [LEGAL_ENFORCEABILITY_DATE] ')	
		|| NVL2(char(SECURITY_PERFECTION_DATE), '', ' [SECURITY_PERFECTION_DATE] ')	
		|| ' is/are empty.'						
	FROM SI_TEMP_ARBS_CO013
	WHERE IS_VALID = 'N');

	-----------------------------------------
	-- Check for duplicate security Id records
	--
	-----------------------------------------
	
	UPDATE SI_TEMP_ARBS_CO013 a set is_valid = 'N'
  where a.SECURITY_ID in (select t.SECURITY_ID
  	from SI_TEMP_ARBS_CO013 t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO013', SECURITY_ID, 'BizErr004', 
		'[M] Duplicate security info for Documentation Security ID [' 
  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_CO013 where is_valid = 'N'
  group by SECURITY_ID
  having count(*) > 1);
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO013', 'ARBS', 2);
	commit;
	----------------------------------------
	-- Check update status indicator
	-- for D where record non-exist in CLIMS
	--
	----------------------------------------
  UPDATE SI_TEMP_ARBS_CO013 a set is_valid = 'N'
  where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'Y';
  
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO013', security_id, 'BizErr004', 
	'[M] Failed to find deleted security in CLIMS with Security Id [' || security_id || ']'
  from SI_TEMP_ARBS_CO013 a where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'N');	
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO013', 'ARBS', 0);
END
@	

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO014
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO014', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO014
	SET IS_VALID = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(SECURITY_ID)=0
			OR length(SOURCE_SECURITY_TYPE)=0
			OR length(SOURCE_SECURITY_SUB_TYPE)=0
			OR length(LOC_ORG_CODE)=0
			OR length(LOC_ORG_DESC)=0;

	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO014', SECURITY_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| SI_BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| SI_BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| SI_BVL(LOC_ORG_DESC, ' [LOC_ORG_DESC] ')
		|| ' is/are empty.'						
	FROM SI_TEMP_ARBS_CO014
	WHERE IS_VALID = 'N');

	-----------------------------------------
	-- Check for duplicate security Id records
	--
	-----------------------------------------
	
	UPDATE SI_TEMP_ARBS_CO014 a set is_valid = 'N'
  where a.SECURITY_ID in (select t.SECURITY_ID
  	from SI_TEMP_ARBS_CO014 t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO014', SECURITY_ID, 'BizErr004', 
		'[M] Duplicate security info for Clean Security ID [' 
  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_CO014 where is_valid = 'N'
  group by SECURITY_ID
  having count(*) > 1);
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO014', 'ARBS', 2);
	commit;
	----------------------------------------
	-- Check update status indicator
	-- for D where record non-exist in CLIMS
	--
	----------------------------------------
  UPDATE SI_TEMP_ARBS_CO014 a set is_valid = 'N'
  where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'Y';
  
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO014', security_id, 'BizErr004', 
	'[M] Failed to find deleted security in CLIMS with Security Id [' || security_id || ']'
  from SI_TEMP_ARBS_CO014 a where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'N');	
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO014', 'ARBS', 0);
END
@	

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO015
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO015', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO015
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0;
	
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO015', SECURITY_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| ' is/are empty.'						
	FROM SI_TEMP_ARBS_CO015
	WHERE IS_VALID = 'N');
	
	-----------------------------------------
	-- Check for duplicate security Id records
	--
	-----------------------------------------
	
	UPDATE SI_TEMP_ARBS_CO015 a set is_valid = 'N'
  where a.SECURITY_ID in (select t.SECURITY_ID
  	from SI_TEMP_ARBS_CO015 t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO015', SECURITY_ID, 'BizErr004', 
		'[M] Duplicate security info for Security ID [' 
  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_ARBS_CO015 where is_valid = 'N'
  group by SECURITY_ID
  having count(*) > 1);
	
	-----------------------------------------
	-- Check for dependancy in
	-- CMS_SECURITY
	--
	-----------------------------------------
	UPDATE SI_TEMP_ARBS_CO015
	SET IS_VALID = 'N'
	WHERE SECURITY_ID IS NOT NULL
	AND NOT EXISTS
		(SELECT 1
		FROM CMS_SECURITY s
		WHERE s.sci_security_dtl_id = security_id
		AND s.source_id = 'ARBS')
	AND IS_VALID = 'Y';
	
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO015', SECURITY_ID, 'BizErr003',
		'[H] Failed to find security info for Security ID [' || security_id ||'] from the respective Collaterals interface files'
	FROM SI_TEMP_ARBS_CO015
	WHERE IS_VALID = 'N'
	AND SECURITY_ID IS NOT NULL
	AND NOT EXISTS
		(SELECT 1
		FROM CMS_SECURITY s
		WHERE s.sci_security_dtl_id = security_id
		AND s.source_id = 'ARBS'));		
			
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO015', 'ARBS', 0);
END
@		

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO016
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO016', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO016
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
	OR length(SEQ_NUMBER)=0
	OR length(BANK_CUST_ARRANGE_INSURANCE_IN)=0;
	
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO016', SECURITY_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(SEQ_NUMBER, ' [SEQ_NUMBER] ')
		|| SI_BVL(BANK_CUST_ARRANGE_INSURANCE_IN, ' [BANK_CUST_ARRANGE_INSURANCE_IN] ')
		|| ' is/are empty.'						
	FROM SI_TEMP_ARBS_CO016
	WHERE IS_VALID = 'N');
	
	---------------------------------
	-- Check for duplicate records
	--
	---------------------------------
	
	UPDATE SI_TEMP_ARBS_CO016 a set is_valid = 'N'
  where (a.SECURITY_ID, a.SEQ_NUMBER) in (select t.SECURITY_ID, t.SEQ_NUMBER
  	from SI_TEMP_ARBS_CO016 t
  	group by t.SECURITY_ID, t.SEQ_NUMBER
  	having count(*) > 1)
  and a.is_valid = 'Y';
  	
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO016',  SECURITY_ID, SEQ_NUMBER, 'BizErr004', 
		'[M] Duplicate insurance policy info for Security ID [' || SECURITY_ID 
		|| '] Sequence Number [' || SEQ_NUMBER || '] - ' || trim(char(count(*))) || ' records found]' 
  from SI_TEMP_ARBS_CO016 a
	where (a.SECURITY_ID, a.SEQ_NUMBER) in (select t.SECURITY_ID, t.SEQ_NUMBER
  	from SI_TEMP_ARBS_CO016 t
  	group by t.SECURITY_ID, t.SEQ_NUMBER
  	having count(*) > 1)
	and is_valid = 'N'
	group by a.SECURITY_ID, a.SEQ_NUMBER);
	
	
	UPDATE SI_TEMP_ARBS_CO016
	SET IS_VALID = 'N'
	WHERE SECURITY_ID IS NOT NULL
	AND NOT EXISTS
		(SELECT 1
		FROM CMS_SECURITY s
		WHERE s.sci_security_dtl_id = security_id
		AND s.source_id = 'ARBS')
	AND IS_VALID = 'Y';
	
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO016', SECURITY_ID, 'BizErr003',
		'[H] Failed to find security info for Security ID [' || security_id || '] the respective Collaterals interface files'
	FROM SI_TEMP_ARBS_CO016
	WHERE IS_VALID = 'N'
	AND SECURITY_ID IS NOT NULL
	AND NOT EXISTS
		(SELECT 1
		FROM CMS_SECURITY s
		WHERE s.sci_security_dtl_id = security_id
		AND s.source_id = 'ARBS'));		
			
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO016', 'ARBS', 0);
END
@			

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO017
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO017', 'ARBS', 1);
	COMMIT;
	
	LOCK TABLE si_temp_arbs_co017 IN exclusive MODE;
	UPDATE SI_TEMP_ARBS_CO017
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID) = 0
	OR length(APPLICATION_NO) = 0
	OR length(FACILITY_CODE) = 0
	OR FACILITY_SEQ = 0;
	
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO017', SECURITY_ID, 'TechErrSI002', 
		'[L] Mandatory Field(s): '
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(APPLICATION_NO, ' [APPLICATION_NO] ')
		|| SI_BVL(FACILITY_CODE, ' [FACILITY_CODE] ')
		|| (CASE WHEN FACILITY_SEQ=0 THEN ' [FACILITY_SEQ] ' ELSE '' END)
		|| ' is/are empty.'						
	FROM SI_TEMP_ARBS_CO017
	WHERE IS_VALID = 'N');
	
	-------------------------------
	-- Populate Extra columns first
	--
	-------------------------------	
	lock table si_temp_arbs_co017 in exclusive mode;
	UPDATE si_temp_arbs_co017 t SET (cms_act_col_id, cms_stg_col_id) =
	(SELECT reference_id , staging_reference_id
	   FROM cms_security sec, transaction trx
	  WHERE sec.cms_collateral_id = reference_id
		AND trx.transaction_type = 'COL'
		AND sec.source_id = 'ARBS'
		AND sec.sci_security_dtl_id = t.security_id)
	 WHERE is_valid = 'Y';
	 
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO017', 'ARBS', 2);
	COMMIT;
	
	lock table si_temp_arbs_co017 in exclusive mode;
	update si_temp_arbs_co017 t
	set cms_act_lmt_id = 
		(select cms_lsp_appr_lmts_id
		from sci_lsp_appr_lmts lmt
		where source_id = 'ARBS'
		and lmt.lmt_bca_ref_num = t.application_no
		and lmt.lmt_fac_code = t.facility_code
		and lmt.lmt_fac_seq = t.facility_seq)
	where is_valid = 'Y';
	
	CALL "SI_LOG_PROC_TIME"('SI_VALIDATE_TEMP_ARBS_CO017', 'ARBS', 301);
	commit;
	
	
	lock table si_temp_arbs_co017 in exclusive mode;
-- 	UPDATE si_temp_arbs_co017 t SET (cms_act_lmt_id, cms_stg_lmt_id) =
-- 	(SELECT reference_id , staging_reference_id
-- 	   FROM sci_lsp_appr_lmts lmt, transaction trx
-- 	  WHERE lmt.CMS_LSP_APPR_LMTS_ID = reference_id
-- 		AND trx.transaction_type = 'LIMIT'
-- 		AND lmt.source_id = 'ARBS'
-- 		AND lmt.LMT_BCA_REF_NUM = t.APPLICATION_NO
-- 		AND lmt.LMT_FAC_CODE = t.FACILITY_CODE
-- 		AND lmt.LMT_FAC_SEQ = t.FACILITY_SEQ)
-- 	 WHERE is_valid = 'Y';

	UPDATE si_temp_arbs_co017 t SET cms_stg_lmt_id =
	(SELECT staging_reference_id
	   FROM transaction trx
	  WHERE t.cms_act_lmt_id = reference_id
		AND trx.transaction_type = 'LIMIT')
	 WHERE is_valid = 'Y';
	 
	CALL "SI_LOG_PROC_TIME"('SI_VALIDATE_TEMP_ARBS_CO017', 'ARBS', 3);
	commit;
	
	lock table si_temp_arbs_co017 in exclusive mode;
	UPDATE si_temp_arbs_co017 t SET (cms_act_chrg_id) = 
	(SELECT charge_id FROM cms_limit_security_map 
	  WHERE cms_collateral_id = t.cms_act_col_id
		AND cms_lsp_appr_lmts_id = t.cms_act_lmt_id)
	 WHERE is_valid = 'Y';
	 
	CALL "SI_LOG_PROC_TIME"('SI_VALIDATE_TEMP_ARBS_CO017', 'ARBS', 4);
	commit;
	
	---------------------------------
	-- Check for duplicate records
	--
	---------------------------------

	UPDATE SI_TEMP_ARBS_CO017 a set is_valid = 'N'
  where (a.CMS_ACT_COL_ID, a.CMS_ACT_LMT_ID) in (select t.CMS_ACT_COL_ID, t.CMS_ACT_LMT_ID
  	from SI_TEMP_ARBS_CO017 t
  	group by t.CMS_ACT_COL_ID, t.CMS_ACT_LMT_ID
  	having count(*) > 1)
  and a.is_valid = 'Y';

  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO017', SECURITY_ID, application_no, FACILITY_CODE, trim(char(FACILITY_SEQ)), 'BizErr004', 
	'[M] Duplicate charge info for Security ID [' || SECURITY_ID 
	|| '] AA Number [' || application_no 
	|| '] Facility Code [' || FACILITY_CODE 
	|| '] Facility Sequence [' || trim(char(FACILITY_SEQ))
	|| '] - ' || trim(char(count(*))) || ' records found]' 
  from SI_TEMP_ARBS_CO017 a
	where (a.CMS_ACT_COL_ID, a.CMS_ACT_LMT_ID) in (select t.CMS_ACT_COL_ID, t.CMS_ACT_LMT_ID
  	from SI_TEMP_ARBS_CO017 t
  	group by t.CMS_ACT_COL_ID, t.CMS_ACT_LMT_ID
  	having count(*) > 1)
	and a.IS_VALID = 'N'
	group by SECURITY_ID, application_no, FACILITY_CODE, FACILITY_SEQ);
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO017', 'ARBS', 5);
	COMMIT;
	
	UPDATE SI_TEMP_ARBS_CO017
	SET IS_VALID = 'N'
	WHERE cms_act_col_id IS NULL
	AND IS_VALID = 'Y';
	
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO017', SECURITY_ID, 'BizErr003',
		'[H] Failed to find security info for Security ID [' || security_id || '] from the respective Collaterals interface files'
	FROM SI_TEMP_ARBS_CO017
	WHERE IS_VALID = 'N'
	AND cms_act_col_id IS NULL);
	
	UPDATE SI_TEMP_ARBS_CO017
	SET IS_VALID = 'N'
	WHERE cms_act_lmt_id IS NULL
	AND IS_VALID = 'Y';

	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO017', 'BizErr003',
		'[H] Failed to find limit info for AA Number [' || application_no 
		|| '] Facility Code [' || facility_code 
		|| '] Facility Sequence [' || trim(CHAR(facility_seq)) || '] from ARBS CA003 interface file'
	FROM SI_TEMP_ARBS_CO017
	WHERE IS_VALID = 'N'
	AND cms_act_lmt_id IS NULL);
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO017', 'ARBS', 6);
	COMMIT;
		
	UPDATE SI_TEMP_ARBS_CO017
	SET IS_VALID = 'N'
	WHERE cms_act_lmt_id IS NOT NULL
	  AND cms_act_col_id IS NOT NULL
	  AND cms_act_chrg_id IS NULL
	AND IS_VALID = 'Y';
	
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO017', security_id, application_no, facility_code, trim(char(facility_seq)), 'BizErr003',
		'[H] Failed to find limit security linkages for ' ||
		'Security ID [' || security_id || '] ' ||
		'Application No [' ||application_no || '] ' ||
		'Facility Code [' || facility_code || '] ' ||
		'Facility Sequence [' || trim(char(facility_seq)) || '] from ARBS CA005 interface file'
	FROM SI_TEMP_ARBS_CO017
	WHERE IS_VALID = 'N'
	  AND cms_act_lmt_id IS NOT NULL
	  AND cms_act_col_id IS NOT NULL
	  AND cms_act_chrg_id IS NULL);
			
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO017', 'ARBS', 0);
END
@			

CREATE PROCEDURE SI_VALIDATE_TEMP_ARBS_CO018
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO018', 'ARBS', 1);
	
	UPDATE SI_TEMP_ARBS_CO018
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
	OR length(PLEDGOR_CIF_ID)=0
	OR length(PLEDGOR_CIF_SOURCE)=0
	OR length(PLEDGOR_LEGAL_NAME)=0
	OR length(RELATIONSHIP_WITH_BORROWER_COD)=0
	OR length(RELATIONSHIP_WITH_BORROWER_DES)=0;
	
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO018', SECURITY_ID, PLEDGOR_CIF_ID, 'TechErrSI002',
		'[L] Mandatory Field(s): '
		|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| SI_BVL(PLEDGOR_CIF_ID, ' [PLEDGOR_CIF_ID] ')
		|| SI_BVL(PLEDGOR_CIF_SOURCE, ' [PLEDGOR_CIF_SOURCE] ')
		|| SI_BVL(PLEDGOR_LEGAL_NAME, ' [PLEDGOR_LEGAL_NAME] ')
		|| SI_BVL(RELATIONSHIP_WITH_BORROWER_COD, ' [RELATIONSHIP_WITH_BORROWER_COD] ')
		|| SI_BVL(RELATIONSHIP_WITH_BORROWER_DES, ' [RELATIONSHIP_WITH_BORROWER_DES] ')
		|| ' is/are empty.'						
	FROM SI_TEMP_ARBS_CO018
	WHERE IS_VALID = 'N');	
	
	UPDATE SI_TEMP_ARBS_CO018
	SET IS_VALID = 'N'
	WHERE SECURITY_ID IS NOT NULL
	AND NOT EXISTS
		(SELECT 1
		FROM CMS_SECURITY s
		WHERE s.sci_security_dtl_id = security_id
		AND s.source_id = 'ARBS')
	AND IS_VALID = 'Y';
	
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO018', SECURITY_ID, PLEDGOR_CIF_ID, 'BizErr003',
		'[H] Failed to find security info for Security ID [' || security_id || '] from the respective Collaterals interface files'
	FROM SI_TEMP_ARBS_CO018
	WHERE IS_VALID = 'N'
	AND SECURITY_ID IS NOT NULL
	AND NOT EXISTS
		(SELECT 1
		FROM CMS_SECURITY s
		WHERE s.sci_security_dtl_id = security_id
		AND s.source_id = 'ARBS'));			
		
	UPDATE SI_TEMP_ARBS_CO018
	SET IS_VALID = 'N'
	WHERE PLEDGOR_CIF_ID IS NOT NULL
	AND NOT EXISTS 
		(SELECT 1
		FROM SCI_LE_MAIN_PROFILE
		WHERE LMP_LE_ID = PLEDGOR_CIF_ID
		AND SOURCE_ID = 'ARBS')
	AND IS_VALID = 'Y';
	
	INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'ARBS', 'CO018',  SECURITY_ID, PLEDGOR_CIF_ID, 'BizErr003',
		'[H] Failed to find customer info for Pledgor CIF ID [' || pledgor_cif_id || '] from ARBS CU001 interface file'
	FROM SI_TEMP_ARBS_CO018
	WHERE IS_VALID = 'N'
	AND NOT EXISTS 
		(SELECT 1
		FROM SCI_LE_MAIN_PROFILE
		WHERE LMP_LE_ID = PLEDGOR_CIF_ID
		AND SOURCE_ID = 'ARBS'));	

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO018', 'ARBS', 2);
	commit;
	----------------------------------------
	-- Check update status indicator
	-- for D where record non-exist in CLIMS
	--
	----------------------------------------
  UPDATE SI_TEMP_ARBS_CO018 a set is_valid = 'N'
  where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'Y';
  
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'ARBS', 'CO018', security_id, 'BizErr004', 
	'[M] Failed to find deleted security in CLIMS with Security Id [' || security_id || ']'
  from SI_TEMP_ARBS_CO018 a where a.UPDATE_STAT_IND = 'D'
		and a.SECURITY_ID not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'ARBS')
  	and a.is_valid = 'N');	

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_ARBS_CO018', 'ARBS', 0);
END
@		

commit work@