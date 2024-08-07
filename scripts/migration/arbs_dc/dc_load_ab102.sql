drop procedure DC_RUN_ab102
@

CREATE PROCEDURE DC_RUN_ab102
	LANGUAGE SQL
BEGIN
	CALL "DC_LOG_PROC_TIME"('DC_RUN_ab102', 'DC', 1);			

	---------------------------------------------------------
	-- updating corresponding value in asset table
	----------------------------------------------------------
	update cms_asset a set
	(a.BRAND) =
	(Select b.BRAND
	from dc_ab102 b, cms_asset c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_ab102 where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and valid_ind = 'Y');
	
	update cms_stage_asset a set
	(a.BRAND) =
	(Select b.BRAND
	from dc_ab102 b, cms_stage_asset c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_ab102 where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and valid_ind = 'Y');
	
	update cms_valuation a set
	(CMV, VALUATION_DATE, VALUATION_TYPE, CMS_COLLATERAL_ID, 
	VALUATION_CURRENCY) = 
	(select b.CURRENT_MARKET_VALUE, b.VALUATION_DATE, b.VALUATION_TYPE, b.CMS_COLLATERAL_ID, 
	'MYR'
	from dc_ab102 b, cms_valuation c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_ab102 d where 
	CMS_COLLATERAL_ID = d.CMS_COLLATERAL_ID 
	and d.valid_ind = 'Y');
	
	update cms_stage_valuation a set
	(CMV, VALUATION_DATE, VALUATION_TYPE, CMS_COLLATERAL_ID, 
	VALUATION_CURRENCY) = 
	(select b.CURRENT_MARKET_VALUE, b.VALUATION_DATE, b.VALUATION_TYPE, b.CMS_COLLATERAL_ID, 
	'MYR'
	from dc_ab102 b, cms_stage_valuation c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_ab102 d where 
	CMS_COLLATERAL_ID = d.CMS_COLLATERAL_ID 
	and d.valid_ind = 'Y');
	
	CALL "DC_LOG_PROC_TIME"('DC_RUN_ab102', 'DC', 0);	
END
@
