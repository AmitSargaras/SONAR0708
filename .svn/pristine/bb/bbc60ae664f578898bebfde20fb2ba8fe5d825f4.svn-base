DROP PROCEDURE MIG_VALIDATE_CU001_CU@
DROP PROCEDURE MIG_VALIDATE_CA001_AA@
DROP PROCEDURE MIG_VALIDATE_CA002_JB@
DROP PROCEDURE MIG_VALIDATE_CA003_1@
DROP PROCEDURE MIG_VALIDATE_CA003_2_BNM@
DROP PROCEDURE MIG_VALIDATE_CA003_3_OFF@
DROP PROCEDURE MIG_VALIDATE_CA003_4_REL@
DROP PROCEDURE MIG_VALIDATE_CA003_5_INS@
DROP PROCEDURE MIG_VALIDATE_CA003_6_MUL@
DROP PROCEDURE MIG_VALIDATE_CA003_7_ISL@
DROP PROCEDURE MIG_VALIDATE_CA003_8_BBA@
DROP PROCEDURE MIG_VALIDATE_CA004@

/* --------- Start of Collateral ---------- */
DROP PROCEDURE MIG_VALIDATE_CO001_AB@
DROP PROCEDURE MIG_VALIDATE_CO002_AB_GOLD@
DROP PROCEDURE MIG_VALIDATE_CO005_CS@
DROP PROCEDURE MIG_VALIDATE_CO008_MS@
DROP PROCEDURE MIG_VALIDATE_CO009_PT@
DROP PROCEDURE MIG_VALIDATE_CO010_GT@
DROP PROCEDURE MIG_VALIDATE_CO011_OT@
DROP PROCEDURE MIG_VALIDATE_CO012_IN@
DROP PROCEDURE MIG_VALIDATE_CO014_CL@

DROP PROCEDURE MIG_VALIDATE_CO015_VL@
DROP PROCEDURE MIG_VALIDATE_CO016_IN@
DROP PROCEDURE MIG_VALIDATE_CO017_CD@
DROP PROCEDURE MIG_VALIDATE_CO018_PG@
DROP PROCEDURE MIG_VALIDATE_CO019_PL@

CREATE PROCEDURE MIG_VALIDATE_CU001_CU
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CU001_CU', 'SIBS', 1);
	
	UPDATE MIG_CU001_CU a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
	    OR length(CIF_ID)=0
	    OR length(CUST_NAME_L)=0
	    OR length(CUST_NAME_S)=0
	    OR length(CUST_CLASS_CODE)=0
        OR length(ID_TYPE_CODE)=0
        OR length(ID_NUMBER)=0;
            
	commit;
	    
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CU001', CIF_ID, 'MAN001',
			'[L] Mandatory Field(s): ' 
			|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| BVL(CIF_ID, ' [CIF_ID] ')
			|| BVL(CUST_NAME_L, ' [CUST_NAME_L] ')
			|| BVL(CUST_NAME_S, ' [CUST_NAME_S] ')
			|| BVL(CUST_CLASS_CODE, ' [CUST_CLASS_CODE] ')
			|| BVL(ID_TYPE_CODE, ' [ID_TYPE_CODE] ')
			|| BVL(ID_NUMBER, ' [ID_NUMBER] ')
			--||(CASE WHEN length(ISIC_CODE)>0 THEN BVL(ISIC_DESC, ' [ISIC_DESC] ') ELSE '' END)
			|| ' is/are empty.'
	   FROM MIG_CU001_CU
	  WHERE is_valid = 'N'
	  AND (length(RECORD_TYPE)=0
	    OR length(CIF_ID)=0
	    OR length(CUST_NAME_L)=0
	    OR length(CUST_NAME_S)=0
	    OR length(CUST_CLASS_CODE)=0
            OR length(ID_TYPE_CODE)=0
            OR length(ID_NUMBER)=0));
	  
		CALL LOG_PROC_TIME('MIG_VALIDATE_CU001_CU', 'SIBS', 2);
		commit;
		
		---------------------------------
		-- Check for duplicate records
		---------------------------------
		
	  UPDATE MIG_CU001_CU a set is_valid = 'N'
	  where a.cif_id in (select t.cif_id
	  	from MIG_CU001_CU t
	  	group by t.cif_id
	  	having count(*) > 1)
	  and a.is_valid = 'Y';
	 
	commit;
	  	
	  INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	  (select current_timestamp, 'SIBS', 'CU001', cif_id, 'DUP001', 
		'[M] Duplicate CIF Id [' 
	  	|| cif_id || '] - ' || trim(char(count(*))) || ' records found]'
	  from MIG_CU001_CU where is_valid = 'N'
	  group by cif_id
	  having count(*) > 1);
		
		CALL LOG_PROC_TIME('MIG_VALIDATE_CU001_CU', 'SIBS', 3);
		commit;
                
		-----------------------------------------------------
		-- Check for non-existence common code
		-----------------------------------------------------
	  UPDATE MIG_CU001_CU a set is_valid = 'N'
	  where ( 
            (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CUST_CLASS_CAT and entry_code = CUST_CLASS_CODE )) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ID_TYPE_CAT and entry_code = ID_TYPE_CODE )) 
         OR (length(SECONDARY_ID_TYPE_CODE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SECONDARY_ID_TYPE_CAT and entry_code = SECONDARY_ID_TYPE_CODE ))) 
         OR (length(CUST_TYPE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CUST_TYPE_CAT and entry_code = CUST_TYPE ))) 
         OR (length(ISIC_CODE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ISIC_CAT and entry_code = ISIC_CODE ))) 
         OR (length(PRIMARY_ADD_TYPE_CODE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PRIMARY_ADD_TYPE_CAT and entry_code = PRIMARY_ADD_TYPE_CODE ))) 
         OR (length(SECONDARY_ADD_TYPE_CODE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SECONDARY_ADD_TYPE_CAT and entry_code = SECONDARY_ADD_TYPE_CODE ))) 
      ) 
      and a.is_valid = 'Y';
	  
	commit;
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CU001', CIF_ID, 'COM001',
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('CUST_CLASS_CODE', CUST_CLASS_CODE, CUST_CLASS_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('ID_TYPE_CODE', ID_TYPE_CODE, ID_TYPE_CAT)
			|| (CASE WHEN length(SECONDARY_ID_TYPE_CODE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('SECONDARY_ID_TYPE_CODE', SECONDARY_ID_TYPE_CODE, SECONDARY_ID_TYPE_CAT) ELSE '' END)
			|| (CASE WHEN length(CUST_TYPE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('CUST_TYPE', CUST_TYPE, CUST_TYPE_CAT) ELSE '' END)
			|| (CASE WHEN length(ISIC_CODE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('ISIC_CODE', ISIC_CODE, CUST_CLASS_CAT) ELSE '' END)
			|| (CASE WHEN length(PRIMARY_ADD_TYPE_CODE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('PRIMARY_ADD_TYPE_CODE', PRIMARY_ADD_TYPE_CODE, PRIMARY_ADD_TYPE_CAT) ELSE '' END)
			|| (CASE WHEN length(SECONDARY_ADD_TYPE_CODE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('SECONDARY_ADD_TYPE_CODE', SECONDARY_ADD_TYPE_CODE, SECONDARY_ADD_TYPE_CAT) ELSE '' END)
	   FROM MIG_CU001_CU
       WHERE ( 
            (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CUST_CLASS_CAT and entry_code = CUST_CLASS_CODE )) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ID_TYPE_CAT and entry_code = ID_TYPE_CODE )) 
         OR (length(SECONDARY_ID_TYPE_CODE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SECONDARY_ID_TYPE_CAT and entry_code = SECONDARY_ID_TYPE_CODE ))) 
         OR (length(CUST_TYPE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CUST_TYPE_CAT and entry_code = CUST_TYPE ))) 
         OR (length(ISIC_CODE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ISIC_CAT and entry_code = ISIC_CODE ))) 
         OR (length(PRIMARY_ADD_TYPE_CODE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PRIMARY_ADD_TYPE_CAT and entry_code = PRIMARY_ADD_TYPE_CODE ))) 
         OR (length(SECONDARY_ADD_TYPE_CODE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SECONDARY_ADD_TYPE_CAT and entry_code = SECONDARY_ADD_TYPE_CODE ))) 
      ));
      
      
		CALL LOG_PROC_TIME('MIG_VALIDATE_CU001_CU', 'SIBS', 4);
		commit;
      
		-----------------------------------------------------
		-- Check for invalid values
		-----------------------------------------------------
	  UPDATE MIG_CU001_CU a set is_valid = 'N'
	  where ( 
                (BLACKLISTED not in ('Y', 'N'))            
      ) 
      and a.is_valid = 'Y';

      commit;
	  
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CU001', CIF_ID, 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| GET_INVALID_VALUE_MSG('BLACKLISTED', BLACKLISTED, 'Y/N')
	   FROM MIG_CU001_CU
       WHERE ( 
                (BLACKLISTED not in ('Y', 'N'))
      ));
            
      
		CALL LOG_PROC_TIME('MIG_VALIDATE_CU001_CU', 'SIBS', 0);
		commit;
	  		
END@


CREATE PROCEDURE MIG_VALIDATE_CA001_AA
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA001_AA', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CA001_AA a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
			OR length(CIF_ID)=0
			OR length(CIF_SOURCE)=0
			OR length(LOS_BCA_REF_NUM)=0
			OR length(AA_NUMBER)=0
			OR length(JOINT_BORROWER_IND)=0
			--OR AA_APPROVED_DATE is null
			OR length(ORI_LOC_COUNTRY)=0
			OR length(ORI_LOC_ORG_CODE)=0
			OR length(AA_STAT)=0
			OR AA_CREATE_DATE is null
			OR length(APPLICATION_TYPE)=0
			OR length(APPLICATION_LAW_TYPE)=0;

	commit;
	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA001', CIF_ID, AA_NUMBER, 'MAN001',
			'[L] Mandatory Field(s): ' 
			|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| BVL(CIF_ID, ' [CIF_ID] ')
			|| BVL(CIF_SOURCE, ' [CIF_SOURCE] ')
			|| BVL(LOS_BCA_REF_NUM, ' [LOS_BCA_REF_NUM] ')
			|| BVL(AA_NUMBER, ' [AA_NUMBER] ')
			|| BVL(JOINT_BORROWER_IND, ' [JOINT_BORROWER_IND] ')
			--|| NVL2(char(AA_APPROVED_DATE), '', ' [AA_APPROVED_DATE] ')
			|| BVL(ORI_LOC_COUNTRY, ' [ORI_LOC_COUNTRY] ')
			|| BVL(ORI_LOC_ORG_CODE, ' [ORI_LOC_ORG_CODE] ')
			|| BVL(AA_STAT, ' [AA_STAT] ')
			|| NVL2(char(AA_CREATE_DATE), '',  ' [AA_CREATE_DATE] ')
			|| BVL(APPLICATION_TYPE, ' [APPLICATION_TYPE] ')
			|| BVL(APPLICATION_LAW_TYPE, ' [APPLICATION_LAW_TYPE] ')
			|| ' is/are empty.'
	   FROM MIG_CA001_AA
	  WHERE is_valid = 'N'
	  AND (length(RECORD_TYPE)=0
		OR length(CIF_ID)=0
		OR length(CIF_SOURCE)=0
		OR length(LOS_BCA_REF_NUM)=0
		OR length(AA_NUMBER)=0
		OR length(JOINT_BORROWER_IND)=0
		OR length(ORI_LOC_COUNTRY)=0
		OR length(ORI_LOC_ORG_CODE)=0
		OR length(AA_STAT)=0
		OR AA_CREATE_DATE is null
		OR length(APPLICATION_TYPE)=0
		OR length(APPLICATION_LAW_TYPE)=0));
		

    CALL LOG_PROC_TIME('MIG_VALIDATE_CA001_AA', 'SIBS', 2);  
    commit;

	---------------------------------
	-- Check for duplicate records
	---------------------------------
	  CALL RUNSTATS_HELPER('MIG_CA001_AA', 'IS_VALID, LOS_BCA_REF_NUM, CIF_ID, JOINT_BORROWER_IND, APPLICATION_TYPE');
	  
	  UPDATE MIG_CA001_AA a set is_valid = 'N'
	  where a.LOS_BCA_REF_NUM in (select t.LOS_BCA_REF_NUM
	  	from MIG_CA001_AA t
	  	group by t.LOS_BCA_REF_NUM
	  	having count(*) > 1)
	  and a.is_valid = 'Y';
	  	
	commit;
	
	  INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key3_value, error_code, error_msg)
	  (select current_timestamp, 'SIBS', 'CA001',  CIF_ID, LOS_BCA_REF_NUM, 'DUP001', 
		'[M] Duplicate LOS AA Number [' 
	  	|| LOS_BCA_REF_NUM || '] - ' || trim(char(count(*))) || ' records found]'
	  from MIG_CA001_AA where is_valid = 'N'
	  group by CIF_ID, LOS_BCA_REF_NUM
	  having count(*) > 1);

    CALL LOG_PROC_TIME('MIG_VALIDATE_CA001_AA', 'SIBS', 3);  
    commit;
    
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LE_MAIN_PROFILE
	-----------------------------------------
	UPDATE MIG_CA001_AA a SET is_valid = 'N'
	WHERE NOT EXISTS (SELECT 1 FROM sci_le_main_profile
						WHERE lmp_le_id = a.CIF_ID
						AND source_id = 'SIBS' fetch first row only)
	and is_valid = 'Y';
							
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA001', CIF_ID, AA_NUMBER, 'CNF001', 
	'[H] Failed to find customer info for CIF Id [' || CIF_ID || '] from CU001 interface file'
		FROM MIG_CA001_AA 
	WHERE is_valid = 'N'
		AND NOT EXISTS (SELECT 1 FROM sci_le_main_profile
						WHERE lmp_le_id = CIF_ID
						AND source_id = 'SIBS' fetch first row only));
	  
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA001_AA', 'SIBS', 5);  
    commit;
    
	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------
	UPDATE MIG_CA001_AA a set is_valid = 'N'
	where ( 
			(JOINT_BORROWER_IND not in ('Y', 'N'))
		OR  (APPLICATION_TYPE not in ('HP', 'MO', 'SF', '3P', 'AR', 'GR'))
	) 
	and a.is_valid = 'Y';

      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA001', CIF_ID, AA_NUMBER, 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| (CASE WHEN (JOINT_BORROWER_IND not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('JOINT_BORROWER_IND', JOINT_BORROWER_IND, 'Y/N') ELSE '' END)
			|| (CASE WHEN (APPLICATION_TYPE not in ('HP', 'MO', 'SF', '3P', 'AR', 'GR')) THEN GET_INVALID_VALUE_MSG('APPLICATION_TYPE', APPLICATION_TYPE, 'HP/MO/SF/3P/AR/GR') ELSE '' END)
	   FROM MIG_CA001_AA
       WHERE ( 
                (JOINT_BORROWER_IND not in ('Y', 'N'))
            OR  (APPLICATION_TYPE not in ('HP', 'MO', 'SF', '3P', 'AR', 'GR'))
      ));
      
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA001_AA', 'SIBS', 6);  
    	commit;
    
	-----------------------------------------------------
	-- Check for non-existence common code
	-----------------------------------------------------
	UPDATE MIG_CA001_AA a set is_valid = 'N'
	where ( 
		(not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ori_loc_org_cat and entry_code = ori_loc_org_code fetch first row only)) 
	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = AA_STATUS_CAT and entry_code = AA_STAT fetch first row only)) 
	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = APP_LAW_TYPE_CAT and entry_code = APPLICATION_LAW_TYPE fetch first row only)) 
	) 
	and a.is_valid = 'Y';
	
	commit;
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA001', CIF_ID, AA_NUMBER, 'COM001',
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('ori_loc_org_code', ori_loc_org_code, ori_loc_org_cat)
			|| GET_INVALID_COMMON_CODE_MSG('AA_STATUS', AA_STAT, AA_STATUS_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('APPLICATION_LAW_TYPE', APPLICATION_LAW_TYPE, APP_LAW_TYPE_CAT)
	   FROM MIG_CA001_AA
       WHERE ( 
            (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ori_loc_org_cat and entry_code = ori_loc_org_code fetch first row only)) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = AA_STATUS_CAT and entry_code = AA_STAT fetch first row only)) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = APP_LAW_TYPE_CAT and entry_code = APPLICATION_LAW_TYPE fetch first row only)) 
      ));
      
      CALL LOG_PROC_TIME('MIG_VALIDATE_CA001_AA', 'SIBS', 0);
      commit;
    
END@


CREATE PROCEDURE MIG_VALIDATE_CA002_JB
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA002_JB', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CA002_JB a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
			OR length(CIF_ID)=0
			OR length(CIF_SOURCE)=0
			OR length(AA_NUMBER)=0;
		
	commit;

	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA002', CIF_ID, AA_NUMBER, 'MAN001',
			'[L] Mandatory Field(s): ' 
			|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| BVL(CIF_ID, ' [CIF_ID] ')
			|| BVL(CIF_SOURCE, ' [CIF_SOURCE] ')
			|| BVL(AA_NUMBER, ' [AA_NUMBER] ')
			|| ' is/are empty.'
	   FROM MIG_CA002_JB
	  WHERE is_valid = 'N'
	  AND (length(RECORD_TYPE)=0
		OR length(CIF_ID)=0
		OR length(CIF_SOURCE)=0
		OR length(AA_NUMBER)=0));
		
		CALL LOG_PROC_TIME('MIG_VALIDATE_CA002_JB', 'SIBS', 2);
		COMMIT;
		
		---------------------------------
		-- Check for duplicate records
		---------------------------------
		
	UPDATE MIG_CA002_JB a set is_valid = 'N'
	where (a.cif_id, a.AA_NUMBER) in (select t.cif_id, t.AA_NUMBER
		from MIG_CA002_JB t
		group by t.cif_id, t.AA_NUMBER
		having count(*) > 1)
		and a.is_valid = 'Y';
		
	commit;

	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
		(select current_timestamp, 'SIBS', 'CA002',  CIF_ID, AA_NUMBER, 'DUP001', 
		'[M] Duplicate joint borrower info found for CIF ID [' || CIF_ID 
		|| '] AA Number [' || AA_NUMBER || '] - ' || trim(char(count(*))) || ' records found]' 
	from MIG_CA002_JB a
	where (a.cif_id, a.AA_NUMBER) in (select t.cif_id, t.AA_NUMBER
		from MIG_CA002_JB t
		group by t.cif_id, t.AA_NUMBER
		having count(*) > 1)
	and is_valid = 'N'
	group by CIF_ID, AA_NUMBER);
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA002_JB', 'SIBS', 3);
	COMMIT;

	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LE_MAIN_PROFILE
	-----------------------------------------
	
	UPDATE MIG_CA002_JB a SET is_valid = 'N'
	WHERE NOT EXISTS (SELECT '1' FROM sci_le_main_profile
				WHERE lmp_le_id = a.CIF_ID
				AND source_id = 'SIBS')
	and is_valid = 'Y';
	
	commit;
							
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA002', CIF_ID, AA_NUMBER, 'CNF001', 
		'[H] Failed to find customer info for CIF Id [' || CIF_ID ||'] from CU001 interface file'
	FROM MIG_CA002_JB 
	WHERE is_valid = 'N'
	AND NOT EXISTS (SELECT '1' FROM sci_le_main_profile
			WHERE lmp_le_id = CIF_ID
			AND source_id = 'SIBS'));
	 
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA002_JB', 'SIBS', 5);
	COMMIT;
	 
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LSP_LMT_PROFILE
	-----------------------------------------

	CALL RUNSTATS_HELPER('MIG_CA002_JB');
	CALL RUNSTATS_HELPER('sci_lsp_lmt_profile');

	UPDATE MIG_CA002_JB a
	SET CMS_ACT_LMT_PROFILE_ID = (select llp.cms_lsp_lmt_profile_id
					from sci_lsp_lmt_profile llp
					where llp.LOS_BCA_REF_NUM IS NOT NULL
					AND llp.LOS_BCA_REF_NUM = a.AA_NUMBER
					and llp.source_id = 'RLOS')
	WHERE is_valid = 'Y'
	and EXISTS (select 1
			from sci_lsp_lmt_profile llp
			where 
			--llp.LOS_BCA_REF_NUM IS NOT NULL AND 
			llp.LOS_BCA_REF_NUM = a.AA_NUMBER
			and llp.source_id = 'RLOS');
	
	commit;

	update MIG_CA002_JB a set is_valid = 'N'
	where CMS_ACT_LMT_PROFILE_ID is null;
	
	commit;

	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA002', cif_id, aa_number, 'ANF001', 
		'[H] Failed to find AA Number [' || aa_number || '] from CA001 interface file'
	FROM MIG_CA002_JB
	WHERE is_valid = 'N'
	and not exists (select 1 from sci_lsp_lmt_profile 
		where los_bca_ref_num = aa_number 
		and source_id = 'RLOS'));
	--and CMS_ACT_LMT_PROFILE_ID is null);
							
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA002_JB', 'SIBS', 0);  
	COMMIT;
END
@

CREATE PROCEDURE MIG_VALIDATE_CA003_1
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_1', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CA003_1 a SET is_valid = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(CIF_ID)=0
			OR length(LOS_AA_NUMBER)=0
			OR length(AA_NUMBER)=0
			OR length(LIMIT_ID)=0
			--OR length(ACF_NO)=0
			OR length(FACILITY_CODE)=0
			OR length(FACILITY_SEQ)=0
			OR length(ORI_LOC_COUNTRY)=0
			OR length(ORG_LOC_ORG_CODE)=0
			OR length(PRODUCT_TYPE_CODE)=0
			OR length(LIMIT_CURRENCY)=0
			OR length(LIMIT_AMT)=0
			OR (LIMIT_TENOR>0 and length(LIMIT_TENOR_UOM)=0)
			OR length(DRAWING_LIMIT_AMT)=0
			OR length(OUTSTANDING_AMT)=0
			OR length(FINANCED_AMOUNT) = 0
			OR length(APPLICATION_DATE) = 0
			OR length(INSTALLMENT_AMOUNT) = 0
			OR length(FINAL_PAYMENT) = 0
			--OR length(LOAN_PURPOSE_CODE_VALUE) = 0
			--OR length(OFFER_DATE) = 0
			--OR length(OFFER_ACCEPTED_DATE) = 0
			--OR length(APPROVED_DATE) = 0
			--OR length(PERSON_APPROVED_CODE_VALUE) = 0
			--OR length(CAR_CODE_FLAG) = 0
			OR length(CAR_CODE_VALUE) = 0
			--OR length(OFFICER_CODE_VALUE) = 0
			--OR length(LMT_STATUS_CODE_VALUE) = 0
			OR length(FAC_STATUS_CODE_VALUE) = 0
			OR length(INTEREST_RATE) = 0
			OR (COMMISSION_RATE>0 and length(COMMISSION_FEES)=0)
			-- OR (COMMISSION_RATE>0 and length(COMMISSION_BASIS_CODE_VALUE)=0)
			OR length(MAIN_FACILITY_IND) = 0
			OR (MAIN_FACILITY_IND='Y' and length(MAIN_FACILITY_AA_NUM)=0)
			OR (MAIN_FACILITY_IND='Y' and length(MAIN_FACILITY_CODE)=0)
			OR (MAIN_FACILITY_IND='Y' and length(MAIN_FACILITY_SEQ)=0)
			--OR length(STANDBY_LINE) = 0
			OR (length(GRADE_PERIOD_VALUE)>0 and length(GRADE_PERIOD_CODE_VALUE)=0)
			OR length(REVOLVING_IND) = 0
			OR (REVOLVING_IND='R' and length(REVOLVING_ON_CRITERIA_IND)=0)
			--OR length(APPL_SRC_CODE_VALUE) = 0
			OR (EFFECTIVE_COSE_OF_FUND='Y' and length(ECOF_ADMIN_COST)=0)
			OR (EFFECTIVE_COSE_OF_FUND='Y' and length(ECOF_RATE)=0);
			--OR (EFFECTIVE_COSE_OF_FUND='Y' and length(ECOF_VARIANCE)=0)
			--OR (EFFECTIVE_COSE_OF_FUND='Y' and length(ECOF_VARIANCE_CODE)=0);
			--OR length(DEPARTMENT_CODE_VALUE) = 0;

	commit;
	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', CIF_ID, LIMIT_ID, AA_NUMBER, FACILITY_CODE, trim(char(FACILITY_SEQ)), 'MAN001',
			'[L] Mandatory Field(s): ' 
			|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| BVL(CIF_ID, ' [CIF_ID] ')
			|| BVL(LOS_AA_NUMBER, ' [LOS_AA_NUMBER] ')
			|| BVL(AA_NUMBER, ' [AA_NUMBER] ')
			|| BVL(LIMIT_ID, ' [LIMIT_ID] ')
			--|| BVL(ACF_NO, ' [ACF_NO] ')
			|| BVL(FACILITY_CODE, ' [FACILITY_CODE] ')
			|| NVL2(char(FACILITY_SEQ), '', ' [FACILITY_SEQ] ')
			|| BVL(ORI_LOC_COUNTRY, ' [ORI_LOC_COUNTRY] ')
			|| BVL(ORG_LOC_ORG_CODE, ' [ORG_LOC_ORG_CODE] ')
			|| BVL(PRODUCT_TYPE_CODE, ' [PRODUCT_TYPE_CODE] ')
			|| BVL(LIMIT_CURRENCY, ' [LIMIT_CURRENCY] ')
			|| NVL2(char(LIMIT_AMT), '', ' [LIMIT_AMT] ')
			||(CASE WHEN LIMIT_TENOR>0 THEN BVL(LIMIT_TENOR_UOM, ' [LIMIT_TENOR_UOM] ') ELSE '' END)
			|| NVL2(char(DRAWING_LIMIT_AMT), '', ' [DRAWING_LIMIT_AMT] ')
			|| NVL2(char(OUTSTANDING_AMT), '', ' [OUTSTANDING_AMT] ')
			|| NVL2(char(FINANCED_AMOUNT), '', ' [FINANCED_AMOUNT] ')
			|| NVL2(char(APPLICATION_DATE), '', ' [APPLICATION_DATE] ')
			|| NVL2(char(INSTALLMENT_AMOUNT), '', ' [INSTALLMENT_AMOUNT] ')
			|| NVL2(char(FINAL_PAYMENT), '', ' [FINAL_PAYMENT] ')
			--|| BVL(LOAN_PURPOSE_CODE_VALUE, ' [LOAN_PURPOSE_CODE_VALUE] ')
			--|| NVL2(char(OFFER_DATE), '', ' [OFFER_DATE] ')
			--|| NVL2(char(OFFER_ACCEPTED_DATE), '', ' [OFFER_ACCEPTED_DATE] ')
			--|| NVL2(char(APPROVED_DATE), '', ' [APPROVED_DATE] ')
			--|| BVL(PERSON_APPROVED_CODE_VALUE, ' [PERSON_APPROVED_CODE_VALUE] ')
			--|| BVL(CAR_CODE_FLAG, ' [CAR_CODE_FLAG] ')
			|| BVL(CAR_CODE_VALUE, ' [CAR_CODE_VALUE] ')
			--|| BVL(OFFICER_CODE_VALUE, ' [OFFICER_CODE_VALUE] ')
			--|| BVL(LMT_STATUS_CODE_VALUE, ' [LMT_STATUS_CODE_VALUE] ')
			|| BVL(FAC_STATUS_CODE_VALUE, ' [FAC_STATUS_CODE_VALUE] ')
			|| NVL2(char(INTEREST_RATE), '', ' [INTEREST_RATE] ')
			||(CASE WHEN COMMISSION_RATE>0 THEN NVL2(char(COMMISSION_FEES), '', ' [COMMISSION_FEES] ') ELSE '' END)
			-- ||(CASE WHEN COMMISSION_RATE>0 THEN BVL(COMMISSION_BASIS_CODE_VALUE, ' [COMMISSION_BASIS_CODE_VALUE] ') ELSE '' END)
			|| BVL(MAIN_FACILITY_IND, ' [MAIN_FACILITY_IND] ')
			||(CASE WHEN MAIN_FACILITY_IND='Y' THEN BVL(MAIN_FACILITY_AA_NUM, ' [MAIN_FACILITY_AA_NUM] ') ELSE '' END)
			||(CASE WHEN MAIN_FACILITY_IND='Y' THEN BVL(MAIN_FACILITY_CODE, ' [MAIN_FACILITY_CODE] ') ELSE '' END)
			||(CASE WHEN MAIN_FACILITY_IND='Y' THEN NVL2(char(MAIN_FACILITY_SEQ), '', ' [MAIN_FACILITY_SEQ] ') ELSE '' END)
			-- || BVL(STANDBY_LINE, ' [STANDBY_LINE] ')
			||(CASE WHEN length(GRADE_PERIOD_VALUE)>0 THEN BVL(GRADE_PERIOD_CODE_VALUE, ' [GRADE_PERIOD_CODE_VALUE] ') ELSE '' END)
			|| BVL(REVOLVING_IND, ' [REVOLVING_IND] ')
			||(CASE WHEN REVOLVING_IND='R' THEN BVL(REVOLVING_ON_CRITERIA_IND, ' [REVOLVING_ON_CRITERIA_IND] ') ELSE '' END)
			--|| BVL(APPL_SRC_CODE_VALUE, ' [APPL_SRC_CODE_VALUE] ')
			||(CASE WHEN EFFECTIVE_COSE_OF_FUND='Y' THEN NVL2(char(ECOF_ADMIN_COST), '', ' [ECOF_ADMIN_COST] ') ELSE '' END)
			||(CASE WHEN EFFECTIVE_COSE_OF_FUND='Y' THEN NVL2(char(ECOF_RATE), '', ' [ECOF_RATE] ') ELSE '' END)
			--||(CASE WHEN EFFECTIVE_COSE_OF_FUND='Y' THEN NVL2(char(ECOF_VARIANCE), '', ' [ECOF_VARIANCE] ') ELSE '' END)
			--||(CASE WHEN EFFECTIVE_COSE_OF_FUND='Y' THEN BVL(ECOF_VARIANCE_CODE, ' [ECOF_VARIANCE_CODE] ') ELSE '' END)
			--|| BVL(DEPARTMENT_CODE_VALUE, ' [DEPARTMENT_CODE_VALUE] ')
			|| ' is/are empty.'
	 FROM MIG_CA003_1
	 WHERE is_valid = 'N'
	 AND (length(RECORD_TYPE)=0
		OR length(CIF_ID)=0
		OR length(LOS_AA_NUMBER)=0
		OR length(AA_NUMBER)=0
		OR length(LIMIT_ID)=0
		OR length(FACILITY_CODE)=0
		OR length(FACILITY_SEQ)=0
		OR length(ORI_LOC_COUNTRY)=0
		OR length(ORG_LOC_ORG_CODE)=0
		OR length(PRODUCT_TYPE_CODE)=0
		OR length(LIMIT_CURRENCY)=0
		OR length(LIMIT_AMT)=0
		OR (LIMIT_TENOR>0 and length(LIMIT_TENOR_UOM)=0)
		OR length(DRAWING_LIMIT_AMT)=0
		OR length(OUTSTANDING_AMT)=0
		OR length(FINANCED_AMOUNT) = 0
		OR length(APPLICATION_DATE) = 0
		OR length(INSTALLMENT_AMOUNT) = 0
		OR length(FINAL_PAYMENT) = 0
		OR length(CAR_CODE_VALUE) = 0
		OR length(FAC_STATUS_CODE_VALUE) = 0
		OR length(INTEREST_RATE) = 0
		OR (COMMISSION_RATE>0 and length(COMMISSION_FEES)=0)
		OR length(MAIN_FACILITY_IND) = 0
		OR (MAIN_FACILITY_IND='Y' and length(MAIN_FACILITY_AA_NUM)=0)
		OR (MAIN_FACILITY_IND='Y' and length(MAIN_FACILITY_CODE)=0)
		OR (MAIN_FACILITY_IND='Y' and length(MAIN_FACILITY_SEQ)=0)
		OR (length(GRADE_PERIOD_VALUE)>0 and length(GRADE_PERIOD_CODE_VALUE)=0)
		OR length(REVOLVING_IND) = 0
		OR (REVOLVING_IND='R' and length(REVOLVING_ON_CRITERIA_IND)=0)
		OR (EFFECTIVE_COSE_OF_FUND='Y' and length(ECOF_ADMIN_COST)=0)
		OR (EFFECTIVE_COSE_OF_FUND='Y' and length(ECOF_RATE)=0)));
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_1', 'SIBS', 2);
	commit;

	-----------------------------------------
	-- Check for duplicate limit records
	-----------------------------------------
	UPDATE MIG_CA003_1 a set is_valid = 'N'
	where a.LIMIT_ID in (select t.LIMIT_ID
			     from MIG_CA003_1 t
			     group by limit_id
			     having count(*) > 1)
	and a.is_valid = 'Y';
	
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key2_value, error_code, error_msg)
	(select current_timestamp, 'SIBS', 'CA003_1', LIMIT_ID, 'DUP001', 
		'[M] Duplicate limit info found for Limit Id ['
		|| limit_id || '] - ' || trim(char(count(*))) || ' records found]'
	from MIG_CA003_1 where is_valid = 'N'
	group by limit_id
	having count(*) > 1);
	  
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_1', 'SIBS', 3);
	commit;

	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LE_MAIN_PROFILE
	-----------------------------------------
	
	UPDATE MIG_CA003_1 a SET is_valid = 'N'
	WHERE NOT EXISTS (SELECT '1' FROM sci_le_main_profile
			  WHERE lmp_le_id = a.CIF_ID
			  AND source_id = 'SIBS');
								
	commit;
	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', CIF_ID, LIMIT_ID, AA_NUMBER, FACILITY_CODE, trim(char(FACILITY_SEQ)), 'CNF001', 
		'[H] Failed to find customer info for CIF Id [' || CIF_ID ||'] from CU001 interface file'
	FROM MIG_CA003_1 
	WHERE is_valid = 'N'
	AND NOT EXISTS (SELECT '1' FROM sci_le_main_profile
			WHERE lmp_le_id = CIF_ID
			AND source_id = 'SIBS'));
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_1', 'SIBS', 5);
	commit;
		
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LSP_LMT_PROFILE
	-----------------------------------------
		
	--------------------------------
	-- Set limit profile id
	--------------------------------
	CALL RUNSTATS_HELPER('MIG_CA003_1', 'LOS_AA_NUMBER');
	CALL RUNSTATS_HELPER('SCI_LSP_LMT_PROFILE', 'LOS_BCA_REF_NUM, SOURCE_ID, CMS_LSP_LMT_PROFILE_ID');
	
	UPDATE MIG_CA003_1 a
	set cms_act_lmt_profile_id = (select llp.cms_lsp_lmt_profile_id
					from sci_lsp_lmt_profile llp
					--where llp.LOS_BCA_REF_NUM IS NOT NULL
					--AND 
					WHERE llp.LOS_BCA_REF_NUM = a.LOS_AA_NUMBER
					and llp.source_id = 'RLOS')
	WHERE EXISTS (select 1
			from sci_lsp_lmt_profile llp1
			--where llp1.LOS_BCA_REF_NUM IS NOT NULL
			--AND 
			WHERE llp1.LOS_BCA_REF_NUM = a.LOS_AA_NUMBER
			and llp1.source_id = 'RLOS');
									
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_1', 'SIBS', 6);
	commit;
									
	
	update MIG_CA003_1 a set is_valid = 'N'
	where cms_act_lmt_profile_id is null;
	
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', CIF_ID, LIMIT_ID, AA_NUMBER, FACILITY_CODE, trim(char(FACILITY_SEQ)), 'ANF001', 
		'[H] Failed to find AA info for AA Number [' || aa_number || '] from CA001 interface file'
	FROM MIG_CA003_1 a
	WHERE is_valid = 'N'
	and cms_act_lmt_profile_id is null
	and NOT EXISTS (select 1
			from sci_lsp_lmt_profile llp1
			WHERE llp1.LOS_BCA_REF_NUM = a.LOS_AA_NUMBER
			and llp1.source_id = 'RLOS'));								
							
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_1', 'SIBS', 7);
	commit;

	-----------------------------------------------------
	-- Check for non-existence common code
	-----------------------------------------------------
	UPDATE MIG_CA003_1 a set is_valid = 'N'
	where ( 
	      (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ORG_LOC_ORG_CAT and entry_code = ORG_LOC_ORG_CODE fetch first row only)) 
	      -- OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PRODUCT_TYPE_CAT and entry_code = PRODUCT_TYPE_CODE fetch first row only))  	//Remarked to skip checking
	      OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = FACILITY_TYPE_CAT and entry_code = FACILITY_CODE fetch first row only)) 
	      --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOAN_PURPOSE_CODE_NUM and entry_code = LOAN_PURPOSE_CODE_VALUE fetch first row only)) 
	      --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PERSON_APPROVED_CODE_NUM and entry_code = PERSON_APPROVED_CODE_VALUE fetch first row only)) 
	      --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CAR_CODE_NUM and entry_code = CAR_CODE_VALUE fetch first row only))  -- template states to migrate all the values in SIBS
	      --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LMT_STATUS_CODE_NUM and entry_code = LMT_STATUS_CODE_VALUE fetch first row only)) 
	      OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = FAC_STATUS_CODE_NUM and entry_code = FAC_STATUS_CODE_VALUE fetch first row only)) 
	      --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = DEPARTMENT_CODE_NUM and entry_code = DEPARTMENT_CODE_VALUE fetch first row only)) 
	      --OR (length(OFFICER_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = OFFICER_CODE_NUM and entry_code = OFFICER_CODE_VALUE fetch first row only)))  -- too much failure from SIBS
	      --OR (length(APPL_SRC_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = APPL_SRC_CODE_NUM and entry_code = APPL_SRC_CODE_VALUE fetch first row only))) 
	      OR (length(INTEREST_TYPE_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = INTEREST_TYPE_CODE_NUM and entry_code = INTEREST_TYPE_CODE_VALUE fetch first row only))) 
	      --OR (length(DEALER_NUM_LPP_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = DEALER_NUM_LPP_CODE_NUM and entry_code = DEALER_NUM_LPP_CODE_VALUE fetch first row only))) -- too much failure from SIBS
	      OR (length(COMMISSION_BASIS_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COMMISSION_BASIS_CODE_NUM and entry_code = COMMISSION_BASIS_CODE_VALUE fetch first row only))) 
	      OR (length(COMTMT_RATE_NUM_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COMTMT_RATE_NUM_CODE_NUM and entry_code = COMTMT_RATE_NUM_CODE_VALUE fetch first row only))) 
	      --OR (length(LAWYER_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LAWYER_CODE_NUM and entry_code = LAWYER_CODE_VALUE fetch first row only))) 
	      -- OR (length(PROD_PACKAGE_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PROD_PACKAGE_CODE_NUM and entry_code = PROD_PACKAGE_CODE_VALUE fetch first row only))) 
	      --OR (length(REFINANCE_FROM_BANK_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = REFINANCE_FROM_BANK_CODE_NUM and entry_code = REFINANCE_FROM_BANK_CODE_VALUE fetch first row only))) 
	      OR (length(LIMIT_TENOR_UOM) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LMT_TENOR_BASIS_NUM and entry_code = LIMIT_TENOR_UOM fetch first row only))) 
	      OR (length(PRIME_REVIEW_TERM_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PRIME_REVIEW_TERM_CODE_NUM and entry_code = PRIME_REVIEW_TERM_CODE_VALUE fetch first row only))) 
	      ) 
	and a.is_valid = 'Y';
	
	commit;
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', CIF_ID, LIMIT_ID, AA_NUMBER, FACILITY_CODE, trim(char(FACILITY_SEQ)), 'COM001',
		'[M] Non Existence Common Code: ' 
		|| GET_INVALID_COMMON_CODE_MSG('ORG_LOC_ORG_CODE', ORG_LOC_ORG_CODE, ORG_LOC_ORG_CAT)
		-- || GET_INVALID_COMMON_CODE_MSG('PRODUCT_TYPE_CODE', PRODUCT_TYPE_CODE, PRODUCT_TYPE_CAT) 	//Remarked to skip checking
		|| GET_INVALID_COMMON_CODE_MSG('FACILITY_CODE', FACILITY_CODE, FACILITY_TYPE_CAT)
		--|| GET_INVALID_COMMON_CODE_MSG('LOAN_PURPOSE_CODE_VALUE', LOAN_PURPOSE_CODE_VALUE, LOAN_PURPOSE_CODE_NUM)
		--|| GET_INVALID_COMMON_CODE_MSG('PERSON_APPROVED_CODE_VALUE', PERSON_APPROVED_CODE_VALUE, PERSON_APPROVED_CODE_NUM)
		--|| GET_INVALID_COMMON_CODE_MSG('CAR_CODE_VALUE', CAR_CODE_VALUE, CAR_CODE_NUM)
		--|| GET_INVALID_COMMON_CODE_MSG('LMT_STATUS_CODE_VALUE', LMT_STATUS_CODE_VALUE, LMT_STATUS_CODE_NUM)
		|| GET_INVALID_COMMON_CODE_MSG('FAC_STATUS_CODE_VALUE', FAC_STATUS_CODE_VALUE, FAC_STATUS_CODE_NUM)
		--|| GET_INVALID_COMMON_CODE_MSG('DEPARTMENT_CODE_VALUE', DEPARTMENT_CODE_VALUE, DEPARTMENT_CODE_NUM)
		--|| (CASE WHEN length(OFFICER_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('OFFICER_CODE_VALUE', OFFICER_CODE_VALUE, OFFICER_CODE_NUM) ELSE '' END)
		--|| (CASE WHEN length(APPL_SRC_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('APPL_SRC_CODE_VALUE', APPL_SRC_CODE_VALUE, APPL_SRC_CODE_NUM) ELSE '' END)
		|| (CASE WHEN length(INTEREST_TYPE_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('INTEREST_TYPE_CODE_VALUE', INTEREST_TYPE_CODE_VALUE, INTEREST_TYPE_CODE_NUM) ELSE '' END)
		--|| (CASE WHEN length(DEALER_NUM_LPP_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('DEALER_NUM_LPP_CODE_VALUE', DEALER_NUM_LPP_CODE_VALUE, DEALER_NUM_LPP_CODE_NUM) ELSE '' END)
		|| (CASE WHEN length(COMMISSION_BASIS_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('COMMISSION_BASIS_CODE_VALUE', COMMISSION_BASIS_CODE_VALUE, COMMISSION_BASIS_CODE_NUM) ELSE '' END)
		|| (CASE WHEN length(COMTMT_RATE_NUM_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('COMTMT_RATE_NUM_CODE_VALUE', COMTMT_RATE_NUM_CODE_VALUE, COMTMT_RATE_NUM_CODE_NUM) ELSE '' END)
		--|| (CASE WHEN length(LAWYER_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('LAWYER_CODE_VALUE', LAWYER_CODE_VALUE, LAWYER_CODE_NUM) ELSE '' END)
		-- || (CASE WHEN length(PROD_PACKAGE_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('PROD_PACKAGE_CODE_VALUE', PROD_PACKAGE_CODE_VALUE, PROD_PACKAGE_CODE_NUM) ELSE '' END)
		--|| (CASE WHEN length(REFINANCE_FROM_BANK_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('REFINANCE_FROM_BANK_CODE_VALUE', REFINANCE_FROM_BANK_CODE_VALUE, REFINANCE_FROM_BANK_CODE_NUM) ELSE '' END)
		|| (CASE WHEN length(LIMIT_TENOR_UOM) > 0 THEN GET_INVALID_COMMON_CODE_MSG('LIMIT_TENOR_UOM', LIMIT_TENOR_UOM, LMT_TENOR_BASIS_NUM) ELSE '' END)
		|| (CASE WHEN length(PRIME_REVIEW_TERM_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('PRIME_REVIEW_TERM_CODE_VALUE', PRIME_REVIEW_TERM_CODE_VALUE, PRIME_REVIEW_TERM_CODE_NUM) ELSE '' END)
	FROM MIG_CA003_1
       	WHERE ( 
	      (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ORG_LOC_ORG_CAT and entry_code = ORG_LOC_ORG_CODE fetch first row only)) 
	      -- OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PRODUCT_TYPE_CAT and entry_code = PRODUCT_TYPE_CODE fetch first row only))  	//Remarked to skip checking
	      OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = FACILITY_TYPE_CAT and entry_code = FACILITY_CODE fetch first row only)) 
	      --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOAN_PURPOSE_CODE_NUM and entry_code = LOAN_PURPOSE_CODE_VALUE fetch first row only)) 
	      --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PERSON_APPROVED_CODE_NUM and entry_code = PERSON_APPROVED_CODE_VALUE fetch first row only)) 
	      --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CAR_CODE_NUM and entry_code = CAR_CODE_VALUE fetch first row only)) 
	      --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LMT_STATUS_CODE_NUM and entry_code = LMT_STATUS_CODE_VALUE fetch first row only)) 
	      OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = FAC_STATUS_CODE_NUM and entry_code = FAC_STATUS_CODE_VALUE fetch first row only)) 
	      --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = DEPARTMENT_CODE_NUM and entry_code = DEPARTMENT_CODE_VALUE fetch first row only)) 
	      --OR (length(OFFICER_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = OFFICER_CODE_NUM and entry_code = OFFICER_CODE_VALUE fetch first row only))) 
	      --OR (length(APPL_SRC_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = APPL_SRC_CODE_NUM and entry_code = APPL_SRC_CODE_VALUE fetch first row only))) 
	      OR (length(INTEREST_TYPE_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = INTEREST_TYPE_CODE_NUM and entry_code = INTEREST_TYPE_CODE_VALUE fetch first row only))) 
	      --OR (length(DEALER_NUM_LPP_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = DEALER_NUM_LPP_CODE_NUM and entry_code = DEALER_NUM_LPP_CODE_VALUE fetch first row only))) 
	      OR (length(COMMISSION_BASIS_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COMMISSION_BASIS_CODE_NUM and entry_code = COMMISSION_BASIS_CODE_VALUE fetch first row only))) 
	      OR (length(COMTMT_RATE_NUM_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COMTMT_RATE_NUM_CODE_NUM and entry_code = COMTMT_RATE_NUM_CODE_VALUE fetch first row only))) 
	      --OR (length(LAWYER_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LAWYER_CODE_NUM and entry_code = LAWYER_CODE_VALUE fetch first row only))) 
	      -- OR (length(PROD_PACKAGE_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PROD_PACKAGE_CODE_NUM and entry_code = PROD_PACKAGE_CODE_VALUE fetch first row only))) 
	      --OR (length(REFINANCE_FROM_BANK_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = REFINANCE_FROM_BANK_CODE_NUM and entry_code = REFINANCE_FROM_BANK_CODE_VALUE fetch first row only))) 
	      OR (length(LIMIT_TENOR_UOM) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LMT_TENOR_BASIS_NUM and entry_code = LIMIT_TENOR_UOM fetch first row only))) 
	      OR (length(PRIME_REVIEW_TERM_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PRIME_REVIEW_TERM_CODE_NUM and entry_code = PRIME_REVIEW_TERM_CODE_VALUE fetch first row only))) 
	      ));
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_1', 'SIBS', 8);
	commit;

	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------
	UPDATE MIG_CA003_1 a set is_valid = 'N'
	where ( 
			(INTEREST_RATE < 0 or INTEREST_RATE > 100)
		 OR (length(SPREAD) > 0 and (SPREAD < 0 or SPREAD > 100))
		 OR (length(PRIME_RATE_FLOOR) > 0 and (PRIME_RATE_FLOOR < 0 or PRIME_RATE_FLOOR > 100))
		 OR (length(PRIME_RATE_CEILING) > 0 and (PRIME_RATE_CEILING < 0 or PRIME_RATE_CEILING > 100))
		 OR (length(OD_EXCESS_RATE_VAR) > 0 and (OD_EXCESS_RATE_VAR < 0 or OD_EXCESS_RATE_VAR > 100))
		 OR (length(COMMISSION_RATE) > 0 and (COMMISSION_RATE < 0 or COMMISSION_RATE > 100))
		 OR (length(COMMITMENT_RATE) > 0 and (COMMITMENT_RATE < 0 or COMMITMENT_RATE > 100))
		 OR (REVOLVING_IND not in ('N', 'R'))
	) 
	and a.is_valid = 'Y';
      
	commit;
	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_1', CIF_ID, LIMIT_ID, AA_NUMBER, FACILITY_CODE, trim(char(FACILITY_SEQ)), 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| (CASE WHEN (INTEREST_RATE < 0 or INTEREST_RATE > 100) THEN GET_INVALID_VALUE_MSG('INTEREST_RATE', CHAR(INTEREST_RATE), '0-100') ELSE '' END)
			|| (CASE WHEN (length(SPREAD) > 0 and (SPREAD < 0 or SPREAD > 100)) THEN GET_INVALID_VALUE_MSG('SPREAD', CHAR(SPREAD), '0-100') ELSE '' END)
			|| (CASE WHEN (length(PRIME_RATE_FLOOR) > 0 and (PRIME_RATE_FLOOR < 0 or PRIME_RATE_FLOOR > 100)) THEN GET_INVALID_VALUE_MSG('PRIME_RATE_FLOOR', CHAR(PRIME_RATE_FLOOR), '0-100') ELSE '' END)
			|| (CASE WHEN (length(PRIME_RATE_CEILING) > 0 and (PRIME_RATE_CEILING < 0 or PRIME_RATE_CEILING > 100)) THEN GET_INVALID_VALUE_MSG('PRIME_RATE_CEILING', CHAR(PRIME_RATE_CEILING), '0-100') ELSE '' END)
			|| (CASE WHEN (length(OD_EXCESS_RATE_VAR) > 0 and (OD_EXCESS_RATE_VAR < 0 or OD_EXCESS_RATE_VAR > 100)) THEN GET_INVALID_VALUE_MSG('OD_EXCESS_RATE_VAR', CHAR(OD_EXCESS_RATE_VAR), '0-100') ELSE '' END)
			|| (CASE WHEN (length(COMMISSION_RATE) > 0 and (COMMISSION_RATE < 0 or COMMISSION_RATE > 100)) THEN GET_INVALID_VALUE_MSG('COMMISSION_RATE', CHAR(COMMISSION_RATE), '0-100') ELSE '' END)
			|| (CASE WHEN (length(COMMITMENT_RATE) > 0 and (COMMITMENT_RATE < 0 or COMMITMENT_RATE > 100)) THEN GET_INVALID_VALUE_MSG('COMMITMENT_RATE', CHAR(COMMITMENT_RATE), '0-100') ELSE '' END)
			|| (CASE WHEN (REVOLVING_IND not in ('N', 'R')) THEN GET_INVALID_VALUE_MSG('REVOLVING_IND', REVOLVING_IND, 'N/R') ELSE '' END)
	FROM MIG_CA003_1
      	WHERE ( 
                (INTEREST_RATE < 0 or INTEREST_RATE > 100)      
             OR (length(SPREAD) > 0 and (SPREAD < 0 or SPREAD > 100))
             OR (length(PRIME_RATE_FLOOR) > 0 and (PRIME_RATE_FLOOR < 0 or PRIME_RATE_FLOOR > 100))
             OR (length(PRIME_RATE_CEILING) > 0 and (PRIME_RATE_CEILING < 0 or PRIME_RATE_CEILING > 100))
             OR (length(OD_EXCESS_RATE_VAR) > 0 and (OD_EXCESS_RATE_VAR < 0 or OD_EXCESS_RATE_VAR > 100))
             OR (length(COMMISSION_RATE) > 0 and (COMMISSION_RATE < 0 or COMMISSION_RATE > 100))
             OR (length(COMMITMENT_RATE) > 0 and (COMMITMENT_RATE < 0 or COMMITMENT_RATE > 100))
             OR (REVOLVING_IND not in ('N', 'R'))
      	));
    
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_1', 'SIBS', 0);
END@


CREATE PROCEDURE MIG_VALIDATE_CA003_2_BNM
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_2', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CA003_2_BNM a SET is_valid = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(LMT_ID)=0
			OR length(LLP_BCA_REF_NUM)=0
			OR length(LMT_FAC_CODE)=0
			OR length(LMT_FAC_SEQ)=0
			OR length(INDUSTRY_CODE_VALUE)=0
			OR length(SECTOR_CODE_VALUE)=0
			OR length(STATE_CODE_VALUE)=0
			OR length(BUMI_NRCC_CODE_VALUE)=0
			OR length(SMALL_SCALE_CODE_VALUE)=0
			OR length(RELATIONSHIP_CODE_VALUE)=0
			OR length(EXEMPTED_CODE_IND)=0
			OR (EXEMPTED_CODE_IND='Y' and length(EXEMPTED_CODE_VALUE)=0);
			--OR length(PURPOSE_CODE_VALUE)=0;
			
	commit;
			
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_2', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'MAN001',
			'[L] Mandatory Field(s): ' 
			|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| BVL(LMT_ID, ' [LMT_ID] ')
			|| BVL(LLP_BCA_REF_NUM, ' [AA_NUMBER] ')
			|| BVL(LMT_FAC_CODE, ' [LMT_FAC_CODE] ')
			|| BVL(char(LMT_FAC_SEQ), ' [LMT_FAC_SEQ] ')
			|| BVL(INDUSTRY_CODE_VALUE, ' [INDUSTRY_CODE_VALUE] ')
			|| BVL(SECTOR_CODE_VALUE, ' [SECTOR_CODE_VALUE] ')
			|| BVL(STATE_CODE_VALUE, ' [STATE_CODE_VALUE] ')
			|| BVL(BUMI_NRCC_CODE_VALUE, ' [BUMI_NRCC_CODE_VALUE] ')
			|| BVL(SMALL_SCALE_CODE_VALUE, ' [SMALL_SCALE_CODE_VALUE] ')
			|| BVL(RELATIONSHIP_CODE_VALUE, ' [RELATIONSHIP_CODE_VALUE] ')
			|| BVL(EXEMPTED_CODE_IND, ' [EXEMPTED_CODE_IND] ')
			||(CASE WHEN EXEMPTED_CODE_IND='Y' THEN BVL(EXEMPTED_CODE_VALUE, ' [EXEMPTED_CODE_VALUE] ') ELSE '' END)
			--|| BVL(PURPOSE_CODE_VALUE, ' [PURPOSE_CODE_VALUE] ')
			|| ' is/are empty.'
	FROM MIG_CA003_2_BNM
	WHERE is_valid = 'N'
	AND (length(RECORD_TYPE)=0
		OR length(LMT_ID)=0
		OR length(LLP_BCA_REF_NUM)=0
		OR length(LMT_FAC_CODE)=0
		OR length(LMT_FAC_SEQ)=0
		OR length(INDUSTRY_CODE_VALUE)=0
		OR length(SECTOR_CODE_VALUE)=0
		OR length(STATE_CODE_VALUE)=0
		OR length(BUMI_NRCC_CODE_VALUE)=0
		OR length(SMALL_SCALE_CODE_VALUE)=0
		OR length(RELATIONSHIP_CODE_VALUE)=0
		OR length(EXEMPTED_CODE_IND)=0
		OR (EXEMPTED_CODE_IND='Y' and length(EXEMPTED_CODE_VALUE)=0)));
	  
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_2', 'SIBS', 2);
	commit;
	
	---------------------------------
	-- Check for duplicate records
	---------------------------------
  	UPDATE MIG_CA003_2_BNM a set is_valid = 'N'
  	where a.LMT_ID in 
    	(select LMT_ID
  		from MIG_CA003_2_BNM t
		group by LMT_ID
		having count(*) > 1)
	and a.is_valid = 'Y';	
	
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_2',  LMT_ID, 'DUP001', 
		'[M] Duplicate records found for Limit ID [' || LMT_ID || '] - ' || trim(char(count(*))) || ' records found]' 
  	from MIG_CA003_2_BNM a
	where is_valid = 'N'
	group by LMT_ID
    	having count(*) > 1);		
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_2', 'SIBS', 3);		
	commit;

	--------------------------------
	-- Set facility master id
	--------------------------------
	CALL RUNSTATS_HELPER('MIG_CA003_2_BNM', 'LMT_ID');
	
-- 	LOCK TABLE MIG_CA003_2_BNM IN SHARE MODE;
-- 	UPDATE MIG_CA003_2_BNM A
-- 	SET (CMS_ACT_FAC_MASTER_ID, CMS_ACT_LIMIT_ID) = (SELECT FAC.ID, FAC.CMS_LSP_APPR_LMTS_ID
-- 				     FROM SCI_LSP_APPR_LMTS LMT, CMS_FACILITY_MASTER FAC
-- 				     WHERE A.LMT_ID = LMT.LMT_ID
-- 				     --AND A.LLP_BCA_REF_NUM = LMT.LMT_BCA_REF_NUM
-- 				     --AND A.LMT_FAC_CODE = LMT.LMT_FAC_CODE
-- 				     --AND A.LMT_FAC_SEQ = LMT.LMT_FAC_SEQ
-- 				     AND LMT.CMS_LSP_APPR_LMTS_ID = FAC.CMS_LSP_APPR_LMTS_ID 
-- 				     AND LMT.SOURCE_ID = 'RLOS');
-- 									
				     
	update MIG_CA003_2_BNM a
	set CMS_ACT_LIMIT_ID = (select lmts.cms_lsp_appr_lmts_id
		from sci_lsp_appr_lmts lmts
		where lmts.lmt_id = a.lmt_id
		and lmts.source_id = 'RLOS')
	where is_valid = 'Y';
	commit;
	
	update MIG_CA003_2_BNM a
	set CMS_ACT_FAC_MASTER_ID = (select fac.id
		from cms_facility_master fac
		where fac.cms_lsp_appr_lmts_id = a.cms_act_limit_id)
	where is_valid = 'Y';
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_2', 'SIBS', 4);
	commit;
									
	
	UPDATE MIG_CA003_2_BNM SET IS_VALID = 'N'
	WHERE CMS_ACT_FAC_MASTER_ID IS NULL;
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_2', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'LNF001', 
		'[H] Failed to find Facility info for AA Number [' || LLP_BCA_REF_NUM 
		|| '] Limit ID [' || LMT_ID
		|| '] Facility Code [' || LMT_FAC_CODE
		|| '] Facility Seq No [' || trim(char(LMT_FAC_SEQ)) 
		|| '] from CA003.1 Facility Master interface file'
	FROM MIG_CA003_2_BNM A
	WHERE is_valid = 'N'
	and CMS_ACT_FAC_MASTER_ID is null
-- 	and NOT EXISTS (SELECT 1
-- 			FROM SCI_LSP_APPR_LMTS LMT, CMS_FACILITY_MASTER FAC
-- 			WHERE A.LMT_ID = LMT.LMT_ID
-- 			AND LMT.CMS_LSP_APPR_LMTS_ID = FAC.CMS_LSP_APPR_LMTS_ID 
-- 			AND LMT.SOURCE_ID = 'RLOS')
			);								
							
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_2', 'SIBS', 5);
	commit;

    -----------------------------------------------------
    -- Check for non-existence common code
    -----------------------------------------------------
    UPDATE MIG_CA003_2_BNM a set is_valid = 'N'
    where ( 
        (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = INDUSTRY_CODE_NUM and entry_code = INDUSTRY_CODE_VALUE  )) 
     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SECTOR_CODE_NUM and entry_code = SECTOR_CODE_VALUE )) 
     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = STATE_CODE_NUM and entry_code = STATE_CODE_VALUE )) 
     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = BUMI_NRCC_CODE_NUM and entry_code = BUMI_NRCC_CODE_VALUE )) 
     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SMALL_SCALE_CODE_NUM and entry_code = SMALL_SCALE_CODE_VALUE )) 
     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = RELATIONSHIP_CODE_NUM and entry_code = RELATIONSHIP_CODE_VALUE )) 
     --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PURPOSE_CODE_NUM and entry_code = PURPOSE_CODE_VALUE )) 
     OR (length(PRESCRIBED_RATE_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PRESCRIBED_RATE_CODE_NUM and entry_code = PRESCRIBED_RATE_CODE_VALUE ))) 
     OR (length(GOODS_FINANCED_ONE_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GOODS_FINANCED_ONE_CODE_NUM and entry_code = GOODS_FINANCED_ONE_CODE_VALUE ))) 
     OR (length(GOODS_FINANCED_TWO_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GOODS_FINANCED_TWO_CODE_NUM and entry_code = GOODS_FINANCED_TWO_CODE_VALUE ))) 
     --OR (length(EXEMPTED_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = EXEMPTED_CODE_NUM and entry_code = EXEMPTED_CODE_VALUE ))) 
    ) 
    and a.is_valid = 'Y';
	
	commit;
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_2',  LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'COM001', 
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('INDUSTRY_CODE_VALUE', INDUSTRY_CODE_VALUE, INDUSTRY_CODE_NUM)
			|| GET_INVALID_COMMON_CODE_MSG('SECTOR_CODE_VALUE', SECTOR_CODE_VALUE, SECTOR_CODE_NUM)
			|| GET_INVALID_COMMON_CODE_MSG('STATE_CODE_VALUE', STATE_CODE_VALUE, STATE_CODE_NUM)
			|| GET_INVALID_COMMON_CODE_MSG('BUMI_NRCC_CODE_VALUE', BUMI_NRCC_CODE_VALUE, BUMI_NRCC_CODE_NUM)
			|| GET_INVALID_COMMON_CODE_MSG('SMALL_SCALE_CODE_VALUE', SMALL_SCALE_CODE_VALUE, SMALL_SCALE_CODE_NUM)
			|| GET_INVALID_COMMON_CODE_MSG('RELATIONSHIP_CODE_VALUE', RELATIONSHIP_CODE_VALUE, RELATIONSHIP_CODE_NUM)
			--|| GET_INVALID_COMMON_CODE_MSG('PURPOSE_CODE_VALUE', PURPOSE_CODE_VALUE, PURPOSE_CODE_NUM)
			|| (CASE WHEN length(PRESCRIBED_RATE_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('PRESCRIBED_RATE_CODE_VALUE', PRESCRIBED_RATE_CODE_VALUE, PRESCRIBED_RATE_CODE_NUM) ELSE '' END)
			|| (CASE WHEN length(GOODS_FINANCED_ONE_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('GOODS_FINANCED_ONE_CODE_VALUE', GOODS_FINANCED_ONE_CODE_VALUE, GOODS_FINANCED_ONE_CODE_NUM) ELSE '' END)
			|| (CASE WHEN length(GOODS_FINANCED_TWO_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('GOODS_FINANCED_TWO_CODE_VALUE', GOODS_FINANCED_TWO_CODE_VALUE, GOODS_FINANCED_TWO_CODE_NUM) ELSE '' END)
			--|| (CASE WHEN length(EXEMPTED_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('EXEMPTED_CODE_VALUE', EXEMPTED_CODE_VALUE, EXEMPTED_CODE_NUM) ELSE '' END)
	   FROM MIG_CA003_2_BNM
       WHERE ( 
	        (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = INDUSTRY_CODE_NUM and entry_code = INDUSTRY_CODE_VALUE  )) 
	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SECTOR_CODE_NUM and entry_code = SECTOR_CODE_VALUE )) 
	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = STATE_CODE_NUM and entry_code = STATE_CODE_VALUE )) 
	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = BUMI_NRCC_CODE_NUM and entry_code = BUMI_NRCC_CODE_VALUE )) 
	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SMALL_SCALE_CODE_NUM and entry_code = SMALL_SCALE_CODE_VALUE )) 
	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = RELATIONSHIP_CODE_NUM and entry_code = RELATIONSHIP_CODE_VALUE )) 
	     --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PURPOSE_CODE_NUM and entry_code = PURPOSE_CODE_VALUE )) 
	     OR (length(PRESCRIBED_RATE_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PRESCRIBED_RATE_CODE_NUM and entry_code = PRESCRIBED_RATE_CODE_VALUE ))) 
	     OR (length(GOODS_FINANCED_ONE_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GOODS_FINANCED_ONE_CODE_NUM and entry_code = GOODS_FINANCED_ONE_CODE_VALUE ))) 
	     OR (length(GOODS_FINANCED_TWO_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GOODS_FINANCED_TWO_CODE_NUM and entry_code = GOODS_FINANCED_TWO_CODE_VALUE ))) 
	     --OR (length(EXEMPTED_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = EXEMPTED_CODE_NUM and entry_code = EXEMPTED_CODE_VALUE ))) 
      ));
    
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_2', 'SIBS', 6);
	commit;
    

	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------
	UPDATE MIG_CA003_2_BNM a set is_valid = 'N'
	where EXEMPTED_CODE_IND not in ('Y', 'N')
        and a.is_valid = 'Y';

    commit;
	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_2', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| GET_INVALID_VALUE_MSG('EXEMPTED_CODE_IND', EXEMPTED_CODE_IND, 'Y/N')
	FROM MIG_CA003_2_BNM
        WHERE EXEMPTED_CODE_IND not in ('Y', 'N'));
      
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_2', 'SIBS', 0);
END
@

CREATE PROCEDURE MIG_VALIDATE_CA003_3_OFF
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_3', 'SIBS', 1);
	
	UPDATE MIG_CA003_3_OFF a SET is_valid = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(LMT_ID)=0
			OR length(LLP_BCA_REF_NUM)=0
			OR length(LMT_FAC_CODE)=0
			OR length(LMT_FAC_SEQ)=0
			OR length(SEQ_NUM)=0
			--OR length(RELATIONSHIP_CODE_VALUE)=0
			OR length(OFFICER_CODE_VALUE)=0;
			--OR length(OFFICER_TYPE_CODE_VALUE)=0;

	commit;
	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_3', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), trim(char(SEQ_NUM)), 'MAN001',
			'[L] Mandatory Field(s): ' 
			|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| BVL(LMT_ID, ' [LMT_ID] ')
			|| BVL(LLP_BCA_REF_NUM, ' [AA_NUMBER] ')
			|| BVL(LMT_FAC_CODE, ' [LMT_FAC_CODE] ')
			|| BVL(char(LMT_FAC_SEQ), ' [LMT_FAC_SEQ] ')
			|| BVL(char(SEQ_NUM), ' [SEQ_NUM] ')
			--|| BVL(RELATIONSHIP_CODE_VALUE, ' [RELATIONSHIP_CODE_VALUE] ')
			|| BVL(OFFICER_CODE_VALUE, ' [OFFICER_CODE_VALUE] ')
			--|| BVL(OFFICER_TYPE_CODE_VALUE, ' [OFFICER_TYPE_CODE_VALUE] ')
			|| ' is/are empty.'
	FROM MIG_CA003_3_OFF
	WHERE is_valid = 'N'
	AND (length(RECORD_TYPE)=0
		OR length(LMT_ID)=0
		OR length(LLP_BCA_REF_NUM)=0
		OR length(LMT_FAC_CODE)=0
		OR length(LMT_FAC_SEQ)=0
		OR length(SEQ_NUM)=0
		OR length(OFFICER_CODE_VALUE)=0));
	  
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_3', 'SIBS', 2);
	commit;
	
	---------------------------------
	-- Check for duplicate records
	---------------------------------
	CALL RUNSTATS_HELPER('MIG_CA003_3_OFF');
  	UPDATE MIG_CA003_3_OFF a set is_valid = 'N'
  	where (a.LMT_ID, SEQ_NUM) in 
    	(select LMT_ID, SEQ_NUM
  		from MIG_CA003_3_OFF t
		group by LMT_ID, SEQ_NUM
		having count(*) > 1)
	and a.is_valid = 'Y';	
	
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key5_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_3',  LMT_ID, trim(char(SEQ_NUM)), 'DUP001', 
		'[M] Duplicate records found for Limit ID [' || LMT_ID 
		|| '] Officer Seq No [' || trim(char(SEQ_NUM)) 
		|| '] - ' || trim(char(count(*))) || ' records found]' 
  	from MIG_CA003_3_OFF a
	where is_valid = 'N'
	group by LMT_ID, SEQ_NUM
    	having count(*) > 1);		
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_3', 'SIBS', 3);		
	commit;

	--------------------------------
	-- Set facility master id
	--------------------------------
	CALL RUNSTATS_HELPER('MIG_CA003_3_OFF');
	LOCK TABLE MIG_CA003_3_OFF IN SHARE MODE;
	UPDATE MIG_CA003_3_OFF A
	SET (CMS_ACT_FAC_MASTER_ID, CMS_ACT_LIMIT_ID) = (SELECT FAC.ID, FAC.CMS_LSP_APPR_LMTS_ID
				     FROM SCI_LSP_APPR_LMTS LMT, CMS_FACILITY_MASTER FAC
				     WHERE A.LMT_ID = LMT.LMT_ID
				     --AND A.LLP_BCA_REF_NUM = LMT.LMT_BCA_REF_NUM
				     --AND A.LMT_FAC_CODE = LMT.LMT_FAC_CODE
				     --AND A.LMT_FAC_SEQ = LMT.LMT_FAC_SEQ
				     AND LMT.CMS_LSP_APPR_LMTS_ID = FAC.CMS_LSP_APPR_LMTS_ID 
				     AND LMT.SOURCE_ID = 'RLOS');
									
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_3', 'SIBS', 4);
	commit;
									
	
	UPDATE MIG_CA003_3_OFF SET IS_VALID = 'N'
	WHERE CMS_ACT_FAC_MASTER_ID IS NULL;
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_3', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), trim(char(SEQ_NUM)), 'LNF001', 
		'[H] Failed to find Facility info for AA Number [' || LLP_BCA_REF_NUM 
		|| '] Limit ID [' || LMT_ID
		|| '] Facility Code [' || LMT_FAC_CODE
		|| '] Facility Seq No [' || trim(char(LMT_FAC_SEQ)) 
		|| '] from CA003.1 Facility Master interface file'
	FROM MIG_CA003_3_OFF A
	WHERE is_valid = 'N'
	and CMS_ACT_FAC_MASTER_ID is null
	and NOT EXISTS (SELECT 1
			FROM SCI_LSP_APPR_LMTS LMT, CMS_FACILITY_MASTER FAC
			WHERE A.LMT_ID = LMT.LMT_ID
			AND LMT.CMS_LSP_APPR_LMTS_ID = FAC.CMS_LSP_APPR_LMTS_ID 
			AND LMT.SOURCE_ID = 'RLOS'));								
							
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_3', 'SIBS', 5);
	commit;

    	-----------------------------------------------------
    	-- Check for non-existence common code
    	-----------------------------------------------------
    	UPDATE MIG_CA003_3_OFF a set is_valid = 'N'
    	where ( 
    	    (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = RELATIONSHIP_CODE_NUM and entry_code = RELATIONSHIP_CODE_VALUE  )) 
    	 --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = OFFICER_CODE_NUM and entry_code = OFFICER_CODE_VALUE ))   -- CZ: waived due to too many errors
    	 -- OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = OFFICER_TYPE_CODE_NUM and entry_code = OFFICER_TYPE_CODE_VALUE ))  	//Remarked to skip checking
    	) 
    	and a.is_valid = 'Y';
	commit;
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_3',  LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), trim(char(SEQ_NUM)), 'COM001', 
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('RELATIONSHIP_CODE_VALUE', RELATIONSHIP_CODE_VALUE, RELATIONSHIP_CODE_NUM)
			--|| GET_INVALID_COMMON_CODE_MSG('OFFICER_CODE_VALUE', OFFICER_CODE_VALUE, OFFICER_CODE_NUM)
			--|| GET_INVALID_COMMON_CODE_MSG('OFFICER_TYPE_CODE_VALUE', OFFICER_TYPE_CODE_VALUE, OFFICER_TYPE_CODE_NUM)
	FROM MIG_CA003_3_OFF
       	WHERE ( 
    	    (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = RELATIONSHIP_CODE_NUM and entry_code = RELATIONSHIP_CODE_VALUE  )) 
    	 --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = OFFICER_CODE_NUM and entry_code = OFFICER_CODE_VALUE )) 
    	 -- OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = OFFICER_TYPE_CODE_NUM and entry_code = OFFICER_TYPE_CODE_VALUE ))  	//Remarked to skip checking
      	));
     
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_3', 'SIBS', 0);
END
@


CREATE PROCEDURE MIG_VALIDATE_CA003_4_REL
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_4_REL', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CA003_4_REL a SET is_valid = 'N'
	WHERE length(LMT_ID)=0
			OR length(LLP_BCA_REF_NUM)=0
			OR length(LMT_FAC_CODE)=0
			OR length(LMT_FAC_SEQ)=0
			OR length(CIF_NUMBER)=0
			OR length(ACCT_RELATIONSHIP_CODE_VALUE)=0
			OR (length(GUARANTEE_AMOUNT)=0 AND length(GUARANTEE_PERCENTAGE)=0)
			OR length(HOST_ADD_SEQ_NUM)=0
			OR length(CUSTOMER_NAME)=0;
			
	commit;

	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_4', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), CIF_NUMBER, 'MAN001',
			'[L] Mandatory Field(s): ' 
			|| BVL(LMT_ID, ' [LMT_ID] ')
			|| BVL(LLP_BCA_REF_NUM, ' [AA_NUMBER] ')
			|| BVL(LMT_FAC_CODE, ' [LMT_FAC_CODE] ')
			|| NVL2(char(LMT_FAC_SEQ), '', ' [LMT_FAC_SEQ] ')
			|| BVL(CIF_NUMBER, ' [CIF_NUMBER] ')
			|| BVL(ACCT_RELATIONSHIP_CODE_VALUE, ' [ACCT_RELATIONSHIP_CODE_VALUE] ')
			|| (CASE WHEN length(GUARANTEE_AMOUNT)=0 and length(GUARANTEE_PERCENTAGE)=0 THEN NVL2(char(GUARANTEE_AMOUNT), '', ' [GUARANTEE_AMOUNT] ') ELSE '' END)	
			|| (CASE WHEN length(GUARANTEE_AMOUNT)=0 and length(GUARANTEE_PERCENTAGE)=0 THEN NVL2(char(GUARANTEE_PERCENTAGE), '', ' [GUARANTEE_PERCENTAGE] ') ELSE '' END)	
			|| NVL2(char(HOST_ADD_SEQ_NUM), '', ' [HOST_ADD_SEQ_NUM] ')
			|| BVL(CUSTOMER_NAME, ' [CUSTOMER_NAME] ')
			|| ' is/are empty.'
	FROM MIG_CA003_4_REL
	WHERE is_valid = 'N'
	AND (length(LMT_ID)=0
		OR length(LLP_BCA_REF_NUM)=0
		OR length(LMT_FAC_CODE)=0
		OR length(LMT_FAC_SEQ)=0
		OR length(CIF_NUMBER)=0
		OR length(ACCT_RELATIONSHIP_CODE_VALUE)=0
		OR (length(GUARANTEE_AMOUNT)=0 AND length(GUARANTEE_PERCENTAGE)=0)
		OR length(HOST_ADD_SEQ_NUM)=0
		OR length(CUSTOMER_NAME)=0));
	  
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_4_REL', 'SIBS', 2);
	commit;
	
	---------------------------------
	-- Check for duplicate records
	---------------------------------
	CALL RUNSTATS_HELPER('MIG_CA003_4_REL');
  	UPDATE MIG_CA003_4_REL a set is_valid = 'N'
  	where (a.LMT_ID, CIF_NUMBER) in 
    	(select LMT_ID, CIF_NUMBER
  		from MIG_CA003_4_REL t
		group by LMT_ID, CIF_NUMBER
		having count(*) > 1);
	--and a.is_valid = 'Y';	
	
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key5_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_4',  LMT_ID, CIF_NUMBER, 'DUP001', 
		'[M] Duplicate records found for Limit ID [' || LMT_ID 
		|| '] Cif No [' || CIF_NUMBER 
		|| '] - ' || trim(char(count(*))) || ' records found]' 
  	from MIG_CA003_4_REL a
	where is_valid = 'N'
	group by LMT_ID, CIF_NUMBER
    	having count(*) > 1);		
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_4_REL', 'SIBS', 3);		
	commit;

	--------------------------------
	-- Set CMS_LE_MAIN_PROFILE_ID -- for migrating purpose only
	--------------------------------
	CALL RUNSTATS_HELPER('MIG_CA003_4_REL');
	UPDATE MIG_CA003_4_REL A
	SET CMS_LE_MAIN_PROFILE_ID = (SELECT CMS_LE_MAIN_PROFILE_ID 
                                    FROM SCI_LE_MAIN_PROFILE CUS
                                    WHERE A.CIF_NUMBER = CUS.LMP_LE_ID
                                    and source_id = 'SIBS'
                                    FETCH FIRST 1 ROW ONLY)
        WHERE length(A.CIF_NUMBER) > 0 
    	AND EXISTS (SELECT 1 
                  FROM SCI_LE_MAIN_PROFILE CUS1
                  WHERE A.CIF_NUMBER = CUS1.LMP_LE_ID
                  and source_id = 'SIBS'
                  FETCH FIRST 1 ROW ONLY);
                                    
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_4_REL', 'SIBS', 4);
	commit;
    
    
	--------------------------------
	-- Set facility master id
	--------------------------------
	CALL RUNSTATS_HELPER('MIG_CA003_4_REL');
	LOCK TABLE MIG_CA003_4_REL IN SHARE MODE;
-- 	UPDATE MIG_CA003_4_REL A
-- 	SET (CMS_ACT_FAC_MASTER_ID, CMS_ACT_LIMIT_ID, CURRENCY_CODE) = (SELECT FAC.ID, FAC.CMS_LSP_APPR_LMTS_ID, LMT_CRRNCY_ISO_CODE
-- 				      FROM SCI_LSP_APPR_LMTS LMT, CMS_FACILITY_MASTER FAC
-- 				      WHERE A.LMT_ID = LMT.LMT_ID
-- 				     -- --AND A.LLP_BCA_REF_NUM = LMT.LMT_BCA_REF_NUM
-- 				     -- --AND A.LMT_FAC_CODE = LMT.LMT_FAC_CODE
-- 				     -- --AND A.LMT_FAC_SEQ = LMT.LMT_FAC_SEQ
-- 				      AND LMT.CMS_LSP_APPR_LMTS_ID = FAC.CMS_LSP_APPR_LMTS_ID 
-- 				      AND LMT.SOURCE_ID = 'RLOS');

	update MIG_CA003_4_REL a
	set (cms_act_limit_id, currency_code) =
		(select cms_lsp_appr_lmts_id, LMT_CRRNCY_ISO_CODE
		from sci_lsp_appr_lmts lmts
		where a.lmt_id = lmts.lmt_id
		and lmts.source_id = 'RLOS')
	where is_valid = 'Y';
	
	commit;
	
	update MIG_CA003_4_REL a
	set cms_act_fac_master_id = (select fac.id
		from cms_facility_master fac
		where fac.cms_lsp_appr_lmts_id = a.cms_act_limit_id)
	where is_valid = 'Y';
	
--	UPDATE MIG_CA003_4_REL A
--	SET CMS_ACT_FAC_MASTER_ID = (SELECT FAC.CMS_ACT_FAC_MASTER_ID
--				     FROM MIG_CA003_1 FAC
--				     WHERE A.LMT_ID = FAC.LIMIT_ID
--				     AND FAC.IS_VALID = 'Y')
--   WHERE IS_VALID = 'Y';
                     
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_4_REL', 'SIBS', 5);
	commit;
									                                    
	UPDATE MIG_CA003_4_REL SET IS_VALID = 'N'
	WHERE CMS_ACT_FAC_MASTER_ID IS NULL
	and is_valid = 'Y';
	
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_4', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), CIF_NUMBER, 'LNF001', 
		'[H] Failed to find Facility info for AA Number [' || LLP_BCA_REF_NUM 
		|| '] Limit ID [' || LMT_ID
		|| '] Facility Code [' || LMT_FAC_CODE
		|| '] Facility Seq No [' || trim(char(LMT_FAC_SEQ)) 
		|| '] from CA003.1 Facility Master interface file'
	FROM MIG_CA003_4_REL A
	WHERE is_valid = 'N'
	and CMS_ACT_FAC_MASTER_ID is null);
-- 	and NOT EXISTS (SELECT 1
-- 			FROM SCI_LSP_APPR_LMTS LMT, CMS_FACILITY_MASTER FAC
-- 			WHERE A.LMT_ID = LMT.LMT_ID
-- 			AND LMT.CMS_LSP_APPR_LMTS_ID = FAC.CMS_LSP_APPR_LMTS_ID 
-- 			AND LMT.SOURCE_ID = 'RLOS'));								
							
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_4_REL', 'SIBS', 6);
	commit;
    
	-----------------------------------------------------
	-- Check for non-existence common code
	-----------------------------------------------------
	--UPDATE MIG_CA003_4_REL a set is_valid = 'N'
	--where ( 
	--	(not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ACCT_RELATIONSHIP_CODE_NUM and entry_code = ACCT_RELATIONSHIP_CODE_VALUE fetch first row only)) 
	-- OR (length(HOLD_MAIN_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = HOLD_MAIN_CODE_NUM and entry_code = HOLD_MAIN_CODE_VALUE fetch first row only))) 
	-- OR (length(NAME_CONJUNCTION_CODE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = NAME_CONJUNCTION_CAT and entry_code = NAME_CONJUNCTION_CODE fetch first row only)))  -- CZ: already checked for invalid values
	--) 
	--and a.is_valid = 'Y';
      
	--CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_4_REL', 'SIBS', 7);
	--commit;

	--INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
  	--(select current_timestamp, 'SIBS', 'CA003_4', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), CIF_NUMBER, 'COM001', 
	--		'[M] Non Existence Common Code: ' 
	--		|| GET_INVALID_COMMON_CODE_MSG('ACCT_RELATIONSHIP_CODE_VALUE', ACCT_RELATIONSHIP_CODE_VALUE, ACCT_RELATIONSHIP_CODE_NUM)
	--		|| (CASE WHEN length(HOLD_MAIN_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('HOLD_MAIN_CODE_VALUE', HOLD_MAIN_CODE_VALUE, HOLD_MAIN_CODE_NUM) ELSE '' END)
	--		|| (CASE WHEN length(NAME_CONJUNCTION_CODE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('NAME_CONJUNCTION_CODE', NAME_CONJUNCTION_CODE, NAME_CONJUNCTION_CAT) ELSE '' END)
	--FROM MIG_CA003_4_REL
       	--WHERE ( 
    	--    (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ACCT_RELATIONSHIP_CODE_NUM and entry_code = ACCT_RELATIONSHIP_CODE_VALUE fetch first row only)) 
	-- 	OR (length(HOLD_MAIN_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = HOLD_MAIN_CODE_NUM and entry_code = HOLD_MAIN_CODE_VALUE fetch first row only))) 
	-- 	OR (length(NAME_CONJUNCTION_CODE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = NAME_CONJUNCTION_CAT and entry_code = NAME_CONJUNCTION_CODE fetch first row only))) 
      	--));
		
	--CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_4_REL', 'SIBS', 8);
	--commit;
    
	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------
	UPDATE MIG_CA003_4_REL a set is_valid = 'N'
	where ( (GUARANTEE_PERCENTAGE < 0 or GUARANTEE_PERCENTAGE > 100)
             OR (length(SHARE_HOLDER_PERCENTAGE) > 0 and (SHARE_HOLDER_PERCENTAGE < 0 or SHARE_HOLDER_PERCENTAGE > 100))
             OR (length(RECEIVE_MAIL_CODE) > 0 and (RECEIVE_MAIL_CODE not in ('Y','N')))
             -- OR (length(trim(NAME_CONJUNCTION_POSITION)) > 0 and (NAME_CONJUNCTION_POSITION not in ('A','B')))	-- A - After / B - Before
             OR (length(PROFIT_RATIO) > 0 and (PROFIT_RATIO < 0 or PROFIT_RATIO > 100))
	     OR (length(DIVIDEND_RATIO) > 0 and (DIVIDEND_RATIO < 0 or DIVIDEND_RATIO > 100))
    	) 
      	and a.is_valid = 'Y';

    commit;
	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_4', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), CIF_NUMBER, 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| (CASE WHEN (GUARANTEE_PERCENTAGE < 0 or GUARANTEE_PERCENTAGE > 100) THEN GET_INVALID_VALUE_MSG('GUARANTEE_PERCENTAGE', CHAR(GUARANTEE_PERCENTAGE), '0-100') ELSE '' END)
			|| (CASE WHEN (length(SHARE_HOLDER_PERCENTAGE) > 0 and (SHARE_HOLDER_PERCENTAGE < 0 or SHARE_HOLDER_PERCENTAGE > 100)) THEN GET_INVALID_VALUE_MSG('SHARE_HOLDER_PERCENTAGE', CHAR(SHARE_HOLDER_PERCENTAGE), '0-100') ELSE '' END)
			|| (CASE WHEN (length(RECEIVE_MAIL_CODE) > 0 and (RECEIVE_MAIL_CODE NOT IN ('Y', 'N'))) THEN GET_INVALID_VALUE_MSG('RECEIVE_MAIL_CODE', CHAR(RECEIVE_MAIL_CODE), 'Y/N') ELSE '' END)
			-- || (CASE WHEN (length(trim(NAME_CONJUNCTION_POSITION)) > 0 and (trim(NAME_CONJUNCTION_POSITION) NOT IN ('A', 'B'))) THEN GET_INVALID_VALUE_MSG('NAME_CONJUNCTION_POSITION', trim(NAME_CONJUNCTION_POSITION), 'A/B') ELSE '' END)
			|| (CASE WHEN (length(PROFIT_RATIO) > 0 and (PROFIT_RATIO < 0 or PROFIT_RATIO > 100)) THEN GET_INVALID_VALUE_MSG('PROFIT_RATIO', CHAR(PROFIT_RATIO), '0-100') ELSE '' END)
			|| (CASE WHEN (length(DIVIDEND_RATIO) > 0 and (DIVIDEND_RATIO < 0 or DIVIDEND_RATIO > 100)) THEN GET_INVALID_VALUE_MSG('DIVIDEND_RATIO', CHAR(DIVIDEND_RATIO), '0-100') ELSE '' END)
	FROM MIG_CA003_4_REL
      	WHERE ( (GUARANTEE_PERCENTAGE < 0 or GUARANTEE_PERCENTAGE > 100)
             OR (length(SHARE_HOLDER_PERCENTAGE) > 0 and (SHARE_HOLDER_PERCENTAGE < 0 or SHARE_HOLDER_PERCENTAGE > 100))
             OR (length(RECEIVE_MAIL_CODE) > 0 and (RECEIVE_MAIL_CODE NOT IN ('Y', 'N')))
             -- OR (length(trim(NAME_CONJUNCTION_POSITION)) > 0 and (trim(NAME_CONJUNCTION_POSITION) NOT IN ('A', 'B')))	-- A - After / B - Before
             OR (length(PROFIT_RATIO) > 0 and (PROFIT_RATIO < 0 or PROFIT_RATIO > 100))
			 OR (length(DIVIDEND_RATIO) > 0 and (DIVIDEND_RATIO < 0 or DIVIDEND_RATIO > 100))
      	));		
     
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_4_REL', 'SIBS', 0);
	
END@


CREATE PROCEDURE MIG_VALIDATE_CA003_5_INS
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_5_INS', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CA003_5_INS a SET is_valid = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(LMT_ID)=0
			OR length(LLP_BCA_REF_NUM)=0
			OR length(LMT_FAC_CODE)=0
			OR length(LMT_FAC_SEQ)=0
            OR (length(COVERAGE_TYPE_CODE_VALUE) = 0 AND length(INSR_COMPANY_CODE_VALUE) = 0 
                AND length(POLICY_NUMBER) = 0 AND length(POLICY_NUMBER_CV_NOTE) = 0 
                AND length(INSURED_AMOUNT) = 0 AND length(INSURANCE_PREMIUM) = 0 
                AND length(ISSUED_DATE) = 0 AND length(EXPIRY_DATE) = 0 
                AND length(EFFECTIVE_DATE) = 0 AND length(ARRANGEMENT_IND) = 0 AND length(REMARKS) = 0 
                AND length(COVERAGE_TYPE_CODE_VALUE_1) = 0 AND length(INSR_COMPANY_CODE_VALUE_1) = 0 
                AND length(POLICY_NUMBER_1) = 0 AND length(POLICY_NUMBER_CV_NOTE_1) = 0 
                AND length(INSURED_AMOUNT_1) = 0 AND length(INSURANCE_PREMIUM_1) = 0 
                AND length(ISSUED_DATE_1) = 0 AND length(EXPIRY_DATE_1) = 0 
                AND length(EFFECTIVE_DATE_1) = 0 AND length(ARRANGEMENT_IND_1) = 0 AND length(REMARKS_1) = 0);
				
	commit;

	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_5', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'MAN001',
			'[L] Mandatory Field(s): ' 
			|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| BVL(LMT_ID, ' [LMT_ID] ')
			|| BVL(LLP_BCA_REF_NUM, ' [AA_NUMBER] ')
			|| BVL(LMT_FAC_CODE, ' [LMT_FAC_CODE] ')
			|| BVL(char(LMT_FAC_SEQ), ' [LMT_FAC_SEQ] ')
            || (CASE WHEN (length(COVERAGE_TYPE_CODE_VALUE) = 0 AND length(INSR_COMPANY_CODE_VALUE) = 0 
                            AND length(POLICY_NUMBER) = 0 AND length(POLICY_NUMBER_CV_NOTE) = 0 
                            AND length(INSURED_AMOUNT) = 0 AND length(INSURANCE_PREMIUM) = 0 
                            AND length(ISSUED_DATE) = 0 AND length(EXPIRY_DATE) = 0 
                            AND length(EFFECTIVE_DATE) = 0 AND length(ARRANGEMENT_IND) = 0 AND length(REMARKS) = 0 
                            AND length(COVERAGE_TYPE_CODE_VALUE_1) = 0 AND length(INSR_COMPANY_CODE_VALUE_1) = 0 
                            AND length(POLICY_NUMBER_1) = 0 AND length(POLICY_NUMBER_CV_NOTE_1) = 0 
                            AND length(INSURED_AMOUNT_1) = 0 AND length(INSURANCE_PREMIUM_1) = 0 
                            AND length(ISSUED_DATE_1) = 0 AND length(EXPIRY_DATE_1) = 0 
                            AND length(EFFECTIVE_DATE_1) = 0 AND length(ARRANGEMENT_IND_1) = 0 AND length(REMARKS_1) = 0)
                THEN  BVL('', ' [ALL_OTHER_FIELDS_ARE_EMPTY] ') ELSE '' END)
			|| ' is/are empty.'
	FROM MIG_CA003_5_INS
	WHERE is_valid = 'N'
	AND (length(RECORD_TYPE)=0
			OR length(LMT_ID)=0
			OR length(LLP_BCA_REF_NUM)=0
			OR length(LMT_FAC_CODE)=0
			OR length(LMT_FAC_SEQ)=0
            OR (length(COVERAGE_TYPE_CODE_VALUE) = 0 AND length(INSR_COMPANY_CODE_VALUE) = 0 
                AND length(POLICY_NUMBER) = 0 AND length(POLICY_NUMBER_CV_NOTE) = 0 
                AND length(INSURED_AMOUNT) = 0 AND length(INSURANCE_PREMIUM) = 0 
                AND length(ISSUED_DATE) = 0 AND length(EXPIRY_DATE) = 0 
                AND length(EFFECTIVE_DATE) = 0 AND length(ARRANGEMENT_IND) = 0 AND length(REMARKS) = 0 
                AND length(COVERAGE_TYPE_CODE_VALUE_1) = 0 AND length(INSR_COMPANY_CODE_VALUE_1) = 0 
                AND length(POLICY_NUMBER_1) = 0 AND length(POLICY_NUMBER_CV_NOTE_1) = 0 
                AND length(INSURED_AMOUNT_1) = 0 AND length(INSURANCE_PREMIUM_1) = 0 
                AND length(ISSUED_DATE_1) = 0 AND length(EXPIRY_DATE_1) = 0 
                AND length(EFFECTIVE_DATE_1) = 0 AND length(ARRANGEMENT_IND_1) = 0 AND length(REMARKS_1) = 0)));
	  
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_5_INS', 'SIBS', 2);
	commit;
	
	---------------------------------
	-- Check for duplicate records
	---------------------------------
  	UPDATE MIG_CA003_5_INS a set is_valid = 'N'
  	where a.LMT_ID in 
    (select LMT_ID
  		from MIG_CA003_5_INS t
		group by LMT_ID
		having count(*) > 1)
	and a.is_valid = 'Y';	
	
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_5',  LMT_ID, 'DUP001', 
		'[M] Duplicate records found for Limit ID [' || LMT_ID || '] - ' || trim(char(count(*))) || ' records found]' 
  	from MIG_CA003_5_INS a
	where is_valid = 'N'
	group by LMT_ID
    having count(*) > 1);		
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_5_INS', 'SIBS', 3);		
	commit;

	-----------------------------------------
	-- Check for Dependency
	-- to check against sci_lsp_appr_lmts
	-----------------------------------------
	LOCK TABLE MIG_CA003_5_INS IN SHARE MODE;
	UPDATE MIG_CA003_5_INS a 
	SET CMS_ACT_FAC_MASTER_ID = (SELECT FAC.ID
				     FROM SCI_LSP_APPR_LMTS LMT, CMS_FACILITY_MASTER FAC
				     WHERE a.LMT_ID = LMT.LMT_ID
				     AND LMT.CMS_LSP_APPR_LMTS_ID = FAC.CMS_LSP_APPR_LMTS_ID 
				     AND LMT.SOURCE_ID = 'RLOS');
								
	UPDATE MIG_CA003_5_INS SET IS_VALID = 'N'
	WHERE CMS_ACT_FAC_MASTER_ID IS NULL;
	
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_5',  LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'LNF001', 
		'[H] Failed to Limit ID [' || LMT_ID || '] from CA003.1 Facility Master interface file'
	FROM MIG_CA003_5_INS a
	WHERE is_valid = 'N'
	AND CMS_ACT_FAC_MASTER_ID is null
	and NOT EXISTS (SELECT 1
			FROM SCI_LSP_APPR_LMTS LMT, CMS_FACILITY_MASTER FAC
			WHERE a.LMT_ID = LMT.LMT_ID
			AND LMT.CMS_LSP_APPR_LMTS_ID = FAC.CMS_LSP_APPR_LMTS_ID 
			AND LMT.SOURCE_ID = 'RLOS'));
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_5_INS', 'SIBS', 4);
	commit;
    
    -----------------------------------------------------
    -- Check for non-existence common code
    -----------------------------------------------------
    UPDATE MIG_CA003_5_INS a set is_valid = 'N'
    where ( 
        (length(COVERAGE_TYPE_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COVERAGE_TYPE_CODE_NUM and entry_code = COVERAGE_TYPE_CODE_VALUE  ))) 
     OR (length(INSR_COMPANY_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = INSR_COMPANY_CODE_NUM and entry_code = INSR_COMPANY_CODE_VALUE ))) 
     OR (length(COVERAGE_TYPE_CODE_VALUE_1) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COVERAGE_TYPE_CODE_NUM and entry_code = COVERAGE_TYPE_CODE_VALUE_1  ))) 
     OR (length(INSR_COMPANY_CODE_VALUE_1) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = INSR_COMPANY_CODE_NUM and entry_code = INSR_COMPANY_CODE_VALUE_1 ))) 
    ) 
    and a.is_valid = 'Y';
	
	commit;
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_5',  LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'COM001', 
			'[M] Non Existence Common Code: ' 
			|| (CASE WHEN length(COVERAGE_TYPE_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('COVERAGE_TYPE_CODE_NUM', COVERAGE_TYPE_CODE_NUM, COVERAGE_TYPE_CODE_VALUE) ELSE '' END)
			|| (CASE WHEN length(INSR_COMPANY_CODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('INSR_COMPANY_CODE_NUM', INSR_COMPANY_CODE_NUM, INSR_COMPANY_CODE_VALUE) ELSE '' END)
			|| (CASE WHEN length(COVERAGE_TYPE_CODE_VALUE_1) > 0 THEN GET_INVALID_COMMON_CODE_MSG('COVERAGE_TYPE_CODE_NUM', COVERAGE_TYPE_CODE_NUM, COVERAGE_TYPE_CODE_VALUE_1) ELSE '' END)
			|| (CASE WHEN length(INSR_COMPANY_CODE_VALUE_1) > 0 THEN GET_INVALID_COMMON_CODE_MSG('INSR_COMPANY_CODE_NUM', INSR_COMPANY_CODE_NUM, INSR_COMPANY_CODE_VALUE_1) ELSE '' END)
	   FROM MIG_CA003_5_INS
       WHERE ( 
        (length(COVERAGE_TYPE_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COVERAGE_TYPE_CODE_NUM and entry_code = COVERAGE_TYPE_CODE_VALUE  ))) 
     OR (length(INSR_COMPANY_CODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = INSR_COMPANY_CODE_NUM and entry_code = INSR_COMPANY_CODE_VALUE ))) 
     OR (length(COVERAGE_TYPE_CODE_VALUE_1) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COVERAGE_TYPE_CODE_NUM and entry_code = COVERAGE_TYPE_CODE_VALUE_1  ))) 
     OR (length(INSR_COMPANY_CODE_VALUE_1) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = INSR_COMPANY_CODE_NUM and entry_code = INSR_COMPANY_CODE_VALUE_1 ))) 
      ));
        
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_5_INS', 'SIBS', 0);
END
@

CREATE PROCEDURE MIG_VALIDATE_CA003_6_MUL
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_6', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CA003_6_MUL a SET is_valid = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(LMT_ID)=0
			OR length(LLP_BCA_REF_NUM)=0
			OR length(LMT_FAC_CODE)=0
			OR length(LMT_FAC_SEQ)=0
			OR length(TIER_SEQ_NO)=0
			OR length(TIER_TERM)=0
			OR length(TIER_TERM_CODE)=0
			OR length(RATE)=0;
			
	commit;

	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_6', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), trim(CHAR(TIER_SEQ_NO)), 'MAN001',
			'[L] Mandatory Field(s): ' 
			|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| BVL(LMT_ID, ' [LMT_ID] ')
			|| BVL(LLP_BCA_REF_NUM, ' [AA_NUMBER] ')
			|| BVL(LMT_FAC_CODE, ' [LMT_FAC_CODE] ')
			|| BVL(char(LMT_FAC_SEQ), ' [LMT_FAC_SEQ] ')
			|| BVL(char(TIER_SEQ_NO), ' [TIER_SEQ_NO] ')
			|| BVL(char(TIER_TERM), ' [TIER_TERM] ')
			|| BVL(TIER_TERM_CODE, ' [TIER_TERM_CODE] ')
			|| NVL2(char(RATE), '', ' [RATE] ')
			|| ' is/are empty.'
	FROM MIG_CA003_6_MUL
	WHERE is_valid = 'N'
	AND (length(RECORD_TYPE)=0
		OR length(LMT_ID)=0
		OR length(LLP_BCA_REF_NUM)=0
		OR length(LMT_FAC_CODE)=0
		OR length(LMT_FAC_SEQ)=0
		OR length(TIER_SEQ_NO)=0
		OR length(TIER_TERM)=0
		OR length(TIER_TERM_CODE)=0
		OR length(RATE)=0));
	  
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_6', 'SIBS', 2);
	commit;
	
	---------------------------------
	-- Check for duplicate records
	---------------------------------
  	UPDATE MIG_CA003_6_MUL a set is_valid = 'N'
  	where (a.LMT_ID, a.TIER_SEQ_NO) in 
    (select LMT_ID, TIER_SEQ_NO
  		from MIG_CA003_6_MUL t
		group by LMT_ID, TIER_SEQ_NO
		having count(*) > 1)
	and a.is_valid = 'Y';	
	
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key5_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_6',  LMT_ID, TRIM(CHAR(TIER_SEQ_NO)), 'DUP001', 
		'[M] Duplicate records found for Limit ID [' || LMT_ID || '] Tier Seq No [' || CHAR(TIER_SEQ_NO) || '] - ' || trim(char(count(*))) || ' records found]' 
  	from MIG_CA003_6_MUL a
	where is_valid = 'N'
	group by LMT_ID, TIER_SEQ_NO
    having count(*) > 1);		
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_6', 'SIBS', 3);		
	commit;

	-----------------------------------------
	-- Check for Dependency
	-- to check against sci_lsp_appr_lmts
	-----------------------------------------
	LOCK TABLE MIG_CA003_6_MUL IN SHARE MODE;
	UPDATE MIG_CA003_6_MUL a 
	SET CMS_ACT_FAC_MASTER_ID = (SELECT FAC.ID
				     FROM SCI_LSP_APPR_LMTS LMT, CMS_FACILITY_MASTER FAC
				     WHERE a.LMT_ID = LMT.LMT_ID
				     AND LMT.CMS_LSP_APPR_LMTS_ID = FAC.CMS_LSP_APPR_LMTS_ID 
				     AND LMT.SOURCE_ID = 'RLOS');
								
	UPDATE MIG_CA003_6_MUL SET IS_VALID = 'N'
	WHERE CMS_ACT_FAC_MASTER_ID IS NULL;
	
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_6',  LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), trim(CHAR(TIER_SEQ_NO)), 'LNF001', 
		'[H] Failed to Limit ID [' || LMT_ID || '] from CA003.1 Facility Master interface file'
	FROM MIG_CA003_6_MUL a
	WHERE is_valid = 'N'
	AND CMS_ACT_FAC_MASTER_ID is null
	AND NOT EXISTS (SELECT 1
			FROM SCI_LSP_APPR_LMTS LMT, CMS_FACILITY_MASTER FAC
			WHERE a.LMT_ID = LMT.LMT_ID
			AND LMT.CMS_LSP_APPR_LMTS_ID = FAC.CMS_LSP_APPR_LMTS_ID 
			AND LMT.SOURCE_ID = 'RLOS'));
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_6', 'SIBS', 4);
	commit;
    

    -----------------------------------------------------
    -- Check for invalid values
    -----------------------------------------------------
	  UPDATE MIG_CA003_6_MUL a set is_valid = 'N'
	  where ( 
                (TIER_TERM_CODE not in ('D', 'M', 'Y'))
      ) 
      and a.is_valid = 'Y';

    commit;
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_6', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), trim(CHAR(TIER_SEQ_NO)), 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| GET_INVALID_VALUE_MSG('TIER_TERM_CODE', CHAR(TIER_TERM_CODE), 'D/M/Y')
	   FROM MIG_CA003_6_MUL
       WHERE ( 
                (TIER_TERM_CODE not in ('D', 'M', 'Y'))
      ));
      
    
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_6', 'SIBS', 0);
END
@

CREATE PROCEDURE MIG_VALIDATE_CA003_7_ISL
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_7', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CA003_7_ISL a SET is_valid = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(LMT_ID)=0
			OR length(LLP_BCA_REF_NUM)=0
			OR length(LMT_FAC_CODE)=0
			OR length(LMT_FAC_SEQ)=0
			OR length(GPP_PAYMENT_MODE_VALUE)=0
			OR (GPP_PAYMENT_MODE_VALUE in ('Y', 'E', 'N') and length(GPP_TERM)=0)
			OR (GPP_PAYMENT_MODE_VALUE in ('Y', 'E', 'N') and length(GPP_TERM_CODE)=0)
			OR length(CUSTOMER_INTEREST_RATE)=0
			OR (GPP_PAYMENT_MODE_VALUE in ('Y', 'E', 'N') and length(GPP_CALCULATION_MEHTOD_VALUE)=0)
			OR length(COMPOUNDING_METHOD)=0
			OR (COMPOUNDING_METHOD = 'Y' and length(DATE_STOP_COMPOUNDING)=0)
			OR (FULREL_PROFIC_CALC_METHOD = 'Y' and length(REFUND_FULREL_PROFIT_VALUE)=0)
			OR length(EXC_CMP_IN_PMT_AMT)=0
			OR length(FULL_REL_PFT_12_METHOD)=0;

	commit;
	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_7', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'MAN001',
			'[L] Mandatory Field(s): ' 
			|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| BVL(LMT_ID, ' [LMT_ID] ')
			|| BVL(LLP_BCA_REF_NUM, ' [AA_NUMBER] ')
			|| BVL(LMT_FAC_CODE, ' [LMT_FAC_CODE] ')
			|| BVL(char(LMT_FAC_SEQ), ' [LMT_FAC_SEQ] ')
			|| BVL(GPP_PAYMENT_MODE_VALUE, ' [GPP_PAYMENT_MODE_VALUE] ')
            || (CASE WHEN GPP_PAYMENT_MODE_VALUE in ('Y', 'E', 'N') THEN  BVL(char(GPP_TERM), ' [GPP_TERM] ') ELSE '' END)
            || (CASE WHEN GPP_PAYMENT_MODE_VALUE in ('Y', 'E', 'N') THEN  BVL(GPP_TERM_CODE, ' [GPP_TERM_CODE] ') ELSE '' END)
            || (CASE WHEN GPP_PAYMENT_MODE_VALUE in ('Y', 'E', 'N') THEN  BVL(GPP_CALCULATION_MEHTOD_VALUE, ' [GPP_CALCULATION_MEHTOD_VALUE] ') ELSE '' END)
			|| NVL2(char(CUSTOMER_INTEREST_RATE), '', ' [CUSTOMER_INTEREST_RATE] ')
			|| BVL(COMPOUNDING_METHOD, ' [COMPOUNDING_METHOD] ')
            || (CASE WHEN COMPOUNDING_METHOD = 'Y' THEN  NVL2(char(DATE_STOP_COMPOUNDING), '', ' [DATE_STOP_COMPOUNDING] ') ELSE '' END)
            || (CASE WHEN FULREL_PROFIC_CALC_METHOD = 'Y' THEN  BVL(REFUND_FULREL_PROFIT_VALUE, ' [REFUND_FULREL_PROFIT_VALUE] ') ELSE '' END)
			|| NVL2(char(EXC_CMP_IN_PMT_AMT), '', ' [EXC_CMP_IN_PMT_AMT] ')
			|| BVL(FULL_REL_PFT_12_METHOD, ' [FULL_REL_PFT_12_METHOD] ')
			|| ' is/are empty.'
	FROM MIG_CA003_7_ISL
	WHERE is_valid = 'N'
	AND (length(RECORD_TYPE)=0
		OR length(LMT_ID)=0
		OR length(LLP_BCA_REF_NUM)=0
		OR length(LMT_FAC_CODE)=0
		OR length(LMT_FAC_SEQ)=0
		OR length(GPP_PAYMENT_MODE_VALUE)=0
		OR (GPP_PAYMENT_MODE_VALUE in ('Y', 'E', 'N') and length(GPP_TERM)=0)
		OR (GPP_PAYMENT_MODE_VALUE in ('Y', 'E', 'N') and length(GPP_TERM_CODE)=0)
		OR length(CUSTOMER_INTEREST_RATE)=0
		OR (GPP_PAYMENT_MODE_VALUE in ('Y', 'E', 'N') and length(GPP_CALCULATION_MEHTOD_VALUE)=0)
		OR length(COMPOUNDING_METHOD)=0
		OR (COMPOUNDING_METHOD = 'Y' and length(DATE_STOP_COMPOUNDING)=0)
		OR (FULREL_PROFIC_CALC_METHOD = 'Y' and length(REFUND_FULREL_PROFIT_VALUE)=0)
		OR length(EXC_CMP_IN_PMT_AMT)=0
		OR length(FULL_REL_PFT_12_METHOD)=0));
	  
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_7', 'SIBS', 2);
	commit;
	
	---------------------------------
	-- Check for duplicate records
	---------------------------------
  	UPDATE MIG_CA003_7_ISL a set is_valid = 'N'
  	where a.LMT_ID in 
    (select LMT_ID
  		from MIG_CA003_7_ISL t
		group by LMT_ID
		having count(*) > 1)
	and a.is_valid = 'Y';	
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_7',  LMT_ID, 'DUP001', 
		'[M] Duplicate records found for Limit ID [' || LMT_ID || '] - ' || trim(char(count(*))) || ' records found]' 
  	from MIG_CA003_7_ISL a
	where is_valid = 'N'
	group by LMT_ID
    having count(*) > 1);		
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_7', 'SIBS', 3);		
	commit;

	-----------------------------------------
	-- Check for Dependency
	-- to check against sci_lsp_appr_lmts
	-----------------------------------------
	LOCK TABLE MIG_CA003_7_ISL IN SHARE MODE;
	UPDATE MIG_CA003_7_ISL a 
	SET CMS_ACT_FAC_MASTER_ID = (SELECT FAC.ID
				     FROM SCI_LSP_APPR_LMTS LMT, CMS_FACILITY_MASTER FAC
				     WHERE a.LMT_ID = LMT.LMT_ID
				     AND LMT.CMS_LSP_APPR_LMTS_ID = FAC.CMS_LSP_APPR_LMTS_ID 
				     AND LMT.SOURCE_ID = 'RLOS');
								
	UPDATE MIG_CA003_7_ISL SET IS_VALID = 'N'
	WHERE CMS_ACT_FAC_MASTER_ID IS NULL;
	
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_7',  LMT_ID, 'LNF001', 
		'[H] Failed to Limit ID [' || LMT_ID || '] from CA003.1 Facility Master interface file'
	FROM MIG_CA003_7_ISL a
	WHERE is_valid = 'N'
	AND CMS_ACT_FAC_MASTER_ID is null
	AND NOT EXISTS (SELECT 1
			FROM SCI_LSP_APPR_LMTS LMT, CMS_FACILITY_MASTER FAC
			WHERE a.LMT_ID = LMT.LMT_ID
			AND LMT.CMS_LSP_APPR_LMTS_ID = FAC.CMS_LSP_APPR_LMTS_ID 
			AND LMT.SOURCE_ID = 'RLOS'));
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_7', 'SIBS', 4);
	commit;
    
    -----------------------------------------------------
    -- Check for non-existence common code
    -----------------------------------------------------
    UPDATE MIG_CA003_7_ISL a set is_valid = 'N'
    where ( 
        (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GPP_PAYMENT_MODE_NUM and entry_code = GPP_PAYMENT_MODE_VALUE  )) 
     OR (length(GPP_CALCULATION_MEHTOD_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GPP_CALCULATION_METHOD_NUM and entry_code = GPP_CALCULATION_MEHTOD_VALUE ))) 
     OR (length(REFUND_GPP_PROFIT_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = REFUND_GPP_PROFIT_NUM and entry_code = REFUND_GPP_PROFIT_VALUE ))) 
     OR (length(REFUND_FULREL_PROFIT_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = REFUND_FULREL_PROFIT_NUM and entry_code = REFUND_FULREL_PROFIT_VALUE ))) 
     OR (length(SPTF_DUAL_REPAYMENT_MODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SPTF_DUAL_REPAYMENT_MODE_NUM and entry_code = SPTF_DUAL_REPAYMENT_MODE_VALUE ))) 
    ) 
    and a.is_valid = 'Y';
	
	commit;
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_7',  LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'COM001', 
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('GPP_PAYMENT_MODE_NUM', GPP_PAYMENT_MODE_NUM, GPP_PAYMENT_MODE_VALUE)
			|| (CASE WHEN length(GPP_CALCULATION_MEHTOD_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('GPP_CALCULATION_METHOD_NUM', GPP_CALCULATION_METHOD_NUM, GPP_CALCULATION_MEHTOD_VALUE) ELSE '' END)
			|| (CASE WHEN length(REFUND_GPP_PROFIT_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('REFUND_GPP_PROFIT_NUM', REFUND_GPP_PROFIT_NUM, REFUND_GPP_PROFIT_VALUE) ELSE '' END)
			|| (CASE WHEN length(REFUND_FULREL_PROFIT_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('REFUND_FULREL_PROFIT_NUM', REFUND_FULREL_PROFIT_NUM, REFUND_FULREL_PROFIT_VALUE) ELSE '' END)
			|| (CASE WHEN length(SPTF_DUAL_REPAYMENT_MODE_VALUE) > 0 THEN GET_INVALID_COMMON_CODE_MSG('SPTF_DUAL_REPAYMENT_MODE_NUM', SPTF_DUAL_REPAYMENT_MODE_NUM, SPTF_DUAL_REPAYMENT_MODE_VALUE) ELSE '' END)
	   FROM MIG_CA003_7_ISL
       WHERE ( 
        (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GPP_PAYMENT_MODE_NUM and entry_code = GPP_PAYMENT_MODE_VALUE  )) 
     OR (length(GPP_CALCULATION_MEHTOD_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GPP_CALCULATION_METHOD_NUM and entry_code = GPP_CALCULATION_MEHTOD_VALUE ))) 
     OR (length(REFUND_GPP_PROFIT_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = REFUND_GPP_PROFIT_NUM and entry_code = REFUND_GPP_PROFIT_VALUE ))) 
     OR (length(REFUND_FULREL_PROFIT_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = REFUND_FULREL_PROFIT_NUM and entry_code = REFUND_FULREL_PROFIT_VALUE ))) 
     OR (length(SPTF_DUAL_REPAYMENT_MODE_VALUE) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SPTF_DUAL_REPAYMENT_MODE_NUM and entry_code = SPTF_DUAL_REPAYMENT_MODE_VALUE ))) 
      ));
    
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_7', 'SIBS', 5);
	commit;
    
    -----------------------------------------------------
    -- Check for invalid values
    -----------------------------------------------------
	  UPDATE MIG_CA003_7_ISL a set is_valid = 'N'
	  where ( 
                (length(SECURITY_DEP_PERCENTAGE) > 0 and (SECURITY_DEP_PERCENTAGE < 0 or SECURITY_DEP_PERCENTAGE > 100))
             OR (CUSTOMER_INTEREST_RATE < 0 or CUSTOMER_INTEREST_RATE > 100)
             OR (COMPOUNDING_METHOD not in ('Y', 'N'))
             OR (length(COMMISSION_RATE) > 0 and (COMMISSION_RATE < 0 or COMMISSION_RATE > 100))
             OR (EXC_CMP_IN_PMT_AMT not in ('Y', 'N'))
             OR (FULL_REL_PFT_12_METHOD not in ('Y', 'N'))
      ) 
      and a.is_valid = 'Y';

    commit;  
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_7', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| (CASE WHEN (length(SECURITY_DEP_PERCENTAGE) > 0 and (SECURITY_DEP_PERCENTAGE < 0 or SECURITY_DEP_PERCENTAGE > 100)) THEN GET_INVALID_VALUE_MSG('SECURITY_DEP_PERCENTAGE', CHAR(SECURITY_DEP_PERCENTAGE), '0-100') ELSE '' END)
			|| (CASE WHEN (CUSTOMER_INTEREST_RATE < 0 or CUSTOMER_INTEREST_RATE > 100) THEN GET_INVALID_VALUE_MSG('CUSTOMER_INTEREST_RATE', CHAR(CUSTOMER_INTEREST_RATE), '0-100') ELSE '' END)
			|| (CASE WHEN (COMPOUNDING_METHOD not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('COMPOUNDING_METHOD', COMPOUNDING_METHOD, 'Y/N') ELSE '' END)
			|| (CASE WHEN (length(COMMISSION_RATE) > 0 and (COMMISSION_RATE < 0 or COMMISSION_RATE > 100)) THEN GET_INVALID_VALUE_MSG('COMMISSION_RATE', CHAR(COMMISSION_RATE), '0-100') ELSE '' END)
			|| (CASE WHEN (EXC_CMP_IN_PMT_AMT not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('EXC_CMP_IN_PMT_AMT', EXC_CMP_IN_PMT_AMT, 'Y/N') ELSE '' END)
			|| (CASE WHEN (FULL_REL_PFT_12_METHOD not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('FULL_REL_PFT_12_METHOD', FULL_REL_PFT_12_METHOD, 'Y/N') ELSE '' END)
	   FROM MIG_CA003_7_ISL
       WHERE ( 
                (length(SECURITY_DEP_PERCENTAGE) > 0 and (SECURITY_DEP_PERCENTAGE < 0 or SECURITY_DEP_PERCENTAGE > 100))
             OR (CUSTOMER_INTEREST_RATE < 0 or CUSTOMER_INTEREST_RATE > 100)
             OR (COMPOUNDING_METHOD not in ('Y', 'N'))
             OR (length(COMMISSION_RATE) > 0 and (COMMISSION_RATE < 0 or COMMISSION_RATE > 100))
             OR (EXC_CMP_IN_PMT_AMT not in ('Y', 'N'))
             OR (FULL_REL_PFT_12_METHOD not in ('Y', 'N'))
      ));
    
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_7', 'SIBS', 0);
	
END@


CREATE PROCEDURE MIG_VALIDATE_CA003_8_BBA
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_8', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CA003_8_BBA a SET is_valid = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(LMT_ID)=0
			OR length(LLP_BCA_REF_NUM)=0
			OR length(LMT_FAC_CODE)=0
			OR length(LMT_FAC_SEQ)=0
			OR length(CUST_PROF_RATE)=0
			--OR length(REBATE_METHOD)=0
			OR length(GPP_PAYMENT_MODE)=0
			--OR length(GPP_CAL_METHOD)=0
			OR length(GPP_TERM)=0
			OR length(GPP_TERM_CODE)=0
			OR length(FULL_RELEASE_PROFIT)=0
			--OR length(REFUND_FULL_RELEASE_PROFIT)=0
			--OR length(FUL_REL_PROFIT_CAL_METHOD)=0
			OR length(INSTALLMENT)=0
			OR length(FINAL_PAYMENT_AMT)=0
			OR length(TOTAL_GPP_AMT)=0
			OR length(SELLING_PRICE)=0
			OR length(TOTAL_PROFIT)=0;
			
	commit;

	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_8', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'MAN001',
			'[L] Mandatory Field(s): ' 
			|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| BVL(LMT_ID, ' [LMT_ID] ')
			|| BVL(LLP_BCA_REF_NUM, ' [AA_NUMBER] ')
			|| BVL(LMT_FAC_CODE, ' [LMT_FAC_CODE] ')
			|| BVL(char(LMT_FAC_SEQ), ' [LMT_FAC_SEQ] ')
			|| NVL2(char(CUST_PROF_RATE), '', ' [CUST_PROF_RATE] ')
			--|| BVL(REBATE_METHOD, ' [REBATE_METHOD] ')
			|| BVL(GPP_PAYMENT_MODE, ' [GPP_PAYMENT_MODE] ')
			--|| BVL(GPP_CAL_METHOD, ' [GPP_CAL_METHOD] ')
			|| NVL2(char(GPP_TERM), '', ' [GPP_TERM] ')
			|| BVL(GPP_TERM_CODE, ' [GPP_TERM_CODE] ')
			|| BVL(FULL_RELEASE_PROFIT, ' [FULL_RELEASE_PROFIT] ')
			--|| BVL(REFUND_FULL_RELEASE_PROFIT, ' [REFUND_FULL_RELEASE_PROFIT] ')
			--|| BVL(FUL_REL_PROFIT_CAL_METHOD, ' [FUL_REL_PROFIT_CAL_METHOD] ')
			|| NVL2(char(INSTALLMENT), '', ' [INSTALLMENT] ')
			|| NVL2(char(FINAL_PAYMENT_AMT), '', ' [GPP_TERM] ')
			|| NVL2(char(TOTAL_GPP_AMT), '', ' [TOTAL_GPP_AMT] ')
			|| NVL2(char(SELLING_PRICE), '', ' [SELLING_PRICE] ')
			|| NVL2(char(TOTAL_PROFIT), '', ' [TOTAL_PROFIT] ')
			|| ' is/are empty.'
	FROM MIG_CA003_8_BBA
	WHERE is_valid = 'N'
	AND (length(RECORD_TYPE)=0
		OR length(LMT_ID)=0
		OR length(LLP_BCA_REF_NUM)=0
		OR length(LMT_FAC_CODE)=0
		OR length(LMT_FAC_SEQ)=0
		OR length(CUST_PROF_RATE)=0
		--OR length(REBATE_METHOD)=0
		OR length(GPP_PAYMENT_MODE)=0
		--OR length(GPP_CAL_METHOD)=0
		OR length(GPP_TERM)=0
		OR length(GPP_TERM_CODE)=0
		OR length(FULL_RELEASE_PROFIT)=0
		--OR length(REFUND_FULL_RELEASE_PROFIT)=0
		--OR length(FUL_REL_PROFIT_CAL_METHOD)=0
		OR length(INSTALLMENT)=0
		OR length(FINAL_PAYMENT_AMT)=0
		OR length(TOTAL_GPP_AMT)=0
		OR length(SELLING_PRICE)=0
		OR length(TOTAL_PROFIT)=0));
	  
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_8', 'SIBS', 2);
	commit;
	
	---------------------------------
	-- Check for duplicate records
	---------------------------------
  	UPDATE MIG_CA003_8_BBA a set is_valid = 'N'
  	where a.LMT_ID in 
    (select LMT_ID
  		from MIG_CA003_8_BBA t
		group by LMT_ID
		having count(*) > 1)
	and a.is_valid = 'Y';	
	
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_8',  LMT_ID, 'DUP001', 
		'[M] Duplicate records found for Limit ID [' || LMT_ID || '] - ' || trim(char(count(*))) || ' records found]' 
  	from MIG_CA003_8_BBA a
	where is_valid = 'N'
	group by LMT_ID
    having count(*) > 1);		
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_8', 'SIBS', 3);		
	commit;

	-----------------------------------------
	-- Check for Dependency
	-- to check against sci_lsp_appr_lmts
	-----------------------------------------
	LOCK TABLE MIG_CA003_8_BBA IN SHARE MODE;
	UPDATE MIG_CA003_8_BBA a 
	SET CMS_ACT_FAC_MASTER_ID = (SELECT FAC.ID
				     FROM SCI_LSP_APPR_LMTS LMT, CMS_FACILITY_MASTER FAC
				     WHERE a.LMT_ID = LMT.LMT_ID
				     AND LMT.CMS_LSP_APPR_LMTS_ID = FAC.CMS_LSP_APPR_LMTS_ID 
				     AND LMT.SOURCE_ID = 'RLOS');
								
	UPDATE MIG_CA003_8_BBA SET IS_VALID = 'N'
	WHERE CMS_ACT_FAC_MASTER_ID IS NULL;
	
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_8',  LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'LNF001', 
		'[H] Failed to Limit ID [' || LMT_ID || '] from CA003.1 Facility Master interface file'
	FROM MIG_CA003_8_BBA a
	WHERE is_valid = 'N'
	AND CMS_ACT_FAC_MASTER_ID IS NULL
	AND NOT EXISTS (SELECT 1
			FROM SCI_LSP_APPR_LMTS LMT, CMS_FACILITY_MASTER FAC
			WHERE a.LMT_ID = LMT.LMT_ID
			AND LMT.CMS_LSP_APPR_LMTS_ID = FAC.CMS_LSP_APPR_LMTS_ID 
			AND LMT.SOURCE_ID = 'RLOS'));
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_8', 'SIBS', 4);
	commit;
    
    -----------------------------------------------------
    -- Check for non-existence common code
    -----------------------------------------------------
    UPDATE MIG_CA003_8_BBA a set is_valid = 'N'
    where ( 
        (length(REBATE_METHOD) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = REBATE_METHOD_CAT and entry_code = REBATE_METHOD fetch first row only))) 
     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GPP_PAYMENT_MODE_CAT and entry_code = GPP_PAYMENT_MODE fetch first row only)) 
     OR (length(GPP_CAL_METHOD) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GPP_CAL_METHOD_CAT and entry_code = GPP_CAL_METHOD fetch first row only))) 
     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GPP_TERM_CODE_CAT and entry_code = GPP_TERM_CODE fetch first row only)) 
     OR (length(REFUND_FULL_RELEASE_PROFIT) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = REFUND_FULL_RELEASE_PROFIT_CAT and entry_code = REFUND_FULL_RELEASE_PROFIT fetch first row only))) 
     OR (length(FUL_REL_PROFIT_CAL_METHOD) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = FUL_REL_PROFIT_CAL_METHOD_CAT and entry_code = FUL_REL_PROFIT_CAL_METHOD fetch first row only))) 
    ) 
    and a.is_valid = 'Y';
	
	commit;
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA003_8',  LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'COM001', 
			'[M] Non Existence Common Code: ' 
			|| (CASE WHEN length(REBATE_METHOD) > 0 THEN GET_INVALID_COMMON_CODE_MSG('REBATE_METHOD_CAT', REBATE_METHOD, REBATE_METHOD_CAT) ELSE '' END)
			|| GET_INVALID_COMMON_CODE_MSG('GPP_PAYMENT_MODE_CAT', GPP_PAYMENT_MODE, GPP_PAYMENT_MODE_CAT)
			|| (CASE WHEN length(GPP_CAL_METHOD) > 0 THEN GET_INVALID_COMMON_CODE_MSG('GPP_CAL_METHOD_CAT', GPP_CAL_METHOD, GPP_CAL_METHOD_CAT) ELSE '' END)
			|| GET_INVALID_COMMON_CODE_MSG('GPP_TERM_CODE_CAT', GPP_TERM_CODE, GPP_TERM_CODE_CAT)
			|| (CASE WHEN length(REFUND_FULL_RELEASE_PROFIT) > 0 THEN GET_INVALID_COMMON_CODE_MSG('REFUND_FULL_RELEASE_PROFIT_CAT', REFUND_FULL_RELEASE_PROFIT, REFUND_FULL_RELEASE_PROFIT_CAT) ELSE '' END)
			|| (CASE WHEN length(FUL_REL_PROFIT_CAL_METHOD) > 0 THEN GET_INVALID_COMMON_CODE_MSG('FUL_REL_PROFIT_CAL_METHOD_CAT', FUL_REL_PROFIT_CAL_METHOD, FUL_REL_PROFIT_CAL_METHOD_CAT) ELSE '' END)
	   FROM MIG_CA003_8_BBA
       WHERE ( 
            (length(REBATE_METHOD) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = REBATE_METHOD_CAT and entry_code = REBATE_METHOD fetch first row only))) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GPP_PAYMENT_MODE_CAT and entry_code = GPP_PAYMENT_MODE fetch first row only)) 
         OR (length(GPP_CAL_METHOD) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GPP_CAL_METHOD_CAT and entry_code = GPP_CAL_METHOD fetch first row only))) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GPP_TERM_CODE_CAT and entry_code = GPP_TERM_CODE fetch first row only)) 
         OR (length(REFUND_FULL_RELEASE_PROFIT) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = REFUND_FULL_RELEASE_PROFIT_CAT and entry_code = REFUND_FULL_RELEASE_PROFIT fetch first row only))) 
         OR (length(FUL_REL_PROFIT_CAL_METHOD) > 0 and (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = FUL_REL_PROFIT_CAL_METHOD_CAT and entry_code = FUL_REL_PROFIT_CAL_METHOD fetch first row only))) 
      ));
    
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_8', 'SIBS', 5);
	commit;
    
    -----------------------------------------------------
    -- Check for invalid values
    -----------------------------------------------------
	UPDATE MIG_CA003_8_BBA a set is_valid = 'N'
	where ( (CUST_PROF_RATE < 1 or CUST_PROF_RATE > 100)
	) 
	and a.is_valid = 'Y';

    commit;  
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_8', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| GET_INVALID_VALUE_MSG('CUST_PROF_RATE', CHAR(CUST_PROF_RATE), '1-100')
	   FROM MIG_CA003_8_BBA
       WHERE ( 
                (CUST_PROF_RATE < 1 or CUST_PROF_RATE > 100)      
      ));
    
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA003_8', 'SIBS', 0);
	
END@


CREATE PROCEDURE MIG_VALIDATE_CA004
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA004', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CA004 a SET is_valid = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(AA_NUMBER)=0
			OR length(FACILITY_CODE)=0
			OR length(FACILITY_SEQ)=0
			OR length(EXTERNAL_SYSTEM_ACCT_NO)=0
			OR length(LOC_COUNTRY)=0
			OR length(LOC_ORG_CODE)=0;
			
	commit;

	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA004', LIMIT_ID, AA_NUMBER, EXTERNAL_SYSTEM_ACCT_NO, trim(char(ACCT_SEQ)), 'MAN001',
			'[L] Mandatory Field(s): ' 
			|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| BVL(AA_NUMBER, ' [AA_NUMBER] ')
			|| BVL(FACILITY_CODE, ' [FACILITY_CODE] ')
			|| BVL(char(FACILITY_SEQ), ' [FACILITY_SEQ] ')
			|| BVL(EXTERNAL_SYSTEM_ACCT_NO, ' [EXTERNAL_SYSTEM_ACCT_NO] ')
			|| BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
			|| BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
			|| ' is/are empty.'
	FROM MIG_CA004
	WHERE is_valid = 'N'
	AND (length(RECORD_TYPE)=0
		OR length(AA_NUMBER)=0
		OR length(FACILITY_CODE)=0
		OR length(FACILITY_SEQ)=0
		OR length(EXTERNAL_SYSTEM_ACCT_NO)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0));
	  
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA004', 'SIBS', 2);
	commit;
	
	---------------------------------
	-- Check for duplicate records
	---------------------------------
  	UPDATE MIG_CA004 a set is_valid = 'N'
  	where (a.external_system_acct_no, acct_seq) in (select EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ
  		from MIG_CA004 t
		group by EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ
		having count(*) > 1)
	and a.is_valid = 'Y';	
	
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key2_value, key3_value, key4_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CA004',  AA_NUMBER, EXTERNAL_SYSTEM_ACCT_NO, trim(char(ACCT_SEQ)), 'DUP001', 
		'[M] Duplicate limit account info found for Account Number [' || EXTERNAL_SYSTEM_ACCT_NO 
		|| '] Account Sequence [' || trim(char(ACCT_SEQ)) || '] - ' || trim(char(count(*))) || ' records found]' 
  	from MIG_CA004 a
	where (EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ) in (select EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ
  		from MIG_CA004 t
		group by EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ
  		having count(*) > 1)
		and is_valid = 'N'
	group by AA_NUMBER, EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ);		
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA004', 'SIBS', 3);		
	commit;
	
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LSP_APPR_LMTS
	-----------------------------------------
	UPDATE MIG_CA004 a 
	SET CMS_ACT_LIMIT_ID = (select cms_lsp_appr_lmts_id
		from sci_lsp_appr_lmts lmts
		where lmts.lmt_id = a.limit_id
		and source_id = 'RLOS')
	WHERE IS_VALID = 'Y';
	commit;
	
	
-- 	UPDATE MIG_CA004 a SET is_valid = 'N'
-- 	WHERE NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
-- 	 		  WHERE LMT_ID = a.LIMIT_ID
-- 	 		  AND source_id = 'RLOS')
-- 	AND IS_VALID = 'Y';

	update mig_ca004 a
	set is_valid = 'N'
	where cms_act_limit_id is null
	and is_valid = 'Y';
	
	commit;
	 					  
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA004', LIMIT_ID, AA_NUMBER, EXTERNAL_SYSTEM_ACCT_NO, trim(char(ACCT_SEQ)), 'LNF001', 
			'[H] Failed to find limit info for AA Number [' || AA_NUMBER || '] Facility Code [' || FACILITY_CODE 
			|| '] Facility Sequence [' || trim(char(FACILITY_SEQ)) || '] from CA003 interface file'
	FROM MIG_CA004 a
	WHERE is_valid = 'N'
	AND NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
	 		WHERE LMT_ID = a.LIMIT_ID
	  	  	AND source_id = 'RLOS'));
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA004', 'SIBS', 4);		
	commit;
	

    -----------------------------------------------------
	-- Check for non-existence common code
	-----------------------------------------------------
	UPDATE MIG_CA004 a set is_valid = 'N'
	where (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE fetch first row only)) 
	and a.is_valid = 'Y';
	
	commit;
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA004', LIMIT_ID, AA_NUMBER, EXTERNAL_SYSTEM_ACCT_NO, trim(char(ACCT_SEQ)), 'COM001',
		'[M] Non Existence Common Code: ' 
		|| GET_INVALID_COMMON_CODE_MSG('LOC_ORG_CODE', LOC_ORG_CODE, LOC_ORG_CAT)
	FROM MIG_CA004
       	WHERE (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE fetch first row only)));
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CA004', 'SIBS', 0);  
	
END@


/* ----------------------------------------------- Start of Collateral ---------------------------------------- */
CREATE PROCEDURE MIG_VALIDATE_CO001_AB
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO001_AB', 'SIBS', 1);
	
	UPDATE MIG_CO001_AB
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		-- OR length(SECURITY_REF_NOTE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(CUSTODIAN_TYPE)=0
		OR length(LEGAL_ENFORCEABILITY)=0
		OR (LEGAL_ENFORCEABILITY = 'Y' AND LEGAL_ENFORCEABILITY_DATE is null)
		--OR length(ASSET_TYPE_CODE)=0
		OR length(PURCHASE_PRICE)=0
		OR length(PURCHASE_PRICE_CURRENCY)=0
		OR length(MANUFACTURE_YEAR)=0
		--OR length(MODEL_NO)=0
		OR length(GOOD_STAT)=0
		OR length(REG_NO)=0
		--OR length(BRAND)=0
		OR length(PUBLIC_TRANSPORT)=0
		OR length(SECURITY_CUSTODIAN)=0
		OR length(PHY_INSPECTION_DONE)=0
		OR length(ENV_RISKY_STATUS)=0
        OR length(COLLATERAL_STATUS)=0;
		
	commit;
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO001', SECURITY_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		-- || BVL(SECURITY_REF_NOTE, '[SECURITY_REF_NOTE] ')
		|| BVL(CURRENCY, ' [CURRENCY] ')
		|| BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
		|| BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| BVL(CUSTODIAN_TYPE, ' [CUSTODIAN_TYPE] ')
		|| BVL(LEGAL_ENFORCEABILITY, ' [LEGAL_ENFORCEABILITY] ')
		|| (CASE WHEN LEGAL_ENFORCEABILITY='Y' THEN NVL2(char(LEGAL_ENFORCEABILITY_DATE), '', ' [LEGAL_ENFORCEABILITY_DATE] ') ELSE '' END)
		--|| BVL(ASSET_TYPE_CODE, ' [ASSET_TYPE_CODE] ')
		|| NVL2(char(PURCHASE_PRICE), '', ' [PURCHASE_PRICE] ')
		|| BVL(PURCHASE_PRICE_CURRENCY, ' [PURCHASE_PRICE_CURRENCY] ')
		|| NVL2(char(MANUFACTURE_YEAR), '', ' [MANUFACTURE_YEAR] ')
		--|| BVL(MODEL_NO, ' [MODEL_NO] ')
		|| BVL(GOOD_STAT, ' [GOOD_STAT] ')
		|| BVL(REG_NO, ' [REG_NO] ')
		--|| BVL(BRAND, ' [BRAND] ')
		|| BVL(PUBLIC_TRANSPORT, ' [PUBLIC_TRANSPORT] ')
		|| BVL(SECURITY_CUSTODIAN, ' [SECURITY_CUSTODIAN] ')
		|| BVL(PHY_INSPECTION_DONE, ' [PHY_INSPECTION_DONE] ')
		|| BVL(ENV_RISKY_STATUS, ' [ENV_RISKY_STATUS] ')
		|| BVL(COLLATERAL_STATUS, ' [COLLATERAL_STATUS] ')
		|| ' is/are empty.'
	FROM MIG_CO001_AB
	WHERE IS_VALID = 'N'
	AND (length(SECURITY_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(CUSTODIAN_TYPE)=0
		OR length(LEGAL_ENFORCEABILITY)=0
		OR (LEGAL_ENFORCEABILITY = 'Y' AND LEGAL_ENFORCEABILITY_DATE is null)
		OR length(PURCHASE_PRICE)=0
		OR length(PURCHASE_PRICE_CURRENCY)=0
		OR length(MANUFACTURE_YEAR)=0
		OR length(GOOD_STAT)=0
		OR length(REG_NO)=0
		OR length(PUBLIC_TRANSPORT)=0
		OR length(SECURITY_CUSTODIAN)=0
		OR length(PHY_INSPECTION_DONE)=0
		OR length(ENV_RISKY_STATUS)=0
        	OR length(COLLATERAL_STATUS)=0));
	
	commit;
	
	--------------------------------------------------------------
	-- Check for duplicate security Id records
	--------------------------------------------------------------
	UPDATE MIG_CO001_AB a set is_valid = 'N'
  	where a.SECURITY_ID in (select t.SECURITY_ID
  	from MIG_CO001_AB t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO001', SECURITY_ID, 'DUP001', 
		'[M] Duplicate security info for Asset Based Vehicle, Plant and Equipment Security ID [' 
	  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  	from MIG_CO001_AB where is_valid = 'N'
  	group by SECURITY_ID
  	having count(*) > 1);
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO001_AB', 'SIBS', 2);
	commit;
	
	UPDATE MIG_CO001_AB a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID fetch first row only)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(select current_timestamp, 'SIBS', 'CO001', a.SECURITY_ID, 'ACT001', 
			'[M] Security info for Security ID [' 
		  	|| a.SECURITY_ID || '] is already exists in other subtype for Collateral Name [' 
		  	|| t.SECURITY_REF_NOTE || '] , Source Security Sub Type ['
		  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
		  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO001_AB a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_ID = t.SECURITY_ID
    	and t.CMS_SECURITY_SUBTYPE_ID NOT IN ('AB101', 'AB102'));
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO001_AB', 'SIBS', 3);
	commit;
	
	--------------------------------------------------------------
	-- Check for duplicate collateral name records
	--------------------------------------------------------------
	UPDATE MIG_CO001_AB a set is_valid = 'N'
  	where a.SECURITY_REF_NOTE in (select t.SECURITY_REF_NOTE
  	from MIG_CO001_AB t
  	group by t.SECURITY_REF_NOTE
  	having count(*) > 1)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO001', SECURITY_REF_NOTE, 'DUP002', 
		'[M] Duplicate security info for Asset Based Vehicle, Plant and Equipment Collateral Name [' 
	  	|| SECURITY_REF_NOTE || '] - ' || trim(char(count(*))) || ' records found]'
  	from MIG_CO001_AB where is_valid = 'N'
  	group by SECURITY_REF_NOTE
  	having count(*) > 1);
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO001_AB', 'SIBS', 4);
	commit;
	
	UPDATE MIG_CO001_AB a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE fetch first row only)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO001', a.SECURITY_ID, a.SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in other subtype for Security ID [' 
	  	|| t.SECURITY_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO001_AB a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_REF_NOTE = t.SECURITY_REF_NOTE
    	and t.CMS_SECURITY_SUBTYPE_ID NOT IN ('AB101', 'AB102'));
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO001_AB', 'SIBS', 5);
	commit;
    
    -----------------------------------------------------
    -- Check for error mapping between source 
    -----------------------------------------------------
	UPDATE MIG_CO001_AB a set is_valid = 'N'
  	where not exists (select 1
  	from COMMON_CODE_CATEGORY_ENTRY t
  	where t.ENTRY_CODE = a.SOURCE_SECURITY_SUB_TYPE 
    and t.REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID
  	and t.CATEGORY_CODE = 'SOURCE_CMS_SEC_TYPE_MAP' fetch first row only)
  	and a.is_valid = 'Y';
    
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO001', SECURITY_ID, 'EMAP001', 
		'[H] Error mapping between Source Security Sub Type [' 
	  	|| SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type [' || CMS_SECURITY_SUBTYPE_ID || '] '
  	from MIG_CO001_AB a
    where not exists (select 1
  	from COMMON_CODE_CATEGORY_ENTRY t
  	where t.ENTRY_CODE = a.SOURCE_SECURITY_SUB_TYPE 
    and t.REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID
  	and t.CATEGORY_CODE = 'SOURCE_CMS_SEC_TYPE_MAP' fetch first row only)
  	AND IS_VALID = 'N');

	CALL LOG_PROC_TIME('MIG_VALIDATE_CO001_AB', 'SIBS', 6);
	commit;
    
    -----------------------------------------------------
    -- Check for non-existence common code
    -----------------------------------------------------
    -- only required if checking for Asset type code
    UPDATE MIG_CO001_AB a 
    SET asset_type_cat =
	(SELECT CASE REF_ENTRY_CODE
		WHEN 'AB101' THEN 'PLANT_EQUIP'
		WHEN 'AB102' THEN 'VEHICLE_TYPE'
		WHEN 'AB103' THEN 'AB_OTHERS_TYPE'
		END
	FROM COMMON_CODE_CATEGORY_ENTRY 
	WHERE CATEGORY_CODE = a.SOURCE_SEC_CAT
	AND ENTRY_CODE = a.source_security_sub_type
	and REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID);
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO001_AB', 'SIBS', 7);
	commit;	
    
    UPDATE MIG_CO001_AB a set is_valid = 'N'
    where ( 
    	    (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE  )) 
    	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE )) 
    	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GOODS_STATUS_CAT and entry_code = GOOD_STAT )) 
    	 OR (length(ASSET_TYPE_CODE) > 0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ASSET_TYPE_CAT and entry_code = ASSET_TYPE_CODE ))   --Remarked to skip validation
    	 --OR (length(MODEL_NO)>0 and  not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = MODEL_CAT and entry_code = MODEL_NO )) 
    	 --OR (length(BRAND)>0 and  not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = BRAND_CAT and entry_code = BRAND )) 
    	 -- OR (length(YARD)>0 and  not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = YARD_CAT and entry_code = YARD )) 
    	 --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PBT_PBR_CAT and entry_code = PBT_PBR_INDICATOR )) 
    	 --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = TRANSMISSION_CAT and entry_code = TRANSMISSION_TYPE )) 
    	 --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ENERGY_CAT and entry_code = ENERGY_SOURCE )) 
    	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COLLATERAL_STATUS_CAT and entry_code = COLLATERAL_STATUS )) 
    	) 
    	and a.is_valid = 'Y';
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO001', SECURITY_ID, 'COM001',
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('LOC_ORG_CODE', LOC_ORG_CODE, LOC_ORG_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('SOURCE_SEC', SOURCE_SECURITY_SUB_TYPE, SOURCE_SEC_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('GOODS_STATUS', GOOD_STAT, GOODS_STATUS_CAT)
			|| (CASE WHEN ASSET_TYPE_CAT is null THEN 'Unable to determine ASSET_TYPE_CAT for CMS Security Sub Type '|| CMS_SECURITY_SUBTYPE_ID ||' and Source Security Sub Type '|| SOURCE_SECURITY_SUB_TYPE ELSE GET_INVALID_COMMON_CODE_MSG('ASSET_TYPE_CODE', ASSET_TYPE_CODE, ASSET_TYPE_CAT) END)
			--|| GET_INVALID_COMMON_CODE_MSG('MODEL_NO', MODEL_NO, MODEL_CAT)
			--|| GET_INVALID_COMMON_CODE_MSG('BRAND', BRAND, BRAND_CAT)
            -- || (CASE WHEN length(YARD)>0 THEN GET_INVALID_COMMON_CODE_MSG('YARD', YARD, YARD_CAT) ELSE '' END)
			|| GET_INVALID_COMMON_CODE_MSG('COLLATERAL_STATUS', COLLATERAL_STATUS, COLLATERAL_STATUS_CAT)
	   FROM MIG_CO001_AB
       WHERE ( 
            (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE  )) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE )) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GOODS_STATUS_CAT and entry_code = GOOD_STAT )) 
    	 OR (length(ASSET_TYPE_CODE) > 0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ASSET_TYPE_CAT and entry_code = ASSET_TYPE_CODE )) 
    	 --OR (length(MODEL_NO)>0 and  not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = MODEL_CAT and entry_code = MODEL_NO )) 
    	 --OR (length(BRAND)>0 and  not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = BRAND_CAT and entry_code = BRAND )) 
         -- OR (length(YARD)>0 and  not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = YARD_CAT and entry_code = YARD )) 
         -- OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PBT_PBR_CAT and entry_code = PBT_PBR_INDICATOR )) 
         -- OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = TRANSMISSION_CAT and entry_code = TRANSMISSION_TYPE )) 
         -- OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ENERGY_CAT and entry_code = ENERGY_SOURCE )) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COLLATERAL_STATUS_CAT and entry_code = COLLATERAL_STATUS )) 
      )
      and is_valid = 'N'
      );
      	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO001_AB', 'SIBS', 8);
	commit;

	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------
	UPDATE MIG_CO001_AB a set is_valid = 'N'
	where ( (CUSTODIAN_TYPE not in ('I', 'E'))            
		 OR (LEGAL_ENFORCEABILITY not in ('Y', 'N', 'O'))            
		 OR (PUBLIC_TRANSPORT not in ('Y', 'N'))            
		 OR (PHY_INSPECTION_DONE not in ('Y', 'N'))            
		 OR (ENV_RISKY_STATUS not in ('Y', 'N', 'O'))            
		 OR (BORROWER_DEPENDENCY not in ('Y', 'N'))            
		 OR (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O'))            
		 OR (IS_CGC_PLEDGED not in ('Y', 'N'))            
	) 
	and a.is_valid = 'Y';
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO001', SECURITY_ID, 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| (CASE WHEN (CUSTODIAN_TYPE not in ('I', 'E')) THEN GET_INVALID_VALUE_MSG('CUSTODIAN_TYPE', CUSTODIAN_TYPE, 'I/E') ELSE '' END)
			|| (CASE WHEN (LEGAL_ENFORCEABILITY not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('LEGAL_ENFORCEABILITY', LEGAL_ENFORCEABILITY, 'Y/N/O') ELSE '' END)
			|| (CASE WHEN (PUBLIC_TRANSPORT not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('PUBLIC_TRANSPORT', PUBLIC_TRANSPORT, 'Y/N') ELSE '' END)
			|| (CASE WHEN (PHY_INSPECTION_DONE not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('PHY_INSPECTION_DONE', PHY_INSPECTION_DONE, 'Y/N') ELSE '' END)
			|| (CASE WHEN (ENV_RISKY_STATUS not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('ENV_RISKY_STATUS', ENV_RISKY_STATUS, 'Y/N/O') ELSE '' END)
			|| (CASE WHEN (BORROWER_DEPENDENCY not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('BORROWER_DEPENDENCY', BORROWER_DEPENDENCY, 'Y/N') ELSE '' END)
			|| (CASE WHEN (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('EXCHANGE_CONTROL_OBTAINED', EXCHANGE_CONTROL_OBTAINED, 'Y/N/O') ELSE '' END)
			|| (CASE WHEN (IS_CGC_PLEDGED not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('IS_CGC_PLEDGED', IS_CGC_PLEDGED, 'Y/N') ELSE '' END)
	   FROM MIG_CO001_AB
       WHERE ( 
                (CUSTODIAN_TYPE not in ('I', 'E'))             
             OR (LEGAL_ENFORCEABILITY not in ('Y', 'N', 'O'))            
             OR (PUBLIC_TRANSPORT not in ('Y', 'N'))            
             OR (PHY_INSPECTION_DONE not in ('Y', 'N'))            
             OR (ENV_RISKY_STATUS not in ('Y', 'N', 'O'))            
             OR (BORROWER_DEPENDENCY not in ('Y', 'N'))            
             OR (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O'))            
             OR (IS_CGC_PLEDGED not in ('Y', 'N'))            
      )
      AND IS_VALID = 'N'
      );
  
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO001_AB', 'SIBS', 0);
	
END@


CREATE PROCEDURE MIG_VALIDATE_CO002_AB_GOLD
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO002_AB_GOLD', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CO002_AB_GOLD
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
		OR length(CMS_SECURITY_SUBTYPE_ID)=0
		-- OR length(SECURITY_REF_NOTE)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(CUSTODIAN_TYPE)=0
		OR length(LEGAL_ENFORCEABILITY)=0
		OR (LEGAL_ENFORCEABILITY = 'Y' AND LEGAL_ENFORCEABILITY_DATE is null)
		OR length(ASSET_TYPE_CODE)=0
		OR length(PURCHASE_PRICE)=0
		OR length(PURCHASE_PRICE_CURRENCY)=0
		OR length(GOLD_UNIT_PRICE)=0
		OR length(GOLD_UNIT_PRICE_UOM)=0
		OR length(GOLD_WEIGHT_UOM)=0
		OR length(SECURITY_CUSTODIAN)=0
		OR length(ENV_RISKY_STATUS)=0
		OR length(PHY_INSPECTION_DONE)=0
		OR length(COLLATERAL_STATUS)=0;		
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO002', SECURITY_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| BVL(CMS_SECURITY_SUBTYPE_ID, ' [CMS_SECURITY_SUBTYPE_ID] ')
		-- || BVL(SECURITY_REF_NOTE, '[SECURITY_REF_NOTE] ')
		|| BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| BVL(CURRENCY, ' [CURRENCY] ')
		|| BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
		|| BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| BVL(CUSTODIAN_TYPE, ' [CUSTODIAN_TYPE] ')
		|| BVL(LEGAL_ENFORCEABILITY, ' [LEGAL_ENFORCEABILITY] ')
		|| (CASE WHEN LEGAL_ENFORCEABILITY='Y' THEN NVL2(CHAR(LEGAL_ENFORCEABILITY_DATE), '', ' [LEGAL_ENFORCEABILITY_DATE] ') ELSE '' END)
		|| BVL(ASSET_TYPE_CODE, ' [ASSET_TYPE_CODE] ')
		|| NVL2(char(PURCHASE_PRICE), '', ' [PURCHASE_PRICE] ')
		|| BVL(PURCHASE_PRICE_CURRENCY, ' [PURCHASE_PRICE_CURRENCY] ')
		|| NVL2(char(GOLD_UNIT_PRICE), '', ' [GOLD_UNIT_PRICE] ')
		|| BVL(GOLD_UNIT_PRICE_UOM, ' [GOLD_UNIT_PRICE_UOM] ')
		|| BVL(GOLD_WEIGHT_UOM, ' [GOLD_WEIGHT_UOM] ')
		|| BVL(SECURITY_CUSTODIAN, ' [SECURITY_CUSTODIAN] ')
		|| BVL(ENV_RISKY_STATUS, ' [ENV_RISKY_STATUS] ')
		|| BVL(PHY_INSPECTION_DONE, ' [PHY_INSPECTION_DONE] ')
		|| BVL(COLLATERAL_STATUS, ' [COLLATERAL_STATUS] ')
		|| ' is/are empty.'
	FROM MIG_CO002_AB_GOLD
	WHERE IS_VALID = 'N'
	AND (length(SECURITY_ID)=0
		OR length(CMS_SECURITY_SUBTYPE_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(CUSTODIAN_TYPE)=0
		OR length(LEGAL_ENFORCEABILITY)=0
		OR (LEGAL_ENFORCEABILITY = 'Y' AND LEGAL_ENFORCEABILITY_DATE is null)
		OR length(ASSET_TYPE_CODE)=0
		OR length(PURCHASE_PRICE)=0
		OR length(PURCHASE_PRICE_CURRENCY)=0
		OR length(GOLD_UNIT_PRICE)=0
		OR length(GOLD_UNIT_PRICE_UOM)=0
		OR length(GOLD_WEIGHT_UOM)=0
		OR length(SECURITY_CUSTODIAN)=0
		OR length(ENV_RISKY_STATUS)=0
		OR length(PHY_INSPECTION_DONE)=0
		OR length(COLLATERAL_STATUS)=0));
	
	commit;
	
	-----------------------------------------
	-- Check for duplicate security Id records
	--
	-----------------------------------------
	UPDATE MIG_CO002_AB_GOLD a set is_valid = 'N'
  	where a.SECURITY_ID in (select t.SECURITY_ID
  	from MIG_CO002_AB_GOLD t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO002', SECURITY_ID, 'DUP001', 
		'[M] Duplicate security info for Asset Based Gold Security ID [' 
  	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  	from MIG_CO002_AB_GOLD where is_valid = 'N'
  	group by SECURITY_ID
  	having count(*) > 1);
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO002_AB_GOLD', 'SIBS', 2);
	commit;
	
	UPDATE MIG_CO002_AB_GOLD a set is_valid = 'N'
  	where exists (select 1 from CMS_SECURITY t
		where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID fetch first row only)
		and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO002', a.SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in other subtype for Collateral Name [' 
	  	|| t.SECURITY_REF_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO002_AB_GOLD a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_ID = t.SECURITY_ID
    	and t.CMS_SECURITY_SUBTYPE_ID <> 'AB110');
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO002_AB_GOLD', 'SIBS', 3);
	commit;
	
	--------------------------------------------------------------
	-- Check for duplicate collateral name records
	--
	--------------------------------------------------------------
	UPDATE MIG_CO002_AB_GOLD a set is_valid = 'N'
  	where a.SECURITY_REF_NOTE in (select t.SECURITY_REF_NOTE
  	from MIG_CO002_AB_GOLD t
  	group by t.SECURITY_REF_NOTE
  	having count(*) > 1)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO002', SECURITY_REF_NOTE, 'DUP002', 
		'[M] Duplicate security info for Asset Based Gold Collateral Name [' 
	  	|| SECURITY_REF_NOTE || '] - ' || trim(char(count(*))) || ' records found]'
  	from MIG_CO002_AB_GOLD where is_valid = 'N'
  	group by SECURITY_REF_NOTE
  	having count(*) > 1);
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO002_AB_GOLD', 'SIBS', 4);
	commit;
	
	UPDATE MIG_CO002_AB_GOLD a set is_valid = 'N'
  	where exists (select 1 from CMS_SECURITY t
	  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE fetch first row only)
	  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO002', a.SECURITY_ID, a.SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in other subtype for Security ID [' 
	  	|| t.SECURITY_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO002_AB_GOLD a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_REF_NOTE = t.SECURITY_REF_NOTE
    	and t.CMS_SECURITY_SUBTYPE_ID <> 'AB110');
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO002_AB_GOLD', 'SIBS', 5);
	commit;
	
	-----------------------------------------------------
	-- Check for error mapping between source 
	-----------------------------------------------------
	UPDATE MIG_CO002_AB_GOLD a set is_valid = 'N'
  	where not exists (select 1
  	from COMMON_CODE_CATEGORY_ENTRY t
  	where t.ENTRY_CODE = a.SOURCE_SECURITY_SUB_TYPE 
    	and t.REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID
  	and t.CATEGORY_CODE = 'SOURCE_CMS_SEC_TYPE_MAP')
  	and a.is_valid = 'Y';
	
	commit;
    
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO002', SECURITY_ID, 'EMAP001', 
		'[H] Error mapping between Source Security Sub Type [' 
	  	|| SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type [' || CMS_SECURITY_SUBTYPE_ID || '] '
  	from MIG_CO002_AB_GOLD a
    	where not exists (select 1
  	from COMMON_CODE_CATEGORY_ENTRY t
  	where t.ENTRY_CODE = a.SOURCE_SECURITY_SUB_TYPE 
    	and t.REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID
  	and t.CATEGORY_CODE = 'SOURCE_CMS_SEC_TYPE_MAP'));
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO002_AB_GOLD', 'SIBS', 6);
	commit;	

	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------
	UPDATE MIG_CO002_AB_GOLD a set is_valid = 'N'
	where ((CUSTODIAN_TYPE not in ('I', 'E'))
	  OR  (LEGAL_ENFORCEABILITY not in ('Y', 'N', 'O'))
	  OR  (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O'))
	) 
	and a.is_valid = 'Y';

      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO002', SECURITY_ID, 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| (CASE WHEN (CUSTODIAN_TYPE not in ('I', 'E')) THEN GET_INVALID_VALUE_MSG('CUSTODIAN_TYPE', CUSTODIAN_TYPE, 'I/E') ELSE '' END)
			|| (CASE WHEN (LEGAL_ENFORCEABILITY not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('LEGAL_ENFORCEABILITY', LEGAL_ENFORCEABILITY, 'Y/N/O') ELSE '' END)
			|| (CASE WHEN (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('EXCHANGE_CONTROL_OBTAINED', EXCHANGE_CONTROL_OBTAINED, 'Y/N/O') ELSE '' END)
	FROM MIG_CO002_AB_GOLD
        WHERE ( 
              (CUSTODIAN_TYPE not in ('I', 'E'))
          OR  (LEGAL_ENFORCEABILITY not in ('Y', 'N', 'O'))
          OR  (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O'))
        ));
      
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO002_AB_GOLD', 'SIBS', 7);
	commit;
	
	-----------------------------------------------------
	-- Check for non-existence common code
	-----------------------------------------------------
	UPDATE MIG_CO002_AB_GOLD a set is_valid = 'N'
	where ( 
		(not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOG_ORG_CAT and entry_code = LOC_ORG_CODE  )) 
	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE )) 
	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ASSET_TYPE_CAT and entry_code = ASSET_TYPE_CODE )) 
	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GOLD_UOM_CAT and entry_code = GOLD_UNIT_PRICE_UOM )) 
	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GOLD_UOM_CAT and entry_code = GOLD_WEIGHT_UOM )) 
	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COL_STATUS_CAT and entry_code = COLLATERAL_STATUS )) 
	 OR (CUSTODIAN_TYPE = 'I' AND not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = '40' and entry_code = SECURITY_CUSTODIAN )) 
	) 
	and a.is_valid = 'Y';
      
	commit;
	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO002', SECURITY_ID, 'COM001',
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('LOC_ORG_CODE', LOC_ORG_CODE, LOG_ORG_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('SOURCE_SECURITY_SUB_TYPE', SOURCE_SECURITY_SUB_TYPE, SOURCE_SEC_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('ASSET_TYPE_CODE', ASSET_TYPE_CODE, ASSET_TYPE_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('GOLD_UNIT_PRICE_UOM', GOLD_UNIT_PRICE_UOM, GOLD_UOM_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('GOLD_WEIGHT_UOM', GOLD_WEIGHT_UOM, GOLD_UOM_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('COLLATERAL_STATUS', COLLATERAL_STATUS, COL_STATUS_CAT)
            || (CASE WHEN CUSTODIAN_TYPE='I' THEN GET_INVALID_COMMON_CODE_MSG('SECURITY_CUSTODIAN', SECURITY_CUSTODIAN, '40') ELSE '' END)            
	FROM MIG_CO002_AB_GOLD
       	WHERE ( 
    	    (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOG_ORG_CAT and entry_code = LOC_ORG_CODE  )) 
    	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE )) 
    	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ASSET_TYPE_CAT and entry_code = ASSET_TYPE_CODE )) 
    	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GOLD_UOM_CAT and entry_code = GOLD_UNIT_PRICE_UOM )) 
    	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = GOLD_UOM_CAT and entry_code = GOLD_WEIGHT_UOM )) 
    	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COL_STATUS_CAT and entry_code = COLLATERAL_STATUS )) 
         OR (CUSTODIAN_TYPE = 'I' AND not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = '40' and entry_code = SECURITY_CUSTODIAN )) 
      	));
      	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO002_AB_GOLD', 'SIBS', 0);
	
END@


CREATE PROCEDURE MIG_VALIDATE_CO005_CS
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO005_CS', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CO005_CS
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
		OR length(CMS_SECURITY_SUBTYPE_ID)=0
		-- OR length(SECURITY_REF_NOTE)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(CUSTODIAN_TYPE)=0
		OR length(CUSTODIAN)=0
		OR length(LEGAL_ENFORCEBILITY)=0
		OR (LEGAL_ENFORCEBILITY = 'Y' AND LEGAL_ENFORCEBILITY_DATE is null)
		--OR SECURITY_PERFECTION_DATE is null
		OR length(INTEREST_CAPITAL)=0
		-- OR length(IS_OWN_BANK)=0
		--OR length(REF_NO)=0
		--OR length(GROUP_ACCOUNT_NO)=0
		OR length(AMT_CURRENCY)=0
		OR length(DEPOSIT_AMT)=0
		--OR (IS_OWN_BANK = 'Y' AND TENURE is null)                 -- remarked due to updated rules: but original checking against null is wrong - should check length
		--OR (IS_OWN_BANK = 'Y' AND TENURE_UNIT is null)        -- remarked due to updated rules: but original checking against null is wrong - should check length
		OR length(DESCRIPTION)=0
		--OR length(ISSUER)=0
		--OR length(HOLD_STATUS)=0
		OR length(COLLATERAL_STATUS)=0;
		
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO005', SECURITY_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| BVL(CMS_SECURITY_SUBTYPE_ID, ' [CMS_SECURITY_SUBTYPE_ID] ')
		-- || BVL(SECURITY_REF_NOTE, ' [SECURITY_REF_NOTE] ')
		|| BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| BVL(CURRENCY, ' [CURRENCY] ')
		|| BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
		|| BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| BVL(CUSTODIAN_TYPE, ' [CUSTODIAN_TYPE] ')
		|| BVL(LEGAL_ENFORCEBILITY, ' [LEGAL_ENFORCEABILITY] ')
		|| (CASE WHEN LEGAL_ENFORCEBILITY='Y' THEN NVL2(char(LEGAL_ENFORCEBILITY_DATE), '', ' [LEGAL_ENFORCEBILITY_DATE] ') ELSE '' END)
		--|| NVL2(char(SECURITY_PERFECTION_DATE), '', ' [SECURITY_PERFECTION_DATE] ')	
		|| BVL(INTEREST_CAPITAL, ' [INTEREST_CAPITAL] ')	
		-- || BVL(IS_OWN_BANK, ' [IS_OWN_BANK] ')
		--|| BVL(REF_NO, ' [REF_NO] ')
		--|| BVL(GROUP_ACCOUNT_NO, ' [GROUP_ACCOUNT_NO] ')
		|| BVL(AMT_CURRENCY, ' [AMT_CURRENCY] ')
		|| BVL(char(DEPOSIT_AMT), ' [DEPOSIT_AMT] ')
		--|| (CASE WHEN IS_OWN_BANK='Y' THEN BVL(char(TENURE), ' [TENURE] ') ELSE '' END)
		--|| (CASE WHEN IS_OWN_BANK='Y' THEN BVL(TENURE_UNIT, ' [TENURE_UNIT] ') ELSE '' END)
		|| BVL(DESCRIPTION, ' [DESCRIPTION] ')
		--|| BVL(ISSUER, ' [ISSUER] ')
		--|| BVL(HOLD_STATUS, ' [HOLD_STATUS] ')
		|| BVL(COLLATERAL_STATUS, ' [COLLATERAL_STATUS] ')
		|| ' is/are empty.'		
	FROM MIG_CO005_CS
	WHERE IS_VALID = 'N'
	AND (length(SECURITY_ID)=0
		OR length(CMS_SECURITY_SUBTYPE_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(CUSTODIAN_TYPE)=0
		OR length(CUSTODIAN)=0
		OR length(LEGAL_ENFORCEBILITY)=0
		OR (LEGAL_ENFORCEBILITY = 'Y' AND LEGAL_ENFORCEBILITY_DATE is null)
		OR length(INTEREST_CAPITAL)=0
		OR length(AMT_CURRENCY)=0
		OR length(DEPOSIT_AMT)=0
		OR length(DESCRIPTION)=0
		OR length(COLLATERAL_STATUS)=0));

	commit;
	-----------------------------------------
	-- Check for duplicate security Id records
	-----------------------------------------
	
	UPDATE MIG_CO005_CS a set is_valid = 'N'
    	where a.SECURITY_ID in 
        (select t.SECURITY_ID
      	from MIG_CO005_CS t
      	group by t.SECURITY_ID
      	having count(*) > 1)
    	and a.is_valid = 'Y';
  	
    	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
    	(select current_timestamp, 'SIBS', 'CO005', SECURITY_ID, 'DUP001', 
    	    '[M] Duplicate security info for Deposit Security ID [' 
    	|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
    	from MIG_CO005_CS where is_valid = 'N'
    	group by SECURITY_ID
    	having count(*) > 1);
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO005_CS', 'SIBS', 2);
	commit;

	UPDATE MIG_CO005_CS a set is_valid = 'N'
  	where exists (select 1
	  	from CMS_SECURITY t
	  	where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID fetch first row only)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO005', a.SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in other subtype for Collateral Name [' 
	  	|| t.SECURITY_REF_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO005_CS a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_ID = t.SECURITY_ID
    	and t.SUBTYPE <> 'CS');
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO005_CS', 'SIBS', 3);
	commit;
	
	--------------------------------------------------------------
	-- Check for duplicate collateral name records
	--
	--------------------------------------------------------------
	UPDATE MIG_CO005_CS a set is_valid = 'N'
  	where a.SECURITY_REF_NOTE in (select t.SECURITY_REF_NOTE
  	from MIG_CO005_CS t
  	group by t.SECURITY_REF_NOTE
  	having count(*) > 1)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO005', SECURITY_REF_NOTE, 'DUP002', 
		'[M] Duplicate security info for Deposit Collateral Name [' 
	  	|| SECURITY_REF_NOTE || '] - ' || trim(char(count(*))) || ' records found]'
  	from MIG_CO005_CS where is_valid = 'N'
  	group by SECURITY_REF_NOTE
  	having count(*) > 1);
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO005_CS', 'SIBS', 4);
	commit;
	
	UPDATE MIG_CO005_CS a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO005', a.SECURITY_ID, a.SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in other subtype for Security ID [' 
	  	|| t.SECURITY_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO005_CS a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_REF_NOTE = t.SECURITY_REF_NOTE
    	and t.SUBTYPE <> 'CS');
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO005_CS', 'SIBS', 5);
	commit;
	
    	-----------------------------------------------------
    	-- Check for error mapping between source 
    	-----------------------------------------------------
	UPDATE MIG_CO005_CS a set is_valid = 'N'
  	where not exists (select 1
  	from COMMON_CODE_CATEGORY_ENTRY t
  	where t.ENTRY_CODE = a.SOURCE_SECURITY_SUB_TYPE 
    	and t.REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID
  	and t.CATEGORY_CODE = 'SOURCE_CMS_SEC_TYPE_MAP')
  	and a.is_valid = 'Y';
    
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO005', SECURITY_ID, 'EMAP001', 
		'[H] Error mapping between Source Security Sub Type [' 
	  	|| SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type [' || CMS_SECURITY_SUBTYPE_ID || '] '
  	from MIG_CO005_CS a
    	where not exists (select 1
  	from COMMON_CODE_CATEGORY_ENTRY t
  	where t.ENTRY_CODE = a.SOURCE_SECURITY_SUB_TYPE 
    	and t.REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID
  	and t.CATEGORY_CODE = 'SOURCE_CMS_SEC_TYPE_MAP'));
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO005_CS', 'SIBS', 6);
	commit;

	-----------------------------------------------------
	-- Check for non-existence common code
	-----------------------------------------------------
	UPDATE MIG_CO005_CS a set is_valid = 'N'
	where ( 
		(not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE  )) 
	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE )) 
	 -- OR (length(IS_OWN_BANK)>0 and IS_OWN_BANK='Y' and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = TENURE_CAT and entry_code = TENURE_UNIT )) 
	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CHARGE_TYPE_CAT and entry_code = CHARGE_TYPE )) 
	 OR (length(CHARGE_NATURE)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CHARGE_NATURE_CAT and entry_code = CHARGE_NATURE )) 
	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COLLATERAL_STATUS_CAT and entry_code = COLLATERAL_STATUS )) 
	 OR (CUSTODIAN_TYPE = 'I' AND not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = '40' and entry_code = CUSTODIAN )) 
	) 
	and a.is_valid = 'Y';
	
	commit;
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO005', SECURITY_ID, 'COM001',
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('LOC_ORG_CODE', LOC_ORG_CODE, LOC_ORG_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('SOURCE_SECURITY_SUB_TYPE', SOURCE_SECURITY_SUB_TYPE, SOURCE_SEC_CAT)
            -- ||(CASE WHEN length(IS_OWN_BANK)>0 and IS_OWN_BANK='Y' THEN GET_INVALID_COMMON_CODE_MSG('TENURE_UNIT', TENURE_UNIT, TENURE_CAT) ELSE '' END)            
			|| GET_INVALID_COMMON_CODE_MSG('CHARGE_TYPE', CHARGE_TYPE, CHARGE_TYPE_CAT)
			|| (CASE WHEN length(CHARGE_NATURE)>0 THEN GET_INVALID_COMMON_CODE_MSG('CHARGE_NATURE', CHARGE_NATURE, CHARGE_NATURE_CAT) ELSE '' END)
            ||(CASE WHEN CUSTODIAN_TYPE='I' THEN GET_INVALID_COMMON_CODE_MSG('CUSTODIAN', CUSTODIAN, '40') ELSE '' END)            
			|| GET_INVALID_COMMON_CODE_MSG('COLLATERAL_STATUS', COLLATERAL_STATUS, COLLATERAL_STATUS_CAT)
	   FROM MIG_CO005_CS
       WHERE ( 
            (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE  )) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE )) 
         -- OR (length(IS_OWN_BANK)>0 and IS_OWN_BANK='Y' and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = TENURE_CAT and entry_code = TENURE_UNIT )) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CHARGE_TYPE_CAT and entry_code = CHARGE_TYPE )) 
         OR (length(CHARGE_NATURE)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CHARGE_NATURE_CAT and entry_code = CHARGE_NATURE )) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COLLATERAL_STATUS_CAT and entry_code = COLLATERAL_STATUS )) 
         OR (CUSTODIAN_TYPE = 'I' AND not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = '40' and entry_code = CUSTODIAN )) 
      ));
      	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO005_CS', 'SIBS', 7);
	commit;		
        
	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------
	UPDATE MIG_CO005_CS a set is_valid = 'N'
	where ( 
			(IS_OWN_BANK not in ('Y', 'N'))
		 OR (CUSTODIAN_TYPE not in ('I', 'E'))            
		 OR (LEGAL_ENFORCEBILITY not in ('Y', 'N', 'O'))            
		 OR (INTEREST_CAPITAL not in ('Y', 'N'))            
		 OR (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O'))            
		 OR (BORROWER_DEPENDENCY not in ('Y', 'N'))            
		 OR (IS_CGC_PLEDGED not in ('Y', 'N'))            
		 -- OR (HOLD_STATUS not in ('L', 'C'))            //Remarked to skip checking
	) 
	and a.is_valid = 'Y';

	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO005', SECURITY_ID, 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| (CASE WHEN (IS_OWN_BANK not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('IS_OWN_BANK', IS_OWN_BANK, 'Y/N') ELSE '' END)
			|| (CASE WHEN (CUSTODIAN_TYPE not in ('I', 'E')) THEN GET_INVALID_VALUE_MSG('CUSTODIAN_TYPE', CUSTODIAN_TYPE, 'I/E') ELSE '' END)
			|| (CASE WHEN (LEGAL_ENFORCEBILITY not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('LEGAL_ENFORCEBILITY', LEGAL_ENFORCEBILITY, 'Y/N/O') ELSE '' END)
			|| (CASE WHEN (INTEREST_CAPITAL not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('INTEREST_CAPITAL', INTEREST_CAPITAL, 'Y/N') ELSE '' END)
			|| (CASE WHEN (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('EXCHANGE_CONTROL_OBTAINED', EXCHANGE_CONTROL_OBTAINED, 'Y/N/O') ELSE '' END)
			|| (CASE WHEN (BORROWER_DEPENDENCY not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('BORROWER_DEPENDENCY', BORROWER_DEPENDENCY, 'Y/N') ELSE '' END)
			|| (CASE WHEN (IS_CGC_PLEDGED not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('IS_CGC_PLEDGED', IS_CGC_PLEDGED, 'Y/N') ELSE '' END)
			-- || GET_INVALID_VALUE_MSG('HOLD_CODE', HOLD_STATUS, 'L/C')           //Remarked to skip checking
	   FROM MIG_CO005_CS
       WHERE ( 
                (IS_OWN_BANK not in ('Y', 'N'))
             OR (CUSTODIAN_TYPE not in ('I', 'E'))            
             OR (LEGAL_ENFORCEBILITY not in ('Y', 'N', 'O'))            
             OR (INTEREST_CAPITAL not in ('Y', 'N'))            
             OR (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O'))            
             OR (BORROWER_DEPENDENCY not in ('Y', 'N'))            
             OR (IS_CGC_PLEDGED not in ('Y', 'N'))            
             -- OR (HOLD_STATUS not in ('L', 'C'))             //Remarked to skip checking          
      ));
        
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO005_CS', 'SIBS', 0);
	
END@


CREATE PROCEDURE MIG_VALIDATE_CO008_MS
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO008_MS', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CO008_MS
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		-- OR length(SECURITY_REF_NOTE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(TYPE)=0
		OR length(NUMBER_OF_UNITS)=0
		-- OR length(STOCK_CODE_BOND_CODE)=0
		OR length(IS_LEGAL_ENFORCE)=0
		OR (IS_LEGAL_ENFORCE='Y' AND IS_LEGAL_ENFORCE_DATE is null)
		OR length(SECURITY_REFERRED)=0
		OR length(CUSTODIAN_TYPE)=0
		-- OR length(ISSUER_NAME)=0
		OR length(CHARGE_TYPE)=0
		OR length(COLLATERAL_STATUS)=0;
        -- OR (GOVT_GUARANTEE='Y' AND length(NAME_OF_GOVT)=0);
		
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO008', SECURITY_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| BVL(SOURCE_SECURITY_SUB_TYPE, ' [SOURCE_SECURITY_SUB_TYPE] ')
		-- || BVL(SECURITY_REF_NOTE, ' [SECURITY_REF_NOTE] ')
		|| BVL(CURRENCY, ' [CURRENCY] ')
		|| BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
		|| BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| BVL(TYPE, ' [TYPE] ')			
		|| NVL2(char(NUMBER_OF_UNITS), '', ' [NUMBER_OF_UNITS] ')	
		|| BVL(STOCK_EXCHANGE_BOND_MARKET, ' [STOCK_EXCHANGE_BOND_MARKET] ')	
		-- || BVL(STOCK_CODE_BOND_CODE, ' [STOCK_CODE_BOND_CODE] ')			
		|| BVL(IS_LEGAL_ENFORCE, ' [IS_LEGAL_ENFORCE] ')
		|| (CASE WHEN IS_LEGAL_ENFORCE='Y' THEN NVL2(char(IS_LEGAL_ENFORCE_DATE), '', ' [IS_LEGAL_ENFORCE_DATE] ') ELSE '' END)
		|| BVL(SECURITY_REFERRED, ' [SECURITY_REFERRED] ')
		|| BVL(CUSTODIAN_TYPE, ' [CUSTODIAN_TYPE] ')
		-- || BVL(ISSUER_NAME, ' [ISSUER_NAME] ')			
		|| BVL(CHARGE_TYPE, ' [CHARGE_TYPE] ')
		|| BVL(COLLATERAL_STATUS, ' [COLLATERAL_STATUS] ')			
		-- || BVL(GOVT_GUARANTEE, ' [GOVT_GUARANTEE] ')			
		-- || (CASE WHEN GOVT_GUARANTEE='Y' THEN BVL(NAME_OF_GOVT, ' [NAME_OF_GOVT] ') ELSE '' END)
		|| ' is/are empty.'						
	FROM MIG_CO008_MS
	WHERE IS_VALID = 'N'
	AND (length(SECURITY_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(TYPE)=0
		OR length(NUMBER_OF_UNITS)=0
		-- OR length(STOCK_CODE_BOND_CODE)=0
		OR length(IS_LEGAL_ENFORCE)=0
		OR (IS_LEGAL_ENFORCE='Y' AND IS_LEGAL_ENFORCE_DATE is null)
		OR length(SECURITY_REFERRED)=0
		OR length(CUSTODIAN_TYPE)=0
		OR length(CHARGE_TYPE)=0
		OR length(COLLATERAL_STATUS)=0));

	CALL LOG_PROC_TIME('MIG_VALIDATE_CO008_MS', 'SIBS', 2);
    COMMIT;
    
	-----------------------------------------
	-- Check for duplicate security Id records
	-----------------------------------------
	
	UPDATE MIG_CO008_MS a set is_valid = 'N'
    	where a.SECURITY_ID in (select t.SECURITY_ID
                            from MIG_CO008_MS t
                            group by t.SECURITY_ID
                            having count(*) > 1)
    	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO008', SECURITY_ID, 'DUP001', 
		'[M] Duplicate security info for Marketable Securities-Stocks Security ID [' 
  		|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  	from MIG_CO008_MS where is_valid = 'N'
  	group by SECURITY_ID
  	having count(*) > 1);
  
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO008_MS', 'SIBS', 3);
	COMMIT;
  
	UPDATE MIG_CO008_MS a set is_valid = 'N'
  	where exists (select 1
	  	from CMS_SECURITY t
	  	where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID fetch first row only)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO008', a.SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in other subtype for Collateral Name [' 
	  	|| t.SECURITY_REF_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO008_MS a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_ID = t.SECURITY_ID
    	and t.SUBTYPE <> 'MS');
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO008_MS', 'SIBS', 4);
	commit;
	
	--------------------------------------------------------------
	-- Check for duplicate collateral name records
	--
	--------------------------------------------------------------
	UPDATE MIG_CO008_MS a set is_valid = 'N'
  	where a.SECURITY_REF_NOTE in (select t.SECURITY_REF_NOTE
  	from MIG_CO008_MS t
  	group by t.SECURITY_REF_NOTE
  	having count(*) > 1)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO008', SECURITY_REF_NOTE, 'DUP002', 
		'[M] Duplicate security info for Marketable Securities-Stocks Collateral Name [' 
	  	|| SECURITY_REF_NOTE || '] - ' || trim(char(count(*))) || ' records found]'
  	from MIG_CO008_MS where is_valid = 'N'
  	group by SECURITY_REF_NOTE
  	having count(*) > 1);
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO008_MS', 'SIBS', 5);
	commit;
	
	UPDATE MIG_CO008_MS a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO008', a.SECURITY_ID, a.SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in other subtype for Security ID [' 
	  	|| t.SECURITY_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO008_MS a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_REF_NOTE = t.SECURITY_REF_NOTE
    	and t.SUBTYPE <> 'MS');
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO008_MS', 'SIBS', 6);
	commit;
	
    	-----------------------------------------------------
    	-- Check for non-existence common code
    	-----------------------------------------------------
	UPDATE MIG_CO008_MS a set is_valid = 'N'
	where ( 
            (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE fetch first row only)) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE fetch first row only)) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CHARGE_TYPE_CAT and entry_code = CHARGE_TYPE fetch first row only)) 
         OR (length(CHARGE_NATURE)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CHARGE_NATURE_CAT and entry_code = CHARGE_NATURE fetch first row only)) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COLLATERAL_STATUS_CAT and entry_code = COLLATERAL_STATUS fetch first row only)) 
      	) 
      	and a.is_valid = 'Y';
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO008', SECURITY_ID, 'COM001',
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('LOC_ORG_CODE', LOC_ORG_CODE, LOC_ORG_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('SOURCE_SECURITY_SUB_TYPE', SOURCE_SECURITY_SUB_TYPE, SOURCE_SEC_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('CHARGE_TYPE', CHARGE_TYPE, CHARGE_TYPE_CAT)
            || (CASE WHEN length(CHARGE_NATURE)>0 THEN GET_INVALID_COMMON_CODE_MSG('CHARGE_NATURE', CHARGE_NATURE, CHARGE_NATURE_CAT) ELSE '' END)
			|| GET_INVALID_COMMON_CODE_MSG('COLLATERAL_STATUS', COLLATERAL_STATUS, COLLATERAL_STATUS_CAT)
	FROM MIG_CO008_MS
        WHERE ( 
            (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE fetch first row only)) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE fetch first row only)) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CHARGE_TYPE_CAT and entry_code = CHARGE_TYPE fetch first row only)) 
         OR (length(CHARGE_NATURE)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CHARGE_NATURE_CAT and entry_code = CHARGE_NATURE fetch first row only)) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COLLATERAL_STATUS_CAT and entry_code = COLLATERAL_STATUS fetch first row only)) 
        ));
      	

	CALL LOG_PROC_TIME('MIG_VALIDATE_CO008_MS', 'SIBS', 7);
    	COMMIT;
        
	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------
	UPDATE MIG_CO008_MS a set is_valid = 'N'
	where ( 
                (TYPE not in ('U', 'S'))
             OR (RECOGNIZED_EXCHANGE not in ('Y', 'N'))            
             OR (IS_LEGAL_ENFORCE not in ('Y', 'N', 'O'))            
             OR (BORROWER_DEPENDENCY not in ('Y', 'N'))            
             OR (IS_CGC_PLEDGED not in ('Y', 'N'))            
             OR (SECURITY_REFERRED not in ('Y', 'N'))            
             OR (CUSTODIAN_TYPE not in ('I', 'E'))            
             OR (LOCAL_EXCHANGE not in ('Y', 'N'))            
             OR (BASEL_COMPLIANT_TEXT not in ('Y', 'N', 'O'))            
             OR (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O'))   
             -- OR (GOVT_GUARANTEE not in ('Y', 'N'))            
      	) 
      	and a.is_valid = 'Y';

      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO008', SECURITY_ID, 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| (CASE WHEN (TYPE not in ('U', 'S')) THEN GET_INVALID_VALUE_MSG('TYPE', TYPE, 'U/S') ELSE '' END)
			|| (CASE WHEN (RECOGNIZED_EXCHANGE not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('RECOGNIZED_EXCHANGE', RECOGNIZED_EXCHANGE, 'Y/N') ELSE '' END)
			|| (CASE WHEN (IS_LEGAL_ENFORCE not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('IS_LEGAL_ENFORCE', IS_LEGAL_ENFORCE, 'Y/N/O') ELSE '' END)
			|| (CASE WHEN (BORROWER_DEPENDENCY not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('BORROWER_DEPENDENCY', BORROWER_DEPENDENCY, 'Y/N') ELSE '' END)
			|| (CASE WHEN (IS_CGC_PLEDGED not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('IS_CGC_PLEDGED', IS_CGC_PLEDGED, 'Y/N') ELSE '' END)
			|| (CASE WHEN (SECURITY_REFERRED not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('SECURITY_REFERRED', SECURITY_REFERRED, 'Y/N') ELSE '' END)
			|| (CASE WHEN (CUSTODIAN_TYPE not in ('I', 'E')) THEN GET_INVALID_VALUE_MSG('CUSTODIAN_TYPE', CUSTODIAN_TYPE, 'I/E') ELSE '' END)
			|| (CASE WHEN (LOCAL_EXCHANGE not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('LOCAL_EXCHANGE', LOCAL_EXCHANGE, 'Y/N') ELSE '' END)
			|| (CASE WHEN (BASEL_COMPLIANT_TEXT not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('BASEL_COMPLIANT_TEXT', BASEL_COMPLIANT_TEXT, 'Y/N/O') ELSE '' END)
			|| (CASE WHEN (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('EXCHANGE_CONTROL_OBTAINED', EXCHANGE_CONTROL_OBTAINED, 'Y/N/O') ELSE '' END)
			-- || GET_INVALID_VALUE_MSG('GOVT_GUARANTEE', GOVT_GUARANTEE, 'Y/N')
	   FROM MIG_CO008_MS
       WHERE ( 
                (TYPE not in ('U', 'S'))
             OR (RECOGNIZED_EXCHANGE not in ('Y', 'N'))            
             OR (IS_LEGAL_ENFORCE not in ('Y', 'N', 'O'))            
             OR (BORROWER_DEPENDENCY not in ('Y', 'N'))            
             OR (IS_CGC_PLEDGED not in ('Y', 'N'))            
             OR (SECURITY_REFERRED not in ('Y', 'N'))            
             OR (CUSTODIAN_TYPE not in ('I', 'E'))            
             OR (LOCAL_EXCHANGE not in ('Y', 'N'))            
             OR (BASEL_COMPLIANT_TEXT not in ('Y', 'N', 'O'))            
             OR (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O'))   
             -- OR (GOVT_GUARANTEE not in ('Y', 'N'))            
      ));
      

      CALL LOG_PROC_TIME('MIG_VALIDATE_CO008_MS', 'SIBS', 0);
END
@			

CREATE PROCEDURE MIG_VALIDATE_CO009_PT
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_CO009_PT', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CO009_PT
	SET IS_VALID = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(SECURITY_ID)=0
			OR length(CMS_SECURITY_SUBTYPE_ID)=0
			-- OR length(SECURITY_REF_NOTE)=0
			OR length(SOURCE_SECURITY_TYPE)=0
			OR length(SOURCE_SECURITY_SUB_TYPE)=0
			OR length(CURRENCY)=0
			OR length(LOC_COUNTRY)=0
			OR length(LOC_ORG_CODE)=0
			OR length(CUSTODIAN_TYPE)=0
			-- OR length(CUSTODIAN)=0
			OR length(LEGAL_ENFORCEABILITY)=0
			OR (LEGAL_ENFORCEABILITY='Y' and LEGAL_ENFORCEABILITY_DATE is null)
			OR SECURITY_PERFECTION_DATE is null
			OR length(SALE_PURCHASE_AGREEMENT_VALUE)=0
			--OR SALE_PURCHASE_DATE is null
			OR length(TITLE_TYPE)=0
			--OR length(MASTER_TITLE)=0
			OR (MASTER_TITLE='N' and length(MASTER_TITLE_NUMBER)=0)
			--OR length(TITLE_NUMBER_PREFIX)=0
			--OR length(TITLE_NUMBER)=0
			-- OR length(LOT_NO)=0
			--OR length(LOT_NO_TYPE)=0
			OR length(POST_CODE)=0
			--OR (length(POST_CODE)>0 and length(STATE_CODE)=0)
			-- OR length(LAND_AREA)=0
			OR (length(LAND_AREA)>0 and length(LAND_AREA_UOM)=0)
			OR (length(BUILT_UP_AREA)>0 and length(BUILD_AREA_UOM)=0)
			OR (QUIT_RENT_RECEIPT='Y' and length(QUIT_RENT_AMT_PAID)=0)
			OR length(PROPERTY_USAGE)=0
			OR length(ABANDONED_PROJECT)=0
			--OR length(PROPERTY_COMPLETION_STATUS)=0
			OR length(IS_PHY_INSPECT)=0
			OR length(ENV_RISKY_STATUS)=0
			OR length(INDEPENDENT_VALUER_FLAG)=0
			--OR length(DEVELOPER_NAME_CODE)=0
			--OR (length(CATEGORY_OF_LAND_USE_CODE)>0 AND length(CATEGORY_OF_LAND_USE_DESC)=0) 
			OR length(COLLATERAL_STATUS)=0;
		
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO009', SECURITY_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
		|| BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| BVL(CMS_SECURITY_SUBTYPE_ID, ' [CMS_SECURITY_SUBTYPE_ID] ')
		-- || BVL(SECURITY_REF_NOTE, ' [SECURITY_REF_NOTE] ')
		|| BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| BVL(CURRENCY, ' [CURRENCY] ')
		|| BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
		|| BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| BVL(CUSTODIAN_TYPE, ' [CUSTODIAN_TYPE] ')
		-- || BVL(CUSTODIAN, ' [CUSTODIAN] ')
		|| BVL(LEGAL_ENFORCEABILITY, ' [LEGAL_ENFORCEABILITY] ')			
		||(CASE WHEN LEGAL_ENFORCEABILITY='Y' THEN NVL2(char(LEGAL_ENFORCEABILITY_DATE), '', ' [LEGAL_ENFORCEABILITY_DATE] ') ELSE '' END)
		|| NVL2(char(SECURITY_PERFECTION_DATE), '', ' [SECURITY_PERFECTION_DATE] ')	
		|| NVL2(char(SALE_PURCHASE_AGREEMENT_VALUE), '', ' [SALE_PURCHASE_AGREEMENT_VALUE] ')			
		--|| NVL2(char(SALE_PURCHASE_DATE), '', ' [SALE_PURCHASE_DATE] ')		
		|| BVL(TITLE_TYPE, ' [TITLE_TYPE] ')
		--|| BVL(MASTER_TITLE, ' [MASTER_TITLE] ')
		||(CASE WHEN MASTER_TITLE='N' THEN BVL(MASTER_TITLE_NUMBER, ' [MASTER_TITLE_NUMBER] ') ELSE '' END)
		--|| BVL(TITLE_NUMBER_PREFIX, ' [TITLE_NUMBER_PREFIX] ')
		--|| BVL(TITLE_NUMBER, ' [TITLE_NUMBER] ')
		-- || BVL(LOT_NO, ' [LOT_NO] ')
		--|| BVL(LOT_NO_TYPE, ' [LOT_NO_TYPE] ')
		|| BVL(POST_CODE, ' [POST_CODE] ')
		--||(CASE WHEN length(POST_CODE)>0 THEN BVL(STATE_CODE, ' [STATE_CODE] ') ELSE '' END)
		-- || NVL2(char(LAND_AREA), '', ' [LAND_AREA] ')
		||(CASE WHEN length(LAND_AREA)>0 THEN BVL(LAND_AREA_UOM, ' [LAND_AREA_UOM] ') ELSE '' END)
		||(CASE WHEN length(BUILT_UP_AREA)>0 THEN BVL(BUILD_AREA_UOM, ' [BUILD_AREA_UOM] ') ELSE '' END)
		||(CASE WHEN QUIT_RENT_RECEIPT='Y'  THEN NVL2(char(QUIT_RENT_AMT_PAID), '', ' [QUIT_RENT_AMT_PAID] ') ELSE '' END)
		|| BVL(PROPERTY_USAGE, ' [PROPERTY_USAGE] ')
		|| BVL(ABANDONED_PROJECT, ' [ABANDONED_PROJECT] ')
		--|| BVL(PROPERTY_COMPLETION_STATUS, ' [PROPERTY_COMPLETION_STATUS] ')
		|| BVL(IS_PHY_INSPECT, ' [IS_PHY_INSPECT] ')
		|| BVL(ENV_RISKY_STATUS, ' [ENV_RISKY_STATUS] ')
		--||(CASE WHEN length(CATEGORY_OF_LAND_USE_CODE)>0 THEN BVL(CATEGORY_OF_LAND_USE_DESC, ' [CATEGORY_OF_LAND_USE_DESC] ') ELSE '' END)
		--|| BVL(PROPERTY_TYPE_CODE, ' [PROPERTY_TYPE_CODE] ')
		|| BVL(INDEPENDENT_VALUER_FLAG, ' [INDEPENDENT_VALUER_FLAG] ')
		|| BVL(COLLATERAL_STATUS, ' [COLLATERAL_STATUS] ')
		|| ' is/are empty.'						
	FROM MIG_CO009_PT
	WHERE IS_VALID = 'N'
	AND (length(RECORD_TYPE)=0
		OR length(SECURITY_ID)=0
		OR length(CMS_SECURITY_SUBTYPE_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(CUSTODIAN_TYPE)=0
		OR length(LEGAL_ENFORCEABILITY)=0
		OR (LEGAL_ENFORCEABILITY='Y' and LEGAL_ENFORCEABILITY_DATE is null)
		OR SECURITY_PERFECTION_DATE is null
		OR length(SALE_PURCHASE_AGREEMENT_VALUE)=0
		OR length(TITLE_TYPE)=0
		OR (MASTER_TITLE='N' and length(MASTER_TITLE_NUMBER)=0)
		OR length(POST_CODE)=0
		OR (length(LAND_AREA)>0 and length(LAND_AREA_UOM)=0)
		OR (length(BUILT_UP_AREA)>0 and length(BUILD_AREA_UOM)=0)
		OR (QUIT_RENT_RECEIPT='Y' and length(QUIT_RENT_AMT_PAID)=0)
		OR length(PROPERTY_USAGE)=0
		OR length(ABANDONED_PROJECT)=0
		OR length(IS_PHY_INSPECT)=0
		OR length(ENV_RISKY_STATUS)=0
		OR length(INDEPENDENT_VALUER_FLAG)=0
		OR length(COLLATERAL_STATUS)=0));
		
	commit;
	-----------------------------------------
	-- Check for duplicate security Id records
	-----------------------------------------
	
	UPDATE MIG_CO009_PT a set is_valid = 'N'
  	where a.SECURITY_ID in (select t.SECURITY_ID
  	from MIG_CO009_PT t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO009', SECURITY_ID, 'DUP001', 
		'[M] Duplicate security info for Property Security ID [' 
  		|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  	from MIG_CO009_PT where is_valid = 'N'
  	group by SECURITY_ID
  	having count(*) > 1);
	
	CALL LOG_PROC_TIME('MIG_CO009_PT', 'SIBS', 2);
	commit;

	UPDATE MIG_CO009_PT a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO009', a.SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in other subtype for Collateral Name [' 
	  	|| t.SECURITY_REF_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO009_PT a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_ID = t.SECURITY_ID
    	and t.SUBTYPE <> 'PT');
	
	CALL LOG_PROC_TIME('MIG_CO009_PT', 'SIBS', 3);
	commit;
	
	--------------------------------------------------------------
	-- Check for duplicate collateral name records
	--
	--------------------------------------------------------------
	UPDATE MIG_CO009_PT a set is_valid = 'N'
  	where a.SECURITY_REF_NOTE in (select t.SECURITY_REF_NOTE
  	from MIG_CO009_PT t
  	group by t.SECURITY_REF_NOTE
  	having count(*) > 1)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO009', SECURITY_REF_NOTE, 'DUP002', 
		'[M] Duplicate security info for Property Collateral Name [' 
	  	|| SECURITY_REF_NOTE || '] - ' || trim(char(count(*))) || ' records found]'
  	from MIG_CO009_PT where is_valid = 'N'
  	group by SECURITY_REF_NOTE
  	having count(*) > 1);
	
	CALL LOG_PROC_TIME('MIG_CO009_PT', 'SIBS', 4);
	commit;
	
	UPDATE MIG_CO009_PT a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO009', a.SECURITY_ID, a.SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in other subtype for Security ID [' 
	  	|| t.SECURITY_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO009_PT a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_REF_NOTE = t.SECURITY_REF_NOTE
    	and t.SUBTYPE <> 'PT');
	
	CALL LOG_PROC_TIME('MIG_CO009_PT', 'SIBS', 5);
	commit;

    	-----------------------------------------------------
    	-- Check for error mapping between source 
    	-----------------------------------------------------
	UPDATE MIG_CO009_PT a set is_valid = 'N'
  	where not exists (select 1
  	from COMMON_CODE_CATEGORY_ENTRY t
  	where t.ENTRY_CODE = a.SOURCE_SECURITY_SUB_TYPE 
    	and t.REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID
  	and t.CATEGORY_CODE = 'SOURCE_CMS_SEC_TYPE_MAP')
  	and a.is_valid = 'Y';
    
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO009', SECURITY_ID, 'EMAP001', 
		'[H] Error mapping between Source Security Sub Type [' 
	  	|| SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type [' || CMS_SECURITY_SUBTYPE_ID || '] '
  	from MIG_CO009_PT a
    	where not exists (select 1
  	from COMMON_CODE_CATEGORY_ENTRY t
  	where t.ENTRY_CODE = a.SOURCE_SECURITY_SUB_TYPE 
    	and t.REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID
  	and t.CATEGORY_CODE = 'SOURCE_CMS_SEC_TYPE_MAP'));
	
	commit;
    	-----------------------------------------------------
    	-- Check for non-existence common code
    	-----------------------------------------------------
	UPDATE MIG_CO009_PT a set is_valid = 'N'
	where ( 
    	        (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE fetch first row only)) 
    	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_TYPE_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE fetch first row only)) 
    	     OR (CUSTODIAN_TYPE = 'I' AND not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = '40' and entry_code = CUSTODIAN fetch first row only)) 
    	     --OR (length(LOT_NO)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOT_NO_CAT and entry_code = LOT_NO fetch first row only)) 
    	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = TITLE_TYPE_CAT and entry_code = TITLE_TYPE fetch first row only)) 
    	     OR (length(trim(STATE_CODE))>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = STATE_CAT and entry_code = STATE_CODE fetch first row only)) 
    	     OR (length(LAND_AREA)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = AREA_UOM_CAT and entry_code = LAND_AREA_UOM fetch first row only)) 
    	     OR (length(BUILT_UP_AREA)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = AREA_UOM_CAT and entry_code = BUILD_AREA_UOM fetch first row only)) 
    	     OR (length(TENURE_UNIT)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = TENURE_PROP_CAT and entry_code = TENURE_UNIT fetch first row only)) 
    	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PROPERTY_USAGE_CAT and entry_code = PROPERTY_USAGE fetch first row only)) 
    	     --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LAND_USE_CAT and entry_code = BUILDING_VALUE   )) 
    	     OR (length(PROPERTY_COMPLETION_STATUS)>0 AND not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PROPERTY_COMPLETION_CAT and entry_code = PROPERTY_COMPLETION_STATUS fetch first row only)) 
    	     --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PROPERTY_TYPE_CAT and entry_code = PROPERTY_TYPE_CODE fetch first row only)) 
    	) 
      	and a.is_valid = 'Y';
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO009', SECURITY_ID, 'COM001',
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('LOC_ORG_CODE', LOC_ORG_CODE, LOC_ORG_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('SOURCE_SECURITY_SUB_TYPE', SOURCE_SECURITY_SUB_TYPE, SOURCE_SEC_TYPE_CAT)
      		|| (CASE WHEN CUSTODIAN_TYPE = 'I' THEN GET_INVALID_COMMON_CODE_MSG('CUSTODIAN', CUSTODIAN, '40') ELSE '' END)
			--|| (CASE WHEN length(LOT_NO)>0 THEN GET_INVALID_COMMON_CODE_MSG('LOT_NO', LOT_NO, LOT_NO_CAT) ELSE '' END)
			|| GET_INVALID_COMMON_CODE_MSG('TITLE_TYPE', TITLE_TYPE, TITLE_TYPE_CAT)
            || (CASE WHEN length(trim(STATE_CODE))>0 THEN GET_INVALID_COMMON_CODE_MSG('STATE_CODE', STATE_CODE, STATE_CAT) ELSE '' END)
			|| (CASE WHEN length(LAND_AREA)>0 THEN GET_INVALID_COMMON_CODE_MSG('LAND_AREA_UOM', LAND_AREA_UOM, AREA_UOM_CAT) ELSE '' END)
            || (CASE WHEN length(BUILT_UP_AREA)>0 THEN GET_INVALID_COMMON_CODE_MSG('BUILD_AREA_UOM', BUILD_AREA_UOM, AREA_UOM_CAT) ELSE '' END)
            || (CASE WHEN length(TENURE_UNIT)>0 THEN GET_INVALID_COMMON_CODE_MSG('TENURE_UNIT', TENURE_UNIT, TENURE_PROP_CAT) ELSE '' END)
			|| GET_INVALID_COMMON_CODE_MSG('PROPERTY_USAGE', PROPERTY_USAGE, PROPERTY_USAGE_CAT)
			--|| GET_INVALID_COMMON_CODE_MSG('BUILDING_VALUE', BUILDING_VALUE, LAND_USE_CAT)
			|| (CASE WHEN length(PROPERTY_COMPLETION_STATUS)>0 THEN GET_INVALID_COMMON_CODE_MSG('PROPERTY_COMPLETION_STATUS', PROPERTY_COMPLETION_STATUS, PROPERTY_COMPLETION_CAT) ELSE '' END)
			--|| GET_INVALID_COMMON_CODE_MSG('PROPERTY_TYPE_CODE', PROPERTY_TYPE_CODE, PROPERTY_TYPE_CAT)
	FROM MIG_CO009_PT
       	WHERE ( 
            (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE fetch first row only)) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_TYPE_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE fetch first row only)) 
         OR (CUSTODIAN_TYPE = 'I' AND not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = '40' and entry_code = CUSTODIAN fetch first row only)) 
         --OR (length(LOT_NO)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOT_NO_CAT and entry_code = LOT_NO fetch first row only)) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = TITLE_TYPE_CAT and entry_code = TITLE_TYPE fetch first row only)) 
         OR (length(trim(STATE_CODE))>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = STATE_CAT and entry_code = STATE_CODE fetch first row only)) 
         OR (length(LAND_AREA)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = AREA_UOM_CAT and entry_code = LAND_AREA_UOM fetch first row only)) 
         OR (length(BUILT_UP_AREA)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = AREA_UOM_CAT and entry_code = BUILD_AREA_UOM fetch first row only)) 
         OR (length(TENURE_UNIT)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = TENURE_PROP_CAT and entry_code = TENURE_UNIT fetch first row only)) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PROPERTY_USAGE_CAT and entry_code = PROPERTY_USAGE fetch first row only)) 
         --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LAND_USE_CAT and entry_code = BUILDING_VALUE   )) 
         OR (length(PROPERTY_COMPLETION_STATUS)>0 AND not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PROPERTY_COMPLETION_CAT and entry_code = PROPERTY_COMPLETION_STATUS fetch first row only)) 
         --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = PROPERTY_TYPE_CAT and entry_code = PROPERTY_TYPE_CODE fetch first row only)) 
      	));
      
	CALL LOG_PROC_TIME('MIG_CO009_PT', 'SIBS', 6);
	commit;
      
    	-----------------------------------------------------
    	-- Check for invalid values
    	-----------------------------------------------------
	UPDATE MIG_CO009_PT a set is_valid = 'N'
	where ( 
                (CUSTODIAN_TYPE not in ('I', 'E'))
             OR (LEGAL_ENFORCEABILITY not in ('Y', 'N', 'O'))
             OR (length(MASTER_TITLE)>0 and MASTER_TITLE not in ('Y', 'N'))
             OR (QUIT_RENT_RECEIPT not in ('Y', 'N'))
             OR (ABANDONED_PROJECT not in ('Y', 'N'))
             OR (ASSESSMENT not in ('Y', 'N'))
             OR (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O'))
             OR (BORROWER_DEPENDENCY not in ('Y', 'N'))
             OR (IS_CGC_PLEDGED not in ('Y', 'N'))
             OR (IS_PHY_INSPECT not in ('Y', 'N'))
             OR (ENV_RISKY_STATUS not in ('Y', 'N', 'O'))
             OR (INDEPENDENT_VALUER_FLAG not in ('Y', 'N'))
      	) 
      	and a.is_valid = 'Y';

      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO009', SECURITY_ID, 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| (CASE WHEN (CUSTODIAN_TYPE not in ('I', 'E')) THEN GET_INVALID_VALUE_MSG('CUSTODIAN_TYPE', CUSTODIAN_TYPE, 'I/E') ELSE '' END)
			|| (CASE WHEN (LEGAL_ENFORCEABILITY not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('LEGAL_ENFORCEABILITY', LEGAL_ENFORCEABILITY, 'Y/N/O') ELSE '' END)
			|| (CASE WHEN (length(MASTER_TITLE)>0 and MASTER_TITLE not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('MASTER_TITLE', MASTER_TITLE, 'Y/N') ELSE '-' END)
			|| (CASE WHEN (QUIT_RENT_RECEIPT not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('QUIT_RENT', QUIT_RENT_RECEIPT, 'Y/N') ELSE '' END)
			|| (CASE WHEN (ABANDONED_PROJECT not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('ABANDONED_PROJECT', ABANDONED_PROJECT, 'Y/N') ELSE '' END)
			|| (CASE WHEN (ASSESSMENT not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('ASSESSMENT', ASSESSMENT, 'Y/N') ELSE '' END)
			|| (CASE WHEN (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('EXCHANGE_CONTROL_OBTAINED', EXCHANGE_CONTROL_OBTAINED, 'Y/N/O') ELSE '' END)
			|| (CASE WHEN (BORROWER_DEPENDENCY not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('BORROWER_DEPENDENCY', BORROWER_DEPENDENCY, 'Y/N') ELSE '' END)
			|| (CASE WHEN (IS_CGC_PLEDGED not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('IS_CGC_PLEDGED', IS_CGC_PLEDGED, 'Y/N') ELSE '' END)
			|| (CASE WHEN (IS_PHY_INSPECT not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('IS_PHY_INSPECT', IS_PHY_INSPECT, 'Y/N') ELSE '' END)
			|| (CASE WHEN (ENV_RISKY_STATUS not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('ENV_RISKY_STATUS', ENV_RISKY_STATUS, 'Y/N/O') ELSE '' END)
			|| (CASE WHEN (INDEPENDENT_VALUER_FLAG not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('INDEPENDENT_VALUER_FLAG', INDEPENDENT_VALUER_FLAG, 'Y/N') ELSE '' END)
	   FROM MIG_CO009_PT
       WHERE ( 
                (CUSTODIAN_TYPE not in ('I', 'E'))
             OR (LEGAL_ENFORCEABILITY not in ('Y', 'N', 'O'))
             OR (length(MASTER_TITLE)>0 and MASTER_TITLE not in ('Y', 'N'))
             OR (QUIT_RENT_RECEIPT not in ('Y', 'N'))
             OR (ABANDONED_PROJECT not in ('Y', 'N'))
             OR (ASSESSMENT not in ('Y', 'N'))
             OR (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O'))
             OR (BORROWER_DEPENDENCY not in ('Y', 'N'))
             OR (IS_CGC_PLEDGED not in ('Y', 'N'))
             OR (IS_PHY_INSPECT not in ('Y', 'N'))
             OR (ENV_RISKY_STATUS not in ('Y', 'N', 'O'))
             OR (INDEPENDENT_VALUER_FLAG not in ('Y', 'N'))
      ));
            
    
	CALL LOG_PROC_TIME('MIG_CO009_PT', 'SIBS', 0);
END
@

CREATE PROCEDURE MIG_VALIDATE_CO010_GT
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO010', 'SIBS', 1);
	commit;
	
	--CALL RUNSTATS_HELPER('CMS_SECURITY');
	
	UPDATE MIG_CO010_GT
	SET IS_VALID = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(SECURITY_ID)=0
			-- OR length(SECURITY_REF_NOTE)=0            
			OR length(SOURCE_SECURITY_TYPE)=0
			OR length(SOURCE_SECURITY_SUB_TYPE)=0
			OR length(CURRENCY)=0
			OR length(LOC_COUNTRY)=0
			OR length(LOC_ORG_CODE)=0
			OR SECURITY_EXPIRY_DATE is null
			OR length(LEGAL_ENFORCEABILITY)=0
            OR (LEGAL_ENFORCEABILITY='Y' AND LEGAL_ENFORCEABILITY_DATE is null)
			-- OR SECURITY_PERFECTION_DATE is null
			OR length(GUARANTEE_AMT)=0
			OR length(SECURITY_CUSTODIAN)=0
			OR length(COLLATERAL_STATUS)=0;
			
	commit;

	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO010', SECURITY_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
		|| BVL(SECURITY_ID, ' [SECURITY_ID] ')
		-- || BVL(SECURITY_REF_NOTE, ' [SECURITY_REF_NOTE] ')
		|| BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| BVL(CURRENCY, ' [CURRENCY] ')
		|| BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
		|| BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| NVL2(char(SECURITY_EXPIRY_DATE), '', ' [SECURITY_EXPIRY_DATE] ')	
		|| BVL(LEGAL_ENFORCEABILITY, ' [LEGAL_ENFORCEABILITY] ')			
		|| (CASE WHEN LEGAL_ENFORCEABILITY='Y' THEN NVL2(char(LEGAL_ENFORCEABILITY_DATE), '', ' [LEGAL_ENFORCEABILITY_DATE] ') ELSE '' END)
		-- || NVL2(char(SECURITY_PERFECTION_DATE), '', ' [SECURITY_PERFECTION_DATE] ')	
		|| BVL(char(GUARANTEE_AMT), ' [GUARANTEE_AMT] ')			
		|| BVL(SECURITY_CUSTODIAN, ' [SECURITY_CUSTODIAN] ')
		|| BVL(COLLATERAL_STATUS, ' [COLLATERAL_STATUS] ')
		|| ' is/are empty.'						
	FROM MIG_CO010_GT
	WHERE IS_VALID = 'N'
	AND (length(RECORD_TYPE)=0
		OR length(SECURITY_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR SECURITY_EXPIRY_DATE is null
		OR length(LEGAL_ENFORCEABILITY)=0
            	OR (LEGAL_ENFORCEABILITY='Y' AND LEGAL_ENFORCEABILITY_DATE is null)
		OR length(GUARANTEE_AMT)=0
		OR length(SECURITY_CUSTODIAN)=0
		OR length(COLLATERAL_STATUS)=0));
	
	commit;
	-----------------------------------------
	-- Check for duplicate security Id records
	-----------------------------------------
	CALL RUNSTATS_HELPER('MIG_CO010_GT', 'IS_VALID, SECURITY_ID, SECURITY_REF_NOTE');
	
	UPDATE MIG_CO010_GT a set is_valid = 'N'
  	where a.SECURITY_ID in (select t.SECURITY_ID
  	from MIG_CO010_GT t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  	and a.is_valid = 'Y';
  	
	commit;
	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO010', SECURITY_ID, 'DUP001', 
		'[M] Duplicate security info for Guarantees Security ID [' 
  		|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  	from MIG_CO010_GT where is_valid = 'N'
  	group by SECURITY_ID
  	having count(*) > 1);

	CALL LOG_PROC_TIME('MIG_VALIDATE_CO010', 'SIBS', 2);
	commit;
		
	CALL RUNSTATS_HELPER('CMS_SECURITY', 'SCI_SECURITY_DTL_ID, SCI_REFERENCE_NOTE');
	
	UPDATE MIG_CO010_GT a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID)
  	and a.is_valid = 'Y';
	
	COMMIT;
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO010', a.SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in other subtype for Collateral Name [' 
	  	|| t.SECURITY_REF_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO010_GT a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_ID = t.SECURITY_ID
    	and t.SUBTYPE <> 'GT');
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO010', 'SIBS', 3);
	commit;
	
	--------------------------------------------------------------
	-- Check for duplicate collateral name records
	--
	--------------------------------------------------------------
	create index temp_index_1 on mig_co010_gt
		(is_valid, SECURITY_REF_NOTE) allow reverse scans
		COLLECT STATISTICS;
		
	COMMIT;	
	
	UPDATE MIG_CO010_GT a set is_valid = 'N'
  	where a.SECURITY_REF_NOTE in (select t.SECURITY_REF_NOTE
  	from MIG_CO010_GT t
  	group by t.SECURITY_REF_NOTE
  	having count(*) > 1)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO010', SECURITY_REF_NOTE, 'DUP002', 
		'[M] Duplicate security info for Guarantees Collateral Name [' 
	  	|| SECURITY_REF_NOTE || '] - ' || trim(char(count(*))) || ' records found]'
  	from MIG_CO010_GT where is_valid = 'N'
  	group by SECURITY_REF_NOTE
  	having count(*) > 1);
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO010', 'SIBS', 4);
	commit;
		
	UPDATE MIG_CO010_GT a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE)
  	and a.is_valid = 'Y';
	
	COMMIT;
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO010', a.SECURITY_ID, a.SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in other subtype for Security ID [' 
	  	|| t.SECURITY_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO010_GT a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_REF_NOTE = t.SECURITY_REF_NOTE
    	and t.SUBTYPE <> 'GT');
	
	drop index temp_index_1;	
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO010', 'SIBS', 5);
	commit;

    	-----------------------------------------------------
    	-- Check for error mapping between source 
    	-----------------------------------------------------
	UPDATE MIG_CO010_GT a set is_valid = 'N'
  	where not exists (select 1
  	from COMMON_CODE_CATEGORY_ENTRY t
  	where t.ENTRY_CODE = a.SOURCE_SECURITY_SUB_TYPE 
    	and t.REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID
  	and t.CATEGORY_CODE = 'SOURCE_CMS_SEC_TYPE_MAP')
  	and a.is_valid = 'Y';
    
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO010', SECURITY_ID, 'EMAP001', 
		'[H] Error mapping between Source Security Sub Type [' 
	  	|| SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type [' || CMS_SECURITY_SUBTYPE_ID || '] '
  	from MIG_CO010_GT a
    	where not exists (select 1
  	from COMMON_CODE_CATEGORY_ENTRY t
  	where t.ENTRY_CODE = a.SOURCE_SECURITY_SUB_TYPE 
    	and t.REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID
  	and t.CATEGORY_CODE = 'SOURCE_CMS_SEC_TYPE_MAP'));

	COMMIT;
   	-----------------------------------------------------
    	-- Check for non-existence common code
    	-----------------------------------------------------
	UPDATE MIG_CO010_GT a set is_valid = 'N'
	where ( 
    	        (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE  )) 
    	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE   )) 
    	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CHARGE_TYPE_CAT and entry_code = CHARGE_TYPE )) 
    	     OR (SECURITY_CUSTODIAN = 'I' AND not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = '40' and entry_code = SECURITY_CUSTODIAN )) 
      	) 
      	and a.is_valid = 'Y';
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO010', SECURITY_ID, 'COM001',
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('LOC_ORG_CODE', LOC_ORG_CODE, LOC_ORG_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('SOURCE_SECURITY_SUB_TYPE', SOURCE_SECURITY_SUB_TYPE, SOURCE_SEC_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('CHARGE_TYPE', CHARGE_TYPE, CHARGE_TYPE_CAT)
            || (CASE WHEN CUSTODIAN_TYPE='I' THEN GET_INVALID_COMMON_CODE_MSG('SECURITY_CUSTODIAN', SECURITY_CUSTODIAN, '40') ELSE '' END)            
	FROM MIG_CO010_GT
       	WHERE ( 
    	        (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE  )) 
    	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE   )) 
    	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CHARGE_TYPE_CAT and entry_code = CHARGE_TYPE )) 
    	     OR (SECURITY_CUSTODIAN = 'I' AND not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = '40' and entry_code = SECURITY_CUSTODIAN )) 
    	));
      	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO010', 'SIBS', 6);
	commit;
        
	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------
	UPDATE MIG_CO010_GT a set is_valid = 'N'
	where ( 
                (CUSTODIAN_TYPE not in ('I', 'E'))            
             OR (LEGAL_ENFORCEABILITY not in ('Y', 'N', 'O'))            
             OR (BORROWER_DEPENDENCY not in ('Y', 'N'))            
             --OR (BANK_COUNTRY_RISK_APPROVAL not in ('Y', 'N', 'O'))            
             OR (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O'))            
      	) 
      	and a.is_valid = 'Y';

      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO010', SECURITY_ID, 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| (CASE WHEN (CUSTODIAN_TYPE not in ('I', 'E')) THEN GET_INVALID_VALUE_MSG('CUSTODIAN_TYPE', CUSTODIAN_TYPE, 'I/E') ELSE '' END)
			|| (CASE WHEN (LEGAL_ENFORCEABILITY not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('LEGAL_ENFORCEABILITY', LEGAL_ENFORCEABILITY, 'Y/N/O') ELSE '' END)
			|| (CASE WHEN (BORROWER_DEPENDENCY not in ('Y', 'N'))  THEN GET_INVALID_VALUE_MSG('BORROWER_DEPENDENCY', BORROWER_DEPENDENCY, 'Y/N') ELSE '' END)
			--|| GET_INVALID_VALUE_MSG('BANK_COUNTRY_RISK_APPROVAL', BANK_COUNTRY_RISK_APPROVAL, 'Y/N/O')
			|| (CASE WHEN (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('EXCHANGE_CONTROL_OBTAINED', EXCHANGE_CONTROL_OBTAINED, 'Y/N/O') ELSE '' END)
	   FROM MIG_CO010_GT
       WHERE ( 
                (CUSTODIAN_TYPE not in ('I', 'E'))            
             OR (LEGAL_ENFORCEABILITY not in ('Y', 'N', 'O'))            
             OR (BORROWER_DEPENDENCY not in ('Y', 'N'))            
             --OR (BANK_COUNTRY_RISK_APPROVAL not in ('Y', 'N', 'O'))            
             OR (EXCHANGE_CONTROL_OBTAINED not in ('Y', 'N', 'O'))            
      ));

        
    CALL LOG_PROC_TIME('MIG_VALIDATE_CO010', 'SIBS', 0);
    
END
@	

CREATE PROCEDURE MIG_VALIDATE_CO011_OT
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO011_OT', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CO011_OT
	SET IS_VALID = 'N'
	WHERE length(RECORD_TYPE)=0
		OR length(SECURITY_ID)=0
		OR length(CMS_SECURITY_SUBTYPE_ID)=0
		-- OR length(SECURITY_REF_NOTE)=0            
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(IS_PHY_INSPECT)=0
		OR length(ENV_RISKY_STATUS)=0
		OR length(LEGAL_ENFORCEABILITY)=0
            	OR (LEGAL_ENFORCEABILITY='Y' AND LEGAL_ENFORCEABILITY_DATE is null)
		OR length(NUMBER_OF_UNITS)=0
		OR length(DESCRIPTION_OTHERS)=0
		OR length(COLLATERAL_STATUS)=0;

	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO011', SECURITY_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
		|| BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| BVL(CMS_SECURITY_SUBTYPE_ID, ' [CMS_SECURITY_SUBTYPE_ID] ')
		-- || BVL(SECURITY_REF_NOTE, ' [SECURITY_REF_NOTE] ')
		|| BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| BVL(CURRENCY, ' [CURRENCY] ')
		|| BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
		|| BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| BVL(IS_PHY_INSPECT, ' [IS_PHY_INSPECT] ')
		|| BVL(ENV_RISKY_STATUS, ' [ENV_RISKY_STATUS] ')
		|| BVL(LEGAL_ENFORCEABILITY, ' [LEGAL_ENFORCEABILITY] ')			
		|| (CASE WHEN LEGAL_ENFORCEABILITY='Y' THEN NVL2(char(LEGAL_ENFORCEABILITY_DATE), '', ' [LEGAL_ENFORCEABILITY_DATE] ') ELSE '' END)
		|| BVL(char(NUMBER_OF_UNITS), ' [NUMBER_OF_UNITS] ')			
		|| BVL(DESCRIPTION_OTHERS, ' [DESCRIPTION_OTHERS] ')
		|| BVL(COLLATERAL_STATUS, ' [COLLATERAL_STATUS] ')
		|| ' is/are empty.'						
	FROM MIG_CO011_OT
	WHERE IS_VALID = 'N'
	AND (length(RECORD_TYPE)=0
		OR length(SECURITY_ID)=0
		OR length(CMS_SECURITY_SUBTYPE_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(CURRENCY)=0
		OR length(LOC_COUNTRY)=0
		OR length(LOC_ORG_CODE)=0
		OR length(IS_PHY_INSPECT)=0
		OR length(ENV_RISKY_STATUS)=0
		OR length(LEGAL_ENFORCEABILITY)=0
            	OR (LEGAL_ENFORCEABILITY='Y' AND LEGAL_ENFORCEABILITY_DATE is null)
		OR length(NUMBER_OF_UNITS)=0
		OR length(DESCRIPTION_OTHERS)=0
		OR length(COLLATERAL_STATUS)=0));
	
	commit;
	-----------------------------------------
	-- Check for duplicate security Id records
	-----------------------------------------
	UPDATE MIG_CO011_OT a set is_valid = 'N'
  	where a.SECURITY_ID in (select t.SECURITY_ID
  				from MIG_CO011_OT t
  				group by t.SECURITY_ID
  				having count(*) > 1)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO011', SECURITY_ID, 'DUP001', 
		'[M] Duplicate security info for Collateral Others Security ID [' 
  		|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  	from MIG_CO011_OT 
  	where is_valid = 'N'
  	group by SECURITY_ID
  	having count(*) > 1);

	CALL LOG_PROC_TIME('MIG_VALIDATE_CO011_OT', 'SIBS', 2);
	commit;
		
	UPDATE MIG_CO011_OT a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO011', a.SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in other subtype for Collateral Name [' 
	  	|| t.SECURITY_REF_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO011_OT a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_ID = t.SECURITY_ID
    	and t.SUBTYPE <> 'OT');
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO011_OT', 'SIBS', 3);
	commit;
	
	--------------------------------------------------------------
	-- Check for duplicate collateral name records
	--
	--------------------------------------------------------------
	UPDATE MIG_CO011_OT a set is_valid = 'N'
  	where a.SECURITY_REF_NOTE in (select t.SECURITY_REF_NOTE
  	from MIG_CO011_OT t
  	group by t.SECURITY_REF_NOTE
  	having count(*) > 1)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO011', SECURITY_REF_NOTE, 'DUP002', 
		'[M] Duplicate security info for Collateral Others Collateral Name [' 
	  	|| SECURITY_REF_NOTE || '] - ' || trim(char(count(*))) || ' records found]'
  	from MIG_CO011_OT where is_valid = 'N'
  	group by SECURITY_REF_NOTE
  	having count(*) > 1);
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO011_OT', 'SIBS', 4);
	commit;
	
	UPDATE MIG_CO011_OT a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO011', a.SECURITY_ID, a.SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in other subtype for Security ID [' 
	  	|| t.SECURITY_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO011_OT a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_REF_NOTE = t.SECURITY_REF_NOTE
    	and t.SUBTYPE <> 'OT');
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO011_OT', 'SIBS', 5);
	commit;

	-----------------------------------------------------
	-- Check for error mapping between source 
	-----------------------------------------------------
	UPDATE MIG_CO011_OT a set is_valid = 'N'
  	where not exists (select 1
  	from COMMON_CODE_CATEGORY_ENTRY t
  	where t.ENTRY_CODE = a.SOURCE_SECURITY_SUB_TYPE 
    	and t.REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID
  	and t.CATEGORY_CODE = 'SOURCE_CMS_SEC_TYPE_MAP')
  	and a.is_valid = 'Y';
    
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO011', SECURITY_ID, 'EMAP001', 
		'[H] Error mapping between Source Security Sub Type [' 
	  	|| SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type [' || CMS_SECURITY_SUBTYPE_ID || '] '
  	from MIG_CO011_OT a
    	where not exists (select 1
  	from COMMON_CODE_CATEGORY_ENTRY t
  	where t.ENTRY_CODE = a.SOURCE_SECURITY_SUB_TYPE 
    	and t.REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID
  	and t.CATEGORY_CODE = 'SOURCE_CMS_SEC_TYPE_MAP'));

	-----------------------------------------------------
	-- Check for non-existence common code
	-----------------------------------------------------
	UPDATE MIG_CO011_OT a set is_valid = 'N'
	where ( 
        	(not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE  )) 
             OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE   )) 
             OR (CUSTODIAN_TYPE = 'I' AND not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = '40' and entry_code = SECURITY_CUSTODIAN )) 
      	) 
      	and a.is_valid = 'Y';
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO011', SECURITY_ID, 'COM001',
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('LOC_ORG_CODE', LOC_ORG_CODE, '40')
			|| GET_INVALID_COMMON_CODE_MSG('SOURCE_SECURITY_SUB_TYPE', SOURCE_SECURITY_SUB_TYPE, 'SOURCE_CMS_SEC_TYPE_MAP')
            || (CASE WHEN CUSTODIAN_TYPE='I' THEN GET_INVALID_COMMON_CODE_MSG('SECURITY_CUSTODIAN', SECURITY_CUSTODIAN, '40') ELSE '' END)            
	FROM MIG_CO011_OT
        WHERE ( 
            (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE  )) 
         OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE   )) 
         OR (CUSTODIAN_TYPE = 'I' AND not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = '40' and entry_code = SECURITY_CUSTODIAN )) 
        ));
      	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO011_OT', 'SIBS', 6);
	commit;
        
	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------
	UPDATE MIG_CO011_OT a set is_valid = 'N'
	where ( 
                (CUSTODIAN_TYPE not in ('I', 'E'))            
             OR (LEGAL_ENFORCEABILITY not in ('Y', 'N', 'O'))            
             OR (IS_CGC_PLEDGED not in ('Y', 'N'))            
      	) 
      	and a.is_valid = 'Y';

      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO011', SECURITY_ID, 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| (CASE WHEN (CUSTODIAN_TYPE not in ('I', 'E')) THEN GET_INVALID_VALUE_MSG('CUSTODIAN_TYPE', CUSTODIAN_TYPE, 'I/E') ELSE '' END)
			|| (CASE WHEN (LEGAL_ENFORCEABILITY not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('LEGAL_ENFORCEABILITY', LEGAL_ENFORCEABILITY, 'Y/N/O') ELSE '' END)
			|| (CASE WHEN (IS_CGC_PLEDGED not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('IS_CGC_PLEDGED', IS_CGC_PLEDGED, 'Y/N') ELSE '' END)
	FROM MIG_CO011_OT
       	WHERE ( 
                (CUSTODIAN_TYPE not in ('I', 'E'))            
             OR (LEGAL_ENFORCEABILITY not in ('Y', 'N', 'O'))            
             OR (IS_CGC_PLEDGED not in ('Y', 'N'))            
      	));

        
    	CALL LOG_PROC_TIME('MIG_VALIDATE_CO011_OT', 'SIBS', 0);
    
END
@	

CREATE PROCEDURE MIG_VALIDATE_CO012_IN
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO012_IN', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CO012_IN
	SET IS_VALID = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(SECURITY_ID)=0
			OR length(CMS_SECURITY_SUBTYPE_ID)=0
			-- OR length(SECURITY_REF_NOTE)=0
			OR length(SOURCE_SECURITY_TYPE)=0
			OR length(SOURCE_SECURITY_SUB_TYPE)=0
			OR length(LOC_ORG_CODE)=0
			OR length(CHARGE_TYPE)=0
			OR length(CHARGE_NATURE)=0
			OR length(IS_LEGAL_ENFORCE)=0
            OR (IS_LEGAL_ENFORCE='Y' AND IS_LEGAL_ENFORCE_DATE is null)
			OR length(COLLATERAL_STATUS)=0;

	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO012', SECURITY_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
		|| BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| BVL(CMS_SECURITY_SUBTYPE_ID, ' [CMS_SECURITY_SUBTYPE_ID] ')
		-- || BVL(SECURITY_REF_NOTE, ' [SECURITY_REF_NOTE] ')
		|| BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| BVL(CHARGE_TYPE, ' [CHARGE_TYPE] ')	
		|| BVL(CHARGE_NATURE, ' [CHARGE_NATURE] ')	
		|| BVL(IS_LEGAL_ENFORCE, ' [IS_LEGAL_ENFORCE] ')	
		|| (CASE WHEN IS_LEGAL_ENFORCE='Y' THEN NVL2(char(IS_LEGAL_ENFORCE_DATE), '', ' [IS_LEGAL_ENFORCE_DATE] ') ELSE '' END)
		|| ' is/are empty.'						
	FROM MIG_CO012_IN
	WHERE IS_VALID = 'N'
	AND (length(RECORD_TYPE)=0
		OR length(SECURITY_ID)=0
		OR length(CMS_SECURITY_SUBTYPE_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(LOC_ORG_CODE)=0
		OR length(CHARGE_TYPE)=0
		OR length(CHARGE_NATURE)=0
		OR length(IS_LEGAL_ENFORCE)=0
            	OR (IS_LEGAL_ENFORCE='Y' AND IS_LEGAL_ENFORCE_DATE is null)
		OR length(COLLATERAL_STATUS)=0));
		
	commit;
	-----------------------------------------
	-- Check for duplicate security Id records
	-----------------------------------------
	
	UPDATE MIG_CO012_IN a set is_valid = 'N'
    	where a.SECURITY_ID in 
        (select t.SECURITY_ID
      	from MIG_CO012_IN t
      	group by t.SECURITY_ID
      	having count(*) > 1)
    	and a.is_valid = 'Y';
  	
    	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
    	(select current_timestamp, 'SIBS', 'CO012', SECURITY_ID, 'DUP001', 
    	    '[M] Duplicate security info for Insurance Protection Security ID [' 
    	    || SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
    	from MIG_CO012_IN where is_valid = 'N'
    	group by SECURITY_ID
    	having count(*) > 1);
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO012_IN', 'SIBS', 2);
	commit;

	UPDATE MIG_CO012_IN a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO012', a.SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in other subtype for Collateral Name [' 
	  	|| t.SECURITY_REF_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO012_IN a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_ID = t.SECURITY_ID
    	and t.SUBTYPE <> 'IN');
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO012_IN', 'SIBS', 3);
	commit;
	
	--------------------------------------------------------------
	-- Check for duplicate collateral name records
	--
	--------------------------------------------------------------
	UPDATE MIG_CO012_IN a set is_valid = 'N'
  	where a.SECURITY_REF_NOTE in (select t.SECURITY_REF_NOTE
  	from MIG_CO012_IN t
  	group by t.SECURITY_REF_NOTE
  	having count(*) > 1)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO012', SECURITY_REF_NOTE, 'DUP002', 
		'[M] Duplicate security info for Insurance Protection Collateral Name [' 
	  	|| SECURITY_REF_NOTE || '] - ' || trim(char(count(*))) || ' records found]'
  	from MIG_CO012_IN where is_valid = 'N'
  	group by SECURITY_REF_NOTE
  	having count(*) > 1);
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO012_IN', 'SIBS', 4);
	commit;
	
	UPDATE MIG_CO012_IN a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO012', a.SECURITY_ID, a.SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in other subtype for Security ID [' 
	  	|| t.SECURITY_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO012_IN a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_REF_NOTE = t.SECURITY_REF_NOTE
    	and t.SUBTYPE <> 'IN');
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO012_IN', 'SIBS', 5);
	commit;

    	-----------------------------------------------------
    	-- Check for error mapping between source 
    	-----------------------------------------------------
	UPDATE MIG_CO012_IN a set is_valid = 'N'
  	where not exists (select 1
  	from COMMON_CODE_CATEGORY_ENTRY t
  	where t.ENTRY_CODE = a.SOURCE_SECURITY_SUB_TYPE 
    	and t.REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID
  	and t.CATEGORY_CODE = 'SOURCE_CMS_SEC_TYPE_MAP')
  	and a.is_valid = 'Y';
    
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO012', SECURITY_ID, 'EMAP001', 
		'[H] Error mapping between Source Security Sub Type [' 
	  	|| SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type [' || CMS_SECURITY_SUBTYPE_ID || '] '
  	from MIG_CO012_IN a
    	where not exists (select 1
  	from COMMON_CODE_CATEGORY_ENTRY t
  	where t.ENTRY_CODE = a.SOURCE_SECURITY_SUB_TYPE 
    	and t.REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID
  	and t.CATEGORY_CODE = 'SOURCE_CMS_SEC_TYPE_MAP'));

    	-----------------------------------------------------
    	-- Check for non-existence common code
    	-----------------------------------------------------
    	UPDATE MIG_CO012_IN a set is_valid = 'N'
    	where ( 
    	    (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE  )) 
    	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE )) 
    	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CHARGE_TYPE_CAT and entry_code = CHARGE_TYPE )) 
    	 OR (length(CHARGE_NATURE)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CHARGE_NATURE_CAT and entry_code = CHARGE_NATURE )) 
    	 OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COLLATERAL_STATUS_CAT and entry_code = COLLATERAL_STATUS )) 
    	 OR (CUSTODIAN_TYPE = 'I' AND not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = '40' and entry_code = SECURITY_CUSTODIAN )) 
    	) 
    	and a.is_valid = 'Y';
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO012', SECURITY_ID, 'COM001',
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('LOC_ORG_CODE', LOC_ORG_CODE, LOC_ORG_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('SOURCE_SECURITY_SUB_TYPE', SOURCE_SECURITY_SUB_TYPE, SOURCE_SEC_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('CHARGE_TYPE', CHARGE_TYPE, CHARGE_TYPE_CAT)
            ||(CASE WHEN length(CHARGE_NATURE)>0 THEN GET_INVALID_COMMON_CODE_MSG('CHARGE_NATURE', CHARGE_NATURE, CHARGE_NATURE_CAT) ELSE '' END)            
            ||(CASE WHEN CUSTODIAN_TYPE='I' THEN GET_INVALID_COMMON_CODE_MSG('SECURITY_CUSTODIAN', SECURITY_CUSTODIAN, '40') ELSE '' END)            
			|| GET_INVALID_COMMON_CODE_MSG('COLLATERAL_STATUS', COLLATERAL_STATUS, COLLATERAL_STATUS_CAT)
	FROM MIG_CO012_IN
    	WHERE ( 
    	        (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE  )) 
    	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE )) 
    	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CHARGE_TYPE_CAT and entry_code = CHARGE_TYPE )) 
    	     OR (length(CHARGE_NATURE)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CHARGE_NATURE_CAT and entry_code = CHARGE_NATURE )) 
    	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COLLATERAL_STATUS_CAT and entry_code = COLLATERAL_STATUS )) 
    	     OR (CUSTODIAN_TYPE = 'I' AND not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = '40' and entry_code = SECURITY_CUSTODIAN )) 
    	));
      	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO012_IN', 'SIBS', 6);
	commit;
    
	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------
	UPDATE MIG_CO012_IN a set is_valid = 'N'
	where ( 
                (CUSTODIAN_TYPE not in ('I', 'E'))            
             OR (IS_LEGAL_ENFORCE not in ('Y', 'N', 'O'))            
      	) 
      	and a.is_valid = 'Y';

      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO012', SECURITY_ID, 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| (CASE WHEN (CUSTODIAN_TYPE not in ('I', 'E')) THEN GET_INVALID_VALUE_MSG('CUSTODIAN_TYPE', CUSTODIAN_TYPE, 'I/E') ELSE '' END)
			|| (CASE WHEN (IS_LEGAL_ENFORCE not in ('Y', 'N', 'O')) THEN GET_INVALID_VALUE_MSG('IS_LEGAL_ENFORCE', IS_LEGAL_ENFORCE, 'Y/N/O') ELSE '' END)
	FROM MIG_CO012_IN
       	WHERE ( 
                (CUSTODIAN_TYPE not in ('I', 'E'))            
             OR (IS_LEGAL_ENFORCE not in ('Y', 'N', 'O'))            
      	));
      	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO012_IN', 'SIBS', 0);
END
@	


CREATE PROCEDURE MIG_VALIDATE_CO014_CL
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO014_CL', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CO014_CL
	SET IS_VALID = 'N'
	WHERE length(RECORD_TYPE)=0
			OR length(SECURITY_ID)=0
			OR length(CMS_SECURITY_SUBTYPE_ID)=0
			-- OR length(SECURITY_REF_NOTE)=0            
			OR length(SOURCE_SECURITY_TYPE)=0
			OR length(SOURCE_SECURITY_SUB_TYPE)=0
			OR length(LOC_ORG_CODE)=0            
            OR length(SOURCE_SECURITY_SUB_TYPE)=0
            OR length(COLLATERAL_STATUS)=0;

	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO014', SECURITY_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
		|| BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| BVL(CMS_SECURITY_SUBTYPE_ID, ' [CMS_SECURITY_SUBTYPE_ID] ')
		-- || BVL(SECURITY_REF_NOTE, ' [SECURITY_REF_NOTE] ')
		|| BVL(SOURCE_SECURITY_TYPE, ' [SOURCE_SECURITY_TYPE] ')
		|| BVL(SOURCE_SECURITY_SUB_TYPE, '[SOURCE_SECURITY_SUB_TYPE] ')
		|| BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
		|| BVL(SOURCE_SECURITY_SUB_TYPE, ' [SOURCE_SECURITY_SUB_TYPE] ')
		|| BVL(COLLATERAL_STATUS, ' [COLLATERAL_STATUS] ')
		|| ' is/are empty.'						
	FROM MIG_CO014_CL
	WHERE IS_VALID = 'N'
	AND (length(RECORD_TYPE)=0
		OR length(SECURITY_ID)=0
		OR length(CMS_SECURITY_SUBTYPE_ID)=0
		OR length(SOURCE_SECURITY_TYPE)=0
		OR length(SOURCE_SECURITY_SUB_TYPE)=0
		OR length(LOC_ORG_CODE)=0            
            	OR length(SOURCE_SECURITY_SUB_TYPE)=0
            	OR length(COLLATERAL_STATUS)=0));

	CALL LOG_PROC_TIME('MIG_VALIDATE_CO014_CL', 'SIBS', 1);
	commit;
    
	-----------------------------------------
	-- Check for duplicate security Id records
	-----------------------------------------
	
	UPDATE MIG_CO014_CL a set is_valid = 'N'
  	where a.SECURITY_ID in (select t.SECURITY_ID
  	from MIG_CO014_CL t
  	group by t.SECURITY_ID
  	having count(*) > 1)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO014', SECURITY_ID, 'DUP001', 
		'[M] Duplicate security info for Clean Security ID [' 
  		|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
  	from MIG_CO014_CL where is_valid = 'N'
  	group by SECURITY_ID
  	having count(*) > 1);
	
    
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO014_CL', 'SIBS', 2);
	commit;
    
	UPDATE MIG_CO014_CL a set is_valid = 'N'
  	where exists (select 1 from CMS_SECURITY t
	  	where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID fetch first row only)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO014', a.SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in other subtype for Collateral Name [' 
	  	|| t.SECURITY_REF_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO014_CL a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_ID = t.SECURITY_ID
    	and t.SUBTYPE <> 'CL');
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO014_CL', 'SIBS', 3);
	commit;
	
	--------------------------------------------------------------
	-- Check for duplicate collateral name records
	--
	--------------------------------------------------------------
	UPDATE MIG_CO014_CL a set is_valid = 'N'
  	where a.SECURITY_REF_NOTE in (select t.SECURITY_REF_NOTE
  	from MIG_CO014_CL t
  	group by t.SECURITY_REF_NOTE
  	having count(*) > 1)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO014', SECURITY_REF_NOTE, 'DUP002', 
		'[M] Duplicate security info for Clean Collateral Name [' 
	  	|| SECURITY_REF_NOTE || '] - ' || trim(char(count(*))) || ' records found]'
  	from MIG_CO014_CL where is_valid = 'N'
  	group by SECURITY_REF_NOTE
  	having count(*) > 1);
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO014_CL', 'SIBS', 4);
	commit;
	
	UPDATE MIG_CO014_CL a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO014', a.SECURITY_ID, a.SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in other subtype for Security ID [' 
	  	|| t.SECURITY_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.CMS_SECURITY_SUBTYPE_ID || '].'
	from MIG_CO014_CL a, VW_MIG_SEC t
	where a.is_valid = 'N'
	and a.SECURITY_REF_NOTE = t.SECURITY_REF_NOTE
    	and t.SUBTYPE <> 'CL');
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO014_CL', 'SIBS', 5);
	commit;

    	-----------------------------------------------------
    	-- Check for error mapping between source 
    	-----------------------------------------------------
	UPDATE MIG_CO014_CL a set is_valid = 'N'
  	where not exists (select 1
  	from COMMON_CODE_CATEGORY_ENTRY t
  	where t.ENTRY_CODE = a.SOURCE_SECURITY_SUB_TYPE 
    	and t.REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID
  	and t.CATEGORY_CODE = 'SOURCE_CMS_SEC_TYPE_MAP')
  	and a.is_valid = 'Y';
    
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO014', SECURITY_ID, 'EMAP001', 
		'[H] Error mapping between Source Security Sub Type [' 
	  	|| SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type [' || CMS_SECURITY_SUBTYPE_ID || '] '
  	from MIG_CO014_CL a
    	where not exists (select 1
  	from COMMON_CODE_CATEGORY_ENTRY t
  	where t.ENTRY_CODE = a.SOURCE_SECURITY_SUB_TYPE 
    	and t.REF_ENTRY_CODE = a.CMS_SECURITY_SUBTYPE_ID
  	and t.CATEGORY_CODE = 'SOURCE_CMS_SEC_TYPE_MAP'));

	commit;
    	-----------------------------------------------------
    	-- Check for non-existence common code
    	-----------------------------------------------------
	UPDATE MIG_CO014_CL a set is_valid = 'N'
	where ( 
    	        (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE  )) 
    	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE   )) 
    	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COLLATERAL_STATUS_CAT and entry_code = COLLATERAL_STATUS )) 
    	) 
    	and a.is_valid = 'Y';
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO014', SECURITY_ID, 'COM001',
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('LOC_ORG_CODE', LOC_ORG_CODE, LOC_ORG_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('SOURCE_SECURITY_SUB_TYPE', SOURCE_SECURITY_SUB_TYPE, SOURCE_SEC_CAT)
			|| GET_INVALID_COMMON_CODE_MSG('COLLATERAL_STATUS', COLLATERAL_STATUS, COLLATERAL_STATUS_CAT)
	FROM MIG_CO014_CL
       	WHERE ( 
    	        (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = LOC_ORG_CAT and entry_code = LOC_ORG_CODE  )) 
    	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = SOURCE_SEC_CAT and entry_code = SOURCE_SECURITY_SUB_TYPE   )) 
    	     OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = COLLATERAL_STATUS_CAT and entry_code = COLLATERAL_STATUS )) 
    	));
    
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO014_CL', 'SIBS', 6);
	commit;
    
    
    	-----------------------------------------------------
    	-- Check for invalid values
    	-----------------------------------------------------
    	UPDATE MIG_CO014_CL a set is_valid = 'N'
    	where ( 
    	     (IS_LEGAL_ENFORCE not in ('Y', 'N', 'O'))            
    	) 
    	and a.is_valid = 'Y';

      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO014', SECURITY_ID, 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| GET_INVALID_VALUE_MSG('IS_LEGAL_ENFORCE', IS_LEGAL_ENFORCE, 'Y/N/O')
	FROM MIG_CO014_CL
    	WHERE ( 
             (IS_LEGAL_ENFORCE not in ('Y', 'N', 'O'))            
      	));
      	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO014_CL', 'SIBS', 0);
	commit;
    
    
END@	

/* ----------------------------------------------- Start of Collateral Related Information ---------------------------------------- */

-- Added by KLYong
CREATE PROCEDURE MIG_VALIDATE_CO015_VL
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO015_VL', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CO015_VL
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
			OR length(VALUER_CODE)=0
			OR VALUATION_DATE is null
			OR length(VALUATION_CURRENCY)=0
			OR length(CMV)=0;
			--OR (length(APPRAISAL_VALUE)>0 and APPRAISAL_VALUE_DATE is null);			-- Conditional mandatory
	
	commit;
	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO015', SECURITY_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| BVL(VALUER_CODE, ' [VALUER_CODE] ')
		|| NVL2(char(VALUATION_DATE), '', ' [VALUATION_DATE] ')
		|| BVL(VALUATION_CURRENCY, ' [VALUATION_CURRENCY] ')
		|| NVL2(char(CMV), '', ' [CMV] ')
		--|| (CASE WHEN length(APPRAISAL_VALUE)>0 THEN NVL2(char(APPRAISAL_VALUE_DATE), '', ' [APPRAISAL_VALUE_DATE] ') ELSE '' END)		-- Conditional mandatory
		|| ' is/are empty.'						
	FROM MIG_CO015_VL
	WHERE IS_VALID = 'N'
	AND (length(SECURITY_ID)=0
		OR length(VALUER_CODE)=0
		OR VALUATION_DATE is null
		OR length(VALUATION_CURRENCY)=0
		OR length(CMV)=0));
		--OR (length(APPRAISAL_VALUE)>0 and APPRAISAL_VALUE_DATE is null)));
	
	commit;
	-----------------------------------------
	-- Check for duplicate security Id records
	-----------------------------------------
	UPDATE MIG_CO015_VL a SET is_valid = 'N'
	WHERE a.SECURITY_ID IN (
		select t.SECURITY_ID
		from MIG_CO015_VL t
		group by t.SECURITY_ID
		having count(*) > 1)
	AND a.IS_VALID = 'Y';

	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
		(select current_timestamp, 'SIBS', 'CO015', SECURITY_ID, 'DUP001', 
			'[M] Duplicate security info for Security ID [' 
		|| SECURITY_ID || '] - ' || trim(char(count(*))) || ' records found]'
	FROM MIG_CO015_VL WHERE is_valid = 'N'
	GROUP BY SECURITY_ID
	HAVING COUNT(*) > 1);
	
	commit;
	-----------------------------------------
	-- Check for dependancy in
	-- CMS_SECURITY
	-----------------------------------------
	UPDATE MIG_CO015_VL
	SET IS_VALID = 'N'
	WHERE SECURITY_ID IS NOT NULL
	AND NOT EXISTS
		(select 1 from CMS_SECURITY s
		where s.sci_security_dtl_id = security_id fetch first row only)
	AND IS_VALID = 'Y';
	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
		(select current_timestamp, 'SIBS', 'CO015', SECURITY_ID, 'SNF001',
		'[H] Failed to find security info for Security ID [' || security_id ||'] from the respective Collaterals interface files'
	FROM MIG_CO015_VL
	WHERE IS_VALID = 'N'
	AND SECURITY_ID IS NOT NULL
	AND NOT EXISTS
		(select 1 from CMS_SECURITY s
		where s.sci_security_dtl_id = security_id fetch first row only));	
		
	commit;
	-----------------------------------------
	-- Check against common code
	-- COMMON_CODE_CATEGORY_ENTRY
	-----------------------------------------			
	UPDATE MIG_CO015_VL a set is_valid = 'N'
	where ( 
		(not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = VALUER_CAT and entry_code = VALUER_CODE fetch first row only)) 
	) 
	and a.is_valid = 'Y';	
	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO015',  SECURITY_ID, 'COM001', 
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('VALUER_CODE', VALUER_CODE, VALUER_CAT)
	FROM MIG_CO015_VL
       	WHERE ( 
    	    (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = VALUER_CAT and entry_code = VALUER_CODE fetch first row only)) 
      	));		

	commit;
	-----------------------------------------
	--  Check against ISO currency code
	-- SCI_CURRENCY
	-----------------------------------------
	UPDATE MIG_CO015_VL val
	SET IS_VALID = 'N'
	WHERE NOT EXISTS (
		select 1 from SCI_CURRENCY curr
		where curr.CUR_CRRNCY_ISO_CODE = val.VALUATION_CURRENCY fetch first row only)
	AND IS_VALID = 'Y';
	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
		(select current_timestamp, 'SIBS', 'CO015', SECURITY_ID, 'NAV002',
		'[H] Failed to match iso currency code [' || VALUATION_CURRENCY ||'] against sci_currency table'
	FROM MIG_CO015_VL
	WHERE IS_VALID = 'N'
	AND VALUATION_CURRENCY IS NOT NULL
	AND NOT EXISTS
		(select 1 from SCI_CURRENCY curr
		where curr.CUR_CRRNCY_ISO_CODE = VALUATION_CURRENCY fetch first row only));
	
	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------
	-- REMARKED: ASSUMPTION_VALUE had been removed from being sent
	-- UPDATE MIG_CO015_VL a set is_valid = 'N'
	-- where ( (length(ASSUMPTION_VALUE)>0 and ASSUMPTION_VALUE not in ('V', 'F'))
    	-- ) 
	-- and a.is_valid = 'Y';
      
	-- INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	-- (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO015', SECURITY_ID, 'NAV001',
			-- '[M] Not Acceptable Values: ' 
			-- || (CASE WHEN length(ASSUMPTION_VALUE)>0 THEN GET_INVALID_VALUE_MSG('ASSUMPTION_VALUE', CHAR(ASSUMPTION_VALUE), 'V/F') ELSE '' END)
	-- FROM MIG_CO015_VL
      	-- WHERE ( (length(ASSUMPTION_VALUE)>0 and ASSUMPTION_VALUE not in ('V', 'F'))
      	-- ));			
			
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO015_VL', 'SIBS', 0);
	
END@		


CREATE PROCEDURE MIG_VALIDATE_CO016_IN
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO016_IN', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CO016_IN
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
		--OR length(INSURER_NAME_CODE)=0
		--OR length(INSURANCE_TYPE_CODE)=0
		OR length(INSURED_AMT)=0
		--OR EFFECTIVE_DATE is null
		OR EXPIRY_DATE is null
		OR length(POLICY_SEQ_NO)=0;
		--OR length(BANK_CUST_ARRANGE_INS_IND)=0
		--OR INS_ISSUE_DATE is null
		--OR (AUTO_DEBIT='Y' and length(DEBITING_ACC_NO)=0)		-- Conditional mandatory
		--OR (AUTO_DEBIT='Y' and length(ACC_TYPE_CODE)=0);				-- Conditional mandatory
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO016', SECURITY_ID, POLICY_NUMBER, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(SECURITY_ID, ' [SECURITY_ID] ')
		--|| BVL(INSURER_NAME_CODE, ' [INSURER_NAME_CODE] ')
		--|| BVL(INSURANCE_TYPE_CODE, ' [INSURANCE_TYPE_CODE] ')
		|| NVL2(char(INSURED_AMT), '', ' [INSURED_AMT] ')
		--|| NVL2(char(EFFECTIVE_DATE), '', ' [EFFECTIVE_DATE] ')
		|| NVL2(char(EXPIRY_DATE), '', ' [EXPIRY_DATE] ')
		|| BVL(POLICY_SEQ_NO, ' [POLICY_SEQ_NO] ')
		--|| BVL(BANK_CUST_ARRANGE_INS_IND, ' [BANK_CUST_ARRANGE_INS_IND] ')
		--|| NVL2(char(INS_ISSUE_DATE), '', ' [INS_ISSUE_DATE] ')
		--|| (CASE WHEN AUTO_DEBIT='Y' THEN NVL2(char(DEBITING_ACC_NO), '', ' [DEBITING_ACC_NO] ') ELSE '' END)	-- Conditional mandatory
		--|| (CASE WHEN AUTO_DEBIT='Y' THEN BVL(ACC_TYPE_CODE, ' [ACC_TYPE_CODE] ') ELSE '' END)				-- Conditional mandatory
		|| ' is/are empty.'						
	FROM MIG_CO016_IN
	WHERE IS_VALID = 'N'
	AND (length(SECURITY_ID)=0
		OR length(INSURED_AMT)=0
		OR EXPIRY_DATE is null));
	
	commit;
	---------------------------------
	-- Check for duplicate records
	---------------------------------
	-- added by hshii: new field policy_seq_no + security_id is the unique key of insurance policy
	update mig_co016_in a set is_valid = 'N'
	where (a.security_id, a.POLICY_SEQ_NO) in (
		select t.security_id, t.POLICY_SEQ_NO
		from mig_co016_in t
		group by t.security_id, t.POLICY_SEQ_NO
		having count(*) > 1)
	and is_valid = 'Y';
	
	 INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
		 (select current_timestamp, 'SIBS', 'CO016',  SECURITY_ID, POLICY_SEQ_NO, 'DUP001', 
		 '[M] Duplicate insurance policy info for Security ID [' || SECURITY_ID || '] Policy Sequence Number [' || POLICY_SEQ_NO
		 || '] - ' || trim(char(count(*))) || ' records found]' 
	 FROM MIG_CO016_IN a
	 WHERE (a.SECURITY_ID, a.POLICY_SEQ_NO) in 
		 (select t.SECURITY_ID, t.POLICY_SEQ_NO
	  	 from MIG_CO016_IN t
	  	 group by t.SECURITY_ID, t.POLICY_SEQ_NO
	  	 having count(*) > 1)
	 AND IS_VALID = 'N'
	 GROUP BY a.SECURITY_ID, a.POLICY_SEQ_NO);
		
    -- commented off by Cynthia: since policy number is optional, there is no way to check for duplicates
	-- UPDATE MIG_CO016_IN a SET IS_VALID = 'N'
	-- WHERE (a.SECURITY_ID, a.POLICY_NUMBER) in (
		-- select t.SECURITY_ID, t.POLICY_NUMBER
	  	-- from MIG_CO016_IN t
	  	-- group by t.SECURITY_ID, t.POLICY_NUMBER
	  	-- having count(*) > 1)
	-- AND a.IS_VALID = 'Y';
  	
	-- INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
		-- (select current_timestamp, 'SIBS', 'CO016',  SECURITY_ID, POLICY_NUMBER, 'DUP001', 
		-- '[M] Duplicate insurance policy info for Security ID [' || SECURITY_ID || '] Policy Number [' || POLICY_NUMBER
		-- || '] - ' || trim(char(count(*))) || ' records found]' 
	-- FROM MIG_CO016_IN a
	-- WHERE (a.SECURITY_ID, a.POLICY_NUMBER) in 
		-- (select t.SECURITY_ID, t.POLICY_NUMBER
	  	-- from MIG_CO016_IN t
	  	-- group by t.SECURITY_ID, t.POLICY_NUMBER
	  	-- having count(*) > 1)
	-- AND IS_VALID = 'N'
	-- GROUP BY a.SECURITY_ID, a.POLICY_NUMBER);
	
	-----------------------------------------
	-- Check for dependancy in
	-- CMS_SECURITY
	-----------------------------------------	
	UPDATE MIG_CO016_IN
	SET IS_VALID = 'N'
	WHERE SECURITY_ID IS NOT NULL
	AND NOT EXISTS
		(SELECT 1 FROM CMS_SECURITY s
		WHERE s.sci_security_dtl_id = security_id
		AND s.source_id = 'SIBS' fetch first row only)
	AND IS_VALID = 'Y';
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO016', SECURITY_ID, POLICY_NUMBER, 'SNF001',
		'[H] Failed to find security info for Security ID [' || security_id || '] the respective Collaterals interface files'
	FROM MIG_CO016_IN
	WHERE IS_VALID = 'N'
	AND SECURITY_ID IS NOT NULL
	AND NOT EXISTS
		(SELECT 1 FROM CMS_SECURITY s
		WHERE s.sci_security_dtl_id = security_id
		AND s.source_id = 'SIBS' fetch first row only));	

	commit;
	-----------------------------------------
	-- Check against common code
	-- COMMON_CODE_CATEGORY_ENTRY
	-----------------------------------------		
	UPDATE MIG_CO016_IN a set is_valid = 'N'
	where ( 
		-- (length(INSURER_NAME_CODE) >0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = INSURER_NAME_CAT and entry_code = INSURER_NAME_CODE fetch first row only))  	//Remarked to skip checking
	 --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = INSURANCE_TYPE_CAT and entry_code = INSURANCE_TYPE_CODE fetch first row only)) 
	 --OR 
     (length(BANK_CUST_ARRANGE_INS_IND)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = BANK_CUST_ARRANGE_INS_CAT and entry_code = BANK_CUST_ARRANGE_INS_IND fetch first row only)) 
	 OR (length(BUILDING_OCCUPATION_CODE)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = BUILDING_OCCUPATION_CAT and entry_code = BUILDING_OCCUPATION_CODE fetch first row only)) 
	 --OR (length(POLICY_CUSTODIAN_CODE)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = POLICY_CUSTODIAN_CAT and entry_code = POLICY_CUSTODIAN_CODE fetch first row only)) 
	 --OR (AUTO_DEBIT='Y' and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ACC_TYPE_CAT and entry_code = ACC_TYPE_CODE fetch first row only)) 
	) 
	and a.is_valid = 'Y';	
	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO016',  SECURITY_ID, POLICY_NUMBER, 'COM001', 
			'[M] Non Existence Common Code: ' 
			-- || (CASE WHEN length(INSURER_NAME_CODE)>0 THEN GET_INVALID_COMMON_CODE_MSG('INSURER_NAME_CODE', INSURER_NAME_CODE, INSURER_NAME_CAT) ELSE '' END) 	//Remarked to skip checking
			--|| GET_INVALID_COMMON_CODE_MSG('INSURANCE_TYPE_CODE', INSURANCE_TYPE_CODE, INSURANCE_TYPE_CAT)
			|| (CASE WHEN length(BANK_CUST_ARRANGE_INS_IND)>0 THEN GET_INVALID_COMMON_CODE_MSG('BANK_CUST_ARRANGE_INS_IND', BANK_CUST_ARRANGE_INS_IND, BANK_CUST_ARRANGE_INS_CAT) ELSE '' END)
			|| (CASE WHEN length(BUILDING_OCCUPATION_CODE)>0 THEN GET_INVALID_COMMON_CODE_MSG('BUILDING_OCCUPATION_CODE', BUILDING_OCCUPATION_CODE, BUILDING_OCCUPATION_CAT) ELSE '' END)
			--|| (CASE WHEN length(POLICY_CUSTODIAN_CODE)>0 THEN GET_INVALID_COMMON_CODE_MSG('POLICY_CUSTODIAN_CODE', POLICY_CUSTODIAN_CODE, POLICY_CUSTODIAN_CAT) ELSE '' END)
			--|| (CASE WHEN AUTO_DEBIT = 'Y' THEN GET_INVALID_COMMON_CODE_MSG('ACC_TYPE_CODE', ACC_TYPE_CODE, ACC_TYPE_CAT) ELSE '' END)
	FROM MIG_CO016_IN
       	WHERE ( 
			-- (length(INSURER_NAME_CODE) >0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = INSURER_NAME_CAT and entry_code = INSURER_NAME_CODE fetch first row only))  	//Remarked to skip checking
		 --OR (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = INSURANCE_TYPE_CAT and entry_code = INSURANCE_TYPE_CODE fetch first row only)) 
		 --OR 
         (length(BANK_CUST_ARRANGE_INS_IND)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = BANK_CUST_ARRANGE_INS_CAT and entry_code = BANK_CUST_ARRANGE_INS_IND fetch first row only)) 
    	 OR (length(BUILDING_OCCUPATION_CODE)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = BUILDING_OCCUPATION_CAT and entry_code = BUILDING_OCCUPATION_CODE fetch first row only)) 
    	 --OR (length(POLICY_CUSTODIAN_CODE)>0 and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = POLICY_CUSTODIAN_CAT and entry_code = POLICY_CUSTODIAN_CODE fetch first row only)) 
    	 --OR (AUTO_DEBIT='Y' and not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = ACC_TYPE_CAT and entry_code = ACC_TYPE_CODE fetch first row only)) 
      	));	

	commit;
	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------
	UPDATE MIG_CO016_IN a set is_valid = 'N'
	where ( (length(NONSCHEMA_SCHEMA)>0 and NONSCHEMA_SCHEMA not in ('Y', 'N')) 
			OR (length(AUTO_DEBIT)>0 and AUTO_DEBIT not in ('Y', 'N'))
    	) 
	and a.is_valid = 'Y';
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO016', SECURITY_ID, POLICY_NUMBER, 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| (CASE WHEN (length(NONSCHEMA_SCHEMA)>0 and NONSCHEMA_SCHEMA not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('NONSCHEMA_SCHEMA', CHAR(NONSCHEMA_SCHEMA), 'Y/N') ELSE '' END)
			|| (CASE WHEN (length(AUTO_DEBIT)>0 and AUTO_DEBIT not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('AUTO_DEBIT', CHAR(AUTO_DEBIT), 'N') ELSE '' END)
	FROM MIG_CO016_IN
      	WHERE ( (length(NONSCHEMA_SCHEMA)>0 and NONSCHEMA_SCHEMA not in ('Y', 'N')) 
			OR (length(AUTO_DEBIT)>0 and AUTO_DEBIT not in ('Y', 'N'))
      	));	
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO016_IN', 'SIBS', 0);
END@					


CREATE PROCEDURE MIG_VALIDATE_CO017_CD
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO017_CD', 'SIBS', 1);
	COMMIT;
	
	UPDATE MIG_CO017_CD
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID) = 0
			OR length(LIMIT_ID) = 0
			OR length(APPLICATION_NO) = 0
			OR length(FACILITY_CODE) = 0
			OR FACILITY_SEQ = 0
			OR FACILITY_SEQ IS NULL
			OR RANKING_OF_SECURITY = 0
			OR length(CHARGE_AMT) = 0
			-- OR DATE_LEGALLY_CHARGE is null
			OR length(FIRST_THIRD_PARTY_CHARGE) = 0
			OR length(CHARGE_TYPE_CODE) = 0
			-- OR (RANKING_OF_SECURITY > 1 and length(CHARGEE_OF_PRIOR_CHARGE) = 0)
			-- OR (RANKING_OF_SECURITY > 1 and length(PRIOR_CHARGE_TYPE_CODE) = 0)
			-- OR ((RANKING_OF_SECURITY > 1 or PRIOR_CHARGE_TYPE_CODE <> 'O') and length(PRIOR_CHARGE_AMOUNT) = 0)
			OR length(CAVEAT_WAIVED_IND) = 0;
			-- OR (CAVEAT_WAIVED_IND = 'N' and length(CAVEAT_PRESENTATION_NO) = 0)
			-- OR (CAVEAT_WAIVED_IND = 'N' and CAVEAT_EXPIRY_DATE is null);
			
	commit;
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO017', SECURITY_ID, APPLICATION_NO, FACILITY_CODE, TRIM(CHAR(FACILITY_SEQ)), TRIM(CHAR(RANKING_OF_SECURITY)), 'MAN001', 
		'[L] Mandatory Field(s): '
		|| BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| BVL(LIMIT_ID, ' [LIMIT_ID] ')
		|| BVL(APPLICATION_NO, ' [APPLICATION_NO] ')
		|| BVL(FACILITY_CODE, ' [FACILITY_CODE] ')
		|| (CASE WHEN FACILITY_SEQ=0 OR FACILITY_SEQ IS NULL THEN ' [FACILITY_SEQ] ' ELSE '' END)
		|| (CASE WHEN RANKING_OF_SECURITY=0 THEN ' [RANKING_OF_SECURITY] ' ELSE '' END)
		|| NVL2(char(CHARGE_AMT), '', ' [CHARGE_AMT] ')
		-- || NVL2(char(DATE_LEGALLY_CHARGE), '', ' [DATE_LEGALLY_CHARGE] ')
		|| BVL(FIRST_THIRD_PARTY_CHARGE, ' [FIRST_THIRD_PARTY_CHARGE] ')
		|| BVL(CHARGE_TYPE_CODE, ' [CHARGE_TYPE_CODE] ')
		-- || (CASE WHEN RANKING_OF_SECURITY > 1 THEN BVL(CHARGEE_OF_PRIOR_CHARGE, ' [CHARGEE_OF_PRIOR_CHARGE] ') ELSE '' END)
		-- || (CASE WHEN RANKING_OF_SECURITY > 1 THEN BVL(PRIOR_CHARGE_TYPE_CODE, ' [PRIOR_CHARGE_TYPE_CODE] ') ELSE '' END)
		-- || (CASE WHEN RANKING_OF_SECURITY > 1 or PRIOR_CHARGE_TYPE_CODE <> 'O' THEN NVL2(char(PRIOR_CHARGE_AMOUNT), '', ' [PRIOR_CHARGE_AMOUNT] ') ELSE '' END)
		|| BVL(CAVEAT_WAIVED_IND, ' [CAVEAT_WAIVED_IND] ')
		-- || (CASE WHEN CAVEAT_WAIVED_IND = 'N' THEN BVL(CAVEAT_PRESENTATION_NO, ' [CAVEAT_PRESENTATION_NO] ') ELSE '' END)
		-- || (CASE WHEN CAVEAT_WAIVED_IND = 'N' THEN NVL2(char(CAVEAT_EXPIRY_DATE), '', ' [CAVEAT_EXPIRY_DATE] ') ELSE '' END)
		|| ' is/are empty.'						
	FROM MIG_CO017_CD
	WHERE IS_VALID = 'N'
	AND (length(SECURITY_ID) = 0
		OR length(LIMIT_ID) = 0
		OR length(APPLICATION_NO) = 0
		OR length(FACILITY_CODE) = 0
		OR FACILITY_SEQ = 0
		OR FACILITY_SEQ IS NULL
		OR RANKING_OF_SECURITY = 0
		OR length(CHARGE_AMT) = 0
		OR length(FIRST_THIRD_PARTY_CHARGE) = 0
		OR length(CHARGE_TYPE_CODE) = 0
		OR length(CAVEAT_WAIVED_IND) = 0));
	
	commit;
	-------------------------------
	-- Populate Extra columns first
	-------------------------------	
	create index temp_index_1 on mig_co017_cd
		(is_valid, security_id)
		allow reverse scans
		collect statistics;
		
	commit;
		
	lock table MIG_CO017_CD in exclusive mode;
	UPDATE MIG_CO017_CD t SET (cms_act_col_id, cms_stg_col_id, currency_code) =
		(select reference_id , staging_reference_id, sec.SCI_SECURITY_CURRENCY
		from cms_security sec, transaction trx
		where sec.cms_collateral_id = reference_id
		and trx.transaction_type = 'COL'
		and sec.source_id = 'SIBS'
		and sec.sci_security_dtl_id = t.security_id)
	WHERE is_valid = 'Y';
	 
	drop index temp_index_1;
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO017_CD', 'SIBS', 2);
	commit;
	
	lock table MIG_CO017_CD in share mode;
	UPDATE MIG_CO017_CD t
	SET cms_act_lmt_id = 
		(select cms_lsp_appr_lmts_id
		from sci_lsp_appr_lmts lmt
		where source_id = 'RLOS'
        and LMT_ID = t.LIMIT_ID
		--and lmt.lmt_bca_ref_num = t.application_no
		--and lmt.lmt_fac_code = t.facility_code
		--and lmt.lmt_fac_seq = t.facility_seq
        )
	WHERE is_valid = 'Y';
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO017_CD', 'SIBS', 3);
	commit;
	
	UPDATE MIG_CO017_CD t SET cms_stg_lmt_id =
		(select staging_reference_id
		from transaction trx
		where t.cms_act_lmt_id = reference_id
		and trx.transaction_type = 'LIMIT')
	WHERE is_valid = 'Y';
	 
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO017_CD', 'SIBS', 4);
	commit;
	
	CALL RUNSTATS_HELPER('CMS_LIMIT_SECURITY_MAP', 'cms_collateral_id, cms_lsp_appr_lmts_id');
	
	lock table MIG_CO017_CD in exclusive mode;
	UPDATE MIG_CO017_CD t SET (cms_act_chrg_id, cms_act_aa_id) = 
		(select charge_id , cms_lsp_lmt_profile_id
		from cms_limit_security_map 
		where cms_collateral_id = t.cms_act_col_id
		and cms_lsp_appr_lmts_id = t.cms_act_lmt_id)
	 WHERE is_valid = 'Y';
	 
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO017_CD', 'SIBS', 5);
	commit;
	
	---------------------------------
	-- Check for duplicate records
	---------------------------------
	UPDATE MIG_CO017_CD a SET is_valid = 'N'
	WHERE (a.CMS_ACT_COL_ID, a.CMS_ACT_LMT_ID, a.RANKING_OF_SECURITY) in 
		(select t.CMS_ACT_COL_ID, t.CMS_ACT_LMT_ID, t.RANKING_OF_SECURITY
		from MIG_CO017_CD t
		where t.cms_act_col_id is not null
		and t.cms_act_lmt_id is not null
		group by t.CMS_ACT_COL_ID, t.CMS_ACT_LMT_ID, t.RANKING_OF_SECURITY
		having count(*) > 1)
	AND a.is_valid = 'Y'
	and a.cms_act_col_id is not null
	and a.cms_act_lmt_id is not null;
	
	commit;

	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
		(select current_timestamp, 'SIBS', 'CO017', SECURITY_ID, APPLICATION_NO, FACILITY_CODE, TRIM(CHAR(FACILITY_SEQ)), TRIM(CHAR(RANKING_OF_SECURITY)), 'DUP001', 
		'[M] Duplicate charge info for Security ID [' || SECURITY_ID 
		|| '] AA Number [' || APPLICATION_NO 
		|| '] Facility Code [' || FACILITY_CODE 
		|| '] Facility Sequence [' || TRIM(CHAR(FACILITY_SEQ)) 
		|| '] Security (Charge) Ranking [' || TRIM(CHAR(RANKING_OF_SECURITY))
		|| '] - ' || trim(char(count(*))) || ' records found]' 
	FROM MIG_CO017_CD a
	WHERE (a.CMS_ACT_COL_ID, a.CMS_ACT_LMT_ID, a.RANKING_OF_SECURITY) IN 
		(select t.CMS_ACT_COL_ID, t.CMS_ACT_LMT_ID, t.RANKING_OF_SECURITY
	  	from MIG_CO017_CD t
	  	where t.cms_act_col_id is not null
	  	and t.cms_act_lmt_id is not null
	  	group by t.CMS_ACT_COL_ID, t.CMS_ACT_LMT_ID, t.RANKING_OF_SECURITY
	  	having count(*) > 1)
	AND a.IS_VALID = 'N'
	and a.cms_act_col_id is not null
	and a.cms_act_lmt_id is not null
	GROUP BY SECURITY_ID, APPLICATION_NO, FACILITY_CODE, FACILITY_SEQ, RANKING_OF_SECURITY);
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO017_CD', 'SIBS', 6);
	commit;
	
	UPDATE MIG_CO017_CD
	SET IS_VALID = 'N'
	WHERE cms_act_col_id IS NULL
	AND IS_VALID = 'Y';
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
		(select current_timestamp, 'SIBS', 'CO017', SECURITY_ID, APPLICATION_NO, FACILITY_CODE, TRIM(CHAR(FACILITY_SEQ)), TRIM(CHAR(RANKING_OF_SECURITY)), 'SNF001',
		'[H] Failed to find security info for Security ID [' || security_id || '] from the respective Collaterals interface files'
	FROM MIG_CO017_CD t
	WHERE IS_VALID = 'N'
	AND cms_act_col_id IS NULL
	AND NOT EXISTS (SELECT 1 
			FROM CMS_SECURITY sec
			WHERE sec.sci_security_dtl_id = t.security_id));
	
	commit;
	
	UPDATE MIG_CO017_CD
	SET IS_VALID = 'N'
	WHERE cms_act_lmt_id IS NULL
	AND IS_VALID = 'Y';

	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
		(select current_timestamp, 'SIBS', 'CO017', SECURITY_ID, APPLICATION_NO, FACILITY_CODE, TRIM(CHAR(FACILITY_SEQ)), TRIM(CHAR(RANKING_OF_SECURITY)), 'LNF001',
		'[H] Failed to find limit info for AA Number [' || application_no 
		|| '] Facility Code [' || facility_code 
		|| '] Facility Sequence [' || COALESCE(trim(CHAR(facility_seq)), 'null') || '] from SIBS CA003 interface file'
	FROM MIG_CO017_CD t
	WHERE IS_VALID = 'N'
	AND cms_act_lmt_id IS NULL
	AND NOT EXISTS (SELECT 1 
			FROM SCI_LSP_APPR_LMTS lmts
			WHERE lmts.LMT_ID = t.LIMIT_ID
			AND lmts.source_id = 'RLOS'));
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO017_CD', 'SIBS', 7);
	COMMIT;
		
	UPDATE MIG_CO017_CD
	SET IS_VALID = 'N'
	WHERE cms_act_lmt_id IS NOT NULL
	AND cms_act_col_id IS NOT NULL
	AND cms_act_chrg_id IS NULL
	AND IS_VALID = 'Y';
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
		(select current_timestamp, 'SIBS', 'CO017', SECURITY_ID, APPLICATION_NO, FACILITY_CODE, TRIM(CHAR(FACILITY_SEQ)), TRIM(CHAR(RANKING_OF_SECURITY)), 'LSLINK001',
		'[H] Failed to find limit security linkages for ' ||
		'Security ID [' || security_id || '] ' ||
		'Application No [' ||application_no || '] ' ||
		'Facility Code [' || facility_code || '] ' ||
		'Facility Sequence [' || trim(char(facility_seq)) || '] from SIBS CA005 interface file'
	FROM MIG_CO017_CD t
	WHERE IS_VALID = 'N'
	AND cms_act_lmt_id IS NOT NULL
	AND cms_act_col_id IS NOT NULL
	AND cms_act_chrg_id IS NULL
	AND NOT EXISTS (select 1
			from cms_limit_security_map 
			where cms_collateral_id = t.cms_act_col_id
			and cms_lsp_appr_lmts_id = t.cms_act_lmt_id));
	
	commit;
	  
	-----------------------------------------
	-- Check against common code
	-- COMMON_CODE_CATEGORY_ENTRY
	-----------------------------------------	 
	UPDATE MIG_CO017_CD a set is_valid = 'N'
	where ( 
		(not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CHARGE_TYPE_CAT and entry_code = CHARGE_TYPE_CODE fetch first row only)) 
	) 
	and a.is_valid = 'Y';	
	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO017',  SECURITY_ID, APPLICATION_NO, FACILITY_CODE, TRIM(CHAR(FACILITY_SEQ)), TRIM(CHAR(RANKING_OF_SECURITY)), 'COM001', 
			'[M] Non Existence Common Code: ' 
			|| GET_INVALID_COMMON_CODE_MSG('CHARGE_TYPE_CODE', CHARGE_TYPE_CODE, CHARGE_TYPE_CAT)
	FROM MIG_CO017_CD
       	WHERE ( 
    	    (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = CHARGE_TYPE_CAT and entry_code = CHARGE_TYPE_CODE fetch first row only)) 
      	));	
		
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO017_CD', 'SIBS', 8);
	COMMIT;
	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------
	UPDATE MIG_CO017_CD a set is_valid = 'N'
	where ( (length(CHARGE_PENDING_REDEMPTION)>0 and (CHARGE_PENDING_REDEMPTION <> 'Y' and CHARGE_PENDING_REDEMPTION <> 'N'))
             OR (CAVEAT_WAIVED_IND not in ('Y', 'N'))
    	) 
      	and a.is_valid = 'Y';
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO017', SECURITY_ID, APPLICATION_NO, FACILITY_CODE, TRIM(CHAR(FACILITY_SEQ)), TRIM(CHAR(RANKING_OF_SECURITY)), 'NAV001',
			'[M] Not Acceptable Values: ' 
			|| (CASE WHEN (length(CHARGE_PENDING_REDEMPTION)>0 and CHARGE_PENDING_REDEMPTION not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('CHARGE_PENDING_REDEMPTION', CHAR(CHARGE_PENDING_REDEMPTION), 'Y/N') ELSE '' END)
			|| (CASE WHEN (CAVEAT_WAIVED_IND not in ('Y', 'N')) THEN GET_INVALID_VALUE_MSG('CAVEAT_WAIVED_IND', CHAR(CAVEAT_WAIVED_IND), 'Y/N') ELSE '' END)
	FROM MIG_CO017_CD
      	WHERE ( (length(CHARGE_PENDING_REDEMPTION)>0 and CHARGE_PENDING_REDEMPTION not in ('Y', 'N'))
             OR (CAVEAT_WAIVED_IND not in ('Y', 'N'))
      	));				
			
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO017_CD', 'SIBS', 9);
	COMMIT;
	-----------------------------------------------------
	-- Check for invalid values
	-----------------------------------------------------
	UPDATE MIG_CO017_CD a set is_valid = 'N'
	where ( length(NATURE_OF_CHARGE)>0
	     AND (
	     	    ((SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = a.SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('E20', 'E40', 'E99', 'F20') AND NATURE_OF_CHARGE <> 'NOC_GENC13')
	     	 OR ((SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = a.SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('F10', 'F11', 'F12', 'F70', 'F71', 'F72') AND NATURE_OF_CHARGE <> 'NOC_PLT04')
	     	 OR ((SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = a.SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('F15') AND NATURE_OF_CHARGE <> 'NOC_OTH09')
	     	 OR ((SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = a.SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('I16', 'I17', 'I18') AND NATURE_OF_CHARGE <> 'NOC_AIR10')
	     	 OR ((SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = a.SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('F13', 'F14', 'F73', 'F74', 'F75', 'F76') AND NATURE_OF_CHARGE <> 'NOC_VEH08')
	     	 OR ((SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = a.SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('G80') AND NATURE_OF_CHARGE <> 'NOC_GOLD04')
	     	 OR ((SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = a.SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('I10', 'I11', 'I12', 'I13', 'I14', 'I15', 'I19') AND NATURE_OF_CHARGE <> 'NOC_VES10')
	     	 OR ((SELECT SCI_SECURITY_TYPE_VALUE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = a.SECURITY_ID and sec.SOURCE_ID = 'SIBS') = 'PT' AND NATURE_OF_CHARGE <> 'NOC_PROP08')
	     	 OR ((SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = a.SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('M01', 'F30', 'F40', 'F50', 'O10') AND NATURE_OF_CHARGE <> 'NOC_OTH12')
	     )
    	) 
      	and a.is_valid = 'Y';
      
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO017', SECURITY_ID, APPLICATION_NO, FACILITY_CODE, TRIM(CHAR(FACILITY_SEQ)), TRIM(CHAR(RANKING_OF_SECURITY)), 'NAV003',
			'[M] Not Acceptable Values: ' 
			|| (CASE WHEN (SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('E20', 'E40', 'E99', 'F20') THEN GET_INVALID_VALUE_MSG('NATURE_OF_CHARGE', NATURE_OF_CHARGE, 'NOC_GENC13') ELSE '' END)
			|| (CASE WHEN (SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('F10', 'F11', 'F12', 'F70', 'F71', 'F72') THEN GET_INVALID_VALUE_MSG('NATURE_OF_CHARGE', NATURE_OF_CHARGE, 'NOC_PLT04') ELSE '' END)
			|| (CASE WHEN (SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('F15') THEN GET_INVALID_VALUE_MSG('NATURE_OF_CHARGE', NATURE_OF_CHARGE, 'NOC_OTH09') ELSE '' END)
			|| (CASE WHEN (SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('I16', 'I17', 'I18') THEN GET_INVALID_VALUE_MSG('NATURE_OF_CHARGE', NATURE_OF_CHARGE, 'NOC_AIR10') ELSE '' END)
			|| (CASE WHEN (SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('F13', 'F14', 'F73', 'F74', 'F75', 'F76') THEN GET_INVALID_VALUE_MSG('NATURE_OF_CHARGE', NATURE_OF_CHARGE, 'NOC_VEH08') ELSE '' END)
			|| (CASE WHEN (SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('G80') THEN GET_INVALID_VALUE_MSG('NATURE_OF_CHARGE', NATURE_OF_CHARGE, 'NOC_GOLD04') ELSE '' END)
			|| (CASE WHEN (SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('I10', 'I11', 'I12', 'I13', 'I14', 'I15', 'I19') THEN GET_INVALID_VALUE_MSG('NATURE_OF_CHARGE', NATURE_OF_CHARGE, 'NOC_VES10') ELSE '' END)
			|| (CASE WHEN (SELECT SCI_SECURITY_TYPE_VALUE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') = 'PT' THEN GET_INVALID_VALUE_MSG('NATURE_OF_CHARGE', NATURE_OF_CHARGE, 'NOC_PROP08') ELSE '' END)
			|| (CASE WHEN (SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('M01', 'F30', 'F40', 'F50', 'O10') THEN GET_INVALID_VALUE_MSG('NATURE_OF_CHARGE', NATURE_OF_CHARGE, 'NOC_OTH12') ELSE '' END)
	FROM MIG_CO017_CD a
      	WHERE ( length(NATURE_OF_CHARGE)>0
	     AND (
	     	    ((SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('E20', 'E40', 'E99', 'F20') AND NATURE_OF_CHARGE <> 'NOC_GENC13')
	     	 OR ((SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('F10', 'F11', 'F12', 'F70', 'F71', 'F72') AND NATURE_OF_CHARGE <> 'NOC_PLT04')
	     	 OR ((SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('F15') AND NATURE_OF_CHARGE <> 'NOC_OTH09')
	     	 OR ((SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('I16', 'I17', 'I18') AND NATURE_OF_CHARGE <> 'NOC_AIR10')
	     	 OR ((SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('F13', 'F14', 'F73', 'F74', 'F75', 'F76') AND NATURE_OF_CHARGE <> 'NOC_VEH08')
	     	 OR ((SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('G80') AND NATURE_OF_CHARGE <> 'NOC_GOLD04')
	     	 OR ((SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('I10', 'I11', 'I12', 'I13', 'I14', 'I15', 'I19') AND NATURE_OF_CHARGE <> 'NOC_VES10')
	     	 OR ((SELECT SCI_SECURITY_TYPE_VALUE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') = 'PT' AND NATURE_OF_CHARGE <> 'NOC_PROP08')
	     	 OR ((SELECT SOURCE_SECURITY_SUB_TYPE FROM CMS_SECURITY sec WHERE sec.SCI_SECURITY_DTL_ID = SECURITY_ID and sec.SOURCE_ID = 'SIBS') IN ('M01', 'F30', 'F40', 'F50', 'O10') AND NATURE_OF_CHARGE <> 'NOC_OTH12')
	     )
    	));				
			
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO017_CD', 'SIBS', 0);
	
END@	


CREATE PROCEDURE MIG_VALIDATE_CO018_PG
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO018_PG', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CO018_PG
	SET IS_VALID = 'N'
	WHERE length(SECURITY_ID)=0
			OR length(PLEDGOR_CIF_ID)=0
			OR length(PLEDGOR_LEGAL_NAME)=0;
			--OR length(REL_WITH_BORROWER_CODE)=0
			--OR length(REL_WITH_BORROWER_DESC)=0;
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
		(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO018', SECURITY_ID, PLEDGOR_CIF_ID, 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| BVL(PLEDGOR_CIF_ID, ' [PLEDGOR_CIF_ID] ')
		|| BVL(PLEDGOR_LEGAL_NAME, ' [PLEDGOR_LEGAL_NAME] ')
		--|| BVL(REL_WITH_BORROWER_CODE, ' [REL_WITH_BORROWER_CODE] ')
		--|| BVL(REL_WITH_BORROWER_DESC, ' [REL_WITH_BORROWER_DESC] ')
		|| ' is/are empty.'						
	FROM MIG_CO018_PG
	WHERE IS_VALID = 'N'
	AND (length(SECURITY_ID)=0
		OR length(PLEDGOR_CIF_ID)=0
		OR length(PLEDGOR_LEGAL_NAME)=0));	
	
	commit;
	
	UPDATE MIG_CO018_PG
	SET IS_VALID = 'N'
	WHERE SECURITY_ID IS NOT NULL
	AND NOT EXISTS
		(select 1 from CMS_SECURITY s
		where s.sci_security_dtl_id = SECURITY_ID)
	AND IS_VALID = 'Y';
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
		(select current_timestamp, 'SIBS', 'CO018', SECURITY_ID, PLEDGOR_CIF_ID, 'SNF001',
		'[H] Failed to find security info for Security ID [' || SECURITY_ID || '] from the respective Collaterals interface files'
	FROM MIG_CO018_PG
	WHERE IS_VALID = 'N'
	AND SECURITY_ID IS NOT NULL
	AND NOT EXISTS
		(select 1 from CMS_SECURITY s
		where s.sci_security_dtl_id = SECURITY_ID));			
		
	commit;
		
	UPDATE MIG_CO018_PG
	SET IS_VALID = 'N'
	WHERE PLEDGOR_CIF_ID IS NOT NULL
	AND NOT EXISTS 
		(select 1 from SCI_LE_MAIN_PROFILE
		where LMP_LE_ID = PLEDGOR_CIF_ID
		and SOURCE_ID = 'SIBS')
	AND IS_VALID = 'Y';
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
		(select current_timestamp, 'SIBS', 'CO018',  SECURITY_ID, PLEDGOR_CIF_ID, 'CNF001',
		'[H] Failed to find customer info for Pledgor CIF ID [' || PLEDGOR_CIF_ID || '] from SIBS CU001 interface file'
	FROM MIG_CO018_PG
	WHERE IS_VALID = 'N'
	AND NOT EXISTS 
		(select 1 from SCI_LE_MAIN_PROFILE
		where LMP_LE_ID = PLEDGOR_CIF_ID
		and SOURCE_ID = 'SIBS'));	
		
	commit;
		
	-----------------------------------------
	-- Relationship with Borrower Code 
	-- COMMON_CODE_CATEGORY_ENTRY
	-----------------------------------------
    -- CZ: commented off for relation with borrower code 
	-- UPDATE MIG_CO018_PG a set is_valid = 'N'
	-- where ( 
		-- (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = REL_WITH_BORROWER_CAT and entry_code = REL_WITH_BORROWER_CODE fetch first row only)) 
	-- ) 
	-- and a.is_valid = 'Y';	
	
	-- INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	-- (select current_timestamp, 'SIBS', 'CO018',  SECURITY_ID, PLEDGOR_CIF_ID, 'COM001', 
			-- '[M] Non Existence Common Code: ' 
			-- || GET_INVALID_COMMON_CODE_MSG('REL_WITH_BORROWER_CODE', REL_WITH_BORROWER_CODE, REL_WITH_BORROWER_CAT)
	-- FROM MIG_CO018_PG
       	-- WHERE ( 
    	    -- (not exists (select 1 from COMMON_CODE_CATEGORY_ENTRY where category_code = REL_WITH_BORROWER_CAT and entry_code = REL_WITH_BORROWER_CODE fetch first row only)) 
      	-- ));	
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO018_PG', 'SIBS', 0);
END
@	

CREATE PROCEDURE MIG_VALIDATE_CO019_PL
	LANGUAGE SQL
BEGIN
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO019_PL', 'SIBS', 1);
	commit;
	
	UPDATE MIG_CO019_PL
	SET IS_VALID = 'N'
	WHERE length(RECORD_TYPE)=0
	    	OR length(SECURITY_ID)=0
	    	OR length(LIMIT_ID)=0
		OR length(APPLICATION_NO)=0            
		OR length(FACILITY_CODE)=0
		OR length(FACILITY_SEQUENCE)=0
		OR length(AMOUNT_PLEDGED)=0            
            	OR length(PERCENT_PLEDGED)=0
            	OR length(AMOUNT_DRAW)=0
            	OR length(PERCENT_DRAW)=0;

	commit;
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO019', SECURITY_ID, LIMIT_ID, APPLICATION_NO, FACILITY_CODE, trim(char(FACILITY_SEQUENCE)), 'MAN001',
		'[L] Mandatory Field(s): '
		|| BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
		|| BVL(SECURITY_ID, ' [SECURITY_ID] ')
		|| BVL(LIMIT_ID, ' [LIMIT_ID] ')
		|| BVL(APPLICATION_NO, ' [APPLICATION_NO] ')
		|| BVL(FACILITY_CODE, ' [FACILITY_CODE] ')
		|| NVL2(char(FACILITY_SEQUENCE), '', ' [FACILITY_SEQUENCE] ')
		|| BVL(char(AMOUNT_PLEDGED), ' [AMOUNT_PLEDGED] ')			
		|| BVL(char(PERCENT_PLEDGED), ' [PERCENT_PLEDGED] ')			
		|| BVL(char(AMOUNT_DRAW), ' [AMOUNT_DRAW] ')			
		|| BVL(char(PERCENT_DRAW), ' [PERCENT_DRAW] ')			
		|| ' is/are empty.'						
	FROM MIG_CO019_PL
	WHERE IS_VALID = 'N'
	AND (length(RECORD_TYPE)=0
	    	OR length(SECURITY_ID)=0
	    	OR length(LIMIT_ID)=0
		OR length(APPLICATION_NO)=0            
		OR length(FACILITY_CODE)=0
		OR length(FACILITY_SEQUENCE)=0
		OR length(AMOUNT_PLEDGED)=0            
            	OR length(PERCENT_PLEDGED)=0
            	OR length(AMOUNT_DRAW)=0
            	OR length(PERCENT_DRAW)=0));

	CALL LOG_PROC_TIME('MIG_VALIDATE_CO019_PL', 'SIBS', 2);
	commit;
    
	-----------------------------------------
	-- Check for duplicate security Id records
	-----------------------------------------
	
	UPDATE MIG_CO019_PL a set is_valid = 'N'
  	where (a.SECURITY_ID, a.APPLICATION_NO, a.LIMIT_ID, a.FACILITY_CODE, a.FACILITY_SEQUENCE) in 
  	(select t.SECURITY_ID, t.APPLICATION_NO, t.LIMIT_ID, t.FACILITY_CODE, t.FACILITY_SEQUENCE
  	from MIG_CO019_PL t
  	group by t.SECURITY_ID, t.APPLICATION_NO, t.LIMIT_ID, t.FACILITY_CODE, t.FACILITY_SEQUENCE
  	having count(*) > 1)
  	and a.is_valid = 'Y';
	
	commit;
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO019', SECURITY_ID, LIMIT_ID, APPLICATION_NO, FACILITY_CODE, trim(char(FACILITY_SEQUENCE)), 'DUP001', 
		'[M] Duplicate limit security mapping info found for AA Number [' || APPLICATION_NO 
		|| '] Limit ID [' || LIMIT_ID
		|| '] Facility Code [' || FACILITY_CODE
		|| '] Facility Sequence [' || trim(char(FACILITY_SEQUENCE))
		|| '] Security Id [' || SECURITY_ID
		|| '] - ' || trim(char(count(*))) || ' records found]' 
  	from MIG_CO019_PL where is_valid = 'N'
  	group by SECURITY_ID, APPLICATION_NO, LIMIT_ID, FACILITY_CODE, FACILITY_SEQUENCE
  	having count(*) > 1);
	
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO019_PL', 'SIBS', 3);
	commit;
    
	--------------------------------
	-- Set limit id
	--------------------------------
	-- UPDATE MIG_CO019_PL A
	-- SET (CMS_ACT_LMT_PROFILE_ID, SRC_LE_ID, CMS_ACT_LMT_ID) = 
			-- (SELECT CMS_LIMIT_PROFILE_ID, LMT_LE_ID, CMS_LSP_APPR_LMTS_ID
		         -- FROM SCI_LSP_APPR_LMTS
		         -- WHERE LMT_ID = A.LIMIT_ID
		         -- --AND LOS_BCA_REF_NUM = A.APPLICATION_NO
		         -- --AND LMT_FAC_CODE = A.FACILITY_CODE
		         -- --AND LMT_FAC_SEQ = A.FACILITY_SEQUENCE
		         -- AND SOURCE_ID = 'RLOS')
    -- WHERE IS_VALID = 'Y';
									
    
    -- CZ: change for performance - need to monitor
	--UPDATE MIG_CO019_PL A
	--SET (CMS_ACT_LMT_PROFILE_ID, SRC_LE_ID, CMS_ACT_LMT_ID) = 
	--		(SELECT CMS_ACT_LMT_PROFILE_ID, CIF_ID, CMS_ACT_LMT_ID
	--	         FROM MIG_CA003_1
	--	         WHERE LIMIT_ID = A.LIMIT_ID
	--	         AND IS_VALID = 'Y')
    --WHERE IS_VALID = 'Y';

	create index temp_index_1 on sci_lsp_appr_lmts
		(source_id, lmt_id, cms_lsp_appr_lmts_id, cms_limit_profile_id, lmt_le_id)
		allow reverse scans
		collect statistics;
	commit;
		
	update mig_co019_pl 
	set (cms_act_lmt_profile_id, src_le_id, cms_act_lmt_id) = 
		(select cms_limit_profile_id, lmt_le_id, cms_lsp_appr_lmts_id
		from sci_lsp_appr_lmts
		where lmt_id = limit_id
		and source_id = 'RLOS')
	where is_valid = 'Y';

	drop index temp_index_1;

    CALL LOG_PROC_TIME('MIG_VALIDATE_CO019_PL', 'SIBS', 4);
	commit;
									
	
	UPDATE MIG_CO019_PL A SET IS_VALID = 'N'
	WHERE CMS_ACT_LMT_ID IS NULL;
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO019', SECURITY_ID, LIMIT_ID, APPLICATION_NO, FACILITY_CODE, trim(char(FACILITY_SEQUENCE)), 'LNF001', 
		'[H] Failed to find Limit info for AA Number [' || APPLICATION_NO 
		|| '] Limit ID [' || LIMIT_ID
		|| '] Facility Code [' || FACILITY_CODE
		|| '] Facility Sequence [' || trim(char(FACILITY_SEQUENCE))
		|| '] Security Id [' || SECURITY_ID 
		|| '] from CO019 interface file'
	FROM MIG_CO019_PL
	WHERE is_valid = 'N'
	and CMS_ACT_LMT_ID is null
	AND NOT EXISTS (select 1
			from sci_lsp_appr_lmts
			where lmt_id = limit_id
			and source_id = 'RLOS'));								
							
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO019_PL', 'SIBS', 5);
	commit;
    
	--------------------------------
	-- Set Security id
	--------------------------------
	UPDATE MIG_CO019_PL A
	SET CMS_ACT_COL_ID = (SELECT CMS_COLLATERAL_ID
		         	FROM CMS_SECURITY
		         	WHERE SCI_SECURITY_DTL_ID = A.SECURITY_ID);
									
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO019_PL', 'SIBS', 6);
	commit;
									
	
	UPDATE MIG_CO019_PL A SET IS_VALID = 'N'
	WHERE CMS_ACT_COL_ID IS NULL;
	commit;
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO019', SECURITY_ID, LIMIT_ID, APPLICATION_NO, FACILITY_CODE, trim(char(FACILITY_SEQUENCE)), 'SNF001', 
		'[H] Failed to find Security info for Security ID [' || SECURITY_ID 
		|| '] from CO019 interface file'
	FROM MIG_CO019_PL A
	WHERE is_valid = 'N'
	and CMS_ACT_COL_ID is null
	and NOT EXISTS (SELECT 1
		        FROM CMS_SECURITY
		        WHERE SCI_SECURITY_DTL_ID = A.SECURITY_ID));								
							
	CALL LOG_PROC_TIME('MIG_VALIDATE_CO019_PL', 'SIBS', 0);
	commit;
    
END@
