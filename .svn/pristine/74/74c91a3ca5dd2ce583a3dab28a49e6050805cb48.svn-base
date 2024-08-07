--SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,CLIMS_LOCAL@
--DROP PROCEDURE SI_VALIDATE_TEMP_BOST_CU005@
--DROP PROCEDURE SI_VALIDATE_TEMP_BOST_CA001@
--DROP PROCEDURE SI_VALIDATE_TEMP_BOST_CA015@
--DROP PROCEDURE SI_VALIDATE_TEMP_BOST_CO025@
--DROP PROCEDURE SI_VALIDATE_TEMP_BOST_CO022@
--DROP PROCEDURE SI_VALIDATE_TEMP_BOST_CO023@
--DROP PROCEDURE SI_VALIDATE_TEMP_BOST_SH001@

CREATE PROCEDURE SI_VALIDATE_TEMP_BOST_CU005
     LANGUAGE SQL
  BEGIN
    CALL si_log_proc_time('SI_VALIDATE_TEMP_BOST_CU005', 'BOST', 1);
		 
		UPDATE si_temp_bost_cu005 a SET is_valid = 'N'
	 		WHERE cif_id = '' 
	    OR cust_name_long = '' 
	    OR cust_name_short = '' 
	    OR cust_class_code = '' 
	    OR cust_class_desc = '' 
	    OR id_type_code = '' 
	    OR id_number = '' 
	    OR cust_segment_code = '' 
			OR isic_code = ''
	    OR update_stat_ind = '';
			
		INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
			(SELECT CURRENT_TIMESTAMP, 'BOST', 'CU005', cif_id, id_number, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(cif_id, ' [CIF_ID] ')
			|| SI_BVL(cust_name_long, ' [CUST_NAME_LONG] ')
			|| SI_BVL(cust_name_short, ' [CUST_NAME_SHORT] ')
			|| SI_BVL(cust_class_code, ' [CUST_CLASS_CODE] ')
			|| SI_BVL(cust_class_desc, ' [CUST_CLASS_DESC] ')
			|| SI_BVL(id_type_code, ' [ID_TYPE_CODE] ')
			|| SI_BVL(id_number, ' [ID_NUMBER] ')
			|| SI_BVL(cust_segment_code, ' [CUST_SEGMENT_CODE] ')
			|| SI_BVL(isic_code, ' [ISIC_CODE] ')
			|| SI_BVL(update_stat_ind, ' [UPDATE_STAT_IND] ')
			|| ' is/are empty.'
	   FROM si_temp_bost_cu005
	  WHERE is_valid = 'N');	
		
-- duplicate cif		
				
		UPDATE si_temp_bost_cu005 a set is_valid = 'N'
	  where a.cif_id in (select t.cif_id
	  	from si_temp_bost_cu005 t
	  	group by t.cif_id
	  	having count(*) > 1)
	  and a.is_valid = 'Y';
		
		INSERT INTO si_error_log (time_stamp, system_id, interface_id, error_code, error_msg)
	  (select current_timestamp, 'BOST', 'CU005', 'BizErr004', '[M] Duplicate customer info [' 
	  	|| cif_id || '] - ' || trim(char(count(*))) || ' records found.'
	  from si_temp_bost_cu005
	  group by cif_id
	  having count(*) > 1);	
		
		CALL si_log_proc_time('SI_VALIDATE_TEMP_BOST_CU005', 'BOST', 2);

-- record to be deleted not	found

		UPDATE SI_TEMP_BOST_CU005 T SET IS_VALID = 'N'
		WHERE T.UPDATE_STAT_IND = 'D' AND T.IS_VALID = 'Y'
			AND NOT EXISTS (SELECT 1 FROM SCI_LE_MAIN_PROFILE M WHERE T.CIF_ID = M.LMP_LE_ID AND M.SOURCE_ID = 'BOST');

		INSERT INTO SI_ERROR_LOG (TIME_STAMP, SYSTEM_ID, INTERFACE_ID, KEY1_VALUE, ERROR_CODE, ERROR_MSG)
	  (SELECT CURRENT_TIMESTAMP, 'BOST', 'CU005', CIF_ID, 'BizErr004',
			'[M] No deleted customer CIF [' || cif_id || '] found in CLIMS.'
	  	FROM SI_TEMP_BOST_CU005 T
			WHERE T.UPDATE_STAT_IND = 'D' AND T.IS_VALID = 'N'
				AND NOT EXISTS (SELECT 1 FROM SCI_LE_MAIN_PROFILE M WHERE T.CIF_ID = M.LMP_LE_ID AND M.SOURCE_ID = 'BOST')
    );

		CALL si_log_proc_time('SI_VALIDATE_TEMP_BOST_CU005', 'BOST', 0);
  END@


CREATE PROCEDURE SI_VALIDATE_TEMP_BOST_CA001 
     LANGUAGE SQL
  BEGIN
    CALL si_log_proc_time('SI_VALIDATE_TEMP_BOST_CA001', 'BOST', 1);
    
    UPDATE si_temp_bost_ca001 a SET is_valid = 'N'
	   WHERE cif_id = '' 
	    OR cif_source = '' 
	    OR aa_number = '' 
	    OR joint_borrower_ind = '' 
	    OR aa_approved_date IS NULL 
 	    OR ori_loc_country = '' 
	    OR ori_loc_org_code = '' 
	    OR ori_loc_org_desc = '' 
	    OR aa_stat = '' 
	    OR aa_create_date IS NULL
      OR update_stat_ind = '';
      
    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	   (SELECT CURRENT_TIMESTAMP, 'BOST', 'CA001', aa_number, cif_id, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(cif_id, ' [CIF_ID] ')
			|| SI_BVL(cif_source, ' [CIF_SOURCE] ')
			|| SI_BVL(aa_number, ' [AA_NUMBER] ')
			|| SI_BVL(joint_borrower_ind, ' [JOINT_BORROWER_IND] ')
			|| SI_BVL(char(aa_approved_date), ' [AA_APPROVED_DATE] ')
			|| SI_BVL(ori_loc_country, ' [ORI_LOC_COUNTRY] ')
			|| SI_BVL(ori_loc_org_code, ' [ORI_LOC_ORG_CODE] ')
			|| SI_BVL(ori_loc_org_desc, ' [ORI_LOC_ORG_DESC] ')
			|| SI_BVL(aa_stat, ' [AA_STAT] ')
			|| SI_BVL(char(aa_create_date), ' [AA_CREATE_DATE] ')
			|| SI_BVL(update_stat_ind, ' [UPDATE_STAT_IND] ')
			|| ' is/are empty.'
	   FROM si_temp_bost_ca001
	  WHERE is_valid = 'N');
      
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LE_MAIN_PROFILE
	--
	-----------------------------------------

    UPDATE si_temp_bost_ca001 a SET is_valid = 'N'
	   WHERE NOT EXISTS (SELECT '1' FROM sci_le_sub_profile sp, sci_le_main_profile mp
	 					WHERE lsp_le_id = a.cif_id
	 					  AND lmp_le_id = a.cif_id
	 					  AND sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
	 					  AND mp.source_id = 'BOST');
	 					  
	 	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
    	(SELECT CURRENT_TIMESTAMP, 'BOST', 'CA001', cif_id, aa_number, 'BizErr003', 
    			'[H] No Customer Info [' || cif_id ||'] found for AA No [' || aa_number || ']'
    	   FROM si_temp_bost_ca001 
    	  WHERE is_valid = 'N'
    	    AND NOT EXISTS (SELECT '1' FROM sci_le_sub_profile sp, sci_le_main_profile mp
    	 					WHERE lsp_le_id = cif_id
    	 					  AND lmp_le_id = cif_id
    	 					  AND sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
    	 					  AND mp.source_id = 'BOST'));
	    
-- record to be deleted not	found

		UPDATE SI_TEMP_BOST_CA001 T SET IS_VALID = 'N'
		WHERE T.UPDATE_STAT_IND = 'D' AND T.IS_VALID = 'Y'
			AND NOT EXISTS (SELECT 1 FROM SCI_LSP_LMT_PROFILE M WHERE T.AA_NUMBER = M.LLP_BCA_REF_NUM AND M.SOURCE_ID = 'BOST');

		INSERT INTO SI_ERROR_LOG (TIME_STAMP, SYSTEM_ID, INTERFACE_ID, KEY1_VALUE, ERROR_CODE, ERROR_MSG)
	  (SELECT CURRENT_TIMESTAMP, 'BOST', 'CU005', AA_NUMBER, 'BizErr004',
			'[M] No deleted AA [' || AA_NUMBER || '] found in CLIMS.'
	  	FROM SI_TEMP_BOST_CA001 T
			WHERE T.UPDATE_STAT_IND = 'D' AND T.IS_VALID = 'N'
				AND NOT EXISTS (SELECT 1 FROM SCI_LSP_LMT_PROFILE M WHERE T.AA_NUMBER = M.LLP_BCA_REF_NUM AND M.SOURCE_ID = 'BOST')
    );
		 
		 CALL si_log_proc_time('SI_VALIDATE_TEMP_BOST_CA001', 'BOST', 0); 
	    
	 END@
       
       
CREATE PROCEDURE SI_VALIDATE_TEMP_BOST_CA015 
     LANGUAGE SQL
  BEGIN
    CALL si_log_proc_time('SI_VALIDATE_TEMP_BOST_CA015', 'BOST', 1);
  
    UPDATE si_temp_bost_ca015 a SET is_valid = 'N'
	   WHERE cif_id = '' 
	    OR aa_number = '' 
	    OR LIMIT_ID = '' 
	    OR ORI_LOC_COUNTRY = '' 
 	    OR ORG_LOC_ORG_CODE = '' 
	    OR ORG_LOC_ORG_DESC = '' 
	    OR PRODUCT_TYPE_CODE = '' 
	    OR PRODUCT_TYPE_DESC = '' 
      OR LIMIT_CURRENCY = '' 
      OR LIMIT_AMT IS NULL
      OR LOAN_SECTOR_CODE = ''
      OR LOAN_SECTOR_DESC = ''
      OR DISBURSED_IND = ''
      OR NPL_IND = '';
  
    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
			(SELECT CURRENT_TIMESTAMP, 'BOST', 'CA015', LIMIT_ID, cif_id, aa_number, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(cif_id, ' [CIF_ID] ')
			|| SI_BVL(aa_number, ' [AA_NUMBER] ')
			|| SI_BVL(LIMIT_ID, ' [LIMIT_ID] ')
			|| SI_BVL(ORI_LOC_COUNTRY, ' [ORI_LOC_COUNTRY] ')
			|| SI_BVL(ORG_LOC_ORG_CODE, ' [ORG_LOC_ORG_CODE] ')
			|| SI_BVL(ORG_LOC_ORG_DESC, ' [ORG_LOC_ORG_DESC] ')
			|| SI_BVL(PRODUCT_TYPE_CODE, ' [PRODUCT_TYPE_CODE] ')
			|| SI_BVL(PRODUCT_TYPE_DESC, ' [PRODUCT_TYPE_DESC] ')
			|| SI_BVL(LIMIT_CURRENCY, ' [LIMIT_CURRENCY] ')
			|| SI_BVL(char(LIMIT_AMT), ' [LIMIT_AMT] ')
			|| SI_BVL(LOAN_SECTOR_CODE, ' [LIMIT_CURRENCY] ')
			|| SI_BVL(LOAN_SECTOR_DESC, ' [LIMIT_CURRENCY] ')
			|| SI_BVL(DISBURSED_IND, ' [LIMIT_CURRENCY] ')
			|| SI_BVL(NPL_IND, ' [LIMIT_CURRENCY] ')
			|| ' is/are empty.'
	   FROM si_temp_bost_ca015
	  WHERE is_valid = 'N');

	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LE_MAIN_PROFILE
	--
	-----------------------------------------

    UPDATE si_temp_bost_ca015 a SET is_valid = 'N'
	   WHERE NOT EXISTS (SELECT '1' FROM sci_le_sub_profile sp, sci_le_main_profile mp
	 					WHERE lsp_le_id = a.cif_id
	 					  AND lmp_le_id = a.cif_id
	 					  AND sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
	 					  AND mp.source_id = 'BOST');
	 					  
	 	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
    	(SELECT CURRENT_TIMESTAMP, 'BOST', 'CA001', cif_id, aa_number, 'BizErr003', 
    			'[H] No Customer Info [' || cif_id ||'] found for Limit Id [' || LIMIT_ID || ']'
    	   FROM si_temp_bost_ca015 
    	  WHERE is_valid = 'N'
    	    AND NOT EXISTS (SELECT '1' FROM sci_le_sub_profile sp, sci_le_main_profile mp
    	 					WHERE lsp_le_id = cif_id
    	 					  AND lmp_le_id = cif_id
    	 					  AND sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
    	 					  AND mp.source_id = 'BOST'));

	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LSP_LMT_PROFILE
	--
	-----------------------------------------

--	UPDATE si_temp_bost_ca015 a SET is_valid = 'N'
--	 WHERE NOT EXISTS (SELECT '1' FROM sci_lsp_lmt_profile
--	 					WHERE llp_bca_ref_num = a.aa_number
--	 					  AND source_id = 'BOST');
	 					  
--	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
--	(SELECT CURRENT_TIMESTAMP, 'BOST', 'CA015', aa_number, limit_id, 'BizErr003', 
--			'No AA Info found [' || aa_number || '] for Limit [' || limit_id || ']'
--	   FROM si_temp_bost_ca015
--	  WHERE is_valid = 'N'
--	    AND NOT EXISTS (SELECT '1' FROM sci_lsp_lmt_profile
--	 					WHERE llp_bca_ref_num = aa_number
--	 					  AND source_id = 'BOST'));
	 
	 CALL si_log_proc_time('SI_VALIDATE_TEMP_BOST_CA015', 'BOST', 0);
  END@
  
  
CREATE PROCEDURE SI_VALIDATE_TEMP_BOST_CO025
     LANGUAGE SQL
  BEGIN
    CALL si_log_proc_time('SI_VALIDATE_TEMP_BOST_CO025', 'BOST', 1);
    
    UPDATE si_temp_bost_co025 a SET is_valid = 'N'
	   WHERE cif_number = '' 
	    OR security_id = '' 
	    OR security_type = '' 
	    OR currency = '' 
	    OR security_loc = '' 
	    OR org_loc_org_code = '' 
	    OR org_loc_org_desc = '' 
	    OR security_custodian_type = '' 
	    OR security_custodian_value = '' 
	    OR legal_enforceability_date IS NULL 
	    OR security_perfection_date IS NULL 
	    OR interest_capitalisation = '' 
	    OR deposit_receipt_no = '' 
	    OR deposit_amt IS NULL 
      OR sign_of_deposit_amt = '';

    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
			(SELECT CURRENT_TIMESTAMP, 'BOST', 'CO025', security_id, cif_number, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(cif_number, ' [CIF_NUMBER] ')
			|| SI_BVL(security_id, ' [SECURITY_ID] ')
			|| SI_BVL(security_type, ' [SECURITY_TYPE] ')
			|| SI_BVL(currency, ' [CURRENCY] ')
			|| SI_BVL(security_loc, ' [SECURITY_LOC] ')
			|| SI_BVL(org_loc_org_code, ' [ORG_LOC_ORG_CODE] ')
			|| SI_BVL(org_loc_org_desc, ' [ORG_LOC_ORG_DESC] ')
			|| SI_BVL(security_custodian_type, ' [SECURITY_CUSTODIAN_TYPE] ')
			|| SI_BVL(security_custodian_value, ' [SECURITY_CUSTODIAN_VALUE] ')
			|| SI_BVL(char(legal_enforceability_date), ' [LEGAL_ENFORCEABILITY_DATE] ')
			|| SI_BVL(char(security_perfection_date), ' [SECURITY_PERFECTION_DATE] ')
			|| SI_BVL(interest_capitalisation, ' [INTEREST_CAPITALISATION] ')
			|| SI_BVL(deposit_receipt_no, ' [DEPOSIT_RECEIPT_NO] ')
			|| SI_BVL(char(deposit_amt), ' [DEPOSIT_AMT] ')
			|| SI_BVL(sign_of_deposit_amt, ' [SIGN_OF_DEPOSIT_AMT] ')
			|| ' is/are empty.'
	   FROM si_temp_bost_co025
	  WHERE is_valid = 'N');
	  
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LSP_APPR_LMTS
	--
	-----------------------------------------

    UPDATE si_temp_bost_co025 a SET is_valid = 'N'
	   WHERE NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
	 					WHERE LMT_ID = a.cif_number
	 					  AND source_id = 'BOST');	  
    
    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'BOST', 'CO025', cif_number, 'BizErr003', 
			'[H] No Limit Info found for CIF Id [' || cif_number || '] '
	   FROM si_temp_bost_co025 a
	  WHERE is_valid = 'N'
	    AND NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
	 					 WHERE LMT_ID = a.cif_number
	 					   AND source_id = 'BOST'));
	 					   
    CALL si_log_proc_time('SI_VALIDATE_TEMP_BOST_CO025', 'BOST', 0);
  END@
  

CREATE PROCEDURE SI_VALIDATE_TEMP_BOST_CO022
     LANGUAGE SQL
  BEGIN
    CALL si_log_proc_time('SI_VALIDATE_TEMP_BOST_CO022', 'BOST', 1);
    
    UPDATE si_temp_bost_co022 a SET is_valid = 'N'
	   WHERE security_id = '' 
	    OR cif_id = '' 
	    OR security_type = '' 
	    OR original_currency = '' 
	    OR loc_country = '' 
	    OR org_loc_org_code = '' 
	    OR org_loc_org_desc = '' 
	    OR security_custodian_type = '' 
	    OR legal_enforceability = '' 
	    OR legal_enforceability_date IS NULL 
	    OR security_perfection_date IS NULL 
	    OR registered_name = '' 
	    OR custodian_type = '' 
	    OR counter_code = '' 
	    OR recognized_exchange = '';
    
    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
			(SELECT CURRENT_TIMESTAMP, 'BOST', 'CO022', security_id, cif_id, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(security_id, ' [SECURITY_ID] ')
			|| SI_BVL(cif_id, ' [CIF_ID] ')
			|| SI_BVL(security_type, ' [SECURITY_TYPE] ')
			|| SI_BVL(original_currency, ' [ORIGINAL_CURRENCY] ')
			|| SI_BVL(loc_country, ' [LOC_COUNTRY] ')
			|| SI_BVL(org_loc_org_code, ' [ORG_LOC_ORG_CODE] ')
			|| SI_BVL(org_loc_org_desc, ' [ORG_LOC_ORG_DESC] ')
			|| SI_BVL(security_custodian_type, ' [SECURITY_CUSTODIAN_TYPE] ')
			|| SI_BVL(legal_enforceability, ' [LEGAL_ENFORCEABILITY] ')
			|| SI_BVL(char(legal_enforceability_date), ' [LEGAL_ENFORCEABILITY_DATE] ')
			|| SI_BVL(char(security_perfection_date), ' [SECURITY_PERFECTION_DATE] ')
			|| SI_BVL(registered_name, ' [REGISTERED_NAME] ')
			|| SI_BVL(custodian_type, ' [CUSTODIAN_TYPE] ')
			|| SI_BVL(counter_code, ' [COUNTER_CODE] ')
			|| SI_BVL(recognized_exchange, ' [RECOGNIZED_EXCHANGE] ')
			|| ' is/are empty.'
	   FROM si_temp_bost_co022
	  WHERE is_valid = 'N');
    
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LSP_APPR_LMTS
	--
	-----------------------------------------

    UPDATE si_temp_bost_co022 a SET is_valid = 'N'
	   WHERE NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
	 					WHERE LMT_ID = a.CIF_ID
	 					  AND source_id = 'BOST');	  
    
    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'BOST', 'CO022', CIF_ID, 'BizErr003', 
			'[H] No Limit Info found for CIF Id [' || CIF_ID || '] '
	   FROM si_temp_bost_co022 a
	  WHERE is_valid = 'N'
	    AND NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
	 					 WHERE LMT_ID = a.CIF_ID
	 					   AND source_id = 'BOST'));
    
    CALL si_log_proc_time('SI_VALIDATE_TEMP_BOST_CO022', 'BOST', 0);
  END@
  
  
CREATE PROCEDURE SI_VALIDATE_TEMP_BOST_CO023
     LANGUAGE SQL
  BEGIN
    CALL si_log_proc_time('SI_VALIDATE_TEMP_BOST_CO023', 'BOST', 1);
  
    UPDATE si_temp_bost_co023 a SET is_valid = 'N'
	   WHERE CIF = '' 
	    OR SECURITY_ID = '' 
	    OR SHARE_ID = '' 
	    OR SHARES_TYPE = '' 
	    OR UNITS IS NULL 
	    OR COUNTER_CODE = '';
	    
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
			(SELECT CURRENT_TIMESTAMP, 'BOST', 'CO023', SECURITY_ID, CIF, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(CIF, ' [CIF] ')
			|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
			|| SI_BVL(SHARE_ID, ' [SHARE_ID] ')
			|| SI_BVL(SHARES_TYPE, ' [SHARES_TYPE] ')
			|| SI_BVL(char(UNITS), ' [UNITS] ')
			|| SI_BVL(COUNTER_CODE, ' [COUNTER_CODE] ')
			|| ' is/are empty.'
	   FROM si_temp_bost_co023
	  WHERE is_valid = 'N');

	  CALL si_log_proc_time('SI_VALIDATE_TEMP_BOST_CO023', 'BOST', 2);

	  ----------------------------------------------
	  --  Sanity checking on parent level insertion
	  ----------------------------------------------

	  UPDATE SI_TEMP_BOST_CO023 A SET IS_VALID = 'N'
	    WHERE NOT EXISTS (SELECT '1' FROM CMS_SECURITY
	                        WHERE SCI_SECURITY_DTL_ID = A.SECURITY_ID
	 					    AND SOURCE_ID = 'BOST');

      INSERT INTO SI_ERROR_LOG (TIME_STAMP, SYSTEM_ID, INTERFACE_ID, KEY1_VALUE, ERROR_CODE, ERROR_MSG)
            (SELECT CURRENT_TIMESTAMP, 'BOST', 'CO023', SECURITY_ID, 'BizErr003', '[H] No marketable security found for security id [' || SECURITY_ID || ']'
                FROM SI_TEMP_BOST_CO023
                WHERE IS_VALID = 'N'
                AND NOT EXISTS (SELECT '1' FROM CMS_SECURITY
     					          WHERE SCI_SECURITY_DTL_ID = SECURITY_ID
     					          AND SOURCE_ID = 'BOST')
     	    );    
    
    CALL si_log_proc_time('SI_VALIDATE_TEMP_BOST_CO023', 'BOST', 0);
  END@
  
  
CREATE PROCEDURE SI_VALIDATE_TEMP_BOST_SH001
     LANGUAGE SQL
  BEGIN
    CALL si_log_proc_time('SI_VALIDATE_TEMP_BOST_SH001', 'BOST', 1);
    
    UPDATE si_temp_bost_sh001 a SET is_valid = 'N'
	   WHERE COUNTER_CODE = '' 
	    OR STOCK_EXCHANGE_CODE = '' 
	    OR STOCK_EXCHANGE_COUNTRY = '' 
	    OR TOTAL_NO_OF_UNIT IS NULL
      OR ISSUER_NAME = '';
	    --OR SIGN_OF_UNIT = '' ;

    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
			(SELECT CURRENT_TIMESTAMP, 'BOST', 'SH001', COUNTER_CODE, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(COUNTER_CODE, ' [COUNTER_CODE] ')
			|| SI_BVL(STOCK_EXCHANGE_CODE, ' [STOCK_EXCHANGE_CODE] ')
			|| SI_BVL(STOCK_EXCHANGE_COUNTRY, ' [STOCK_EXCHANGE_COUNTRY] ')
			|| SI_BVL(char(TOTAL_NO_OF_UNIT), ' [TOTAL_NO_OF_UNIT] ')
			|| SI_BVL(ISSUER_NAME, ' [ISSUER_NAME] ')
			--|| SI_BVL(SIGN_OF_UNIT, ' [SIGN_OF_UNIT] ')
			|| ' is/are empty.'
	   FROM si_temp_bost_sh001
	  WHERE is_valid = 'N');
	  
    UPDATE si_temp_bost_sh001 A SET is_valid = 'N'
	   WHERE NOT EXISTS (SELECT '1' FROM CMS_PRICE_FEED B
	 				WHERE A.STOCK_CODE = B.STOCK_CODE AND LENGTH(A.STOCK_CODE) > 0
					AND CASE A.STOCK_EXCHANGE_CODE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE A.STOCK_EXCHANGE_CODE END = B.EXCHANGE);

    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
  	(SELECT CURRENT_TIMESTAMP, 'BOST', 'SH001', A.STOCK_CODE, CASE A.STOCK_EXCHANGE_CODE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE A.STOCK_EXCHANGE_CODE END, A.ISIN_CODE, 'BizErr003', 
  			'[H] No Stock code [' || A.STOCK_CODE || '] for Stock Exchange code [' || CASE A.STOCK_EXCHANGE_CODE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE A.STOCK_EXCHANGE_CODE END || '] found in Price Feed.'
  	   FROM si_temp_bost_sh001 A
  	  WHERE is_valid = 'N'
  	    AND NOT EXISTS (SELECT '1' FROM CMS_PRICE_FEED B
	 				WHERE A.STOCK_CODE = B.STOCK_CODE AND LENGTH(A.STOCK_CODE) > 0
					AND CASE A.STOCK_EXCHANGE_CODE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE A.STOCK_EXCHANGE_CODE END = B.EXCHANGE));
               	  
    CALL si_log_proc_time('SI_VALIDATE_TEMP_BOST_SH001', 'BOST', 0);
  END@
  
commit work@  
