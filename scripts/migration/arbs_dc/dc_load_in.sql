drop procedure DC_RUN_IN
@

CREATE PROCEDURE DC_RUN_IN
	LANGUAGE SQL
BEGIN
	CALL "DC_LOG_PROC_TIME"('DC_RUN_IN', 'DC', 1);			

	-------------------------------------
	-- insert into cms_secucrity table
	-------------------------------------
	update cms_security a set 
	(a.security_maturity_date, a.security_perfection_date, a.is_legal_enforce, a.is_legal_enforce_date) = 
	(select b.SECURITY_MATURITY_DATE, b.SECURITY_PERFECTION_DATE, b.LEGAL_ENFORCEABILITY_IND, b.LEGAL_ENFORCEABILITY_DATE
	from dc_IN b, cms_security c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_IN where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and source_id = 'ARBS' and valid_ind = 'Y');

	update cms_stage_security a set 
	(a.security_maturity_date, a.security_perfection_date, a.is_legal_enforce, a.is_legal_enforce_date) = 
	(select b.SECURITY_MATURITY_DATE, b.SECURITY_PERFECTION_DATE, b.LEGAL_ENFORCEABILITY_IND, b.LEGAL_ENFORCEABILITY_DATE
	from dc_IN b, cms_stage_security c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_IN where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and source_id = 'ARBS' and valid_ind = 'Y');
	
	-----------------------------------
	-- update cms_insurance
	------------------------------------
	update cms_insurance a set
	(a.INSURER_NAME, a.INSURANCE_TYPE, a.INSURED_AMT_CURR, a.INSURED_AMOUNT,
	 a.EFFECTIVE_DATE, a.POLICY_NO ) =	
	(Select b.INSURER_NAME, b.INSURANCE_TYPE, INSURED_CURRENCY, INSURED_AMT, INSURANCE_EFFECTIVE_DATE, POLICY_NUMBER
	from dc_IN b, cms_insurance c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_IN where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and valid_ind = 'Y');
	
	update cms_stage_insurance a set
	(a.INSURER_NAME, a.INSURANCE_TYPE, a.INSURED_AMT_CURR, a.INSURED_AMOUNT,
	 a.EFFECTIVE_DATE, a.POLICY_NO ) =	
	(Select b.INSURER_NAME, b.INSURANCE_TYPE, INSURED_CURRENCY, INSURED_AMT, INSURANCE_EFFECTIVE_DATE, POLICY_NUMBER
	from dc_IN b, cms_stage_insurance c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_IN where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and valid_ind = 'Y');
	
	CALL "DC_LOG_PROC_TIME"('DC_RUN_IN', 'DC', 0);	
END
@
