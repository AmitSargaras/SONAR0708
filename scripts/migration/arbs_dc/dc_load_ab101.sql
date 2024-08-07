drop procedure DC_RUN_AB101
@

CREATE PROCEDURE DC_RUN_AB101
	LANGUAGE SQL
BEGIN
	CALL "DC_LOG_PROC_TIME"('DC_RUN_AB101', 'DC', 1);			

	-------------------------------------
	-- insert into cms_secucrity table
	-------------------------------------
	update cms_security a set 
	(a.security_maturity_date, security_perfection_date, is_legal_enforce, is_legal_enforce_date) =
	(select b.SECURITY_MATURITY_DATE, b.SECURITY_PERFECTION_DATE, b.LEGAL_ENFORCEABILITY_IND, LEGAL_ENFORCEABILITY_DATE
	from dc_ab101 b, cms_security c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_ab101 where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and source_id = 'ARBS' and valid_ind = 'Y');

	update cms_stage_security a set 
	(a.security_maturity_date, security_perfection_date, is_legal_enforce, is_legal_enforce_date) =
	(select b.SECURITY_MATURITY_DATE, b.SECURITY_PERFECTION_DATE, b.LEGAL_ENFORCEABILITY_IND, LEGAL_ENFORCEABILITY_DATE
	from dc_ab101 b, cms_security c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_ab101 where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and source_id = 'ARBS' and valid_ind = 'Y');
	
	update cms_asset a set
	(a.EQUIP_MF, a.EQUIP_RISK_GRADING, a.EQUIP_CODE) =
	(Select b.EQUIPMENT_MF, b.EQUIPMENT_RISK_GRADING, b.EQUIPMENT_CODE 
	from dc_AB101 b, cms_asset c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_ab101 where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and valid_ind = 'Y');

	update cms_stage_asset a set
	(a.EQUIP_MF, a.EQUIP_RISK_GRADING, a.EQUIP_CODE) =
	(Select b.EQUIPMENT_MF, b.EQUIPMENT_RISK_GRADING, b.EQUIPMENT_CODE 
	from dc_AB101 b, cms_asset c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_ab101 where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and valid_ind = 'Y');
	
	update cms_valuation a set
	(CMV, VALUATION_DATE, VALUATION_TYPE, OLV, REMAINING_USEFUL_LIFE, CMS_COLLATERAL_ID, 
	VALUATION_CURRENCY) = 
	(select b.CURRENT_MARKET_VALUE, b.VALUATION_DATE, b.VALUATION_TYPE, b.OLV, b.REMAINING_USEFUL_LIFE, b.CMS_COLLATERAL_ID, 
	'MYR'
	from dc_AB101 b, cms_valuation c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_AB101 d where 
	CMS_COLLATERAL_ID = d.CMS_COLLATERAL_ID 
	and d.valid_ind = 'Y');
	
	update cms_stage_valuation a set
	(CMV, VALUATION_DATE, VALUATION_TYPE, OLV, REMAINING_USEFUL_LIFE, CMS_COLLATERAL_ID, 
	VALUATION_CURRENCY) = 
	(select b.CURRENT_MARKET_VALUE, b.VALUATION_DATE, b.VALUATION_TYPE, b.OLV, b.REMAINING_USEFUL_LIFE, b.CMS_COLLATERAL_ID, 
	'MYR'
	from dc_AB101 b, cms_valuation c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_AB101 d where 
	CMS_COLLATERAL_ID = d.CMS_COLLATERAL_ID 
	and d.valid_ind = 'Y');
	
	CALL "DC_LOG_PROC_TIME"('DC_RUN_AB101', 'DC', 0);	
END
@
