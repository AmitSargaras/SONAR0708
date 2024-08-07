--SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM, CLIMS_LOCAL@
--DROP PROCEDURE SI_VALIDATE_TEMP_TSPR_CA006@
--DROP PROCEDURE SI_VALIDATE_TEMP_TSPR_CA008@
--DROP PROCEDURE SI_VALIDATE_TEMP_TSPR_CA010@
--DROP PROCEDURE SI_VALIDATE_TEMP_TSPR_CO021@

CREATE PROCEDURE SI_VALIDATE_TEMP_TSPR_CA006
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_TSPR_CA006', 'TSPR', 1);
	
	UPDATE SI_TEMP_TSPR_CA006 a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
	    OR length(CIF_ID)=0 
	    OR length(TRADE_ACCT_NO)=0
	    OR length(LIMIT_ID)=0
	    OR length(OUTER_LIMIT_ID)=0
			OR length(ORI_LOC_COUNTRY)=0
			OR length(ORG_LOC_ORG)=0
			OR length(OMNIBUS_IND)=0
			OR length(PRODUCT_TYPE_CODE)=0
			OR length(PRODUCT_TYPE_DESC)=0
			OR length(LIMIT_CURRENCY)=0
			OR length(LIMIT_AMT)=0
			OR length(DRAWING_ACTIVATED_LIMIT_AMT)=0
			OR length(OUTSTANDING_AMT)=0
			OR length(REVOLVING_IND)=0
			OR length(REVIEW_DATE)=0 or length(REVIEW_DATE) is null
			OR length(TEMPORARY_LINE)=0
			OR length(AUTO_PURGE_FLAG)=0
			OR length(BUSINESS_UNIT)=0
			OR length(ACCT_DESC_CODE)=0
			OR length(ACCT_DESC_DESC)=0
			OR length(NPL_STAT)=0
			OR (NPL_STAT IS NOT NULL AND NPL_STAT = 'Y' AND (length(NPL_DATE)=0 and length(NPL_DATE) is null))
			OR length(LOAN_PURPOSE_CODE)=0
			OR length(LOAN_PURPOSE_DESC)=0
			OR length(BROAD_PROPERTY_SECTOR_EXEMPTIO)=0
			OR length(LOAN_SECURITY_MATRIX_CODE_)=0
			OR length(LOAN_SECURITY_MATRIX_DESC)=0
			OR length(SECTORIAL_CODE)=0
			OR length(SECTORIAL_DESC)=0
			OR length(DISBURSED_IND)=0
			OR length(UPDATE_STAT_IND)=0;
	    
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, KEY1_VALUE, KEY2_VALUE, KEY3_VALUE, KEY4_VALUE, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'TSPR', 'CA006', CIF_ID, LIMIT_ID, OUTER_LIMIT_ID, TRADE_ACCT_NO, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| SI_BVL(CIF_ID, ' [CIF_ID] ')
			|| SI_BVL(TRADE_ACCT_NO, ' [TRADE_ACCT_NO] ')
			|| SI_BVL(LIMIT_ID, ' [LIMIT_ID] ')
			|| SI_BVL(OUTER_LIMIT_ID, ' [OUTER_LIMIT_ID] ')
			|| SI_BVL(ORI_LOC_COUNTRY, ' [ORI_LOC_COUNTRY] ')
			|| SI_BVL(ORG_LOC_ORG, ' [ORG_LOC_ORG] ')
			|| SI_BVL(OMNIBUS_IND, ' [OMNIBUS_IND] ')
			|| SI_BVL(PRODUCT_TYPE_CODE, ' [PRODUCT_TYPE_CODE] ')
			|| SI_BVL(PRODUCT_TYPE_DESC, ' [PRODUCT_TYPE_DESC] ')
			|| SI_BVL(LIMIT_CURRENCY, ' [LIMIT_CURRENCY] ')
			|| NVL2(char(LIMIT_AMT), '', ' [LIMIT_AMT] ')
			|| NVL2(char(DRAWING_ACTIVATED_LIMIT_AMT), '', ' [DRAWING_ACTIVATED_LIMIT_AMT] ')
			|| NVL2(char(OUTSTANDING_AMT), '', ' [OUTSTANDING_AMT] ')
			|| SI_BVL(REVOLVING_IND, ' [REVOLVING_IND] ')
			|| NVL2(char(REVIEW_DATE), '', ' [REVIEW_DATE] ')
			|| SI_BVL(TEMPORARY_LINE, ' [TEMPORARY_LINE] ')
			|| SI_BVL(AUTO_PURGE_FLAG, ' [AUTO_PURGE_FLAG] ')
			|| SI_BVL(BUSINESS_UNIT, ' [BUSINESS_UNIT] ')
			|| SI_BVL(ACCT_DESC_CODE, ' [ACCT_DESC_CODE] ')
			|| SI_BVL(ACCT_DESC_DESC, ' [ACCT_DESC_DESC] ')
			|| SI_BVL(NPL_STAT, ' [NPL_STAT] ')
			|| (CASE NPL_STAT WHEN 'Y' THEN NVL2(char(NPL_DATE), '',' [NPL_DATE] ') ELSE '' END)
			|| SI_BVL(LOAN_PURPOSE_CODE, ' [LOAN_PURPOSE_CODE] ')
			|| SI_BVL(LOAN_PURPOSE_DESC, ' [LOAN_PURPOSE_DESC] ')
			|| SI_BVL(BROAD_PROPERTY_SECTOR_EXEMPTIO, ' [BROAD_PROPERTY_SECTOR_EXEMPTIO] ')
			|| SI_BVL(LOAN_SECURITY_MATRIX_CODE_, ' [LOAN_SECURITY_MATRIX_CODE_] ')
			|| SI_BVL(LOAN_SECURITY_MATRIX_DESC, ' [LOAN_SECURITY_MATRIX_DESC] ')
			|| SI_BVL(SECTORIAL_CODE, ' [SECTORIAL_CODE] ')
			|| SI_BVL(SECTORIAL_DESC, ' [SECTORIAL_DESC] ')
			|| SI_BVL(DISBURSED_IND, ' [DISBURSED_IND] ')
			|| SI_BVL(UPDATE_STAT_IND, ' [UPDATE_STAT_IND] ')
			|| ' is/are empty.'
	   FROM SI_TEMP_TSPR_CA006
	  WHERE is_valid = 'N');
		
		-----------------------------------------
		-- Check for missing parent limit Id
		--
		-----------------------------------------
		
		UPDATE SI_TEMP_TSPR_CA006 a set is_valid = 'N'
	  where a.is_valid = 'Y'
			and a.OUTER_LIMIT_ID <> a.LIMIT_ID
			and not exists
			(select 1 from si_temp_tspr_CA006 c 
				where c.outer_limit_id = c.limit_id and c.LIMIT_ID=a.OUTER_LIMIT_ID)
			and not exists
			(select 1 from sci_lsp_appr_lmts l where l.LMT_ID=a.OUTER_LIMIT_ID and l.SOURCE_ID='TSPR');
			
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, KEY1_VALUE, KEY2_VALUE, KEY3_VALUE, KEY4_VALUE, error_code, error_msg)
	  (select current_timestamp, 'TSPR', 'CA006', a.LIMIT_ID, a.OUTER_LIMIT_ID, CIF_ID, TRADE_ACCT_NO, 'BizErr004',
			'[H] No OUTER limit Id [' 
	  	|| a.OUTER_LIMIT_ID || '] found in SI file and CLIMS DB for INNER limit Id [' || a.LIMIT_ID || ']'
	  from SI_TEMP_TSPR_CA006 a
	  where a.IS_VALID = 'N'
			and a.OUTER_LIMIT_ID <> a.LIMIT_ID
			and not exists
			(select 1 from si_temp_tspr_CA006 c 
				where c.outer_limit_id = c.limit_id and c.LIMIT_ID=a.OUTER_LIMIT_ID)
			and not exists
			(select 1 from sci_lsp_appr_lmts l where l.LMT_ID=a.OUTER_LIMIT_ID and l.SOURCE_ID='TSPR'));
		
		-----------------------------------------
		-- Check for duplicate limit Id records
		--
		-----------------------------------------
		
		UPDATE SI_TEMP_TSPR_CA006 a set is_valid = 'N'
	  where a.LIMIT_ID in (select t.LIMIT_ID
	  	from SI_TEMP_TSPR_CA006 t
	  	group by t.LIMIT_ID
	  	having count(*) > 1)
	  and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, KEY1_VALUE, error_code, error_msg)
	  (select current_timestamp, 'TSPR', 'CA006', limit_id, 'BizErr004', 
			'[M] Duplicate limit info found for Limit Id [' 
	  	|| limit_id || '] - ' || trim(char(count(*))) || ' records found]'
	  from SI_TEMP_TSPR_CA006
		group by limit_id
		having count(*) > 1);
		
		-----------------------------------------
		-- Check for Dependency
		-- to check against SCI_LE_MAIN_PROFILE
		--
		-----------------------------------------
	
		UPDATE SI_TEMP_TSPR_CA006 a SET is_valid = 'N'
		WHERE NOT EXISTS (SELECT '1' FROM sci_le_main_profile
							WHERE lmp_le_id = a.cif_id
								AND source_id = 'ARBS');
								
		INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
		(SELECT CURRENT_TIMESTAMP, 'TSPR', 'CA006', cif_id, limit_id, OUTER_LIMIT_ID, TRADE_ACCT_NO, 'BizErr003', 
			'[H] No Customer Info found for CIF Id [' || cif_id || ']'
			FROM SI_TEMP_TSPR_CA006 
		WHERE is_valid = 'N'
			AND NOT EXISTS (SELECT '1' FROM sci_le_main_profile
							WHERE lmp_le_id = cif_id
								AND source_id = 'ARBS'));
								
		CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_TSPR_CA006', 'TSPR', 2);
		commit;
		----------------------------------------
		-- Check update status indicator
		-- for D where record non-exist in CLIMS
		--
		----------------------------------------
		UPDATE SI_TEMP_TSPR_CA006 a set is_valid = 'N'
		where a.UPDATE_STAT_IND = 'D'
			and a.LIMIT_ID not in (select b.LMT_ID from sci_lsp_appr_lmts b where b.SOURCE_ID = 'TSPR')
			and a.is_valid = 'Y';
		
		INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
		(select current_timestamp, 'TSPR', 'CA006', LIMIT_ID, OUTER_LIMIT_ID, CIF_ID, TRADE_ACCT_NO, 'BizErr004', 
		'[M] Failed to find deleted facility in CLIMS with Limit Id [' || LIMIT_ID || ']'
		from SI_TEMP_TSPR_CA006 a where a.UPDATE_STAT_IND = 'D'
			and a.LIMIT_ID not in (select b.LMT_ID from sci_lsp_appr_lmts b where b.SOURCE_ID = 'TSPR')
			and a.is_valid = 'N');	
			
		CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_TSPR_CA006', 'TSPR', 3);
		commit;
		-----------------------------------------
		-- Reject inner limit should parent failed validation
		--
		-----------------------------------------
		
		UPDATE SI_TEMP_TSPR_CA006 a set is_valid = 'N'
	  where a.is_valid = 'Y'
			and a.OUTER_LIMIT_ID <> a.LIMIT_ID
			and exists
			(select 1 from si_temp_tspr_CA006 c 
				where c.LIMIT_ID=a.OUTER_LIMIT_ID and c.IS_VALID='N');
			
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, KEY1_VALUE, KEY2_VALUE, KEY3_VALUE, KEY4_VALUE, error_code, error_msg)
	  (select current_timestamp, 'TSPR', 'CA006', a.LIMIT_ID, a.OUTER_LIMIT_ID, CIF_ID, TRADE_ACCT_NO, 'BizErr004', 
			'[H] Failed validation in outer limit Id [' 
	  	|| a.OUTER_LIMIT_ID || '] void inner limit Id [' || a.LIMIT_ID || ']'
	  from SI_TEMP_TSPR_CA006 a
	  where a.is_valid = 'N'
			and a.OUTER_LIMIT_ID <> a.LIMIT_ID
			and exists
			(select 1 from si_temp_tspr_CA006 c 
				where c.LIMIT_ID=a.OUTER_LIMIT_ID and c.IS_VALID='N'));

	 	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_TSPR_CA006', 'TSPR', 0);
END
@

CREATE PROCEDURE SI_VALIDATE_TEMP_TSPR_CA008
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_TSPR_CA008', 'TSPR', 1);
	
	UPDATE SI_TEMP_TSPR_CA008 a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
	    OR length(LIMIT_ID)=0 
	    OR length(PRICING_TYPE)=0
	    OR length(INTEREST_MODE)=0			
			OR length(TIER_RATE_TYPE)=0
			OR length(TIER_RATE)=0
			OR length(UPDATE_STAT_IND)=0;
			
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'TSPR', 'CA008', LIMIT_ID, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| SI_BVL(LIMIT_ID, ' [LIMIT_ID] ')
			|| SI_BVL(PRICING_TYPE, ' [PRICING_TYPE] ')
			|| SI_BVL(INTEREST_MODE, ' [INTEREST_MODE] ')
			|| SI_BVL(TIER_RATE_TYPE, ' [TIER_RATE_TYPE] ')
			|| NVL2(char(TIER_RATE), '', ' [TIER_RATE] ')
			|| SI_BVL(UPDATE_STAT_IND, ' [UPDATE_STAT_IND] ')
			|| ' is/are empty.'
	   FROM SI_TEMP_TSPR_CA008
	  WHERE is_valid = 'N');
	
		-----------------------------------------
		-- Check for duplicate Trade Limit Pricing records
		--
		-----------------------------------------
		
		UPDATE SI_TEMP_TSPR_CA008 a set is_valid = 'N'
	  where exists (select 1
	  	from SI_TEMP_TSPR_CA008 t
			where t.LIMIT_ID = a.LIMIT_ID
	  	group by t.LIMIT_ID, t.INTEREST_MODE
	  	having count(*) > 1)
	  and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, KEY1_VALUE, error_code, error_msg)
	  (select current_timestamp, 'TSPR', 'CA008', limit_id, 'BizErr004', 
			'[M] Duplicate trade limit pricing info found for Limit Id [' 
	  	|| limit_id || '] Interest Mode [' || INTEREST_MODE || '] - ' || trim(char(count(*))) || ' records found]'
	  from SI_TEMP_TSPR_CA008 where is_valid = 'N'
		group by limit_id, INTEREST_MODE
		having count(*) > 1);
		
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LSP_APPR_LMTS
	--
	-----------------------------------------

	UPDATE SI_TEMP_TSPR_CA008 a SET is_valid = 'N'
	 WHERE NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
	 					WHERE LMT_ID = a.LIMIT_ID
	 					  AND source_id = 'TSPR');
	 					  
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'TSPR', 'CA008', LIMIT_ID, 'BizErr003', 
		'[H] No limit info found for Limit Id [' || LIMIT_ID || ']'
	   FROM SI_TEMP_TSPR_CA008
	  WHERE is_valid = 'N'
	    AND NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
	 					WHERE LMT_ID = LIMIT_ID
	 					  AND source_id = 'TSPR')
			and length(limit_id)>0);
	  
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_TSPR_CA008', 'TSPR', 2);
	commit;
	----------------------------------------
	-- Check update status indicator
	-- for D where record non-exist in CLIMS
	--
	----------------------------------------
	UPDATE SI_TEMP_TSPR_CA008 t set is_valid = 'N'
	where t.UPDATE_STAT_IND = 'D'
		and t.is_valid = 'Y'
		and NOT EXISTS 
			(SELECT 1 FROM SCI_LSP_APPR_LMTS a, CMS_TRADE_PRICING b 
				WHERE a.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID and a.SOURCE_ID='TSPR' and a.LMT_ID=t.LIMIT_ID);
	
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(select current_timestamp, 'TSPR', 'CA008', LIMIT_ID, 'BizErr004', 
	'[M] Failed to find deleted trade pricing details in CLIMS with Limit Id [' || LIMIT_ID || ']'
	from SI_TEMP_TSPR_CA008 t where t.UPDATE_STAT_IND = 'D'
		and t.is_valid = 'N'
		and NOT EXISTS 
			(SELECT 1 FROM SCI_LSP_APPR_LMTS a, CMS_TRADE_PRICING b 
				WHERE a.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID and a.SOURCE_ID='TSPR' and a.LMT_ID=t.LIMIT_ID));	
	 
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_TSPR_CA008', 'TSPR', 0);
END
@

CREATE PROCEDURE SI_VALIDATE_TEMP_TSPR_CA010
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_TSPR_CA010', 'TSPR', 1);
	
	UPDATE SI_TEMP_TSPR_CA010 a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
	    OR length(LIMIT_ID)=0 
	    OR length(TYPE)=0
	    OR length(SUPPLIER_BUYER_NAME)=0			
			OR length(UPDATE_STAT_IND)=0;
			
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'TSPR', 'CA010', LIMIT_ID, TYPE, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| SI_BVL(LIMIT_ID, ' [LIMIT_ID] ')
			|| SI_BVL(TYPE, ' [TYPE] ')
			|| SI_BVL(SUPPLIER_BUYER_NAME, ' [SUPPLIER_BUYER_NAME] ')
			|| SI_BVL(UPDATE_STAT_IND, ' [UPDATE_STAT_IND] ')
			|| ' is/are empty.'
	   FROM SI_TEMP_TSPR_CA010
	  WHERE is_valid = 'N');
		
		-----------------------------------------
		-- Check for duplicate limit supplier buyer records
		--
		-----------------------------------------
		
		UPDATE SI_TEMP_TSPR_CA010 a set is_valid = 'N'
	  where exists (select 1
	  	from SI_TEMP_TSPR_CA010 t
			where t.LIMIT_ID = a.LIMIT_ID
	  	group by t.LIMIT_ID, t.TYPE,t.SUPPLIER_BUYER_NAME
	  	having count(*) > 1)
	  and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, KEY1_VALUE, error_code, error_msg)
	  (select current_timestamp, 'TSPR', 'CA010', limit_id, 'BizErr004', 
			'[M] Duplicate limit supplier buyer info for Limit Id [' 
	  	|| limit_id || '] Type ['|| TYPE ||'] Name ['||  SUPPLIER_BUYER_NAME ||'] - ' 
			|| trim(char(count(*))) || ' records found]'
	  from SI_TEMP_TSPR_CA010
		where is_valid = 'N'
		group by LIMIT_ID, TYPE, SUPPLIER_BUYER_NAME
		having count(*) > 1);
		
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LSP_APPR_LMTS
	--
	-----------------------------------------

	UPDATE SI_TEMP_TSPR_CA010 a SET is_valid = 'N'
	 WHERE NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
	 					WHERE LMT_ID = a.LIMIT_ID
	 					  AND source_id = 'TSPR');
	 					  
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'TSPR', 'CA010', LIMIT_ID, 'BizErr003', 
			'[H] No limit info found for Limit Id [' || LIMIT_ID || ']'
	   FROM SI_TEMP_TSPR_CA010
	  WHERE is_valid = 'N'
	    AND NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
	 					WHERE LMT_ID = LIMIT_ID
	 					  AND source_id = 'TSPR'));
	  
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_TSPR_CA010', 'TSPR', 2);
	commit;
	----------------------------------------
	-- Check update status indicator
	-- for D where record non-exist in CLIMS
	--
	----------------------------------------
	UPDATE SI_TEMP_TSPR_CA010 t set is_valid = 'N'
	where t.UPDATE_STAT_IND = 'D'
		and t.is_valid = 'Y'
		and NOT EXISTS 
			(SELECT 1 FROM SCI_LSP_APPR_LMTS a, CMS_TRADE_SUPPLIER_BUYER b 
				WHERE a.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID and a.SOURCE_ID='TSPR' and a.LMT_ID=t.LIMIT_ID);
	
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(select current_timestamp, 'TSPR', 'CA010', LIMIT_ID, 'BizErr004', 
	'[M] Failed to find deleted trade supplier buyer details in CLIMS with Limit Id [' || LIMIT_ID || ']'
	from SI_TEMP_TSPR_CA010 t where t.UPDATE_STAT_IND = 'D'
		and t.is_valid = 'N'
		and NOT EXISTS 
			(SELECT 1 FROM SCI_LSP_APPR_LMTS a, CMS_TRADE_SUPPLIER_BUYER b 
				WHERE a.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID and a.SOURCE_ID='TSPR' and a.LMT_ID=t.LIMIT_ID));
				
	 CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_TSPR_CA010', 'TSPR', 0);
END
@

CREATE PROCEDURE SI_VALIDATE_TEMP_TSPR_CO021
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_TSPR_CO021', 'TSPR', 1);
	
	UPDATE SI_TEMP_TSPR_CO021 a SET is_valid = 'N'
	 WHERE length(RECORD_TYPE)=0
	    OR length(FACILITY_ID)=0 
	    OR length(FD_RECEIPT_NO)=0
	    OR length(FD_DEPOSIT_AMT_CURRENCY)=0			
			OR length(FD_DEPOSIT_AMT)=0;
			
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'TSPR', 'CO021', FACILITY_ID, FD_RECEIPT_NO, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
			|| SI_BVL(FACILITY_ID, ' [FACILITY_ID] ')
			|| SI_BVL(FD_RECEIPT_NO, ' [FD_RECEIPT_NO] ')
			|| SI_BVL(FD_DEPOSIT_AMT_CURRENCY, ' [FD_DEPOSIT_AMT_CURRENCY] ')
			|| NVL2(char(FD_DEPOSIT_AMT), '', ' [FD_DEPOSIT_AMT] ')
			|| ' is/are empty.'
	   FROM SI_TEMP_TSPR_CO021
	  WHERE is_valid = 'N');
	  
		-----------------------------------------
		-- Check for duplicate deposit records
		--
		-----------------------------------------
		
	  UPDATE SI_TEMP_TSPR_CO021 a set is_valid = 'N'
	  where exists (select 1
	  	from SI_TEMP_TSPR_CO021 t
			where t.FACILITY_ID=a.FACILITY_ID and t.FD_RECEIPT_NO=a.FD_RECEIPT_NO
	  	having count(*) > 1)
		and a.is_valid = 'Y';
	  	
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	  (select current_timestamp, 'TSPR', 'CO021',  FACILITY_ID, FD_RECEIPT_NO, 'BizErr004', 
		'[M] Duplicate deposit info for Facility ID [' || FACILITY_ID 
		|| '] FD Receipt Number [' || FD_RECEIPT_NO || '] - ' || trim(char(count(*))) || ' records found]'
	  from SI_TEMP_TSPR_CO021 a
		where exists (select 1
	  	from SI_TEMP_TSPR_CO021 t
			where t.FACILITY_ID=a.FACILITY_ID and t.FD_RECEIPT_NO=a.FD_RECEIPT_NO
	  	and is_valid = 'N'
			having count(*) > 1)
		group by FACILITY_ID, FD_RECEIPT_NO);
	
	-----------------------------------------
	-- Check for Dependency
	-- to check against SCI_LSP_APPR_LMTS
	--
	-----------------------------------------

	UPDATE SI_TEMP_TSPR_CO021 a SET is_valid = 'N'
	 WHERE NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
	 					WHERE LMT_ID = a.FACILITY_ID
	 					  AND source_id = 'TSPR');
	 					  
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'TSPR', 'CO021', FACILITY_ID, FD_RECEIPT_NO, 'BizErr003', 
			'[H] No limit info found for Facility Id [' || FACILITY_ID || ']'
	   FROM SI_TEMP_TSPR_CO021
	  WHERE is_valid = 'N'
	    AND NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS
	 					WHERE LMT_ID = FACILITY_ID
	 					  AND source_id = 'TSPR'));
		
--	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_TSPR_CO021', 'TSPR', 2);
--	commit;
--	
--	----------------------------------------
--	-- Check update status indicator
--	-- for D where record non-exist in CLIMS
--	--
--	----------------------------------------
--  UPDATE SI_TEMP_TSPR_CO021 a set is_valid = 'N'
--  where a.UPDATE_STAT_IND = 'D'
--		and a.FACILITY_ID||a.FD_RECEIPT_NO not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'TSPR')
--  	and a.is_valid = 'Y';
--  	
--  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
--  (select current_timestamp, 'TSPR', 'CO021', a.FACILITY_ID, a.FD_RECEIPT_NO, 'BizErr004', 
--	'[M] Failed to find deleted security in CLIMS with Security Id [' || a.FACILITY_ID||a.FD_RECEIPT_NO || ']'
--  from SI_TEMP_TSPR_CO021 a where a.UPDATE_STAT_IND = 'D'
--		and a.FACILITY_ID||a.FD_RECEIPT_NO not in (select b.SCI_SECURITY_DTL_ID from cms_security b where b.SOURCE_ID = 'TSPR')
--  	and a.is_valid = 'N');
	
	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_TSPR_CO021', 'TSPR', 0);
END
@

commit work@