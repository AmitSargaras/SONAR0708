drop procedure MIG_RUN_CS
@

CREATE PROCEDURE MIG_RUN_CS
	LANGUAGE SQL
BEGIN
	CALL "MIG_LOG_PROC_TIME"('MIG_RUN_CS', 'MIG', 1);			

	-------------------------------------
	-- insert into cms_secucrity table
	-------------------------------------
	insert into cms_security
	(cms_collateral_id, sci_security_dtl_id, security_sub_type_id, sci_security_subtype_value,subtype_name, type_name, 
	security_location, sci_security_currency, sci_orig_security_currency, security_organisation, custodian_type, 
	security_custodian,	security_perfection_date, is_legal_enforce, is_legal_enforce_date, 
	sci_reference_note, EXCHANGE_CONTROL_OBTAINED, source_id, is_migrated_ind)
	(select CMS_COLLATERAL_ID,
		SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SECURITY_SUB_TYPE_ID, SECURITY_SUB_TYPE_ID, 
		substr(SECURITY_SUB_TYPE, 9, length(security_sub_type)), substr(SECURITY_TYPE, 6, length(SECURITY_TYPE)),
		SECURITY_LOCATION, SECURITY_CURRENCY, SECURITY_CURRENCY, SECURITY_ORGANISATION_CODE, custodian_type_code,
		SECURITY_CUSTODIAN_VALUE, SECURITY_PERFECTION_DATE, LEGAL_ENFORCEABILITY_IND, LEGAL_ENFORCEABILITY_DATE,
		SECURITY_REF_NOTE, EXCHANGE_CONTROL_OBTAINED, SOURCE_ID, 'Y' 
	from MIG_CS
	where valid_ind = 'Y');
	
	-------------------------------------
	-- insert into cms_stage_secucrity table
	-------------------------------------	
	insert into cms_stage_security
	(cms_collateral_id, sci_security_dtl_id, security_sub_type_id, sci_security_subtype_value,subtype_name, type_name, 
	security_location, sci_security_currency, sci_orig_security_currency, security_organisation, custodian_type, 
	security_custodian,	security_perfection_date, is_legal_enforce, is_legal_enforce_date, 
	sci_reference_note, EXCHANGE_CONTROL_OBTAINED, source_id)
	(select CMS_COLLATERAL_STG_ID,
		SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SECURITY_SUB_TYPE_ID, SECURITY_SUB_TYPE_ID, 
		substr(SECURITY_SUB_TYPE, 9, length(security_sub_type)), substr(SECURITY_TYPE, 6, length(SECURITY_TYPE)),
		SECURITY_LOCATION, SECURITY_CURRENCY, SECURITY_CURRENCY, SECURITY_ORGANISATION_CODE, custodian_type_code,
		SECURITY_CUSTODIAN_VALUE, SECURITY_PERFECTION_DATE, LEGAL_ENFORCEABILITY_IND, LEGAL_ENFORCEABILITY_DATE,
		SECURITY_REF_NOTE, EXCHANGE_CONTROL_OBTAINED, SOURCE_ID 
	from MIG_CS
	where valid_ind = 'Y');
	
	
	-----------------------------------------------
	-- insert into cms_secucrity_source table
	-----------------------------------------------
	insert into cms_security_source 
	(cms_security_source_id, cms_collateral_id, source_security_id, source_id, status)
	(SELECT CMS_COLLATERAL_ID, CMS_COLLATERAL_ID, SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SOURCE_ID, 'ACTIVE' 
	FROM MIG_CS
	where valid_ind = 'Y');
	
	-----------------------------
	-- insert into cms_cash
	-----------------------------
	insert into cms_cash
	(CMS_COLLATERAL_ID, INTEREST_CAPITIALISATION, TOTAL_DEPOSIT_AMT)
	(SELECT CMS_COLLATERAL_ID, INTEREST_CAPITALISATION, DEPOSIT_AMT
	FROM MIG_CS
	where valid_ind = 'Y');

	-----------------------------
	-- insert into cms_stage_cash
	-----------------------------
	insert into cms_stage_cash
	(CMS_COLLATERAL_ID, INTEREST_CAPITIALISATION, TOTAL_DEPOSIT_AMT)
	(SELECT CMS_COLLATERAL_STG_ID, INTEREST_CAPITALISATION, DEPOSIT_AMT
	FROM MIG_CS
	where valid_ind = 'Y');	
	
	-----------------------------
	-- insert into cms_cash_deposit
	-----------------------------
	
	insert into cms_cash_deposit
	(CASH_DEPOSIT_ID, THIRD_PARTY_BANK, DEPOSIT_REFERENCE_NUMBER,
 	 DEPOSIT_AMOUNT, DEPOSIT_AMOUNT_CURRENCY, DEPOSIT_MATURITY_DATE, SECURITY_DEPOSIT_IND, DEPOSIT_RECEIPT_NUMBER,
	 CMS_COLLATERAL_ID, CMS_REF_ID, STATUS,  SOURCE_SECURITY_ID, SOURCE_ID)
	(SELECT CASH_DEPOSIT_ID, THIRD_PARTY_BANK, DEPOSIT_REF_NO, 
	 DEPOSIT_AMT, DEPOSIT_AMT_CCY, DEPOSIT_MATURITY_DATE, SECURITY_DEPOSIT, FD_ACCT_NUMBER,
	 CMS_COLLATERAL_ID, CASH_DEPOSIT_ID, 'ACTIVE', SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SOURCE_ID
	FROM MIG_CS
	where valid_ind = 'Y');
	
	-----------------------------
	-- insert into cms_stage_cash_deposit
	-----------------------------	
	insert into cms_stage_cash_deposit
	(CASH_DEPOSIT_ID, THIRD_PARTY_BANK, DEPOSIT_REFERENCE_NUMBER,
 	 DEPOSIT_AMOUNT, DEPOSIT_AMOUNT_CURRENCY, DEPOSIT_MATURITY_DATE, SECURITY_DEPOSIT_IND, DEPOSIT_RECEIPT_NUMBER,
	 CMS_COLLATERAL_ID, CMS_REF_ID, STATUS,  SOURCE_SECURITY_ID, SOURCE_ID)
	(SELECT CASH_DEPOSIT_ID, THIRD_PARTY_BANK, DEPOSIT_REF_NO, 
	 DEPOSIT_AMT, DEPOSIT_AMT_CCY, DEPOSIT_MATURITY_DATE, SECURITY_DEPOSIT, FD_ACCT_NUMBER,
	 CMS_COLLATERAL_STG_ID, CASH_DEPOSIT_ID, 'ACTIVE', SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SOURCE_ID
	FROM MIG_CS
	where valid_ind = 'Y');	
	
	CALL "MIG_LOG_PROC_TIME"('MIG_RUN_CS', 'MIG', 0);

END
@

