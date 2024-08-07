drop procedure MIG_RUN_AB102
@

CREATE PROCEDURE MIG_RUN_AB102
	LANGUAGE SQL
BEGIN
	CALL "MIG_LOG_PROC_TIME"('MIG_RUN_AB102', 'MIG', 1);			

	-------------------------------------
	-- insert into cms_secucrity table
	-------------------------------------
	insert into cms_security
	(cms_collateral_id, sci_security_dtl_id, security_sub_type_id, sci_security_subtype_value,subtype_name, type_name, 
	security_location, sci_security_currency, sci_orig_security_currency, security_organisation, custodian_type, 
	security_custodian,	security_maturity_date, security_perfection_date, is_legal_enforce, is_legal_enforce_date, 
	sci_reference_note, EXCHANGE_CONTROL_OBTAINED, source_id, is_migrated_ind)
	(select CMS_COLLATERAL_ID,
		SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SECURITY_SUB_TYPE_ID, SECURITY_SUB_TYPE_ID, 
		substr(SECURITY_SUB_TYPE, 9, length(security_sub_type)), substr(SECURITY_TYPE, 6, length(SECURITY_TYPE)),
		SECURITY_LOCATION, SECURITY_CURRENCY, SECURITY_CURRENCY, SECURITY_ORGANISATION_CODE, custodian_type_code,
		SECURITY_CUSTODIAN_VALUE, SECURITY_MATURITY_DATE, SECURITY_PERFECTION_DATE, LEGAL_ENFORCEABILITY_IND, LEGAL_ENFORCEABILITY_DATE,
		SECURITY_REF_NOTE, EXCHANGE_CONTROL_OBTAINED, SOURCE_ID, 'Y' 
	from MIG_AB102
	where valid_ind = 'Y');

	-------------------------------------
	-- insert into cms_stage_secucrity table
	-------------------------------------	
	insert into cms_stage_security
	(cms_collateral_id, sci_security_dtl_id, security_sub_type_id, sci_security_subtype_value,subtype_name, type_name, 
	security_location, sci_security_currency, sci_orig_security_currency, security_organisation, custodian_type, 
	security_custodian,	security_maturity_date, security_perfection_date, is_legal_enforce, is_legal_enforce_date, 
	sci_reference_note, EXCHANGE_CONTROL_OBTAINED, source_id)
	(select CMS_COLLATERAL_STG_ID,
		SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SECURITY_SUB_TYPE_ID, SECURITY_SUB_TYPE_ID, 
		substr(SECURITY_SUB_TYPE, 9, length(security_sub_type)), substr(SECURITY_TYPE, 6, length(SECURITY_TYPE)),
		SECURITY_LOCATION, SECURITY_CURRENCY, SECURITY_CURRENCY, SECURITY_ORGANISATION_CODE, custodian_type_code,
		SECURITY_CUSTODIAN_VALUE, SECURITY_MATURITY_DATE, SECURITY_PERFECTION_DATE, LEGAL_ENFORCEABILITY_IND, LEGAL_ENFORCEABILITY_DATE,
		SECURITY_REF_NOTE, EXCHANGE_CONTROL_OBTAINED, SOURCE_ID
	from MIG_AB102
	where valid_ind = 'Y');
	
	-----------------------------------------------
	-- insert into cms_secucrity_source table
	-----------------------------------------------
	insert into cms_security_source 
	(cms_security_source_id, cms_collateral_id, source_security_id, source_id, status)
	(SELECT CMS_COLLATERAL_ID, CMS_COLLATERAL_ID, SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SOURCE_ID, 'ACTIVE' 
	FROM MIG_AB102
	where valid_ind = 'Y');
	
	-----------------------------
	-- insert into cms_asset
	-----------------------------
	insert into cms_asset
	(cms_collateral_id, phy_inspection_done, phy_inspection_freq, last_phy_inspect_date, next_phy_inspect_date, 
	env_risky_status, env_risky_date, env_risky_remark, asset_description, phy_inspection_freq_unit, 
	type_of_asset, good_status, purchase_price, purchase_date,
	repossession_date, model_no, chassis_number, scrap_value, manufacture_year, reg_card_no,
	engine_number, brand, sales_proceed, yard, prev_owner_name, prev_financier_name, transmission_type, energy_source,
	horse_power, vehicle_color, reg_no, reg_fee, reg_date)
	(SELECT CMS_COLLATERAL_ID, PHYSICAL_INSPECTION_IND, PHYSICAL_INSPECTION_FREQ_UNIT, 
	LAST_PHYSICAL_INSPECTION_DATE, NEXT_PHYSICAL_INSPECTION_DATE, 
	SEC_ENVIRONMENTAL_RISKY_IND, DATE_SEC_CONFIRM_ENV_RISKY, REMARKS_SEC_ENV_RISKY, ASSET_DESC, PHYSICAL_INSPECTION_FREQ_UOM,
	VEHICLE_TYPE, GOODS_STATUS, PURCHASE_PRICE, PURCHASE_DATE, date(REPOSSESSION_DATE), 
	MODEL_NO, CHASSIS_NUMBER, SCRAP_VALUE, YEAR_OF_MANUFACTURE, REGISTRATION_CARD_NO,
	ENGINE_NO, BRAND, SALES_PROCEED, YARD, PREVIOUS_OWNER_NAME, PREVIOUS_FINANCIER_NAME, TRANSMISSION_TYPE, ENERGY_SOURCE,
	char(HORSE_POWER), COLOR, REGISTRATION_NO, REGISTRATION_FEE, REGISTRATION_DATE
	FROM MIG_AB102
	where valid_ind = 'Y');
	
	-----------------------------
	-- insert into cms_stage_asset
	-----------------------------	
	insert into cms_stage_asset
	(cms_collateral_id, phy_inspection_done, phy_inspection_freq, last_phy_inspect_date, next_phy_inspect_date, 
	env_risky_status, env_risky_date, env_risky_remark, asset_description, phy_inspection_freq_unit, 
	type_of_asset, good_status, purchase_price, purchase_date,
	repossession_date, model_no, chassis_number, scrap_value, manufacture_year, reg_card_no,
	engine_number, brand, sales_proceed, yard, prev_owner_name, prev_financier_name, transmission_type, energy_source,
	horse_power, vehicle_color, reg_no, reg_fee, reg_date)
	(SELECT CMS_COLLATERAL_STG_ID, PHYSICAL_INSPECTION_IND, PHYSICAL_INSPECTION_FREQ_UNIT, 
	LAST_PHYSICAL_INSPECTION_DATE, NEXT_PHYSICAL_INSPECTION_DATE, 
	SEC_ENVIRONMENTAL_RISKY_IND, DATE_SEC_CONFIRM_ENV_RISKY, REMARKS_SEC_ENV_RISKY, ASSET_DESC, PHYSICAL_INSPECTION_FREQ_UOM,
	VEHICLE_TYPE, GOODS_STATUS, PURCHASE_PRICE, PURCHASE_DATE, date(REPOSSESSION_DATE), 
	MODEL_NO, CHASSIS_NUMBER, SCRAP_VALUE, YEAR_OF_MANUFACTURE, REGISTRATION_CARD_NO,
	ENGINE_NO, BRAND, SALES_PROCEED, YARD, PREVIOUS_OWNER_NAME, PREVIOUS_FINANCIER_NAME, TRANSMISSION_TYPE, ENERGY_SOURCE,
	char(HORSE_POWER), COLOR, REGISTRATION_NO, REGISTRATION_FEE, REGISTRATION_DATE
	FROM MIG_AB102
	where valid_ind = 'Y');	


	CALL "MIG_LOG_PROC_TIME"('MIG_RUN_AB102', 'MIG', 0);

	
END
@

