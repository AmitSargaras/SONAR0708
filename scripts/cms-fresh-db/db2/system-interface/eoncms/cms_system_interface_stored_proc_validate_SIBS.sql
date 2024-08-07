-- SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM, CMS_LOCAL@

DROP PROCEDURE SI_VALIDATE_TEMP_SIBS_CU001@
DROP PROCEDURE SI_VALIDATE_TEMP_SIBS_CU003@
DROP PROCEDURE SI_VALIDATE_TEMP_SIBS_CA001@
DROP PROCEDURE SI_VALIDATE_TEMP_SIBS_CA004@
DROP PROCEDURE SI_VALIDATE_TEMP_SIBS_CO001@
DROP PROCEDURE SI_VALIDATE_TEMP_SIBS_CO002@


        ---------------------------------
        -- SIBS - CU001 Customer Information
        --
        ---------------------------------
CREATE PROCEDURE SI_VALIDATE_TEMP_SIBS_CU001
  LANGUAGE SQL
BEGIN
        CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CU001', 'SIBS', 1);
        commit;

        ---------------------------------
        -- Check for Mandatory Fields
        --
        ---------------------------------
        UPDATE SI_TEMP_SIBS_CU001 a SET is_valid = 'N'
        WHERE length(trim(RECORD_TYPE))=0
          OR length(trim(CIF_ID))=0
          OR length(trim(CUST_NAME_L))=0
          OR length(trim(CUST_NAME_S))=0
          OR length(trim(CUST_CLASS_CODE))=0
          OR length(trim(ID_TYPE_CODE))=0
          OR length(trim(ID_NUMBER))=0;
        commit;

        INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value,error_code, error_msg)
         (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CU001', CIF_ID, 'TechErrSI002',
          '[L] Mandatory Field(s): ' 
           || SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
           || SI_BVL(CIF_ID, ' [CIF_ID] ')
           || SI_BVL(CUST_NAME_L, ' [CUST_NAME_L] ')
           || SI_BVL(CUST_NAME_S, ' [CUST_NAME_S] ')
           || SI_BVL(CUST_CLASS_CODE, ' [CUST_CLASS_CODE] ')
           || SI_BVL(ID_TYPE_CODE, ' [ID_TYPE_CODE] ')
           || SI_BVL(ID_NUMBER, ' [ID_NUMBER] ')
           || ' is/are empty.'
          FROM SI_TEMP_SIBS_CU001
          WHERE is_valid = 'N');
        commit;

        CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CU001', 'SIBS', 2);
        commit;

	  ---------------------------------
	  -- Check for duplicate records
	  --
	  ---------------------------------
          UPDATE SI_TEMP_SIBS_CU001 a set is_valid = 'N'
          where a.cif_id in (select t.cif_id
				  from SI_TEMP_SIBS_CU001 t
				  group by t.cif_id
				  having count(*) > 1)
          and a.is_valid = 'Y';
          commit;

	  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	  (select current_timestamp, 'SIBS', 'CU001', cif_id, 'BizErr004', 
                '[M] Duplicate CIF Id [' 
                || cif_id || '] - ' || trim(char(count(*))) || ' records found'
          from SI_TEMP_SIBS_CU001 where is_valid = 'N'
          group by cif_id
          having count(*) > 1);
          commit;

          CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CU001', 'SIBS', 3);
          commit;

        -----------------------------------------
        -- Check for Dependency
        -- to check against SCI_LE_MAIN_PROFILE
        --
        -----------------------------------------

        UPDATE si_TEMP_SIBS_cu001 a
        SET is_valid = 'N'
        WHERE NOT EXISTS (SELECT 1 FROM sci_le_main_profile
                           WHERE lmp_le_id = a.cif_id
                           AND source_id = 'SIBS')
        and is_valid = 'Y';
        commit;

        INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
          (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CU001', cif_id, 'BizErr003', 
            '[H] Failed to find customer info for CIF Id [' || cif_id || '] from SIBS CU001 interface file'
            FROM si_TEMP_SIBS_cu001 
            WHERE is_valid = 'N'
            AND NOT EXISTS (SELECT '1' FROM sci_le_main_profile
                             WHERE lmp_le_id = cif_id
                             AND source_id = 'SIBS')
          );
        commit;

        CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CU001', 'SIBS', 0);
        commit;
END
@


        ---------------------------------
        -- SIBS - CU003 Customer Fusion
        --
        ---------------------------------
CREATE PROCEDURE SI_VALIDATE_TEMP_SIBS_CU003
  LANGUAGE SQL
BEGIN
        CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CU003', 'SIBS', 1);
        commit;

        ---------------------------------
        -- Check for Mandatory Fields
        --
        ---------------------------------
        UPDATE SI_TEMP_SIBS_CU003 a SET is_valid = 'N'
        WHERE length(RECORD_TYPE)=0
        OR length(OLD_CIF_ID)=0
        OR length(NEW_CIF_ID)=0;
        commit;

        INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
        (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CU003', OLD_CIF_ID, NEW_CIF_ID, 'TechErrSI002',
            '[L] Mandatory Field(s): ' 
            || SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
            || SI_BVL(OLD_CIF_ID, ' [OLD_CIF_ID] ')
            || SI_BVL(NEW_CIF_ID, ' [NEW_CIF_ID] ')
            || ' is/are empty.'
     	FROM SI_TEMP_SIBS_CU003
    	WHERE is_valid = 'N');
    	commit;

          ---------------------------------
          -- Check for duplicate records
          --
          ---------------------------------
        UPDATE SI_TEMP_SIBS_CU003 a set is_valid = 'N'
        where exists (select 1
                from SI_TEMP_SIBS_CU003 t
                where t.NEW_CIF_ID=a.NEW_CIF_ID
                and t.OLD_CIF_ID=a.OLD_CIF_ID
                having count(*) > 1)
        and a.is_valid = 'Y';
        commit;

        INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
        (select current_timestamp, 'SIBS', 'CU003',  OLD_CIF_ID, NEW_CIF_ID, 'BizErr004', 
          '[M] Duplicate OLD CIF ID [' || OLD_CIF_ID 
          || '] NEW CIF ID [' || NEW_CIF_ID || '] - ' || trim(char(count(*))) || ' records found'
          from SI_TEMP_SIBS_CU003 a
          where exists (select 1
                        from SI_TEMP_SIBS_CU003 t
                        where t.NEW_CIF_ID=a.NEW_CIF_ID and t.OLD_CIF_ID=a.OLD_CIF_ID
                        having count(*) > 1 )
          and is_valid = 'N'
          group by OLD_CIF_ID, NEW_CIF_ID
        );
	commit;
	
        -----------------------------------------
        -- Check for Dependency, non-existence of record
        -- to check against SCI_LE_MAIN_PROFILE
        --
        -----------------------------------------
        UPDATE SI_TEMP_SIBS_CU003 a SET is_valid = 'N'
        WHERE NOT EXISTS (SELECT 1 FROM sci_le_main_profile
                          WHERE lmp_le_id = a.OLD_CIF_ID
                          AND source_id = 'SIBS')
        and is_valid = 'Y';
        commit;

        INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
        (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CU003', OLD_CIF_ID, NEW_CIF_ID, 'BizErr003', 
         '[H] Failed to find customer info for Old CIF Id [' || OLD_CIF_ID ||'] from Database'
         FROM SI_TEMP_SIBS_CU003 
         WHERE is_valid = 'N'
         AND NOT EXISTS (SELECT 1 FROM sci_le_main_profile
                         WHERE lmp_le_id = OLD_CIF_ID
                         AND source_id = 'SIBS')
        );  
        commit;
        
        -- UPDATE SI_TEMP_SIBS_CU003 a SET is_valid = 'N'
        -- WHERE NOT EXISTS (SELECT '1' FROM sci_le_main_profile
        --                   WHERE lmp_le_id = a.NEW_CIF_ID
        --                   AND source_id = 'SIBS')
        -- and is_valid = 'Y';
        -- commit;

        -- INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
        -- (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CU003', OLD_CIF_ID, NEW_CIF_ID, 'BizErr003', 
        --  '[H] Failed to find customer info for New CIF Id [' || NEW_CIF_ID ||'] from SIBS CU001 interface file'
        --  FROM SI_TEMP_SIBS_CU003 
        --  WHERE is_valid = 'N'
        --  AND NOT EXISTS (SELECT '1' FROM sci_le_main_profile
        --                  WHERE lmp_le_id = NEW_CIF_ID
        --                  AND source_id = 'SIBS')
        -- );
        -- commit;

        CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CU003', 'SIBS', 0);
        commit;

END
@

CREATE PROCEDURE SI_VALIDATE_TEMP_SIBS_CA001
  LANGUAGE SQL
BEGIN

	CALL SYSPROC.ADMIN_CMD('REORG TABLE SI_TEMP_SIBS_CA001');

    -----------------------------------------
    -- Check for mandatory records
    --
    -----------------------------------------
  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA001', 'SIBS', 1);
  commit;

  UPDATE SI_TEMP_SIBS_CA001 a
  SET is_valid = 'N'
   WHERE length(trim(RECORD_TYPE))=0
      OR length(trim(AA_NUMBER))=0
      OR length(trim(SRC_LIMIT_ID))=0
      -- OR length(trim(OUT_LIMIT_ID)) = 0
      OR length(trim(FACILITY_TYPE_CODE)) = 0
      OR length(DRAWING_LIMIT_AMT)=0
      OR length(OUTSTANDING_AMT)=0
      OR length(FACILITY_SEQ)=0
      -- OR length(trim(ACCT_TYPE))=0
      OR length(ACCT_SEQ)=0
      OR length(trim(LOC_COUNTRY))=0
      OR length(trim(LOC_ORG_CODE))=0 ;
  commit;

  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA001', AA_NUMBER, SRC_LIMIT_ID, FACILITY_TYPE_CODE, trim(char(FACILITY_SEQ)), 'TechErrSI002',
      '[L] Mandatory Field(s): ' 
      || SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
      || SI_BVL(AA_NUMBER, ' [AA_NUMBER] ')
      || SI_BVL(SRC_LIMIT_ID, ' [SRC_LIMIT_ID] ')
      -- || SI_BVL(OUT_LIMIT_ID, ' [OUT_LIMIT_ID] ')
      || SI_BVL(FACILITY_TYPE_CODE, ' [FACILITY_TYPE_CODE] ')
      || NVL2(char(DRAWING_LIMIT_AMT), '', ' [DRAWING_LIMIT_AMT] ')
      || NVL2(char(OUTSTANDING_AMT), '', ' [OUTSTANDING_AMT] ')
      || NVL2(char(FACILITY_SEQ), '', ' [FACILITY_SEQ] ')
      -- || SI_BVL(ACCT_TYPE, ' [ACCT_TYPE] ')
      || NVL2(char(ACCT_SEQ), '', ' [ACCT_SEQ] ')
      || SI_BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')
      || SI_BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')
      || ' is/are empty.'
     FROM SI_TEMP_SIBS_CA001
    WHERE is_valid = 'N');
   commit;

    CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA001', 'SIBS', 2);
    commit;
    -----------------------------------------
    -- Check for duplicate limit - account records
    --
    -----------------------------------------
    UPDATE SI_TEMP_SIBS_CA001 a
    set is_valid = 'N'
    where (a.SRC_LIMIT_ID, a.external_system_acct_no, a.acct_seq) in 
    (select t.SRC_LIMIT_ID, t.external_system_acct_no, t.acct_seq
	    from SI_TEMP_SIBS_CA001 t
	    group by t.src_limit_id, t.external_system_acct_no, t.acct_seq
	    having count(*) > 1)
    and a.is_valid = 'Y';
    commit;

    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
    (select current_timestamp, 'SIBS', 'CA001', SRC_LIMIT_ID, 'BizErr004', 
      '[M] Duplicate limit info found for Limit Id ['
        || src_limit_id || '] Account Number [' || EXTERNAL_SYSTEM_ACCT_NO 
  	|| '] Account Sequence [' || trim(char(ACCT_SEQ)) || '] - ' 
  	|| trim(char(count(*))) || ' records found'
    from SI_TEMP_SIBS_CA001 
    where is_valid = 'N'
    group by src_limit_id, external_system_acct_no, acct_seq
    having count(*) > 1);
    commit;

    CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA001', 'SIBS', 3);
    commit;

    -----------------------------------------
    -- Check for Dependency
    -- to check against SCI_LSP_LMT_PROFILE
    --
    -----------------------------------------

    --------------------------------
    -- Set limit profile id
    --------------------------------
    -- UPDATE SI_TEMP_SIBS_CA001 a
    -- set cms_act_lmt_profile_id = (select cms_lsp_lmt_profile_id
    --               from sci_lsp_lmt_profile
    --               where llp_bca_ref_num = a.aa_number
    --               -- and source_id = 'SIBS'
    --               order by cms_lsp_lmt_profile_id desc
    --               fetch first 1 row only)
    -- where a.is_valid = 'Y';
    -- commit;
    
    -- UPDATE SI_TEMP_SIBS_CA001 a
    -- set (CMS_ACT_LMT_PROFILE_ID, CMS_STG_LMT_PROFILE_ID) = 
    -- 		(select trx.REFERENCE_ID, trx.STAGING_REFERENCE_ID
    -- 		  from sci_lsp_lmt_profile pro, TRANSACTION trx
    --               where trx.reference_id = pro.cms_lsp_lmt_profile_id
    --               and trx.TRANSACTION_TYPE = 'LIMITPROFILE'
    --               and pro.llp_bca_ref_num = a.aa_number
    --               -- and pro.source_id = 'SIBS'
    --               order by pro.cms_lsp_lmt_profile_id desc
    --               fetch first 1 row only)
    -- where a.is_valid = 'Y';
    -- commit;    

    -- CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA001', 'SIBS', 4);
    -- commit;

    -- update si_temp_SIBS_CA001 a set is_valid = 'N'
    -- where (cms_act_lmt_profile_id is null or cms_stg_lmt_profile_id is null)
    -- and a.is_valid = 'Y';
    -- commit;

    -- INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value,
    -- key4_value, error_code, error_msg)
    -- (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA001', AA_NUMBER, SRC_LIMIT_ID, FACILITY_TYPE_CODE, trim(char(FACILITY_SEQ)),
    -- 'BizErr003', '[H] Failed to find AA info for AA Number [' || aa_number || '] from SIBS CA001 interface file'
    --   FROM SI_TEMP_SIBS_CA001
    --   WHERE is_valid = 'N'
    --   and (cms_act_lmt_profile_id is null or cms_stg_lmt_profile_id is null) );
    -- commit;  

    -- CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA001', 'SIBS', 5);
    -- commit;

  ---------------------------------
  -- Check for duplicate account records
  --
  ---------------------------------
  -- UPDATE SI_TEMP_SIBS_CA001 a
  -- set is_valid = 'N'
  -- where (a.external_system_acct_no, a.acct_seq) in (select t.EXTERNAL_SYSTEM_ACCT_NO, t.ACCT_SEQ
  --   from SI_TEMP_SIBS_CA001 t
  --   group by t.EXTERNAL_SYSTEM_ACCT_NO, t.ACCT_SEQ
  --   having count(*) > 1)
  -- and a.is_valid = 'Y';  
  -- commit;

  -- INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
  -- (select current_timestamp, 'SIBS', 'CA001',  AA_NUMBER, EXTERNAL_SYSTEM_ACCT_NO, trim(char(ACCT_SEQ)), 'BizErr004', 
  -- '[M] Duplicate limit account info found for Account Number [' || EXTERNAL_SYSTEM_ACCT_NO 
  -- || '] Account Sequence [' || trim(char(ACCT_SEQ)) || '] - ' || trim(char(count(*))) || ' records found' 
  -- from SI_TEMP_SIBS_CA001 a
  -- where (a.EXTERNAL_SYSTEM_ACCT_NO, a.ACCT_SEQ) in (select t.EXTERNAL_SYSTEM_ACCT_NO, t.ACCT_SEQ
  --   from SI_TEMP_SIBS_CA001 t
  --   group by t.EXTERNAL_SYSTEM_ACCT_NO, t.ACCT_SEQ
  --   having count(*) > 1)
  --   and is_valid = 'N'
  -- group by AA_NUMBER, EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ);    

  -- CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA001', 'SIBS', 6);
  -- commit;
  
  
  -----------------------------------------
  -- Check for Dependency
  -- to check against SCI_LSP_APPR_LMTS
  --
  -----------------------------------------
  
--     UPDATE SI_TEMP_SIBS_CA001 a
--     set (CMS_ACT_LMT_ID, CMS_STG_LMT_ID, CMS_ACT_LMT_PROFILE_ID) = 
--     		(select trx.REFERENCE_ID, trx.STAGING_REFERENCE_ID, lmt.CMS_LIMIT_PROFILE_ID
--     		  from SCI_LSP_APPR_LMTS lmt, TRANSACTION trx
--                   where trx.reference_id = lmt.CMS_LSP_APPR_LMTS_ID
--                   and trx.TRANSACTION_TYPE = 'LIMIT'
--                   -- and lmt.CMS_LIMIT_PROFILE_ID = a.cms_act_lmt_profile_id
--                   and lmt.LMT_ID = a.SRC_LIMIT_ID
--                   -- and lmt.source_id = 'SIBS'
--                   --order by lmt.CMS_LSP_APPR_LMTS_ID desc
--                   fetch first 1 row only)
--     where a.is_valid = 'Y';
      
	create index temp_sibs_ca001_idx1 on si_temp_sibs_ca001
		(is_valid desc, src_limit_id)
		allow reverse scans
		collect STATISTICS;
		
  	update si_temp_sibs_ca001 a
  	set (cms_act_lmt_id, cms_act_lmt_profile_id) = 
  		(select lmts.cms_lsp_appr_lmts_id, lmts.cms_limit_profile_id
  		from sci_lsp_appr_lmts lmts
  		where lmts.lmt_id = a.src_limit_id)
  	where a.is_valid = 'Y';  	
  	
  	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA001', 'SIBS', 31);  	
  	commit;
  	
  	drop index temp_sibs_ca001_idx1;
  	
  	update si_temp_sibs_ca001 a
  	set cms_stg_lmt_id = (select trx.staging_reference_id
  		from transaction trx
  		where trx.transaction_type = 'LIMIT'
  		and trx.reference_id = cms_act_lmt_id)
  	where is_valid = 'Y'
  	and cms_act_lmt_id is not null;
  	
  	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA001', 'SIBS', 4);
  	commit;
  	
  	call si_runstats('SI_TEMP_SIBS_CA001');
  	
	update SI_TEMP_SIBS_CA001 a set is_valid = 'N'
	where CMS_ACT_LMT_ID is null
	and a.is_valid = 'Y';
	
  	CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA001', 'SIBS', 5);	
	commit;
	  	
--     UPDATE SI_TEMP_SIBS_CA001 a
--     set CMS_STG_LMT_ID = 
--     		(select trx.STAGING_REFERENCE_ID
--     		  from TRANSACTION trx
--                   where trx.reference_id = a.cms_act_lmt_id
--                   and trx.TRANSACTION_TYPE = 'LIMIT')
--     where a.is_valid = 'Y';
--     commit;
--     
--     CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA001', 'SIBS', 6);
--     commit;

--     update SI_TEMP_SIBS_CA001 a set is_valid = 'N'
--     	where (CMS_ACT_LMT_ID is null or CMS_STG_LMT_ID is null)
--     	and a.is_valid = 'Y';	
	
	update SI_TEMP_SIBS_CA001 a set is_valid = 'N'
	where CMS_STG_LMT_ID is null
	and a.is_valid = 'Y';
    
    -- update SI_TEMP_SIBS_CA001 a set is_valid = 'N' 
    --  where a.is_valid >= CHR(0) 
    --    and COALESCE(a.is_valid, a.is_valid) = 'Y' 
    --    and (CMS_ACT_LMT_ID is null or CMS_STG_LMT_ID is null);
    commit;  
    
    CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA001', 'SIBS', 6);
    commit;
  
    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value,
    error_code, error_msg)
    (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA001', AA_NUMBER, SRC_LIMIT_ID, EXTERNAL_SYSTEM_ACCT_NO,
    'BizErr003', '[H] Failed to find Limit info for Limit ID [' || SRC_LIMIT_ID || '] from SIBS CA001 interface file'
      FROM SI_TEMP_SIBS_CA001
      WHERE is_valid = 'N'
      and (CMS_ACT_LMT_ID is null or CMS_STG_LMT_ID is null) );
    commit;  
  
    CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA001', 'SIBS', 7);
    commit;  
  
  -----------------------------------------
  -- Check for Dependency
  -- to check against SCI_LSP_LMT_PROFILE
  --
  -----------------------------------------  
--     UPDATE SI_TEMP_SIBS_CA001 a
--     set (CMS_STG_LMT_PROFILE_ID) = 
--     		(select trx.STAGING_REFERENCE_ID
--     		  from TRANSACTION trx
--                   where trx.reference_id = a.CMS_ACT_LMT_PROFILE_ID
--                   and trx.TRANSACTION_TYPE = 'LIMITPROFILE'
--                   -- and pro.cms_lsp_lmt_profile_id = a.CMS_ACT_LMT_PROFILE_ID
--                   -- and pro.source_id = 'SIBS'
--                   -- order by pro.cms_lsp_lmt_profile_id desc
--                   fetch first 1 row only
--                   )
--     where a.is_valid = 'Y';
--     
--     commit;   

--     CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA001', 'SIBS', 9);
--     commit;

    update si_temp_SIBS_CA001 a set is_valid = 'N'
    where cms_act_lmt_profile_id is null
    	and a.is_valid = 'Y';
    commit;

        
    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value,
    key4_value, error_code, error_msg)
    (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA001', AA_NUMBER, SRC_LIMIT_ID, FACILITY_TYPE_CODE, trim(char(FACILITY_SEQ)),
    'BizErr003', '[H] Failed to find AA info for AA Number [' || aa_number || '] from SIBS CA001 interface file'
      FROM SI_TEMP_SIBS_CA001
      WHERE is_valid = 'N'
      	and cms_act_lmt_profile_id is null 
      	and CMS_ACT_LMT_ID is not null );
    commit;  

--   CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA001', 'SIBS', 10);
--   commit;  
  
  
  
  -----------------------------------------
  -- Check for Dependency
  -- to check against SCI_LSP_APPR_LMTS
  --
  -----------------------------------------
  -- UPDATE SI_TEMP_SIBS_CA001 a
  -- SET is_valid = 'N'
  --  WHERE NOT EXISTS (SELECT 1 FROM SCI_LSP_APPR_LMTS
-- 		     WHERE LMT_BCA_REF_NUM = a.AA_NUMBER
-- 		      AND LMT_FAC_CODE = a.FACILITY_TYPE_CODE
-- 		      AND LMT_FAC_SEQ = a.FACILITY_SEQ
-- 		       AND source_id = 'SIBS')
  --   AND IS_VALID = 'Y';
  -- commit;  

  -- INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
  -- (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA001', AA_NUMBER, FACILITY_TYPE_CODE, trim(char(FACILITY_SEQ)), 'BizErr003', 
  --     '[H] Failed to find limit info for AA Number [' || AA_NUMBER || '] Facility Code [' || FACILITY_TYPE_CODE 
  --     || '] Facility Sequence [' || trim(char(FACILITY_SEQ)) || '] from SIBS CA001 interface file'
  --    FROM SI_TEMP_SIBS_CA001 a
  --   WHERE is_valid = 'N'
  --     AND NOT EXISTS (SELECT 1 FROM SCI_LSP_APPR_LMTS
  --            WHERE LMT_BCA_REF_NUM = a.AA_NUMBER
  --             AND LMT_FAC_CODE = a.FACILITY_TYPE_CODE
  --             AND LMT_FAC_SEQ = a.FACILITY_SEQ
  --              AND source_id = 'SIBS')
  -- );
  -- commit;
  
--   CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA001', 'SIBS', 9);
--   commit;

  ----------------------------------------
  -- Check update status indicator
  -- for D where record non-exist in CMS
  --
  ----------------------------------------
  -- UPDATE SI_TEMP_SIBS_CA001 a
  -- set is_valid = 'N'
  -- where not exists (select 1 from SCI_LSP_SYS_XREF b
  --                   where b.LSX_EXT_SYS_ACCT_NUM = a.EXTERNAL_SYSTEM_ACCT_NO 
  --                   and b.LSX_EXT_SYS_ACCT_SEQ = a.ACCT_SEQ
  --                   and b.LSX_EXT_SYS_CODE_VALUE='SIBS')
  -- and a.is_valid = 'Y';

  -- INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  -- (select current_timestamp, 'SIBS', 'CA001', EXTERNAL_SYSTEM_ACCT_NO, trim(char(ACCT_SEQ)),  'BizErr004', 
  -- '[M] Failed to find deleted account in CMS with Account No [' || EXTERNAL_SYSTEM_ACCT_NO || '] Account Sequence [' || trim(char(ACCT_SEQ)) || ']'
  -- from SI_TEMP_SIBS_CA001 a
  -- WHERE a.is_valid = 'N'
  --   and not exists (select 1 from SCI_LSP_SYS_XREF b
  --     where b.LSX_EXT_SYS_ACCT_NUM = a.EXTERNAL_SYSTEM_ACCT_NO 
  --       and b.LSX_EXT_SYS_ACCT_SEQ = a.ACCT_SEQ
  --       and b.LSX_EXT_SYS_CODE_VALUE='SIBS'));

  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA001', 'SIBS', 0); 
  commit;

END
@




  ---------------------------------
  --
  --  SI_VALIDATE_TEMP_SIBS_CA004
  --
  ---------------------------------
CREATE PROCEDURE SI_VALIDATE_TEMP_SIBS_CA004
  LANGUAGE SQL
BEGIN
  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA004', 'SIBS', 1);
  commit;

  ---------------------------------
  -- Check for Mandatory records
  --
  ---------------------------------
  UPDATE SI_TEMP_SIBS_CA004 a
  SET is_valid = 'N'
   WHERE length(trim(RECORD_TYPE))=0
      OR length(trim(AA_NUMBER))=0
      OR length(trim(SRC_LIMIT_ID))=0
      -- OR length(trim(OUT_LIMIT_ID)) = 0
      OR length(trim(FACILITY_TYPE_CODE)) = 0
      OR length(trim(EXTERNAL_SYSTEM_ACCT_NO)) = 0
      OR length(trim(NPL_STAT)) = 0
      OR ( length(trim(NPL_STAT)) > 0 and NPL_STAT_DATE is null )
      OR length(FACILITY_SEQ) =0
      OR length(trim(ACCT_TYPE))=0
      OR length(ACCT_SEQ)=0      
      OR length(trim(LOC_COUNTRY))=0
      OR length(trim(LOC_ORG_CODE))=0
      -- OR exists(
      -- select 1 from SCI_LSP_SYS_XREF 
      --   where LSX_BCA_REF_NUM = a.aa_number
      --     and LSX_EXT_SYS_ACCT_NUM=a.EXTERNAL_SYSTEM_ACCT_NO 
      --     and LSX_EXT_SYS_ACCT_TYPE='D'
      --     and LSX_EXT_SYS_CODE_VALUE='SIBS'
      --     and length(trim(a.EXTERNAL_SYSTEM_ACCT_NO))>0
      --     and length(trim(a.AA_NUMBER))>0
      --     -- and length(FACILITY_TYPE_CODE)= 0
      --     -- and length(FACILITY_SEQ) =0
      --    )
          ;
  commit;

  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA004', EXTERNAL_SYSTEM_ACCT_NO, AA_NUMBER, FACILITY_TYPE_CODE, trim(char(FACILITY_SEQ)), 'TechErrSI002',
      '[L] Mandatory Field(s): ' 
      || SI_BVL(RECORD_TYPE, ' [RECORD_TYPE] ')
      || SI_BVL(AA_NUMBER, ' [AA_NUMBER] ')
      || SI_BVL(SRC_LIMIT_ID, ' [SRC_LIMIT_ID] ')
      -- || SI_BVL(OUT_LIMIT_ID, ' [OUT_LIMIT_ID] ')
      || SI_BVL(FACILITY_TYPE_CODE, ' [FACILITY_TYPE_CODE] ')
      || SI_BVL(EXTERNAL_SYSTEM_ACCT_NO, ' [EXTERNAL_SYSTEM_ACCT_NO] ')
      || SI_BVL(NPL_STAT, ' [NPL_STAT] ')
      || ( CASE WHEN (length(trim(NPL_STAT))) > 0 THEN NVL2(char(NPL_STAT_DATE), '', ' [NPL_STAT_DATE] ') ELSE '' END )
      || NVL2(char(FACILITY_SEQ), '', ' [FACILITY_SEQ] ')
      || SI_BVL(ACCT_TYPE, ' [ACCT_TYPE] ')
      || NVL2(char(ACCT_SEQ), '', ' [ACCT_SEQ] ')
      || SI_BVL(LOC_COUNTRY, ' [LOC_COUNTRY] ')      
      || SI_BVL(LOC_ORG_CODE, ' [LOC_ORG_CODE] ')      
      -- || (   CASE WHEN (     select 1 from SCI_LSP_SYS_XREF 
      --   where LSX_BCA_REF_NUM = aa_number
      --     and LSX_EXT_SYS_ACCT_NUM= EXTERNAL_SYSTEM_ACCT_NO 
      --     and LSX_EXT_SYS_ACCT_TYPE='D'
      --     and LSX_EXT_SYS_CODE_VALUE='SIBS'
      --     and length(EXTERNAL_SYSTEM_ACCT_NO)>0
      --     and length(AA_NUMBER)>0
      --     and length(FACILITY_TYPE_CODE)=0        )    >0 THEN ' [FACILITY_TYPE_CODE] ' ELSE '' END      )
      -- || (   CASE WHEN (     select 1 from SCI_LSP_SYS_XREF 
      --   where LSX_BCA_REF_NUM = aa_number
      --     and LSX_EXT_SYS_ACCT_NUM=EXTERNAL_SYSTEM_ACCT_NO 
      --     and LSX_EXT_SYS_ACCT_TYPE='D'
      --     and LSX_EXT_SYS_CODE_VALUE='SIBS'
      --     and length(EXTERNAL_SYSTEM_ACCT_NO)>0
      --     and length(AA_NUMBER)>0
      --     and FACILITY_SEQ=0      )>0 THEN ' [FACILITY_SEQ] ' ELSE '' END           )
      || ' is/are empty.'
     FROM SI_TEMP_SIBS_CA004
    WHERE is_valid = 'N'  );
    commit;

  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA004', 'SIBS', 2);
  commit;
  
  ---------------------------------
  -- Check for duplicate records
  --
  ---------------------------------
  UPDATE SI_TEMP_SIBS_CA004 a
  set is_valid = 'N'
  where (a.AA_NUMBER, a.SRC_LIMIT_ID, a.EXTERNAL_SYSTEM_ACCT_NO, a.ACCT_SEQ) 
  in (select t.AA_NUMBER, t.SRC_LIMIT_ID, t.EXTERNAL_SYSTEM_ACCT_NO, t.ACCT_SEQ
	    from SI_TEMP_SIBS_CA004 t
	    group by t.AA_NUMBER, t.SRC_LIMIT_ID, t.EXTERNAL_SYSTEM_ACCT_NO, t.ACCT_SEQ
	    having count(*) > 1)
  and a.is_valid = 'Y';
  commit;

  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (select current_timestamp, 'SIBS', 'CA004', EXTERNAL_SYSTEM_ACCT_NO, 'BizErr004', 
    '[M] Duplicate NPL-Closed Limit-Acc info found for AA Number [' 
    || AA_NUMBER || '] and Source Limit ID [' 
    || SRC_LIMIT_ID || '] and Account Number [' 
    || EXTERNAL_SYSTEM_ACCT_NO || '] and Account Sequence [' 
    || trim(char(ACCT_SEQ)) || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_SIBS_CA004
  where is_valid = 'N'
  group by AA_NUMBER, SRC_LIMIT_ID, EXTERNAL_SYSTEM_ACCT_NO, ACCT_SEQ
  having count(*) > 1);
  commit;
  
  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA004', 'SIBS', 3);
  commit;  


  -----------------------------------------
  -- Check for Dependency
  -- to check against SCI_LSP_APPR_LMTS
  --
  -----------------------------------------
    UPDATE SI_TEMP_SIBS_CA004 a
    set (CMS_ACT_LMT_ID, CMS_STG_LMT_ID, CMS_ACT_LMT_PROFILE_ID) = 
    		(select trx.REFERENCE_ID, trx.STAGING_REFERENCE_ID, lmt.CMS_LIMIT_PROFILE_ID
    		  from SCI_LSP_APPR_LMTS lmt, TRANSACTION trx
                  where trx.reference_id = lmt.CMS_LSP_APPR_LMTS_ID
                  and trx.TRANSACTION_TYPE = 'LIMIT'
                  -- and lmt.CMS_LIMIT_PROFILE_ID = a.cms_act_lmt_profile_id
                  and lmt.LMT_ID = a.SRC_LIMIT_ID
                  -- and lmt.source_id = 'SIBS'
                  --order by lmt.CMS_LSP_APPR_LMTS_ID desc
                  fetch first 1 row only)
    where a.is_valid = 'Y';
    commit;

    update SI_TEMP_SIBS_CA004 a set is_valid = 'N'
    where (CMS_ACT_LMT_ID is null or CMS_STG_LMT_ID is null)
    and a.is_valid = 'Y';
    commit;  
  
    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value,
    error_code, error_msg)
    (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA004', AA_NUMBER, SRC_LIMIT_ID, EXTERNAL_SYSTEM_ACCT_NO,
    'BizErr003', '[H] Failed to find Limit info for Limit ID [' || SRC_LIMIT_ID || '] from SIBS CA004 interface file'
      FROM SI_TEMP_SIBS_CA004
      WHERE is_valid = 'N'
      and (CMS_ACT_LMT_ID is null or CMS_STG_LMT_ID is null) );
    commit;  
    
    
    -----------------------------------------
    -- Check for Dependency
    -- to check against SCI_LSP_LMT_PROFILE
    --
    -----------------------------------------

    --------------------------------
    -- Set limit profile id
    --------------------------------
    -- UPDATE SI_TEMP_SIBS_CA004 a
    -- set cms_act_lmt_profile_id = (select cms_lsp_lmt_profile_id
    --               from sci_lsp_lmt_profile
    --               where llp_bca_ref_num = a.aa_number
    --               -- and source_id = 'SIBS'
    --               order by cms_lsp_lmt_profile_id desc
    --               fetch first 1 row only)
    -- where a.is_valid = 'Y';
    -- commit;

    update SI_TEMP_SIBS_CA004 a set is_valid = 'N'
    where cms_act_lmt_profile_id is null
    	--and a.CMS_ACT_LMT_ID is not null
    	and a.is_valid = 'Y';
    commit;

    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value,
    error_code, error_msg)
    (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA004', AA_NUMBER, SRC_LIMIT_ID, EXTERNAL_SYSTEM_ACCT_NO,
    'BizErr003', '[H] Failed to find AA info for AA Number [' || aa_number || '] from SIBS CA004 interface file'
      FROM SI_TEMP_SIBS_CA004
      WHERE is_valid = 'N'
      	and cms_act_lmt_profile_id is null
      	and CMS_ACT_LMT_ID is not null 
      	);
    commit; 
    
    
  -----------------------------------------
  -- Check for Dependency
  -- to check against sci_lsp_sys_xref
  --
  -----------------------------------------

  -- UPDATE SI_TEMP_SIBS_CA004 a
  -- SET is_valid = 'N'
  -- WHERE NOT EXISTS (SELECT '1' FROM sci_lsp_sys_xref
  --           WHERE LSX_BCA_REF_NUM = a.aa_number
  --             AND LSX_EXT_SYS_ACCT_NUM = EXTERNAL_SYSTEM_ACCT_NO
  --              AND LSX_EXT_SYS_CODE_VALUE = 'SIBS');
  --  commit; 

  -- INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  -- (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA004', EXTERNAL_SYSTEM_ACCT_NO, 'BizErr003', 
  --     '[H] Failed to find account info for Account Number [' || EXTERNAL_SYSTEM_ACCT_NO 
  --     ||'] from SIBS CA004 interface file.'
  --    FROM SI_TEMP_SIBS_CA004
  --   WHERE is_valid = 'N'
  --     AND NOT EXISTS (SELECT '1' FROM sci_lsp_sys_xref
  --            WHERE LSX_BCA_REF_NUM = aa_number
  --             AND LSX_EXT_SYS_ACCT_NUM = EXTERNAL_SYSTEM_ACCT_NO
  --              AND LSX_EXT_SYS_CODE_VALUE = 'SIBS')
  --  );
  --  commit;

  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CA004', 'SIBS', 0);  
  commit;
END
@


  ----------------------------------------
  -- Validation for SIBS - CO001
  --
  ----------------------------------------
CREATE PROCEDURE SI_VALIDATE_TEMP_SIBS_CO001
  LANGUAGE SQL
BEGIN
  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CO001', 'SIBS', 1);
  COMMIT;

  -----------------------------------------
  -- Check for MANDATORY records
  --
  -----------------------------------------
  UPDATE SI_TEMP_SIBS_CO001
  SET IS_VALID = 'N'
  WHERE length(trim(REF_NO))=0
  OR length(trim(RECEIPT_NUMBER))=0
  OR length(trim(AMT_CURRENCY))=0
  OR length(AMT)=0
  OR length(trim(THIRD_PARTY_BANK))=0
  OR length(FDR_RATE)=0
  OR ISSUE_DATE is null;
  COMMIT;

  INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO001', SECURITY_ID, 'TechErrSI002',
    '[L] Mandatory Field(s): '
    || SI_BVL(REF_NO, ' [REF_NO] ')
    || SI_BVL(RECEIPT_NUMBER, '[RECEIPT_NUMBER] ')
    || SI_BVL(AMT_CURRENCY, ' [AMT_CURRENCY] ')
    || NVL2(char(AMT), '', ' [AMT] ')
    || SI_BVL(THIRD_PARTY_BANK, ' [THIRD_PARTY_BANK] ')
    || NVL2(char(FDR_RATE), '', ' [FDR_RATE] ')
    || NVL2(char(ISSUE_DATE), '', ' [ISSUE_DATE] ')
    || ' is/are empty.'        
  FROM SI_TEMP_SIBS_CO001
  WHERE IS_VALID = 'N');
  COMMIT;
  
  -----------------------------------------
  -- Check for duplicate deposit records (REF_NO + RECEIPT_NUMBER)
  --
  -----------------------------------------
  UPDATE SI_TEMP_SIBS_CO001 a
  set is_valid = 'N'
  where (a.REF_NO, a.RECEIPT_NUMBER) in
    ( select t.REF_NO, t.RECEIPT_NUMBER
      from SI_TEMP_SIBS_CO001 t
      group by t.REF_NO, t.RECEIPT_NUMBER
      having count(*) > 1 )
  and a.is_valid = 'Y';
  COMMIT;

  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (   select current_timestamp, 'SIBS', 'CO001', REF_NO, 'BizErr004', 
      '[M] Duplicate deposit info for Reference No [' || REF_NO || '] and Receipt Number [' 
    || RECEIPT_NUMBER || '] - ' || trim(char(count(*))) || ' records found]'
      from SI_TEMP_SIBS_CO001 where is_valid = 'N'
      group by REF_NO, RECEIPT_NUMBER
      having count(*) > 1 );
  COMMIT;  

  -----------------------------------------
  -- Check for dependency records
  --
  -----------------------------------------
  -- UPDATE SI_TEMP_SIBS_CO001
  -- SET IS_VALID = 'N'
  -- WHERE SECURITY_ID IS NOT NULL
  -- AND NOT EXISTS
  --   ( SELECT 1
  --     FROM CMS_SECURITY s, CMS_CASH c
  --     WHERE s.sci_security_dtl_id = security_id
  --     AND s.source_id = 'SIBS'
  --     AND s.cms_collateral_id = c.cms_collateral_id    )
  -- AND IS_VALID = 'Y';
  -- COMMIT;

  -- INSERT INTO SI_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  -- ( SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO001', SECURITY_ID, 'BizErr003',
  --   '[H] Failed to find security info for Fixed Deposit Security ID [' || security_id || '] from SIBS CO001 interface file'
  --   FROM SI_TEMP_SIBS_CO001
  --   WHERE IS_VALID = 'N'
  --   AND SECURITY_ID IS NOT NULL
  --   AND NOT EXISTS
  --     ( SELECT 1
  --       FROM CMS_SECURITY s, CMS_CASH c
  --       WHERE s.sci_security_dtl_id = security_id
  --       AND s.source_id = 'SIBS'
  --       AND s.cms_collateral_id = c.cms_collateral_id   )
  --  );
  --  COMMIT;
   
  UPDATE SI_TEMP_SIBS_CO001
  SET IS_VALID = 'N'
  WHERE NOT EXISTS
	    ( SELECT 1
	      FROM CMS_CASH_DEPOSIT c
	      WHERE c.DEPOSIT_REFERENCE_NUMBER = REF_NO
	      -- AND c.SOURCE_ID = 'SIBS'
	      AND c.DEPOSIT_RECEIPT_NUMBER = RECEIPT_NUMBER )
  AND IS_VALID = 'Y';
  COMMIT;

  INSERT INTO SI_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  ( SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO001', SECURITY_ID, 'BizErr003',
    '[H] Failed to find Deposit info for Reference No [' || REF_NO || '] and Receipt Number [' 
    || RECEIPT_NUMBER || '] from SIBS CO001 interface file'
    FROM SI_TEMP_SIBS_CO001
    WHERE IS_VALID = 'N'
    AND NOT EXISTS
	    ( SELECT 1
	      FROM CMS_CASH_DEPOSIT c
	      WHERE c.DEPOSIT_REFERENCE_NUMBER = REF_NO
	      -- AND c.SOURCE_ID = 'SIBS'
	      AND c.DEPOSIT_RECEIPT_NUMBER = RECEIPT_NUMBER )
   );
   COMMIT;   

  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CO001', 'SIBS', 0);
  COMMIT;
END
@





CREATE PROCEDURE SI_VALIDATE_TEMP_SIBS_CO002
  LANGUAGE SQL
BEGIN
  CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CO002', 'SIBS', 1);
  commit;
  
  UPDATE SI_TEMP_SIBS_CO002
  SET IS_VALID = 'N'
  WHERE length(trim(SRC_SECURITY_ID))=0
    OR length(trim(ORIG_SECURITY_CURRENCY))=0
    OR length(trim(SECURITY_CURRENCY))=0
    OR length(trim(SECURITY_LOCATION))=0
    OR length(trim(SECURITY_ORGANISATION))=0
    OR length(trim(CUSTODIAN_TYPE))=0
    OR length(trim(SECURITY_CUSTODIAN))=0
    OR length(trim(IS_LEGAL_ENFORCE))=0
    OR (IS_LEGAL_ENFORCE_DATE is NULL)
    OR length(trim(TYPE_NAME))=0
    OR length(NO_OF_UNITS)=0
    OR length(trim(STOCK_EXCHANGE))=0
    OR length(trim(STOCK_CODE))=0
    OR length(trim(LSX_BCA_REF_NUM))=0
    OR length(trim(SCI_LAS_FAC_CODE))=0
    OR length(trim(SCI_LAS_FAC_SEQ))=0;
  commit;

  INSERT INTO SI_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO002', SRC_SECURITY_ID, 'TechErrSI002',
    '[L] Mandatory Field(s): '
    || SI_BVL(SRC_SECURITY_ID, ' [SRC_SECURITY_ID] ')
    || SI_BVL(ORIG_SECURITY_CURRENCY, ' [ORIG_SECURITY_CURRENCY] ')
    || SI_BVL(SECURITY_CURRENCY, '[SECURITY_CURRENCY] ')
    || SI_BVL(SECURITY_LOCATION, ' [SECURITY_LOCATION] ')
    || SI_BVL(SECURITY_ORGANISATION, ' [SECURITY_ORGANISATION] ')
    || SI_BVL(CUSTODIAN_TYPE, ' [CUSTODIAN_TYPE] ')
    || SI_BVL(SECURITY_CUSTODIAN, ' [SECURITY_CUSTODIAN] ')
    || SI_BVL(IS_LEGAL_ENFORCE, ' [IS_LEGAL_ENFORCE] ')
    || NVL2(char(IS_LEGAL_ENFORCE_DATE), '', ' [IS_LEGAL_ENFORCE_DATE] ')
    || SI_BVL(TYPE_NAME, ' [TYPE_NAME] ')
    || NVL2(char(NO_OF_UNITS), '', ' [NO_OF_UNITS] ')
    || SI_BVL(STOCK_EXCHANGE, ' [STOCK_EXCHANGE] ')
    || SI_BVL(STOCK_CODE, ' [STOCK_CODE] ')
    || SI_BVL(LSX_BCA_REF_NUM, ' [LSX_BCA_REF_NUM] ')  
    || SI_BVL(SCI_LAS_FAC_CODE, ' [SCI_LAS_FAC_CODE] ')
    || SI_BVL(SCI_LAS_FAC_SEQ, ' [SCI_LAS_FAC_SEQ] ')
    || ' is/are empty.'
  FROM SI_TEMP_SIBS_CO002
  WHERE IS_VALID = 'N');
  commit;

  -----------------------------------------
  -- Check for duplicate records
  -- by Security ID, Facility Code, Facility Sequence
  -----------------------------------------
  UPDATE SI_TEMP_SIBS_CO002 a
  set is_valid = 'N'
  where (a.SRC_SECURITY_ID, a.LSX_BCA_REF_NUM, a.SCI_LAS_FAC_CODE, a.SCI_LAS_FAC_SEQ) in 
  (select t.SRC_SECURITY_ID, t.LSX_BCA_REF_NUM, t.SCI_LAS_FAC_CODE, t.SCI_LAS_FAC_SEQ
	    from SI_TEMP_SIBS_CO002 t
	    group by t.SRC_SECURITY_ID, t.LSX_BCA_REF_NUM, t.SCI_LAS_FAC_CODE, t.SCI_LAS_FAC_SEQ
	    having count(*) > 1)
  and a.is_valid = 'Y';
  commit;

  INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
  (select current_timestamp, 'SIBS', 'CO002', SRC_SECURITY_ID, LSX_BCA_REF_NUM, SCI_LAS_FAC_CODE, SCI_LAS_FAC_SEQ, 'BizErr004', 
    '[M] Duplicate security info for Shares Margin Financing Security ID [' 
    || COALESCE(SRC_SECURITY_ID, '[SRC_SECURITY_ID is empty]') || '], AA Number [' 
    || COALESCE(LSX_BCA_REF_NUM, '[LSX_BCA_REF_NUM is empty]') || '], Facility Code [' 
    || COALESCE(SCI_LAS_FAC_CODE, '[SCI_LAS_FAC_CODE is empty]') || '] and Facility Sequence [' 
    || COALESCE(SCI_LAS_FAC_SEQ, '[SCI_LAS_FAC_SEQ is empty]') || '] - ' || trim(char(count(*))) || ' records found]'
  from SI_TEMP_SIBS_CO002
  where is_valid = 'N'
  group by SRC_SECURITY_ID, LSX_BCA_REF_NUM, SCI_LAS_FAC_CODE, SCI_LAS_FAC_SEQ
  having count(*) > 1);
  commit;

    ----------------------------------------
    -- Check update status indicator
    -- for D where record non-exist in CMS
    --
    ----------------------------------------
    -- UPDATE SI_TEMP_SIBS_CO002 a
    -- set is_valid = 'N'
    -- where not exists
    -- (select 1 from cms_limit_security_map b
    --   where b.cms_collateral_id =  (select cms_collateral_id
    --     from cms_security
    --     where SCI_SECURITY_DTL_ID = (a.LSX_BCA_REF_NUM||a.SCI_LAS_FAC_CODE||a.SCI_LAS_FAC_SEQ)
    --     --FETCH FIRST 1 ROW ONLY
    --     )
    --   and b.cms_lsp_appr_lmts_id= (select cms_lsp_appr_lmts_id
    --     from sci_lsp_appr_lmts
    --     where LMT_ID = (a.LSX_BCA_REF_NUM||a.SCI_LAS_FAC_CODE||a.SCI_LAS_FAC_SEQ)
    --     --FETCH FIRST 1 ROW ONLY
    --     )
    -- )
    -- and a.is_valid = 'Y';
    -- commit;

    -- INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
    -- (select current_timestamp, 'SIBS', 'CO002', LSX_BCA_REF_NUM , SCI_LAS_FAC_CODE , SCI_LAS_FAC_SEQ , SRC_SECURITY_ID,  'BizErr004', 
    -- '[M] Failed to find deleted limit security mapping in SIBS not found with AA Number [' || LSX_BCA_REF_NUM || '] Facility Code [' || SCI_LAS_FAC_CODE 
    --     || '] Facility Sequence [' || trim(char(SCI_LAS_FAC_SEQ)) || ']'
    -- from SI_TEMP_SIBS_CO002 a
    -- WHERE a.is_valid = 'N'
    --   and not exists (select 1 from cms_limit_security_map b
    --   where b.cms_collateral_id =  (select cms_collateral_id
    --     from cms_security
    --     where SCI_SECURITY_DTL_ID = (a.LSX_BCA_REF_NUM||a.SCI_LAS_FAC_CODE||a.SCI_LAS_FAC_SEQ)
    --     --FETCH FIRST 1 ROW ONLY
    --     )
    --   and b.cms_lsp_appr_lmts_id= (select cms_lsp_appr_lmts_id
    --     from sci_lsp_appr_lmts
    --     where LMT_ID = (a.LSX_BCA_REF_NUM||a.SCI_LAS_FAC_CODE||a.SCI_LAS_FAC_SEQ)
    --     --FETCH FIRST 1 ROW ONLY
    --     )  )
    -- );
    -- commit;
  
  
    -- UPDATE SI_TEMP_SIBS_CO002 a
    -- set is_valid = 'N'
    -- where not exists (select 1 from sci_lsp_appr_lmts
    --     where LMT_FAC_CODE = a.SCI_LAS_FAC_CODE
    --     and LMT_FAC_SEQ = cast(a.SCI_LAS_FAC_SEQ as INTEGER)
    --     )
    --     --FETCH FIRST 1 ROW ONLY
    -- and a.is_valid = 'Y';
    -- commit;

    -- INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
    -- (select current_timestamp, 'SIBS', 'CO002', LSX_BCA_REF_NUM , SCI_LAS_FAC_CODE , SCI_LAS_FAC_SEQ , SRC_SECURITY_ID,  'BizErr004', 
    -- '[M] Failed to find limit in SIBS with AA Number [' || LSX_BCA_REF_NUM || '] Facility Code [' || SCI_LAS_FAC_CODE 
    --     || '] Facility Sequence [' || trim(char(SCI_LAS_FAC_SEQ)) || ']'
    -- from SI_TEMP_SIBS_CO002 a
    -- WHERE a.is_valid = 'N'
    --   and not exists (select 1 from sci_lsp_appr_lmts
    --     where LMT_FAC_CODE = a.SCI_LAS_FAC_CODE
    --     and LMT_FAC_SEQ = cast(a.SCI_LAS_FAC_SEQ as INTEGER)
    --     )
    --     --FETCH FIRST 1 ROW ONLY
    -- );
    -- commit; 
    
    
    ----------------------------------------
    -- Check for dependency records
    -- Limit record (by SCI_LAS_FAC_CODE & SCI_LAS_FAC_SEQ)
    -- 
    ----------------------------------------
    UPDATE SI_TEMP_SIBS_CO002 a
    set (CMS_ACT_LMT_ID, CMS_STG_LMT_ID, CMS_ACT_LMT_PROFILE_ID) = 
    		(select trx.REFERENCE_ID, trx.STAGING_REFERENCE_ID, lmt.CMS_LIMIT_PROFILE_ID
    		  from SCI_LSP_APPR_LMTS lmt, TRANSACTION trx
                  where trx.reference_id = lmt.CMS_LSP_APPR_LMTS_ID
                  and trx.TRANSACTION_TYPE = 'LIMIT'
                  -- and lmt.CMS_LIMIT_PROFILE_ID = a.cms_act_lmt_profile_id
                  and lmt.LMT_BCA_REF_NUM = a.LSX_BCA_REF_NUM
                  and lmt.LMT_FAC_CODE = a.SCI_LAS_FAC_CODE
                  and lmt.LMT_FAC_SEQ = cast(a.SCI_LAS_FAC_SEQ as INTEGER)
                  -- and lmt.source_id = 'SIBS'
                  order by lmt.CMS_LSP_APPR_LMTS_ID desc
                  fetch first 1 row only)
    where a.is_valid = 'Y';
    commit;

    update SI_TEMP_SIBS_CO002 a set is_valid = 'N'
    where (CMS_ACT_LMT_ID is null or CMS_STG_LMT_ID is null)
    and a.is_valid = 'Y';
    commit;  
  
    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value,
    error_code, error_msg)
    (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO002', LSX_BCA_REF_NUM, SCI_LAS_FAC_CODE, SCI_LAS_FAC_SEQ,
    'BizErr003', '[H] Failed to find Limit info for Facility Code [' 
    || COALESCE(SCI_LAS_FAC_CODE, '[SCI_LAS_FAC_CODE is empty]') 
    || '] and Facility Sequence [' || COALESCE(SCI_LAS_FAC_SEQ, '[SCI_LAS_FAC_SEQ is empty]') 
    || '] from SIBS CO002 interface file'
      FROM SI_TEMP_SIBS_CO002
      WHERE is_valid = 'N'
      and (CMS_ACT_LMT_ID is null or CMS_STG_LMT_ID is null) );
    commit;    
     
     
    ----------------------------------------
    -- Check for dependency records
    -- AA record (by CMS_ACT_LMT_PROFILE_ID)
    -- 
    ----------------------------------------
    UPDATE SI_TEMP_SIBS_CO002 a
    set (CMS_SUB_PROFILE_ID) = 
    	(select CMS_CUSTOMER_ID
                  from sci_lsp_lmt_profile
                  where CMS_LSP_LMT_PROFILE_ID = CMS_ACT_LMT_PROFILE_ID
                  -- and source_id = 'SIBS'
                  -- order by cms_lsp_lmt_profile_id desc
                  -- fetch first 1 row only
                  )
    where a.is_valid = 'Y';
    commit;

    update SI_TEMP_SIBS_CO002 a set is_valid = 'N'
    where CMS_ACT_LMT_PROFILE_ID is null
    	and a.CMS_ACT_LMT_ID is not null	
    	and a.is_valid = 'Y';
    commit;

    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value,
    error_code, error_msg)
    (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO002', LSX_BCA_REF_NUM, SCI_LAS_FAC_CODE, SCI_LAS_FAC_SEQ,
    'BizErr003', '[H] Failed to find AA info for AA Number [' || COALESCE(LSX_BCA_REF_NUM, '[LSX_BCA_REF_NUM is empty]') 
    	|| '] from SIBS CO002 interface file'
      FROM SI_TEMP_SIBS_CO002
      WHERE is_valid = 'N'
      	and CMS_ACT_LMT_PROFILE_ID is null
      	and CMS_ACT_LMT_ID is not null );
    commit; 
    
     
  ----------------------------
  -- Update pledgor info in temp table
  -- for SEC_PLEDGOR_ID, SEC_PLEDGOR_NAME, SEC_INC_NUM_TEXT
  ----------------------------  
    UPDATE SI_TEMP_SIBS_CO002 a
    set (SEC_PLEDGOR_ID, SEC_PLEDGOR_NAME, SEC_INC_NUM_TEXT) = 
    		(select main.LMP_LE_ID, main.LMP_SHORT_NAME, CHAR(main.LMP_INC_NUM_TEXT, 30)
    		  from SCI_LE_MAIN_PROFILE main, SCI_LE_SUB_PROFILE sub
                  where main.CMS_LE_MAIN_PROFILE_ID = sub.CMS_LE_MAIN_PROFILE_ID
                  and main.SOURCE_ID = 'SIBS'
                  and sub.CMS_LE_SUB_PROFILE_ID = a.CMS_SUB_PROFILE_ID
                  order by main.CMS_LE_MAIN_PROFILE_ID desc
                  fetch first 1 row only)
    where a.is_valid = 'Y'
    and a.CMS_SUB_PROFILE_ID is not null;
    commit;      
    
    
    ----------------------------------------
    -- Check for customer linkage
    -- 
    ----------------------------------------    
    INSERT INTO si_error_log (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value,
    error_code, error_msg)
    (SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO002', LSX_BCA_REF_NUM, SCI_LAS_FAC_CODE, SCI_LAS_FAC_SEQ,
    'BizErr003', '[H] Failed to find Pledgor info for AA Number [' 
    || COALESCE(LSX_BCA_REF_NUM, '[LSX_BCA_REF_NUM is empty]')  
    || '] from SIBS CO002 interface file'
      FROM SI_TEMP_SIBS_CO002
      WHERE is_valid = 'Y'
      and (CMS_SUB_PROFILE_ID is null OR SEC_PLEDGOR_ID is null) );
    commit;      
     

    CALL SI_LOG_PROC_TIME('SI_VALIDATE_TEMP_SIBS_CO002', 'SIBS', 0);
    commit;
END
@


commit work@