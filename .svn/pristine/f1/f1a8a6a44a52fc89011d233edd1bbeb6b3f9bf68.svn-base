ALTER TABLE MIG_CO015_VL
ADD COLUMN IS_VALID_2 CHAR(1);

CALL ADMIN_CMD('REORG TABLE MIG_CO015_VL');

UPDATE MIG_CO015_VL set IS_VALID_2 = 'N';

UPDATE MIG_CO015_VL vl set IS_VALID_2 = 'Y'
WHERE EXISTS(select 1 from MIG_ERROR_LOG err where err.KEY1_VALUE = vl.SECURITY_ID and INTERFACE_ID = 'CO015' and ERROR_CODE = 'SNF001');

UPDATE MIG_CO015_VL
SET IS_VALID_2 = 'N'
WHERE SECURITY_ID IS NOT NULL
AND NOT EXISTS
	(select 1 from CMS_SECURITY s
	where s.sci_security_dtl_id = security_id
    AND IS_MIGRATED_IND = 'Y'
    fetch first row only)
AND IS_VALID_2 = 'Y';

INSERT INTO CMS_VALUATION (VALUATION_ID, CMS_COLLATERAL_ID, VALUER, VALUATION_DATE, VALUATION_CURRENCY, CMV, FSV, 
					  	   RESERVE_PRICE, RESERVE_PRICE_DATE, UPDATE_DATE, SOURCE_TYPE, SOURCE_ID)
(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR valuation_seq), 2)) as BIGINT),
			cms_collateral_id, valuer_code, valuation_date, valuation_currency, t.cmv, t.fsv, 
			t.reserve_price, t.reserve_price_date, CURRENT_TIMESTAMP, 'S', 'SIBS'
 FROM MIG_CO015_VL t, cms_security sec
 WHERE NOT EXISTS (SELECT 1 FROM cms_valuation
                    WHERE cms_collateral_id = sec.cms_collateral_id
                    and source_type = 'S'
                    AND (date(valuation_date) = date(t.valuation_date)
			    	or (valuation_date is null and cmv = t.cmv)) fetch first row only)
AND sec.sci_security_dtl_id = t.security_id
AND IS_VALID_2 = 'Y');

INSERT INTO CMS_STAGE_VALUATION (VALUATION_ID, CMS_COLLATERAL_ID, VALUER, VALUATION_DATE, VALUATION_CURRENCY, CMV, FSV, 
					  	   		 RESERVE_PRICE, RESERVE_PRICE_DATE, UPDATE_DATE, SOURCE_TYPE, SOURCE_ID)
(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR valuation_seq), 2)) as BIGINT),
		cms_collateral_id, valuer_code, valuation_date, valuation_currency, t.cmv, t.fsv, 
		t.reserve_price, t.reserve_price_date, CURRENT_TIMESTAMP, 'S', 'SIBS'
 FROM MIG_CO015_VL t, cms_stage_security sec, transaction trx
 WHERE NOT EXISTS (SELECT 1 FROM cms_stage_valuation v
                    WHERE v.cms_collateral_id = sec.cms_collateral_id --trx.staging_reference_id
                    and source_type = 'S'
			    	AND (date(v.valuation_date) = date(t.valuation_date)
			    	or (v.valuation_date is null and v.cmv = t.cmv)) fetch first row only)
 AND sec.sci_security_dtl_id = t.security_id
 AND sec.cms_collateral_id = trx.staging_reference_id
 AND transaction_type = 'COL'
 AND IS_VALID_2 = 'Y');

update cms_security s 
set reserve_price = (select max(t.reserve_price)
					from mig_co015_vl t
					where t.IS_VALID_2 = 'Y'
					and t.security_id = s.sci_security_dtl_id)
where exists (select 1 from mig_co015_vl t1
				where t1.IS_VALID_2 = 'Y'
				and t1.security_id = s.sci_security_dtl_id)
and IS_MIGRATED_IND = 'Y';

update cms_stage_security s 
set reserve_price = (select max(t.reserve_price)
					from mig_co015_vl t
					where t.IS_VALID_2 = 'Y'
					and t.security_id = s.sci_security_dtl_id)
where exists (select 1 from mig_co015_vl t1
				where t1.IS_VALID_2 = 'Y'
				and t1.security_id = s.sci_security_dtl_id)
and IS_MIGRATED_IND = 'Y';