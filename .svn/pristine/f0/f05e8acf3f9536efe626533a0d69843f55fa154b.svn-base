DROP PROCEDURE MIG_POPULATE_VAL_TO_SEC_TBL@

CREATE PROCEDURE MIG_POPULATE_VAL_TO_SEC_TBL
	LANGUAGE SQL
BEGIN	  
   
	CALL LOG_PROC_TIME('MIG_POPULATE_VAL_TO_SEC_TBL', 'SIBS', 1);
   
    --Mock 8: Took around 1-1.5hr
    -- UPDATE CMS_SECURITY sec
    -- SET (CMV, CMV_CURRENCY, FSV, FSV_CURRENCY, LAST_REMARGIN_DATE, NEXT_REMARGIN_DATE, VALUATION_TYPE) 
     -- = (select CMV, val.VALUATION_CURRENCY, FSV, VALUATION_CURRENCY, VALUATION_DATE, 
               -- NEXT_VAL_DATE(valuation_date, VALUATION_FREQUENCY, VALUATION_FREQUENCY_UNIT), SOURCE_TYPE
        -- from cms_security_parameter param, cms_valuation val
        -- where val.valuation_id = (select max(latest.valuation_id)
					-- from cms_valuation latest
					-- where latest.valuation_date = (select  max(valuation_date)
									-- from cms_valuation max_val
									-- where max_val.CMS_COLLATERAL_ID = sec.cms_collateral_id
									-- group by max_val.cms_collateral_id)
					-- and latest.cms_collateral_id = sec.cms_collateral_id
					-- group by latest.cms_collateral_id)
        -- and val.CMS_COLLATERAL_ID = sec.cms_collateral_id
        -- and sec.SECURITY_LOCATION = param.COUNTRY_ISO_CODE
        -- and sec.SCI_SECURITY_SUBTYPE_VALUE = param.SECURITY_SUB_TYPE_ID)
    -- WHERE sec.next_remargin_date is null
    -- and exists (select 1 from cms_valuation val_where where val_where.CMS_COLLATERAL_ID = sec.cms_collateral_id);
    
    
    --Tested on mock 8: took <15 mins for everything 
    CREATE TABLE MIG_LATEST_VALUATION(
        CMS_COLLATERAL_ID       BIGINT,
        VALUATION_ID            BIGINT,
    	VALUATION_CURRENCY   	CHARACTER(3),
    	VALUATION_DATE       	TIMESTAMP,
    	CMV                  	DECIMAL(20,2),
    	FSV                  	DECIMAL(20,2),
    	SOURCE_TYPE          	CHARACTER(1),
		VALUER					VARCHAR(100)
    )
    in CMS_MIG index in CMS_MIG_INDEX;

  
    insert into MIG_LATEST_VALUATION(CMS_COLLATERAL_ID, valuation_id, CMV, FSV, VALUATION_CURRENCY, SOURCE_TYPE, VALUATION_DATE, VALUER)
    select val.cms_collateral_id, val.valuation_id, val.CMV, val.FSV, val.VALUATION_CURRENCY, val.SOURCE_TYPE, val.VALUATION_DATE, val.valuer
    from cms_valuation val,
        (select max_val_id.cms_collateral_id, max(valuation_id) valuation_id
        from cms_valuation max_val_id, 
            (select cms_collateral_id, max(valuation_date) valuation_date
            from cms_valuation 
            group by cms_collateral_id) max_val_date
        where max_val_id.CMS_COLLATERAL_ID = max_val_date.CMS_COLLATERAL_ID
        and max_val_id.VALUATION_DATE = max_val_date.VALUATION_DATE
        group by max_val_id.cms_collateral_id) latest_val
    where val.valuation_id = latest_val.valuation_id;
    
    CREATE INDEX MIG_MAX_VAL_IDX1 ON MIG_LATEST_VALUATION
    (CMS_COLLATERAL_ID ASC);  
        
	CALL LOG_PROC_TIME('MIG_POPULATE_VAL_TO_SEC_TBL', 'SIBS', 2);
	commit;
    
    UPDATE CMS_SECURITY sec
    SET (CMV, CMV_CURRENCY, FSV, FSV_CURRENCY, LAST_REMARGIN_DATE, NEXT_REMARGIN_DATE, VALUATION_TYPE, VALUER) 
    = (select val.CMV, val.VALUATION_CURRENCY, val.FSV, val.VALUATION_CURRENCY, val.VALUATION_DATE, 
            NEXT_VAL_DATE(val.valuation_date, param.VALUATION_FREQUENCY, param.VALUATION_FREQUENCY_UNIT), val.SOURCE_TYPE, VALUER
       from cms_security_parameter param, mig_latest_valuation val
       where val.CMS_COLLATERAL_ID = sec.cms_collateral_id
       and sec.SECURITY_LOCATION = param.COUNTRY_ISO_CODE
       and sec.security_sub_type_id = param.SECURITY_SUB_TYPE_ID)
    WHERE sec.next_remargin_date is null;
    --and exists (select 1 from cms_valuation val_where where val_where.CMS_COLLATERAL_ID = sec.cms_collateral_id);

    DROP TABLE MIG_LATEST_VALUATION;
    
	CALL LOG_PROC_TIME('MIG_POPULATE_VAL_TO_SEC_TBL', 'SIBS', 0);
    
   
END@    