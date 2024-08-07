drop procedure MIG_RUN_OT
@

CREATE PROCEDURE MIG_RUN_OT
	LANGUAGE SQL
BEGIN
	CALL "MIG_LOG_PROC_TIME"('MIG_RUN_OT', 'MIG', 1);			

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
	from MIG_OT
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
	from MIG_OT
	where valid_ind = 'Y');
	
	-----------------------------------------------
	-- insert into cms_secucrity_source table
	-----------------------------------------------
	insert into cms_security_source 
	(cms_security_source_id, cms_collateral_id, source_security_id, source_id, status)
	(SELECT CMS_COLLATERAL_ID, CMS_COLLATERAL_ID, SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SOURCE_ID, 'ACTIVE' 
	FROM MIG_OT
	where valid_ind = 'Y');
	
	-----------------------------
	-- insert into cms_others
	-----------------------------
	insert into cms_others
	(cms_collateral_id,	env_risky_status, env_risky_date, env_risky_remarks, description_others, 
	is_phy_inspect, phy_inspect_freq, phy_inspect_freq_unit, last_phy_inspect_date, next_phy_inspect_date)
	(SELECT CMS_COLLATERAL_ID, SEC_ENVIRONMENTAL_RISKY_IND, DATE_SEC_CONFIRM_ENV_RISKY, REMARKS_SEC_ENV_RISKY, ASSET_DESC,
	 PHYSICAL_INSPECTION_IND, PHYSICAL_INSPECTION_FREQ_UNIT, PHYSICAL_INSPECTION_FREQ_UOM, LAST_PHYSICAL_INSPECTION_DATE, 
	 NEXT_PHYSICAL_INSPECTION_DATE
	FROM MIG_OT
	where valid_ind = 'Y');
	
	-----------------------------
	-- insert into cms_others
	-----------------------------	
	insert into cms_stage_others
	(cms_collateral_id,	env_risky_status, env_risky_date, env_risky_remarks, description_others, is_phy_inspect, phy_inspect_freq,	
	phy_inspect_freq_unit, last_phy_inspect_date, next_phy_inspect_date)
	(SELECT CMS_COLLATERAL_STG_ID, SEC_ENVIRONMENTAL_RISKY_IND, DATE_SEC_CONFIRM_ENV_RISKY, REMARKS_SEC_ENV_RISKY, ASSET_DESC,
	 PHYSICAL_INSPECTION_IND, PHYSICAL_INSPECTION_FREQ_UNIT, PHYSICAL_INSPECTION_FREQ_UOM, LAST_PHYSICAL_INSPECTION_DATE, 
	 NEXT_PHYSICAL_INSPECTION_DATE
	FROM MIG_OT
	where valid_ind = 'Y');	
	
	CALL "MIG_LOG_PROC_TIME"('MIG_RUN_OT', 'MIG', 0);

	
END
@

