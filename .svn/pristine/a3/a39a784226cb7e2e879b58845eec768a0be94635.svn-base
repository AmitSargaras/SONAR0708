-- DROP PROCEDURE COLLATERAL_PERFECTOR_INITIALIZE
-- @
-- DROP PROCEDURE COLLATERAL_PERFECTOR_COMMON
-- @
-- DROP PROCEDURE COLLATERAL_PERFECTOR_CHARGES
-- @
-- DROP PROCEDURE COLLATERAL_PERFECTOR_ASSET
-- @
-- DROP PROCEDURE COLLATERAL_PERFECTOR_CASH
-- @
-- DROP PROCEDURE COLLATERAL_PERFECTOR_DOCUMENT
-- @
-- DROP PROCEDURE COLLATERAL_PERFECTOR_GUARANTEE
-- @
-- DROP PROCEDURE COLLATERAL_PERFECTOR_INSURANCE
-- @
-- DROP PROCEDURE COLLATERAL_PERFECTOR_MARKETABLE
-- @
-- DROP PROCEDURE COLLATERAL_PERFECTOR_OTHERS
-- @
-- DROP PROCEDURE COLLATERAL_PERFECTOR_PROPERTY
-- @
-- DROP PROCEDURE COLLATERAL_PERFECTOR
-- @

CREATE PROCEDURE COLLATERAL_PERFECTOR_INITIALIZE(IN p_is_for_all CHARACTER, IN p_security_type VARCHAR(2))
	LANGUAGE SQL
BEGIN
	---------------------------------------
	-- Initialize 
	-- set is_security_perfected = 'Y'
	-- Later on, to set to 'N' for 'Y' one
	---------------------------------------
	
	DECLARE v_curr_schema VARCHAR(20);
	SET v_curr_schema = (VALUES CURRENT SCHEMA);
	
	CALL SYSPROC.ADMIN_CMD('RUNSTATS ON TABLE ' || RTRIM(v_curr_schema) || '.' 
							|| ' CMS_SECURITY ON ALL COLUMNS WITH DISTRIBUTION AND DETAILED INDEXES ALL');	
							
	LOCK TABLE cms_security IN SHARE MODE;
	UPDATE cms_security SET is_security_perfected = 'Y'
	 WHERE source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND ((p_is_for_all = 'N' AND sci_security_type_value = p_security_type) 
	   		OR p_is_for_all = 'Y');
	COMMIT;
END
@

CREATE PROCEDURE COLLATERAL_PERFECTOR_COMMON(IN p_is_for_all CHARACTER, IN p_security_type VARCHAR(2))
	LANGUAGE SQL
BEGIN
	------------------------------------------
	-- Checking for 
	--		sci_security_currency
	--		security_location
	--		security_organisation
	--		security_perfection_date
	--		is_legal_enforce
	--
	-- Call
	-- COLLATERAL_PERFECTOR_INITIALIZE
	-- first, before this
	------------------------------------------
	--CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_COMMON', 'CP', 1);

	LOCK TABLE cms_security IN SHARE MODE;  
	UPDATE cms_security SET is_security_perfected = 'N'
	 WHERE source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND ((sci_security_currency = '' OR sci_security_currency IS NULL)
	   		OR (security_location = '' OR security_location IS NULL)
	   		OR (security_organisation = '' OR security_organisation IS NULL)
	   		OR (security_perfection_date IS NULL)
	   		OR ((is_legal_enforce = '' OR is_legal_enforce IS NULL)
	   		 	OR (is_legal_enforce = 'Y' AND is_legal_enforce_date IS NULL)))
	   AND is_security_perfected = 'Y'
	   AND ((p_is_for_all = 'N' AND sci_security_type_value = p_security_type) 
	   		OR p_is_for_all = 'Y');
	   		
	--CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_COMMON', 'CP', 0);   		
	COMMIT;
END
@

CREATE PROCEDURE COLLATERAL_PERFECTOR_CHARGES(IN p_is_for_all CHARACTER, IN p_security_type VARCHAR(2))
	LANGUAGE SQL
BEGIN
	------------------------------------------
	-- Checking for 
	--		1st charge
	--			charge_type
	--			legal_charge_date
	--			charge_amount
	--		other than 1st charge
	--			prior_chargee
	--			prior_charge_type
	--			prior_charge_amount
	--
	-- Call
	-- COLLATERAL_PERFECTOR_INITIALIZE
	-- first, before this
	------------------------------------------
	--CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_CHARGES', 'CP', 1);

	LOCK TABLE cms_security IN SHARE MODE;  
	UPDATE cms_security a SET is_security_perfected = 'N'
	 WHERE source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND NOT EXISTS (SELECT 1 FROM cms_charge_detail
	   					WHERE a.cms_collateral_id = cms_collateral_id
	   					  AND status <> 'DELETED')
	   AND is_security_perfected = 'Y'
	   AND ((p_is_for_all = 'N' AND sci_security_type_value = p_security_type) 
	   		OR p_is_for_all = 'Y');

  --CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_CHARGES', 'CP', 2);
	COMMIT;
	
	LOCK TABLE cms_security IN SHARE MODE;  
	UPDATE cms_security a SET is_security_perfected = 'N'
	 WHERE source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND EXISTS(SELECT 1 FROM cms_charge_detail
	   		 		WHERE a.cms_collateral_id = cms_collateral_id
	   		   		  AND status <> 'DELETED'
	   		   		  AND (security_rank = 1
	   		   		  	   AND ((charge_type = '' OR charge_type IS NULL)
			 	   		   		OR (legal_charge_date IS NULL)
			 	   		   		OR (charge_amount <= 0))))
	   AND is_security_perfected = 'Y'
	   AND ((p_is_for_all = 'N' AND sci_security_type_value = p_security_type) 
	   		OR p_is_for_all = 'Y');
	
 -- CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_CHARGES', 'CP', 3);
  COMMIT;
	
	LOCK TABLE cms_security IN SHARE MODE;  
	UPDATE cms_security a SET is_security_perfected = 'N'
	 WHERE source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND EXISTS (SELECT 1 FROM cms_charge_detail
	   		 		WHERE a.cms_collateral_id = cms_collateral_id
	   		   		  AND status <> 'DELETED'
	   		   		  AND (security_rank > 1
			   			   AND ((prior_chargee = '' OR prior_chargee IS NULL)
			   		 			OR (prior_charge_type = '' OR prior_charge_type IS NULL)
			   		 			OR prior_charge_amount <= 0)))
	   AND is_security_perfected = 'Y'
	   AND ((p_is_for_all = 'N' AND sci_security_type_value = p_security_type) 
	   		OR p_is_for_all = 'Y');
	   		
	--CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_CHARGES', 'CP', 0);
END
@

/* Security Perfection - Asset Based */
CREATE PROCEDURE COLLATERAL_PERFECTOR_ASSET(IN is_include_common CHARACTER)
	LANGUAGE SQL
BEGIN
	-------------------------------------------------------
	-- Checking for 
	--		AB100, AB101, AB102, AB106, AB107, AB109, AB111
	--			security_maturity_date
	--
	-------------------------------------------------------
	--CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_ASSET', 'CP', 1);

	CALL COLLATERAL_PERFECTOR_INITIALIZE('N', 'AB');
	
	IF (is_include_common = 'Y') THEN
		CALL COLLATERAL_PERFECTOR_COMMON('N', 'AB');
		CALL COLLATERAL_PERFECTOR_CHARGES('N', 'AB');
	END IF;
	
	LOCK TABLE cms_security IN SHARE MODE;
	UPDATE cms_security SET is_security_perfected = 'N'
	 WHERE is_security_perfected = 'Y'
	   AND source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND security_sub_type_id IN ('AB100', 'AB101', 'AB102', 'AB106', 'AB107', 'AB109', 'AB111')
	   AND security_maturity_date IS NULL;

  --CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_ASSET', 'CP', 0);
END
@
	
/* Security Perfection - Deposit (Cash) */	
CREATE PROCEDURE COLLATERAL_PERFECTOR_CASH(IN is_include_common CHARACTER)
	LANGUAGE SQL
BEGIN
	--------------------------------------
	-- Checking for 
	--		CS200
	--			deposit_amount
	--		CS202, CS203
	--			deposit_amount
	--			deposit_maturity_date
	--			deposit_reference_number
	--
	--------------------------------------
	--CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_CASH', 'CP', 1);

	CALL COLLATERAL_PERFECTOR_INITIALIZE('N', 'CS');
	
	IF (is_include_common = 'Y') THEN
		CALL COLLATERAL_PERFECTOR_COMMON('N', 'CS');
		CALL COLLATERAL_PERFECTOR_CHARGES('N', 'CS');
	END IF;
	
	LOCK TABLE cms_security IN SHARE MODE;
	UPDATE cms_security a SET is_security_perfected = 'N'
	 WHERE is_security_perfected = 'Y'
	   AND source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND NOT EXISTS (SELECT '1' FROM cms_cash_deposit
	   					WHERE cms_collateral_id = a.cms_collateral_id
	   					  AND status = 'ACTIVE');
	
  --CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_CASH', 'CP', 2);
  COMMIT;
	
	LOCK TABLE cms_security IN SHARE MODE;
	UPDATE cms_security a SET is_security_perfected = 'N'
	 WHERE is_security_perfected = 'Y'
	   AND source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND security_sub_type_id = 'CS200'
	   AND EXISTS (SELECT '1' FROM cms_cash_deposit
	   				WHERE cms_collateral_id = a.cms_collateral_id
	   				  AND status <> 'DELETED'
	   				  AND deposit_amount <= 0);
	
  --CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_CASH', 'CP', 3);
  COMMIT;

	LOCK TABLE cms_security IN SHARE MODE;
	UPDATE cms_security a SET is_security_perfected = 'N'
	 WHERE is_security_perfected = 'Y'
	   AND source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND security_sub_type_id IN ('CS202', 'CS203')
	   AND EXISTS (SELECT '1' FROM cms_cash_deposit
	   				WHERE cms_collateral_id = a.cms_collateral_id
	   				  AND status <> 'DELETED'
	   				  AND (deposit_amount <= 0
	   				  	   OR deposit_maturity_date IS NULL
	   				  	   OR (deposit_reference_number = '' OR deposit_reference_number IS NULL)));

  --CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_CASH', 'CP', 0);
END
@

/* Security Perfection - Documentation */
CREATE PROCEDURE COLLATERAL_PERFECTOR_DOCUMENT(IN is_include_common CHARACTER)
	LANGUAGE SQL
BEGIN
	--------------------------------------
	-- Checking for 
	--		security_maturity_date
	--
	--------------------------------------
	--CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_DOCUMENT', 'CP', 1);

	CALL COLLATERAL_PERFECTOR_INITIALIZE('N', 'DC');
	
	IF (is_include_common = 'Y') THEN
		CALL COLLATERAL_PERFECTOR_COMMON('N', 'DC');
		CALL COLLATERAL_PERFECTOR_CHARGES('N', 'DC');
	END IF;
		
	LOCK TABLE cms_security IN SHARE MODE;
	UPDATE cms_security SET is_security_perfected = 'N'
	 WHERE is_security_perfected = 'Y'
	   AND source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND security_sub_type_id IN ('DC300','DC301','DC302','DC303','DC304','DC305','DC306','DC307','DC308','DC309')
	   AND security_maturity_date IS NULL;

  --CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_DOCUMENT', 'CP', 0);
END
@

/* Security Perfection - Guarantee */
CREATE PROCEDURE COLLATERAL_PERFECTOR_GUARANTEE(IN is_include_common CHARACTER)
	LANGUAGE SQL
BEGIN
	--------------------------------------
	-- Checking for 
	--		security_maturity_date
	--
	--------------------------------------
	--CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_GUARANTEE', 'CP', 1);

	CALL COLLATERAL_PERFECTOR_INITIALIZE('N', 'GT');
	
	IF (is_include_common = 'Y') THEN
		CALL COLLATERAL_PERFECTOR_COMMON('N', 'GT');
		CALL COLLATERAL_PERFECTOR_CHARGES('N', 'GT');
	END IF;	
		
	LOCK TABLE cms_security IN SHARE MODE;
	UPDATE cms_security SET is_security_perfected = 'N'
	 WHERE is_security_perfected = 'Y'
	   AND source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND security_sub_type_id IN ('GT400','GT402','GT404','GT405','GT406','GT407','GT408','GT409','GT410')
	   AND security_maturity_date IS NULL;

  --CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_GUARANTEE', 'CP', 0);
END
@

/* Security Perfection - Insurance Protection */
CREATE PROCEDURE COLLATERAL_PERFECTOR_INSURANCE(IN is_include_common CHARACTER)
	LANGUAGE SQL
BEGIN
	--------------------------------------
	-- Checking for 
	--		IN502
	--			security_maturity_date
	--		IN500, IN501
	-- 			security_maturity_date
	--			insured_amount
	--
	--------------------------------------
	--CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_INSURANCE', 'CP', 1);

	CALL COLLATERAL_PERFECTOR_INITIALIZE('N', 'IN');
	
	IF (is_include_common = 'Y') THEN
		CALL COLLATERAL_PERFECTOR_COMMON('N', 'IN');
		CALL COLLATERAL_PERFECTOR_CHARGES('N', 'IN');
	END IF;
	
	LOCK TABLE cms_security IN SHARE MODE;
	UPDATE cms_security a SET is_security_perfected = 'N'
	 WHERE is_security_perfected = 'Y'
	   AND source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND security_sub_type_id IN ('IN500','IN501')
	   AND (security_maturity_date IS NULL
	   		OR EXISTS (SELECT 1 FROM cms_insurance
	   					WHERE cms_collateral_id = a.cms_collateral_id
	   					  AND insured_amount <= 0));
	
  --CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_INSURANCE', 'CP', 2);   					  
	COMMIT;
	
	LOCK TABLE cms_security IN SHARE MODE;
	UPDATE cms_security a SET is_security_perfected = 'N'
	 WHERE is_security_perfected = 'Y'
	   AND source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND security_sub_type_id IN ('IN502')
	   AND security_maturity_date IS NULL;	

  --CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_INSURANCE', 'CP', 0);		
END
@

/* Security Perfection - Marketable Securities */
CREATE PROCEDURE COLLATERAL_PERFECTOR_MARKETABLE(IN is_include_common CHARACTER)
	LANGUAGE SQL
BEGIN
	--------------------------------------
	-- Checking for 
	--		no_of_units
	--		security_maturity_date
	--
	--------------------------------------
	--CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_MARKETABLE', 'CP', 1);

	CALL COLLATERAL_PERFECTOR_INITIALIZE('N', 'MS');
	
	IF (is_include_common = 'Y') THEN
		CALL COLLATERAL_PERFECTOR_COMMON('N', 'MS');
		CALL COLLATERAL_PERFECTOR_CHARGES('N', 'MS');
	END IF;
	
	LOCK TABLE cms_security IN SHARE MODE;
	UPDATE cms_security a SET is_security_perfected = 'N'
	 WHERE is_security_perfected = 'Y'
	   AND source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND NOT EXISTS (SELECT '1' FROM cms_portfolio_item
	   					WHERE cms_collateral_id = a.cms_collateral_id
	   					  AND status <> 'DELETED');
	
  --CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_MARKETABLE', 'CP', 2);
  COMMIT;
	
	LOCK TABLE cms_security IN SHARE MODE;
	UPDATE cms_security a SET is_security_perfected = 'N'
	 WHERE is_security_perfected = 'Y'
	   AND source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND EXISTS (SELECT '1' FROM cms_portfolio_item
	   				WHERE cms_collateral_id = a.cms_collateral_id
	   				  AND status <> 'DELETED'
	   				  AND no_of_units <= 0
	   				  AND security_maturity_date IS NULL);

  --CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_MARKETABLE', 'CP', 0);
END
@

/* Security Perfection - Others */
CREATE PROCEDURE COLLATERAL_PERFECTOR_OTHERS(IN is_include_common CHARACTER)
	LANGUAGE SQL
BEGIN
	--------------------------------------
	-- Checking for 
	--		security_maturity_date
	--
	--------------------------------------
	--CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_OTHERS', 'CP', 1);

	CALL COLLATERAL_PERFECTOR_INITIALIZE('N', 'OT');
	
	IF (is_include_common = 'Y') THEN
		CALL COLLATERAL_PERFECTOR_COMMON('N', 'OT');
		CALL COLLATERAL_PERFECTOR_CHARGES('N', 'OT');
	END IF;

	LOCK TABLE cms_security IN SHARE MODE;
	UPDATE cms_security SET is_security_perfected = 'N'
	 WHERE is_security_perfected = 'Y'
	   AND source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND security_sub_type_id = 'OT900'
	   AND security_maturity_date IS NULL;

  --CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_OTHERS', 'CP', 0);
END
@

/* Security Perfection - Property */
CREATE PROCEDURE COLLATERAL_PERFECTOR_PROPERTY(IN is_include_common CHARACTER)
	LANGUAGE SQL
BEGIN
	--------------------------------------
	-- Checking for 
	--		title_type
	--		title_number
	--		security_maturity_date
	--
	--------------------------------------
	--CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_PROPERTY', 'CP', 1);

	CALL COLLATERAL_PERFECTOR_INITIALIZE('N', 'PT');
	
	IF (is_include_common = 'Y') THEN
		CALL COLLATERAL_PERFECTOR_COMMON('N', 'PT');
		CALL COLLATERAL_PERFECTOR_CHARGES('N', 'PT');
	END IF;

	LOCK TABLE cms_security IN SHARE MODE;
	UPDATE cms_security a SET is_security_perfected = 'N'
	 WHERE is_security_perfected = 'Y'
	   AND source_id <> 'CLMS'
	   AND status <> 'DELETED'
	   AND security_sub_type_id IN ('PT701','PT702','PT703','PT704','PT706','PT707','PT709','PT710')
	   AND (EXISTS (SELECT 1 FROM cms_property
	   				WHERE cms_collateral_id = a.cms_collateral_id
	   				  AND ((title_type = '' OR title_type IS NULL)
	   					   OR (title_number = '' OR title_number IS NULL)))
	   		OR (security_maturity_date IS NULL
	   			AND EXISTS (SELECT 1 FROM cms_property
	   					 	 WHERE cms_collateral_id = a.cms_collateral_id
	   					   	   AND tenure >= 0)));

  --CALL SI_LOG_PROC_TIME('COLLATERAL_PERFECTOR_PROPERTY', 'CP', 0);
END
@

CREATE PROCEDURE COLLATERAL_PERFECTOR
	LANGUAGE SQL
BEGIN
   	
	CALL COLLATERAL_PERFECTOR_INITIALIZE('Y', '');
	CALL COLLATERAL_PERFECTOR_COMMON('Y', '');
	CALL COLLATERAL_PERFECTOR_CHARGES('Y', '');
	CALL COLLATERAL_PERFECTOR_ASSET('N');
	CALL COLLATERAL_PERFECTOR_CASH('N');
	CALL COLLATERAL_PERFECTOR_DOCUMENT('N');
	CALL COLLATERAL_PERFECTOR_GUARANTEE('N');
	CALL COLLATERAL_PERFECTOR_INSURANCE('N');
	CALL COLLATERAL_PERFECTOR_MARKETABLE('N');
	CALL COLLATERAL_PERFECTOR_OTHERS('N');
	CALL COLLATERAL_PERFECTOR_PROPERTY('N');

END
@
