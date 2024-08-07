drop procedure MIG_RUN_MS
@

CREATE PROCEDURE MIG_RUN_MS
	LANGUAGE SQL
BEGIN ATOMIC
	CALL "MIG_LOG_PROC_TIME"('MIG_RUN_MS', 'MIG', 1);			

	-------------------------------------
	-- insert into cms_secucrity table
	-------------------------------------
	insert into cms_security
	(cms_collateral_id, sci_security_dtl_id, security_sub_type_id, sci_security_subtype_value,subtype_name, type_name, 
	security_location, sci_security_currency, sci_orig_security_currency, security_organisation, custodian_type, 
	security_custodian,	security_maturity_date, security_perfection_date, is_legal_enforce, is_legal_enforce_date, 
	sci_reference_note, exchange_control_obtained, source_id, is_migrated_ind)
	(select CMS_COLLATERAL_ID,
		SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SECURITY_SUB_TYPE_ID, SECURITY_SUB_TYPE_ID, 
		substr(SECURITY_SUB_TYPE, 9, length(security_sub_type)), substr(SECURITY_TYPE, 6, length(SECURITY_TYPE)),
		SECURITY_LOCATION, SECURITY_CURRENCY, SECURITY_CURRENCY, SECURITY_ORGANISATION_CODE, custodian_type_code,
		SECURITY_CUSTODIAN_VALUE, SECURITY_MATURITY_DATE, SECURITY_PERFECTION_DATE, LEGAL_ENFORCEABILITY_IND, LEGAL_ENFORCEABILITY_DATE,
		SECURITY_REF_NOTE, EXCHANGE_CONTROL_OBTAINED, SOURCE_ID, 'Y' 
	from MIG_MS
	where valid_ind = 'Y');
	
	-------------------------------------------------
	-- insert into cms_stage_secucrity table
	-------------------------------------------------	
	insert into cms_stage_security
	(cms_collateral_id, sci_security_dtl_id, security_sub_type_id, sci_security_subtype_value,subtype_name, type_name, 
	security_location, sci_security_currency, sci_orig_security_currency, security_organisation, custodian_type, 
	security_custodian,	security_maturity_date, security_perfection_date, is_legal_enforce, is_legal_enforce_date, 
	sci_reference_note, exchange_control_obtained, source_id)
	(select CMS_COLLATERAL_STG_ID,
		SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SECURITY_SUB_TYPE_ID, SECURITY_SUB_TYPE_ID, 
		substr(SECURITY_SUB_TYPE, 9, length(security_sub_type)), substr(SECURITY_TYPE, 6, length(SECURITY_TYPE)),
		SECURITY_LOCATION, SECURITY_CURRENCY, SECURITY_CURRENCY, SECURITY_ORGANISATION_CODE, custodian_type_code,
		SECURITY_CUSTODIAN_VALUE, SECURITY_MATURITY_DATE, SECURITY_PERFECTION_DATE, LEGAL_ENFORCEABILITY_IND, LEGAL_ENFORCEABILITY_DATE,
		SECURITY_REF_NOTE, EXCHANGE_CONTROL_OBTAINED, SOURCE_ID 
	from MIG_MS
	where valid_ind = 'Y');	
	
	-----------------------------------------------
	-- insert into cms_secucrity_source table
	-----------------------------------------------
	insert into cms_security_source 
	(cms_security_source_id, cms_collateral_id, source_security_id, source_id, status)
	(SELECT CMS_COLLATERAL_ID, CMS_COLLATERAL_ID, SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SOURCE_ID, 'ACTIVE' 
	FROM MIG_MS
	where valid_ind = 'Y');
	
	------------------------------------
	-- insert in cms_marketable_sec
	------------------------------------
	insert into cms_marketable_sec (cms_collateral_id)
	(select cms_collateral_id
	from mig_ms
	where valid_ind = 'Y');
	
	insert into cms_stage_marketable_sec (cms_collateral_id)
	(select cms_collateral_stg_id
	from mig_ms
	where valid_ind = 'Y');	
	
	---------------------------------
	-- insert into cms_portfolio
	----------------------------------
	insert into cms_portfolio_item
	(item_id, cms_collateral_id, type,
	 issuer_name, no_of_units, agent_name,
	 bond_issue_date, is_blacklisted, issuer_id_type, stock_exchange,
	 stock_exchange_country, basel_compliant_text, 
	 exchange_control_obtained, security_custodian, security_maturity_date, cms_ref_id, unit_price,
	 custodian_type, stock_code, isin_code, 
	 recognized_exchange_flag,source_id,recogn_exchange )
	(SELECT ITEM_ID, CMS_COLLATERAL_ID, EQUITY_TYPE, ISSUER_NAME, UNITS, NOMINEE_NAME,
	BOND_ISSUE_DATE, SECURITY_REF_IND, ISSUER_TYPE, STOCK_BOND_STOCK_EXCHANGE, 
	STOCK_BOND_STK_EXG_CTRY, BASEL_COMPLIANT_UNIT_TRUST_COL,
	EXCHANGE_CONTROL_OBTAINED, SECURITY_CUSTODIAN_VALUE, SECURITY_MATURITY_DATE, ITEM_ID, UNIT_PRICE,
	CUSTODIAN_TYPE_CODE, STOCK_CODE, ISIN_CODE,
	RECOGNIZED_EXCHANGE_IND, SOURCE_ID, RECOGNIZED_EXCHANGE_IND
	FROM MIG_MS
	where valid_ind = 'Y');

	---------------------------------
	-- insert into cms_portfolio
	----------------------------------
	insert into cms_stage_portfolio_item
	(item_id, cms_collateral_id, type,
	 issuer_name, no_of_units, agent_name,
	 bond_issue_date, is_blacklisted, issuer_id_type, stock_exchange,
	 stock_exchange_country, basel_compliant_text, 
	 exchange_control_obtained, security_custodian, security_maturity_date, cms_ref_id, unit_price,
	 custodian_type, stock_code, isin_code, 
	 recognized_exchange_flag,source_id,recogn_exchange )
	(SELECT ITEM_ID, CMS_COLLATERAL_STG_ID, EQUITY_TYPE, ISSUER_NAME, UNITS, NOMINEE_NAME,
	BOND_ISSUE_DATE, SECURITY_REF_IND, ISSUER_TYPE, STOCK_BOND_STOCK_EXCHANGE, 
	STOCK_BOND_STK_EXG_CTRY, BASEL_COMPLIANT_UNIT_TRUST_COL,
	EXCHANGE_CONTROL_OBTAINED, SECURITY_CUSTODIAN_VALUE, SECURITY_MATURITY_DATE, ITEM_ID, UNIT_PRICE,
	CUSTODIAN_TYPE_CODE, STOCK_CODE, ISIN_CODE,
	RECOGNIZED_EXCHANGE_IND, SOURCE_ID, RECOGNIZED_EXCHANGE_IND
	FROM MIG_MS
	where valid_ind = 'Y');
		

	CALL "MIG_LOG_PROC_TIME"('MIG_RUN_MS', 'MIG', 0);

	--CDS_MATURITY_DATE TIMESTAMP,

END
@

/*
	insert into cms_portfolio
	(cms_collateral_id, "item_id," type,
	"certificate_no, registered_name," issuer_name, no_of_units, "nominal_value," agent_name," agent_confirm_date,"
	 bond_issue_date, "bond_maturity_date, currency_code," cms_collateral_id, is_blacklisted, "settlement_org, issuer_id_type," stock_exchange,
	 stock_exchange_country, "index_name, ric, " basel_compliant_text, "cmv, fsv, cmv_currency, fsv_currency, local_exchange, govt_guarantee,
	 name_of_govt,lead_manager,"exchange_control_obtained, security_custodian, security_maturity_date, cms_ref_id, unit_price,
	 "unit_price_currency,status,"custodian_type, "bond_rating," stock_code, isin_code, "recovery_date, holding_period, holding_period_uom,"
	 recognized_exchange_flag,source_id,recogn_exchange )
*/