drop procedure MIG_RUN_PT@

CREATE PROCEDURE MIG_RUN_PT
	LANGUAGE SQL
BEGIN
	CALL "MIG_LOG_PROC_TIME"('MIG_RUN_PT', 'MIG', 1);			

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
	from MIG_PT
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
	from MIG_PT
	where valid_ind = 'Y');	
	
	-----------------------------------------------
	-- insert into cms_secucrity_source table
	-----------------------------------------------
	insert into cms_security_source 
	(cms_security_source_id, cms_collateral_id, source_security_id, source_id, status)
	(SELECT CMS_COLLATERAL_ID, CMS_COLLATERAL_ID, SECURITY_SUB_TYPE_ID||'-'||SOURCE_SECURITY_ID, SOURCE_ID, 'ACTIVE' 
	FROM MIG_PT
	where valid_ind = 'Y');
	
	----------------------------------
	-- insert into cms_property
	----------------------------------
	insert into cms_property 
	(cms_collateral_id, env_risky_status, env_risky_date, is_phy_inspect,env_risky_remarks,
	 phy_inspect_freq,last_phy_inspect_date, next_phy_inspect_date, 
	 title_type, title_number,lot_no,lot_location,postcode,land_area,land_area_uom,tenure,tenure_unit,
	 restrict_condition, quit_rent_paid, description_asset, builtup_area, builtup_area_uom,
	 sale_purchase_value, phy_inspect_freq_unit, remarks_property, registered_holder, property_address,
	 quit_rent_receipt,
	 expressed_condition,mukim,district,state,real_estate_with_rental_flag,property_usage,property_completion_status,
	 developer_name,abandoned_project,
	 independent_valuer_flag,category_of_land_use,property_type,phase_no,
	 project_name, unit_parcel_no)
	(SELECT CMS_COLLATERAL_ID, SEC_ENVIRONMENTAL_RISKY_IND, DATE_SEC_CONFIRM_ENV_RISKY, PHYSICAL_INSPECTION_IND, REMARKS_SEC_ENV_RISKY,
	PHYSICAL_INSPECTION_FREQ_UNIT, LAST_PHYSICAL_INSPECTION_DATE, NEXT_PHYSICAL_INSPECTION_DATE,
	TITLE_TYPE, TITLE_NUMBER, LOT_NO, LOT_LOCATION, POSCODE, LAND_AREA, LAND_AREA_UOM, TENURE_VALUE,TENURE,
	RESTRICTION_CONDITION, QUIT_RENT_AMT_PAID, ASSET_DESC, BUILT_UP_AREA, BUILT_UP_AREA_UOM,
	SALES_PURCHASE_AGREEMENT_VALUE, PHYSICAL_INSPECTION_FREQ_UOM, REMARKS, REGISTERED_OWNER, PROPERTY_ADDRESS,
	QUIT_RENT_RECEIPT_IND,  
	EXPRESSED_CONDITION, MUKIM, DISTRICT, STATE, REAL_ESTATE_FEW_RENTAL_UNITS, PROPERTY_USAGE_TYPE, PROPERTY_COMPLETION_STATUS,
	DEVELOPER_NAME, ABANDONED_PROJECT_IND, 
	INDEPENDENT_VALUER_IND, CATEGOTY_OF_LAND_USE, PROPERTY_TYPE, PHASE_NUMBER,
	PROJECT_NAME, UNIT_PARCEL_NO
	FROM MIG_PT
	where valid_ind = 'Y');
	
	----------------------------------
	-- insert into cms_stage_property
	----------------------------------
	insert into cms_stage_property 
	(cms_collateral_id, env_risky_status, env_risky_date, is_phy_inspect,env_risky_remarks,phy_inspect_freq,last_phy_inspect_date,
	 next_phy_inspect_date, title_type, title_number,lot_no,lot_location,postcode,land_area,land_area_uom,tenure,tenure_unit,
	 restrict_condition, quit_rent_paid, description_asset, builtup_area, builtup_area_uom,
	 sale_purchase_value, phy_inspect_freq_unit, remarks_property, registered_holder, property_address,
	 quit_rent_receipt,
	 expressed_condition,mukim,district,state,real_estate_with_rental_flag,property_usage,property_completion_status,
	 developer_name,abandoned_project,
	 independent_valuer_flag,category_of_land_use,property_type,phase_no,
	 project_name, unit_parcel_no)
	(SELECT CMS_COLLATERAL_STG_ID, SEC_ENVIRONMENTAL_RISKY_IND, DATE_SEC_CONFIRM_ENV_RISKY, PHYSICAL_INSPECTION_IND, REMARKS_SEC_ENV_RISKY,
	PHYSICAL_INSPECTION_FREQ_UNIT, LAST_PHYSICAL_INSPECTION_DATE, NEXT_PHYSICAL_INSPECTION_DATE,
	TITLE_TYPE, TITLE_NUMBER, LOT_NO, LOT_LOCATION, POSCODE, LAND_AREA, LAND_AREA_UOM, TENURE_VALUE,TENURE,
	RESTRICTION_CONDITION, QUIT_RENT_AMT_PAID, ASSET_DESC, BUILT_UP_AREA, BUILT_UP_AREA_UOM,
	SALES_PURCHASE_AGREEMENT_VALUE, PHYSICAL_INSPECTION_FREQ_UOM, REMARKS, REGISTERED_OWNER, PROPERTY_ADDRESS,
	QUIT_RENT_RECEIPT_IND,  
	EXPRESSED_CONDITION, MUKIM, DISTRICT, STATE, REAL_ESTATE_FEW_RENTAL_UNITS, PROPERTY_USAGE_TYPE, PROPERTY_COMPLETION_STATUS,
	DEVELOPER_NAME, ABANDONED_PROJECT_IND, 
	INDEPENDENT_VALUER_IND, CATEGOTY_OF_LAND_USE, PROPERTY_TYPE, PHASE_NUMBER,
	PROJECT_NAME, UNIT_PARCEL_NO
	FROM MIG_PT
	where valid_ind = 'Y');	
	

	CALL "MIG_LOG_PROC_TIME"('MIG_RUN_PT', 'MIG', 0);

	
END
@

