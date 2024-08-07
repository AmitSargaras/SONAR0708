drop procedure DC_RUN_PT
@

CREATE PROCEDURE DC_RUN_PT
	LANGUAGE SQL
BEGIN
	CALL "DC_LOG_PROC_TIME"('DC_RUN_PT', 'DC', 1);			

	----------------------------------
	-- update cms_property
	----------------------------------
	update cms_property a set
	(a.title_type, a.land_area, a.land_area_uom, a.builtup_area, a.builtup_area_uom,
	 a.state, a.district, a.mukim, a.property_completion_status, a.developer_name, a.project_name) = 
	(select b.TITLE_TYPE, b.LAND_AREA, b.LAND_AREA_UOM, b.BUILT_UP_AREA, b.BUILT_UP_AREA_UOM,
	b.STATE, b.DISTRICT, b.MUKIM, b.PROPERTY_COMPLETION_STATUS, b.DEVELOPER_NAME, b.PROJECT_NAME
	from dc_pt b, cms_property c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_pt d where 
	CMS_COLLATERAL_ID = d.CMS_COLLATERAL_ID 
	and d.valid_ind = 'Y');
	
	update cms_stage_property a set
	(a.title_type, a.land_area, a.land_area_uom, a.builtup_area, a.builtup_area_uom,
	 a.state, a.district, a.mukim, a.property_completion_status, a.developer_name, a.project_name) = 
	(select b.TITLE_TYPE, b.LAND_AREA, b.LAND_AREA_UOM, b.BUILT_UP_AREA, b.BUILT_UP_AREA_UOM,
	b.STATE, b.DISTRICT, b.MUKIM, b.PROPERTY_COMPLETION_STATUS, b.DEVELOPER_NAME, b.PROJECT_NAME
	from dc_pt b, cms_stage_property c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_pt d where 
	CMS_COLLATERAL_ID = d.CMS_COLLATERAL_ID 
	and d.valid_ind = 'Y');
	
	-----------------------------
	-- update cms_valuation
	------------------------------
	update cms_valuation a set
	(CMV, VALUATION_DATE, FSV, VALUATION_TYPE, CMS_COLLATERAL_ID, 
	VALUATION_CURRENCY) = 
	(select b.CURRENT_MARKET_VALUE, b.VALUATION_DATE, b.FSV, b.VALUATION_TYPE, b.CMS_COLLATERAL_ID, 
	'MYR'
	from dc_pt b, cms_valuation c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_pt d where 
	CMS_COLLATERAL_ID = d.CMS_COLLATERAL_ID 
	and d.valid_ind = 'Y');

	update cms_stage_valuation a set
	(CMV, VALUATION_DATE, FSV, VALUATION_TYPE, CMS_COLLATERAL_ID, 
	VALUATION_CURRENCY) = 
	(select b.CURRENT_MARKET_VALUE, b.VALUATION_DATE, b.FSV, b.VALUATION_TYPE, b.CMS_COLLATERAL_ID, 
	'MYR'
	from dc_pt b, cms_stage_valuation c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_pt d where 
	CMS_COLLATERAL_ID = d.CMS_COLLATERAL_ID 
	and d.valid_ind = 'Y');
	
	CALL "DC_LOG_PROC_TIME"('DC_RUN_PT', 'DC', 0);	
END
@
