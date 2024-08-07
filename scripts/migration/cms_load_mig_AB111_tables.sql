drop procedure MIG_RUN_AB111
@

CREATE PROCEDURE MIG_RUN_AB111
	LANGUAGE SQL
BEGIN
	CALL "MIG_LOG_PROC_TIME"('MIG_RUN_AB111', 'MIG', 1);			

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
	from MIG_AB111
	where valid_ind = 'Y');
	
	-------------------------------------
	-- insert into cms_stage_secucrity table
	-------------------------------------	
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
	from MIG_AB111
	where valid_ind = 'Y');	
	
	-----------------------------------------------
	-- insert into cms_secucrity_source table
	-----------------------------------------------
	insert into cms_security_source 
	(cms_security_source_id, cms_collateral_id, source_security_id, source_id, status)
	(SELECT CMS_COLLATERAL_ID, CMS_COLLATERAL_ID, SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SOURCE_ID, 'ACTIVE' 
	FROM MIG_AB111
	where valid_ind = 'Y');
	
	-----------------------------
	-- insert into cms_asset
	-----------------------------
	insert into cms_asset
	(cms_collateral_id, phy_inspection_done, phy_inspection_freq, last_phy_inspect_date, next_phy_inspect_date, 
	env_risky_status, env_risky_date, env_risky_remark, asset_description, phy_inspection_freq_unit,
	type_of_asset, build_year, purchase_price, purchase_date, insurers, vessel_name, vessel_state, expt_occup_date,
	expt_occup, occup_type, builder, main_reg, length, width, depth, deck_loading, deck_weight, side_board,
	bow, deck, deck_thickness, bottom, winch_drive, bhp, speed, anchor, anchor_drive, class_society, construct_country,
	construct_place, vessel_use, charter_contract, charterer_name, charter_period, charter_period_unit, charter_amt, charter_currency,
	charter_rate_unit, charter_rate_unit_oth, charter_remarks)
	(SELECT CMS_COLLATERAL_ID, PHYSICAL_INSPECTION_IND, PHYSICAL_INSPECTION_FREQ_UNIT, 
	LAST_PHYSICAL_INSPECTION_DATE, NEXT_PHYSICAL_INSPECTION_DATE, 
	SEC_ENVIRONMENTAL_RISKY_IND, DATE_SEC_CONFIRM_ENV_RISKY, REMARKS_SEC_ENV_RISKY, ASSET_DESC, PHYSICAL_INSPECTION_FREQ_UOM, 
	ASSET_TYPE, BUILT_YEAR, PURCHASE_PRICE, PURCHASE_DATE, INSURER, VESSEL_NAME, VESSEL_STATE, EXPECTED_OCCUPANCY_DATE,
	EXPECTED_OCCUPANCY, OCCUPANCY_TYPE, BUILDER, MAIN_REGISTRATION, LENGTH, WIDTH, DEPTH, DECK_LOADING, DECK_WEIGHT, SIDE_BOARD,
	BOW, DECK, DECK_THICKNESS, BOTTOM, WINCH_DRIVE, BHP, SPEED, ANCHOR, ANCHOR_DRIVE, CLASS_SOCIETY, CONSTRUCTION_COUNTRY,
	CONSTRUCTION_PLACE, VESSEL_USE, CHARTER_CONTRACT, CHARTERER_NAME, CHARTER_PERIOD, CHARTER_PERIOD_UOM, CHARTER_AMT, CHARTER_CCY,
	CHARTER_RATE, CHARTER_RATE_OTHERS, CHARTER_REMARKS
	FROM MIG_AB111
	where valid_ind = 'Y');
	
	-----------------------------
	-- insert into cms_stage_asset
	-----------------------------	
	insert into cms_stage_asset
	(cms_collateral_id, phy_inspection_done, phy_inspection_freq, last_phy_inspect_date, next_phy_inspect_date, 
	env_risky_status, env_risky_date, env_risky_remark, asset_description, phy_inspection_freq_unit,
	type_of_asset, build_year, purchase_price, purchase_date, insurers, vessel_name, vessel_state, expt_occup_date,
	expt_occup, occup_type, builder, main_reg, length, width, depth, deck_loading, deck_weight, side_board,
	bow, deck, deck_thickness, bottom, winch_drive, bhp, speed, anchor, anchor_drive, class_society, construct_country,
	construct_place, vessel_use, charter_contract, charterer_name, charter_period, charter_period_unit, charter_amt, charter_currency,
	charter_rate_unit, charter_rate_unit_oth, charter_remarks)
	(SELECT CMS_COLLATERAL_STG_ID, PHYSICAL_INSPECTION_IND, PHYSICAL_INSPECTION_FREQ_UNIT, 
	LAST_PHYSICAL_INSPECTION_DATE, NEXT_PHYSICAL_INSPECTION_DATE, 
	SEC_ENVIRONMENTAL_RISKY_IND, DATE_SEC_CONFIRM_ENV_RISKY, REMARKS_SEC_ENV_RISKY, ASSET_DESC, PHYSICAL_INSPECTION_FREQ_UOM, 
	ASSET_TYPE, BUILT_YEAR, PURCHASE_PRICE, PURCHASE_DATE, INSURER, VESSEL_NAME, VESSEL_STATE, EXPECTED_OCCUPANCY_DATE,
	EXPECTED_OCCUPANCY, OCCUPANCY_TYPE, BUILDER, MAIN_REGISTRATION, LENGTH, WIDTH, DEPTH, DECK_LOADING, DECK_WEIGHT, SIDE_BOARD,
	BOW, DECK, DECK_THICKNESS, BOTTOM, WINCH_DRIVE, BHP, SPEED, ANCHOR, ANCHOR_DRIVE, CLASS_SOCIETY, CONSTRUCTION_COUNTRY,
	CONSTRUCTION_PLACE, VESSEL_USE, CHARTER_CONTRACT, CHARTERER_NAME, CHARTER_PERIOD, CHARTER_PERIOD_UOM, CHARTER_AMT, CHARTER_CCY,
	CHARTER_RATE, CHARTER_RATE_OTHERS, CHARTER_REMARKS
	FROM MIG_AB111
	where valid_ind = 'Y');	


	CALL "MIG_LOG_PROC_TIME"('MIG_RUN_AB111', 'MIG', 0);

	
END
@

