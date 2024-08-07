drop procedure MIG_RUN_GT
@

CREATE PROCEDURE MIG_RUN_GT
	LANGUAGE SQL
BEGIN
	CALL "MIG_LOG_PROC_TIME"('MIG_RUN_GT', 'MIG', 1);			

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
		SECURITY_LOCATION, SECURITY_CURRENCY, SECURITY_CURRENCY, SECURITY_ORGANISATION_CODE, CUSTODIAN_TYPE_CODE,
		SECURITY_CUSTODIAN_VALUE, SECURITY_MATURITY_DATE, SECURITY_PERFECTION_DATE, LEGAL_ENFORCEABILITY_IND, LEGAL_ENFORCEABILITY_DATE,
		SECURITY_REF_NOTE, EXCHANGE_CONTROL_OBTAINED, SOURCE_ID, 'Y' 
	from MIG_GT
	where valid_ind = 'Y');
	
	-------------------------------------------------
	-- insert into cms_stage_security table
	-------------------------------------------------	
	insert into cms_stage_security
	(cms_collateral_id, sci_security_dtl_id, security_sub_type_id, sci_security_subtype_value,subtype_name, type_name, 
	security_location, sci_security_currency, sci_orig_security_currency, security_organisation, custodian_type, 
	security_custodian,	security_maturity_date, security_perfection_date, is_legal_enforce, is_legal_enforce_date, 
	sci_reference_note, exchange_control_obtained, source_id)
	(select CMS_COLLATERAL_STG_ID,
		SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SECURITY_SUB_TYPE_ID, SECURITY_SUB_TYPE_ID, 
		substr(SECURITY_SUB_TYPE, 9, length(security_sub_type)), substr(SECURITY_TYPE, 6, length(SECURITY_TYPE)),
		SECURITY_LOCATION, SECURITY_CURRENCY, SECURITY_CURRENCY, SECURITY_ORGANISATION_CODE, CUSTODIAN_TYPE_CODE,
		SECURITY_CUSTODIAN_VALUE, SECURITY_MATURITY_DATE, SECURITY_PERFECTION_DATE, LEGAL_ENFORCEABILITY_IND, LEGAL_ENFORCEABILITY_DATE,
		SECURITY_REF_NOTE, EXCHANGE_CONTROL_OBTAINED, SOURCE_ID 
	from MIG_GT
	where valid_ind = 'Y');	
	
	-----------------------------------------------
	-- insert into cms_secucrity_source table
	-----------------------------------------------
	insert into cms_security_source 
	(cms_security_source_id, cms_collateral_id, source_security_id, source_id, status)
	(SELECT CMS_COLLATERAL_ID, CMS_COLLATERAL_ID, SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SOURCE_ID, 'ACTIVE' 
	FROM MIG_GT
	where valid_ind = 'Y');
	
	-----------------------------------
	-- insert into cms_guarantee
	------------------------------------
	insert into cms_guarantee
	(cms_collateral_id, beneficiary_name, description, guarantee_amt, currency_code, 
	guarantee_date,issuing_bank,
	issuing_bank_country, reference_no, bank_country_risk_approval,
	comments,correspondence_bank,
	within_correspond_bank_limit, current_scheme,
	claim_period, claim_period_time_unit
	)
	(SELECT CMS_COLLATERAL_ID, BENEFICIARY_NAME, GUARANTEE_DESC, GUARANTEE_AMT, SECURITY_CURRENCY, 
	GUARANTEE_DATE, SECURITY_ISSUING_BANK,
	COUNTRY_SEC_ISSUING_BANK, GUARANTEE_REF_NUMBER, BANK_COUNTRY_RISK_APPROVAL, 
	GTE_COMMENTS, CORRESPONDENCE_BANK,
	WITHIN_CORRESPONDENCE_BANK_LMT, SCHEME,
	CLAIM_PERIOD, CLAIM_PERIOD_TIME_UNIT
	FROM MIG_GT
	where valid_ind = 'Y');
	
	-----------------------------------
	-- insert into cms_stage_guarantee
	------------------------------------	
	insert into cms_stage_guarantee
	(cms_collateral_id, beneficiary_name, description, guarantee_amt, currency_code, 
	guarantee_date,issuing_bank,
	issuing_bank_country, reference_no, bank_country_risk_approval,
	comments,correspondence_bank,
	within_correspond_bank_limit, current_scheme,
	claim_period, claim_period_time_unit
	)
	(SELECT CMS_COLLATERAL_STG_ID, BENEFICIARY_NAME, GUARANTEE_DESC, GUARANTEE_AMT, SECURITY_CURRENCY, 
	GUARANTEE_DATE, SECURITY_ISSUING_BANK,
	COUNTRY_SEC_ISSUING_BANK, GUARANTEE_REF_NUMBER, BANK_COUNTRY_RISK_APPROVAL, 
	GTE_COMMENTS, CORRESPONDENCE_BANK,
	WITHIN_CORRESPONDENCE_BANK_LMT, SCHEME,
	CLAIM_PERIOD, CLAIM_PERIOD_TIME_UNIT
	FROM MIG_GT
	where valid_ind = 'Y');

	-----------------------------------
	-- insert into cms_fee_details
	------------------------------------	
	insert into cms_fee_details
	(fee_details_id, cms_collateral_id, cms_ref_id, status, 
	 eff_date, exp_date, guarantee_fee, CGC_FEE,
	 tenor, tenor_unit)
	(select FEE_DETAILS_ID, CMS_COLLATERAL_ID, FEE_DETAILS_ID, 'ACTIVE',
	 date(EFFECTIVE_DATE), date(EXPIRATION_DATE), GUARANTEE_FEE_AMT, CGC_FEE_PAYMENT_ACCT,
	 TENOR, TENOR_UOM
	 from MIG_GT
	 where valid_ind = 'Y');


	insert into cms_stage_fee_details
	(fee_details_id, cms_collateral_id, cms_ref_id, status, 
	 eff_date, exp_date, guarantee_fee, CGC_FEE,
	 tenor, tenor_unit)
	(select FEE_DETAILS_ID, CMS_COLLATERAL_STG_ID, FEE_DETAILS_ID, 'ACTIVE',
	 date(EFFECTIVE_DATE), date(EXPIRATION_DATE), GUARANTEE_FEE_AMT, CGC_FEE_PAYMENT_ACCT,
	 TENOR, TENOR_UOM
	 from MIG_GT
	 where valid_ind = 'Y');
	
	CALL "MIG_LOG_PROC_TIME"('MIG_RUN_GT', 'MIG', 0);
	
END
@
/*
	insert into cms_guarantee
	(cms_collateral_id, beneficiary_name, description, guarantee_amt, currency_code, guarantee_date,issuing_bank,
	issuing_bank_country, reference_no, bank_country_risk_approval, "expiry_date,project_name",
	"awarded_date,letter_of_instruction_flag,letter_of_undertaking_flag,blanket_assignment,"comments,correspondence_bank,
	within_correspond_bank_limit,"current_lg_details,current_lg_ref_nbr,current_eff_date,current_lg_tenor"current_scheme,
	current_expiration_date,"current_lg_status,current_gtee_cover_amt",current_gtee_fee_amt,"current_multiple_single,"
	"amm_eff_date,amm_gtee_cover_amt,amm_gtee_fee_amt,"cgc_fee_payment_acct,"facility_type,previous_lg_details,
	previous_lg_ref_nbr,previous_date_cancelled,previous_cancelled_by,previous_lg_status,previous_reason,
	previous_gtee_fee_amt,holding_period,holding_period_time_unit"
	claim_period, claim_period_time_unit
	)
*/
