--DROP PROCEDURE SI_VALIDATE_TEMP_SEMA_CU004@
	
--DROP PROCEDURE SI_VALIDATE_TEMP_SEMA_CU002@
	
--DROP PROCEDURE SI_VALIDATE_TEMP_SEMA_CA001@
	
--DROP PROCEDURE SI_VALIDATE_TEMP_SEMA_CA012@
	
--DROP PROCEDURE SI_VALIDATE_TEMP_SEMA_CO020@

--SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM, CLIMS_LOCAL;

CREATE PROCEDURE SI_VALIDATE_TEMP_SEMA_CU004
	LANGUAGE SQL
BEGIN

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CU004', 'SEMA', 1);  
	
	UPDATE SI_TEMP_SEMA_CU004 SET is_valid = 'N'
	WHERE   LENGTH(CIF_ID) = 0
	    OR  LENGTH(CUST_NAME_LONG) = 0
		OR  LENGTH(CUST_NAME_SHORT) = 0
		OR  LENGTH(CUST_CLASS_CODE) = 0
		OR  LENGTH(ID_TYPE_CODE) = 0
	    OR  LENGTH(ID_NUMBER) = 0;
	    
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CU004', COALESCE(CIF_ID, '[CIF No is Empty]'), 'TechErrSI002',
			'Mandatory Field(s): ' 
			|| SI_BVL(cif_id, ' [CIF_ID] ')
			|| SI_BVL(cust_name_long, ' [CUST_NAME_LONG] ')
			|| SI_BVL(CUST_NAME_SHORT, ' [CUST_NAME_SHORT] ')
			|| SI_BVL(CUST_CLASS_CODE, ' [CUST_CLASS_CODE] ')
			|| SI_BVL(ID_TYPE_CODE, ' [ID_TYPE_CODE] ')
			|| SI_BVL(id_number, ' [ID_NUMBER] ')			
			|| ' is/are empty.'
	   FROM si_temp_SEMA_cu004
	  WHERE is_valid = 'N'); 
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CU004', 'SEMA', 2);  
	commit;
	-----------------------------------------
	-- Check Parameter code is exist
	--
	-----------------------------------------
	  
	UPDATE SI_TEMP_SEMA_CU004 
	SET 
	IS_VALID = 'N' 
	WHERE 
	NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = CUST_CLASS_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = CUST_CLASS_CAT			
		)
	AND IS_VALID = 'Y';	
		
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CU004', COALESCE(CIF_ID, '[CIF No is Empty]'), 'BizErr003',
			'Parameter code: CUST_CLASS_CODE [' 
			|| CUST_CLASS_CODE || '] for CIF [' || cif_id
			|| '] is not exist.'
	   FROM si_temp_SEMA_cu004
	  WHERE is_valid = 'N'
	  AND NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = CUST_CLASS_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = CUST_CLASS_CAT
		));
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CU004', 'SEMA', 3);  
	commit;
	
	UPDATE SI_TEMP_SEMA_CU004 
	SET 
	IS_VALID = 'N' 
	WHERE 
	NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = ID_TYPE_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = ID_TYPE_CAT
		AND ENTRY_SOURCE = 'ARBS'
		)
	AND IS_VALID = 'Y';	
	
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CU004', COALESCE(CIF_ID, '[CIF No is Empty]'), 'BizErr003',
			'Parameter code: ID_TYPE_CODE [' 
			|| ID_TYPE_CODE || '] for CIF [' || cif_id
			|| '] is not exist.'
	   FROM si_temp_SEMA_cu004
	  WHERE is_valid = 'N'
	  AND NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = ID_TYPE_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = ID_TYPE_CAT
		AND ENTRY_SOURCE = 'ARBS'
		));
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CU004', 'SEMA', 4);  
	commit;
		
	UPDATE SI_TEMP_SEMA_CU004 
	SET 
	IS_VALID = 'N' 
	WHERE IS_VALID = 'Y' AND length(SECONDARY_ID_TYPE_CODE)>0
	AND
	NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = SECONDARY_ID_TYPE_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = SECONDARY_ID_TYPE_CAT
		AND ENTRY_SOURCE = 'ARBS'
		);	
	
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CU004', COALESCE(CIF_ID, '[CIF No is Empty]'), 'BizErr003',
			'Parameter code: SECONDARY_ID_TYPE_CODE [' 
			|| SECONDARY_ID_TYPE_CODE || '] for CIF [' || cif_id
			|| '] is not exist.'
	   FROM SI_TEMP_SEMA_CU004
	  WHERE is_valid = 'N' AND length(SECONDARY_ID_TYPE_CODE)>0
	  AND NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = SECONDARY_ID_TYPE_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = SECONDARY_ID_TYPE_CAT
		AND ENTRY_SOURCE = 'ARBS'
		));

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CU004', 'SEMA', 5);  
	commit;

	UPDATE SI_TEMP_SEMA_CU004 
	SET 
	IS_VALID = 'N' 
	WHERE 
	NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = CUST_TYPE_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = CUST_TYPE_CAT			
		)
	AND IS_VALID = 'Y' AND length(CUST_TYPE_CODE)>0;	
		
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CU004', COALESCE(CIF_ID, '[CIF No is Empty]'), 'BizErr003',
			'Parameter code: CUST_TYPE_CODE [' 
			|| CUST_TYPE_CODE || '] for CIF [' || cif_id
			|| '] is not exist.'
	   FROM SI_TEMP_SEMA_CU004
	  WHERE is_valid = 'N' AND length(CUST_TYPE_CODE)>0
	  AND NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = CUST_TYPE_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = CUST_TYPE_CAT
		));
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CU004', 'SEMA', 6);  
	commit;
	
	UPDATE SI_TEMP_SEMA_CU004 
	SET 
	IS_VALID = 'N' 
	WHERE 
	NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = INCOME_GROUP
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = INCOME_GROUP_CAT
		AND ENTRY_SOURCE = 'SEMA'
		)
	AND IS_VALID = 'Y' AND length(INCOME_GROUP)>0;	
	
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CU004', COALESCE(CIF_ID, '[CIF No is Empty]'), 'BizErr003',
			'Parameter code: INCOME_GROUP [' 
			|| INCOME_GROUP || '] for CIF [' || cif_id
			|| '] is not exist.'
	   FROM SI_TEMP_SEMA_CU004
	  WHERE is_valid = 'N' AND length(INCOME_GROUP)>0
	  AND NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = INCOME_GROUP
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = INCOME_GROUP_CAT
		AND ENTRY_SOURCE = 'SEMA'
		));

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CU004', 'SEMA', 7);  
	commit;
	
	UPDATE SI_TEMP_SEMA_CU004 
	SET 
	IS_VALID = 'N' 
	WHERE 
	NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = PRIMARY_ADD_TYPE_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = PRIMARY_ADD_TYPE_CAT
		AND ENTRY_SOURCE = 'ARBS'
		)
	AND IS_VALID = 'Y' AND length(PRIMARY_ADD_TYPE_CODE)>0;	
	
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CU004', COALESCE(CIF_ID, '[CIF No is Empty]'), 'BizErr003',
			'Parameter code: PRIMARY_ADD_TYPE_CODE [' 
			|| PRIMARY_ADD_TYPE_CODE || '] for CIF [' || CIF_ID
			|| '] is not exist.'
	   FROM SI_TEMP_SEMA_CU004
	  WHERE is_valid = 'N' AND length(PRIMARY_ADD_TYPE_CODE)>0
	  AND NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = PRIMARY_ADD_TYPE_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = PRIMARY_ADD_TYPE_CAT
		AND ENTRY_SOURCE = 'ARBS'
		));		

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CU004', 'SEMA', 8);  
	commit;

	UPDATE SI_TEMP_SEMA_CU004 
	SET 
	IS_VALID = 'N' 
	WHERE 
	NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = SECONDARY_ADD_TYPE_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = SECONDARY_ADD_TYPE_CAT
		AND ENTRY_SOURCE = 'ARBS'
		)
	AND IS_VALID = 'Y' AND length(SECONDARY_ADD_TYPE_CODE)>0;	
	
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CU004', COALESCE(CIF_ID, '[CIF No is Empty]'), 'BizErr003',
			'Parameter code: SECONDARY_ADD_TYPE_CODE [' 
			|| SECONDARY_ADD_TYPE_CODE || '] for CIF [' || CIF_ID
			|| '] is not exist.'
	   FROM SI_TEMP_SEMA_CU004
	  WHERE is_valid = 'N' AND length(SECONDARY_ADD_TYPE_CODE)>0
	  AND NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = SECONDARY_ADD_TYPE_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = SECONDARY_ADD_TYPE_CAT
		AND ENTRY_SOURCE = 'ARBS'
		));			
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CU004', 'SEMA', 9);  
	commit;
	-----------------------------------------
	-- Check for Duplicate
	--
	-----------------------------------------
	 UPDATE SI_TEMP_SEMA_CU004 a set is_valid = 'N'
	  where cif_id in (select cif_id
	  	from SI_TEMP_SEMA_CU004 t
	  	group by cif_id
	  	having count(*) > 1)
	  and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	  (select current_timestamp, 'SEMA', 'CU004', COALESCE(CIF_ID, '[CIF No is Empty]'), 
	  'BizErr003', 'Duplicate customer info for CIF ID [' 
	  	||  CIF_ID || '] - ' || trim(char(count(*))) || ' records found]'
	  from SI_TEMP_SEMA_CU004 
	  group by cif_id
	  	having count(*) > 1);
	
	
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CU004', 'SEMA', 0);  
END
@

CREATE PROCEDURE SI_VALIDATE_TEMP_SEMA_CU002
	LANGUAGE SQL
BEGIN

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CU002', 'SEMA', 1);  
	
	UPDATE si_temp_SEMA_cu002 a SET is_valid = 'N'
	 WHERE LENGTH(cif_id) = 0
	    OR LENGTH(credit_grade_type) = 0 
	    OR LENGTH(credit_grade_value) = 0;
	    
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CU002', COALESCE(CIF_ID, '[CIF No is Empty]'), 'TechErrSI002',
			'Mandatory Field(s): ' 
			|| SI_BVL(cif_id, ' [CIF_ID] ')
			|| SI_BVL(credit_grade_type, ' [CREDIT_GRADE_TYPE] ')
			|| SI_BVL(credit_grade_value, ' [CREDIT_GRADE_VALUE] ')
			|| ' is/are empty.'
	   FROM si_temp_SEMA_cu002
	  WHERE is_valid = 'N');
	  
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CU002', 'SEMA', 2);  
	commit;
	  
	-----------------------------------------
	-- Check Parameter code is exist
	--
	-----------------------------------------
	UPDATE si_temp_SEMA_cu002 
	SET 
	IS_VALID = 'N' 
	WHERE 
	NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = CREDIT_GRADE_TYPE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = CREDIT_GRADE_TYPE_CAT			
		)
	and is_valid = 'Y';	
		
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CU002', COALESCE(CIF_ID, '[CIF No is Empty]'), 'BizErr003',
			'Parameter code: CREDIT_GRADE_TYPE [' 
			|| CREDIT_GRADE_TYPE || '] for CIF [' || cif_id
			|| '] is not exist.'
	   FROM si_temp_SEMA_cu002
	  WHERE is_valid = 'N'
	  AND NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = CREDIT_GRADE_TYPE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = CREDIT_GRADE_TYPE_CAT
		));	  
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CU002', 'SEMA', 3);  
	commit;
	
	-----------------------------------------
	-- Check for Duplicate
	--
	-----------------------------------------	
	 UPDATE SI_TEMP_SEMA_CU002 a set is_valid = 'N'
	  where cif_id in (select cif_id
	  	from SI_TEMP_SEMA_CU002 t
	  	group by cif_id
	  	having count(*) > 1)
	  and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	  (select current_timestamp, 'SEMA', 'CU002', COALESCE(CIF_ID, '[CIF No is Empty]'), 'BizErr004', 
	   'Duplicate credit grade info for CIF ID [' 
	  	||  cif_id || '] - ' || trim(char(count(*))) || ' records found]'
	  from SI_TEMP_SEMA_CU002 
	  group by cif_id
	  	having count(*) > 1);
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CU002', 'SEMA', 4);  
	commit;		
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LE_MAIN_PROFILE
	--
	-----------------------------------------
	  

	UPDATE si_temp_SEMA_cu002 a SET is_valid = 'N'
	 WHERE NOT EXISTS (SELECT '1' FROM sci_le_main_profile
	 					WHERE lmp_le_id = a.cif_id
	 					  AND source_id = 'SEMA')
	 and is_valid = 'Y';
	 					  
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CU002', COALESCE(CIF_ID, '[CIF No is Empty]'), 
		'BizErr003', 'No Customer Info found for CIF ID ' || cif_id
	  FROM si_temp_SEMA_cu002 
	 WHERE is_valid = 'N'
	   AND NOT EXISTS (SELECT '1' FROM sci_le_main_profile
	 					WHERE lmp_le_id = cif_id
	 					  AND source_id = 'SEMA'));
  
  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CU002', 'SEMA', 0);  
END
@

CREATE PROCEDURE SI_VALIDATE_TEMP_SEMA_CA001
	LANGUAGE SQL
BEGIN

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CA001', 'SEMA', 1);  
	
	UPDATE SI_TEMP_SEMA_CA001 a SET is_valid = 'N'
	 WHERE LENGTH(cif_id) = 0
	 OR LENGTH(CIF_SOURCE) = 0
	 OR LENGTH(AA_NUMBER) = 0
     OR LENGTH(JOINT_BORROWER_IND) = 0
     --LENGTH(AA_APPROVED_DATE) = 0
     OR LENGTH(ORI_LOC_COUNTRY) = 0   
     OR LENGTH(ORI_LOC_ORG_CODE) = 0
	 OR LENGTH(ORI_LOC_ORG_DESC) = 0;	 
	    
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CA001', COALESCE(CIF_ID, '[CIF No is Empty]'), 
			COALESCE(AA_NUMBER, '[AA No is Empty]'), 'TechErrSI002', 
			'Mandatory Field(s): ' 
			|| SI_BVL(cif_id, ' [CIF_ID] ')
			|| SI_BVL(CIF_SOURCE, ' [CIF_SOURCE] ')
			|| SI_BVL(AA_NUMBER, ' [AA_NUMBER] ')
			|| SI_BVL(JOINT_BORROWER_IND, ' [JOINT_BORROWER_IND] ')
			--|| SI_BVL(CHAR(AA_APPROVED_DATE), ' [AA_APPROVED_DATE] ')
			|| SI_BVL(ORI_LOC_COUNTRY, ' [ORI_LOC_COUNTRY] ')
			|| SI_BVL(ORI_LOC_ORG_CODE, ' [ORI_LOC_ORG_CODE] ')
			|| SI_BVL(ORI_LOC_ORG_DESC, ' [ORI_LOC_ORG_DESC] ')			
			|| ' is/are empty.'
	   FROM si_temp_SEMA_CA001
	  WHERE is_valid = 'N');
	  
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CA001', 'SEMA', 2);  
	commit;
	
	----------------------------------------------------------
    -- Validate the following:
    -- Branch code must be ARBS code
    ---------------------------------------------------------- 
	UPDATE SI_TEMP_SEMA_CA001 
	SET 
	IS_VALID = 'N' 
	WHERE IS_VALID = 'Y' AND length(ORI_LOC_ORG_CODE)>0
	AND
	NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = ORI_LOC_ORG_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = ORI_LOC_ORG_CAT
		AND ENTRY_SOURCE = 'ARBS'
		);	
	
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CA001', COALESCE(CIF_ID, '[CIF No is Empty]'), 
			COALESCE(AA_NUMBER, '[AA No is Empty]'), 
			'BizErr003',
			'Parameter code: ' 
			|| SI_BVL(ORI_LOC_ORG_CODE, ' [ORI_LOC_ORG_CODE] ')
			|| ' is not exist.'
	   FROM SI_TEMP_SEMA_CA001
	  WHERE is_valid = 'N' AND length(ORI_LOC_ORG_CODE)>0
	  AND NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = ORI_LOC_ORG_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = ORI_LOC_ORG_CAT
		AND ENTRY_SOURCE = 'ARBS'
		));
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CA001', 'SEMA', 201);  
	commit;
	-----------------------------------------
	-- Check for Duplicate
	--
	-----------------------------------------
	 UPDATE si_temp_SEMA_CA001 a set is_valid = 'N'
	  where AA_NUMBER in (select AA_NUMBER
	  	from si_temp_SEMA_CA001 t
	  	group by AA_NUMBER
	  	having count(*) > 1)
	  and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	  (select current_timestamp, 'SEMA', 'CA001', COALESCE(AA_NUMBER, '[AA No is empty]'), 
	   'BizErr004', 'Duplicate Application info for AA No [' 
	  	||  AA_NUMBER || '] - ' || trim(char(count(*))) || ' records found]'
	  from si_temp_SEMA_CA001 
	  group by AA_NUMBER
	  	having count(*) > 1);
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CA001', 'SEMA', 3);  
	commit;  
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LE_MAIN_PROFILE
	--
	-----------------------------------------
	  

	UPDATE si_temp_SEMA_CA001 a SET is_valid = 'N'
	 WHERE NOT EXISTS (SELECT '1' FROM sci_le_main_profile
	 					WHERE lmp_le_id = a.cif_id
	 					  AND source_id = 'SEMA');
	 					  
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CA001', COALESCE(CIF_ID, '[CIF No is Empty]'), 
	COALESCE(AA_NUMBER, '[AA No is empty]'), 
	 'BizErr003', 'No Customer Info found for CIF ID ' || cif_id
	  FROM si_temp_SEMA_CA001 
	 WHERE is_valid = 'N'
	   AND NOT EXISTS (SELECT '1' FROM sci_le_main_profile
	 					WHERE lmp_le_id = cif_id
	 					  AND source_id = 'SEMA'));
  
  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CA001', 'SEMA', 0);  
  
END
@
  
CREATE PROCEDURE SI_VALIDATE_TEMP_SEMA_CA012
	LANGUAGE SQL
BEGIN
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CA012', 'SEMA', 1);  	
	
	UPDATE si_temp_SEMA_CA012 a SET is_valid = 'N'
	 WHERE LENGTH(CIF_ID) = 0
	    OR LENGTH(AA_NUMBER) = 0
	    OR LENGTH(LIMIT_ID) = 0 
		OR ( LENGTH(STATUS) = 0 AND cif_id <> limit_id )
		OR ( APPROVED_DATE IS NULL AND cif_id <> limit_id )
	    OR LENGTH(ORI_LOC_COUNTRY) = 0
	    OR LENGTH(ORI_LOC_ORG_CODE) = 0	   
	    OR LENGTH(PRODUCT_TYPE_CODE) = 0
	    OR LENGTH(PRODUCT_TYPE_DESC) = 0
	    OR LENGTH(LIMIT_CURRENCY) = 0
	    OR LIMIT_AMT IS NULL
		OR ( LENGTH(INTEREST_MARGIN_BASIS) = 0 AND INTEREST_MARGIN IS NOT NULL )		
		OR DRAWING_LIMIT_AMT IS NULL		
	    OR OUTSTANDING_AMT IS NULL 
	    OR LENGTH(LOAN_SECTOR_CODE) = 0
	    OR LENGTH(DISBURSED_IND) = 0
	    OR (LENGTH(EXTERNAL_SYSTEM_ACCT_NO) = 0 AND outer_limit_id is not null and outer_limit_id != '' and outer_limit_id != limit_id)
	    OR (LENGTH(NPL_STAT) = 0 AND outer_limit_id is not null and outer_limit_id != '' and outer_limit_id != limit_id)
	    OR (NPL_STAT = 'Y' AND NPL_DATE IS NULL);
	    
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CA012', COALESCE(CIF_ID, '[CIF No is Empty]'), 
		COALESCE(AA_NUMBER, '[AA No is empty]'), COALESCE(LIMIT_ID, '[Limit ID is empty]'), 
			'TechErrSI002', 
			'Mandatory Field(s): ' 
			|| SI_BVL(cif_id, ' [CIF_ID] ')
			|| SI_BVL(aa_number, ' [AA_NUMBER] ')
			|| SI_BVL(limit_id, ' [LIMIT_ID] ')
			|| SI_BVL(STATUS, ' [STATUS] ')
			|| SI_BVL(CHAR(APPROVED_DATE), ' [APPROVED_DATE] ')
			|| SI_BVL(ORI_LOC_COUNTRY, ' [ORI_LOC_COUNTRY] ')
			|| SI_BVL(ORI_LOC_ORG_CODE, ' [ORI_LOC_ORG_CODE] ')
			|| SI_BVL(PRODUCT_TYPE_CODE, ' [PRODUCT_TYPE_CODE] ')
			|| SI_BVL(PRODUCT_TYPE_DESC, ' [PRODUCT_TYPE_DESC] ')
			|| SI_BVL(limit_currency, ' [limit_currency] ')
			|| SI_BVL(CHAR(limit_amt), ' [LIMIT_AMT] ')
			|| SI_BVL(INTEREST_MARGIN_BASIS, ' [INTEREST_MARGIN_BASIS] ')
			|| SI_BVL(CHAR(DRAWING_LIMIT_AMT), ' [DRAWING_LIMIT_AMT] ')
			|| SI_BVL(CHAR(outstanding_amt), ' [OUTSTANDING_AMT] ')
			|| SI_BVL(LOAN_SECTOR_CODE, ' [LOAN SECTOR CODE] ')
			|| SI_BVL(DISBURSED_IND, ' [DISBURSED IND] ')
			|| SI_BVL(EXTERNAL_SYSTEM_ACCT_NO, ' [EXTERNAL SYSTEM ACCOUNT NUMBER] ')
			|| SI_BVL(NPL_STAT, ' [NPL STAT] ')
			|| SI_BVL(CHAR(NPL_DATE), ' [NPL DATE] ')
			|| ' is/are empty.'
	   FROM si_temp_SEMA_CA012
	  WHERE is_valid = 'N');

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CA012', 'SEMA', 2);  	
	commit;
	  
	
	-----------------------------------------
	-- Check Parameter code is exist
	--
	-----------------------------------------
	UPDATE si_temp_SEMA_CA012 
	SET 
	IS_VALID = 'N' 
	WHERE IS_VALID = 'Y' AND length(ORI_LOC_ORG_CODE)>0
	AND
	NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = ORI_LOC_ORG_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = ORI_LOC_ORG_CAT
		AND ENTRY_SOURCE = 'ARBS'
		);	
	
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CA012', COALESCE(CIF_ID, '[CIF ID is empty]'), 
		COALESCE(AA_NUMBER, '[AA No is empty]'), COALESCE(LIMIT_ID, '[Limit ID is empty]'),
			'BizErr003',
			'Parameter code: ' 
			|| SI_BVL(ORI_LOC_ORG_CODE, ' [ORI_LOC_ORG_CODE] ')
			|| ' is not exist.'
	   FROM si_temp_SEMA_CA012
	  WHERE is_valid = 'N' AND length(ORI_LOC_ORG_CODE)>0
	  AND NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = ORI_LOC_ORG_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = ORI_LOC_ORG_CAT
		AND ENTRY_SOURCE = 'ARBS'
		));				
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CA012', 'SEMA', 3);  	
	commit;
	
	-----------------------------------------
	-- Check for Duplicate
	--
	-----------------------------------------
	lock table si_temp_SEMA_CA012 in share mode; 		
	
--	UPDATE si_temp_SEMA_CA012 a set is_valid = 'N'
--	  where limit_id in (select limit_id
--	  	from si_temp_SEMA_CA012 t
--	  	group by limit_id
--	  	having count(*) > 1)
--	  and a.is_valid = 'Y';
	  	
--	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, error_code, error_msg)
--	  (select current_timestamp, 'SEMA', 'CA012', 'BizErr004', 'Duplicate Limit for Limit ID [' 
--	  	||  limit_id || '] - ' || trim(char(count(*))) || ' records found]'
--	  from si_temp_SEMA_CA012 
--	  group by limit_id
--	  	having count(*) > 1);
		
	DECLARE GLOBAL TEMPORARY TABLE SESSION.duplicate_lmt(limit_id varchar(16), lmt_cnt int) 
		WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;		
		
	insert into SESSION.duplicate_lmt(limit_id, lmt_cnt)
	(select limit_id, count(*) as lmt_cnt
	from si_temp_sema_ca012 t
	group by limit_id
	having count(*) > 1);
	
	commit;
	
	create index session.t_duplicate_lmt_idx on session.duplicate_lmt (limit_id desc) allow reverse scans;

	UPDATE si_temp_SEMA_CA012 a set is_valid = 'N'
	  where limit_id in (select limit_id
	  	from SESSION.duplicate_lmt)
	  and a.is_valid = 'Y';		

	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	  (select current_timestamp, 'SEMA', 'CA012', COALESCE(LIMIT_ID, '[Limit ID is empty]'),
	    'BizErr004', 'Duplicate Limit for Limit ID [' 
	  	||  limit_id || '] - ' || trim(char(lmt_cnt)) || ' records found]'
	  from SESSION.duplicate_lmt );			  
	
	  drop table SESSION.duplicate_lmt;	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CA012', 'SEMA', 4);  	
	commit;
	
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LSP_LMT_PROFILE
	--
	-----------------------------------------
	call si_runstats ('SCI_LSP_LMT_PROFILE');
	
	lock table si_temp_SEMA_CA012 in exclusive mode; 	
			
	UPDATE si_temp_SEMA_CA012 a SET is_valid = 'N'
	 WHERE NOT EXISTS (SELECT '1' FROM sci_lsp_lmt_profile
	 					WHERE llp_bca_ref_num = a.aa_number
	 					  AND source_id = 'SEMA')
	 and is_valid = 'Y';
	 
	 commit;
	 					  
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CA012', COALESCE(CIF_ID, '[CIF ID is empty]'), 
	COALESCE(AA_NUMBER, '[AA No is empty]'), 
	COALESCE(LIMIT_ID, '[Limit ID is empty]'),
			'BizErr003', 
			'No AA Info found, AA number [' || aa_number || '] for Limit ID [' || limit_id || ']'
	   FROM si_temp_SEMA_CA012 
	  WHERE is_valid = 'N'
	    AND NOT EXISTS (SELECT '1' FROM sci_lsp_lmt_profile
	 					 WHERE llp_bca_ref_num = aa_number
	 					   AND source_id = 'SEMA'));
						   
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CA012', 'SEMA', 0);  							   
END
@

CREATE PROCEDURE SI_VALIDATE_TEMP_SEMA_CO020
	LANGUAGE SQL
BEGIN
DECLARE c_source_id VARCHAR(4) DEFAULT 'SEMA'; 
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CO020', 'SEMA', 1);  	
	
	UPDATE si_temp_SEMA_CO020 a SET is_valid = 'N'
	 WHERE LENGTH(CIF_ID) = 0
	 OR LENGTH(FD_RECEIPT_NO) = 0
	 OR LENGTH(FD_DEPOSIT_AMT_CURR) = 0
     OR FD_DEPOSIT_AMT IS NULL
     OR LENGTH(FD_PLEDGED_AMT_CURR) = 0
     OR FD_PLEDGED_AMT IS NULL;	 	    
     		
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CO020', COALESCE(CIF_ID, '[CIF ID is empty]'), 
		COALESCE(FD_RECEIPT_NO, '[FD Receipt No is empty]'), 
			'TechErrSI002', 
			'Mandatory Field(s): ' 
			|| SI_BVL(cif_id, ' [CIF_ID] ')
			|| SI_BVL(FD_RECEIPT_NO, ' [FD_RECEIPT_NO] ')
			|| SI_BVL(FD_DEPOSIT_AMT_CURR, ' [FD_DEPOSIT_AMT_CURR] ')
			|| SI_BVL(CHAR(FD_DEPOSIT_AMT), ' [FD_DEPOSIT_AMT] ')
			|| SI_BVL(FD_PLEDGED_AMT_CURR, ' [FD_PLEDGED_AMT_CURR] ')
			|| SI_BVL(CHAR(FD_PLEDGED_AMT), ' [FD_PLEDGED_AMT] ')		
			|| ' is/are empty.'
	   FROM si_temp_SEMA_CO020
	  WHERE is_valid = 'N');
	  
	-----------------------------------------
	-- Check for Duplicate
	--
	-----------------------------------------	  
	UPDATE si_temp_SEMA_CO020 set SOURCE_SEC_ID = cif_id || FD_RECEIPT_NO
	  where 
	  is_valid = 'Y';
	
	 UPDATE si_temp_SEMA_CO020 a set is_valid = 'N'
	  where SOURCE_SEC_ID in (select SOURCE_SEC_ID
	  	from si_temp_SEMA_CO020 t
	  	group by SOURCE_SEC_ID
	  	having count(*) > 1)
	  and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	  (select current_timestamp, 'SEMA', 'CO020',  SOURCE_SEC_ID, 
		'BizErr004', 'Duplicate FD info for CIF ID || Receipt No [' 
	  	||  SOURCE_SEC_ID || '] - ' || trim(char(count(*))) || ' records found]'
	  from si_temp_SEMA_CO020 
	  group by SOURCE_SEC_ID
	  	having count(*) > 1);
	
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LSP_APPR_LMTS
	--
	-----------------------------------------

	UPDATE si_temp_SEMA_CO020 a SET is_valid = 'N'
	 WHERE NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
	 					WHERE LMT_ID = a.CIF_ID
	 					  AND source_id = 'SEMA');
	 					  
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SEMA', 'CO020', SOURCE_SEC_ID,
			'BizErr003', 
			'No Limit Info found for CIF ID[' || CIF_ID || '] '
	   FROM si_temp_SEMA_CO020 a
	  WHERE is_valid = 'N'
	    AND NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
	 					 WHERE LMT_ID = a.CIF_ID
	 					   AND source_id = 'SEMA'));
						   
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SEMA_CO020', 'SEMA', 0);  							   
END
@

commit work;