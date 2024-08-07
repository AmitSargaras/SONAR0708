--  SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM, EONCMS_LOCAL@

DROP PROCEDURE SI_RUN_TEMP_SIBS_CU001@
DROP PROCEDURE SI_RUN_TEMP_SIBS_CU003@
DROP PROCEDURE SI_RUN_TEMP_SIBS_CA001@
DROP PROCEDURE SI_RUN_TEMP_SIBS_CA004@
DROP PROCEDURE SI_RUN_TEMP_SIBS_CO001@
DROP PROCEDURE SI_RUN_TEMP_SIBS_CO002@
DROP PROCEDURE SI_RUN_ALL_SIBS@



 --------------------------------------
 -- * START OF -> SIBS data feed file
 -- * Customer Information CU001
 --------------------------------------
CREATE PROCEDURE SI_RUN_TEMP_SIBS_CU001
   LANGUAGE SQL
   BEGIN
     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CU001', 'SIBS', 1);
     commit;

    ---------------------------
    -- * Begin update 
    -- * SCI_LE_MAIN_PROFILE
    ---------------------------
     update SCI_LE_MAIN_PROFILE set
    (LMP_LE_ID,
      LMP_LONG_NAME,
      LMP_SHORT_NAME,
      LMP_LEGAL_CONST_VALUE,
      LMP_INC_CNTRY_ISO_CODE,
      LMP_INC_DATE,
      -- LMP_TYPE_VALUE,
      LMP_TYPE_NUM,
      LMP_REL_START_DATE,
      LMP_INC_NUM_TEXT,
      LMP_ID_NUMBER,
      LMP_ID_TYPE_VALUE,
      LMP_ID_TYPE_NUM,
      LMP_SECOND_ID_TYPE_NUM,
      LMP_SECOND_ID_TYPE_VALUE,
      LMP_ID_OLD_NUM,
      LMP_LANG_CODE_NUM,
      LMP_LANG_CODE_VALUE,
      -- SOURCE_ID,
      UPDATE_STATUS_IND)=
    (SELECT CIF_ID, 
      CUST_NAME_L, 
      CUST_NAME_S, 
      CUST_CLASS_CODE, 
      ID_ISSUE_COUNTRY,
      ID_ISSUE_DATE, 
      -- CUST_TYPE,
      CUST_TYPE_CAT,
      CUST_START_DATE, 
      ID_NUMBER,
      ID_NUMBER,
      ID_TYPE_CODE,
      ID_TYPE_CAT,
      t.SECONDARY_ID_TYPE_CAT,
      t.SECONDARY_ID_TYPE_CODE,
      SECONDARY_ID_NUMBER, 
      language_cat,
      language_code,
      -- 'SIBS',
      'U'
    FROM SI_TEMP_SIBS_CU001 t WHERE SOURCE_ID='SIBS' and LMP_LE_ID=t.CIF_ID AND is_valid = 'Y'
    --					AND (UPDATE_STATUS_IND is null OR
    --					UPDATE_STATUS_IND <> 'D')
                           		) 
    where EXISTS 
      (SELECT 1 FROM SI_TEMP_SIBS_CU001
        WHERE SOURCE_ID='SIBS' and CIF_ID=LMP_LE_ID AND is_valid = 'Y'
    --    AND (UPDATE_STATUS_IND is null OR
    --    	UPDATE_STATUS_IND <> 'D')
        	);
    commit;

     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CU001', 'SIBS', 2);
    commit;
    --------------------------
    -- * Begin update 
    -- * SCI_LE_SUB_PROFILE
    -- *
    --------------------------
     update SCI_LE_SUB_PROFILE b set 
    (
      LSP_ID,
      LSP_LE_ID,
      LSP_SHORT_NAME,
      LSP_DMCL_CNTRY_ISO_CODE,
      LSP_LANG_CODE_NUM,
      LSP_LANG_CODE_VALUE,
      CMS_LE_MAIN_PROFILE_ID,
      CMS_SUB_ORIG_COUNTRY,
      UPDATE_STATUS_IND)=
    (SELECT
      1,
      lmp_le_id, 
      lmp_short_name, 
      lmp_inc_cntry_iso_code,
      a.LMP_LANG_CODE_NUM,
      a.LMP_LANG_CODE_VALUE,
      a.cms_le_main_profile_id,
      'MY',
      'U'
    FROM SCI_LE_MAIN_PROFILE a 
    where a.CMS_LE_MAIN_PROFILE_ID=b.CMS_LE_MAIN_PROFILE_ID)
    WHERE EXISTS (select 1 
      from SI_TEMP_SIBS_CU001 t, SCI_LE_MAIN_PROFILE a 
      where a.CMS_LE_MAIN_PROFILE_ID=b.CMS_LE_MAIN_PROFILE_ID 
      and a.SOURCE_ID='SIBS' 
      and a.LMP_LE_ID=t.CIF_ID 
      AND t.is_valid = 'Y');
    commit;  
    
     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CU001', 'SIBS', 3);
    commit;
    ------------------------------------
    -- Begin update 
    -- SCI_LE_REG_ADDR
    -- primary address 
    --
    ------------------------------------
    update SCI_LE_REG_ADDR b set 
    (
      LRA_ID,
      LRA_LE_ID,
      LRA_TYPE_NUM,
      LRA_TYPE_VALUE,
      LRA_ADDR_LINE_1,
      LRA_ADDR_LINE_2,
      LRA_CITY_TEXT,
      LRA_STATE,
      LRA_POST_CODE,
      LRA_CNTRY_ISO_CODE,
      CMS_LE_MAIN_PROFILE_ID,
      UPDATE_STATUS_IND)=
    (SELECT
      1,
      CIF_ID, 
      PRIMARY_ADD_TYPE_CAT,
      PRIMARY_ADD_TYPE_CODE,
      PRIMARY_ADD_1,
      PRIMARY_ADD_2,
      PRIMARY_ADD_3,
      PRIMARY_ADD_4,
      PRIMARY_POSTCODE,
      PRIMARY_COUNTRY,
      a.cms_le_main_profile_id,
      'U'
    FROM SI_TEMP_SIBS_CU001 t inner join SCI_LE_MAIN_PROFILE a 
      on a.LMP_LE_ID=t.CIF_ID
      -- WLS: only update when address type code is not empty
      where a.CMS_LE_MAIN_PROFILE_ID = b.CMS_LE_MAIN_PROFILE_ID 
      and length(t.PRIMARY_ADD_TYPE_CODE)>0
      and t.PRIMARY_ADD_TYPE_CODE = b.LRA_TYPE_VALUE 
      AND t.is_valid = 'Y'
      and a.source_id = 'SIBS'
      FETCH FIRST 1 ROW ONLY   )
    WHERE EXISTS (select 1 from SI_TEMP_SIBS_CU001 t inner join SCI_LE_MAIN_PROFILE a 
                on a.LMP_LE_ID=t.CIF_ID
                -- WLS: only update when address type code is not empty
                where a.CMS_LE_MAIN_PROFILE_ID = b.CMS_LE_MAIN_PROFILE_ID
                and length(t.PRIMARY_ADD_TYPE_CODE)>0
                and t.PRIMARY_ADD_TYPE_CODE = b.LRA_TYPE_VALUE
                AND t.is_valid = 'Y'
                and a.source_id = 'SIBS');
    
     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CU001', 'SIBS', 4);
    commit;
    ------------------------------------
    -- Begin insert 
    -- SCI_LE_REG_ADDR
    -- primary address
    --
    ------------------------------------
    insert into SCI_LE_REG_ADDR
    (CMS_LE_REG_ADDR_ID,
      LRA_ID,
      LRA_LE_ID,
      LRA_TYPE_NUM,
      LRA_TYPE_VALUE,
      LRA_ADDR_LINE_1,
      LRA_ADDR_LINE_2,
      LRA_CITY_TEXT,
      LRA_STATE,
      LRA_POST_CODE,
      LRA_CNTRY_ISO_CODE,
      CMS_LE_MAIN_PROFILE_ID,
      UPDATE_STATUS_IND)
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CONTACT_SEQ), 2)) as BIGINT), 
      1,
      CIF_ID, 
      PRIMARY_ADD_TYPE_CAT,
      PRIMARY_ADD_TYPE_CODE,
      PRIMARY_ADD_1,
      PRIMARY_ADD_2,
      PRIMARY_ADD_3,
      PRIMARY_ADD_4,
      PRIMARY_POSTCODE,
      PRIMARY_COUNTRY,
      a.CMS_LE_MAIN_PROFILE_ID,
      'I'
    FROM SI_TEMP_SIBS_CU001 t inner join SCI_LE_MAIN_PROFILE a 
    on a.LMP_LE_ID=t.CIF_ID
    -- WLS: only update when address type code is not empty
    where a.source_id = 'SIBS'
    and length(t.PRIMARY_ADD_TYPE_CODE)>0
    and NOT EXISTS 
      (SELECT 1 FROM SCI_LE_REG_ADDR b
        WHERE b.CMS_LE_MAIN_PROFILE_ID = a.CMS_LE_MAIN_PROFILE_ID
        --and b.LRA_LE_ID=t.CIF_ID 
        and t.PRIMARY_ADD_TYPE_CODE=b.LRA_TYPE_VALUE)
    AND is_valid = 'Y');
    commit;
    
     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CU001', 'SIBS', 5);
    commit;
    ------------------------------------
    -- Begin update 
    -- SCI_LE_REG_ADDR
    -- secondary address 
    --
    ------------------------------------
    update SCI_LE_REG_ADDR b set 
    (
      LRA_ID,
      LRA_LE_ID,
      LRA_TYPE_NUM,
      LRA_TYPE_VALUE,
      LRA_ADDR_LINE_1,
      LRA_ADDR_LINE_2,
      LRA_CITY_TEXT,
      LRA_STATE,
      LRA_POST_CODE,
      LRA_CNTRY_ISO_CODE,
      CMS_LE_MAIN_PROFILE_ID,
      UPDATE_STATUS_IND)=
    (SELECT
      1,
      CIF_ID, 
      SECONDARY_ADD_TYPE_CAT,
      SECONDARY_ADD_TYPE_CODE,
      SECONDARY_ADD_1,
      SECONDARY_ADD_2,
      SECONDARY_ADD_3,
      SECONDARY_ADD_4,
      SECONDARY_POSTCODE,
      PRIMARY_COUNTRY,
      a.CMS_LE_MAIN_PROFILE_ID,
      'U'
    FROM SI_TEMP_SIBS_CU001 t inner join SCI_LE_MAIN_PROFILE a 
      on a.LMP_LE_ID=t.CIF_ID 
      -- WLS: only update when address type code is not empty
      where a.source_id = 'SIBS'
      and a.CMS_LE_MAIN_PROFILE_ID = b.CMS_LE_MAIN_PROFILE_ID 
      and length(t.SECONDARY_ADD_TYPE_CODE)>0
      and t.SECONDARY_ADD_TYPE_CODE= b.LRA_TYPE_VALUE 
      and a.LMP_LE_ID=t.CIF_ID 
      AND t.is_valid = 'Y')
    WHERE EXISTS (select 1 from SI_TEMP_SIBS_CU001 t inner join SCI_LE_MAIN_PROFILE a 
      on a.LMP_LE_ID=t.CIF_ID
      -- WLS: only update when address type code is not empty
      where a.SOURCE_ID='SIBS' 
      and a.CMS_LE_MAIN_PROFILE_ID = b.CMS_LE_MAIN_PROFILE_ID 
      and length(t.SECONDARY_ADD_TYPE_CODE)>0
      and t.SECONDARY_ADD_TYPE_CODE = b.LRA_TYPE_VALUE 
      and a.LMP_LE_ID=t.CIF_ID 
      AND t.is_valid = 'Y');
    commit;   
    
     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CU001', 'SIBS', 6);
    commit;
    ------------------------------------
    -- Begin insert 
    -- SCI_LE_REG_ADDR
    -- secondary address
    -- 
    ------------------------------------
    insert into SCI_LE_REG_ADDR
    (CMS_LE_REG_ADDR_ID,
      LRA_ID,
      LRA_LE_ID,
      LRA_TYPE_NUM,
      LRA_TYPE_VALUE,
      LRA_ADDR_LINE_1,
      LRA_ADDR_LINE_2,
      LRA_CITY_TEXT,
      LRA_STATE,
      LRA_POST_CODE,
      LRA_CNTRY_ISO_CODE,
      CMS_LE_MAIN_PROFILE_ID,
      UPDATE_STATUS_IND)
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CONTACT_SEQ), 2)) as BIGINT), 
      1,
      CIF_ID, 
      SECONDARY_ADD_TYPE_CAT,
      SECONDARY_ADD_TYPE_CODE,
      SECONDARY_ADD_1,
      SECONDARY_ADD_2,
      SECONDARY_ADD_3,
      SECONDARY_ADD_4,
      SECONDARY_POSTCODE,
      PRIMARY_COUNTRY,
      a.CMS_LE_MAIN_PROFILE_ID,
      'I'
    FROM SI_TEMP_SIBS_CU001 t inner join SCI_LE_MAIN_PROFILE a 
    on a.LMP_LE_ID=t.CIF_ID
    -- WLS: only update when address type code is not empty
    where a.source_id = 'SIBS'
    and length(t.SECONDARY_ADD_TYPE_CODE)>0
    and NOT EXISTS 
      (SELECT 1 FROM SCI_LE_REG_ADDR b
        WHERE b.CMS_LE_MAIN_PROFILE_ID = a.CMS_LE_MAIN_PROFILE_ID
          and t.SECONDARY_ADD_TYPE_CODE = b.LRA_TYPE_VALUE) 
    AND is_valid = 'Y');
    commit;
    
     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CU001', 'SIBS', 7);
    commit;
    ------------------------------------
    -- Begin update 
    -- sci_le_isic_dtl
    -- 
    --
    ------------------------------------
     update sci_le_isic_dtl b set 
    (
      LID_ID,
      LID_LE_ID,
      LID_ISIC_TYPE_NUM,
      LID_ISIC_TYPE_VALUE,
      LID_ISIC_CODE_NUM,
      LID_ISIC_CODE_VALUE,
      CMS_LE_MAIN_PROFILE_ID,
      UPDATE_STATUS_IND)=
    (SELECT
      1,
      CIF_ID,
      '15',
      'ISIC',
      ISIC_CAT,
      ISIC_CODE,
      a.cms_le_main_profile_id,
      'U'
    FROM SI_TEMP_SIBS_CU001 t, SCI_LE_MAIN_PROFILE a 
      where a.CMS_LE_MAIN_PROFILE_ID = b.CMS_LE_MAIN_PROFILE_ID 
      and a.SOURCE_ID='SIBS' 
      and a.LMP_LE_ID=t.CIF_ID 
      AND t.is_valid = 'Y'
      and length(t.ISIC_CODE)>0)
    WHERE EXISTS (select 1 from SI_TEMP_SIBS_CU001 t, SCI_LE_MAIN_PROFILE a 
      where a.CMS_LE_MAIN_PROFILE_ID = b.CMS_LE_MAIN_PROFILE_ID 
      and a.SOURCE_ID='SIBS' 
      and a.LMP_LE_ID=t.CIF_ID 
      AND t.is_valid = 'Y'
      and length(ISIC_CODE) > 0);
    commit;  
    
     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CU001', 'SIBS', 8);
    commit;
    ------------------------------------
    -- Begin insert 
    -- sci_le_isic_dtl
    -- 
    ------------------------------------
     insert into sci_le_isic_dtl
    (CMS_LE_ISIC_DTL_ID,
      LID_ID,
      LID_LE_ID,
      LID_ISIC_TYPE_NUM,
      LID_ISIC_TYPE_VALUE,
      LID_ISIC_CODE_NUM,
      LID_ISIC_CODE_VALUE,
      CMS_LE_MAIN_PROFILE_ID,
      UPDATE_STATUS_IND)
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR ISIC_CODE_SEQ), 2)) as BIGINT), 
      1,
      CIF_ID,
      '15',
      'ISIC',
      ISIC_CAT,
      ISIC_CODE,
      a.cms_le_main_profile_id,
      'I'
    FROM SI_TEMP_SIBS_CU001 t, SCI_LE_MAIN_PROFILE a left outer join sci_le_isic_dtl b 
      on a.cms_le_main_profile_id = b.cms_le_main_profile_id
    where a.lmp_le_id = t.cif_id
    and a.source_id = 'SIBS'
    AND t.is_valid = 'Y'
    and length(t.ISIC_CODE)>0
    and b.cms_le_main_profile_id is null);
    commit;
    
    CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CU001', 'SIBS', 9);
    commit;
    
    ------------------------------------
    -- Begin update 
    -- CMS_FAC_RELATIONSHIP 
    -- CMS_STG_FAC_RELATIONSHIP
    --
    ------------------------------------
    DECLARE GLOBAL TEMPORARY TABLE SESSION.fac_relationship_cust_name (
      	act_fac_relationship_id BIGINT,
      	stg_fac_relationship_id BIGINT,
      	CUST_NAME VARCHAR(80)) 
    WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;
      
    insert into SESSION.fac_relationship_cust_name
      (act_fac_relationship_id, stg_fac_relationship_id, CUST_NAME)
      (select distinct f.ID, stgf.ID, t.CUST_NAME_L
       	from SI_TEMP_SIBS_CU001 t, CMS_FAC_RELATIONSHIP f, CMS_FACILITY_MASTER master, 
       	SCI_LSP_APPR_LMTS l, TRANSACTION trx, CMS_STG_FAC_RELATIONSHIP stgf  
       		where t.is_valid = 'Y'
       		and f.CIF_NUMBER = t.CIF_ID
       		and (f.STATUS is null or f.STATUS <> 'D')
		and (stgf.STATUS is null or stgf.STATUS <> 'D')
       		and master.ID = f.CMS_FAC_MASTER_ID
       		and master.CMS_LSP_APPR_LMTS_ID = l.CMS_LSP_APPR_LMTS_ID
		and l.SOURCE_ID in ('SIBS','RLOS')
		and trx.reference_id = master.ID
    		and trx.TRANSACTION_TYPE = 'FACILITY'
    		and trx.staging_reference_id = stgf.CMS_FAC_MASTER_ID
    		and f.CIF_NUMBER = stgf.CIF_NUMBER
       );
       
    COMMIT;   
    
    create index SESSION.idx_act_fac_relationship_id 
      	on SESSION.fac_relationship_cust_name(act_fac_relationship_id)
    allow reverse scans;
    
    create index SESSION.idx_stg_fac_relationship_id 
          	on SESSION.fac_relationship_cust_name(stg_fac_relationship_id)
    allow reverse scans;
    
    COMMIT;
    
    
    update CMS_FAC_RELATIONSHIP f set (f.CUSTOMER_NAME)=
    (SELECT CUST_NAME
    	FROM SESSION.fac_relationship_cust_name
     	where f.ID = act_fac_relationship_id)
    WHERE EXISTS (SELECT 1 FROM SESSION.fac_relationship_cust_name
     			where f.ID = act_fac_relationship_id); 
    COMMIT; 
    
    update CMS_STG_FAC_RELATIONSHIP f set (f.CUSTOMER_NAME)=
    (SELECT CUST_NAME
      	FROM SESSION.fac_relationship_cust_name
       	where f.ID = stg_fac_relationship_id)
    WHERE EXISTS (SELECT 1 FROM SESSION.fac_relationship_cust_name
       			where f.ID = stg_fac_relationship_id); 
    COMMIT;
    
    
    DROP TABLE SESSION.fac_relationship_cust_name;
    COMMIT;
    
    
    -- update CMS_FAC_RELATIONSHIP f set (f.CUSTOMER_NAME)=
    -- 	(SELECT t.CUST_NAME_L
    -- 		FROM SI_TEMP_SIBS_CU001 t
    -- 	  	where f.CIF_NUMBER=t.CIF_ID 
    -- 	  	AND t.is_valid = 'Y')
    -- WHERE EXISTS (select 1
    -- 			FROM SI_TEMP_SIBS_CU001 t1
    -- 	  		where f.CIF_NUMBER=t1.CIF_ID 
    -- 	  		AND t1.is_valid = 'Y')
    -- AND EXISTS (select 1 from CMS_FACILITY_MASTER master, SCI_LSP_APPR_LMTS l
    -- 		where master.ID = f.CMS_FAC_MASTER_ID
    -- 		and master.CMS_LSP_APPR_LMTS_ID = l.CMS_LSP_APPR_LMTS_ID
    -- 		and l.SOURCE_ID in ('SIBS','RLOS'));
    -- commit;
        
    -- update CMS_STG_FAC_RELATIONSHIP f set (f.CUSTOMER_NAME)=
    -- 	(SELECT t.CUST_NAME_L
    -- 		FROM SI_TEMP_SIBS_CU001 t
    -- 	  	where f.CIF_NUMBER=t.CIF_ID 
    -- 	  	AND t.is_valid = 'Y')
    -- WHERE EXISTS (select 1
    -- 			FROM SI_TEMP_SIBS_CU001 t1
    -- 	  		where f.CIF_NUMBER=t1.CIF_ID 
    -- 	  		AND t1.is_valid = 'Y')
    -- AND EXISTS (select 1 from CMS_STG_FACILITY_MASTER master, SCI_LSP_APPR_LMTS l, TRANSACTION trx
    -- 		where master.ID = f.CMS_FAC_MASTER_ID
    -- 		and trx.staging_reference_id = master.ID
    -- 		and trx.TRANSACTION_TYPE = 'FACILITY'
    -- 		and master.CMS_LSP_APPR_LMTS_ID = l.CMS_LSP_APPR_LMTS_ID
    -- 		and l.SOURCE_ID in ('SIBS','RLOS'));
    -- commit;
    
    CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CU001', 'SIBS', 10);
    commit;
        
    ------------------------------------
    -- Begin update 
    -- SCI_PLEDGOR_DTL 
    -- STAGE_PLEDGOR_DTL
    --
    ------------------------------------
    update SCI_PLEDGOR_DTL plg set (plg.PLG_LEGAL_NAME)=
        (SELECT t.CUST_NAME_L
        	FROM SI_TEMP_SIBS_CU001 t
          	where plg.PLG_LE_ID = t.CIF_ID 
          	AND t.is_valid = 'Y')
    WHERE EXISTS (select 1
        		FROM SI_TEMP_SIBS_CU001 t1
        	  	where plg.PLG_LE_ID=t1.CIF_ID 
        	  	AND t1.is_valid = 'Y')
    AND plg.PLG_LE_ID_SRC_VALUE = 'SIBS';
    commit;
    
    update STAGE_PLEDGOR_DTL plg set (plg.PLG_LEGAL_NAME)=
            (SELECT t.CUST_NAME_L
            	FROM SI_TEMP_SIBS_CU001 t
              	where plg.PLG_LE_ID = t.CIF_ID 
              	AND t.is_valid = 'Y')
        WHERE EXISTS (select 1
            		FROM SI_TEMP_SIBS_CU001 t1
            	  	where plg.PLG_LE_ID=t1.CIF_ID 
            	  	AND t1.is_valid = 'Y')
        AND plg.PLG_LE_ID_SRC_VALUE = 'SIBS';
    commit;    
    
    
    CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CU001', 'SIBS', 0);
    commit;

END@


 -- -----------------------------------
 -- * START OF -> SIBS data feed file
 -- * Customer Fusion CU003
 --------------------------------------
CREATE PROCEDURE SI_RUN_TEMP_SIBS_CU003
  LANGUAGE SQL
BEGIN
  DECLARE v_count INTEGER;

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CU003', 'SIBS', 1);
  commit;
  ------------------------------------
  -- Truncate CMS_BATCH_CIF_FUSION
  -- before insertion
  --
  -----------------------------------
  -- delete from CMS_BATCH_CIF_FUSION;
  -- commit;
  
  -------------------------------------
  -- Actual Table
  -- CMS_BATCH_CIF_FUSION
  --
  -------------------------------------

  INSERT INTO CMS_BATCH_CIF_FUSION (CMS_BATCH_CIF_FUSION_ID,
  OLD_LE_ID, NEW_LE_ID,
  SOURCE_ID, TIME_RECEIVED, PROCESSED_IND)
  (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_BATCH_CIF_FUSION_SEQ), 2)) as BIGINT),
           OLD_CIF_ID, NEW_CIF_ID,
           'SIBS', CURRENT_TIMESTAMP, 'N'
     FROM si_temp_SIBS_cu003 t
    WHERE is_valid = 'Y'
    AND NOT EXISTS (SELECT 1 FROM CMS_BATCH_CIF_FUSION fusion
    			WHERE fusion.OLD_LE_ID = OLD_CIF_ID
    			AND fusion.NEW_LE_ID = NEW_CIF_ID));
  commit;
  
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CU003', 'SIBS', 0);
  commit;
  
  -------------------------------------
    -- Process Customer Fusion
    -- Execute Customer Fusion Procedure
  -------------------------------------
  SELECT COUNT(*) INTO v_count FROM si_temp_SIBS_cu003 WHERE is_valid = 'Y';
  IF v_count > 0 THEN
      call SI_RUN_CUSTOMER_FUSION;
  END IF;

END@



 -- ---------------------------------------------------------
 -- * SIBS data feed file - Limit Info CA001,
 -- * please refer to SIBS CA003(limit)+CA004(limit account)
 -- *
 ------------------------------------------------------------
CREATE PROCEDURE SI_RUN_TEMP_SIBS_CA001
  LANGUAGE SQL
BEGIN

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 1);
  commit;
  -------------------------------------
  -- Actual Table
  -- SCI_LSP_APPR_LMTS
  -------------------------------------

  call si_runstats('si_temp_SIBS_ca001');
  
  DECLARE GLOBAL TEMPORARY TABLE SESSION.lmt_drawing_os_amt (
  	cms_act_lmt_id BIGINT,
  	cms_stg_lmt_id BIGINT,
  	cms_act_fac_id BIGINT,
  	cms_stg_fac_id BIGINT,
  	sum_drawing_lmt	decimal(20,2),
	sum_outstanding_amt	decimal(20,2)) 
  WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;
  
  insert into SESSION.lmt_drawing_os_amt
  (cms_act_lmt_id, cms_stg_lmt_id, sum_drawing_lmt, sum_outstanding_amt)
  (select cms_act_lmt_id, cms_stg_lmt_id, sum(drawing_limit_amt),
  	sum(cast(COALESCE(OUTSTANDING_SIGN, '+') || char(OUTSTANDING_AMT) as decimal(17,2))) 
   from si_temp_SIBS_ca001
   where is_valid = 'Y'
   group by cms_act_lmt_id, cms_stg_lmt_id);

  create index SESSION.idx_amt_act_lmt_id 
  	on SESSION.lmt_drawing_os_amt(cms_act_lmt_id)
  allow reverse scans;
  
  create index SESSION.idx_amt_stg_lmt_id 
  	on SESSION.lmt_drawing_os_amt(cms_stg_lmt_id)
  allow reverse scans;
  
  update SESSION.lmt_drawing_os_amt amt set cms_act_fac_id = (
  	select id from cms_facility_master 
  	where amt.cms_act_lmt_id = cms_lsp_appr_lmts_id);

  create index SESSION.idx_amt_act_fac_id 
  	on SESSION.lmt_drawing_os_amt(cms_act_fac_id)
  allow reverse scans;
  
  update SESSION.lmt_drawing_os_amt amt set cms_stg_fac_id = (
  	select staging_reference_id from transaction, cms_facility_master
  	where reference_id = id 
  	and amt.cms_act_lmt_id = cms_lsp_appr_lmts_id
  	and transaction_type = 'FACILITY');
  	
  create index SESSION.idx_amt_stg_fac_id 
  	on SESSION.lmt_drawing_os_amt(cms_stg_fac_id)
  allow reverse scans;

	update sci_lsp_appr_lmts lmts
	set (cms_activated_limit, cms_drawing_limit, CMS_OUTSTANDING_AMT) = 
		(select sum_drawing_lmt, sum_drawing_lmt, sum_outstanding_amt
		from SESSION.lmt_drawing_os_amt
		where lmts.cms_lsp_appr_lmts_id = cms_act_lmt_id)
	where exists 
		(select 1 from SESSION.lmt_drawing_os_amt 
		where cms_lsp_appr_lmts_id = cms_act_lmt_id);

	commit;

  -------------------------------------
  -- Staging Table
  -- STAGE_LIMIT
  --
  -------------------------------------

	update stage_limit lmts
	set (cms_activated_limit, cms_drawing_limit, CMS_OUTSTANDING_AMT) = 
		(select sum_drawing_lmt, sum_drawing_lmt, sum_outstanding_amt
		from SESSION.lmt_drawing_os_amt
		where lmts.cms_lsp_appr_lmts_id = cms_stg_lmt_id)
	where exists 
		(select 1 from SESSION.lmt_drawing_os_amt 
		where cms_lsp_appr_lmts_id = cms_stg_lmt_id);
		
	commit;
	-- facility master table, for the drawing limit

	update cms_facility_master fac
	set cms_drawing_limit = 
		(select sum_drawing_lmt from SESSION.lmt_drawing_os_amt
		  where fac.id = cms_act_fac_id)
	where exists 
		(select 1 from SESSION.lmt_drawing_os_amt 
		where fac.id = cms_act_fac_id);
	
	commit;		

	update cms_stg_facility_master fac
	set cms_drawing_limit = 
		(select sum_drawing_lmt from SESSION.lmt_drawing_os_amt
		  where fac.id = cms_stg_fac_id)
	where exists
		(select 1 from SESSION.lmt_drawing_os_amt 
		where fac.id = cms_stg_fac_id);
  
  DROP TABLE SESSION.lmt_drawing_os_amt;

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 2);
  commit;

  -----------------------------------------------------
  --  * Update/insertion of LIMIT - ACCOUNT information
  -----------------------------------------------------
  
  UPDATE SI_TEMP_SIBS_CA001
  SET HAS_ACCOUNT = 'Y'
  WHERE IS_VALID = 'Y'
  AND EXTERNAL_SYSTEM_ACCT_NO IS NOT NULL
  and external_system_acct_no <> '0000000000000000000'
  AND ACCT_SEQ IS NOT NULL;
  
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 3);
  commit;  
  
  UPDATE SI_TEMP_SIBS_CA001 T
  SET CMS_ACT_ACCT_ID = (SELECT CMS_LSP_SYS_XREF_ID
  		FROM SCI_LSP_SYS_XREF X
  		WHERE X.LSX_EXT_SYS_ACCT_NUM = T.EXTERNAL_SYSTEM_ACCT_NO
  		AND X.LSX_EXT_SYS_ACCT_SEQ = T.ACCT_SEQ)
  WHERE HAS_ACCOUNT = 'Y';
  
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 4);
  commit;  
    
  -------------------------------------
  -- Update/insertion table
  -- SCI_LSP_SYS_XREF
  --
  -------------------------------------
  -- lock table SCI_LSP_SYS_XREF in share mode;
  
  UPDATE SCI_LSP_SYS_XREF X
  SET (
  	LSX_BKG_LOCTN_CTRY,
  	LSX_BKG_LOCTN_ORG,
  	LSX_EXT_SYS_ACCT_TYPE,
  	UPDATE_STATUS_IND,
  	FIRST_DISBURSEMENT_DATE,
  	FINAL_DISBURSEMENT_DATE,
  	outstanding_amt_ccy,
  	cms_outstanding_amt)
  	=
	  (SELECT 
	  	LOC_COUNTRY,
	  	LOC_ORG_CODE,
	  	ACCT_TYPE,
	  	'U',
	  	T.FIRST_DISBURSEMENT_DATE,
	  	T.FINAL_DISBURSEMENT_DATE,
	  	'MYR',
	  	cast(COALESCE(OUTSTANDING_SIGN, '+') || char(OUTSTANDING_AMT) as decimal(17,2))
	   FROM SI_TEMP_SIBS_CA001 T
	   WHERE T.CMS_ACT_ACCT_ID = CMS_LSP_SYS_XREF_ID
	   AND T.HAS_ACCOUNT = 'Y'
	   fetch first 1 row only)
  WHERE EXISTS
  	(SELECT 1 FROM SI_TEMP_SIBS_CA001 T1
  	WHERE T1.CMS_ACT_ACCT_ID = CMS_LSP_SYS_XREF_ID
  	AND T1.HAS_ACCOUNT = 'Y');

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 5);
  commit;

  INSERT INTO SCI_LSP_SYS_XREF
  ( CMS_LSP_SYS_XREF_ID,
  LSX_EXT_SYS_CODE_VALUE,
  LSX_EXT_SYS_ACCT_NUM,
  LSX_LE_ID,
  CMS_LE_SUB_PROFILE_ID,
  LSX_BCA_REF_NUM,
  LSX_BKG_LOCTN_CTRY, 
  LSX_BKG_LOCTN_ORG,
  LSX_EXT_SYS_ACCT_TYPE,
  LSX_EXT_SYS_ACCT_SEQ,
  LSX_LSP_ID,
  ACCT_DELQ_IND,
  UPDATE_STATUS_IND,
  ACCT_STATUS,
  LSX_EXT_SYS_CODE_NUM,
  LSX_EXT_CTY_CODE_VALUE,
  FIRST_DISBURSEMENT_DATE,
  FINAL_DISBURSEMENT_DATE,
  outstanding_amt_ccy,
  cms_outstanding_amt	)
  (select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CUSTOMER_X_REF_SEQ), 2)) as BIGINT),
  'SIBS',
  t.EXTERNAL_SYSTEM_ACCT_NO,
  (SELECT pro.LLP_LE_ID FROM sci_lsp_lmt_profile pro
	WHERE pro.cms_lsp_lmt_profile_id = t.cms_act_lmt_profile_id
	--AND t.is_valid = 'Y'
	FETCH FIRST 1 ROW ONLY ),
  (select pf.cms_customer_id from sci_lsp_lmt_profile pf
	where pf.cms_lsp_lmt_profile_id = t.cms_act_lmt_profile_id
	--AND t.is_valid = 'Y'
	FETCH FIRST 1 ROW ONLY),
  t.AA_NUMBER,
  LOC_COUNTRY,
  LOC_ORG_CODE,
  ACCT_TYPE,
  ACCT_SEQ,
  1,
  'N',
  'I',
  'A',
  '37',
  LOC_COUNTRY,
  t.FIRST_DISBURSEMENT_DATE,
  t.FINAL_DISBURSEMENT_DATE,
  'MYR',
  cast(COALESCE(OUTSTANDING_SIGN, '+') || char(OUTSTANDING_AMT) as decimal(17,2))
  FROM 
  	(SELECT ROW_NUMBER() OVER(PARTITION BY EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ) ROWNUM,
  		EXTERNAL_SYSTEM_ACCT_NO, cms_act_lmt_profile_id, AA_NUMBER, LOC_COUNTRY,
  		LOC_ORG_CODE, ACCT_TYPE, ACCT_SEQ, FIRST_DISBURSEMENT_DATE, FINAL_DISBURSEMENT_DATE, 
  		OUTSTANDING_SIGN, OUTSTANDING_AMT
  	 FROM SI_TEMP_SIBS_CA001  
  	WHERE HAS_ACCOUNT = 'Y'
  	AND CMS_ACT_ACCT_ID IS NULL) T
  WHERE T.ROWNUM = 1);

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 6);
  commit;
  
  UPDATE SI_TEMP_SIBS_CA001 T
  SET CMS_STG_ACCT_ID = (SELECT CMS_LSP_SYS_XREF_ID
  	FROM CMS_STAGE_LSP_SYS_XREF X
  	WHERE X.LSX_EXT_SYS_ACCT_NUM = T.EXTERNAL_SYSTEM_ACCT_NO
  	AND X.LSX_EXT_SYS_ACCT_SEQ = T.ACCT_SEQ)
  WHERE HAS_ACCOUNT = 'Y';
  
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 7);
  commit;
    
  --- ------------------------------
  --  * Update/insertion table
  --  * CMS_STAGE_LSP_SYS_XREF
  --  *
  ----------------------------------
  
  
  UPDATE CMS_STAGE_LSP_SYS_XREF X
  SET (
  	LSX_BKG_LOCTN_CTRY,
  	LSX_BKG_LOCTN_ORG,
  	LSX_EXT_SYS_ACCT_TYPE,
  	UPDATE_STATUS_IND,
  	FIRST_DISBURSEMENT_DATE,
  	FINAL_DISBURSEMENT_DATE,
  	cms_outstanding_amt)
  	=
	  (SELECT 
	  	LOC_COUNTRY,
	  	LOC_ORG_CODE,
	  	ACCT_TYPE,
	  	'U',
	  	T.FIRST_DISBURSEMENT_DATE,
	  	T.FINAL_DISBURSEMENT_DATE,
	  	cast(COALESCE(OUTSTANDING_SIGN, '+') || char(OUTSTANDING_AMT) as decimal(17,2))
	   FROM SI_TEMP_SIBS_CA001 T
	   WHERE T.CMS_STG_ACCT_ID = CMS_LSP_SYS_XREF_ID
	   AND T.HAS_ACCOUNT = 'Y'
	   fetch first 1 row only)
  WHERE EXISTS
  	(SELECT 1 FROM SI_TEMP_SIBS_CA001 T1
  	WHERE T1.CMS_STG_ACCT_ID = CMS_LSP_SYS_XREF_ID
  	AND T1.HAS_ACCOUNT = 'Y');

    CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 8);
    commit;

  INSERT INTO CMS_STAGE_LSP_SYS_XREF(
  CMS_LSP_SYS_XREF_ID,
  LSX_EXT_SYS_CODE_VALUE,
  LSX_EXT_SYS_ACCT_NUM,
  LSX_LE_ID,
  CMS_LE_SUB_PROFILE_ID,
  LSX_BCA_REF_NUM,
  LSX_BKG_LOCTN_CTRY, 
  LSX_BKG_LOCTN_ORG,
  LSX_EXT_SYS_ACCT_TYPE,
  LSX_EXT_SYS_ACCT_SEQ,
  LSX_LSP_ID,
  ACCT_DELQ_IND,
  UPDATE_STATUS_IND,
  ACCT_STATUS,
  LSX_EXT_SYS_CODE_NUM,
  LSX_EXT_CTY_CODE_VALUE,
  FIRST_DISBURSEMENT_DATE,
  FINAL_DISBURSEMENT_DATE,  
  CREATE_DATE ,
  cms_outstanding_amt                   )
  (select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CUSTOMER_X_REF_SEQ), 2)) as BIGINT),
  'SIBS',
  t.EXTERNAL_SYSTEM_ACCT_NO,
  (SELECT pro.LLP_LE_ID FROM sci_lsp_lmt_profile pro
	WHERE pro.cms_lsp_lmt_profile_id = t.cms_act_lmt_profile_id
	--AND t.is_valid = 'Y'
	FETCH FIRST 1 ROW ONLY ),
  (select pf.cms_customer_id from sci_lsp_lmt_profile pf
	where pf.cms_lsp_lmt_profile_id = t.cms_act_lmt_profile_id
	--AND t.is_valid = 'Y'
	FETCH FIRST 1 ROW ONLY),
  t.AA_NUMBER,
  LOC_COUNTRY,
  LOC_ORG_CODE,
  ACCT_TYPE,
  ACCT_SEQ,
  1,
  'N',
  'I',
  'A',
  '37',
  LOC_COUNTRY,
  t.FIRST_DISBURSEMENT_DATE,
  t.FINAL_DISBURSEMENT_DATE,  
  CURRENT TIMESTAMP,
  cast(COALESCE(OUTSTANDING_SIGN, '+') || char(OUTSTANDING_AMT) as decimal(17,2))
  FROM   	
  	(SELECT ROW_NUMBER() OVER(PARTITION BY EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ) ROWNUM,
  		EXTERNAL_SYSTEM_ACCT_NO, cms_act_lmt_profile_id, AA_NUMBER, LOC_COUNTRY,
  		LOC_ORG_CODE, ACCT_TYPE, ACCT_SEQ, FIRST_DISBURSEMENT_DATE, FINAL_DISBURSEMENT_DATE,
  		OUTSTANDING_SIGN, OUTSTANDING_AMT
  	 FROM SI_TEMP_SIBS_CA001  
  	WHERE HAS_ACCOUNT = 'Y'
  	AND CMS_STG_ACCT_ID IS NULL) T
  WHERE T.ROWNUM = 1);


  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 9);
  commit;

  ---------------------------------------
  ---- si_runstats is a function in
  ---- cms_system_interface_utility.sql
  ---- \db2\system-interface
  ---------------------------------------
  call si_runstats('sci_lsp_appr_lmts');
  call si_runstats('SCI_LSP_SYS_XREF');
  
  commit;
  
  UPDATE SI_TEMP_SIBS_CA001 t
  set cms_act_acct_id = (select CMS_LSP_SYS_XREF_ID
  			from SCI_LSP_SYS_XREF xref
  			where xref.LSX_EXT_SYS_ACCT_NUM = t.external_system_acct_no
  			and xref.LSX_ext_sys_acct_seq = t.acct_seq
  			and xref.LSX_EXT_SYS_CODE_VALUE = 'SIBS')
  where t.HAS_ACCOUNT = 'Y'
  AND T.CMS_ACT_ACCT_ID IS NULL;
  
   CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 10);
   commit;  

  INSERT INTO SCI_LSP_LMTS_XREF_MAP
	(
    CMS_LSP_LMTS_XREF_MAP_ID,
    --LXM_LE_ID,
    LXM_LMT_ID,
    CMS_LSP_APPR_LMTS_ID,
    CMS_LSP_SYS_XREF_ID,
    LXM_EXT_SYS_ACCT_TYPE,
    LXM_EXT_SYS_ACCT_SEQ,
  CMS_STATUS,
  UPDATE_STATUS_IND,
  create_date                                    )
  (select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_x_ref_seq), 2)) as BIGINT),
  --lmts.LMT_LE_ID,
  --lmts.lmt_id,
  --lmts.CMS_LSP_APPR_LMTS_ID,
  t.SRC_LIMIT_ID,
  t.cms_act_lmt_id,
  cms_act_acct_id,
  ACCT_TYPE,
  ACCT_SEQ,
  'ACTIVE',
  'I',
      CURRENT TIMESTAMP
        FROM SI_TEMP_SIBS_CA001 t
  	WHERE cms_act_acct_id is not null
  	--and lmts.LMT_FAC_CODE = t.FACILITY_TYPE_CODE
  	--and lmts.LMT_FAC_SEQ = t.FACILITY_SEQ
  	-- and source_id = 'SIBS' 
  	AND     t.IS_VALID = 'Y'             
  and NOT EXISTS 
  (SELECT '1' FROM SCI_LSP_LMTS_XREF_MAP b 
          WHERE b.CMS_LSP_APPR_LMTS_ID = t.CMS_ACT_LMT_ID
          and b.CMS_LSP_SYS_XREF_ID = t.cms_act_acct_id
          -- and a.LSX_EXT_SYS_CODE_VALUE='SIBS'
         ) 
  --and (t.ACCT_TYPE is not null and length(trim(t.ACCT_TYPE)) > 0 ) 
  );
  commit;

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 11);
  commit;

  UPDATE SI_TEMP_SIBS_CA001 t
  set cms_stg_acct_id = (select CMS_LSP_SYS_XREF_ID
  			from CMS_STAGE_LSP_SYS_XREF xref
  			where xref.LSX_EXT_SYS_ACCT_NUM = t.external_system_acct_no
  			and xref.LSX_ext_sys_acct_seq = t.acct_seq
  			and xref.LSX_EXT_SYS_CODE_VALUE = 'SIBS')
  where t.HAS_ACCOUNT = 'Y'
  AND T.CMS_STG_ACCT_ID IS NULL;

  
   CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 12);
   commit;  

  INSERT INTO STAGE_LIMIT_XREF
  (
  CMS_LSP_LMTS_XREF_MAP_ID,
  --LXM_LE_ID,
  LXM_LMT_ID,
  CMS_LSP_APPR_LMTS_ID,
  CMS_LSP_SYS_XREF_ID,
  LXM_EXT_SYS_ACCT_TYPE,
  LXM_EXT_SYS_ACCT_SEQ,
  CMS_STATUS,
  UPDATE_STATUS_IND  ,
   CREATE_DATE                     )
  (select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_x_ref_seq), 2)) as BIGINT),
  --lmts.LMT_LE_ID,
  t.SRC_LIMIT_ID,
  t.cms_stg_lmt_id,
  --lmts.lmt_id,
  --lmts.CMS_LSP_APPR_LMTS_ID,
  cms_stg_acct_id,
  ACCT_TYPE,
  ACCT_SEQ,
  'ACTIVE',
  'I',
  CURRENT TIMESTAMP             
  FROM SI_TEMP_SIBS_CA001 t--, stage_limit lmts
  WHERE --lmts.CMS_LSP_APPR_LMTS_ID = t.CMS_STG_LMT_ID
  --and lmts.LMT_FAC_CODE = t.FACILITY_TYPE_CODE
  --and lmts.LMT_FAC_SEQ = t.FACILITY_SEQ
  -- and source_id = 'SIBS' 
    --AND  
    t.IS_VALID = 'Y'         
    and t.cms_stg_acct_id is not null
  and NOT EXISTS 
  (SELECT '1' 
  FROM STAGE_LIMIT_XREF b
    WHERE 
    --a.CMS_LSP_SYS_XREF_ID=b.CMS_LSP_SYS_XREF_ID
--      and a.CMS_LSP_SYS_XREF_ID is not null
--      and b.CMS_LSP_SYS_XREF_ID is not null
--      and b.CMS_LSP_APPR_LMTS_ID is not null
--      and t.CMS_ACT_LMT_ID is not null
--      and a.LSX_EXT_SYS_ACCT_NUM is not null
--      and t.EXTERNAL_SYSTEM_ACCT_NO is not null
--      and a.LSX_ext_sys_acct_seq is not null
--      and t.ACCT_SEQ is not null
      --and 
      b.CMS_LSP_APPR_LMTS_ID = t.CMS_STG_LMT_ID
      and b.CMS_LSP_SYS_XREF_ID = t.cms_stg_acct_id
      --and a.LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO
      --and a.LSX_ext_sys_acct_seq = t.ACCT_SEQ
      -- and a.LSX_EXT_SYS_CODE_VALUE='SIBS'
      ) 
  AND t.is_valid = 'Y' 
  and (t.ACCT_TYPE is not null and length(trim(t.ACCT_TYPE)) > 0 ) );
  commit;

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 13);
  commit;
  
  
  -------------------------------------
  -- Update TAT Document records
  -- CMS_TAT_DOCUMENT , CMS_STAGE_TAT_DOCUMENT
  --
  -------------------------------------  

	DECLARE GLOBAL TEMPORARY TABLE SESSION.temp_disbursement
			(feed_id BIGINT,
			 cms_act_lmt_profile_id BIGINT,
			 first_disbursement_date TIMESTAMP
			 )
    WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;
	
	INSERT INTO SESSION.temp_disbursement (
	select feed_id, CMS_ACT_LMT_PROFILE_ID, first_disbursement_date from (
			select row_number() over(partition by CMS_ACT_LMT_PROFILE_ID) rownum, feed_id,
				CMS_ACT_LMT_PROFILE_ID, first_disbursement_date 
			from SI_TEMP_SIBS_CA001 t
			where t.is_valid = 'Y'
			and t.first_disbursement_date is not null
			order by first_disbursement_date asc) tmp_tat
		where rownum = 1
	);
	
	create index SESSION.idx_feed on SESSION.temp_disbursement
    (feed_id)
    allow reverse scans;

	update si_temp_sibs_ca001 a
	set a.is_first_disbursement_date = 'Y'
	where a.is_valid = 'Y'
	and exists (
		select 1 from SESSION.temp_disbursement t
		where a.feed_id = t.feed_id
		);
		
	drop table SESSION.temp_disbursement;
    
    CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 14);
    commit;    
  
  
    UPDATE CMS_TAT_DOCUMENT tat set tat.DISBURSEMENT_DATE = 
		(select DATE(temp.FIRST_DISBURSEMENT_DATE) from SI_TEMP_SIBS_CA001 temp
				where --temp.IS_VALID = 'Y'
				--and 
				temp.IS_FIRST_DISBURSEMENT_DATE = 'Y'
				and temp.CMS_ACT_LMT_PROFILE_ID = tat.CMS_LSP_LMT_PROFILE_ID)
	WHERE EXISTS (select 1 from SI_TEMP_SIBS_CA001 t
				where --t.IS_VALID = 'Y'
				--and t.IS_FIRST_DISBURSEMENT_DATE is not null
				--and t.CMS_ACT_LMT_PROFILE_ID is not null
				--and tat.CMS_LSP_LMT_PROFILE_ID is not null
				--and 
				t.IS_FIRST_DISBURSEMENT_DATE = 'Y'
				and t.CMS_ACT_LMT_PROFILE_ID = tat.CMS_LSP_LMT_PROFILE_ID);
				
    CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 15);				
    commit;  
	
	DECLARE GLOBAL TEMPORARY TABLE SESSION.temp_tat
			(cms_stage_tat_id BIGINT,
			 first_disbursement_date DATE
			 )
    WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;
	
	INSERT INTO SESSION.temp_tat(
		SELECT STAGING_REFERENCE_ID, date(temp.first_disbursement_date)
    	FROM TRANSACTION trx, si_temp_sibs_ca001 temp
    	WHERE TRANSACTION_TYPE = 'TAT_DOC'
    	AND trx.LIMIT_PROFILE_ID = temp.cms_act_lmt_profile_id
		and temp.is_first_disbursement_date = 'Y'
	);
	
	create index SESSION.idx_tat on SESSION.temp_tat
    (cms_stage_tat_id)
    allow reverse scans;
    
    CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 16);				
    commit;
	
	update CMS_STAGE_TAT_DOCUMENT tat set tat.DISBURSEMENT_DATE =
	(select first_disbursement_date from  SESSION.temp_tat temp
	where temp.cms_stage_tat_id = tat.tat_id)
	where exists (select 1 from SESSION.temp_tat
	where cms_stage_tat_id = tat.tat_id);
    
  drop table SESSION.temp_tat;

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA001', 'SIBS', 0);
  commit;

END@

  -------------------------------------
  -- start of SIBS - CA004
  -- Loan
  --  Non-Performing Loan
  --  Closed Status
  -------------------------------------
CREATE PROCEDURE SI_RUN_TEMP_SIBS_CA004
  LANGUAGE SQL
BEGIN

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 1);
  commit;
  
  -----------------------------------------------------
  --  * Update/insertion of LIMIT - ACCOUNT information
  -----------------------------------------------------
  UPDATE SI_TEMP_SIBS_CA004 t
  set CMS_ACT_ACCT_ID = (select CMS_LSP_SYS_XREF_ID
  			from SCI_LSP_SYS_XREF xref
  			where xref.LSX_EXT_SYS_ACCT_NUM = t.external_system_acct_no
  			and xref.LSX_ext_sys_acct_seq = t.acct_seq
  			and xref.LSX_EXT_SYS_CODE_VALUE = 'SIBS')
  where t.is_valid = 'Y';
  
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 2);
  commit;  
  
  UPDATE SI_TEMP_SIBS_CA004 t
  set CMS_STG_ACCT_ID = (select CMS_LSP_SYS_XREF_ID
  			from CMS_STAGE_LSP_SYS_XREF xref
  			where xref.LSX_EXT_SYS_ACCT_NUM = t.external_system_acct_no
  			and xref.LSX_ext_sys_acct_seq = t.acct_seq
  			and xref.LSX_EXT_SYS_CODE_VALUE = 'SIBS')
  where t.is_valid = 'Y';
  
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 3);
  commit;    
  
  -------------------------------------
  -- Update/insertion table
  -- SCI_LSP_SYS_XREF
  --
  -------------------------------------
  -- lock table SCI_LSP_SYS_XREF in share mode;
  UPDATE SCI_LSP_SYS_XREF x
        SET ( 
          UPDATE_STATUS_IND,
  	  ACCT_STATUS,
  	  ACCT_DELQ_IND)=
        (select 
          (CASE WHEN t.ACCT_STAT = 'D' THEN t.ACCT_STAT ELSE 'U' END),
          ACCT_STAT,
          NPL_STAT
        FROM SI_TEMP_SIBS_CA004 t
        WHERE T.CMS_ACT_ACCT_ID = CMS_LSP_SYS_XREF_ID
        AND IS_VALID = 'Y'
        FETCH FIRST 1 ROW ONLY)
  WHERE EXISTS (  SELECT 1
                 FROM SI_TEMP_SIBS_CA004 t1
                where t1.is_valid = 'Y' 
                AND T1.CMS_ACT_ACCT_ID = CMS_LSP_SYS_XREF_ID);
  
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 4);
  commit;

  INSERT INTO SCI_LSP_SYS_XREF
  ( CMS_LSP_SYS_XREF_ID,
  LSX_EXT_SYS_CODE_VALUE,
  LSX_EXT_SYS_ACCT_NUM,
  LSX_LE_ID,
  CMS_LE_SUB_PROFILE_ID,
  LSX_BCA_REF_NUM,
  LSX_BKG_LOCTN_CTRY, 
  LSX_BKG_LOCTN_ORG,
  LSX_EXT_SYS_ACCT_TYPE,
  LSX_EXT_SYS_ACCT_SEQ,
  LSX_LSP_ID,
  ACCT_DELQ_IND,
  UPDATE_STATUS_IND,
  ACCT_STATUS,
  LSX_EXT_SYS_CODE_NUM,
  LSX_EXT_CTY_CODE_VALUE )
  (select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CUSTOMER_X_REF_SEQ), 2)) as BIGINT),
  'SIBS',
  t.EXTERNAL_SYSTEM_ACCT_NO,
      (SELECT pro.LLP_LE_ID FROM sci_lsp_lmt_profile pro
	WHERE pro.cms_lsp_lmt_profile_id = t.cms_act_lmt_profile_id),
      (select pf.cms_customer_id from sci_lsp_lmt_profile pf
	where pf.cms_lsp_lmt_profile_id = t.cms_act_lmt_profile_id),
  t.AA_NUMBER,
  LOC_COUNTRY,
  LOC_ORG_CODE,
  ACCT_TYPE,
  ACCT_SEQ,
  1,
  t.NPL_STAT,
  (CASE WHEN t.ACCT_STAT = 'D' THEN t.ACCT_STAT ELSE 'I' END),
  ACCT_STAT,
  '37',
  LOC_COUNTRY
  FROM 
  	(SELECT ROW_NUMBER() OVER(PARTITION BY EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ) ROWNUM,
  		EXTERNAL_SYSTEM_ACCT_NO, cms_act_lmt_profile_id, AA_NUMBER, LOC_COUNTRY,
  		LOC_ORG_CODE, ACCT_TYPE, ACCT_SEQ, NPL_STAT, ACCT_STAT
  	 FROM SI_TEMP_SIBS_CA004  
  	WHERE IS_VALID = 'Y'
  	AND CMS_ACT_ACCT_ID IS NULL) T
  WHERE T.ROWNUM = 1);  

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 5);
  commit;
  
  --- ------------------------------
  --  * Update/insertion table
  --  * CMS_STAGE_LSP_SYS_XREF
  --  *
  ----------------------------------
  -- lock table CMS_STAGE_LSP_SYS_XREF in share mode;
  UPDATE CMS_STAGE_LSP_SYS_XREF x
        SET ( 
          UPDATE_STATUS_IND,
  	  ACCT_STATUS,
  	  ACCT_DELQ_IND)=
        (select 
          (CASE WHEN t.ACCT_STAT = 'D' THEN t.ACCT_STAT ELSE 'U' END),
          ACCT_STAT,
          NPL_STAT
        FROM SI_TEMP_SIBS_CA004 t
        WHERE T.CMS_STG_ACCT_ID = CMS_LSP_SYS_XREF_ID
        AND IS_VALID = 'Y'
        FETCH FIRST 1 ROW ONLY)
  WHERE EXISTS (  SELECT 1
                 FROM SI_TEMP_SIBS_CA004 t1
                where t1.is_valid = 'Y' 
                AND T1.CMS_STG_ACCT_ID = CMS_LSP_SYS_XREF_ID);
                
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 6);
  commit;
  
  INSERT INTO CMS_STAGE_LSP_SYS_XREF
  ( CMS_LSP_SYS_XREF_ID,
  LSX_EXT_SYS_CODE_VALUE,
  LSX_EXT_SYS_ACCT_NUM,
  LSX_LE_ID,
  CMS_LE_SUB_PROFILE_ID,
  LSX_BCA_REF_NUM,
  LSX_BKG_LOCTN_CTRY, 
  LSX_BKG_LOCTN_ORG,
  LSX_EXT_SYS_ACCT_TYPE,
  LSX_EXT_SYS_ACCT_SEQ,
  LSX_LSP_ID,
  ACCT_DELQ_IND,
  UPDATE_STATUS_IND,
  ACCT_STATUS,
  LSX_EXT_SYS_CODE_NUM,
  LSX_EXT_CTY_CODE_VALUE  )
  (select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CUSTOMER_X_REF_SEQ), 2)) as BIGINT),
  'SIBS',
  t.EXTERNAL_SYSTEM_ACCT_NO,
      (SELECT pro.LLP_LE_ID FROM sci_lsp_lmt_profile pro
	WHERE pro.cms_lsp_lmt_profile_id = t.cms_act_lmt_profile_id),
      (select pf.cms_customer_id from sci_lsp_lmt_profile pf
	where pf.cms_lsp_lmt_profile_id = t.cms_act_lmt_profile_id),
  t.AA_NUMBER,
  LOC_COUNTRY,
  LOC_ORG_CODE,
  ACCT_TYPE,
  ACCT_SEQ,
  1,
  NPL_STAT,
  (CASE WHEN t.ACCT_STAT = 'D' THEN t.ACCT_STAT ELSE 'I' END),
  ACCT_STAT,
  '37',
  LOC_COUNTRY
  FROM   	
  	(SELECT ROW_NUMBER() OVER(PARTITION BY EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ) ROWNUM,
  		EXTERNAL_SYSTEM_ACCT_NO, cms_act_lmt_profile_id, AA_NUMBER, LOC_COUNTRY,
  		LOC_ORG_CODE, ACCT_TYPE, ACCT_SEQ, NPL_STAT, ACCT_STAT
  	 FROM SI_TEMP_SIBS_CA004  
  	WHERE IS_VALID = 'Y'
  	AND CMS_STG_ACCT_ID IS NULL) T
  WHERE T.ROWNUM = 1); 
  
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 7);
  commit;

  UPDATE SI_TEMP_SIBS_CA004 t
  set CMS_ACT_ACCT_ID = (select CMS_LSP_SYS_XREF_ID
  			from SCI_LSP_SYS_XREF xref
  			where xref.LSX_EXT_SYS_ACCT_NUM = t.external_system_acct_no
  			and xref.LSX_ext_sys_acct_seq = t.acct_seq
  			and xref.LSX_EXT_SYS_CODE_VALUE = 'SIBS')
  where t.is_valid = 'Y'
  and cms_act_acct_id is null;
  
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 8);
  commit;  
  
  UPDATE SI_TEMP_SIBS_CA004 t
  set CMS_STG_ACCT_ID = (select CMS_LSP_SYS_XREF_ID
  			from CMS_STAGE_LSP_SYS_XREF xref
  			where xref.LSX_EXT_SYS_ACCT_NUM = t.external_system_acct_no
  			and xref.LSX_ext_sys_acct_seq = t.acct_seq
  			and xref.LSX_EXT_SYS_CODE_VALUE = 'SIBS')
  where t.is_valid = 'Y'
  and cms_stg_acct_id is null;
  
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 9);
  commit;      
  
  --- -----------------------------
  -- * Update/insertion table
  -- * SCI_LSP_LMTS_XREF_MAP
  -- *
  --- -----------------------------
  -- lock table SCI_LSP_LMTS_XREF_MAP in share mode;
  UPDATE SCI_LSP_LMTS_XREF_MAP b
  SET(CMS_STATUS, UPDATE_STATUS_IND, last_update_date )=
  (select 
    (CASE WHEN t.ACCT_STAT = 'D' THEN 'DELETED' ELSE 'ACTIVE' END),
    (CASE WHEN t.ACCT_STAT = 'D' THEN t.ACCT_STAT ELSE 'U' END),
         current timestamp
            FROM SI_TEMP_SIBS_CA004 t
            WHERE b.cms_lsp_appr_lmts_id = t.cms_act_lmt_id
            and b.cms_lsp_sys_xref_id = t.cms_act_acct_id
            and t.is_valid = 'Y')
  WHERE EXISTS (SELECT 1 from SI_TEMP_SIBS_CA004 t1
		    WHERE b.cms_lsp_appr_lmts_id = t1.cms_act_lmt_id
            and b.cms_lsp_sys_xref_id = t1.cms_act_acct_id
            and t1.is_valid = 'Y');
            
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 10);
  commit;  

  ---------------------------------------
  ---- si_runstats is a function in
  ---- cms_system_interface_utility.sql
  ---- \db2\system-interface
  ---------------------------------------
  call si_runstats('sci_lsp_appr_lmts');
  call si_runstats('SCI_LSP_SYS_XREF');
  commit;

	INSERT INTO SCI_LSP_LMTS_XREF_MAP
	(CMS_LSP_LMTS_XREF_MAP_ID,
        --LXM_LE_ID,
        LXM_LMT_ID,
        CMS_LSP_APPR_LMTS_ID,
        CMS_LSP_SYS_XREF_ID,
        LXM_EXT_SYS_ACCT_TYPE,
        LXM_EXT_SYS_ACCT_SEQ,
  CMS_STATUS,
  UPDATE_STATUS_IND,
  create_date)
  (select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_x_ref_seq), 2)) as BIGINT),
  SRC_LIMIT_ID,
  cms_act_lmt_id, 
  cms_act_acct_id,
  ACCT_TYPE,
  ACCT_SEQ,
  (CASE WHEN t.ACCT_STAT = 'D' THEN 'DELETED' ELSE 'ACTIVE' END),
  (CASE WHEN t.ACCT_STAT = 'D' THEN t.ACCT_STAT ELSE 'I' END),
      CURRENT TIMESTAMP
        FROM SI_TEMP_SIBS_CA004 t
	  WHERE t.IS_VALID = 'Y'             
	  and NOT EXISTS 
	  (SELECT 1 FROM SCI_LSP_LMTS_XREF_MAP b 
		  WHERE b.cms_lsp_appr_lmts_id = t.cms_act_lmt_id
		  and b.cms_lsp_sys_xref_id = t.cms_act_acct_id) );

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 11);
  commit;
  
  -------------------------------------
  -- Update/insertion table
  -- STAGE_LIMIT_XREF
  --
  -------------------------------------
  -- lock table STAGE_LIMIT_XREF in share mode;
  UPDATE STAGE_LIMIT_XREF b
  SET(CMS_STATUS, UPDATE_STATUS_IND, last_update_date )=
  (select 
    (CASE WHEN t.ACCT_STAT = 'D' THEN 'DELETED' ELSE 'ACTIVE' END),
    (CASE WHEN t.ACCT_STAT = 'D' THEN t.ACCT_STAT ELSE 'U' END),
         current timestamp
            FROM SI_TEMP_SIBS_CA004 t
            WHERE t.cms_stg_acct_id = b.CMS_LSP_SYS_XREF_ID
            and t.CMS_STG_LMT_ID = b.CMS_LSP_APPR_LMTS_ID
            and t.is_valid = 'Y')
  WHERE EXISTS (SELECT 1 
            FROM SI_TEMP_SIBS_CA004 t1
            WHERE t1.cms_stg_acct_id = b.CMS_LSP_SYS_XREF_ID
            and t1.CMS_STG_LMT_ID = b.CMS_LSP_APPR_LMTS_ID
            and t1.is_valid = 'Y');
            
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 12);
  commit;
  
	INSERT INTO STAGE_LIMIT_XREF
	(CMS_LSP_LMTS_XREF_MAP_ID,
        LXM_LMT_ID,
        CMS_LSP_APPR_LMTS_ID,
        CMS_LSP_SYS_XREF_ID,
        LXM_EXT_SYS_ACCT_TYPE,
        LXM_EXT_SYS_ACCT_SEQ,
  CMS_STATUS,
  UPDATE_STATUS_IND,
  create_date                                    )
  (select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_x_ref_seq), 2)) as BIGINT),
  SRC_LIMIT_ID,
  cms_stg_lmt_id,
  cms_stg_acct_id,
  ACCT_TYPE,
  ACCT_SEQ,
  (CASE WHEN t.ACCT_STAT = 'D' THEN 'DELETED' ELSE 'ACTIVE' END),
  (CASE WHEN t.ACCT_STAT = 'D' THEN t.ACCT_STAT ELSE 'I' END),
      CURRENT TIMESTAMP
        FROM SI_TEMP_SIBS_CA004 t
	  where t.IS_VALID = 'Y'             
	  and NOT EXISTS 
	  (SELECT 1 FROM STAGE_LIMIT_XREF b 
		  WHERE t.cms_stg_acct_id = b.CMS_LSP_SYS_XREF_ID 
		  AND t.IS_VALID = 'Y'             
		  and t.cms_stg_lmt_id = b.CMS_LSP_APPR_LMTS_ID) );
  commit;

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 13);
  commit;  

  UPDATE SI_TEMP_SIBS_CA004
  SET CMS_NPL_ID = (SELECT CMS_NPL_ID
  	FROM CMS_NPL N
  	WHERE N.ACCOUNT_NUMBER = EXTERNAL_SYSTEM_ACCT_NO
  	AND SOURCE_ID = 'SIBS')
  WHERE IS_VALID = 'Y';
  
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 14);
  commit;    
  
  -------------------------------------
  -- Actual NPL Table
  -- cms_npl
  -------------------------------------
  UPDATE cms_npl a SET (   
                ACCOUNT_STATUS,
                STATUS,
                SETTLED_DATE,
                AMT_PARTIALLY_WRITTEN_OFF,
                NPL_DATE,
                SUSPENSE_INTEREST,
                SPECIFIC_PROVISION,
                PART_PAYMENT_RECEIVED,
                DATE_CURRENT_DOUBTFUL,
                DATE_JUDGEMENT,
                JUDGEMENT_SUM,
    		DATE_WRITE_OFF,
                SUSPENSE_INT_WRITTEN_OFF,
    		MONTHS_INSTAL_ARREARS,
    		MONTHS_INTEREST_ARREARS) =
  (SELECT
                ACCT_STAT,
                NPL_STAT,
                SETTLED_DATE,
                AMT_PARTIALLY_WRITTEN_OFF,
                NPL_STAT_DATE,
                INTEREST_IN_SUSPENSE,
                SPECIFIC_PROV_CHARGED_TO_ACCT,
                PART_PAYMENT,
                LATEST_DATE_DOUBTFUL,
                JUDGMENT_DATE,
                 JUDGMENT_SUM,
                DATE_WRITE_OFF,
                AMT_WRITTEN_OFF,
                MONTHS_INSTALLMENT_ARREARS,
                MONTHS_INTEREST_ARREARS
                --'SIBS',
                --FACILITY_SEQ       
     FROM si_temp_SIBS_CA004 t
     WHERE T.CMS_NPL_ID = A.CMS_NPL_ID
     fetch first 1 row only)
    WHERE EXISTS ( SELECT '1' FROM si_temp_SIBS_CA004 t1
		      WHERE T1.CMS_NPL_ID = A.CMS_NPL_ID
		      AND t1.is_valid = 'Y')
          and a.SOURCE_ID='SIBS';

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 15);
  commit;  
            
  insert into cms_npl(
            CMS_NPL_ID,
            ACCOUNT_NUMBER,
	    ACCOUNT_STATUS,
	    PART_PAYMENT_RECEIVED,
	    DATE_CURRENT_DOUBTFUL,
	    SUSPENSE_INTEREST,
	    SUSPENSE_INT_WRITTEN_OFF,
	    DATE_JUDGEMENT,
	    JUDGEMENT_SUM,
	    DATE_WRITE_OFF,
	    MONTHS_INSTAL_ARREARS,
	    MONTHS_INTEREST_ARREARS,
	    STATUS,
	    NPL_DATE,
	    SOURCE_ID,
	    SPECIFIC_PROVISION,
	    AMT_PARTIALLY_WRITTEN_OFF,
            SETTLED_DATE    )
  (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR NPL_SEQ), 2)) as BIGINT),
    EXTERNAL_SYSTEM_ACCT_NO,
    ACCT_STAT,
    PART_PAYMENT,
    LATEST_DATE_DOUBTFUL,
    INTEREST_IN_SUSPENSE,
    AMT_WRITTEN_OFF,
    JUDGMENT_DATE,
    JUDGMENT_SUM,
    DATE_WRITE_OFF,
    MONTHS_INSTALLMENT_ARREARS,
    MONTHS_INTEREST_ARREARS,
    NPL_STAT,
    NPL_STAT_DATE,
    'SIBS',
    SPECIFIC_PROV_CHARGED_TO_ACCT,
    AMT_PARTIALLY_WRITTEN_OFF,
		t.SETTLED_DATE
     FROM   	
     (SELECT ROW_NUMBER() OVER(PARTITION BY EXTERNAL_SYSTEM_ACCT_NO) ROWNUM,
  		EXTERNAL_SYSTEM_ACCT_NO,
  		ACCT_STAT, PART_PAYMENT,
  		LATEST_DATE_DOUBTFUL, INTEREST_IN_SUSPENSE, AMT_WRITTEN_OFF,
  		JUDGMENT_DATE, JUDGMENT_SUM, DATE_WRITE_OFF, MONTHS_INSTALLMENT_ARREARS, MONTHS_INTEREST_ARREARS,
  		NPL_STAT, NPL_STAT_DATE, --FACILITY_TYPE_CODE, FACILITY_SEQ
  		SPECIFIC_PROV_CHARGED_TO_ACCT, AMT_PARTIALLY_WRITTEN_OFF, SETTLED_DATE
  	 FROM SI_TEMP_SIBS_CA004  
  	WHERE IS_VALID = 'Y'
  	AND CMS_NPL_ID IS NULL) T
  WHERE T.ROWNUM = 1);

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 16);
	commit;   

	update CMS_FAC_GENERAL a set (CANCEL_REJECT_CODE_NUM, CANCEL_REJECT_CODE_VALUE, CANCEL_REJECT_DATE, FAC_STATUS_CODE_NUM ,FAC_STATUS_CODE_VALUE)
	= (select 'CANC_REJ_CODE', CANCEL_REJECT_CODE,	CANCEL_REJECT_DATE, 'FACILITY_STATUS', FACILITY_STATUS
	 from CMS_FACILITY_MASTER b, SI_TEMP_SIBS_CA004 c where b.CMS_LSP_APPR_LMTS_ID = c.CMS_ACT_LMT_ID and b.ID = a.CMS_FAC_MASTER_ID and c.IS_VALID = 'Y'
	 fetch first 1 row only)
	where exists (select 1 from CMS_FACILITY_MASTER b, SI_TEMP_SIBS_CA004 where b.ID = a.CMS_FAC_MASTER_ID and CMS_ACT_LMT_ID = b.CMS_LSP_APPR_LMTS_ID and IS_VALID = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 17);
	commit;   
	
	update CMS_STG_FAC_GENERAL a set (CANCEL_REJECT_CODE_NUM, CANCEL_REJECT_CODE_VALUE, CANCEL_REJECT_DATE, FAC_STATUS_CODE_NUM ,FAC_STATUS_CODE_VALUE)
	= (select 'CANC_REJ_CODE', CANCEL_REJECT_CODE,	CANCEL_REJECT_DATE, 'FACILITY_STATUS', FACILITY_STATUS
	 from CMS_STG_FACILITY_MASTER b, SI_TEMP_SIBS_CA004 c where b.CMS_LSP_APPR_LMTS_ID = c.CMS_ACT_LMT_ID and b.ID = a.CMS_FAC_MASTER_ID and c.IS_VALID = 'Y'
	 fetch first 1 row only)
	where exists (select 1 from CMS_STG_FACILITY_MASTER b, SI_TEMP_SIBS_CA004 where b.ID = a.CMS_FAC_MASTER_ID and CMS_ACT_LMT_ID = b.CMS_LSP_APPR_LMTS_ID and IS_VALID = 'Y'
	 and exists (select 1 from transaction where transaction_type = 'FACILITY' and staging_reference_id = b.ID));
 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 18);
	commit;  
	
  update SCI_LSP_SYS_XREF set CMS_OUTSTANDING_AMT = 0 where UPDATE_STATUS_IND = 'D';
	
	-- WLS 12 Nov 2009: update outstanding to zero in limit table when all account status is closed
	update SCI_LSP_APPR_LMTS a set a.CMS_OUTSTANDING_AMT = 0 
	where not exists (select 1 from SCI_LSP_LMTS_XREF_MAP b, SCI_LSP_SYS_XREF c 
		where b.CMS_LSP_APPR_LMTS_ID=a.CMS_LSP_APPR_LMTS_ID and b.CMS_LSP_SYS_XREF_ID = c.CMS_LSP_SYS_XREF_ID and c.UPDATE_STATUS_IND <> 'D')
	and exists (select 1 from SI_TEMP_SIBS_CA004 where CMS_ACT_LMT_ID = a.CMS_LSP_APPR_LMTS_ID and is_valid = 'Y');

	update STAGE_LIMIT a set a.CMS_OUTSTANDING_AMT = 0 
	where not exists (select 1 from STAGE_LIMIT_XREF b, CMS_STAGE_LSP_SYS_XREF c 
		where b.CMS_LSP_APPR_LMTS_ID=a.CMS_LSP_APPR_LMTS_ID and b.CMS_LSP_SYS_XREF_ID = c.CMS_LSP_SYS_XREF_ID and c.UPDATE_STATUS_IND <> 'D')
	and exists (select 1 from SI_TEMP_SIBS_CA004 where CMS_STG_LMT_ID = a.CMS_LSP_APPR_LMTS_ID and is_valid = 'Y');	
 
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CA004', 'SIBS', 0);
  commit;

END
@


----------------------------------------------
-- SIBS CO001 - FD Maturity
-- ref to ABG CO006 Deposit Detail
----------------------------------------------
CREATE PROCEDURE SI_RUN_TEMP_SIBS_CO001
  LANGUAGE SQL
BEGIN

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO001', 'SIBS', 1);
  commit;
  -------------------------------------
  -- Actual Table
  -- CMS_CASH_DEPOSIT
  --
  -------------------------------------

  UPDATE cms_cash_deposit a 
  set (deposit_reference_number,
        deposit_receipt_number,
        deposit_amount_currency, 
        deposit_amount,
        third_party_bank,
        fdr_rate,
        issue_date,
        deposit_maturity_date,
        account_type_num,
        status,
        source_security_id) =
       (SELECT 
         REF_NO,
         RECEIPT_NUMBER,
         AMT_CURRENCY,
         AMT,
         THIRD_PARTY_BANK,
         FDR_RATE,
         ISSUE_DATE,
         MATURITY_DATE,
         'FD_ACC_TYPE', 
         'ACTIVE', 
         SECURITY_ID 
          FROM si_temp_SIBS_CO001 temp
          WHERE temp.receipt_number = a.deposit_receipt_number
		  and temp.REF_NO = a.deposit_reference_number
		  -- and a.source_id = 'SIBS'
		  AND temp.IS_VALID = 'Y' )
          WHERE 
          -- source_id = 'SIBS'
          -- AND 
          EXISTS (SELECT 1 FROM si_temp_SIBS_CO001 t
			  WHERE t.receipt_number = a.deposit_receipt_number
			  and t.REF_NO = a.deposit_reference_number
			  -- and a.source_id = 'SIBS'
			  AND t.IS_VALID = 'Y');
  commit;			  

  -- INSERT INTO cms_cash_deposit
  -- (cash_deposit_id,
  --   deposit_reference_number,
  --   deposit_receipt_number,
  --   deposit_amount_currency, 
  --   deposit_amount,
  --   third_party_bank,
  --   fdr_rate,
  --   issue_date,
  --   deposit_maturity_date, 
  --   account_type_num,
  --   cms_collateral_id,
  --   status,
  --   source_security_id,
  --   source_id, 
  --   cms_ref_id)
  -- (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT),
  --     ref_no,
  --     receipt_number,
  --     amt_currency,
  --     amt,
  --     third_party_bank,
  --     fdr_rate, 
  --     issue_date,
  --     maturity_date,
  --     'FD_ACC_TYPE',
  --     c.cms_collateral_id,
  --     'ACTIVE',
  --     security_id,
  --     'SIBS',
  --     CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT)
  --    FROM cms_cash c, cms_security sec, si_temp_SIBS_CO001
  --   WHERE c.cms_collateral_id = sec.cms_collateral_id
  --     AND sec.sci_security_dtl_id = security_id
  --     AND source_id = 'SIBS'
  --     AND is_valid = 'Y'
  --     AND NOT EXISTS (SELECT '1' FROM cms_cash_deposit s
  --              WHERE s.cms_collateral_id = c.cms_collateral_id
  --              AND receipt_number = s.deposit_receipt_number));
               
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO001', 'SIBS', 2);
  commit;

  -------------------------------------
  -- Staging Table
  -- CMS_STAGE_CASH_DEPOSIT
  --
  -------------------------------------
  UPDATE cms_stage_cash_deposit a 
  SET (deposit_reference_number,
        deposit_receipt_number,
        deposit_amount_currency, 
        deposit_amount,
        third_party_bank,
        fdr_rate,
        issue_date,
        deposit_maturity_date, 
        account_type_num,
        status,
        source_security_id) = 
      ( SELECT ref_no,
        receipt_number,
        amt_currency,
        amt,
        t.third_party_bank,
        t.fdr_rate,
        t.issue_date,
        t.maturity_date,
        'FD_ACC_TYPE',
       'ACTIVE',
        security_id
        FROM si_temp_SIBS_CO001 t, transaction trx, cms_cash_deposit cash
              where t.receipt_number = cash.DEPOSIT_RECEIPT_NUMBER
              and t.ref_no = cash.deposit_reference_number
              and t.receipt_number = a.DEPOSIT_RECEIPT_NUMBER
              and t.ref_no = a.deposit_reference_number
              and trx.reference_id = cash.cms_collateral_id
              and a.source_id = cash.source_id
              and a.cms_collateral_id = trx.staging_reference_id
              and trx.transaction_type = 'COL'
              and is_valid = 'Y' )
    WHERE 
    -- source_id = 'SIBS'
    -- and 
    exists (select 1
              from si_temp_SIBS_CO001 t, transaction trx, cms_cash_deposit cash
              where t.receipt_number = cash.DEPOSIT_RECEIPT_NUMBER
              and t.ref_no = cash.deposit_reference_number
              and t.receipt_number = a.DEPOSIT_RECEIPT_NUMBER
              and t.ref_no = a.deposit_reference_number
              and trx.reference_id = cash.cms_collateral_id
              and a.source_id = cash.source_id
              and a.cms_collateral_id = trx.staging_reference_id
              and trx.transaction_type = 'COL'
              and is_valid = 'Y');
  commit;    


  -- INSERT INTO cms_stage_cash_deposit
  -- ( cash_deposit_id,
  --   deposit_reference_number,
  --   deposit_receipt_number,
  --   deposit_amount_currency, 
  --   deposit_amount,
  --   third_party_bank,
  --   fdr_rate,
  --   issue_date,
  --   deposit_maturity_date, 
  --   account_type_num,
  --   cms_collateral_id,
  --   status,
  --   source_security_id,
  --   source_id,
  --   cms_ref_id )
  -- ( SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT),
  --     ref_no,
  --     receipt_number,
  --     amt_currency,
  --     amt,
  --     third_party_bank,
  --     fdr_rate,
  --     issue_date,
  --     maturity_date,
  --     'FD_ACC_TYPE',
  --     c.cms_collateral_id,
  --     'ACTIVE',
  --     security_id,
  --     'SIBS',
  --     ( SELECT cms_ref_id
  --       FROM cms_cash_deposit s
  --       WHERE s.SOURCE_ID = 'SIBS' 
  --       AND RECEIPT_NUMBER = s.DEPOSIT_RECEIPT_NUMBER
  --       AND security_id = s.source_security_id )
  --   FROM cms_stage_cash c, cms_stage_security sec, si_temp_SIBS_CO001
  --   WHERE c.cms_collateral_id = sec.cms_collateral_id
  --   AND sec.sci_security_dtl_id = security_id
  --   AND source_id = 'SIBS'
  --   and is_valid = 'Y'
  --   AND NOT EXISTS ( SELECT '1' FROM cms_stage_cash_deposit s
  --              WHERE s.cms_collateral_id = c.cms_collateral_id
  --              AND RECEIPT_NUMBER = S.DEPOSIT_RECEIPT_NUMBER )
  --   );

  -- CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO001', 'SIBS', 3);
  -- commit;
  
  -------------------------------------
  -- Tag DELETED for non-exist records
  -- Actual Table
  -- CMS_CASH_DEPOSIT
  --
  -------------------------------------
  -- lock table cms_cash_deposit in share mode;
  -- UPDATE cms_cash_deposit a
  -- set status = 'DELETED'
  --   WHERE source_id = 'SIBS'
  --     AND status = 'ACTIVE'
  --     AND not exists (SELECT '1' FROM si_temp_SIBS_CO001, cms_security s
  --            WHERE receipt_number = a.deposit_receipt_number
  --             and security_id = s.sci_security_dtl_id
  --             and s.cms_collateral_id = a.cms_collateral_id
  --             and s.source_id = 'SIBS'
  --             and is_valid = 'Y');

  -- CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO001', 'SIBS', 4);
  -- commit;
  
  -------------------------------------
  -- Tag DELETED for non-exist records
  -- Staging Table
  -- CMS_STAGE_CASH_DEPOSIT
  --
  -------------------------------------
  -- lock table cms_stage_cash_deposit in share mode;
  -- UPDATE cms_stage_cash_deposit a
  -- SET status='DELETED'
  --   WHERE source_id = 'SIBS'
  --     and status = 'ACTIVE'
  --     and not exists (SELECT '1' FROM si_temp_SIBS_CO001, cms_stage_security s
  --       WHERE receipt_number = a.deposit_receipt_number
  --         and security_id = s.sci_security_dtl_id
  --         and s.cms_collateral_id = a.cms_collateral_id
  --         and s.source_id = 'SIBS'
  --         and is_valid = 'Y')
  --     and exists (select '1' from transaction trx
  --             where a.cms_collateral_id = trx.staging_reference_id
  --               and trx.transaction_type = 'COL');

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO001', 'SIBS', 0);
  
END
@



----------------------------------------------------------
---- * SIBS - CO002 - Feed - Shares Margin Financing
---- * ref to ABG CO008 - Stocks
----------------------------------------------------------
CREATE PROCEDURE SI_RUN_TEMP_SIBS_CO002
  LANGUAGE SQL
BEGIN

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 1);
  commit;
  ----------------------------------------------
  -- Update security type and subtype id first
  -- si_temp_SIBS_CO002
  -- @refer si_host_col_code_map
  -- Need Special Handling, based on Stock Code
  --
  ----------------------------------------------
--  UPDATE si_temp_SIBS_CO002 a
--     SET (cms_security_type_id, cms_security_subtype_id) =
--  (SELECT security_type_id, security_sub_type_id
--     FROM si_host_col_code_map
--    WHERE host_col_code = a.source_security_sub_type)
--   WHERE source_security_sub_type <> '400';
   
--  UPDATE si_temp_SIBS_CO002 a
--     SET (cms_security_type_id, cms_security_subtype_id) =
--  (SELECT 'MS', SI_GET_SUBTYPE_BY_STOCK_CODE_AND_EXCHANGE(stock_code_bond_code, STOCK_EXCHANGE_BOND_MARKET)
--     FROM si_temp_SIBS_CO002
--    WHERE security_id = a.security_id)
--   WHERE source_security_sub_type = '400';

  UPDATE si_temp_SIBS_CO002 a
     SET cms_security_type_id = 'MS', 
     cms_security_subtype_id = SI_GET_SUBTYPE_BY_STOCK_CODE_AND_EXCHANGE(STOCK_CODE, CASE STOCK_EXCHANGE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE STOCK_EXCHANGE END)
  WHERE is_valid = 'Y';
  commit;
    

  ----------------------------
  -- Begin Update
  -- cms_security_source
  --
  ----------------------------
  UPDATE cms_security_source ssrc
  SET ( source_security_id,
      -- source_id, 
      last_update_date,
      security_sub_type_id,
      interface_id,
      status  ) =
  (SELECT t.src_security_id,
      -- 'SMF',
      current_timestamp,
      t.cms_security_subtype_id,
      'CO002',
      'ACTIVE'
     FROM cms_security sec, si_temp_SIBS_CO002 t 
    WHERE sec.sci_security_dtl_id = t.src_security_id
    and ssrc.cms_collateral_id = sec.cms_collateral_id
      AND sec.source_id = 'SMF' 
      AND t.is_valid = 'Y'
      fetch first 1 row only)
   WHERE EXISTS (SELECT 1 FROM cms_security sec1, si_temp_SIBS_CO002 t1
           WHERE sec1.sci_security_dtl_id = t1.src_security_id
    		and ssrc.cms_collateral_id = sec1.cms_collateral_id
      		AND sec1.source_id = 'SMF' 
      		AND t1.is_valid = 'Y')
   AND source_id = 'SMF';
  commit;


  ----------------------------
  -- Begin Insertion
  -- cms_security_source
  --
  ----------------------------

  INSERT INTO CMS_SECURITY_SOURCE
  (CMS_SECURITY_SOURCE_ID, CMS_COLLATERAL_ID, SOURCE_SECURITY_ID, SOURCE_ID,
  	STATUS, LAST_UPDATE_DATE, SECURITY_SUB_TYPE_ID, INTERFACE_ID)
  (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
  	CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COLLATERAL_SEQ), 2)) AS BIGINT),
  	t.src_security_id, 'SMF', 
  	'ACTIVE', CURRENT_TIMESTAMP, t.cms_security_subtype_id, 'CO002'
   FROM si_temp_SIBS_CO002 t
  	WHERE NOT EXISTS (SELECT 1 
  				FROM CMS_SECURITY_SOURCE o
				WHERE o.SOURCE_SECURITY_ID = t.src_security_id
				AND o.SECURITY_SUB_TYPE_ID = t.cms_security_subtype_id
				AND o.SOURCE_ID = 'SMF'
				-- AND o.STATUS <> 'DELETED'
				)
	-- AND t.CMS_COLLATERAL_ID IS NULL
	AND t.IS_VALID = 'Y'
	GROUP BY t.src_security_id, t.cms_security_subtype_id
	);
  commit;  
  
  -- INSERT INTO cms_security_source
  -- ( cms_security_source_id,
  --   cms_collateral_id,
  --   source_security_id,
  --   source_id, 
  --   status,
  --   last_update_date,
  --   security_sub_type_id,
  --   interface_id  )
  -- (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
  --     sec.cms_collateral_id,
  --     t.src_security_id,
  --     'SMF',
  --     'ACTIVE',
  --     CURRENT_TIMESTAMP,
  --     sec.security_sub_type_id,
  --     'CO002'
  --    FROM cms_security sec, si_temp_SIBS_CO002 t
  --   WHERE NOT EXISTS (SELECT 1 FROM cms_security_source 
  --            WHERE source_security_id = t.src_security_id 
  --              AND source_id = 'SMF') 
  --   AND is_valid = 'Y'
  --   AND sec.sci_security_dtl_id = t.src_security_id
  --   AND source_id = 'SMF');
  --   
  --   commit;  


  -------------------------------------
  -- Actual Table
  -- CMS_SECURITY
  --
  -------------------------------------
  INSERT INTO CMS_SECURITY(CMS_COLLATERAL_ID, SCI_SECURITY_DTL_ID, SOURCE_ID, 
  				SECURITY_SUB_TYPE_ID, STATUS, is_migrated_ind, VERSION_TIME)
  (SELECT o.CMS_COLLATERAL_ID, o.SOURCE_SECURITY_ID, o.SOURCE_ID, 
  	o.SECURITY_SUB_TYPE_ID, 'ACTIVE', 'N', 0
    FROM CMS_SECURITY_SOURCE o
    WHERE NOT EXISTS (SELECT 1
				   FROM CMS_SECURITY s
				   WHERE s.CMS_COLLATERAL_ID = o.CMS_COLLATERAL_ID
				   AND o.SOURCE_ID = s.SOURCE_ID
				   -- AND s.STATUS <> 'DELETED'
				   )
    AND EXISTS (SELECT 1
			 FROM si_temp_SIBS_CO002 t
			 WHERE o.SOURCE_SECURITY_ID = t.src_security_id
			 AND o.SECURITY_SUB_TYPE_ID = t.cms_security_subtype_id
 			 AND t.IS_VALID = 'Y')
    AND o.SOURCE_ID = 'SMF'
    -- AND o.SECURITY_SUB_TYPE_ID IN ('MS600', 'MS605')
    -- AND o.STATUS <> 'DELETED'
    );

  commit;  
  
  
  UPDATE cms_security a
  SET ( SCI_SECURITY_DTL_ID      ,
      SCI_ORIG_SECURITY_CURRENCY ,
      SCI_SECURITY_CURRENCY      ,
      SECURITY_LOCATION          ,
      SECURITY_ORGANISATION      ,
      CUSTODIAN_TYPE             ,
      SECURITY_CUSTODIAN         ,
      IS_LEGAL_ENFORCE           ,
      IS_LEGAL_ENFORCE_DATE      ,
      SECURITY_MATURITY_DATE,
      status, security_sub_type_id, 
      sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, type_name,
      VERSION_TIME ) =
  ( SELECT SRC_SECURITY_ID        ,
      ORIG_SECURITY_CURRENCY ,
      SECURITY_CURRENCY      ,
      SECURITY_LOCATION          ,
      SECURITY_ORGANISATION      ,
      CUSTODIAN_TYPE             ,
      SECURITY_CUSTODIAN         ,
      IS_LEGAL_ENFORCE           ,
      IS_LEGAL_ENFORCE_DATE      ,
      SECURITY_MATURITY_DATE,
      'ACTIVE',
      cms_security_subtype_id,
      cms_security_type_id,
      cms_security_subtype_id, '',
      0 
    FROM si_temp_SIBS_CO002 t
    WHERE t.SRC_SECURITY_ID = a.sci_security_dtl_id
    and is_valid = 'Y'
    and a.source_id = 'SMF'      
    fetch first 1 row only)
    WHERE EXISTS (SELECT 1 FROM si_temp_SIBS_CO002 t1
              WHERE a.sci_security_dtl_id = t1.SRC_SECURITY_ID
              AND source_id = 'SMF'
              and is_valid = 'Y')
    AND source_id = 'SMF';
  commit;


  -- INSERT INTO cms_security
  -- (   cms_collateral_id,
  --     SCI_SECURITY_DTL_ID        ,
  --     SCI_ORIG_SECURITY_CURRENCY ,
  --     SCI_SECURITY_CURRENCY      ,
  --     SECURITY_LOCATION          ,
  --     SECURITY_ORGANISATION      ,
  --     CUSTODIAN_TYPE             ,
  --     SECURITY_CUSTODIAN         ,
  --     IS_LEGAL_ENFORCE           ,
  --     IS_LEGAL_ENFORCE_DATE      ,
  --     SECURITY_MATURITY_DATE,
  --     status, source_id, is_migrated_ind,
  --     security_sub_type_id, 
  --     sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE
  --     )
  -- (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
  --     SRC_SECURITY_ID        ,
  --     ORIG_SECURITY_CURRENCY ,
  --     SECURITY_CURRENCY      ,
  --     SECURITY_LOCATION          ,
  --     SECURITY_ORGANISATION      ,
  --     CUSTODIAN_TYPE             ,
  --     SECURITY_CUSTODIAN         ,
  --     IS_LEGAL_ENFORCE           ,
  --     IS_LEGAL_ENFORCE_DATE      ,
  --     SECURITY_MATURITY_DATE,
  --     'ACTIVE', 'SMF', 'N',
  --     SI_GET_SUBTYPE_BY_STOCK_CODE_AND_EXCHANGE(STOCK_CODE, CASE STOCK_EXCHANGE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE STOCK_EXCHANGE END),
  --     'MS',
  --     SI_GET_SUBTYPE_BY_STOCK_CODE_AND_EXCHANGE(STOCK_CODE, CASE STOCK_EXCHANGE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE STOCK_EXCHANGE END)
  --    FROM si_temp_SIBS_CO002 t
  --   WHERE NOT EXISTS (SELECT '1' FROM cms_security
  --              WHERE sci_security_dtl_id = t.SRC_SECURITY_ID
  --                AND source_id = 'SMF')
  --   and is_valid = 'Y'   );
  --   commit;

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 2);
  commit;

  -------------------------------------
  -- Actual Table
  -- CMS_SECURITY, CMS_SECURITY_SUB_TYPE
  -- Update type_name, subtype_name
  -------------------------------------
  UPDATE cms_security a
  SET (type_name, subtype_name) =
  (SELECT security_type_name, subtype_name 
     FROM cms_security_sub_type
    WHERE security_sub_type_id = a.security_sub_type_id)
   WHERE source_id = 'SMF'
     AND type_name = '';
     commit;

  -------------------------------------
  -- Actual Table
  -- CMS_MARKETABLE_SEC
  -- Nothing to Update but Insert only
  --
  -------------------------------------
  INSERT INTO cms_marketable_sec
    (cms_collateral_id)
    (SELECT sec.cms_collateral_id
      FROM cms_security sec, si_temp_SIBS_CO002 t
      WHERE sec.sci_security_dtl_id = t.SRC_SECURITY_ID
      AND sec.source_id = 'SMF'
      AND NOT EXISTS (SELECT '1' FROM cms_marketable_sec market
               WHERE market.cms_collateral_id = sec.cms_collateral_id)
      and t.is_valid = 'Y'
      group by sec.cms_collateral_id);
  commit;

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 3);
  commit;

  -------------------------------------
  -- Actual Table
  -- CMS_PORTFOLIO_ITEM
  --
  -------------------------------------
  UPDATE cms_portfolio_item a 
  set (type,
        REGISTERED_NAME,
        NO_OF_UNITS,
        UNIT_PRICE,
        STOCK_EXCHANGE,
        STOCK_EXCHANGE_COUNTRY,
        STOCK_CODE,
        CURRENCY_CODE,
        SECURITY_CUSTODIAN,
        SECURITY_MATURITY_DATE,
        CUSTODIAN_TYPE,
        status, CDS_NUMBER, UNIT_PRICE_CURRENCY
        --,
        --SOURCE_ID
        ) = 
  ( SELECT t.type_name,
        t.REGISTERED_NAME,
        t.NO_OF_UNITS,
        t.UNIT_PRICE,
        t.STOCK_EXCHANGE,
        t.STOCK_EXCHANGE_COUNTRY,
        t.STOCK_CODE,
        t.SECURITY_CURRENCY,
        t.SECURITY_CUSTODIAN,
        t.SECURITY_MATURITY_DATE,
        t.CUSTODIAN_TYPE,
        'ACTIVE', cast(t.CDS_NUMBER as CHAR), t.SECURITY_CURRENCY
        --,
        --'SMF'
    FROM cms_marketable_sec m, cms_security sec, si_temp_SIBS_CO002 t
    WHERE m.cms_collateral_id = sec.cms_collateral_id
    AND sec.sci_security_dtl_id = t.SRC_SECURITY_ID
      AND a.cms_collateral_id = m.cms_collateral_id
      and sec.source_id = 'SMF'
      and t.is_valid = 'Y'
      fetch first 1 row only)
    WHERE EXISTS (SELECT '1' FROM cms_marketable_sec m1, cms_security sec1, si_temp_SIBS_CO002 t1
             WHERE a.cms_collateral_id = m1.cms_collateral_id
               AND sec1.cms_collateral_id = m1.cms_collateral_id
               AND sec1.sci_security_dtl_id = t1.SRC_SECURITY_ID 
               AND sec1.source_id = 'SMF'
               and t1.is_valid = 'Y');
    commit;           

  INSERT INTO cms_portfolio_item
      (item_id,
        cms_collateral_id,
        REGISTERED_NAME,
        NO_OF_UNITS,
        UNIT_PRICE,
        STOCK_EXCHANGE,
        STOCK_EXCHANGE_COUNTRY,
        STOCK_CODE,
        CURRENCY_CODE,
        SECURITY_CUSTODIAN,
        SECURITY_MATURITY_DATE,
        CUSTODIAN_TYPE,
        status,
        source_id,
        CMS_REF_ID, type, CDS_NUMBER, UNIT_PRICE_CURRENCY )
  (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT),
        m.cms_collateral_id,
        t.REGISTERED_NAME,
        t.NO_OF_UNITS,
        t.UNIT_PRICE,
        t.STOCK_EXCHANGE,
        t.STOCK_EXCHANGE_COUNTRY,
        t.STOCK_CODE,
        t.SECURITY_CURRENCY,
        t.SECURITY_CUSTODIAN,
        t.SECURITY_MATURITY_DATE,
        t.CUSTODIAN_TYPE,
        'ACTIVE',
        'SMF',
        CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT),
        t.type_name, cast(t.CDS_NUMBER as CHAR), t.SECURITY_CURRENCY
     FROM cms_marketable_sec m, cms_security sec, si_temp_SIBS_CO002 t
    WHERE m.cms_collateral_id = sec.cms_collateral_id
      AND sec.sci_security_dtl_id = t.SRC_SECURITY_ID
      and sec.source_id = 'SMF'
      and t.is_valid = 'Y'
      AND NOT EXISTS (SELECT '1' FROM cms_portfolio_item p
               WHERE p.cms_collateral_id = m.cms_collateral_id
                 AND p.source_id = 'SMF')
  );
  commit;

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 4);
  commit;


  -------------------------------------
  -- Staging Table
  -- CMS_STAGE_SECURITY
  --
  -------------------------------------
  INSERT INTO CMS_STAGE_SECURITY (CMS_COLLATERAL_ID, SCI_SECURITY_DTL_ID, SOURCE_ID, 
  				SECURITY_SUB_TYPE_ID, STATUS, VERSION_TIME)
  (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT), 
  	o.SOURCE_SECURITY_ID, o.SOURCE_ID, 
  	o.SECURITY_SUB_TYPE_ID, 'ACTIVE', 0
    FROM CMS_SECURITY_SOURCE o
    WHERE NOT EXISTS (SELECT 1
				   FROM CMS_STAGE_SECURITY s
				   WHERE s.sci_security_dtl_id = o.SOURCE_SECURITY_ID
				   AND o.SOURCE_ID = s.SOURCE_ID
				   -- AND s.STATUS <> 'DELETED'
				   )
    AND EXISTS (SELECT 1
			 FROM si_temp_SIBS_CO002 t
			 WHERE o.SOURCE_SECURITY_ID = t.src_security_id
			 AND o.SECURITY_SUB_TYPE_ID = t.cms_security_subtype_id
 			 AND t.IS_VALID = 'Y')
    AND o.SOURCE_ID = 'SMF'
    -- AND o.SECURITY_SUB_TYPE_ID IN ('MS600', 'MS605')
    -- AND o.STATUS <> 'DELETED'
    );

  commit;  
  
  
  UPDATE cms_stage_security a
  SET ( SCI_SECURITY_DTL_ID,
        SCI_ORIG_SECURITY_CURRENCY,
        SCI_SECURITY_CURRENCY,
        SECURITY_LOCATION,
        SECURITY_ORGANISATION,
        CUSTODIAN_TYPE,
        SECURITY_CUSTODIAN,
        IS_LEGAL_ENFORCE,
        IS_LEGAL_ENFORCE_DATE,
        SECURITY_MATURITY_DATE,
        STATUS, security_sub_type_id, 
      sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, type_name,
      VERSION_TIME ) =
  (SELECT SRC_SECURITY_ID,
    ORIG_SECURITY_CURRENCY,
    SECURITY_CURRENCY     ,
    SECURITY_LOCATION     ,
    SECURITY_ORGANISATION ,
    CUSTODIAN_TYPE        ,
    SECURITY_CUSTODIAN    ,
    IS_LEGAL_ENFORCE      ,
    IS_LEGAL_ENFORCE_DATE ,
    SECURITY_MATURITY_DATE,
    'ACTIVE', 
      cms_security_subtype_id,
      cms_security_type_id,
      cms_security_subtype_id, '',
      0 
   FROM si_temp_SIBS_CO002 t
    WHERE t.SRC_SECURITY_ID = a.sci_security_dtl_id
    and a.source_id = 'SMF'
    and t.IS_VALID = 'Y'
    fetch first 1 row only)
    WHERE EXISTS (SELECT '1' FROM si_temp_SIBS_CO002
             WHERE a.sci_security_dtl_id = SRC_SECURITY_ID
               AND source_id = 'SMF'
               and is_valid = 'Y')
    AND source_id = 'SMF'
    AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
                              WHERE reference_id IN (SELECT cms_collateral_id 
                                   FROM cms_security, si_temp_SIBS_CO002
                                    WHERE SRC_SECURITY_ID = sci_security_dtl_id
                                      AND source_id = 'SMF')
                              AND transaction_type = 'COL');
    commit;


  -- INSERT INTO cms_stage_security
  -- ( cms_collateral_id,
  --   SCI_SECURITY_DTL_ID,
  --   SCI_ORIG_SECURITY_CURRENCY,
  --   SCI_SECURITY_CURRENCY,
  --   SECURITY_LOCATION,
  --   SECURITY_ORGANISATION,
  --   CUSTODIAN_TYPE,
  --   SECURITY_CUSTODIAN,
  --   IS_LEGAL_ENFORCE,
  --   IS_LEGAL_ENFORCE_DATE,
  --   SECURITY_MATURITY_DATE,
  --   status,
  --   source_id, security_sub_type_id, 
  --   sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE )
  -- (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
  --   SRC_SECURITY_ID,
  --   ORIG_SECURITY_CURRENCY,
  --   SECURITY_CURRENCY     ,
  --   SECURITY_LOCATION     ,
  --   SECURITY_ORGANISATION ,
  --   CUSTODIAN_TYPE        ,
  --   SECURITY_CUSTODIAN    ,
  --   IS_LEGAL_ENFORCE      ,
  --   IS_LEGAL_ENFORCE_DATE ,
  --   SECURITY_MATURITY_DATE,
  --   'ACTIVE',
  --   'SMF', SI_GET_SUBTYPE_BY_STOCK_CODE_AND_EXCHANGE(STOCK_CODE, CASE STOCK_EXCHANGE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE STOCK_EXCHANGE END),
  --   'MS',
  --   SI_GET_SUBTYPE_BY_STOCK_CODE_AND_EXCHANGE(STOCK_CODE, CASE STOCK_EXCHANGE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE STOCK_EXCHANGE END)
  --    FROM si_temp_SIBS_CO002 t
  --   WHERE NOT EXISTS (SELECT '1' FROM cms_stage_security
  --              WHERE sci_security_dtl_id = t.SRC_SECURITY_ID
  --                AND source_id = 'SMF')
  --   and is_valid = 'Y');
  --   commit;

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 5);
  commit;

  -------------------------------------
  -- Staging Table
  -- CMS_STAGE_SECURITY, CMS_SECURITY_SUB_TYPE
  -- Update type_name, subtype_name
  -------------------------------------
  UPDATE cms_stage_security a
  SET (type_name, subtype_name) =
  (SELECT security_type_name, subtype_name 
     FROM cms_security_sub_type
    WHERE security_sub_type_id = a.security_sub_type_id)
   WHERE source_id = 'SMF'
     AND type_name = '';
     commit;

  -------------------------------------
  -- Staging Table
  -- CMS_STAGE_MARKETABLE_SEC
  -- Nothing to update but insert only
  --
  -------------------------------------
  INSERT INTO cms_stage_marketable_sec (cms_collateral_id)
  (  SELECT sec.cms_collateral_id
     FROM cms_stage_security sec, si_temp_SIBS_CO002 t
      WHERE sec.sci_security_dtl_id = t.SRC_SECURITY_ID
      AND sec.source_id = 'SMF'
      and t.is_valid = 'Y'
      AND NOT EXISTS (SELECT '1' FROM cms_stage_marketable_sec market
               WHERE market.cms_collateral_id = sec.cms_collateral_id)
      group by sec.cms_collateral_id          
    );
  commit;

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 6);
  commit;
  
  -------------------------------------
  -- Staging Table
  -- CMS_STAGE_PORTFOLIO_ITEM
  --
  -------------------------------------
  UPDATE CMS_STAGE_PORTFOLIO_ITEM a 
  set (type,
        REGISTERED_NAME,
        NO_OF_UNITS,
        UNIT_PRICE,
        STOCK_EXCHANGE,
        STOCK_EXCHANGE_COUNTRY,
        STOCK_CODE,
        CURRENCY_CODE,
        SECURITY_CUSTODIAN,
        SECURITY_MATURITY_DATE,
        CUSTODIAN_TYPE,
        status, CDS_NUMBER, UNIT_PRICE_CURRENCY
        --,
        --SOURCE_ID
        ) = 
  ( SELECT t.type_name,
        t.REGISTERED_NAME,
        t.NO_OF_UNITS,
        t.UNIT_PRICE,
        t.STOCK_EXCHANGE,
        t.STOCK_EXCHANGE_COUNTRY,
        t.STOCK_CODE,
        t.SECURITY_CURRENCY,
        t.SECURITY_CUSTODIAN,
        t.SECURITY_MATURITY_DATE,
        t.CUSTODIAN_TYPE,
        'ACTIVE', cast(t.CDS_NUMBER as CHAR), t.SECURITY_CURRENCY
        --,
        --'SMF'
     FROM cms_stage_marketable_sec m, cms_stage_security sec, si_temp_SIBS_CO002 t, transaction trx
    WHERE m.cms_collateral_id = sec.cms_collateral_id
      AND sec.sci_security_dtl_id = t.SRC_SECURITY_ID
      and sec.source_id = 'SMF'
      and t.is_valid = 'Y'
      and sec.CMS_COLLATERAL_ID = trx.staging_reference_id
      and trx.transaction_type = 'COL'
      AND a.cms_collateral_id = m.cms_collateral_id
      fetch first 1 row only
   )
    WHERE a.source_id = 'SMF'
    and EXISTS (SELECT 1 
            FROM cms_stage_marketable_sec m1, cms_stage_security sec1, si_temp_SIBS_CO002 t1, transaction trx1
             WHERE a.cms_collateral_id = m1.cms_collateral_id
               AND sec1.cms_collateral_id = m1.cms_collateral_id
               AND sec1.sci_security_dtl_id = t1.SRC_SECURITY_ID 
               AND sec1.source_id = 'SMF'
               and t1.is_valid = 'Y'
               and trx1.transaction_type = 'COL'
               and trx1.staging_reference_id = sec1.cms_collateral_id);
   commit;            


  INSERT INTO CMS_STAGE_PORTFOLIO_ITEM
      (item_id,
        cms_collateral_id,
        REGISTERED_NAME,
        NO_OF_UNITS,
        UNIT_PRICE,
        STOCK_EXCHANGE,
        STOCK_EXCHANGE_COUNTRY,
        STOCK_CODE,
        CURRENCY_CODE,
        SECURITY_CUSTODIAN,
        SECURITY_MATURITY_DATE,
        CUSTODIAN_TYPE,
        status,
        source_id,
        CMS_REF_ID, type, CDS_NUMBER, UNIT_PRICE_CURRENCY )
  (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT),
        m.cms_collateral_id,
        --t.type_name,
        t.REGISTERED_NAME,
        t.NO_OF_UNITS,
        t.UNIT_PRICE,
        t.STOCK_EXCHANGE,
        t.STOCK_EXCHANGE_COUNTRY,
        t.STOCK_CODE,
        t.SECURITY_CURRENCY,
        t.SECURITY_CUSTODIAN,
        t.SECURITY_MATURITY_DATE,
        t.CUSTODIAN_TYPE,
        'ACTIVE',
        'SMF',
        (select cms_ref_id
          from cms_portfolio_item a
          WHERE a.cms_collateral_id = m.cms_collateral_id
          AND a.source_id = 'SMF'),
        t.type_name, cast(t.CDS_NUMBER as CHAR), t.SECURITY_CURRENCY
     FROM cms_stage_marketable_sec m, cms_stage_security sec, si_temp_SIBS_CO002 t
    WHERE m.cms_collateral_id = sec.cms_collateral_id
      AND sec.sci_security_dtl_id = t.SRC_SECURITY_ID
      and sec.source_id = 'SMF'
      and t.is_valid = 'Y'
      AND NOT EXISTS (SELECT '1' FROM cms_stage_portfolio_item p
               WHERE p.cms_collateral_id = m.cms_collateral_id
                 AND p.source_id = 'SMF')
    );
    commit;

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 7);
  commit;
  

  ----------------------------
  -- Begin for
  -- cms_limit_security_map
  --
  ----------------------------
    -- lock table cms_limit_security_map in share mode;
    update cms_limit_security_map m
    set (UPDATE_STATUS_IND, DELETION_DATE)=
    ('D', current_timestamp)
    WHERE m.UPDATE_STATUS_IND <> 'D'
      AND m.SOURCE_ID = 'SMF'
      AND 'COMPLETE' = ( select master.STATUS
                              from STP_MASTER_TRANS master
                              where master.TRANSACTION_TYPE='COL'
                              and master.REFERENCE_ID=m.CMS_COLLATERAL_ID )
      AND NOT EXISTS (     SELECT 1 from SI_TEMP_SIBS_CO002 t
                      WHERE m.CMS_LSP_APPR_LMTS_ID = t.CMS_ACT_LMT_ID
                      	-- and m.SCI_LAS_BCA_REF_NUM = t.LSX_BCA_REF_NUM
                      	-- and m.SCI_LAS_FAC_CODE = t.SCI_LAS_FAC_CODE
                        -- and m.SCI_LAS_FAC_SEQ = cast(t.SCI_LAS_FAC_SEQ as INTEGER)
                      	-- and t.is_valid = 'Y' 
                      -- FETCH FIRST 1 ROW ONLY
                      ) ;
    commit;                      


 ----------------------------
  -- Begin Insertion
  -- cms_limit_security_map
  --
  --
  --  CO002 columns
  --SCI_LAS_FAC_CODE
  --SCI_LAS_FAC_SEQ
  ----------------------------
    INSERT INTO cms_limit_security_map (
      charge_id,
      cms_lsp_appr_lmts_id,
      cms_lsp_lmt_profile_id,
      cms_collateral_id,
      -- sci_las_lmt_id,
      SCI_LAS_SEC_ID,
      customer_category,
      SCI_LAS_BCA_REF_NUM,
      SCI_LAS_FAC_CODE,
      SCI_LAS_FAC_SEQ,
      SCI_LAS_LE_ID,
      SCI_LAS_LSP_ID,
      CREATE_DATE,
      SOURCE_ID,
      UPDATE_STATUS_IND,
      PLEDGE_AMOUNT_PERCENTAGE     )
    (  SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_MAP_SEQ), 2)) as BIGINT), 
      t.CMS_ACT_LMT_ID,
      (  select cms_limit_profile_id
	from sci_lsp_appr_lmts
	where cms_lsp_appr_lmts_id = t.CMS_ACT_LMT_ID
        FETCH FIRST 1 ROW ONLY
        ),
      (select cms_collateral_id
        from cms_security sec
        where SCI_SECURITY_DTL_ID = t.SRC_SECURITY_ID
        and SOURCE_ID = 'SMF'
        FETCH FIRST 1 ROW ONLY
        ),
        t.SRC_SECURITY_ID,
        'MB',
      t.LSX_BCA_REF_NUM,
      t.SCI_LAS_FAC_CODE,
      cast(t.SCI_LAS_FAC_SEQ     as   INTEGER)  ,
      (SELECT LLP_LE_ID FROM sci_lsp_lmt_profile
        WHERE llp_bca_ref_num = t.LSX_BCA_REF_NUM 
        -- AND source_id = 'SIBS'
        FETCH FIRST 1 ROW ONLY
        ),
       1,
      current_timestamp,
      'SMF',
      'I',
      100
      FROM  SI_TEMP_SIBS_CO002 t
      WHERE t.is_valid = 'Y'
      and CMS_ACT_LMT_ID is not null
    --and cms_act_col_id is not null
    and not exists
    (select 1 from cms_limit_security_map b
      --where b.cms_collateral_id=t.CMS_ACT_COL_ID
      --and b.cms_lsp_appr_lmts_id=t.CMS_ACT_LMT_ID
      where b.cms_collateral_id =  (select cms_collateral_id
        from cms_security
        where SCI_SECURITY_DTL_ID = t.SRC_SECURITY_ID
        and SOURCE_ID = 'SMF'
         FETCH FIRST 1 ROW ONLY
        ) 
      and b.cms_lsp_appr_lmts_id= t.CMS_ACT_LMT_ID
        )
    group by 
    --CMS_ACT_LMT_ID,
    --CMS_ACT_COL_ID,
    --SRC_LMT_ID,
    --CMS_ACT_LMT_PROFILE_ID,
    t.LSX_BCA_REF_NUM,
    t.SCI_LAS_FAC_CODE,
    t.SCI_LAS_FAC_SEQ,
    t.CMS_ACT_LMT_ID,
    t.SRC_SECURITY_ID);
    commit;
  
  -- Set reference id
  UPDATE CMS_LIMIT_SECURITY_MAP map
  SET map.SCI_LAS_SYS_GEN_ID = (select map1.charge_id from CMS_LIMIT_SECURITY_MAP map1
				where map1.charge_id = map.charge_id
				AND map1.source_id = 'SMF')
  WHERE map.SCI_LAS_SYS_GEN_ID is null
  and map.source_id = 'SMF';
  commit;
    
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 8);
  commit;
  
  
  ----------------------------
  -- Begin for
  -- CMS_STAGE_LIMIT_SECURITY_MAP
  --
  ----------------------------
    -- lock table cms_limit_security_map in share mode;
    update CMS_STAGE_LIMIT_SECURITY_MAP m
    set (UPDATE_STATUS_IND, DELETION_DATE)=
    ('D', current_timestamp)
    WHERE m.UPDATE_STATUS_IND <> 'D'
      AND m.SOURCE_ID = 'SMF'
      AND EXISTS ( SELECT 1 from CMS_STAGE_SECURITY sec, transaction trx, STP_MASTER_TRANS master
      			where sec.cms_collateral_id = m.cms_collateral_id
      			and sec.SOURCE_ID = 'SMF'
      			and trx.transaction_type = 'COL'
      			and trx.staging_reference_id = sec.cms_collateral_id
      			and master.TRANSACTION_TYPE='COL'
      			and master.REFERENCE_ID=trx.reference_id
      			and master.STATUS='COMPLETE' )
      AND NOT EXISTS ( SELECT 1 from SI_TEMP_SIBS_CO002 t
                         WHERE m.CMS_LSP_APPR_LMTS_ID = t.CMS_STG_LMT_ID
                      	-- and m.SCI_LAS_BCA_REF_NUM = t.LSX_BCA_REF_NUM
                      	-- and m.SCI_LAS_FAC_CODE = t.SCI_LAS_FAC_CODE
                        -- and m.SCI_LAS_FAC_SEQ = cast(t.SCI_LAS_FAC_SEQ as INTEGER)
                      	-- and t.is_valid = 'Y' 
                      -- FETCH FIRST 1 ROW ONLY
                      ) ;
    commit;                      


 ----------------------------
  -- Begin Insertion
  -- CMS_STAGE_LIMIT_SECURITY_MAP
  --
  --
  --  CO002 columns
  --SCI_LAS_FAC_CODE
  --SCI_LAS_FAC_SEQ
  ----------------------------
    INSERT INTO CMS_STAGE_LIMIT_SECURITY_MAP (
      charge_id,
      cms_lsp_appr_lmts_id,
      cms_lsp_lmt_profile_id,
      cms_collateral_id,
      -- sci_las_lmt_id,
      SCI_LAS_SEC_ID,
      customer_category,
      SCI_LAS_BCA_REF_NUM,
      SCI_LAS_FAC_CODE,
      SCI_LAS_FAC_SEQ,
      SCI_LAS_LE_ID,
      SCI_LAS_LSP_ID,
      CREATE_DATE,
      SOURCE_ID,
      UPDATE_STATUS_IND, 
      PLEDGE_AMOUNT_PERCENTAGE          )
    (  SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_MAP_SEQ), 2)) as BIGINT), 
      t.CMS_STG_LMT_ID,
      (  select cms_limit_profile_id
	from STAGE_LIMIT
	where cms_lsp_appr_lmts_id = t.CMS_STG_LMT_ID
        FETCH FIRST 1 ROW ONLY
        ),
      (select cms_collateral_id
        from CMS_STAGE_SECURITY sec
        where SCI_SECURITY_DTL_ID = t.SRC_SECURITY_ID
        and SOURCE_ID = 'SMF'
        FETCH FIRST 1 ROW ONLY
        ),
        t.SRC_SECURITY_ID,
        'MB',
      t.LSX_BCA_REF_NUM,
      t.SCI_LAS_FAC_CODE,
      cast(t.SCI_LAS_FAC_SEQ     as   INTEGER)  ,
      (SELECT LLP_LE_ID FROM sci_lsp_lmt_profile
        WHERE llp_bca_ref_num = t.LSX_BCA_REF_NUM 
        -- AND source_id = 'SIBS'
        FETCH FIRST 1 ROW ONLY
        ),
        1,
      current_timestamp,
      'SMF',
      'I',
      100
      FROM  SI_TEMP_SIBS_CO002 t
      WHERE t.is_valid = 'Y'
      and CMS_STG_LMT_ID is not null
    -- and cms_act_col_id is not null
    and not exists
    (select 1 from CMS_STAGE_LIMIT_SECURITY_MAP b
      --where b.cms_collateral_id=t.CMS_ACT_COL_ID
      where b.cms_collateral_id =  (select cms_collateral_id
        from CMS_STAGE_SECURITY
        where SCI_SECURITY_DTL_ID = t.SRC_SECURITY_ID
        and SOURCE_ID = 'SMF'
         FETCH FIRST 1 ROW ONLY
        ) 
      and b.cms_lsp_appr_lmts_id= t.CMS_STG_LMT_ID
        )
    group by 
    -- CMS_ACT_LMT_ID,
    -- CMS_ACT_COL_ID,
    -- SRC_LMT_ID,
    -- CMS_ACT_LMT_PROFILE_ID,
    t.LSX_BCA_REF_NUM,
    t.SCI_LAS_FAC_CODE,
    t.SCI_LAS_FAC_SEQ,
    t.CMS_STG_LMT_ID,
    t.SRC_SECURITY_ID);
    commit;  

   -- Set staging reference id point to reference id
   UPDATE CMS_STAGE_LIMIT_SECURITY_MAP stgmap
	SET SCI_LAS_SYS_GEN_ID = ( select map.charge_id 
				from CMS_LIMIT_SECURITY_MAP map, transaction trx
				where trx.transaction_type = 'COL'
				and trx.reference_id = map.cms_collateral_id
				and trx.staging_reference_id = stgmap.cms_collateral_id
				and map.source_id = stgmap.source_id
				order by map.charge_id desc
				fetch first 1 row only )
   WHERE stgmap.SCI_LAS_SYS_GEN_ID is null
   AND stgmap.source_id = 'SMF';	
   COMMIT;    
    
  ------------------------------------------
  -- START Update Collateral Transaction
  -- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
  --
  ------------------------------------------  
  FOR cur_col_key AS
    SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
      FROM CMS_SECURITY a
    WHERE EXISTS (SELECT '1' FROM si_temp_SIBS_CO002 t, TRANSACTION trx
              		WHERE a.SCI_SECURITY_DTL_ID = t.SRC_SECURITY_ID
              		AND trx.REFERENCE_ID = a.CMS_COLLATERAL_ID
			AND trx.TRANSACTION_TYPE = 'COL'
                  	AND t.is_valid = 'Y' )
      AND a.SOURCE_ID = 'SMF'

  DO
    CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
  END FOR;
  commit;    
  
  ------------------------------------------
  -- END Update Collateral Transaction
  -- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
  --
  ------------------------------------------  
    

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 9);
  commit;
  
  
  ----------------------------
  -- Actual table
  -- SCI_PLEDGOR_DTL
  ----------------------------

  UPDATE sci_pledgor_dtl a
  SET ( PLG_LEGAL_NAME,
        -- PLG_REL_TYPE_NUM,
        -- PLG_REL_TYPE_VALUE,
	PLG_INC_NUM_TEXT,
        UPDATE_STATUS_IND
      ) =
    ( SELECT distinct SEC_PLEDGOR_NAME,
      	-- 'RELATIONSHIP',
      	-- 'P',
	SEC_INC_NUM_TEXT,
        'U'
      FROM SI_TEMP_SIBS_CO002 t
      WHERE t.SEC_PLEDGOR_ID = a.plg_le_id
	  AND t.IS_VALID = 'Y'
    )
  WHERE a.PLG_LE_ID_SRC_VALUE = 'SIBS'
  AND (a.UPDATE_STATUS_IND is null or a.UPDATE_STATUS_IND <> 'D')
  AND EXISTS ( SELECT 1 FROM SI_TEMP_SIBS_CO002 t1
               WHERE a.plg_le_id = t1.SEC_PLEDGOR_ID 
			   AND t1.IS_VALID = 'Y' );
  commit;


  INSERT INTO sci_pledgor_dtl
  ( cms_pledgor_dtl_id,
    PLG_LE_ID,
    PLG_LEGAL_NAME,
    PLG_REL_TYPE_NUM,
    PLG_REL_TYPE_VALUE,
    PLG_INC_NUM_TEXT,
    source_id,
    update_status_ind,
    PLG_LE_ID_SRC_VALUE
  )
  (  SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 2)) as BIGINT),
      SEC_PLEDGOR_ID,
      SEC_PLEDGOR_NAME,
      'RELATIONSHIP',
      'P',
      SEC_INC_NUM_TEXT,
      'SMF',
      'I',
      'SIBS'
      FROM (SELECT distinct SEC_PLEDGOR_ID, SEC_PLEDGOR_NAME, SEC_INC_NUM_TEXT FROM SI_TEMP_SIBS_CO002 t
            WHERE NOT EXISTS (  SELECT 1 FROM sci_pledgor_dtl dtl
                          WHERE t.SEC_PLEDGOR_ID = dtl.plg_le_id
                          AND dtl.PLG_LE_ID_SRC_VALUE = 'SIBS' 
                          AND (dtl.UPDATE_STATUS_IND is null or dtl.UPDATE_STATUS_IND <> 'D') )
            AND t.IS_VALID = 'Y'
            AND (t.CMS_SUB_PROFILE_ID is not null AND t.SEC_PLEDGOR_ID is not null)) as pledgor);
						  
  commit;

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 10);
  commit;
  
  
  ----------------------------
  -- Staging table
  -- STAGE_PLEDGOR_DTL
  ----------------------------
  
  UPDATE stage_pledgor_dtl a
  SET ( PLG_LEGAL_NAME,
        -- PLG_REL_TYPE_NUM,
        -- PLG_REL_TYPE_VALUE,
	PLG_INC_NUM_TEXT,
        UPDATE_STATUS_IND) =
    ( SELECT distinct SEC_PLEDGOR_NAME,
      -- 'RELATIONSHIP',
      -- 'P',
      SEC_INC_NUM_TEXT,
      'U'
      FROM SI_TEMP_SIBS_CO002 t
      WHERE t.SEC_PLEDGOR_ID = a.plg_le_id
	  AND t.IS_VALID = 'Y'
    )
  WHERE a.PLG_LE_ID_SRC_VALUE = 'SIBS'
  AND (a.UPDATE_STATUS_IND is null or a.UPDATE_STATUS_IND <> 'D')
  AND EXISTS (  SELECT 1 FROM SI_TEMP_SIBS_CO002 t1
                WHERE a.plg_le_id = t1.SEC_PLEDGOR_ID
				AND t1.IS_VALID = 'Y');

  commit;
	
  INSERT INTO stage_pledgor_dtl
  ( cms_pledgor_dtl_id,
    PLG_LE_ID,
    PLG_LEGAL_NAME,
    PLG_REL_TYPE_NUM,
    PLG_REL_TYPE_VALUE,
    PLG_INC_NUM_TEXT,
    source_id,
    update_status_ind,
    PLG_LE_ID_SRC_VALUE
  )
  (  SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 2)) as BIGINT),
      SEC_PLEDGOR_ID,
      SEC_PLEDGOR_NAME,
      'RELATIONSHIP',
      'P',
      SEC_INC_NUM_TEXT,
      'SMF',
      'I',
      'SIBS'
      FROM (SELECT distinct SEC_PLEDGOR_ID, SEC_PLEDGOR_NAME, SEC_INC_NUM_TEXT FROM SI_TEMP_SIBS_CO002 t
            WHERE NOT EXISTS (  SELECT 1 FROM stage_pledgor_dtl dtl
                          WHERE t.SEC_PLEDGOR_ID = dtl.plg_le_id
                          AND dtl.PLG_LE_ID_SRC_VALUE = 'SIBS' 
                          AND (dtl.UPDATE_STATUS_IND is null or dtl.UPDATE_STATUS_IND <> 'D') )
            AND t.IS_VALID = 'Y'
            AND (t.CMS_SUB_PROFILE_ID is not null AND t.SEC_PLEDGOR_ID is not null)) as stage_pledgor);
					   
  commit;

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 11);
  commit; 
  
  
  ---------------------------------------------------
  -- Staging Table
  -- STAGE_SEC_PLDGR_MAP
  --
  ---------------------------------------------------

	UPDATE SI_TEMP_SIBS_CO002 t
	SET CMS_STG_PLEDGOR_DTL_ID = 
		( SELECT P.CMS_PLEDGOR_DTL_ID
		  FROM STAGE_PLEDGOR_DTL P
		  WHERE t.SEC_PLEDGOR_ID = P.PLG_LE_ID 
		  AND P.PLG_LE_ID_SRC_VALUE = 'SIBS'
		  AND (P.UPDATE_STATUS_IND is null or P.UPDATE_STATUS_IND <> 'D')
		  order by P.CMS_PLEDGOR_DTL_ID desc
		  fetch first 1 row only )
	WHERE t.IS_VALID = 'Y'
	and t.CMS_SUB_PROFILE_ID is not null 
	AND t.SEC_PLEDGOR_ID is not null;
	commit;
	
  
	UPDATE STAGE_SEC_PLDGR_MAP spm SET UPDATE_STATUS_IND = 'D'
	WHERE spm.SOURCE_ID = 'SMF'
	AND spm.UPDATE_STATUS_IND <> 'D'
	AND EXISTS ( SELECT 1 FROM CMS_STAGE_SECURITY sec, STAGE_PLEDGOR_DTL plg, transaction trx, STP_MASTER_TRANS master
				 WHERE spm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID 
				 AND spm.CMS_PLEDGOR_DTL_ID = plg.CMS_PLEDGOR_DTL_ID 
				 AND sec.SCI_SECURITY_TYPE_VALUE = 'MS'
				 -- AND (sec.STATUS = 'DELETED' OR plg.UPDATE_STATUS_IND = 'D') 
				 AND (plg.UPDATE_STATUS_IND is null or plg.UPDATE_STATUS_IND <> 'D')
				 AND spm.SOURCE_ID = sec.SOURCE_ID 
				 -- AND sec.SOURCE_ID = plg.SOURCE_ID
				 AND plg.PLG_LE_ID_SRC_VALUE = 'SIBS'
				 AND trx.transaction_type = 'COL'
				 AND trx.staging_reference_id = sec.cms_collateral_id
				 and master.TRANSACTION_TYPE='COL'
      				 and master.REFERENCE_ID=trx.reference_id
      				 and master.STATUS='COMPLETE' )
	AND NOT EXISTS ( SELECT 1 FROM SI_TEMP_SIBS_CO002 t1, CMS_STAGE_SECURITY sec1
                         	WHERE sec1.CMS_COLLATERAL_ID = spm.CMS_COLLATERAL_ID
                         	AND sec1.SCI_SECURITY_DTL_ID = t1.SRC_SECURITY_ID
                         	AND sec1.SOURCE_ID = spm.SOURCE_ID );

	commit;
	
	
	INSERT INTO STAGE_SEC_PLDGR_MAP
	( cms_sec_pldgr_map_id,
		spm_sec_id,
		cms_pledgor_dtl_id,
		cms_collateral_id,
		SEC_PLEDGOR_RELATIONSHIP_NUM,
		SEC_PLEDGOR_RELATIONSHIP_VALUE,
		update_status_ind,
		source_id
	)
	( SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR PLEDGOR_SEQ), 2)) as BIGINT),
		t.SRC_SECURITY_ID,
		t.CMS_STG_PLEDGOR_DTL_ID,
		(select sec.cms_collateral_id
        		from CMS_STAGE_SECURITY sec
        		where sec.SCI_SECURITY_DTL_ID = t.SRC_SECURITY_ID
        		and sec.SOURCE_ID = 'SMF'
        		order by sec.cms_collateral_id desc
        		FETCH FIRST 1 ROW ONLY),
      		'RELATIONSHIP',
      		'P',
		'I', 'SMF'
		FROM SI_TEMP_SIBS_CO002 t
		WHERE t.IS_VALID = 'Y' 
		-- AND t.CMS_STG_COLLATERAL_ID IS NOT NULL 
		AND t.CMS_STG_PLEDGOR_DTL_ID IS NOT NULL 
		AND NOT EXISTS (  SELECT 1 FROM STAGE_SEC_PLDGR_MAP tmp
						  WHERE tmp.cms_collateral_id = (select sec1.cms_collateral_id
        									from CMS_STAGE_SECURITY sec1
        									where sec1.SCI_SECURITY_DTL_ID = t.SRC_SECURITY_ID
        									and sec1.SOURCE_ID = 'SMF'
        									order by sec1.cms_collateral_id desc
        									FETCH FIRST 1 ROW ONLY)
						  AND tmp.cms_pledgor_dtl_id = t.CMS_STG_PLEDGOR_DTL_ID 
						  AND tmp.source_id = 'SMF'));
					  
	commit;
	
	-- Set reference id
	UPDATE STAGE_SEC_PLDGR_MAP spm
	SET SPM_ID = (select spm1.cms_sec_pldgr_map_id from STAGE_SEC_PLDGR_MAP spm1
					where spm1.cms_sec_pldgr_map_id = spm.cms_sec_pldgr_map_id
					AND spm1.source_id = 'SMF')
	WHERE SPM_ID is null
	and source_id = 'SMF';
	commit;
	
	
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 12);
  commit;  


  ---------------------------------------------------
  -- Actual Table
  -- SCI_SEC_PLDGR_MAP
  --
  ---------------------------------------------------
  
	UPDATE SI_TEMP_SIBS_CO002 t
	SET CMS_ACT_PLEDGOR_DTL_ID = 
		( SELECT P.CMS_PLEDGOR_DTL_ID
		  FROM SCI_PLEDGOR_DTL P
		  WHERE t.SEC_PLEDGOR_ID = P.PLG_LE_ID 
		  AND P.PLG_LE_ID_SRC_VALUE = 'SIBS'
		  AND (P.UPDATE_STATUS_IND is null or P.UPDATE_STATUS_IND <> 'D')
		  order by P.CMS_PLEDGOR_DTL_ID desc
		  fetch first 1 row only )
	WHERE t.IS_VALID = 'Y'
	and t.CMS_SUB_PROFILE_ID is not null 
	AND t.SEC_PLEDGOR_ID is not null;
	commit;  

  
	UPDATE SCI_SEC_PLDGR_MAP spm SET UPDATE_STATUS_IND = 'D'
	WHERE spm.SOURCE_ID = 'SMF'
	AND spm.UPDATE_STATUS_IND <> 'D'	
	AND 'COMPLETE' = ( select master.STATUS
		           	from STP_MASTER_TRANS master
		              	where master.TRANSACTION_TYPE='COL'
                              	and master.REFERENCE_ID=spm.CMS_COLLATERAL_ID )	
	AND EXISTS ( SELECT 1 FROM CMS_SECURITY sec, SCI_PLEDGOR_DTL plg
				 WHERE spm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID 
				 AND spm.CMS_PLEDGOR_DTL_ID = plg.CMS_PLEDGOR_DTL_ID 
				 AND sec.SCI_SECURITY_TYPE_VALUE = 'MS'
				 AND spm.SOURCE_ID = sec.SOURCE_ID 
				 -- AND sec.SOURCE_ID = plg.SOURCE_ID
				 AND (plg.UPDATE_STATUS_IND is null or plg.UPDATE_STATUS_IND <> 'D')
				 AND plg.PLG_LE_ID_SRC_VALUE = 'SIBS'
				 -- AND trx.transaction_type = 'COL'
				 -- AND trx.staging_reference_id = sec.cms_collateral_id 
				 )
	AND NOT EXISTS ( SELECT 1 FROM SI_TEMP_SIBS_CO002 t1, CMS_SECURITY sec1
                         	WHERE sec1.CMS_COLLATERAL_ID = spm.CMS_COLLATERAL_ID
                         	AND sec1.SCI_SECURITY_DTL_ID = t1.SRC_SECURITY_ID
                         	AND sec1.SOURCE_ID = spm.SOURCE_ID );

	commit;
	
  	
	INSERT INTO SCI_SEC_PLDGR_MAP
	( cms_sec_pldgr_map_id,
		spm_sec_id,
		cms_pledgor_dtl_id,
		cms_collateral_id,
		SEC_PLEDGOR_RELATIONSHIP_NUM,
		SEC_PLEDGOR_RELATIONSHIP_VALUE,
		update_status_ind,
		source_id
	)
	( SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR PLEDGOR_SEQ), 2)) as BIGINT),
		t.SRC_SECURITY_ID,
		t.CMS_ACT_PLEDGOR_DTL_ID,
		(select sec.cms_collateral_id
        		from CMS_SECURITY sec
        		where sec.SCI_SECURITY_DTL_ID = t.SRC_SECURITY_ID
        		and sec.SOURCE_ID = 'SMF'
        		order by sec.cms_collateral_id desc
        		FETCH FIRST 1 ROW ONLY),
      		'RELATIONSHIP',
      		'P',
		'I', 'SMF'
		FROM SI_TEMP_SIBS_CO002 t
		WHERE t.IS_VALID = 'Y' 
		-- AND t.CMS_COLLATERAL_ID IS NOT NULL 
		AND t.CMS_ACT_PLEDGOR_DTL_ID IS NOT NULL 
		AND NOT EXISTS ( SELECT 1 FROM SCI_SEC_PLDGR_MAP tmp
						  WHERE tmp.cms_collateral_id = (select sec1.cms_collateral_id
        									from CMS_SECURITY sec1
        									where sec1.SCI_SECURITY_DTL_ID = t.SRC_SECURITY_ID
        									and sec1.SOURCE_ID = 'SMF'
        									order by sec1.cms_collateral_id desc
        									FETCH FIRST 1 ROW ONLY)
						  AND tmp.cms_pledgor_dtl_id = t.CMS_ACT_PLEDGOR_DTL_ID 
						  AND tmp.source_id = 'SMF'));
					  
	commit;


	-- auto create transaction
	CALL si_auto_create_transaction_for_collateral;
	
	-- UPDATE SCI_SEC_PLDGR_MAP spm
	-- SET SPM_ID = (select sspm.cms_sec_pldgr_map_id from STAGE_SEC_PLDGR_MAP sspm, transaction trx
	-- 				where trx.transaction_type = 'COL'
	-- 				and trx.reference_id = spm.cms_collateral_id
	-- 				and trx.staging_reference_id = sspm.cms_collateral_id
	-- 				and spm.source_id = sspm.source_id)
	-- WHERE SPM_ID is null
	-- AND source_id = 'SMF';	
	
	-- Set reference id point to staging reference id
	UPDATE SCI_SEC_PLDGR_MAP spm
		SET SPM_ID = (select sspm.cms_sec_pldgr_map_id from STAGE_SEC_PLDGR_MAP sspm, 
				transaction trx, SCI_PLEDGOR_DTL act_pld, STAGE_PLEDGOR_DTL stg_pld
		where trx.transaction_type = 'COL'
		and trx.reference_id = spm.cms_collateral_id
		and trx.staging_reference_id = sspm.cms_collateral_id
		and spm.source_id = sspm.source_id
		and spm.CMS_PLEDGOR_DTL_ID = act_pld.CMS_PLEDGOR_DTL_ID
		and sspm.CMS_PLEDGOR_DTL_ID = stg_pld.CMS_PLEDGOR_DTL_ID
		and act_pld.PLG_LE_ID = stg_pld.PLG_LE_ID
		order by sspm.cms_sec_pldgr_map_id desc
		fetch first 1 row only )
	WHERE SPM_ID is null
	AND source_id = 'SMF';	
	COMMIT;

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 13);
  commit; 
  
  
  ---------------------------------------------------
  -- Actual Table
  -- STP_MASTER_TRANS
  --
  ---------------------------------------------------

    UPDATE SI_TEMP_SIBS_CO002 a
        set (CMS_ACT_COL_ID, COL_TRANSACTION_ID) = 
		(select trx.REFERENCE_ID, trx.TRANSACTION_ID
		  from CMS_SECURITY sec, TRANSACTION trx
                      where trx.reference_id = sec.CMS_COLLATERAL_ID
                      and trx.TRANSACTION_TYPE = 'COL'
                      and sec.SCI_SECURITY_DTL_ID = a.SRC_SECURITY_ID
                      and sec.SOURCE_ID = 'SMF'
    		      and sec.STATUS <> 'DELETED'
                      order by sec.CMS_COLLATERAL_ID desc
                      fetch first 1 row only)
    where a.is_valid = 'Y';
    commit;
        
    INSERT INTO STP_MASTER_TRANS (MASTER_TRX_ID, TRANSACTION_ID, STATUS, TRANSACTION_TYPE, 
                                  REFERENCE_ID, LAST_SUBMISSION_DATE)
    (
    	SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_MASTER_TRANS_SEQ), 2)) AS BIGINT), 
    		   a.COL_TRANSACTION_ID, 'COMPLETE', 'COL', a.CMS_ACT_COL_ID, CURRENT_TIMESTAMP
    	from SI_TEMP_SIBS_CO002 a
    	where a.COL_TRANSACTION_ID is not null
    	and a.CMS_ACT_COL_ID is not null
    	and not exists (select 1 from stp_master_trans mTrans
    		where mTrans.transaction_id = a.COL_TRANSACTION_ID
    		and mTrans.reference_id = a.CMS_ACT_COL_ID
    		and mTrans.transaction_type = 'COL')
    );    
    commit;

  
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 14);
  commit;


  -------------------------------------
  -- Tag DELETED for non-exist records
  -- Actual Table
  -- CMS_SECURITY
  --
  -------------------------------------
  UPDATE cms_security a
  SET (DELETED_DATE, status) =
  (current_timestamp, 'DELETED')
    WHERE source_id = 'SMF'
      AND status = 'ACTIVE'  
      AND SCI_SECURITY_TYPE_VALUE = 'MS'
      AND 'CO002' = ( select s.INTERFACE_ID
                      from cms_security_source s
                      where s.SOURCE_ID=a.SOURCE_ID
                      and s.SOURCE_SECURITY_ID=a.SCI_SECURITY_DTL_ID  )
      AND 'COMPLETE' = ( select master.STATUS
      		           	from STP_MASTER_TRANS master
      		              	where master.TRANSACTION_TYPE='COL'
                              	and master.REFERENCE_ID=a.CMS_COLLATERAL_ID )                      
      AND NOT EXISTS (SELECT '1' FROM si_temp_SIBS_CO002
             WHERE a.sci_security_dtl_id = src_security_id
               -- and is_valid = 'Y'
               );
  commit;             

  -------------------------------------
  -- Tag DELETED for non-exist records
  -- Staging Table
  -- CMS_STAGE_SECURITY
  --
  -------------------------------------
  UPDATE cms_stage_security a
  set (DELETED_DATE, status) =
  (current_timestamp, 'DELETED')
   WHERE source_id = 'SMF'
      AND status = 'ACTIVE'
      AND SCI_SECURITY_TYPE_VALUE = 'MS'
      AND 'CO002' = (select s.INTERFACE_ID
                      from cms_security_source s
                      where s.SOURCE_ID=a.SOURCE_ID
                      and s.SOURCE_SECURITY_ID=a.SCI_SECURITY_DTL_ID)
      AND NOT EXISTS (SELECT '1' FROM si_temp_SIBS_CO002 t
             WHERE a.sci_security_dtl_id = t.src_security_id
               -- and is_valid = 'Y'
               )
      AND cms_collateral_id IN (SELECT staging_reference_id
                                FROM transaction trx, STP_MASTER_TRANS master
                                WHERE master.TRANSACTION_TYPE='COL'
                                AND master.REFERENCE_ID=trx.REFERENCE_ID
                                AND master.STATUS='COMPLETE'
                                AND trx.reference_id IN (SELECT cms_collateral_id 
                                                        FROM cms_security b
                                                        WHERE b.source_id = 'SMF'
                                                        AND a.SCI_SECURITY_DTL_ID = b.sci_security_dtl_id
                                                        )
                                AND trx.transaction_type = 'COL');
  commit;                                

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 15);
  commit;

  -------------------------------------
  -- Tag DELETED for non-exist records
  -- Actual Table
  -- CMS_PORTFOLIO_ITEM
  --
  -------------------------------------
  UPDATE cms_portfolio_item a
  set (status) = ('DELETED')
  WHERE source_id = 'SMF'
  AND status = 'ACTIVE'
  AND EXISTS (SELECT '1' FROM cms_marketable_sec m, cms_security sec
              WHERE sec.cms_collateral_id = m.cms_collateral_id
              AND sec.SCI_SECURITY_TYPE_VALUE = 'MS'
              AND 'CO002' = ( select s.INTERFACE_ID
                              from cms_security_source s
                              where s.SOURCE_ID=sec.SOURCE_ID
                              and s.SOURCE_SECURITY_ID=sec.SCI_SECURITY_DTL_ID  )
              AND a.cms_collateral_id = m.cms_collateral_id
              AND sec.source_id = 'SMF'  )
  AND 'COMPLETE' = ( select master.STATUS
    			from STP_MASTER_TRANS master
        		where master.TRANSACTION_TYPE='COL'
                        and master.REFERENCE_ID=a.CMS_COLLATERAL_ID )            
  AND NOT EXISTS (SELECT '1' FROM cms_marketable_sec m1, cms_security sec1, si_temp_SIBS_CO002 t1
                  WHERE a.cms_collateral_id = m1.cms_collateral_id
                  AND sec1.cms_collateral_id = m1.cms_collateral_id
                  AND sec1.sci_security_dtl_id = t1.src_security_id 
                  AND sec1.source_id = 'SMF'
                  --AND IS_VALID = 'Y'
                  );
  commit;                

  -------------------------------------
  -- Tag DELETED for non-exist records
  -- Staging Table
  -- CMS_STAGE_PORTFOLIO_ITEM
  --
  -------------------------------------
  UPDATE cms_stage_portfolio_item a
  set (status) = ('DELETED')
  WHERE source_id = 'SMF'
  and status = 'ACTIVE'
  AND EXISTS (SELECT '1' FROM cms_stage_marketable_sec m, cms_stage_security sec, TRANSACTION trx
              WHERE sec.cms_collateral_id = m.cms_collateral_id
              AND trx.STAGING_REFERENCE_ID = sec.CMS_COLLATERAL_ID
	      AND trx.TRANSACTION_TYPE = 'COL'
              AND sec.SCI_SECURITY_TYPE_VALUE = 'MS'
              AND 'CO002' = ( select s.INTERFACE_ID
                              from cms_security_source s
                              where s.SOURCE_ID=sec.SOURCE_ID
                              and s.SOURCE_SECURITY_ID=sec.SCI_SECURITY_DTL_ID )
              AND 'COMPLETE' = ( select master.STATUS
	            		 from STP_MASTER_TRANS master
	                	 where master.TRANSACTION_TYPE='COL'
                        	 and master.REFERENCE_ID=trx.REFERENCE_ID )                
              AND a.cms_collateral_id = m.cms_collateral_id
              AND source_id = 'SMF')
      and NOT EXISTS (SELECT '1' FROM cms_stage_marketable_sec m1, cms_stage_security sec1, 
              si_temp_SIBS_CO002 t
              WHERE a.cms_collateral_id = m1.cms_collateral_id
              AND sec1.cms_collateral_id = m1.cms_collateral_id
              AND sec1.sci_security_dtl_id = t.src_security_id 
              AND sec1.source_id = 'SMF'
              -- and t.is_valid = 'Y'
              -- and trx.transaction_type = 'COL'
              -- and trx.staging_reference_id = sec1.cms_collateral_id
              );
  commit;            

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 16);
  commit;
  
  ------------------------------------
  -- Tag DELETED for non-exist records
  -- cms_security_source
  --
  ------------------------------------
  UPDATE cms_security_source css
  SET(STATUS, last_update_date) =
  ('DELETED', current_timestamp)
    WHERE source_id = 'SMF'
    AND status = 'ACTIVE'
    -- AND security_sub_type_id = 'MS'
    AND interface_id = 'CO002'
    AND 'COMPLETE' = ( select master.STATUS
        		from STP_MASTER_TRANS master
            		where master.TRANSACTION_TYPE='COL'
                        and master.REFERENCE_ID=css.CMS_COLLATERAL_ID )
    AND NOT EXISTS (SELECT 1 FROM si_temp_SIBS_CO002 t
                    WHERE css.source_security_id = t.src_security_id 
                    -- AND t.is_valid = 'Y'
                    );
  commit;                  
  

  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SIBS_CO002', 'SIBS', 0);
  commit;
END
@


CREATE PROCEDURE SI_RUN_ALL_SIBS
  LANGUAGE SQL
BEGIN
  DECLARE v_load_type VARCHAR(50) DEFAULT 'FULL';
  DECLARE v_count INTEGER;
    
  SELECT COUNT(*) INTO v_count FROM si_temp_SIBS_cu001;
  IF v_count > 0 THEN
    call SI_VALIDATE_TEMP_SIBS_CU001;
    call SI_RUN_TEMP_SIBS_CU001;
    call UTIL_TRUNCATE_TABLE('si_temp_SIBS_cu001');
  END IF;

  SELECT COUNT(*) INTO v_count FROM si_temp_SIBS_cu003;
  IF v_count > 0 THEN
    call SI_VALIDATE_TEMP_SIBS_CU003;
    call SI_RUN_TEMP_SIBS_CU003;
    call UTIL_TRUNCATE_TABLE('si_temp_SIBS_cu003');
  END IF;
  
  SELECT COUNT(*) INTO v_count FROM si_temp_SIBS_ca001;
  IF v_count > 0 THEN
    call SI_VALIDATE_TEMP_SIBS_CA001;
    call SI_RUN_TEMP_SIBS_CA001;
    call UTIL_TRUNCATE_TABLE('si_temp_SIBS_ca001');
  END IF;

  SELECT COUNT(*) INTO v_count FROM si_temp_SIBS_ca004;
  IF v_count > 0 THEN
    call SI_VALIDATE_TEMP_SIBS_CA004;
    call SI_RUN_TEMP_SIBS_CA004;
    call UTIL_TRUNCATE_TABLE('si_temp_SIBS_ca004');
  END IF;

  SELECT COUNT(*) INTO v_count FROM si_temp_SIBS_CO001;
  IF v_count > 0 THEN
    call SI_VALIDATE_TEMP_SIBS_CO001;
    call SI_RUN_TEMP_SIBS_CO001;
    call UTIL_TRUNCATE_TABLE('si_temp_SIBS_CO001');
  END IF;


  SELECT COUNT(*) INTO v_count FROM si_temp_SIBS_CO002;
  IF v_count > 0 THEN
    call SI_VALIDATE_TEMP_SIBS_CO002;
    call SI_RUN_TEMP_SIBS_CO002;
    call UTIL_TRUNCATE_TABLE('si_temp_SIBS_CO002');
  END IF;

call SI_AUTO_CREATE_TRANSACTION;

  -- SELECT COUNT(*) INTO v_count FROM si_temp_SIBS_PF004;
  -- IF v_count > 0 THEN
  --   call SI_VALIDATE_TEMP_SIBS_PF004;
  --   call SI_RUN_TEMP_SIBS_PF004;
  --   call UTIL_TRUNCATE_TABLE('si_temp_SIBS_PF004');
  -- END IF;


END
@

commit work
@
