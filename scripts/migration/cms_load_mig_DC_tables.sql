drop procedure MIG_RUN_DC
@

CREATE PROCEDURE MIG_RUN_DC
	LANGUAGE SQL
BEGIN
	CALL "MIG_LOG_PROC_TIME"('MIG_RUN_DC', 'MIG', 1);			

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
	from MIG_DC
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
	from MIG_DC
	where valid_ind = 'Y');	

	-----------------------------------------------
	-- insert into cms_secucrity_source table
	-----------------------------------------------
	insert into cms_security_source 
	(cms_security_source_id, cms_collateral_id, source_security_id, source_id, status)
	(SELECT CMS_COLLATERAL_ID, CMS_COLLATERAL_ID, SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SOURCE_ID, 'ACTIVE' 
	FROM MIG_DC
	where valid_ind = 'Y');
	
	-----------------------------
	-- insert into cms_document
	-----------------------------
	insert into cms_document
	(cms_collateral_id, isda_date, isda_prod_desc, ifema_date, ifema_prod_desc, icom_date, icom_prod_desc, 
	 document_date, min_amt, min_amt_ccy, max_amt, max_amt_ccy, doc_amt, doc_amt_ccy, doc_ref_no, 
	 deed_assignmt_type, doc_desc )
	(SELECT CMS_COLLATERAL_ID, ISDA_AGREEMENT_DATE, ISDA_DESC, IFEMA_AGREEMENT_DATE, IFEMA_DESC, ICOM_DOCUMENT_DATE, ICOM_DESC,
	DOCUMENT_DATE, MIN_AMT, MIN_AMT_CCY, MAX_AMT, MAX_AMT_CCY, DOCUMENT_AMT, DOCUMENT_AMT_CCY, REF_NUMBER, 
	TYPE_DEED_ASSN_CODE, SPECIFIC_UNDERTAKING_REMARKS
	FROM MIG_DC
	where valid_ind = 'Y');
	
	-----------------------------
	-- insert into cms_document
	-----------------------------
	insert into cms_stage_document
	(cms_collateral_id, isda_date, isda_prod_desc, ifema_date, ifema_prod_desc, icom_date, icom_prod_desc, 
	 document_date, min_amt, min_amt_ccy, max_amt, max_amt_ccy, doc_amt, doc_amt_ccy, doc_ref_no, 
	 deed_assignmt_type, doc_desc )
	(SELECT CMS_COLLATERAL_STG_ID, ISDA_AGREEMENT_DATE, ISDA_DESC, IFEMA_AGREEMENT_DATE, IFEMA_DESC, ICOM_DOCUMENT_DATE, ICOM_DESC,
	DOCUMENT_DATE, MIN_AMT, MIN_AMT_CCY, MAX_AMT, MAX_AMT_CCY, DOCUMENT_AMT, DOCUMENT_AMT_CCY, REF_NUMBER, 
	TYPE_DEED_ASSN_CODE, SPECIFIC_UNDERTAKING_REMARKS
	FROM MIG_DC
	where valid_ind = 'Y');	
	
	CALL "MIG_LOG_PROC_TIME"('MIG_RUN_DC', 'MIG', 0);
	
END
@

