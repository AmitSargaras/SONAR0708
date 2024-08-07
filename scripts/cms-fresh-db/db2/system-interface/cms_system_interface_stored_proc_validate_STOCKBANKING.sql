--SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,CLIMS_LOCAL;
--DROP PROCEDURE SI_VALIDATE_TEMP_STBG_CO022@
--DROP PROCEDURE SI_VALIDATE_TEMP_STBG_CO023@
--DROP PROCEDURE SI_VALIDATE_TEMP_STBG_CO024@
--DROP PROCEDURE SI_VALIDATE_TEMP_STBG_PF001@
--DROP PROCEDURE SI_VALIDATE_TEMP_STBG_PF002@
--DROP PROCEDURE SI_VALIDATE_TEMP_STBG_SH001@

CREATE PROCEDURE SI_VALIDATE_TEMP_STBG_CO022
     LANGUAGE SQL
  BEGIN
    CALL si_log_proc_time('SI_VALIDATE_TEMP_STBG_CO022', 'STBG', 1);
    
    UPDATE si_temp_stbg_co022 a SET is_valid = 'N'
	   WHERE security_id = ''   
	    OR cif_id = ''   
	    OR security_type = ''   
	    OR original_currency = ''   
	    OR loc_country = ''   
	    OR security_custodian_type = ''   
	    OR legal_enforceability = ''   
	    OR legal_enforceability_date is null  
	    OR security_perfection_date is null
	    OR TYPE = ''   
	    OR registered_name = ''   
	    OR custodian_type = ''   
	    OR STOCK_CODE = ''   
	    OR recognized_exchange = '';
    
    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
			(SELECT CURRENT_TIMESTAMP, 'STBG', 'CO022', security_id, cif_id, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(security_id, ' [SECURITY_ID] ')
			|| SI_BVL(cif_id, ' [CIF_ID] ')
			|| SI_BVL(security_type, ' [SECURITY_TYPE] ')
			|| SI_BVL(original_currency, ' [ORIGINAL_CURRENCY] ')
			|| SI_BVL(loc_country, ' [LOC_COUNTRY] ')
			|| SI_BVL(security_custodian_type, ' [SECURITY_CUSTODIAN_TYPE] ')
			|| SI_BVL(legal_enforceability, ' [LEGAL_ENFORCEABILITY] ')
			|| SI_BVL(char(legal_enforceability_date), ' [LEGAL_ENFORCEABILITY_DATE] ')
			|| SI_BVL(char(security_perfection_date), ' [SECURITY_PERFECTION_DATE] ')
			|| SI_BVL(TYPE, ' [TYPE] ')
			|| SI_BVL(registered_name, ' [REGISTERED_NAME] ')
			|| SI_BVL(custodian_type, ' [CUSTODIAN_TYPE] ')
			|| SI_BVL(STOCK_CODE, ' [STOCK_CODE] ')
			|| SI_BVL(recognized_exchange, ' [RECOGNIZED_EXCHANGE] ')
			|| ' is/are empty.'
	   FROM si_temp_stbg_co022
	  WHERE is_valid = 'N');
    
	  UPDATE SI_TEMP_STBG_CO022 A SET IS_VALID = 'N'
	  WHERE A.SECURITY_ID IN (SELECT T.SECURITY_ID
	  	FROM SI_TEMP_STBG_CO022 T
	  	GROUP BY T.SECURITY_ID
	  	HAVING COUNT(*) > 1)
	  AND A.IS_VALID = 'Y';
	  	
	  INSERT INTO SI_ERROR_LOG (TIME_STAMP, SYSTEM_ID, INTERFACE_ID, KEY1_VALUE, ERROR_CODE, ERROR_MSG)
	  (SELECT CURRENT_TIMESTAMP, 'STBG', 'CO022', SECURITY_ID, 'BizErr004', '[M] Duplicate security id [' 
	  	|| SECURITY_ID || '] - ' || TRIM(CHAR(COUNT(*))) || ' records found.'
	  FROM SI_TEMP_STBG_CO022
	  WHERE IS_VALID = 'N'
	  GROUP BY SECURITY_ID
	  HAVING COUNT(*) > 1);
		
	  UPDATE SI_TEMP_STBG_CO022 SET IS_VALID = 'N'
	  WHERE NOT EXISTS (SELECT 1 FROM SCI_LSP_SYS_XREF WHERE CIF_ID = LSX_EXT_SYS_ACCT_NUM AND LSX_EXT_SYS_CODE_VALUE = 'ARBS')
	  AND IS_VALID = 'Y';
		
		INSERT INTO SI_ERROR_LOG (TIME_STAMP, SYSTEM_ID, INTERFACE_ID, KEY1_VALUE, ERROR_CODE, ERROR_MSG)
	  (SELECT CURRENT_TIMESTAMP, 'STBG', 'CO022', CIF_ID, 'BizErr003', '[H] Account no. not matched with ARBS CIF Id [' 
	  	|| CIF_ID || '].'
	  FROM SI_TEMP_STBG_CO022
		WHERE NOT EXISTS (SELECT 1 FROM SCI_LSP_SYS_XREF WHERE CIF_ID = LSX_EXT_SYS_ACCT_NUM AND LSX_EXT_SYS_CODE_VALUE = 'ARBS')
	  AND IS_VALID = 'N');
    
    CALL si_log_proc_time('SI_VALIDATE_TEMP_STBG_CO022', 'STBG', 0);
  END@
  
  
CREATE PROCEDURE SI_VALIDATE_TEMP_STBG_CO023
     LANGUAGE SQL
  BEGIN
    CALL si_log_proc_time('SI_VALIDATE_TEMP_STBG_CO023', 'STBG', 1);
  
    UPDATE si_temp_stbg_co023 a SET is_valid = 'N'
	   WHERE CIF = ''  
	    OR SECURITY_ID = ''  
	    OR SHARE_ID = '' 
	    OR SHARES_TYPE = '';
	    --OR UNITS = '' ; 
	    
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
			(SELECT CURRENT_TIMESTAMP, 'STBG', 'CO023', SECURITY_ID, CIF, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(CIF, ' [CIF] ')
			|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
			|| SI_BVL(SHARE_ID, ' [SHARE_ID] ')
			|| SI_BVL(SHARES_TYPE, ' [SHARES_TYPE] ')
			--|| SI_BVL(char(UNITS), ' [UNITS] ')
			|| ' is/are empty.'
	   FROM si_temp_stbg_co023
	  WHERE is_valid = 'N');
    
    UPDATE SI_TEMP_STBG_CO023 A SET IS_VALID = 'N'
	   WHERE NOT EXISTS (SELECT '1' FROM CMS_SECURITY
	 					WHERE SCI_SECURITY_DTL_ID = A.SECURITY_ID
	 					  AND SOURCE_ID = 'STBG');
	 					  
	 	INSERT INTO SI_ERROR_LOG (TIME_STAMP, SYSTEM_ID, INTERFACE_ID, KEY1_VALUE, ERROR_CODE, ERROR_MSG)
    (SELECT CURRENT_TIMESTAMP, 'STBG', 'CO023', SECURITY_ID, 'BizErr003', '[H] No marketable security found for security id [' || SECURITY_ID || ']'
      FROM SI_TEMP_STBG_CO023 
     WHERE IS_VALID = 'N'
       AND NOT EXISTS (SELECT '1' FROM CMS_SECURITY
     					WHERE SCI_SECURITY_DTL_ID = SECURITY_ID
     					  AND SOURCE_ID = 'STBG'));
     					  
     -----------------------------------------
	 -- Check for Duplicate
	 --
	 -----------------------------------------
	 UPDATE SI_TEMP_STBG_CO023 A SET IS_VALID = 'N'
	  WHERE SHARE_ID IN (SELECT SHARE_ID
	  	FROM SI_TEMP_STBG_CO023 t
	  	GROUP BY SHARE_ID
	  	HAVING COUNT(*) > 1)
	  and A.IS_VALID = 'Y';
	  	
	  INSERT INTO SI_ERROR_LOG (TIME_STAMP, SYSTEM_ID, INTERFACE_ID, KEY1_VALUE, ERROR_CODE, ERROR_MSG)
	  (select CURRENT_TIMESTAMP, 'STBG', 'CO023', SHARE_ID, 
	  'BizErr003', 'Duplicate share info for SHARE ID [' ||  SHARE_ID || '] - ' || trim(char(count(*))) || ' records found]'
	  from SI_TEMP_STBG_CO023 
	  GROUP BY SHARE_ID
	  	HAVING COUNT(*) > 1);   
     					
    CALL si_log_proc_time('SI_VALIDATE_TEMP_STBG_CO023', 'STBG', 0);
  END@


CREATE PROCEDURE SI_VALIDATE_TEMP_STBG_CO024
     LANGUAGE SQL
  BEGIN
    CALL si_log_proc_time('SI_VALIDATE_TEMP_STBG_CO024', 'STBG', 1);
  
    UPDATE si_temp_stbg_co024 a SET is_valid = 'N'
	   WHERE SECURITY_ID = ''  
	    OR CIF_NUMBER = ''  
	    OR SETTLEMENT_ACCT_NUMBER = ''  
	    OR PLEDGOR_CIF_SOURCE = '' 
	    OR PLEDGOR_LEGAL_NAME = ''
	    OR INCORPORATION_COUNTRY = ''
	    OR ID_DESC = ''
	    OR ID_TYPE = '';
	    
	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
			(SELECT CURRENT_TIMESTAMP, 'STBG', 'CO024', SECURITY_ID, CIF_NUMBER, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(SECURITY_ID, ' [SECURITY_ID] ')
			|| SI_BVL(CIF_NUMBER, ' [CIF_NUMBER] ')
			|| SI_BVL(SETTLEMENT_ACCT_NUMBER, ' [SETTLEMENT_ACCT_NUMBER] ')
			|| SI_BVL(PLEDGOR_CIF_SOURCE, ' [PLEDGOR_CIF_SOURCE] ')
			|| SI_BVL(PLEDGOR_LEGAL_NAME, ' [PLEDGOR_LEGAL_NAME] ')
			|| SI_BVL(INCORPORATION_COUNTRY, ' [INCORPORATION_COUNTRY] ')
			|| SI_BVL(ID_DESC, ' [ID_DESC] ')
			|| SI_BVL(ID_TYPE, ' [ID_TYPE] ')
			|| ' is/are empty.'
	   FROM si_temp_stbg_co024
	  WHERE is_valid = 'N');
    
	  UPDATE si_temp_stbg_co024 A SET IS_VALID = 'N'
	  WHERE A.SECURITY_ID||A.CIF_NUMBER IN (SELECT T.SECURITY_ID||T.CIF_NUMBER
	  	FROM si_temp_stbg_co024 T
	  	GROUP BY T.SECURITY_ID, T.CIF_NUMBER
	  	HAVING COUNT(*) > 1)
	  AND A.IS_VALID = 'Y';
	  	
	  INSERT INTO SI_ERROR_LOG (TIME_STAMP, SYSTEM_ID, INTERFACE_ID, KEY1_VALUE, KEY2_VALUE, ERROR_CODE, ERROR_MSG)
	  (SELECT CURRENT_TIMESTAMP, 'STBG', 'CO024', CIF_NUMBER, SECURITY_ID, 'BizErr004', '[M] Duplicate CIF-Security ID map [' 
	  	|| CIF_NUMBER || ' - ' || SECURITY_ID || '] - ' || TRIM(CHAR(COUNT(*))) || ' records found.'
	  FROM SI_TEMP_STBG_CO024
	  WHERE IS_VALID = 'N'
	  GROUP BY SECURITY_ID, CIF_NUMBER
	  HAVING COUNT(*) > 1);
    
    CALL si_log_proc_time('SI_VALIDATE_TEMP_STBG_CO024', 'STBG', 0);
  END@
  

CREATE PROCEDURE SI_VALIDATE_TEMP_STBG_PF001
     LANGUAGE SQL
  BEGIN
    CALL si_log_proc_time('SI_VALIDATE_TEMP_STBG_PF001', 'STBG', 1);
      
    UPDATE si_temp_stbg_pf001 a SET is_valid = 'N'
	   WHERE STOCK_CODE = '' 
	    OR COUNTER_NAME = '' 
	    OR EXCHANGE_CODE = '' 
	    OR UNIT_PRICE IS NULL
	    OR UNIT_PRICE_CURRENCY = '' 
	    OR STOCK_EXCHG_TRAD_BOARD_CODE = '' 
	    OR STOCK_EXCHG_TRAD_BOARD_DESC = '' 
	    OR STOCK_TYPES = '';
	    --OR LISTED_SHARES_QUANTITY = ''
	    --OR PAR_VALUE = '' 
	    --OR PAID_UP_CAPITAL = ''
	    --OR EXPIRY_DATE IS NULL 
	    --OR SHARE_STAT = ''
	    --OR STOCK_EXCHG_SUSPEND_COUNT_IND = '';
    
    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
			(SELECT CURRENT_TIMESTAMP, 'STBG', 'PF001', STOCK_CODE, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(STOCK_CODE, ' [STOCK_CODE] ')
			|| SI_BVL(COUNTER_NAME, ' [COUNTER_NAME] ')
			|| SI_BVL(EXCHANGE_CODE, ' [EXCHANGE_CODE] ')
			|| SI_BVL(char(UNIT_PRICE), ' [UNIT_PRICE] ')
			|| SI_BVL(UNIT_PRICE_CURRENCY, ' [UNIT_PRICE_CURRENCY] ')
			|| SI_BVL(STOCK_EXCHG_TRAD_BOARD_CODE, ' [STOCK_EXCHG_TRAD_BOARD_CODE] ')
			|| SI_BVL(STOCK_EXCHG_TRAD_BOARD_DESC, ' [STOCK_EXCHG_TRAD_BOARD_DESC] ')
			|| SI_BVL(STOCK_TYPES, ' [STOCK_TYPES] ')
			--|| SI_BVL(char(LISTED_SHARES_QUANTITY), ' [LISTED_SHARES_QUANTITY] ')
			--|| SI_BVL(char(PAR_VALUE), ' [PAR_VALUE] ')
			--|| SI_BVL(char(PAID_UP_CAPITAL), ' [PAID_UP_CAPITAL] ')
			--|| SI_BVL(char(EXPIRY_DATE), ' [EXPIRY_DATE] ')
			--|| SI_BVL(SHARE_STAT, ' [SHARE_STAT] ')
			--|| SI_BVL(STOCK_EXCHG_SUSPEND_COUNT_IND, ' [STOCK_EXCHG_SUSPEND_COUNT_IND] ')
			|| ' is/are empty.'
	   FROM si_temp_stbg_pf001
	  WHERE is_valid = 'N');
    
    CALL si_log_proc_time('SI_VALIDATE_TEMP_STBG_PF001', 'STBG', 0);
  END@


CREATE PROCEDURE SI_VALIDATE_TEMP_STBG_PF002
     LANGUAGE SQL
  BEGIN
    CALL si_log_proc_time('SI_VALIDATE_TEMP_STBG_PF002', 'STBG', 1);
    
    UPDATE si_temp_stbg_pf002 a SET is_valid = 'N'
	   WHERE EXCHANGE_CODE = ''
	    OR STOCK_INDEX_CODE = '';
	    --OR STOCK_INDEX_PRICE = '' ;
    
    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
			(SELECT CURRENT_TIMESTAMP, 'STBG', 'PF002', STOCK_INDEX_CODE, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(EXCHANGE_CODE, ' [EXCHANGE_CODE] ')
			|| SI_BVL(STOCK_INDEX_CODE, ' [STOCK_INDEX_CODE] ')
			--|| SI_BVL(char(STOCK_INDEX_PRICE), ' [STOCK_INDEX_PRICE] ')
			|| ' is/are empty.'
	   FROM si_temp_stbg_pf002
	  WHERE is_valid = 'N');
	  
    CALL si_log_proc_time('SI_VALIDATE_TEMP_STBG_PF002', 'STBG', 0);
  END@
  
  
CREATE PROCEDURE SI_VALIDATE_TEMP_STBG_SH001
     LANGUAGE SQL
  BEGIN
    CALL si_log_proc_time('SI_VALIDATE_TEMP_STBG_SH001', 'STBG', 1);
    
    UPDATE si_temp_stbg_sh001 a SET is_valid = 'N'
	   WHERE STOCK_CODE = ''
	    OR STOCK_EXCHANGE_CODE = '' 
	    OR STOCK_EXCHANGE_COUNTRY = ''
      OR ISSUER_NAME = '';
	    --OR TOTAL_NO_OF_UNIT = ''
	    --OR SIGN_OF_UNIT = '';

    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
			(SELECT CURRENT_TIMESTAMP, 'STBG', 'SH001', STOCK_CODE, 'TechErrSI002',
			'[L] Mandatory Field(s): ' 
			|| SI_BVL(STOCK_CODE, ' [STOCK_CODE] ')
			|| SI_BVL(STOCK_EXCHANGE_CODE, ' [STOCK_EXCHANGE_CODE] ')
			|| SI_BVL(STOCK_EXCHANGE_COUNTRY, ' [STOCK_EXCHANGE_COUNTRY] ')
			|| SI_BVL(ISSUER_NAME, ' [ISSUER_NAME] ')
			--|| SI_BVL(char(TOTAL_NO_OF_UNIT), ' [TOTAL_NO_OF_UNIT] ')
			--|| SI_BVL(SIGN_OF_UNIT, ' [SIGN_OF_UNIT] ')
			|| ' is/are empty.'
	   FROM si_temp_stbg_sh001
	  WHERE is_valid = 'N');
	  
    UPDATE si_temp_stbg_sh001 A SET is_valid = 'N'
	   WHERE NOT EXISTS (SELECT '1' FROM CMS_PRICE_FEED B
	 				WHERE A.STOCK_CODE = B.STOCK_CODE AND A.STOCK_EXCHANGE_CODE = B.EXCHANGE);

    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(SELECT CURRENT_TIMESTAMP, 'STBG', 'SH001', A.STOCK_CODE, A.STOCK_EXCHANGE_CODE, 'BizErr003', 
  			'[H] No Stock code [' || A.STOCK_CODE || '] for Stock Exchange code [' || A.STOCK_EXCHANGE_CODE || '] found in Price Feed.'
  	   FROM si_temp_stbg_sh001 A
  	  WHERE is_valid = 'N'
  	    AND NOT EXISTS (SELECT '1' FROM CMS_PRICE_FEED B
	 				WHERE A.STOCK_CODE = B.STOCK_CODE AND A.STOCK_EXCHANGE_CODE = B.EXCHANGE));
					
    CALL si_log_proc_time('SI_VALIDATE_TEMP_STBG_SH001', 'STBG', 0);
  END@
  
COMMIT WORK@



