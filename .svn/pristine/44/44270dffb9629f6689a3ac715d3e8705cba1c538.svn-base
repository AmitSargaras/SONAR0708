-- SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM, EONCMS_LOCAL@
DROP PROCEDURE SI_VALIDATE_TEMP_MIMB_CU002@
DROP PROCEDURE SI_VALIDATE_TEMP_MIMB_CA003@
DROP PROCEDURE SI_VALIDATE_TEMP_MIMB_CO003@
DROP PROCEDURE SI_VALIDATE_TEMP_MIMB_CO004@
DROP PROCEDURE SI_VALIDATE_TEMP_MIMB_PF002@

    -----------------------------------------------
    --  validation store procedure 
    --  MIMB Customer Information
    --  interface id : CU002 
    -----------------------------------------------
CREATE PROCEDURE SI_VALIDATE_TEMP_MIMB_CU002
  LANGUAGE SQL
BEGIN
  CALL si_log_proc_time('SI_VALIDATE_TEMP_MIMB_CU002', 'MIMB', 1);--

  UPDATE SI_TEMP_MIMB_CU002 SET IS_VALID = 'N'
  WHERE CIF_ID = '' 
    -- OR RECORD_TYPE = '' 
    OR AA_NO = '' 
    OR LEGAL_NAME = '' 
    OR CUSTOMER_NAME = '' 
    OR ID_TYPE_CODE = '' 
    OR ID_NO = '' 
    OR CUST_TYPE_CODE = ''
    OR CUST_TYPE_DESC = ''
    OR CUST_LEGAL_CONST_CODE = ''
    OR CUST_LEGAL_CONST_DESC = '';--

  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, 'MIMB', 'CU002', CIF_ID, ID_NO, 'TechErrSI002', '[L] Mandatory Field(s): ' 
    || SI_BVL(CIF_ID, ' [CIF_ID] ')
    || SI_BVL(AA_NO, ' [AA_NO] ')
    || SI_BVL(LEGAL_NAME, ' [LEGAL_NAME] ')
    || SI_BVL(CUSTOMER_NAME, ' [CUSTOMER_NAME] ')
    || SI_BVL(ID_TYPE_CODE, ' [ID_TYPE_CODE] ')
    || SI_BVL(ID_NO, ' [ID_NO] ')
    || SI_BVL(CUST_TYPE_CODE, ' [CUST_TYPE_CODE] ')
    || SI_BVL(CUST_TYPE_DESC, ' [CUST_TYPE_DESC] ')
    || SI_BVL(CUST_LEGAL_CONST_CODE, ' [CUST_LEGAL_CONST_CODE] ')
    || SI_BVL(CUST_LEGAL_CONST_DESC, ' [CUST_LEGAL_CONST_DESC] ')
    || ' is/are empty.'
  FROM SI_TEMP_MIMB_CU002
  WHERE IS_VALID = 'N');--  
  
  CALL si_log_proc_time('SI_VALIDATE_TEMP_MIMB_CU002', 'MIMB', 2);--

  -- duplicate cif    
  UPDATE SI_TEMP_MIMB_CU002 tmpcust1 set IS_VALID = 'N'
  WHERE tmpcust1.CIF_ID in 
    (select tmpcust2.CIF_ID
    from SI_TEMP_MIMB_CU002 tmpcust2
    group by tmpcust2.CIF_ID
    having count(*) > 1)
  AND tmpcust1.IS_VALID = 'Y';--
    
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
    (select current_timestamp, 'MIMB', 'CU002', CIF_ID, ID_NO, 'BizErr004', '[M] Duplicate customer info [' 
    || CIF_ID || '] - ' || trim(char(count(*))) || ' records found.'
    from SI_TEMP_MIMB_CU002
    group by CIF_ID, ID_NO
    having count(*) > 1);--  
	
  CALL si_log_proc_time('SI_VALIDATE_TEMP_MIMB_CU002', 'MIMB', 3);--
  
	-- ID Type was a fix list in common code category entry
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'MIMB', 'CU002', CIF_ID, ID_NO, 'BizErr003',
			'ID Type [' || ID_TYPE_CODE || '] does not match common code.'
	   FROM SI_TEMP_MIMB_CU002
	  WHERE NOT EXISTS (SELECT 1 FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE ENTRY_CODE = ID_TYPE_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = ID_TYPE_CAT fetch first row only
		));--  	
    
  CALL si_log_proc_time('SI_VALIDATE_TEMP_MIMB_CU002', 'MIMB', 0);--

END@


    -----------------------------------------------
    --  validation store procedure 
    --  MIMB Limit information
    --  interface id : CA003 
    -----------------------------------------------
CREATE PROCEDURE SI_VALIDATE_TEMP_MIMB_CA003
  LANGUAGE SQL
BEGIN
  CALL si_log_proc_time('SI_VALIDATE_TEMP_MIMB_CA003', 'MIMB', 1);--
   
  UPDATE SI_TEMP_MIMB_CA003 SET IS_VALID = 'N'
  WHERE SOURCE_LMT_ID = '' 
    -- OR RECORD_TYPE = '' 
    OR AA_NO = '' 
    OR LMT_BOOK_LOC_CODE = ''
    OR LMT_BOOK_LOC_DESC = ''
    OR PROD_TYPE_CAT = ''
    OR PROD_TYPE_DESC = ''
    OR length(APPROVED_LMT) = 0
    OR length(DRAWING_LMT) = 0
    OR length(OUTSTD_BALANCE) = 0
    OR LMT_STATUS = '';--

INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, 'MIMB', 'CA003', SOURCE_LMT_ID, AA_NO, 'TechErrSI002', '[L] Mandatory Field(s): ' 
    || SI_BVL(SOURCE_LMT_ID, ' [SOURCE_LMT_ID] ')
    || SI_BVL(AA_NO, ' [AA_NO] ')
    || SI_BVL(LMT_BOOK_LOC_CODE, ' [LMT_BOOK_LOC_CODE] ')
    || SI_BVL(LMT_BOOK_LOC_DESC, ' [LMT_BOOK_LOC_DESC] ')
    || SI_BVL(PROD_TYPE_CAT, ' [PROD_TYPE_CAT] ')
    || SI_BVL(PROD_TYPE_DESC, ' [PROD_TYPE_DESC] ')
    || SI_BVL(COALESCE(char(APPROVED_LMT), ''), ' [APPROVED_LMT] ')
    || SI_BVL(COALESCE(char(DRAWING_LMT), ''), ' [DRAWING_LMT] ')
    || SI_BVL(COALESCE(char(OUTSTD_BALANCE), ''), ' [OUTSTD_BALANCE] ')
    || SI_BVL(LMT_STATUS, ' [LMT_STATUS] ')
    || ' is/are empty.'
  FROM SI_TEMP_MIMB_CA003
  WHERE IS_VALID = 'N');--
    
  CALL si_log_proc_time('SI_VALIDATE_TEMP_MIMB_CA003', 'MIMB', 2);--


-- duplicate AA_NO     
  UPDATE SI_TEMP_MIMB_CA003 t
  set IS_VALID = 'N'
  WHERE t.AA_NO in 
    (select t2.AA_NO
    from SI_TEMP_MIMB_CA003 t2
    group by t2.AA_NO
    having count(*) > 1)
  AND t.IS_VALID = 'Y';--

  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
    (select current_timestamp, 'MIMB', 'CA003', AA_NO, 'BizErr004', '[M] Duplicate AA_NO [' 
    || AA_NO || '] - ' || trim(char(count(*))) || ' records found.'
    from SI_TEMP_MIMB_CA003
    group by AA_NO
    having count(*) > 1);--  
    
    CALL si_log_proc_time('SI_VALIDATE_TEMP_MIMB_CA003', 'MIMB', 3);--
    
	UPDATE SI_TEMP_MIMB_CA003 a SET is_valid = 'N'
	WHERE NOT EXISTS (SELECT '1' FROM sci_le_main_profile
						WHERE lmp_le_id = a.source_lmt_id
							AND source_id = 'MIMB');
							
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'MIMB', 'CA003', source_lmt_id, aa_no, 'BizErr003', 
	'[H] Failed to find customer info for CIF Id [' || source_lmt_id || '] from MIMB CU002 interface file'
		FROM SI_TEMP_MIMB_CA003 
	WHERE is_valid = 'N'
		AND NOT EXISTS (SELECT '1' FROM sci_le_main_profile
						WHERE lmp_le_id = source_lmt_id
							AND source_id = 'MIMB'));

  CALL si_log_proc_time('SI_VALIDATE_TEMP_MIMB_CA003', 'MIMB', 0);--

END@


    -----------------------------------------------
    --  validation store procedure 
    --  MIMB collateral : Marketable Security
    --  interface id : CO003 
    -----------------------------------------------
CREATE PROCEDURE SI_VALIDATE_TEMP_MIMB_CO003
  LANGUAGE SQL
BEGIN
  CALL si_log_proc_time('SI_VALIDATE_TEMP_MIMB_CO003', 'MIMB', 1);

  UPDATE SI_TEMP_MIMB_CO003
  SET IS_VALID = 'N'
  WHERE IS_VALID = 'Y'
  --and cast(date_created as varchar(10) ) = cast(current timestamp as varchar(10) ) 
  --AND  date_created > eoncms_local.to_date('15/11/2008 19:12:29','dd/mm/yyyy hh:mi:ss')
  AND  (
  SOURCE_SEC_ID = '' 
  -- OR RECORD_TYPE = '' 
    OR SEC_TYPE = ''
    OR ORIG_SEC_CURRENCY = ''
    OR CMS_SEC_CURRENCY = ''
    OR BRANCH_NAME_CODE = ''
    OR BRANCH_NAME_DESC = ''
    -- OR SEC_PERFECTION_DATE = ''
    OR SEC_PERFECTION_DATE is null
    OR LEGAL_ENFORCE = ''
    OR (LEGAL_ENFORCE = 'Y' and LEGAL_ENFORCE_DATE is null )
    -- OR LEGAL_ENFORCE_DATE = ''
    OR length(AMOUNT_CHARGE) = 0
    -- OR DATE_LEGAL_CHARGED = ''
    OR DATE_LEGAL_CHARGED is null
    OR CHARGE_TYPE = ''
    OR EQUITY_TYPE = ''
    OR length(NUMBER_UNITS) = 0
    OR STOCK_CODE = ''
    OR SEC_PLEDGOR_ID = ''
    OR SEC_PLEDGOR_NAME = ''
    OR SEC_PLEDGOR_REL_CODE = ''
    OR AA_NO = ''
    OR SOURCE_LMT_ID = ''
    );

  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, 'MIMB', 'CO003', SOURCE_SEC_ID, SEC_TYPE, 'TechErrSI002', '[L] Mandatory Field(s): ' 
    || SI_BVL(SOURCE_SEC_ID, ' [SOURCE_SEC_ID] ')
    || SI_BVL(SEC_TYPE, ' [SEC_TYPE] ')
    || SI_BVL(ORIG_SEC_CURRENCY, ' [ORIG_SEC_CURRENCY] ')
    || SI_BVL(CMS_SEC_CURRENCY, ' [CMS_SEC_CURRENCY] ')
    || SI_BVL(BRANCH_NAME_CODE, ' [BRANCH_NAME_CODE] ')
    || SI_BVL(BRANCH_NAME_DESC, ' [BRANCH_NAME_DESC] ')
    || SI_BVL(COALESCE(char(SEC_PERFECTION_DATE), ''), ' [SEC_PERFECTION_DATE] ')
    || SI_BVL(LEGAL_ENFORCE, ' [LEGAL_ENFORCE] ')
    ||(   CASE WHEN (LEGAL_ENFORCE='Y' and LEGAL_ENFORCE_DATE is null) THEN ' [LEGAL_ENFORCE_DATE] ' ELSE '' END      )
    --|| SI_BVL(char(LEGAL_ENFORCE_DATE), ' [LEGAL_ENFORCE_DATE] ')
    || SI_BVL(COALESCE(char(AMOUNT_CHARGE), ''), ' [AMOUNT_CHARGE] ')
    || SI_BVL(COALESCE(char(DATE_LEGAL_CHARGED), ''), ' [DATE_LEGAL_CHARGED] ')
    || SI_BVL(CHARGE_TYPE, ' [CHARGE_TYPE] ')
    || SI_BVL(EQUITY_TYPE, ' [EQUITY_TYPE] ')
    || SI_BVL(COALESCE(char(NUMBER_UNITS), ''), ' [NUMBER_UNITS] ')
    || SI_BVL(STOCK_CODE, ' [STOCK_CODE] ')
    || SI_BVL(SEC_PLEDGOR_ID, ' [SEC_PLEDGOR_ID] ')
    || SI_BVL(SEC_PLEDGOR_NAME, ' [SEC_PLEDGOR_NAME] ')
    || SI_BVL(SEC_PLEDGOR_REL_CODE, ' [SEC_PLEDGOR_REL_CODE] ')
    || SI_BVL(AA_NO, ' [AA_NO] ')
    || SI_BVL(SOURCE_LMT_ID, ' [SOURCE_LMT_ID] ')
    || ' is/are empty.'
  FROM SI_TEMP_MIMB_CO003
  WHERE IS_VALID = 'N'
  --and cast(date_created as varchar(10) ) = cast(current timestamp as varchar(10) ) 
--  AND  date_created > eoncms_local.to_date('15/11/2008 19:12:29','dd/mm/yyyy hh:mi:ss')
    );

   UPDATE SI_TEMP_MIMB_CO003
   SET IS_VALID = 'N'
   WHERE IS_VALID = 'Y'
  and source_sec_id in ( select source_sec_id
                         from   si_temp_mimb_cO003
                         --where  date_created > eoncms_local.to_date('15/11/2008 19:29:09','dd/mm/yyyy hh:mi:ss')
                         group by source_sec_id
                         having count(source_sec_id) > 1
                       )
  ; 
  --and date_created > eoncms_local.to_date('15/11/2008 19:29:09','dd/mm/yyyy hh:mi:ss');

  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
    (select current_timestamp, 'MIMB', 'CO003', SOURCE_SEC_ID, 'BizErr004', '[M] Duplicate SOURCE_SEC_ID [' 
    || SOURCE_SEC_ID || '] - ' || trim(char(count(*))) || ' records found.'
    from SI_TEMP_MIMB_CO003
    --where  date_created > eoncms_local.to_date('15/11/2008 19:29:09','dd/mm/yyyy hh:mi:ss')
    group by SOURCE_SEC_ID
    having count(*) > 1);-- 
    
   UPDATE SI_TEMP_MIMB_CO003 t
   SET IS_VALID = 'N'
   WHERE IS_VALID = 'Y'
	AND NOT EXISTS (select 1 from sci_lsp_appr_lmts 
					 where t.SOURCE_LMT_ID = LMT_ID
					   AND source_id = 'MIMB');
					   
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
    (select current_timestamp, 'MIMB', 'CO003', SOURCE_SEC_ID, SOURCE_LMT_ID, 'BizErr003', 
    	'[H] Failed to find limit info for limit id [' || SOURCE_LMT_ID || '] from MIMB CA003 interface'
    from SI_TEMP_MIMB_CO003 t
   WHERE NOT EXISTS (select 1 from sci_lsp_appr_lmts 
					 where t.SOURCE_LMT_ID = LMT_ID
					   AND source_id = 'MIMB'));--		   

  CALL si_log_proc_time('SI_VALIDATE_TEMP_MIMB_CO003', 'MIMB', 0);

END@


    -----------------------------------------------
    --  validation store procedure 
    --  MIMB collateral : CASH
    --  interface id : CO004 
    -----------------------------------------------
CREATE PROCEDURE SI_VALIDATE_TEMP_MIMB_CO004
  LANGUAGE SQL
BEGIN
  CALL si_log_proc_time('SI_VALIDATE_TEMP_MIMB_CO004', 'MIMB', 1);--

  UPDATE SI_TEMP_MIMB_CO004 SET IS_VALID = 'N'
  WHERE SOURCE_SEC_ID = '' 
    -- OR RECORD_TYPE = ''
    OR SEC_TYPE = ''
    OR SEC_SUB_TYPE = ''
    OR ORIG_SEC_CURRENCY = ''
    -- OR CMS_SEC_CURRENCY = ''
    -- OR SEC_LOCATION = ''
    OR BRANCH_NAME_CODE = ''
    OR BRANCH_NAME_DESC = ''
    -- OR SEC_CUSTODIAN_TYPE = ''
    OR LEGAL_ENFORCE = ''
    OR (LEGAL_ENFORCE = 'Y' and LEGAL_ENFORCE_DATE is null )
    -- OR LEGAL_ENFORCE_DATE = ''
    OR DEPOSIT_REF_NUMBER = ''
    -- OR DEPOSIT_CURRENCY = ''
    OR length(DEPOSIT_AMOUNT) = 0
    OR SEC_PLEDGOR_ID = ''
    OR SEC_PLEDGOR_NAME = ''
    OR SEC_PLEDGOR_REL_CODE = ''
    OR AA_NO = ''
    OR SOURCE_LMT_ID = '';-- 

  -- Legal enforceability date is mandatory if legal enforceability = 'Y'
  UPDATE SI_TEMP_MIMB_CO004
  SET IS_VALID = 'N'
  --WHERE LEGAL_ENFORCE_DATE = ''
  WHERE LEGAL_ENFORCE_DATE is null
  AND LEGAL_ENFORCE = 'Y';--  

  -- Security Custodian (Value) - conditional mandatory yet condition unknown. Need to check

  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, 'MIMB', 'CO004', SOURCE_SEC_ID, SEC_TYPE, 'TechErrSI002', '[L] Mandatory Field(s): ' 
    || SI_BVL(SOURCE_SEC_ID, ' [SOURCE_SEC_ID] ')
    || SI_BVL(SEC_TYPE, ' [SEC_TYPE] ')
    || SI_BVL(SEC_SUB_TYPE, ' [SEC_SUB_TYPE] ')
    || SI_BVL(ORIG_SEC_CURRENCY, ' [ORIG_SEC_CURRENCY] ')
    || SI_BVL(BRANCH_NAME_CODE, ' [BRANCH_NAME_CODE] ')
    || SI_BVL(BRANCH_NAME_DESC, ' [BRANCH_NAME_DESC] ')
    || SI_BVL(LEGAL_ENFORCE, ' [LEGAL_ENFORCE] ')
    ||(   CASE WHEN (LEGAL_ENFORCE='Y' and LEGAL_ENFORCE_DATE is null) THEN ' [LEGAL_ENFORCE_DATE] ' ELSE '' END      )
    --|| SI_BVL(char(LEGAL_ENFORCE_DATE), ' [LEGAL_ENFORCE_DATE] ')
    || SI_BVL(DEPOSIT_REF_NUMBER, ' [DEPOSIT_REF_NUMBER] ')
    || SI_BVL(COALESCE(char(DEPOSIT_AMOUNT), ''), ' [DEPOSIT_AMOUNT] ')
    || SI_BVL(SEC_PLEDGOR_ID, ' [SEC_PLEDGOR_ID] ')
    || SI_BVL(SEC_PLEDGOR_NAME, ' [SEC_PLEDGOR_NAME] ')
    || SI_BVL(SEC_PLEDGOR_REL_CODE, ' [SEC_PLEDGOR_REL_CODE] ')
    || SI_BVL(AA_NO, ' [AA_NO] ')
    || SI_BVL(SOURCE_LMT_ID, ' [SOURCE_LMT_ID] ')
    || ' is/are empty.'
  FROM SI_TEMP_MIMB_CO004
  WHERE IS_VALID = 'N');--  

  CALL si_log_proc_time('SI_VALIDATE_TEMP_MIMB_CO004', 'MIMB', 0);--


   UPDATE SI_TEMP_MIMB_CO004
   SET IS_VALID = 'N'
   WHERE IS_VALID = 'Y'
  and source_sec_id in ( select source_sec_id
                         from   si_temp_mimb_CO004
                         --where  date_created > eoncms_local.to_date('14/11/2008 19:29:09','dd/mm/yyyy hh:mi:ss')
                         group by source_sec_id
                         having count(source_sec_id) > 1
                       );
  --and date_created > eoncms_local.to_date('14/11/2008 19:29:09','dd/mm/yyyy hh:mi:ss');

  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
    (select current_timestamp, 'MIMB', 'CO004', SOURCE_SEC_ID, 'BizErr004', '[M] Duplicate SOURCE_SEC_ID [' 
    || SOURCE_SEC_ID || '] - ' || trim(char(count(*))) || ' records found.'
    from SI_TEMP_MIMB_CO004
    --where  date_created > eoncms_local.to_date('14/11/2008 19:29:09','dd/mm/yyyy hh:mi:ss')
    group by SOURCE_SEC_ID
    having count(*) > 1);--
    
   UPDATE SI_TEMP_MIMB_CO004 t
   SET IS_VALID = 'N'
   WHERE IS_VALID = 'Y'
	AND NOT EXISTS (select 1 from sci_lsp_appr_lmts 
					 where t.SOURCE_LMT_ID = LMT_ID
					   AND source_id = 'MIMB');
					   
  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
    (select current_timestamp, 'MIMB', 'CO004', SOURCE_SEC_ID, SOURCE_LMT_ID, 'BizErr003', 
    	'[H] Failed to find limit info for limit id [' || SOURCE_LMT_ID || '] from MIMB CA003 interface'
    from SI_TEMP_MIMB_CO004 t
   WHERE NOT EXISTS (select 1 from sci_lsp_appr_lmts 
					 where t.SOURCE_LMT_ID = LMT_ID
					   AND source_id = 'MIMB'));--		

END@


    -----------------------------------------------
    --  validation store procedure 
    --  MIMB stock price feed
    --  interface id : PF002 
    -----------------------------------------------
CREATE PROCEDURE SI_VALIDATE_TEMP_MIMB_PF002
  LANGUAGE SQL
BEGIN
  CALL si_log_proc_time('SI_VALIDATE_TEMP_MIMB_PF002', 'MIMB', 1);--
  
  -- Defaulted date
  update SI_TEMP_MIMB_PF002 set EXPIRY_DATE = '2999-12-31 12:00:00.00000' where EXPIRY_DATE is null;--  

  UPDATE SI_TEMP_MIMB_PF002 SET IS_VALID = 'N'
  WHERE STOCK_CODE = '' 
    -- OR RECORD_TYPE = '' 
    OR COUNTER_NAME = ''
    OR EXCHANGE_CODE = ''
    OR length(UNIT_PRICE) = 0
    OR UNIT_PRICE_CURR = ''
    OR STOCK_EXCHG_TRD_BRD_CAT = ''
    OR STOCK_EXCHG_TRD_BRD_DESC = ''
    OR STOCK_TYPES = ''
    OR ( (  STOCK_TYPES = '002' OR STOCK_TYPES = '003'  )  and ( EXPIRY_DATE is null)  )
    OR length(LISTED_SHARES_QTY) = 0
    OR length(PAR_VALUE) = 0
    OR length(PAID_UP_CAPITAL) = 0
    -- OR EXPIRY_DATE = ''
    OR SHARE_STATUS = ''
    OR STOCK_EXCHG_SUSP_IND = ''
	OR LAUNCH_DATE is null;--

  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, 'MIMB', 'PF002', STOCK_CODE, ISIN_CODE, 'TechErrSI002', '[L] Mandatory Field(s): ' 
    || SI_BVL(STOCK_CODE, ' [STOCK_CODE] ')
    || SI_BVL(COUNTER_NAME, ' [COUNTER_NAME] ')
    || SI_BVL(EXCHANGE_CODE, ' [EXCHANGE_CODE] ')
    || SI_BVL(COALESCE(char(UNIT_PRICE), ''), ' [UNIT_PRICE] ')
    || SI_BVL(UNIT_PRICE_CURR, ' [UNIT_PRICE_CURR] ')
    || SI_BVL(STOCK_EXCHG_TRD_BRD_CODE, ' [STOCK_EXCHG_TRD_BRD_CODE] ')
    || SI_BVL(STOCK_EXCHG_TRD_BRD_DESC, ' [STOCK_EXCHG_TRD_BRD_DESC] ')
    || SI_BVL(STOCK_TYPES, ' [STOCK_TYPES] ')
    || SI_BVL(COALESCE(char(LISTED_SHARES_QTY), ''), ' [LISTED_SHARES_QTY] ')
    || SI_BVL(COALESCE(char(PAR_VALUE), ''), ' [PAR_VALUE] ')
    || SI_BVL(COALESCE(char(PAID_UP_CAPITAL), ''), ' [PAID_UP_CAPITAL] ')
    || ( CASE WHEN   ( (  STOCK_TYPES = '002' OR STOCK_TYPES = '003'  )  and ( EXPIRY_DATE is null)  )  THEN  ' [EXPIRY_DATE] '   ELSE '' END ) 
    -- || SI_BVL(char(EXPIRY_DATE), ' [EXPIRY_DATE] ')
    || SI_BVL(SHARE_STATUS, ' [SHARE_STATUS] ')
    || SI_BVL(STOCK_EXCHG_SUSP_IND, ' [STOCK_EXCHG_SUSP_IND] ')
	|| SI_BVL(COALESCE(char(LAUNCH_DATE), '') , ' [LAUNCH_DATE]')
    || ' is/are empty.'
  FROM SI_TEMP_MIMB_PF002
  WHERE IS_VALID = 'N');--  
  
	CALL si_log_proc_time('SI_VALIDATE_TEMP_MIMB_PF002', 'MIMB', 2);--
  
	-- Board Type was a fix list in common code category entry
	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'MIMB', 'PF002', STOCK_CODE, ISIN_CODE, 'BizErr003',
			'Board Type [' || STOCK_EXCHG_TRD_BRD_CODE || '] does not match common code.'
	   FROM SI_TEMP_MIMB_PF002
	  WHERE NOT EXISTS (SELECT 1 FROM COMMON_CODE_CATEGORY_ENTRY 
		WHERE ENTRY_CODE = STOCK_EXCHG_TRD_BRD_CODE
		AND ACTIVE_STATUS = '1'
		AND CATEGORY_CODE = STOCK_EXCHG_TRD_BRD_CAT fetch first row only
		));--  
	
	CALL si_log_proc_time('SI_VALIDATE_TEMP_MIMB_PF002', 'MIMB', 3);--
    
	-- Duplicate stock code, exchange code   
	UPDATE SI_TEMP_MIMB_PF002 t
	SET IS_VALID = 'N'
	WHERE exists (select STOCK_CODE, EXCHANGE_CODE from SI_TEMP_MIMB_PF002 t2
					group by t2.STOCK_CODE, t2.EXCHANGE_CODE
					having count(*) > 1)
	AND t.IS_VALID = 'Y';--

	INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(select current_timestamp, 'MIMB', 'PF002', STOCK_CODE, EXCHANGE_CODE, 'BizErr004', '[M] Duplicate Stock Code [' 
		|| STOCK_CODE || '] and Stock Exchange [' || EXCHANGE_CODE || '] - ' || trim(char(count(*))) || ' records found.'
	from SI_TEMP_MIMB_PF002
	group by STOCK_CODE, EXCHANGE_CODE
	having count(*) > 1);--  	
	
	CALL si_log_proc_time('SI_VALIDATE_TEMP_MIMB_PF002', 'MIMB', 0);--

END@
 
commit work@
