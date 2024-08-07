drop procedure DC_RUN_MS
@

CREATE PROCEDURE DC_RUN_MS
	LANGUAGE SQL
BEGIN
	CALL "DC_LOG_PROC_TIME"('DC_RUN_MS', 'DC', 1);	
	
	-----------------------------------
	-- update cms_portfolio_item
	------------------------------------
	update cms_portfolio_item a set
	(a.issuer_name, a.bond_issue_date, a.stock_code, a.ISIN_CODE ) =	
	(Select b.INSURER_NAME, b.BOND_ISSUE_DATE, b.STOCK_CODE, b.ISIN_CODE)
	from dc_MS b, cms_guarantee c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_MS where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and valid_ind = 'Y');

	update cms_stage_portfolio_item a set
	(a.issuer_name, a.bond_issue_date, a.stock_code, a.ISIN_CODE ) =	
	(Select b.ISSUER_NAME, b.BOND_ISSUE_DATE, b.STOCK_CODE, b.ISIN_CODE
	from dc_MS b, cms_stage_portfolio_item c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_MS where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and valid_ind = 'Y');
	
	--MATURITY_DATE TIMESTAMP, --update
	--STOCK_NAME VARCHAR(40), -- update
	
	CALL "DC_LOG_PROC_TIME"('DC_RUN_MS', 'DC', 0);	
END
@
