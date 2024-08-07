drop procedure DC_RUN_GT
@

CREATE PROCEDURE DC_RUN_GT
	LANGUAGE SQL
BEGIN
	CALL "DC_LOG_PROC_TIME"('DC_RUN_GT', 'DC', 1);			

	-------------------------------------
	-- insert into cms_secucrity table
	-------------------------------------
	update cms_security a set 
	(a.security_maturity_date, sci_security_currency) = 
	(select b.SECURITY_MATURITY_DATE, b.SECURITY_CURRENCY
	from dc_GT b, cms_security c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_GT where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and source_id = 'ARBS' and valid_ind = 'Y');

	update cms_stage_security a set 
	(a.security_maturity_date, sci_security_currency) = 
	(select b.SECURITY_MATURITY_DATE, b.SECURITY_CURRENCY
	from dc_GT b, cms_security c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_GT where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and source_id = 'ARBS' and valid_ind = 'Y');
	
	-----------------------------------
	-- update cms_guarantee
	------------------------------------
	update cms_guarantee a set
	(a.GUARANTEE_DATE, a.reference_no, a.correspondence_bank, a.within_correspond_bank_limit,
	 a.claim_period, a.claim_period_time_unit, a.current_scheme) =	
	(Select b.GUARANTEE_DATE, b.GUARANTEE_REF_NUMBER, b.CORRESPONDENCE_BANK, b.WITHIN_CORRESPONDENCE_BANK_LMT,
	 b.CLAIM_PERIOD, b.CLAIM_PERIOD_TIME_UNIT, b.SCHEME
	from dc_gt b, cms_guarantee c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_gt where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and valid_ind = 'Y');

	update cms_stage_guarantee a set
	(a.GUARANTEE_DATE, a.reference_no, a.correspondence_bank, a.within_correspond_bank_limit,
	 a.claim_period, a.claim_period_time_unit, a.current_scheme) =	
	(Select b.GUARANTEE_DATE, b.GUARANTEE_REF_NUMBER, b.CORRESPONDENCE_BANK, b.WITHIN_CORRESPONDENCE_BANK_LMT,
	 b.CLAIM_PERIOD, b.CLAIM_PERIOD_TIME_UNIT, b.SCHEME
	from dc_gt b, cms_guarantee c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_gt where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and valid_ind = 'Y');
	
	-----------------------------------
	-- update cms_fee_details
	------------------------------------	
	update cms_fee_details a set
	(a.eff_date, a.exp_date, guarantee_fee, CGC_FEE, tenor, tenor_unit ) =	
	(Select date(EFFECTIVE_DATE), date(EXPIRATION_DATE), GUARANTEE_FEE_AMT, CGC_FEE_PAYMENT_ACCT,
	 b.TENOR, b.TENOR_UOM
	from dc_gt b, cms_fee_details c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_gt where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and valid_ind = 'Y');	
	
	update cms_stage_fee_details a set
	(a.eff_date, a.exp_date, guarantee_fee, CGC_FEE, tenor, tenor_unit ) =	
	(Select date(EFFECTIVE_DATE), date(EXPIRATION_DATE), GUARANTEE_FEE_AMT, CGC_FEE_PAYMENT_ACCT,
	 b.TENOR, b.TENOR_UOM
	from dc_gt b, cms_fee_details c where c.cms_collateral_id = b.cms_collateral_id)
	where exists (select '1' from dc_gt where 
	CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and valid_ind = 'Y');	
	
	CALL "DC_LOG_PROC_TIME"('DC_RUN_GT', 'DC', 0);	
END
@
