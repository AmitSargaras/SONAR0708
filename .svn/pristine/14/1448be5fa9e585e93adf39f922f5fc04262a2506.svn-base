--  SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM, EONCMS_LOCAL@

DROP PROCEDURE SI_RUN_TEMP_OTHR_PF004@

-- DROP PROCEDURE SI_RUN_TEMP_OTHR_PF004_EM@
-- DROP PROCEDURE SI_RUN_TEMP_OTHR_PF004_WM@
-- DROP PROCEDURE SI_RUN_TEMP_OTHR_PF004_LKW@
DROP PROCEDURE SI_RUN_TEMP_OTHR_PF003@
DROP PROCEDURE SI_RUN_TEMP_WORKING_DAYS@
DROP PROCEDURE SI_RUN_TEMP_PUBLIC_HOLIDAY@
DROP PROCEDURE SI_RUN_TEMP_FOREX@
DROP PROCEDURE SI_RUN_TEMP_INSR_POLICY@


CREATE PROCEDURE SI_RUN_TEMP_OTHR_PF004
  LANGUAGE SQL

  BEGIN

    DECLARE    v_COMPOSITE_ID       VARCHAR(100);
    DECLARE    v_REGION             VARCHAR(3);
    DECLARE    v_CAR_MAKE           VARCHAR(50);
    DECLARE    v_CAR_MODEL          VARCHAR(50);
    DECLARE    v_CAR_YEAR           INTEGER DEFAULT 0;
    DECLARE    v_CAR_FSV            DECIMAL(17,2);
    DECLARE    v_PURCHASE_CURRENCY  VARCHAR(3);
    DECLARE    v_count              INTEGER DEFAULT 0;
    DECLARE    v_no_data_found      SMALLINT DEFAULT 0;
  
    DECLARE cur CURSOR FOR   SELECT COMPOSITE_ID, REGION , CAR_MAKE, CAR_MODEL, CAR_YEAR, CAR_FSV , PURCHASE_CURRENCY
    FROM SI_TEMP_OTHR_PF004  WHERE IS_VALID = 'Y';

    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET v_no_data_found = 1;

     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_OTHR_PF004', '', 1);
     commit;

    OPEN cur;
    FETCH cur INTO v_COMPOSITE_ID, v_REGION , v_CAR_MAKE, v_CAR_MODEL, v_CAR_YEAR, v_CAR_FSV , v_PURCHASE_CURRENCY ; 

    WHILE (v_no_data_found = 0) DO
      SELECT COUNT(*) 
      INTO   v_count
      FROM   CMS_VEHICLE_PRICE_FEED
      WHERE  COMPOSITE_ID = v_COMPOSITE_ID;

      IF ( v_count > 0 ) THEN
        UPDATE   CMS_VEHICLE_PRICE_FEED
        SET      CAR_FSV = v_CAR_FSV,   LAST_UPDATE_DATE = current timestamp
        WHERE    COMPOSITE_ID = v_COMPOSITE_ID ;
      ELSE
        INSERT INTO CMS_VEHICLE_PRICE_FEED (COMPOSITE_ID, REGION , CAR_MAKE, CAR_MODEL, CAR_YEAR, CAR_FSV, PURCHASE_CURRENCY )
        values (v_COMPOSITE_ID, v_REGION , v_CAR_MAKE, v_CAR_MODEL, v_CAR_YEAR, v_CAR_FSV , 'MYR');
      END IF;

      SET v_no_data_found = 0;
      FETCH cur INTO v_COMPOSITE_ID, v_REGION , v_CAR_MAKE, v_CAR_MODEL, v_CAR_YEAR, v_CAR_FSV , v_PURCHASE_CURRENCY ; 
    END WHILE;
    CLOSE cur;


  CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_OTHR_PF004', '', 0);
  commit;

END
@


 -- -----------------------------------
 -- * START OF -> OTHR data feed file
 -- * HP Feed PF004 [ EM ] 
 --------------------------------------
 -- CREATE PROCEDURE SI_RUN_TEMP_OTHR_PF004_EM
 --    LANGUAGE SQL
 --   BEGIN
 --     DECLARE TEMP_REGION VARCHAR(3) DEFAULT 'EM';
 --   
 --     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_OTHR_PF004_EM', '', 1);
 --     commit;
 -- 
    ---------------------------
    -- * Remove existing record (based on region) 
    -- * CMS_VEHICLE_PRICE_FEED
    ---------------------------
 --     delete from CMS_VEHICLE_PRICE_FEED where REGION = TEMP_REGION;
 --    commit;


    ------------------------------------
    -- Begin insert 
    -- CMS_VEHICLE_PRICE_FEED
    -- vehicle price feed
    --
    ------------------------------------
 --    insert into CMS_VEHICLE_PRICE_FEED
 --    (COMPOSITE_ID,
 --      REGION,
 --      CAR_MAKE,
 --      CAR_MODEL,
 --      CAR_YEAR,
 --      CAR_FSV,
 --      PURCHASE_CURRENCY)
 --    (SELECT COMPOSITE_ID, REGION , CAR_MAKE, CAR_MODEL, CAR_YEAR, CAR_FSV , PURCHASE_CURRENCY
 --    	FROM SI_TEMP_OTHR_PF004 WHERE IS_VALID = 'Y');
 --    commit;
        
 --    CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_OTHR_PF004_EM', '', 0);
 --    commit;

 --  END@


 -- -----------------------------------
 -- * START OF -> OTHR data feed file
 -- * HP Feed PF004 [ WM ] 
 --------------------------------------
 -- CREATE PROCEDURE SI_RUN_TEMP_OTHR_PF004_WM
 --    LANGUAGE SQL
 --    BEGIN
 --     DECLARE TEMP_REGION VARCHAR(3) DEFAULT 'WM';
 --   
 --     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_OTHR_PF004_WM', '', 1);
 --     commit;

    ---------------------------
    -- * Remove existing record (based on region) 
    -- * CMS_VEHICLE_PRICE_FEED
    ---------------------------
 --     delete from CMS_VEHICLE_PRICE_FEED where REGION = TEMP_REGION;
 --    commit;


    ------------------------------------
    -- Begin insert 
    -- CMS_VEHICLE_PRICE_FEED
    -- vehicle price feed
    --
    ------------------------------------
 --    insert into CMS_VEHICLE_PRICE_FEED
 --    (COMPOSITE_ID,
 --      REGION,
 --      CAR_MAKE,
 --      CAR_MODEL,
 --      CAR_YEAR,
 --      CAR_FSV,
 --      PURCHASE_CURRENCY)
 --    (SELECT COMPOSITE_ID, REGION , CAR_MAKE, CAR_MODEL, CAR_YEAR, CAR_FSV , PURCHASE_CURRENCY
 --    	FROM SI_TEMP_OTHR_PF004 WHERE IS_VALID = 'Y');
 --    commit;
        
 --    CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_OTHR_PF004_WM', '', 0);
 --    commit;

 -- END@


 -- -----------------------------------
 -- * START OF -> OTHR data feed file
 -- * HP Feed PF004 [ LKW ] 
 --------------------------------------
 -- CREATE PROCEDURE SI_RUN_TEMP_OTHR_PF004_LKW
 --    LANGUAGE SQL
 --    BEGIN
 --      DECLARE TEMP_REGION VARCHAR(3) DEFAULT 'LKW';
 --    
 --      CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_OTHR_PF004_LKW', '', 1);
 --      commit;

    ---------------------------
    -- * Remove existing record (based on region) 
    -- * CMS_VEHICLE_PRICE_FEED
    ---------------------------
 --      delete from CMS_VEHICLE_PRICE_FEED where REGION = TEMP_REGION;
 --     commit;


    ------------------------------------
    -- Begin insert 
    -- CMS_VEHICLE_PRICE_FEED
    -- vehicle price feed
    --
    ------------------------------------
 --    insert into CMS_VEHICLE_PRICE_FEED
 --    (COMPOSITE_ID,
 --      REGION,
 --      CAR_MAKE,
 --      CAR_MODEL,
 --      CAR_YEAR,
 --      CAR_FSV,
 --      PURCHASE_CURRENCY)
 --    (SELECT COMPOSITE_ID, REGION , CAR_MAKE, CAR_MODEL, CAR_YEAR, CAR_FSV , PURCHASE_CURRENCY
 --    	FROM SI_TEMP_OTHR_PF004 WHERE IS_VALID = 'Y');
 --    commit;
        
 --    CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_OTHR_PF004_LKW', '', 0);
 --    commit;

 -- END@


 -- -----------------------------------
 -- * START OF -> OTHR data feed file
 -- * Property Valuation Feed PF003 
 --------------------------------------
CREATE PROCEDURE SI_RUN_TEMP_OTHR_PF003
   LANGUAGE SQL
   BEGIN   
     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_OTHR_PF003', '', 1);
     commit;


    ------------------------------------
    -- Derive next valuation date (in TEMP table)
    -- 
    ------------------------------------
    UPDATE SI_TEMP_OTHR_PF003 a
    set NEXT_VALUATION_DATE = NEXT_VAL_DATE (VALUATION_DATE, VALUATION_FREQ, VALUATION_FREQ_UNIT)
    WHERE a.is_valid = 'Y';
    commit;
    
    
    ------------------------------------
    -- Derive Margin (in TEMP table), based on Haircut
    -- 
    ------------------------------------
    UPDATE SI_TEMP_OTHR_PF003 a
    set MARGIN = ( 1 - ( HAIRCUT / 100) )
    WHERE a.is_valid = 'Y';
    commit;    


    ------------------------------------
    -- Derive OMV (in TEMP table) if not sent in from User (-9999999999.99)
    -- 
    ------------------------------------
    UPDATE SI_TEMP_OTHR_PF003 a
    	set OMV = FSV / MARGIN
    WHERE a.is_valid = 'Y'
    AND OMV = -9999999999.99
    AND FSV <> -9999999999.99;
    commit;
    
    
    UPDATE SI_TEMP_OTHR_PF003 a
    	set OMV = ( select val.CMV from CMS_VALUATION val 
			where val.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID
			order by val.VALUATION_DATE desc
			fetch first 1 row only )
    WHERE a.is_valid = 'Y'
    AND OMV = (-9999999999.99)
    AND RESERVED_PRICE <> -9999999999.99;
    commit;   
    
    
    ------------------------------------
    -- Derive FSV (in TEMP table) if not sent in from User (-9999999999.99)
    -- 
    ------------------------------------
    UPDATE SI_TEMP_OTHR_PF003 a
    	set FSV = OMV * MARGIN
    WHERE a.is_valid = 'Y'
    AND FSV = -9999999999.99
    AND OMV <> -9999999999.99;
    commit;  
    
    
    UPDATE SI_TEMP_OTHR_PF003 a
    	set FSV = ( select val.FSV from CMS_VALUATION val 
			where val.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID
			order by val.VALUATION_DATE desc
			fetch first 1 row only )
    WHERE a.is_valid = 'Y'
    AND FSV = -9999999999.99
    AND RESERVED_PRICE <> -9999999999.99;
    commit;     


    ------------------------------------
    -- Derive RESERVED_PRICE (in TEMP table) if not sent in from User (-9999999999.99)
    -- 
    ------------------------------------
    UPDATE SI_TEMP_OTHR_PF003 a
    	set RESERVED_PRICE = MINIMUM(OMV, OMV, FSV)
    WHERE a.is_valid = 'Y'
    AND RESERVED_PRICE = -9999999999.99;
    commit;     
    
     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_OTHR_PF003', '', 2);
     commit;    

    ------------------------------------
    -- Begin insert 
    -- CMS_VALUATION
    -- property valuation feed
    --
    ------------------------------------
    
    insert into CMS_VALUATION
    (VALUATION_ID, VALUATION_CURRENCY, VALUATION_DATE, VALUER, CMV, FSV, REVAL_FREQ,
    	REVAL_FREQ_UNIT, CMS_COLLATERAL_ID, UPDATE_DATE, RESERVE_PRICE, 
    	SOURCE_TYPE, VALUATION_TYPE, SOURCE_ID)
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR VALUATION_SEQ), 2)) as BIGINT), 
    	VALUATION_CURRENCY, VALUATION_DATE, VALUER_CODE, OMV, FSV, VALUATION_FREQ,
    	VALUATION_FREQ_UNIT, CMS_COLLATERAL_ID, CURRENT_TIMESTAMP, RESERVED_PRICE,
    	'M', 'M', 'CMS'
    	FROM SI_TEMP_OTHR_PF003 WHERE IS_VALID = 'Y');
    commit;
    
    
    ------------------------------------
    -- Begin update 
    -- CMS_SECURITY
    -- property valuation info in security table
    --
    ------------------------------------    
    UPDATE CMS_SECURITY sec
    	set (FSV_CURRENCY, FSV, CMV_CURRENCY, CMV, LAST_REMARGIN_DATE, 
    		NEXT_REMARGIN_DATE, VALUATION_TYPE, VALUER, RESERVE_PRICE) = 
    	(select VALUATION_CURRENCY, FSV, VALUATION_CURRENCY, OMV, VALUATION_DATE,
    		NEXT_VALUATION_DATE, 'M', VALUER_CODE, RESERVED_PRICE
    		from SI_TEMP_OTHR_PF003 temp
			where temp.is_valid = 'Y' 
			and sec.CMS_COLLATERAL_ID = temp.CMS_COLLATERAL_ID
			fetch first 1 row only)
    WHERE EXISTS (select 1 from SI_TEMP_OTHR_PF003 a
			where a.is_valid = 'Y' 
			and sec.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID);
    commit; 
        
             
    CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_OTHR_PF003', '', 0);
    commit;

END@



CREATE PROCEDURE SI_RUN_TEMP_WORKING_DAYS
   LANGUAGE SQL
   BEGIN   
     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_WORKING_DAYS', '', 1);
     commit;

    ------------------------------------
    -- Begin insert 
    -- CMS_WORKING_DAYS
    -- 
    ------------------------------------ 
    insert into CMS_WORKING_DAYS
    (PROCESSING_DATE, BIZ_DAY_FLAG, BRANCH, STATUS, LAST_UPDATED_DATE)
    (select PROCESSING_DATE, BIZ_DAY_FLAG, BRANCH, STATUS, CURRENT_TIMESTAMP
    	FROM CMS_TEMP_WORKING_DAYS tmp
    	where not exists (select 1 from CMS_WORKING_DAYS act
    				where act.PROCESSING_DATE = tmp.PROCESSING_DATE
    				and act.BRANCH = tmp.BRANCH));
    commit;
    
    
    ------------------------------------
    -- Begin update 
    -- CMS_WORKING_DAYS
    -- 
    ------------------------------------    
    UPDATE CMS_WORKING_DAYS act
    	set (BIZ_DAY_FLAG, STATUS, LAST_UPDATED_DATE) = 
    	(select BIZ_DAY_FLAG, STATUS, CURRENT_TIMESTAMP
    		from CMS_TEMP_WORKING_DAYS temp
			where act.PROCESSING_DATE = temp.PROCESSING_DATE
    			and act.BRANCH = temp.BRANCH
			fetch first 1 row only)
    WHERE EXISTS (select 1 from CMS_TEMP_WORKING_DAYS tmp
			where act.PROCESSING_DATE = tmp.PROCESSING_DATE
			and act.BRANCH = tmp.BRANCH
			and act.BIZ_DAY_FLAG <> tmp.BIZ_DAY_FLAG);
    commit; 
        
             
    CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_WORKING_DAYS', '', 0);
    commit;

END@


CREATE PROCEDURE SI_RUN_TEMP_PUBLIC_HOLIDAY
   LANGUAGE SQL
   BEGIN   
     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_PUBLIC_HOLIDAY', '', 1);
     commit;

    ------------------------------------
    -- Begin insert 
    -- CMS_PUBLIC_HOLIDAY
    -- 
    ------------------------------------ 
    insert into CMS_PUBLIC_HOLIDAY
    (HOLIDAY_DATE, COUNTRY_ISO_CODE, STATE_CODE, DESCRIPTION, STATUS, LAST_UPDATED_DATE)
    (select HOLIDAY_DATE, COUNTRY_ISO_CODE, STATE_CODE, DESCRIPTION, STATUS, CURRENT_TIMESTAMP
    	FROM CMS_TEMP_PUBLIC_HOLIDAY tmp
    	where not exists (select 1 from CMS_PUBLIC_HOLIDAY act
    				where act.HOLIDAY_DATE = tmp.HOLIDAY_DATE
    				and act.COUNTRY_ISO_CODE = tmp.COUNTRY_ISO_CODE
    				and act.STATE_CODE = tmp.STATE_CODE));
    commit;
    
    
    ------------------------------------
    -- Begin update 
    -- CMS_PUBLIC_HOLIDAY
    -- 
    ------------------------------------    
    UPDATE CMS_PUBLIC_HOLIDAY act
    	set (DESCRIPTION, STATUS, LAST_UPDATED_DATE) = 
    	(select DESCRIPTION, STATUS, CURRENT_TIMESTAMP
    		from CMS_TEMP_PUBLIC_HOLIDAY temp
			where act.HOLIDAY_DATE = temp.HOLIDAY_DATE
			and act.COUNTRY_ISO_CODE = temp.COUNTRY_ISO_CODE
    			and act.STATE_CODE = temp.STATE_CODE
			fetch first 1 row only)
    WHERE EXISTS (select 1 from CMS_TEMP_PUBLIC_HOLIDAY tmp
			where act.HOLIDAY_DATE = tmp.HOLIDAY_DATE
			and act.COUNTRY_ISO_CODE = tmp.COUNTRY_ISO_CODE
    			and act.STATE_CODE = tmp.STATE_CODE);
    commit; 
        
             
    CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_PUBLIC_HOLIDAY', '', 0);
    commit;

END@


CREATE PROCEDURE SI_RUN_TEMP_FOREX
   LANGUAGE SQL
   BEGIN   
     DECLARE feed_grp_id BIGINT DEFAULT -999999999;
     
     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_FOREX', '', 1);
     commit;
     
    ------------------------------------
    -- Begin retrieve Feed Group ID 
    -- CMS_FEED_GROUP
    -- 
    ------------------------------------ 
    select FEED_GROUP_ID into feed_grp_id
    	FROM CMS_FEED_GROUP grp
    	where grp.GROUP_TYPE = 'FOREX';
    
    
    ------------------------------------
    -- Begin update 
    -- CMS_FOREX
    -- 
    ------------------------------------    
    UPDATE CMS_FOREX act
    	set act.FEED_GROUP_ID = feed_grp_id
    	where feed_grp_id <> -999999999;
    commit; 
        
             
    CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_FOREX', '', 0);
    commit;

END@

--SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM, EONCMS_LOCAL@
--DROP PROCEDURE STP_REFIRE_LOS_REJECTED_FACILITY@
--CALL "EONCMS_LOCAL"."STP_REFIRE_LOS_REJECTED_FACILITY"@;

CREATE PROCEDURE STP_REFIRE_LOS_REJECTED_FACILITY
		LANGUAGE SQL
	BEGIN
	
	UPDATE TRANSACTION a SET a.FROM_STATE=a.STATUS, a.STATUS = 'LOADING'
	WHERE STATUS = 'PENDING_RETRY' and TRANSACTION_TYPE = 'FACILITY' and a.USER_ID = -1
		and REFERENCE_ID IN 
		(select CMS_FAC_MASTER_ID from CMS_FAC_GENERAL where FAC_STATUS_CODE_VALUE = 'R');
	commit;
			
	UPDATE STP_MASTER_TRANS a SET a.STATUS = 'QUEUE', a.LAST_SUBMISSION_DATE=current timestamp
	WHERE a.TRANSACTION_ID IN 
		(select TRANSACTION_ID from transaction b, CMS_FAC_GENERAL c where b.STATUS = 'LOADING' and b.TRANSACTION_TYPE = 'FACILITY'
			and b.USER_ID = -1
			and b.REFERENCE_ID = c.CMS_FAC_MASTER_ID and c.FAC_STATUS_CODE_VALUE = 'R')
		and a.STATUS not in ('QUEUE', 'LOADING')
		and a.TRANSACTION_TYPE = 'FACILITY';
						
	commit;
END@

CREATE PROCEDURE SI_RUN_TEMP_INSR_POLICY
   LANGUAGE SQL
BEGIN

  DECLARE GLOBAL TEMPORARY TABLE SESSION.cms_insr_pol (
  	policy_no VARCHAR(20),
  	cms_actual_insr_policy_id BIGINT,
  	cms_stage_insr_policy_id BIGINT) 
  WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;
  
  INSERT INTO SESSION.cms_insr_pol(policy_no, cms_actual_insr_policy_id)
  	(SELECT INSR_POLICY_NO, act.INSURANCE_POLICY_ID
  	  FROM SI_TEMP_INSR_POLICY tmp,
  	  	   CMS_SECURITY sec, 
  	  	   CMS_INSURANCE_POLICY act
  	 WHERE sec.sci_reference_note = tmp.collateral_name
  	   AND sec.cms_collateral_id = act.cms_collateral_id
  	   AND tmp.collateral_seq = act.policy_seq_no
  	   AND is_valid = 'Y');

  CREATE INDEX SESSION.idx_act_insr_pol
  	ON SESSION.cms_insr_pol (cms_actual_insr_policy_id, policy_no)
  ALLOW REVERSE SCANS;
  
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_INSR_POLICY', '', 1);
  COMMIT;

  UPDATE CMS_INSURANCE_POLICY act SET (
	INSURED_AMT, GROSS_PREMIUM, COMMISSION_EARNED, REBATE_AMT_BY_INSURANCE_COMPAN,
	SERVICE_AMT, STAMP_DUTY, SERVICE_TAX_PERCT, NET_PREMIUM_PAY_BY_BORROWER, 
	NET_PREMIUM_PAY_TO_INSURANCE_C, EXPIRY_DATE, POLICY_NO)
	= (SELECT INSURED_AMOUNT, GROSS_PREMIUM_AMOUNT, COMMISSION_AMOUNT, REBATE_AMOUNT,
			  SERVICE_TAX_AMOUNT, STAMP_DUTY_AMOUNT, (SERVICE_TAX_PERC / 100), 
			  NET_PREM_TO_BORROWER, NET_PREM_TO_COMPANY, INSR_EXPIRY_DATE,
			  INSR_POLICY_NO
		 FROM SI_TEMP_INSR_POLICY tmp, SESSION.cms_insr_pol sess
		WHERE tmp.INSR_POLICY_NO = sess.POLICY_NO
		  AND sess.cms_actual_insr_policy_id = act.INSURANCE_POLICY_ID)
   WHERE EXISTS (SELECT 1 FROM SESSION.cms_insr_pol
				  WHERE cms_actual_insr_policy_id = act.INSURANCE_POLICY_ID);

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_INSR_POLICY', '', 2);
  COMMIT;
  
  -- see got any chance to update staging table
  
  UPDATE SESSION.cms_insr_pol sess SET cms_stage_insr_policy_id = (
  	SELECT stg.insurance_policy_id
  	  FROM cms_insurance_policy act,
  	  	   cms_stage_insurance_policy stg,
  	  	   transaction trx
  	 WHERE act.insr_id = stg.insr_id
  	   AND act.cms_collateral_id = trx.reference_id
  	   AND stg.cms_collateral_id = trx.staging_reference_id
  	   AND trx.transaction_type = 'COL'
  	   AND sess.cms_actual_insr_policy_id = act.insurance_policy_id)
   WHERE EXISTS (SELECT 1 FROM cms_insurance_policy 
   				  WHERE insurance_policy_id = sess.cms_actual_insr_policy_id);

  CREATE INDEX SESSION.idx_stg_insr_pol
  	ON SESSION.cms_insr_pol (cms_stage_insr_policy_id, policy_no)
  ALLOW REVERSE SCANS;

  UPDATE CMS_STAGE_INSURANCE_POLICY stg SET (
	INSURED_AMT, GROSS_PREMIUM, COMMISSION_EARNED, REBATE_AMT_BY_INSURANCE_COMPAN,
	SERVICE_AMT, STAMP_DUTY, SERVICE_TAX_PERCT, NET_PREMIUM_PAY_BY_BORROWER, 
	NET_PREMIUM_PAY_TO_INSURANCE_C, EXPIRY_DATE, POLICY_NO)
	= (SELECT INSURED_AMOUNT, GROSS_PREMIUM_AMOUNT, COMMISSION_AMOUNT, REBATE_AMOUNT,
			  SERVICE_TAX_AMOUNT, STAMP_DUTY_AMOUNT, (SERVICE_TAX_PERC / 100), 
			  NET_PREM_TO_BORROWER, NET_PREM_TO_COMPANY, INSR_EXPIRY_DATE,
			  INSR_POLICY_NO
		 FROM SI_TEMP_INSR_POLICY tmp, SESSION.cms_insr_pol sess
		WHERE tmp.INSR_POLICY_NO = sess.POLICY_NO
		  AND sess.cms_stage_insr_policy_id = stg.INSURANCE_POLICY_ID)
   WHERE EXISTS (SELECT 1 FROM SESSION.cms_insr_pol
				  WHERE cms_stage_insr_policy_id = stg.INSURANCE_POLICY_ID);

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_INSR_POLICY', '', 0);
  COMMIT;
END@

commit work
@