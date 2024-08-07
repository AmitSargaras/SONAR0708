--DROP PROCEDURE SI_VALIDATE_TEMP_QUAN_CU008@
	
--DROP PROCEDURE SI_VALIDATE_TEMP_QUAN_CU002@
	
--DROP PROCEDURE SI_VALIDATE_TEMP_QUAN_CA020@
	

CREATE PROCEDURE SI_VALIDATE_TEMP_QUAN_CU008
	LANGUAGE SQL
BEGIN

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_QUAN_CU008', 'QUAN', 1);  
	
	-------------------------------------------
	-- Check Mandatory Field
	-- 
	-------------------------------------------
	UPDATE SI_TEMP_QUAN_CU008 SET is_valid = 'N'
	WHERE  LENGTH(CIF_ID) = 0
	    OR LENGTH(CUST_NAME_LONG) = 0
		OR LENGTH(CUST_NAME_SHORT) = 0
		OR LENGTH(CUST_CLASS_CODE) = 0
		OR LENGTH(CUST_CLASS_DESC)= 0
		OR LENGTH(ID_TYPE_CODE) = 0
	    OR LENGTH(ID_NUMBER) = 0
	    OR LENGTH(CUST_SEGMENT_CODE) = 0
	    OR LENGTH(CUST_SEGMENT_DESC)=0;
	    
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'QUAN', 'CU008', COALESCE(CIF_ID, '[CIF No is Empty]'), 'TechErrSI002',
			'Mandatory Field(s): ' 
			|| SI_BVL(CIF_ID, ' [CIF_ID] ')
			|| SI_BVL(CUST_NAME_LONG, ' [CUST_NAME_LONG] ')
			|| SI_BVL(CUST_NAME_SHORT, ' [CUST_NAME_SHORT] ')
			|| SI_BVL(CUST_CLASS_CODE, ' [CUST_CLASS_CODE] ')
			|| SI_BVL(CUST_CLASS_DESC, ' [CUST_CLASS_DESC] ')
			|| SI_BVL(ID_TYPE_CODE, ' [ID_TYPE_CODE] ')
			|| SI_BVL(ID_NUMBER, ' [ID_NUMBER] ')	
			|| SI_BVL(CUST_SEGMENT_CODE, ' [CUST_SEGMENT_CODE] ')	
			|| SI_BVL(CUST_SEGMENT_DESC, ' [CUST_SEGMENT_DESC] ')			
			|| ' is/are empty.'
	   FROM si_temp_QUAN_CU008
	  WHERE is_valid = 'N'); 
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_QUAN_CU008', 'QUAN', 2);  
	commit;
	
	-----------------------------------------------
	-- Check If Parameter Code: ID_TYPE_CODE exists
	-- ID_TYPE_CAT = 'ID_TYPE'
	-----------------------------------------------
	UPDATE SI_TEMP_QUAN_CU008 
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
	(SELECT CURRENT_TIMESTAMP, 'QUAN', 'CU008', COALESCE(CIF_ID, '[CIF No is Empty]'), 'BizErr003',
			'Parameter code: ID_TYPE_CODE [' 
			|| ID_TYPE_CODE || '] for CIF [' || cif_id
			|| '] is not exist.'
	   FROM si_temp_QUAN_CU008
	  WHERE is_valid = 'N'
	  AND NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = ID_TYPE_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = ID_TYPE_CAT
		AND ENTRY_SOURCE = 'ARBS'
		));
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_QUAN_CU008', 'QUAN', 3);  
	commit;
	
	---------------------------------------------------------
	-- Check If Parameter Code: SECONDARY_ID_TYPE_CODE exists
	-- SECONDARY_ID_TYPE_CAT = 'ID_TYPE'
	---------------------------------------------------------
	UPDATE SI_TEMP_QUAN_CU008 
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
	(SELECT CURRENT_TIMESTAMP, 'QUAN', 'CU008', COALESCE(CIF_ID, '[CIF No is Empty]'), 'BizErr003',
			'Parameter code: SECONDARY_ID_TYPE_CODE [' 
			|| SECONDARY_ID_TYPE_CODE || '] for CIF [' || cif_id
			|| '] is not exist.'
	   FROM SI_TEMP_QUAN_CU008
	  WHERE is_valid = 'N' AND length(SECONDARY_ID_TYPE_CODE)>0
	  AND NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = SECONDARY_ID_TYPE_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = SECONDARY_ID_TYPE_CAT
		AND ENTRY_SOURCE = 'ARBS'
		));

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_QUAN_CU008', 'QUAN', 4);  
	commit;

	--------------------------------------------------
	-- Check If Parameter Code: CUST_TYPE_CODE exists
	-- CUST_TYPE_CAT = '8'
	--------------------------------------------------
	UPDATE SI_TEMP_QUAN_CU008 
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
	(SELECT CURRENT_TIMESTAMP, 'QUAN', 'CU008', COALESCE(CIF_ID, '[CIF No is Empty]'), 'BizErr003',
			'Parameter code: CUST_TYPE_CODE [' 
			|| CUST_TYPE_CODE || '] for CIF [' || cif_id
			|| '] is not exist.'
	   FROM SI_TEMP_QUAN_CU008
	  WHERE is_valid = 'N' AND length(CUST_TYPE_CODE)>0
	  AND NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = CUST_TYPE_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = CUST_TYPE_CAT
		));
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_QUAN_CU008', 'QUAN', 5);  
	commit;
	
	--------------------------------------------------------
	-- Check If Parameter Code: PRIMARY_ADD_TYPE_CODE exists
	-- PRIMARY_ADD_TYPE_CAT = '4'
	--------------------------------------------------------
	UPDATE SI_TEMP_QUAN_CU008 
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
	(SELECT CURRENT_TIMESTAMP, 'QUAN', 'CU008', COALESCE(CIF_ID, '[CIF No is Empty]'), 'BizErr003',
			'Parameter code: PRIMARY_ADD_TYPE_CODE [' 
			|| PRIMARY_ADD_TYPE_CODE || '] for CIF [' || CIF_ID
			|| '] is not exist.'
	   FROM SI_TEMP_QUAN_CU008
	  WHERE is_valid = 'N' AND length(PRIMARY_ADD_TYPE_CODE)>0
	  AND NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = PRIMARY_ADD_TYPE_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = PRIMARY_ADD_TYPE_CAT
		AND ENTRY_SOURCE = 'ARBS'
		));		

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_QUAN_CU008', 'QUAN', 6);  
	commit;

	-----------------------------------------
	-- Check for Duplicate
	--
	-----------------------------------------
	 UPDATE SI_TEMP_QUAN_CU008 a set is_valid = 'N'
	  where cif_id in (select cif_id
	  	from SI_TEMP_QUAN_CU008 t
	  	group by cif_id
	  	having count(*) > 1)
	  and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	  (select current_timestamp, 'QUAN', 'CU008', COALESCE(CIF_ID, '[CIF No is Empty]'), 
	  'BizErr003', 'Duplicate customer info for CIF ID [' 
	  	||  CIF_ID || '] - ' || trim(char(count(*))) || ' records found]'
	  from SI_TEMP_QUAN_CU008 
	  group by cif_id
	  	having count(*) > 1);
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_QUAN_CU008', 'QUAN', 0);  
END@

CREATE PROCEDURE SI_VALIDATE_TEMP_QUAN_CU002
	LANGUAGE SQL
BEGIN

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_QUAN_CU002', 'QUAN', 1);  
	
	-------------------------------------------
	-- Check Mandatory Field
	-- 
	-------------------------------------------
	UPDATE si_temp_QUAN_CU002 a SET is_valid = 'N'
	 WHERE LENGTH(cif_id) = 0
	    OR LENGTH(credit_grade_type) = 0 
	    OR LENGTH(credit_grade_value) = 0;
	    
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'QUAN', 'CU002', COALESCE(CIF_ID, '[CIF No is Empty]'), 'TechErrSI002',
			'Mandatory Field(s): ' 
			|| SI_BVL(cif_id, ' [CIF_ID] ')
			|| SI_BVL(credit_grade_type, ' [CREDIT_GRADE_TYPE] ')
			|| SI_BVL(credit_grade_value, ' [CREDIT_GRADE_VALUE] ')
			|| ' is/are empty.'
	   FROM si_temp_QUAN_CU002
	  WHERE is_valid = 'N');
	  
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_QUAN_CU002', 'QUAN', 2);  
	commit;
	  
	--------------------------------------------------------
	-- Check If Parameter Code: CREDIT_GRADE_TYPE exists
	-- CREDIT_GRADE_TYPE_CAT = '18'
	--------------------------------------------------------
	UPDATE si_temp_QUAN_CU002 
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
	(SELECT CURRENT_TIMESTAMP, 'QUAN', 'CU002', COALESCE(CIF_ID, '[CIF No is Empty]'), 'BizErr003',
			'Parameter code: CREDIT_GRADE_TYPE [' 
			|| CREDIT_GRADE_TYPE || '] for CIF [' || cif_id
			|| '] is not exist.'
	   FROM si_temp_QUAN_CU002
	  WHERE is_valid = 'N'
	  AND NOT EXISTS (SELECT '1' 
		FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE 		
		ENTRY_CODE = CREDIT_GRADE_TYPE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = CREDIT_GRADE_TYPE_CAT
		));	  
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_QUAN_CU002', 'QUAN', 3);  
	commit;
		
	-----------------------------------------
	-- Check for Duplicate
	--
	-----------------------------------------	
	 UPDATE SI_TEMP_QUAN_CU002 a set is_valid = 'N'
	  where cif_id in (select cif_id
	  	from SI_TEMP_QUAN_CU002 t
	  	group by cif_id
	  	having count(*) > 1)
	  and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	  (select current_timestamp, 'QUAN', 'CU002', COALESCE(CIF_ID, '[CIF No is Empty]'), 'BizErr004', 
	   'Duplicate credit grade info for CIF ID [' 
	  	||  cif_id || '] - ' || trim(char(count(*))) || ' records found]'
	  from SI_TEMP_QUAN_CU002 
	  group by cif_id
	  	having count(*) > 1);
		
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_QUAN_CU002', 'QUAN', 4);  
	commit;		
	
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LE_MAIN_PROFILE
	--
	-----------------------------------------
	UPDATE si_temp_QUAN_CU002 a SET is_valid = 'N'
	 WHERE NOT EXISTS (SELECT '1' FROM sci_le_main_profile
	 					WHERE lmp_le_id = a.cif_id
	 					  AND source_id = 'QUAN')
	 and is_valid = 'Y';
	 					  
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'QUAN', 'CU002', COALESCE(CIF_ID, '[CIF No is Empty]'), 
		'BizErr003', 'No Customer Info found for CIF ID ' || cif_id
	  FROM si_temp_QUAN_CU002 
	 WHERE is_valid = 'N'
	   AND NOT EXISTS (SELECT '1' FROM sci_le_main_profile
	 					WHERE lmp_le_id = cif_id
	 					  AND source_id = 'QUAN'));
  
  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_QUAN_CU002', 'QUAN', 0);  
END@

  
CREATE PROCEDURE SI_VALIDATE_TEMP_QUAN_CA020
	LANGUAGE SQL
BEGIN
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_QUAN_CA020', 'QUAN', 1);  	
	
	UPDATE si_temp_QUAN_CA020 a SET is_valid = 'N'
	 WHERE LENGTH(CIF_ID) = 0
	 	OR LENGTH(MREX_CUST_IND) = 0 
	    OR LENGTH(AA_NUMBER) = 0 
	    OR LENGTH(LIMIT_ID) = 0 
	    OR LENGTH(ORI_LOC_ORG_CODE) = 0	  
	    OR LENGTH(ORI_LOC_ORG_DESC) = 0	 
	    OR LENGTH(LIMIT_CURRENCY) = 0
	    OR LIMIT_AMT IS NULL
		OR OUTSTANDING_AMT IS NULL 
	    OR LENGTH(PRODUCT_TYPE_CODE) = 0
	    OR LENGTH(PRODUCT_TYPE_DESC) = 0
	    OR LENGTH(LOAN_SECTOR_CODE) = 0
	    OR LENGTH(DISBURSED_IND) = 0;
	    
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'QUAN', 'CA020', COALESCE(CIF_ID, '[CIF No is Empty]'), 
		COALESCE(AA_NUMBER, '[AA No is empty]'), COALESCE(LIMIT_ID, '[Limit ID is empty]'), 
			'TechErrSI002', 
			'Mandatory Field(s): ' 
			|| SI_BVL(CIF_ID, ' [CIF_ID] ')
			|| SI_BVL(MREX_CUST_IND, ' [MREX_CUST_IND] ')
			|| SI_BVL(AA_NUMBER, ' [AA_NUMBER] ')
			|| SI_BVL(LIMIT_ID, ' [LIMIT_ID] ')
			|| SI_BVL(ORI_LOC_ORG_CODE, ' [ORI_LOC_ORG_CODE] ')
			|| SI_BVL(ORI_LOC_ORG_DESC, ' [ORI_LOC_ORG_DESC] ')
			|| SI_BVL(LIMIT_CURRENCY, ' [LIMIT_CURRENCY] ')
			|| SI_BVL(CHAR(LIMIT_AMT), ' [LIMIT_AMT] ')
			|| SI_BVL(CHAR(OUTSTANDING_AMT), ' [OUTSTANDING_AMT] ')
			|| SI_BVL(PRODUCT_TYPE_CODE, ' [PRODUCT_TYPE_CODE] ')
			|| SI_BVL(PRODUCT_TYPE_DESC, ' [PRODUCT_TYPE_DESC] ')
			|| SI_BVL(LOAN_SECTOR_CODE, ' [LOAN_SECTOR_CODE] ')
			|| SI_BVL(DISBURSED_IND, ' [DISBURSED_IND] ')
			|| ' is/are empty.'
	   FROM si_temp_QUAN_CA020
	  WHERE is_valid = 'N');

	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_QUAN_CA020', 'QUAN', 2);  	
	commit;
	  
	-----------------------------------------
	-- Check for Duplicate
	--
	-----------------------------------------
	lock table si_temp_QUAN_CA020 in share mode; 		
		
	DECLARE GLOBAL TEMPORARY TABLE SESSION.duplicate_lmt(limit_id varchar(16), lmt_cnt int) 
		WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;		
		
	insert into SESSION.duplicate_lmt(limit_id, lmt_cnt)
	(select limit_id, count(*) as lmt_cnt
	from si_temp_QUAN_CA020 t
	group by limit_id
	having count(*) > 1);
	
	commit;
	
	create index session.t_duplicate_lmt_idx on session.duplicate_lmt (limit_id desc) allow reverse scans;

	UPDATE si_temp_QUAN_CA020 a set is_valid = 'N'
	  where limit_id in (select limit_id
	  	from SESSION.duplicate_lmt)
	  and a.is_valid = 'Y';		

	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	  (select current_timestamp, 'QUAN', 'CA020', COALESCE(LIMIT_ID, '[Limit ID is empty]'),
	    'BizErr004', 'Duplicate Limit for Limit ID [' 
	  	||  limit_id || '] - ' || trim(char(lmt_cnt)) || ' records found]'
	  from SESSION.duplicate_lmt );			  
	
	  drop table SESSION.duplicate_lmt;	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_QUAN_CA020', 'QUAN', 3);  	
	commit;
		 					  
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LE_MAIN_PROFILE
	--
	-----------------------------------------
	call si_runstats ('SCI_LE_MAIN_PROFILE');
	
	lock table si_temp_QUAN_CA020 in exclusive mode; 
	
	UPDATE si_temp_QUAN_CA020 a SET is_valid = 'N'
	 WHERE NOT EXISTS (SELECT '1' FROM sci_le_main_profile
	 					WHERE lmp_le_id = a.cif_id
	 					  AND ((source_id = 'QUAN' AND MREX_CUST_IND='Y') 
	 					  OR (source_id = 'ARBS' AND MREX_CUST_IND='N')))
	 and is_valid = 'Y';
	 					  
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'QUAN', 'CA020', COALESCE(CIF_ID, '[CIF No is Empty]'), 
		'BizErr003', 'No Customer Info found for CIF ID ' || cif_id
	  FROM si_temp_QUAN_CA020 
	 WHERE is_valid = 'N'
	   AND NOT EXISTS (SELECT '1' FROM sci_le_main_profile
	 					WHERE lmp_le_id = cif_id
	 					  AND ((source_id = 'QUAN' AND MREX_CUST_IND='Y') 
	 					  OR (source_id = 'ARBS' AND MREX_CUST_IND='N'))));
						   
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_QUAN_CA020', 'QUAN', 0);  							   
END@

commit work@