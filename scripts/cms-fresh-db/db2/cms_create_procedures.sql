
---------------------------------
-- DDL statements for stored procedures
---------------------------------
DROP PROCEDURE PROC_UPD_CHARGE;

CREATE PROCEDURE PROC_UPD_CHARGE 
LANGUAGE SQL
SPECIFIC PROC_UPD_CHARGE 
begin ATOMIC
for rec AS SELECT stg.charge_amount, stg.cms_ref_id,
trx.reference_id, trx.status
FROM cms_charge_detail detail, TRANSACTION trx, cms_stage_charge_detail stg
WHERE detail.cms_collateral_id = trx.reference_id
AND trx.transaction_type = 'COL'
AND trx.staging_reference_id = stg.cms_collateral_id
AND detail.cms_ref_id = stg.cms_ref_id
DO
update cms_charge_detail
set charge_amount = rec.charge_amount
where cms_collateral_id = rec.reference_id
and cms_ref_id = rec.cms_ref_id
and charge_amount is null;--
end FOR;--
end;

DROP PROCEDURE UTL_FEED_GROUP_CHECK;

CREATE PROCEDURE UTL_FEED_GROUP_CHECK 
LANGUAGE SQL
SPECIFIC UTL_FEED_GROUP_CHECK
BEGIN ATOMIC
  DECLARE i DECIMAL(19);--
  DECLARE j DECIMAL(19);--

    -- Checks what is the maximum id in the table first.
	SELECT MAX(FEED_GROUP_ID) INTO j FROM CMS_FEED_GROUP;--
    SELECT (NEXTVAL FOR CMS_FEED_GROUP_SEQ) INTO i FROM SYSIBM.SYSDUMMY1; --waste one value.
    IF (i < j) THEN
        -- Current sequence value is less than the maximum id, bring it up to
        -- maximum id value.
			loop1:	
        LOOP
            SELECT CAST((NEXTVAL FOR CMS_FEED_GROUP_SEQ) AS DECIMAL(19)) INTO i FROM SYSIBM.SYSDUMMY1;--
            IF i = j THEN
						  LEAVE loop1;--
						END IF;	--
        END loop;--
    END IF;--

    -- Consult stock exchange table, for each record, if there is no
    -- stock feed group with the stock exchange code, insert one!
	FOR idx AS SELECT STOCK_EXCHANGE FROM CMS_STOCK_EXCHANGE 
   DO
        -- Stock feed group.
        SELECT COUNT(*) INTO i FROM CMS_FEED_GROUP
            WHERE group_type = 'STOCK' AND group_subtype = idx.STOCK_EXCHANGE;--
        IF (i = 0) THEN
            INSERT INTO CMS_FEED_GROUP
                (feed_group_id, group_type, group_subtype)
                VALUES
                ((NEXTVAL for CMS_FEED_GROUP_SEQ), 'STOCK', idx.STOCK_EXCHANGE);--
					loop2:			
            LOOP
                SELECT CAST((NEXTVAL for TRX_SEQ) AS DECIMAL(19)) INTO j FROM sysibm.sysdummy1;--
                SELECT COUNT(*) INTO i FROM TRANSACTION
                    WHERE DECIMAL(TRANSACTION_ID) = j;--
                 IF i = 0 THEN
								   LEAVE loop2;--
								 END IF;	--
								  
            END LOOP;--

          INSERT INTO TRANSACTION
              (transaction_id, from_state, transaction_type, reference_id, status)
              VALUES
              (cast(char(j) as varchar(20)) ,'ND', 'STOCK_FEED_GROUP', (prevval for CMS_FEED_GROUP_SEQ), 'ACTIVE');--
        END IF;--

    END FOR;--

  -- Consult the country view, for each record, if there is no
  -- unit trust, stock index or property index group with the country code,
  -- insert one!
  FOR idx AS SELECT COUNTRY_ISO_CODE FROM country
	 DO

    -- Unit trust feed group.
    SELECT COUNT(*) INTO i FROM CMS_FEED_GROUP
    	WHERE group_type = 'UNIT_TRUST' AND group_subtype = idx.COUNTRY_ISO_CODE;--
    IF (i = 0) THEN
    	INSERT INTO CMS_FEED_GROUP
            (feed_group_id, group_type, group_subtype)
            VALUES
            ((NEXTVAL for CMS_FEED_GROUP_SEQ), 'UNIT_TRUST', idx.COUNTRY_ISO_CODE);--
			loop3:			
        LOOP
		      SELECT CAST((NEXTVAL for TRX_SEQ) AS DECIMAL(19)) INTO j FROM sysibm.sysdummy1;--
		      SELECT COUNT(*) INTO i FROM TRANSACTION
		      	WHERE DECIMAL(TRANSACTION_ID) = j;--
             IF i = 0 THEN
						   LEAVE loop3;--
						 END IF;	--
        END LOOP;--
        INSERT INTO TRANSACTION
          (transaction_id, from_state, transaction_type, reference_id, status)
          VALUES
          (cast(char(j) as varchar(20)) ,'ND', 'UNITTRUST_FEED_GROUP', (prevval for CMS_FEED_GROUP_SEQ), 'ACTIVE');--

    END IF;--

    -- Stock index feed group.
    SELECT COUNT(*) INTO i FROM CMS_FEED_GROUP
    	WHERE group_type = 'STOCK_INDEX' AND group_subtype = idx.COUNTRY_ISO_CODE;--
    IF (i = 0) THEN
    	INSERT INTO CMS_FEED_GROUP
    	(feed_group_id, group_type, group_subtype)
      	VALUES
      	((NEXTVAL for CMS_FEED_GROUP_SEQ), 'STOCK_INDEX', idx.COUNTRY_ISO_CODE);--
		loop4:		
      LOOP
		      SELECT CAST((NEXTVAL for TRX_SEQ) AS DECIMAL(19)) INTO j FROM sysibm.sysdummy1;--
		      SELECT COUNT(*) INTO i FROM TRANSACTION
		      	WHERE DECIMAL(TRANSACTION_ID) = j;--
            IF i = 0 THEN
						  LEAVE loop4;--
						END IF;	--
      END LOOP;--
      INSERT INTO TRANSACTION
          (transaction_id, from_state, transaction_type, reference_id, status)
          VALUES
          (cast(char(j) as varchar(20)) ,'ND', 'STOCKIDX_FEED_GROUP', (prevval for CMS_FEED_GROUP_SEQ), 'ACTIVE');--
    END IF;--

    -- Property index feed group.
    SELECT COUNT(*) INTO i FROM CMS_FEED_GROUP
    	WHERE group_type = 'PROPERTY_INDEX' AND group_subtype = idx.COUNTRY_ISO_CODE;--
    IF (i = 0) THEN
    	INSERT INTO CMS_FEED_GROUP
    	(feed_group_id, group_type, group_subtype)
      	VALUES
      	((NEXTVAL for CMS_FEED_GROUP_SEQ), 'PROPERTY_INDEX', idx.COUNTRY_ISO_CODE);--
		loop5:		
      LOOP
		      SELECT CAST((NEXTVAL for TRX_SEQ) AS DECIMAL(19)) INTO j FROM sysibm.sysdummy1;--
		      SELECT COUNT(*) INTO i FROM TRANSACTION
		      	WHERE DECIMAL(TRANSACTION_ID) = j;--
              IF i = 0 THEN
							 LEAVE loop5;--
							END IF;--
      END LOOP;--
      INSERT INTO TRANSACTION
          (transaction_id, from_state, transaction_type, reference_id, status)
          VALUES
          (cast(char(j) as varchar(20)) ,'ND', 'PROPIDX_FEED_GROUP', (prevval for CMS_FEED_GROUP_SEQ), 'ACTIVE');--
    END IF;--
  END FOR;--
END;

DROP PROCEDURE UTL_INSERT_SEC_PARAM;

CREATE PROCEDURE UTL_INSERT_SEC_PARAM(IN country_code VARCHAR(40))
 LANGUAGE SQL
 SPECIFIC UTL_INSERT_SEC_PARAM
 BEGIN ATOMIC 
 -- select subtypes that are not in security parameter
       -- select all countries
    
 DECLARE grpcount DECIMAL(19) DEFAULT 0;--
 DECLARE groupid DECIMAL(19) DEFAULT 0;--
 DECLARE p_rowcount DECIMAL(19) DEFAULT 0;--
 DECLARE prevcntry VARCHAR(100) DEFAULT '**';--

 SELECT MAX(id) INTO p_rowcount FROM cms_security_parameter;--
 SELECT MAX(group_id) INTO grpcount FROM cms_security_parameter;--

   FOR i AS SELECT s.security_type_id, s.security_sub_type_id FROM cms_security_sub_type s WHERE s.security_sub_type_id <> 'NA'
         AND NOT EXISTS (SELECT 'p' FROM cms_security_parameter p WHERE s.security_sub_type_id = p.security_sub_type_id)
	  do
     FOR j AS SELECT country_iso_code FROM country
		 do
       SELECT distinct (p.group_id) INTO groupid
          FROM cms_security_parameter p, cms_security_sub_type s
          WHERE p.security_sub_type_id = s.security_sub_type_id AND p.country_iso_code = j.COUNTRY_ISO_CODE
             AND s.security_type_id = i.SECURITY_TYPE_ID;--
     
         IF (prevcntry = j.COUNTRY_ISO_CODE) THEN
            set groupid = grpcount;--
         END IF;--

             IF (groupid = 0 and prevcntry != j.COUNTRY_ISO_CODE) THEN
       set grpcount = grpcount + 1;--
    set groupid = grpcount;--
   END IF;--


   set p_rowcount = p_rowcount + 1;--
       INSERT INTO cms_security_parameter (id, country_iso_code, security_sub_type_id, threshold_percent, valuation_frequency_unit, valuation_frequency, group_id, version_time, status)
       VALUES (p_rowcount, j.COUNTRY_ISO_CODE, i.SECURITY_SUB_TYPE_ID, null, null, null, groupid, null, 'ACTIVE');--

   set prevcntry = j.COUNTRY_ISO_CODE;--
   END FOR;--
  END FOR;--

    INSERT INTO cms_stage_security_parameter (id, country_iso_code, security_sub_type_id, threshold_percent, valuation_frequency_unit, valuation_frequency, group_id, version_time, status)
    (SELECT cast(cast(dt_fmt(current_date, 'yyyymmdd') as char(8)) || cast(lpad(cast(char((nextval for SECURITY_PARAMETER_SEQ)) as varchar(4000)), 6, '0')as char(6)) as DECIMAL(19)), p.country_iso_code, p.security_sub_type_id, p.threshold_percent, p.valuation_frequency_unit, p.valuation_frequency, t.staging_reference_id, p.version_time, p.status
     FROM transaction t, cms_security_parameter p
     WHERE t.transaction_type = 'COLPARAM' AND t.reference_id = p.group_id AND t.status <> 'ACTIVE'
     AND p.security_sub_type_id NOT IN (SELECT security_sub_type_id FROM cms_stage_security_parameter));--
END;


----------------------------------------------------------------------
-- Procedure to populate the data for the report table
----------------------------------------------------------------------

DROP PROCEDURE POPULATE_SECURITY_DETAILS_BY_BUE;

CREATE PROCEDURE POPULATE_SECURITY_DETAILS_BY_BUE
LANGUAGE SQL
SPECIFIC POPULATE_SECURITY_DETAILS_BY_BUE 
BEGIN ATOMIC                

	DECLARE TOTAL_SEC_FSV DECIMAL(30,2) DEFAULT 1;--

    INSERT INTO CMS_RPT_SECURITY_BY_BUE (BUSINESS_UNIT_ENTITY, COUNTRY, TOTAL_AMT_BY_BUE)
    SELECT LLP_SEGMENT_CODE_VALUE, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FROM VW_PROPERTY_BY_FIRST_BU VW
    GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY;--

	INSERT INTO CMS_RPT_SECURITY_BY_BUE_SUM(COUNTRY, TOTAL_AMT)
	SELECT COUNTRY, SUM(TOTAL_AMT_BY_BUE) FROM CMS_RPT_SECURITY_BY_BUE
	GROUP BY COUNTRY;--

	
	-- Update AB
    UPDATE CMS_RPT_SECURITY_BY_BUE RPT SET AB_FSV = 
    (SELECT SUBTYPE.FSV 
    FROM 
        (SELECT LLP_SEGMENT_CODE_VALUE BU, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FSV
         FROM VW_SECURITY_BY_FIRST_BUE VW
         WHERE SECURITY_TYPE = 'AB'
         GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY) SUBTYPE
     WHERE RPT.BUSINESS_UNIT_ENTITY = SUBTYPE.BU
	 AND RPT.COUNTRY = SUBTYPE.COUNTRY);--
	

	-- Update CS
    UPDATE CMS_RPT_SECURITY_BY_BUE RPT SET CS_FSV = 
    (SELECT SUBTYPE.FSV 
    FROM 
        (SELECT LLP_SEGMENT_CODE_VALUE BU, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FSV
         FROM VW_SECURITY_BY_FIRST_BUE VW
         WHERE SECURITY_TYPE = 'CS'
         GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY) SUBTYPE
     WHERE RPT.BUSINESS_UNIT_ENTITY = SUBTYPE.BU
	 AND RPT.COUNTRY = SUBTYPE.COUNTRY);--
	


	-- Update DC
    UPDATE CMS_RPT_SECURITY_BY_BUE RPT SET DC_FSV = 
    (SELECT SUBTYPE.FSV 
    FROM 
        (SELECT LLP_SEGMENT_CODE_VALUE BU, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FSV
         FROM VW_SECURITY_BY_FIRST_BUE VW
         WHERE SECURITY_TYPE = 'DC'
         GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY) SUBTYPE
     WHERE RPT.BUSINESS_UNIT_ENTITY = SUBTYPE.BU
	 AND RPT.COUNTRY = SUBTYPE.COUNTRY);--
	


	-- Update GT
    UPDATE CMS_RPT_SECURITY_BY_BUE RPT SET GT_FSV = 
    (SELECT SUBTYPE.FSV 
    FROM 
        (SELECT LLP_SEGMENT_CODE_VALUE BU, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FSV
         FROM VW_SECURITY_BY_FIRST_BUE VW
         WHERE SECURITY_TYPE = 'GT'
         GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY) SUBTYPE
     WHERE RPT.BUSINESS_UNIT_ENTITY = SUBTYPE.BU
	 AND RPT.COUNTRY = SUBTYPE.COUNTRY);--
	


	-- Update IN
    UPDATE CMS_RPT_SECURITY_BY_BUE RPT SET IN_FSV = 
    (SELECT SUBTYPE.FSV 
    FROM 
        (SELECT LLP_SEGMENT_CODE_VALUE BU, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FSV
         FROM VW_SECURITY_BY_FIRST_BUE VW
         WHERE SECURITY_TYPE = 'IN'
         GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY) SUBTYPE
     WHERE RPT.BUSINESS_UNIT_ENTITY = SUBTYPE.BU
	 AND RPT.COUNTRY = SUBTYPE.COUNTRY);--
	


	-- Update MS
    UPDATE CMS_RPT_SECURITY_BY_BUE RPT SET MS_FSV = 
    (SELECT SUBTYPE.FSV 
    FROM 
        (SELECT LLP_SEGMENT_CODE_VALUE BU, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FSV
         FROM VW_SECURITY_BY_FIRST_BUE VW
         WHERE SECURITY_TYPE = 'MS'
         GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY) SUBTYPE
     WHERE RPT.BUSINESS_UNIT_ENTITY = SUBTYPE.BU
	 AND RPT.COUNTRY = SUBTYPE.COUNTRY);--
	
	
	-- Update PT
    UPDATE CMS_RPT_SECURITY_BY_BUE RPT SET PT_FSV = 
    (SELECT SUBTYPE.FSV 
    FROM 
        (SELECT LLP_SEGMENT_CODE_VALUE BU, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FSV
         FROM VW_SECURITY_BY_FIRST_BUE VW
         WHERE SECURITY_TYPE = 'PT'
         GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY) SUBTYPE
     WHERE RPT.BUSINESS_UNIT_ENTITY = SUBTYPE.BU
	 AND RPT.COUNTRY = SUBTYPE.COUNTRY);--
	
	
	-- Update composition		
	UPDATE CMS_RPT_SECURITY_BY_BUE RPT
	SET (AB_COMPOSITION, CS_COMPOSITION, 
		 DC_COMPOSITON, GT_COMPOSITION, 
		 IN_COMPOSITION, MS_COMPOSITION,
		PT_COMPOSITION)
	= (SELECT (RPT.AB_FSV / SUM.TOTAL_AMT * 100), (RPT.CS_FSV / SUM.TOTAL_AMT * 100), 
	   (RPT.DC_FSV / SUM.TOTAL_AMT * 100), (RPT.GT_FSV / SUM.TOTAL_AMT * 100), 
	   (RPT.IN_FSV / SUM.TOTAL_AMT * 100), (RPT.MS_FSV / SUM.TOTAL_AMT * 100), 
	   (RPT.PT_FSV / SUM.TOTAL_AMT * 100)
	   FROM CMS_PRT_PROPERTY_BY_BU_SUM SUM
	   WHERE RPT.COUNTRY = SUM.COUNTRY);--		

END;

----------------------------------------------------------------------
-- Procedure to populate the data for the report table
----------------------------------------------------------------------

DROP PROCEDURE POPULATE_PROPERTY_DETAILS_BY_BU;

CREATE PROCEDURE POPULATE_PROPERTY_DETAILS_BY_BU
LANGUAGE SQL
SPECIFIC POPULATE_PROPERTY_DETAILS_BY_BU 
BEGIN ATOMIC                

	INSERT INTO CMS_RPT_PROPERTY_BY_BU (BUSINESS_UNIT, COUNTRY, TOTAL_AMT_BY_BU)
    SELECT LLP_SEGMENT_CODE_VALUE, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FROM VW_PROPERTY_BY_FIRST_BU VW
    GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY;--

	INSERT INTO CMS_PRT_PROPERTY_BY_BU_SUM(COUNTRY, TOTAL_AMT)
	SELECT COUNTRY, SUM(TOTAL_AMT_BY_BU) FROM CMS_RPT_PROPERTY_BY_BU
	GROUP BY COUNTRY;--

    UPDATE CMS_RPT_PROPERTY_BY_BU RPT SET AGRICULTURE_FSV = 
    (SELECT SUBTYPE.FSV 
    FROM 
        (SELECT LLP_SEGMENT_CODE_VALUE BU, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FSV
         FROM VW_PROPERTY_BY_FIRST_BU VW
         WHERE SECURITY_SUB_TYPE_ID = 'PT700'
         GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY) SUBTYPE
     WHERE RPT.BUSINESS_UNIT = SUBTYPE.BU
	 AND RPT.COUNTRY = SUBTYPE.COUNTRY);--

    UPDATE CMS_RPT_PROPERTY_BY_BU RPT SET COMMERCIALGENERAL_FSV = 
    (SELECT SUBTYPE.FSV 
    FROM 
        (SELECT LLP_SEGMENT_CODE_VALUE BU, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FSV
         FROM VW_PROPERTY_BY_FIRST_BU VW
         WHERE SECURITY_SUB_TYPE_ID = 'PT701'
         GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY) SUBTYPE
     WHERE RPT.BUSINESS_UNIT = SUBTYPE.BU
	 AND RPT.COUNTRY = SUBTYPE.COUNTRY);--

    UPDATE CMS_RPT_PROPERTY_BY_BU RPT SET COMMERCIALSHOPHOUSE_FSV = 
    (SELECT SUBTYPE.FSV 
    FROM 
        (SELECT LLP_SEGMENT_CODE_VALUE BU, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FSV
         FROM VW_PROPERTY_BY_FIRST_BU VW
         WHERE SECURITY_SUB_TYPE_ID = 'PT702'
         GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY) SUBTYPE
     WHERE RPT.BUSINESS_UNIT = SUBTYPE.BU
	 AND RPT.COUNTRY = SUBTYPE.COUNTRY);--

	 
    UPDATE CMS_RPT_PROPERTY_BY_BU RPT SET INDUSTRIAL_FSV = 
    (SELECT SUBTYPE.FSV 
    FROM 
        (SELECT LLP_SEGMENT_CODE_VALUE BU, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FSV
         FROM VW_PROPERTY_BY_FIRST_BU VW
         WHERE SECURITY_SUB_TYPE_ID = 'PT703'
         GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY) SUBTYPE
     WHERE RPT.BUSINESS_UNIT = SUBTYPE.BU
	 AND RPT.COUNTRY = SUBTYPE.COUNTRY);--


    UPDATE CMS_RPT_PROPERTY_BY_BU RPT SET RESIDENTIAL_FSV = 
    (SELECT SUBTYPE.FSV 
    FROM 
        (SELECT LLP_SEGMENT_CODE_VALUE BU, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FSV
         FROM VW_PROPERTY_BY_FIRST_BU VW
         WHERE SECURITY_SUB_TYPE_ID = 'PT704'
         GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY) SUBTYPE
     WHERE RPT.BUSINESS_UNIT = SUBTYPE.BU
	 AND RPT.COUNTRY = SUBTYPE.COUNTRY);--


    UPDATE CMS_RPT_PROPERTY_BY_BU RPT SET SP_HOTEL_FSV = 
    (SELECT SUBTYPE.FSV 
    FROM 
        (SELECT LLP_SEGMENT_CODE_VALUE BU, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FSV
         FROM VW_PROPERTY_BY_FIRST_BU VW
         WHERE SECURITY_SUB_TYPE_ID = 'PT706'
         GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY) SUBTYPE
     WHERE RPT.BUSINESS_UNIT = SUBTYPE.BU
	 AND RPT.COUNTRY = SUBTYPE.COUNTRY);--


    UPDATE CMS_RPT_PROPERTY_BY_BU RPT SET SP_OTHERS_FSV = 
    (SELECT SUBTYPE.FSV 
    FROM 
        (SELECT LLP_SEGMENT_CODE_VALUE BU, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FSV
         FROM VW_PROPERTY_BY_FIRST_BU VW
         WHERE SECURITY_SUB_TYPE_ID = 'PT709'
         GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY) SUBTYPE
     WHERE RPT.BUSINESS_UNIT = SUBTYPE.BU
	 AND RPT.COUNTRY = SUBTYPE.COUNTRY);--


    UPDATE CMS_RPT_PROPERTY_BY_BU RPT SET VACANTLAND_FSV = 
    (SELECT SUBTYPE.FSV 
    FROM 
        (SELECT LLP_SEGMENT_CODE_VALUE BU, COUNTRY, SUM(CONVERT_AMT(FSV_BALANCE, FSV_BALANCE_CCY, 'MYR')) FSV
         FROM VW_PROPERTY_BY_FIRST_BU VW
         WHERE SECURITY_SUB_TYPE_ID = 'PT708'
         GROUP BY LLP_SEGMENT_CODE_VALUE, COUNTRY) SUBTYPE
     WHERE RPT.BUSINESS_UNIT = SUBTYPE.BU
	 AND RPT.COUNTRY = SUBTYPE.COUNTRY);--
	 
	 
	UPDATE CMS_RPT_PROPERTY_BY_BU RPT
	SET (AGRICULTURE_PERCENT_FOR_BU, COMMGENERAL_PERCENT_FOR_BU, 
		 COMMSHOPHOUSE_PERCENT_FOR_BU, INDUSTRIAL_PERCENT_FOR_BU, 
		 RESIDENTIAL_PERCENT_FOR_BU, SP_HOTEL_PERCENT_FOR_BU,
		SP_OTHERS_PERCENT_FOR_BU, VACANTLAND_PERCENT_FOR_BU)
	= (SELECT (RPT.AGRICULTURE_FSV / SUM.TOTAL_AMT * 100), (RPT.COMMERCIALGENERAL_FSV / SUM.TOTAL_AMT * 100), 
	   (RPT.COMMERCIALSHOPHOUSE_FSV / SUM.TOTAL_AMT * 100), (RPT.INDUSTRIAL_FSV / SUM.TOTAL_AMT * 100), 
	   (RPT.RESIDENTIAL_FSV / SUM.TOTAL_AMT * 100), (RPT.SP_HOTEL_FSV / SUM.TOTAL_AMT * 100), 
	   (RPT.SP_OTHERS_FSV / SUM.TOTAL_AMT * 100), (RPT.VACANTLAND_FSV / SUM.TOTAL_AMT * 100)
	   FROM CMS_PRT_PROPERTY_BY_BU_SUM SUM
	   WHERE RPT.COUNTRY = SUM.COUNTRY);--  
		
	 
END;


---------------------------------- Marketable Security Valuation Related Procedures --------------------------------

DROP PROCEDURE UPDATE_MKT_SEC_VAL_RUNNING_DAILY_TOTAL;

CREATE PROCEDURE UPDATE_MKT_SEC_VAL_RUNNING_DAILY_TOTAL 
    (IN BRANCH              VARCHAR(40),
     IN VAL_DATE            DATE,
     IN MTHS_TO_ACCUMULATE  SMALLINT)
LANGUAGE SQL
SPECIFIC UPDATE_MKT_SEC_VAL_RUNNING_DAILY_TOTAL
BEGIN ATOMIC

    IF(IS_WORKING_DAY(VAL_DATE, BRANCH)='Y') THEN 
        update CMS_VALUATION_MKT_SEC_SUMMARY mktSec
        set (RUNNING_DAILY_TOTAL, DAYS_FOR_DAILY_TOTAL, END_DATE_OF_TOTAL)
        = (select (mktSec.RUNNING_DAILY_TOTAL + feed.UNIT_PRICE), (mktSec.DAYS_FOR_DAILY_TOTAL + 1), (CURRENT DATE)
            from CMS_PRICE_FEED feed
            where mktSec.TICKER = feed.TICKER
            and feed.TYPE = '001'       --shares only
            and DATE(feed.LAST_UPDATED_DATE) = VAL_DATE)
        where mktSec.END_DATE_OF_TOTAL < VAL_DATE
        and exists (select 1 from CMS_PRICE_FEED feed2
                    where mktSec.TICKER = feed2.TICKER
                    and feed2.TYPE = '001'  
                    and DATE(feed2.LAST_UPDATED_DATE) = VAL_DATE);--
    END IF;--

    UPDATE CMS_VALUATION_MKT_SEC_SUMMARY MKTSEC
    SET (RUNNING_DAILY_TOTAL, DAYS_FOR_DAILY_TOTAL, START_DATE_OF_TOTAL)
    = (SELECT (MKTSEC.RUNNING_DAILY_TOTAL + HISTORY.UNIT_PRICE), (MKTSEC.DAYS_FOR_DAILY_TOTAL - 1), (MKTSEC.START_DATE_OF_TOTAL - 1 DAY)
       FROM CMS_PRICE_FEED_HISTORY HISTORY
       WHERE HISTORY_ID = (SELECT MAX(HISTORY_ID) FROM CMS_PRICE_FEED_HISTORY HISTORY2
                           WHERE MKTSEC.TICKER = HISTORY2.TICKER
                           AND HISTORY2.TYPE = '001'
                           AND MKTSEC.START_DATE_OF_TOTAL = DATE(HISTORY2.LAST_UPDATED_DATE) ))
    WHERE  MONTH(END_DATE_OF_TOTAL - START_DATE_OF_TOTAL) >= MTHS_TO_ACCUMULATE
    AND IS_WORKING_DAY(START_DATE_OF_TOTAL, BRANCH) = 'Y'
    AND END_DATE_OF_TOTAL < VAL_DATE
    AND EXISTS (SELECT 1 FROM CMS_PRICE_FEED_HISTORY HISTORY
                WHERE HISTORY_ID = (SELECT MAX(HISTORY_ID) FROM CMS_PRICE_FEED_HISTORY HISTORY3
                                    WHERE MKTSEC.TICKER = HISTORY3.TICKER
                                    AND HISTORY3.TYPE = '001'
                                    AND MKTSEC.START_DATE_OF_TOTAL = DATE(HISTORY3.LAST_UPDATED_DATE)));--
    
END;

DROP PROCEDURE UPDATE_MKT_SEC_VAL_RUNNING_MTHLY_TOTAL;

CREATE PROCEDURE UPDATE_MKT_SEC_VAL_RUNNING_MTHLY_TOTAL 
    (IN BRANCH              VARCHAR(40),
     IN VAL_DATE            DATE,
     IN MTHS_TO_ACCUMULATE  SMALLINT)
LANGUAGE SQL
SPECIFIC UPDATE_MKT_SEC_VAL_RUNNING_MTHLY_TOTAL
BEGIN ATOMIC

    IF(IS_LAST_WORKING_DAY_OF_MONTH(VAL_DATE, BRANCH)='Y') THEN 
    
        UPDATE CMS_VALUATION_MKT_SEC_SUMMARY MKTSEC
        SET (RUNNING_MONTH_END_TOTAL, MONTHS_FOR_MONTH_END_TOTAL)
        = (SELECT (MKTSEC.RUNNING_MONTH_END_TOTAL + FEED.UNIT_PRICE), (MKTSEC.MONTHS_FOR_MONTH_END_TOTAL + 1)
            FROM CMS_PRICE_FEED FEED
            WHERE MKTSEC.TICKER = FEED.TICKER
            AND FEED.TYPE='001'
            AND DATE(FEED.LAST_UPDATED_DATE) = VAL_DATE)
        WHERE MONTHS_FOR_MONTH_END_TOTAL < MTHS_TO_ACCUMULATE
        AND END_DATE_OF_TOTAL < VAL_DATE
        AND EXISTS (SELECT 1 FROM CMS_PRICE_FEED FEED2
                    WHERE MKTSEC.TICKER = FEED2.TICKER
                    AND FEED2.TYPE='001'
                    AND DATE(FEED2.LAST_UPDATED_DATE) = VAL_DATE);--

        UPDATE CMS_VALUATION_MKT_SEC_SUMMARY MKTSEC
        SET (RUNNING_MONTH_END_TOTAL)
        = (SELECT (MKTSEC.RUNNING_DAILY_TOTAL + FD.UNIT_PRICE - HISTORY.UNIT_PRICE)
         FROM CMS_PRICE_FEED_HISTORY HISTORY, CMS_PRICE_FEED FD
         WHERE HISTORY_ID = (SELECT MAX(HISTORY_ID) FROM CMS_PRICE_FEED_HISTORY HISTORY2
                             WHERE MKTSEC.TICKER = HISTORY2.TICKER
                             AND HISTORY2.TYPE = '001'
                             AND MKTSEC.START_DATE_OF_TOTAL = DATE(HISTORY2.LAST_UPDATED_DATE) ))
        WHERE  MONTHS_FOR_MONTH_END_TOTAL >= MTHS_TO_ACCUMULATE
        AND END_DATE_OF_TOTAL < VAL_DATE
        AND EXISTS (SELECT 1 FROM CMS_PRICE_FEED_HISTORY HISTORY
                    WHERE HISTORY_ID = (SELECT MAX(HISTORY_ID) FROM CMS_PRICE_FEED_HISTORY HISTORY3
                                        WHERE MKTSEC.TICKER = HISTORY3.TICKER
                                        AND HISTORY3.TYPE = '001'
                                        AND MKTSEC.START_DATE_OF_TOTAL = DATE(HISTORY3.LAST_UPDATED_DATE)));--
    
    END IF;--
    
END;

DROP PROCEDURE INSERT_NEW_MKT_SEC_VAL_SUMMARY;

CREATE PROCEDURE INSERT_NEW_MKT_SEC_VAL_SUMMARY 
    (IN BRANCH              VARCHAR(40),
     IN VAL_DATE            DATE)
LANGUAGE SQL
SPECIFIC INSERT_NEW_MKT_SEC_VAL_SUMMARY
BEGIN ATOMIC

    IF(IS_WORKING_DAY(VAL_DATE, BRANCH)='Y') THEN 
        INSERT INTO CMS_VALUATION_MKT_SEC_SUMMARY 
        (TICKER, BOARD_TYPE, RUNNING_TOTAL_CURRENCY, RUNNING_DAILY_TOTAL, DAYS_FOR_DAILY_TOTAL, RUNNING_MONTH_END_TOTAL, MONTHS_FOR_MONTH_END_TOTAL, START_DATE_OF_TOTAL, END_DATE_OF_TOTAL)
        SELECT TICKER, BOARD_TYPE, CURRENCY, UNIT_PRICE, 1, 0, 0, VAL_DATE, VAL_DATE
        FROM CMS_PRICE_FEED FD
        WHERE DATE(FD.LAST_UPDATED_DATE) = VAL_DATE
        AND FD.TYPE = '001'
        AND NOT EXISTS 
            (SELECT 1 FROM CMS_VALUATION_MKT_SEC_SUMMARY MKTSEC
             WHERE FD.TICKER = MKTSEC.TICKER);--
    END IF;--
    
END;

DROP PROCEDURE UPDATE_MKT_SEC_VAL_SUMMARY;

CREATE PROCEDURE UPDATE_MKT_SEC_VAL_SUMMARY 
LANGUAGE SQL
SPECIFIC UPDATE_MKT_SEC_VAL_SUMMARY
BEGIN ATOMIC

    --Constants: branch 18 = KL Main Branch; Number of months = 6
    DECLARE VAL_DATE                    DATE;--
    DECLARE BRANCH_FOR_WORKING_DAYS     VARCHAR(40) DEFAULT '18';--
    DECLARE MTHS_TO_ACCUMULATE_SUMMARY  INT         DEFAULT 6;--

    SET VAL_DATE = CURRENT DATE;--

    CALL UPDATE_MKT_SEC_VAL_RUNNING_DAILY_TOTAL(BRANCH_FOR_WORKING_DAYS, VAL_DATE, MTHS_TO_ACCUMULATE_SUMMARY);--
    CALL INSERT_NEW_MKT_SEC_VAL_SUMMARY(BRANCH_FOR_WORKING_DAYS, VAL_DATE);--
    CALL UPDATE_MKT_SEC_VAL_RUNNING_MTHLY_TOTAL(BRANCH_FOR_WORKING_DAYS, VAL_DATE, MTHS_TO_ACCUMULATE_SUMMARY);--
    
END;

	
COMMIT WORK;
