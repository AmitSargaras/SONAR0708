drop procedure DC_RUN_AB100
@

CREATE PROCEDURE DC_RUN_AB100
	LANGUAGE SQL
BEGIN
	CALL "DC_LOG_PROC_TIME"('DC_RUN_AB100', 'DC', 1);			

	-------------------------------------
	-- insert into cms_secucrity table
	-------------------------------------
	update cms_security a set 
	(a.security_maturity_date, security_perfection_date, is_legal_enforce, is_legal_enforce_date) = 
	(select b.SECURITY_MATURITY_DATE, b.SECURITY_PERFECTION_DATE, b.LEGAL_ENFORCEABILITY_IND, LEGAL_ENFORCEABILITY_DATE
	from dc_ab100 b, cms_security c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_ab100 where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and source_id = 'ARBS' and valid_ind = 'Y');
	
	update cms_valuation a set
	(CMV, VALUATION_DATE, VALUATION_TYPE, CMS_COLLATERAL_ID, 
	VALUATION_CURRENCY, SOURCE_TYPE) = 
	(select b.CURRENT_MARKET_VALUE, b.VALUATION_DATE, b.VALUATION_TYPE, b.CMS_COLLATERAL_ID, 
	'MYR', 'F'
	from dc_ab100 b, cms_valuation c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_ab100 d where 
	CMS_COLLATERAL_ID = d.CMS_COLLATERAL_ID 
	and d.valid_ind = 'Y');
	
	insert into cms_valuation
	(VALUATION_ID, CMV, VALUATION_DATE, VALUATION_TYPE, CMS_COLLATERAL_ID, 
	VALUATION_CURRENCY, SOURCE_TYPE)
	(select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR valuation_seq), 2)) as BIGINT), 
	b.CURRENT_MARKET_VALUE, b.VALUATION_DATE, b.VALUATION_TYPE, b.CMS_COLLATERAL_ID,
	'MYR', 'F'
	from dc_ab100 b where not exists (select '1' from dc_ab100 d where 
	CMS_COLLATERAL_ID = d.CMS_COLLATERAL_ID 
	and d.valid_ind = 'Y'));
	
	insert into cms_stage_valuation
	(VALUATION_ID, CMV, VALUATION_DATE, VALUATION_TYPE, CMS_COLLATERAL_ID, 
	VALUATION_CURRENCY, SOURCE_TYPE)
	(select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR valuation_seq), 2)) as BIGINT), 
	b.CURRENT_MARKET_VALUE, b.VALUATION_DATE, b.VALUATION_TYPE, b.CMS_COLLATERAL_ID,
	'MYR', 'F'
	from dc_ab100 b where not exists (select '1' from dc_ab100 d where 
	CMS_COLLATERAL_ID = d.CMS_COLLATERAL_ID 
	and d.valid_ind = 'Y'));
	
	CALL "DC_LOG_PROC_TIME"('DC_RUN_AB100', 'DC', 0);	
END
@
