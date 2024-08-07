-- SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM, EONCMS_LOCAL@
DROP PROCEDURE SI_RUN_TEMP_MIMB_CU002@
DROP PROCEDURE SI_RUN_TEMP_MIMB_CA003@
DROP PROCEDURE SI_RUN_TEMP_MIMB_CO003@
DROP PROCEDURE SI_RUN_TEMP_MIMB_CO004@
DROP PROCEDURE SI_RUN_TEMP_MIMB_PF002@

CREATE PROCEDURE SI_RUN_TEMP_MIMB_CU002
  LANGUAGE SQL
BEGIN
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CU002', 'MIMB', 1);--

  -------------------------------------
  -- Auto Feed Std Code
  -- COMMON_CODE_CATEGORY_ENTRY
  -- for customer id_type
  -------------------------------------
  -- FOR cur_std_code AS
    -- SELECT DISTINCT ID_TYPE_CODE code, ID_NO desc,
        -- ID_TYPE_CAT cat, 'MIMB' source_id
      -- FROM SI_TEMP_MIMB_CU002
      -- WHERE LENGTH(ID_TYPE_CODE) > 0
        -- AND LENGTH(ID_NO) > 0
        -- AND IS_VALID = 'Y'
  -- DO
    -- CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);--
  -- END FOR;--

  -------------------------------------
  -- Auto Feed Std Code
  -- COMMON_CODE_CATEGORY_ENTRY
  -- for 
  -------------------------------------
  FOR cur_std_code AS
    SELECT DISTINCT CUST_TYPE_CODE code, CUST_TYPE_DESC desc,
        CUST_TYPE_CAT cat, 'MIMB' source_id
      FROM SI_TEMP_MIMB_CU002
      WHERE LENGTH(CUST_TYPE_CODE) > 0
        AND LENGTH(CUST_TYPE_DESC) > 0
        AND IS_VALID = 'Y'
  DO
    CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);--
  END FOR;--

  -------------------------------------
  -- Auto Feed Std Code
  -- COMMON_CODE_CATEGORY_ENTRY
  -- 
  -------------------------------------
  -- FOR cur_std_code AS
    -- SELECT DISTINCT ORIG_ORGANISATION_CODE code, ORIG_ORGANISATION_DESC desc,
        -- ORIG_ORGANISATION_CAT cat, 'MIMB' source_id
      -- FROM SI_TEMP_MIMB_CU002
      -- WHERE LENGTH(ORIG_ORGANISATION_CODE) > 0
        -- AND LENGTH(ORIG_ORGANISATION_DESC) > 0
        -- AND IS_VALID = 'Y'
  -- DO
    -- CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);--
  -- END FOR;--
  
  -------------------------------------
  -- Auto Feed Std Code
  -- COMMON_CODE_CATEGORY_ENTRY
  -- 
  -------------------------------------
  FOR cur_std_code AS
    SELECT DISTINCT CUST_LEGAL_CONST_CODE code, CUST_LEGAL_CONST_DESC desc,
        CUST_LEGAL_CONST_CAT cat, 'MIMB' source_id
      FROM SI_TEMP_MIMB_CU002
      WHERE LENGTH(CUST_LEGAL_CONST_CODE) > 0
        AND LENGTH(CUST_LEGAL_CONST_DESC) > 0
        AND IS_VALID = 'Y'
  DO
    CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);--
  END FOR;--  

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CU002', 'MIMB', 2);--
  commit;--
  
	-------------------------------------
	-- Temp Table
	-- SI_TEMP_MIMB_CU002
	-- populate main profile id
	--
	-------------------------------------
	
	UPDATE SI_TEMP_MIMB_CU002 a SET cms_le_main_profile_id = 
	(SELECT cms_le_main_profile_id FROM SCI_LE_MAIN_PROFILE
		WHERE lmp_le_id = a.CIF_ID
		AND source_id = 'MIMB')
	WHERE IS_VALID = 'Y';--

	commit;--

  -------------------------------------
  -- Actual Table
  -- SCI_LE_MAIN_PROFILE
  --
  -------------------------------------

  UPDATE sci_le_main_profile a SET (
    LMP_LE_ID,
    LMP_LONG_NAME,
    LMP_SHORT_NAME,
    LMP_ID_TYPE_NUM,
	LMP_ID_TYPE_VALUE,
    LMP_ID_NUMBER,
    LMP_REL_START_DATE,
    LMP_TYPE_NUM,
    LMP_TYPE_VALUE,
    LMP_LEGAL_CONST_NUM,
    LMP_LEGAL_CONST_VALUE,
	LMP_ID_COUNTRY_ISSUED,
	LMP_INC_CNTRY_ISO_CODE,
    source_id) =
    (SELECT CIF_ID,
      LEGAL_NAME,
      CUSTOMER_NAME,
      ID_TYPE_CAT,
      ID_TYPE_CODE,
      ID_NO,
      REL_START_DATE_BANK,
      CUST_TYPE_CAT,
      CUST_TYPE_CODE,
      CUST_LEGAL_CONST_CAT,
      CUST_LEGAL_CONST_CODE,
	  COUNTRY,
	  COUNTRY,
      'MIMB'
      FROM SI_TEMP_MIMB_CU002 t
      WHERE t.CIF_ID = a.LMP_LE_ID 
	  AND t.IS_VALID = 'Y')
  WHERE EXISTS (SELECT 1 FROM SI_TEMP_MIMB_CU002 
				WHERE CIF_ID = a.LMP_LE_ID fetch first row only)
  AND source_id = 'MIMB';--

  INSERT INTO sci_le_main_profile (
    cms_le_main_profile_id,
    LMP_LE_ID,
    LMP_LONG_NAME,
    LMP_SHORT_NAME,
    LMP_ID_TYPE_NUM,
    LMP_ID_TYPE_VALUE,
    LMP_ID_NUMBER,
    LMP_REL_START_DATE,
    LMP_TYPE_NUM,
    LMP_TYPE_VALUE,
    LMP_LEGAL_CONST_NUM,
    LMP_LEGAL_CONST_VALUE,
	LMP_ID_COUNTRY_ISSUED,
	LMP_INC_CNTRY_ISO_CODE,
    source_id)
 (    SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR legal_entity_seq), 2)) as BIGINT),
      CIF_ID,
      LEGAL_NAME,
      CUSTOMER_NAME,
      ID_TYPE_CAT,
      ID_TYPE_CODE,
      ID_NO,
      REL_START_DATE_BANK,
      CUST_TYPE_CAT,
      CUST_TYPE_CODE,
      CUST_LEGAL_CONST_CAT,
      CUST_LEGAL_CONST_CODE,
	  COUNTRY,
	  COUNTRY,
      'MIMB'
      FROM SI_TEMP_MIMB_CU002 t
    WHERE t.IS_VALID = 'Y'
    AND NOT EXISTS ( SELECT 1 FROM sci_le_main_profile
                     WHERE LMP_LE_ID = t.CIF_ID
                     AND source_id = 'MIMB' fetch first row only)
  );--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CU002', 'MIMB', 3);--
  commit;--

  -------------------------------------
  -- Actual Table
  -- SCI_LE_SUB_PROFILE
  --
  -------------------------------------

  UPDATE sci_le_sub_profile a
  SET (
    LSP_ID,
    LSP_LE_ID,
    LSP_SHORT_NAME,
    LSP_DMCL_CNTRY_ISO_CODE,
    CMS_LE_MAIN_PROFILE_ID,
    CMS_SUB_ORIG_COUNTRY) =
  (   SELECT 1,
      LMP_LE_ID,
      LMP_SHORT_NAME,
      LMP_INC_CNTRY_ISO_CODE,
      CMS_LE_MAIN_PROFILE_ID,
      'MY'
    FROM sci_le_main_profile t
    WHERE t.cms_le_main_profile_id = a.cms_le_main_profile_id
    AND source_id = 'MIMB'
    FETCH FIRST 1 ROW ONLY)
    WHERE EXISTS ( SELECT 1 FROM SI_TEMP_MIMB_CU002
                   WHERE CIF_ID = a.LSP_LE_ID
                   AND IS_VALID = 'Y' fetch first row only
                 )
    AND cms_le_main_profile_id IN ( SELECT p.cms_le_main_profile_id
                                    FROM SCI_LE_MAIN_PROFILE p, SI_TEMP_MIMB_CU002
                                    WHERE CIF_ID = LSP_LE_ID AND IS_VALID = 'Y'
                                    AND source_id = 'MIMB'
                                   );--

  INSERT INTO sci_le_sub_profile 
  (    cms_le_sub_profile_id,
       lsp_id, lsp_le_id,
       lsp_short_name,
       lsp_dmcl_cntry_iso_code,
       cms_le_main_profile_id,
       CMS_SUB_ORIG_COUNTRY)
  (   SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR customer_seq), 2)) as BIGINT),
      1, lmp_le_id,
      lmp_short_name,
      lmp_inc_cntry_iso_code,
      cms_le_main_profile_id,
      'MY'
      FROM sci_le_main_profile t
      WHERE NOT EXISTS (  SELECT 1 FROM sci_le_sub_profile 
                          WHERE lsp_le_id = t.lmp_le_id fetch first row only)
      AND source_id = 'MIMB'
  );--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CU002', 'MIMB', 4);--
  COMMIT;--
  
	------------------------------------------
	-- Update Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
	    							      
	FOR cur_lsp_key AS
		SELECT cms_le_sub_profile_id trx_ref_id, 'CUSTOMER' trx_type
		  FROM SCI_LE_SUB_PROFILE a
		 WHERE EXISTS (SELECT 1 FROM SI_TEMP_MIMB_CU002 t
	  				 	WHERE t.CIF_ID = a.lsp_le_id
		  				  AND a.cms_le_sub_profile_id = t.cms_le_sub_profile_id
		  				  AND a.cms_le_main_profile_id = t.cms_le_main_profile_id
	  				   	  AND t.IS_VALID = 'Y' fetch first row only)
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_lsp_key.trx_ref_id, cur_lsp_key.trx_type);--
	END FOR;--
	
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CU002', 'MIMB', 5);--
  COMMIT;--

	-------------------------------------
	-- Temp Table
	-- SI_TEMP_MIMB_CU002
	-- populate sub profile id
	--
	-------------------------------------
	
	UPDATE SI_TEMP_MIMB_CU002 a SET cms_le_main_profile_id = 
	(SELECT cms_le_main_profile_id FROM SCI_LE_MAIN_PROFILE
		WHERE lmp_le_id = a.CIF_ID
		AND source_id = 'MIMB')
	WHERE IS_VALID = 'Y';--
	
	UPDATE SI_TEMP_MIMB_CU002 a SET cms_le_sub_profile_id = 
	(SELECT cms_le_sub_profile_id FROM SCI_LE_SUB_PROFILE
		WHERE lsp_le_id = a.CIF_ID
		AND cms_le_main_profile_id = a.cms_le_main_profile_id)
	 WHERE IS_VALID = 'Y';--  
	 
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CU002', 'MIMB', 6);--
  COMMIT;--

	-------------------------------------
	-- Actual Table
	-- SCI_LE_REG_ADDR
	--
	-------------------------------------
	call SI_RUNSTATS('SCI_LE_REG_ADDR');--
	
	UPDATE SCI_LE_REG_ADDR b
		SET (
		LRA_ID,
		LRA_LE_ID,
		LRA_TYPE_NUM,
		LRA_TYPE_VALUE,
		LRA_ADDR_LINE_1,
		LRA_ADDR_LINE_2,
		LRA_ADDR_LINE_3,
		LRA_ADDR_LINE_4,
		LRA_CNTRY_ISO_CODE,
		cms_le_main_profile_id)=
		(   SELECT 1,
		  CIF_ID,
		  ADDRESS_TYPE_CAT,
		  ADDRESS_TYPE_CODE,
		  ADDRESS_1,
		  ADDRESS_2,
		  ADDRESS_3,
		  ADDRESS_4,
		  COUNTRY,
		  a.cms_le_main_profile_id
		  FROM SI_TEMP_MIMB_CU002 t, SCI_LE_MAIN_PROFILE a
		  where a.cms_le_main_profile_id = b.cms_le_main_profile_id
	-- WLS: only update when address type code is not empty
	and length(t.ADDRESS_TYPE_CODE)>0
	and a.source_id='MIMB'
	and a.LMP_LE_ID =t.CIF_ID
	and t.ADDRESS_TYPE_CODE = b.LRA_TYPE_VALUE
	AND t.IS_VALID = 'Y')
	WHERE EXISTS (select 1 from SI_TEMP_MIMB_CU002 t1, SCI_LE_MAIN_PROFILE a1
				  where a1.cms_le_main_profile_id = b.cms_le_main_profile_id
				  -- only update when address type code is not empty
				  and length(t1.ADDRESS_TYPE_CODE)>0
				  and a1.source_id = 'MIMB'
				  and a1.LMP_LE_ID = t1.CIF_ID
				  and t1.ADDRESS_TYPE_CODE = b.LRA_TYPE_VALUE
				  AND t1.is_valid = 'Y' fetch first row only);--
              
	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CU002', 'MIMB', 7);--
	COMMIT;--
	
	------------------------------------------
	-- ENDED
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------	
	
  INSERT INTO SCI_LE_REG_ADDR (
    CMS_LE_REG_ADDR_ID,
    LRA_ID,
    LRA_LE_ID,
    LRA_TYPE_NUM,
    LRA_TYPE_VALUE,
    LRA_ADDR_LINE_1,
    LRA_ADDR_LINE_2,
    LRA_ADDR_LINE_3,
    LRA_ADDR_LINE_4,
    LRA_CNTRY_ISO_CODE,
    cms_le_main_profile_id)
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR contact_seq), 2)) as BIGINT),
      1,
      CIF_ID,
      ADDRESS_TYPE_CAT,
      ADDRESS_TYPE_CODE,
      ADDRESS_1,
      ADDRESS_2,
      ADDRESS_3,
      ADDRESS_4,
      COUNTRY,
      a.cms_le_main_profile_id
    FROM SI_TEMP_MIMB_CU002 t, sci_le_main_profile a
    WHERE a.LMP_LE_ID = t.CIF_ID
    -- only insert when address type code is not empty
    and length(t.ADDRESS_TYPE_CODE)>0
    and a.source_id = 'MIMB'
    and NOT EXISTS (SELECT 1 FROM SCI_LE_REG_ADDR b
			        WHERE b.cms_le_main_profile_id = a.cms_le_main_profile_id
			        and t.ADDRESS_TYPE_CODE = b.LRA_TYPE_VALUE fetch first row only)
    AND IS_VALID = 'Y');--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CU002', 'MIMB', 0);--
  
  CALL SI_AUTO_CREATE_TRANSACTION_FOR_CUSTOMER;--

END@


CREATE PROCEDURE SI_RUN_TEMP_MIMB_CA003
  LANGUAGE SQL
BEGIN
  DECLARE mimb_ref_entry_code VARCHAR(40);--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CA003', 'MIMB', 1);--

  -------------------------------------
  -- Auto Feed Std Code
  -- COMMON_CODE_CATEGORY_ENTRY
  --
  -------------------------------------

  SELECT entry_code INTO mimb_ref_entry_code FROM common_code_category_entry
  	WHERE category_code = 'CENTRE' AND entry_source = 'MIMB';--

  FOR cur_std_code AS
    SELECT DISTINCT LMT_BOOK_LOC_CODE code, LMT_BOOK_LOC_DESC desc,
        LMT_BOOK_LOC_CAT cat, 'MIMB' source_id
      FROM SI_TEMP_MIMB_CA003
      WHERE LENGTH(LMT_BOOK_LOC_CODE) > 0
        AND LENGTH(LMT_BOOK_LOC_DESC) > 0
        AND IS_VALID = 'Y'
  DO
    CALL si_auto_feed_standard_code_wf_ref(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id, mimb_ref_entry_code);--
  END FOR;--

  FOR cur_std_code AS
    SELECT DISTINCT PROD_TYPE_CODE code, PROD_TYPE_DESC desc,
        PROD_TYPE_CAT cat, 'MIMB' source_id
      FROM SI_TEMP_MIMB_CA003
      WHERE LENGTH(PROD_TYPE_CODE) > 0
        AND LENGTH(PROD_TYPE_DESC) > 0
        AND IS_VALID = 'Y'
  DO
    CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);--
    CALL si_auto_feed_standard_code(cur_std_code.code || '|' || 'MYR', cur_std_code.desc, 'PRODUCT_TYPE', cur_std_code.source_id);--
  END FOR;--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CA003', 'MIMB', 2);--
  commit;--
  
	------------------------------------------
	-- Temp Table
	-- SI_TEMP_MIMB_CA003
	-- populate sub profile id - customer id
	-- cms bca key - act and stg from trx
	-- 
	------------------------------------------

	UPDATE SI_TEMP_MIMB_CA003 a SET cms_customer_id = 
	(SELECT cms_le_sub_profile_id 
		FROM SCI_LE_SUB_PROFILE sp, SCI_LE_MAIN_PROFILE mp
		WHERE lsp_le_id = a.SOURCE_LMT_ID
	    AND lmp_le_id = a.SOURCE_LMT_ID
	    AND sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
		AND source_id = 'MIMB')
	 WHERE IS_VALID = 'Y';--
	 
	UPDATE SI_TEMP_MIMB_CA003 a SET (cms_act_aa_id, cms_stg_aa_id) =
	(SELECT trx.reference_id, trx.staging_reference_id
		FROM SCI_LSP_LMT_PROFILE aa, transaction trx
		WHERE trx.reference_id = aa.cms_lsp_lmt_profile_id
	    AND trx.transaction_type = 'LIMITPROFILE'
	    AND aa.llp_bca_ref_num = a.AA_NO
	    AND aa.source_id = 'MIMB')
	 WHERE a.IS_VALID = 'Y';--
	 
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CA003', 'MIMB', 3);--
  commit;--
  
  -------------------------------------
  -- Actual Table
  -- SCI_LSP_LMT_PROFILE
  --
  -------------------------------------

  UPDATE SCI_LSP_LMT_PROFILE a
  SET ( LLP_BCA_REF_NUM,
		LLP_LE_ID,
		cif_source_id,
		llp_lsp_id,
		CMS_CUSTOMER_ID,
		CMS_BCA_STATUS,
		CMS_ORIG_COUNTRY,
        CMS_ORIG_ORGANISATION,
		CMS_BCA_JOINT_IND,
        update_status_ind
      ) =
    ( select AA_NO,
	  SOURCE_LMT_ID,
	  'MIMB',
	  1,
	  cms_customer_id,
	  'ACTIVE',
	  'MY',
      LMT_BOOK_LOC_CODE,
	  'N',
      'U'
      from SI_TEMP_MIMB_CA003 T
      where a.LLP_BCA_REF_NUM = T.AA_NO
	  and a.cms_customer_id = T.cms_customer_id
      and IS_VALID = 'Y'
    )
  WHERE SOURCE_ID = 'MIMB'
  AND EXISTS ( select 1 from SI_TEMP_MIMB_CA003
               where a.LLP_BCA_REF_NUM = AA_NO
			   AND cms_customer_id = a.cms_customer_id
			   AND a.cms_lsp_lmt_profile_id = cms_act_aa_id
               AND IS_VALID = 'Y' fetch first row only
             );--
  commit;--
  
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CA003', 'MIMB', 4);--
  commit;--
  
	------------------------------------------
	-- Update Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
	    							      
	FOR cur_llp_key AS
		SELECT cms_lsp_lmt_profile_id trx_ref_id, 'LIMITPROFILE' trx_type
		FROM SCI_LSP_LMT_PROFILE a
		WHERE EXISTS (SELECT 1 FROM SI_TEMP_MIMB_CA003 
	  				 	WHERE llp_bca_ref_num = AA_NO
						AND cms_customer_id = a.cms_customer_id
						AND a.cms_lsp_lmt_profile_id = cms_act_aa_id
						AND is_valid = 'Y' fetch first row only)
		AND source_id = 'MIMB'
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_llp_key.trx_ref_id, cur_llp_key.trx_type);--
	END FOR;--
	
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CA003', 'MIMB', 5);--
  commit;--
	
	------------------------------------------
	-- ENDED
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
  
  INSERT INTO SCI_LSP_LMT_PROFILE
  ( cms_lsp_lmt_profile_id,
    LLP_BCA_REF_NUM,
	LLP_LE_ID,
	cif_source_id,
	llp_lsp_id,
	CMS_CUSTOMER_ID,
	CMS_BCA_STATUS,
	CMS_ORIG_COUNTRY,
    CMS_ORIG_ORGANISATION,
	CMS_BCA_JOINT_IND,
    source_id,
    update_status_ind
  )
 ( select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_profile_seq), 2)) as BIGINT),
    AA_NO,
	SOURCE_LMT_ID,
	'MIMB',
	1,
	cms_customer_id,
	'ACTIVE',
	'MY',
    LMT_BOOK_LOC_CODE,
	'N',
    'MIMB',
    'I'
    from SI_TEMP_MIMB_CA003 t
    where not exists ( select 1 from sci_lsp_lmt_profile
                       where LLP_BCA_REF_NUM = t.AA_NO
					   AND cms_customer_id = t.cms_customer_id
					   AND cms_lsp_lmt_profile_id = t.cms_act_aa_id
                       and source_id = 'MIMB'
                       AND t.IS_VALID = 'Y'
                       fetch first row only
                     )
    AND t.IS_VALID = 'Y'
  );--
  commit;--

  -------------------------------------
  -- Staging Table
  -- STAGE_LIMIT_PROFILE
  --
  -------------------------------------
	UPDATE stage_limit_profile a SET (
		LLP_BCA_REF_NUM,
		LLP_LE_ID,
		cif_source_id,
		llp_lsp_id,
		CMS_CUSTOMER_ID,
		CMS_BCA_STATUS,		
		CMS_ORIG_COUNTRY,
        CMS_ORIG_ORGANISATION,
		CMS_BCA_JOINT_IND,
        update_status_ind) =
		(select AA_NO,
			  SOURCE_LMT_ID,
		      'MIMB',
			  1,
			  cms_customer_id,
			  'ACTIVE',
			  'MY',
		      LMT_BOOK_LOC_CODE,
			  'N',
		      'U'
		      from SI_TEMP_MIMB_CA003 T
		      where a.LLP_BCA_REF_NUM = T.AA_NO
			  and cms_customer_id = T.cms_customer_id 
			  and cms_lsp_lmt_profile_id = cms_stg_aa_id
		      and IS_VALID = 'Y')
	  WHERE EXISTS (SELECT 1 FROM SI_TEMP_MIMB_CA003
					WHERE cms_customer_id = a.cms_customer_id
					AND cms_stg_aa_id = a.cms_lsp_lmt_profile_id
					AND is_valid = 'Y' fetch first row only)
		AND source_id = 'MIMB';--  

  commit;--
  
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CA003', 'MIMB', 6);--
  commit;--

  INSERT INTO stage_limit_profile
  ( cms_lsp_lmt_profile_id,
    LLP_BCA_REF_NUM,
	LLP_LE_ID,
	cif_source_id,
	llp_lsp_id,
	CMS_CUSTOMER_ID,	
	CMS_BCA_STATUS,		
	CMS_ORIG_COUNTRY,
    CMS_ORIG_ORGANISATION,
	CMS_BCA_JOINT_IND,
    source_id,
    update_status_ind
  )
  ( select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_profile_seq), 2)) as BIGINT),
    AA_NO,
	SOURCE_LMT_ID,
    'MIMB',
	1,
    cms_customer_id,
    'ACTIVE',	
	'MY',
    LMT_BOOK_LOC_CODE,
	'N',
    'MIMB',
    'I'
    from SI_TEMP_MIMB_CA003 t
    where not exists ( select 1 from stage_limit_profile
                       where LLP_BCA_REF_NUM = t.AA_NO
                       and source_id = 'MIMB'
                       AND t.IS_VALID = 'Y'
                       fetch first row only)
    AND t.IS_VALID = 'Y'
  );--
  
  commit;--
  
	------------------------------------------
	-- Temp Table
	-- SI_TEMP_MIMB_CA003
	-- populate limit profile id
	-- cms limit key - act and stg from trx
	-- 
	------------------------------------------

	UPDATE SI_TEMP_MIMB_CA003 a SET cms_act_lmt_profile_id = 
	(SELECT cms_lsp_lmt_profile_id 
		FROM SCI_LSP_LMT_PROFILE sp
		WHERE llp_le_id = a.SOURCE_LMT_ID
	    AND sp.llp_bca_ref_num = a.AA_NO
		AND source_id = 'MIMB')
	 WHERE IS_VALID = 'Y';--
	 
	UPDATE SI_TEMP_MIMB_CA003 a SET (cms_act_lmt_id, cms_stg_lmt_id) =
	(SELECT reference_id, staging_reference_id
		FROM sci_lsp_appr_lmts, transaction
		WHERE reference_id = cms_lsp_appr_lmts_id
	    AND transaction_type = 'LIMIT'
	    AND lmt_bca_ref_num = a.AA_NO
	    AND lmt_le_id = a.SOURCE_LMT_ID
	    AND lmt_id = a.SOURCE_LMT_ID
	    AND source_id = 'MIMB')
	 WHERE IS_VALID = 'Y';--  

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CA003', 'MIMB', 7);--
  commit;--
  
  -------------------------------------
  -- Actual Table
  -- SCI_LSP_APPR_LMTS
  --
  -------------------------------------  

  UPDATE sci_lsp_appr_lmts a
  SET (
    LMT_BCA_REF_NUM,
    LMT_ID,
	LMT_LE_ID,
    CMS_BKG_ORGANISATION,
    LMT_PRD_TYPE_NUM,
    LMT_PRD_TYPE_VALUE,
	LMT_CRRNCY_ISO_CODE,
    LMT_AMT,
    CMS_DRAWING_LIMIT,
    CMS_OUTSTANDING_AMT,
    CMS_LIMIT_STATUS,
	CMS_BKG_COUNTRY,
    cms_limit_profile_id,
    source_id
    ) =
    (SELECT AA_NO,
      SOURCE_LMT_ID,
	  SOURCE_LMT_ID,
      LMT_BOOK_LOC_CODE,
      PROD_TYPE_CAT,
      PROD_TYPE_CODE,
	  'MYR',
      APPROVED_LMT,
      DRAWING_LMT,
      cast(OUTSTD_BALANCE_SIGN || char(OUTSTD_BALANCE) as decimal(17,2)) OUTSTD_BALANCE,
      LMT_STATUS,
	  'MY',
      cms_act_lmt_profile_id,
      'MIMB'
      FROM SI_TEMP_MIMB_CA003 T1
      WHERE a.lmt_id = T1.SOURCE_LMT_ID
	  AND T1.CMS_ACT_LMT_ID = a.cms_lsp_appr_lmts_id
      AND T1.IS_VALID = 'Y'
   )
  WHERE EXISTS (select 1 from SI_TEMP_MIMB_CA003 T2
				where a.lmt_id = SOURCE_LMT_ID
				and cms_act_lmt_id = a.cms_lsp_appr_lmts_id
			    and T2.IS_VALID = 'Y' fetch first row only)
  AND a.source_id = 'MIMB';--

commit;--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CA003', 'MIMB', 8);--
  commit;--

	------------------------------------------
	-- Update Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
	    							      
	FOR cur_lmt_key AS
		SELECT cms_lsp_appr_lmts_id trx_ref_id, 'LIMIT' trx_type
		  FROM sci_lsp_appr_lmts a
		 WHERE EXISTS (SELECT '1' FROM SI_TEMP_MIMB_CA003
	  				 	WHERE a.lmt_id = SOURCE_LMT_ID
	  				   	  AND cms_act_lmt_id = a.cms_lsp_appr_lmts_id
			  		   	  AND is_valid = 'Y')
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_lmt_key.trx_ref_id, cur_lmt_key.trx_type);--
	END FOR;--
	
	------------------------------------------
	-- ENDED
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------

  INSERT INTO sci_lsp_appr_lmts (
    CMS_LSP_APPR_LMTS_ID,
    LMT_BCA_REF_NUM,
    LMT_ID,
	LMT_LE_ID,
    CMS_BKG_ORGANISATION,
    LMT_PRD_TYPE_NUM,
    LMT_PRD_TYPE_VALUE,
	LMT_CRRNCY_ISO_CODE,
    LMT_AMT,
    CMS_DRAWING_LIMIT,
    CMS_OUTSTANDING_AMT,
    CMS_LIMIT_STATUS,
	CMS_BKG_COUNTRY,
    cms_limit_profile_id,
    source_id)
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT),
      AA_NO,
      SOURCE_LMT_ID,
	  SOURCE_LMT_ID,
      LMT_BOOK_LOC_CODE,
      PROD_TYPE_CAT,
      PROD_TYPE_CODE,
	  'MYR',
      APPROVED_LMT,
      DRAWING_LMT,
      cast(OUTSTD_BALANCE_SIGN || char(OUTSTD_BALANCE) as decimal(17,2)) OUTSTD_BALANCE,
      LMT_STATUS,
	  'MY',
      cms_act_lmt_profile_id,
      'MIMB'
    FROM SI_TEMP_MIMB_CA003 t
    WHERE t.CMS_ACT_LMT_ID is null
    AND t.IS_VALID = 'Y');--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CA003', 'MIMB', 9);--
  COMMIT;--

  -------------------------------------
  -- Staging Table
  -- STAGE_LIMIT
  --
  -------------------------------------

  -----------------------------------
  -- set cms staging limit id
  -----------------------------------
  UPDATE SI_TEMP_MIMB_CA003 a
  SET CMS_STG_LMT_ID =
	    (select staging_reference_id from transaction trx, sci_lsp_appr_lmts lmts
	    where trx.transaction_type = 'LIMIT'
	    and trx.reference_id = lmts.cms_lsp_appr_lmts_id
	    and lmts.source_id = 'MIMB'
	    and lmts.lmt_id = a.SOURCE_LMT_ID
	    and a.is_valid = 'Y')
  WHERE a.is_valid = 'Y';--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CA003', 'MIMB', 10);--
  commit;--

  UPDATE stage_limit s
  SET (
    LMT_BCA_REF_NUM,
    LMT_ID,
	LMT_LE_ID,
    CMS_BKG_ORGANISATION,
    LMT_PRD_TYPE_NUM,
    LMT_PRD_TYPE_VALUE,
	LMT_CRRNCY_ISO_CODE,
    LMT_AMT,
    CMS_DRAWING_LIMIT,
    CMS_OUTSTANDING_AMT,
    CMS_LIMIT_STATUS,
	CMS_BKG_COUNTRY,
    cms_limit_profile_id,
    source_id) =
    (select AA_NO,
      SOURCE_LMT_ID,
	  SOURCE_LMT_ID,
      LMT_BOOK_LOC_CODE,
      PROD_TYPE_CAT,
      PROD_TYPE_CODE,
	  'MYR',
      APPROVED_LMT,
      DRAWING_LMT,
      cast(OUTSTD_BALANCE_SIGN || char(OUTSTD_BALANCE) as decimal(17,2)) OUTSTD_BALANCE,
      LMT_STATUS,
	  'MY',
      cms_act_lmt_profile_id,
      'MIMB'
        from SI_TEMP_MIMB_CA003 t
        where t.cms_stg_lmt_id = s.cms_lsp_appr_lmts_id
        and t.is_valid = 'Y')
    where source_id = 'MIMB'
    AND EXISTS (select 1 from SI_TEMP_MIMB_CA003 t
          where SOURCE_LMT_ID = s.lmt_id
		  and t.CMS_STG_LMT_ID = s.cms_lsp_appr_lmts_id
          and t.IS_VALID = 'Y' fetch first row only);--
		  
  commit;--

  INSERT INTO stage_limit (cms_lsp_appr_lmts_id,
    LMT_BCA_REF_NUM,
    LMT_ID,
	LMT_LE_ID,
    CMS_BKG_ORGANISATION,
    LMT_PRD_TYPE_NUM,
    LMT_PRD_TYPE_VALUE,
	LMT_CRRNCY_ISO_CODE,
    LMT_AMT,
    CMS_DRAWING_LIMIT,
    CMS_OUTSTANDING_AMT,
    CMS_LIMIT_STATUS,
	CMS_BKG_COUNTRY,
    cms_limit_profile_id,
    source_id)
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT),
      AA_NO,
      SOURCE_LMT_ID,
	  SOURCE_LMT_ID,
      LMT_BOOK_LOC_CODE,
      PROD_TYPE_CAT,
      --PROD_TYPE_CODE,
      'dummy--',
	  'MYR',
      APPROVED_LMT,
      DRAWING_LMT,
      cast(OUTSTD_BALANCE_SIGN || char(OUTSTD_BALANCE) as decimal(17,2)) OUTSTD_BALANCE,
      LMT_STATUS,
	  'MY',
      cms_act_lmt_profile_id,
      'MIMB'
    FROM SI_TEMP_MIMB_CA003 t
    WHERE t.CMS_STG_LMT_ID is null
    AND t.IS_VALID = 'Y');--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CA003', 'MIMB', 11);--
  commit;--

  -------------------------------------
  -- Tag DELETED for non-exist records
  -- Actual Table
  -- SCI_LSP_APPR_LMTS
  --
  -------------------------------------
  UPDATE sci_lsp_appr_lmts a SET
    (cms_limit_status, UPDATE_STATUS_IND) =  ('DELETED', 'D')
  WHERE source_id = 'MIMB'
  AND cms_limit_status = 'ACTIVE'
  AND NOT EXISTS (SELECT 1 from SI_TEMP_MIMB_CA003 t
          WHERE t.SOURCE_LMT_ID=a.lmt_id AND t.IS_VALID = 'Y');--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CA003', 'MIMB', 12);--
  commit;--

  -------------------------------------
  -- Tag DELETED for non-exist records
  -- Staging Table
  -- STAGE_LIMIT
  --
  -------------------------------------
  UPDATE stage_limit a SET
    (cms_limit_status, UPDATE_STATUS_IND) =  ('DELETED', 'D')
  WHERE source_id = 'MIMB'
  AND cms_limit_status = 'ACTIVE'
  AND NOT EXISTS (SELECT 1 from SI_TEMP_MIMB_CA003 t
          WHERE t.SOURCE_LMT_ID = a.lmt_id
          AND t.IS_VALID = 'Y')
  AND cms_lsp_appr_lmts_id IN (select staging_reference_id from transaction
                  where reference_id IN (select cms_lsp_appr_lmts_id
                              from sci_lsp_appr_lmts lmt
                              where lmt.LMT_ID = a.LMT_ID
                              and lmt.source_id = 'MIMB')
                  and transaction_type = 'LIMIT');--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CA003', 'MIMB', 0);--
  
  CALL SI_AUTO_CREATE_TRANSACTION_FOR_LIMITPROFILE;--
  
  CALL SI_AUTO_CREATE_TRANSACTION_FOR_LIMIT;--

END@


CREATE PROCEDURE SI_RUN_TEMP_MIMB_CO003
  LANGUAGE SQL
BEGIN
  DECLARE mimb_ref_entry_code VARCHAR(40);--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 1);--
  
  SELECT entry_code INTO mimb_ref_entry_code FROM common_code_category_entry
  	WHERE category_code = 'CENTRE' AND entry_source = 'MIMB';--

  -------------------------------------
  -- Auto Feed Std Code
  -- COMMON_CODE_CATEGORY_ENTRY
  --
  -------------------------------------

  FOR cur_std_code AS
    SELECT DISTINCT BRANCH_NAME_CODE code, BRANCH_NAME_DESC desc,
         BRANCH_NAME_CAT cat, 'MIMB' source_id
      FROM SI_TEMP_MIMB_CO003
     WHERE LENGTH(BRANCH_NAME_CODE) > 0
       AND LENGTH(BRANCH_NAME_DESC) > 0
       AND IS_VALID = 'Y'
  DO
    CALL si_auto_feed_standard_code_wf_ref(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id, mimb_ref_entry_code);--
  END FOR;--

  FOR cur_std_code AS
    SELECT DISTINCT SEC_PLEDGOR_REL_CODE code, SEC_PLEDGOR_REL_NUM desc,
         SEC_PLEDGOR_REL_CAT cat, 'MIMB' source_id
      FROM SI_TEMP_MIMB_CO003
     WHERE LENGTH(SEC_PLEDGOR_REL_CODE) > 0
       AND LENGTH(SEC_PLEDGOR_REL_NUM) > 0
       AND IS_VALID = 'Y'
  DO
    CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);--
  END FOR;--  
  
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 2);--
  commit;--


  ----------------------------------------------
  -- Update security type and subtype id
  -- SI_RUN_TEMP_MIMB_CO003
  ----------------------------------------------
	UPDATE SI_TEMP_MIMB_CO003 a
    SET ( cms_security_type_id, 
          cms_security_subtype_id) =
	    (SELECT 'MS',
			SI_GET_SUBTYPE_BY_STOCK_CODE_AND_EXCHANGE(STOCK_CODE, CASE STOCK_EXCHANGE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE STOCK_EXCHANGE END)
	    FROM SI_TEMP_MIMB_CO003
	    WHERE SOURCE_SEC_ID = a.SOURCE_SEC_ID)
	WHERE a.IS_VALID = 'Y';--
	
	UPDATE SI_TEMP_MIMB_CO003 a SET (cms_collateral_id, cms_stg_collateral_id) =
	(SELECT reference_id, staging_reference_id
		FROM transaction, cms_security
		WHERE transaction_type = 'COL'
	    AND reference_id = cms_collateral_id
		AND a.SOURCE_SEC_ID = sci_security_dtl_id
		AND source_id = 'MIMB')
	WHERE a.IS_VALID = 'Y';--	

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 3);--
  commit;--

  -------------------------------------
  -- Actual Table
  -- CMS_SECURITY
  --
  -------------------------------------

	UPDATE CMS_SECURITY S
	SET STATUS = 'DELETED', S.DELETED_DATE = CURRENT_TIMESTAMP
	WHERE S.SOURCE_ID = 'MIMB'
	AND S.SECURITY_SUB_TYPE_ID LIKE 'MS%'
    AND NOT EXISTS (   SELECT 1 FROM SI_TEMP_MIMB_CO003 T
                       WHERE T.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID 
					   AND T.IS_VALID = 'Y' fetch first row only);--
					   
	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 4);--					   

  commit;--

	----------------------------------------
	-- for EXCHANGE_CTRL_APPROVAL , 
	-- huisieng79: NA is mapped to O in the DB
	--
	----------------------------------------
	CALL SI_RUNSTATS('CMS_SECURITY');--
  
	UPDATE CMS_SECURITY a
	SET (  SCI_SECURITY_TYPE_VALUE,
		SCI_ORIG_SECURITY_CURRENCY,
		SCI_SECURITY_CURRENCY,
		SECURITY_LOCATION,
		SECURITY_ORGANISATION,
		CUSTODIAN_TYPE,
		SECURITY_CUSTODIAN,
		SECURITY_MATURITY_DATE,
		SECURITY_PERFECTION_DATE,
		IS_LEGAL_ENFORCE,
		IS_LEGAL_ENFORCE_DATE,
		EXCHANGE_CONTROL_OBTAINED,
		SCI_REFERENCE_NOTE,
		SOURCE_SECURITY_SUB_TYPE,
		COLLATERAL_STATUS,
		status, sci_security_subtype_value,
		security_sub_type_id
	  ) =
	(  SELECT SEC_TYPE, ORIG_SEC_CURRENCY,
		CMS_SEC_CURRENCY,
		SEC_LOCATION,
		BRANCH_NAME_CODE, 
		SEC_CUSTODIAN_TYPE,
		SEC_CUSTODIAN_VALUE,
		SEC_MATURITY_DATE,
		SEC_PERFECTION_DATE,
		LEGAL_ENFORCE,
		LEGAL_ENFORCE_DATE,
		EXCHANGE_CTRL_APPROVAL,
		SOURCE_SEC_ID,
		source_security_sub_type,
		'1',
		'ACTIVE',
		cms_security_subtype_id,
		cms_security_subtype_id  
		FROM SI_TEMP_MIMB_CO003 t
		WHERE t.IS_VALID = 'Y' 
		AND a.CMS_COLLATERAL_ID = t.CMS_COLLATERAL_ID )
	WHERE EXISTS (  SELECT 1 FROM SI_TEMP_MIMB_CO003 t1
                  WHERE t1.IS_VALID = 'Y'
                  AND a.CMS_COLLATERAL_ID = t1.cms_collateral_id fetch first row only) 
	AND a.SCI_SECURITY_TYPE_VALUE = 'MS'
	AND a.SOURCE_ID = 'MIMB';--
  
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 5);--

  commit;--

  INSERT INTO CMS_SECURITY
  ( cms_collateral_id,
    SCI_SECURITY_DTL_ID,
    SCI_SECURITY_TYPE_VALUE,
    SCI_ORIG_SECURITY_CURRENCY,
    SCI_SECURITY_CURRENCY, 
    SECURITY_LOCATION,
    SECURITY_ORGANISATION,
    CUSTODIAN_TYPE,
    SECURITY_CUSTODIAN,
    SECURITY_MATURITY_DATE,  
    SECURITY_PERFECTION_DATE,
    IS_LEGAL_ENFORCE,
    IS_LEGAL_ENFORCE_DATE,
    EXCHANGE_CONTROL_OBTAINED,
	SCI_REFERENCE_NOTE,
	SOURCE_SECURITY_SUB_TYPE,
	COLLATERAL_STATUS,
    status, 
    source_id,
    sci_security_subtype_value,
    security_sub_type_id        )
    (   SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT), 
        SOURCE_SEC_ID,
        SEC_TYPE, ORIG_SEC_CURRENCY,
        CMS_SEC_CURRENCY, 
        SEC_LOCATION,
        BRANCH_NAME_CODE, 
        SEC_CUSTODIAN_TYPE,
        SEC_CUSTODIAN_VALUE,
        SEC_MATURITY_DATE,  
        SEC_PERFECTION_DATE,
        LEGAL_ENFORCE,
        LEGAL_ENFORCE_DATE,
        EXCHANGE_CTRL_APPROVAL,
		SOURCE_SEC_ID,
		source_security_sub_type,
		'1',
        'ACTIVE', 
        'MIMB',
        cms_security_subtype_id,
        cms_security_subtype_id  
      FROM SI_TEMP_MIMB_CO003
      WHERE IS_VALID = 'Y'
      AND NOT EXISTS (  SELECT 1 FROM CMS_SECURITY
                        WHERE SCI_SECURITY_DTL_ID = SOURCE_SEC_ID
                        AND SOURCE_ID = 'MIMB' fetch first row only
                     )
    );--

    CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 6);--
	commit;--

    UPDATE CMS_SECURITY A
    SET (TYPE_NAME, SUBTYPE_NAME) =
      ( SELECT SECURITY_TYPE_NAME, SUBTYPE_NAME 
        FROM CMS_SECURITY_SUB_TYPE
        WHERE SECURITY_SUB_TYPE_ID = A.SECURITY_SUB_TYPE_ID
      )
    WHERE SOURCE_ID = 'MIMB'
    AND ( TYPE_NAME IS NULL OR SUBTYPE_NAME IS NULL );--    

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 7);--
  commit;--

  
	-- +++++++++++++++++++++
	--
	-- cms_security_source
	-- *********************
	CALL SI_RUNSTATS('cms_security_source');--
	
	UPDATE cms_security_source
	SET ( cms_collateral_id, source_security_id, source_id, 
		last_update_date, security_sub_type_id) =
	  ( SELECT sec.cms_collateral_id, t.SOURCE_SEC_ID,
		'MIMB', current_timestamp, t.cms_security_subtype_id
		 FROM cms_security sec, SI_TEMP_MIMB_CO003 t 
		 WHERE sec.sci_security_dtl_id = SOURCE_SEC_ID
		 AND sec.sci_security_dtl_id = source_security_id 
		 AND source_id = 'MIMB' 
		 AND is_valid = 'Y' )
	WHERE EXISTS ( SELECT 1 FROM SI_TEMP_MIMB_CO003
				  WHERE source_security_id = SOURCE_SEC_ID 
				  AND is_valid = 'Y' fetch first row only)
	AND source_id = 'MIMB';--    
  
	commit;--

  INSERT INTO cms_security_source
  ( cms_security_source_id, cms_collateral_id,
    source_security_id, source_id, 
    status, last_update_date, security_sub_type_id    )
  ( SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
      sec.cms_collateral_id, t.SOURCE_SEC_ID,
      'MIMB', 'ACTIVE',
      CURRENT_TIMESTAMP, t.cms_security_subtype_id
    FROM cms_security sec, SI_TEMP_MIMB_CO003 t
    WHERE NOT EXISTS (  SELECT 1 FROM cms_security_source 
                        WHERE source_security_id = SOURCE_SEC_ID 
                        AND source_id = 'MIMB' fetch first row only) 
    AND is_valid = 'Y'
    AND sec.sci_security_dtl_id = t.SOURCE_SEC_ID
    AND source_id = 'MIMB');--

	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 8);--
	commit;--  

	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------
	UPDATE CMS_STAGE_SECURITY S
	SET STATUS = 'DELETED',
	S.DELETED_DATE = CURRENT_TIMESTAMP
	WHERE S.SOURCE_ID = 'MIMB'
	AND S.SECURITY_SUB_TYPE_ID LIKE 'MS%'
    AND NOT EXISTS ( SELECT 1 FROM SI_TEMP_MIMB_CO003 T
                     WHERE S.cms_collateral_id = cms_stg_collateral_id
                     AND T.IS_VALID = 'Y');--

	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 9);--

  commit;--

  UPDATE CMS_STAGE_SECURITY a
  SET ( SCI_SECURITY_TYPE_VALUE,
        SCI_ORIG_SECURITY_CURRENCY,
        SCI_SECURITY_CURRENCY,
        SECURITY_LOCATION,
        SECURITY_ORGANISATION,
        CUSTODIAN_TYPE,
        SECURITY_CUSTODIAN,
        SECURITY_MATURITY_DATE,
        SECURITY_PERFECTION_DATE,
        IS_LEGAL_ENFORCE,
        IS_LEGAL_ENFORCE_DATE,
        EXCHANGE_CONTROL_OBTAINED,
		SCI_REFERENCE_NOTE,
		SOURCE_SECURITY_SUB_TYPE,
		COLLATERAL_STATUS,
        status,
        sci_security_subtype_value,
        security_sub_type_id  ) =
    ( SELECT SEC_TYPE,
      ORIG_SEC_CURRENCY,
      CMS_SEC_CURRENCY,
      SEC_LOCATION,
      BRANCH_NAME_CODE, 
      SEC_CUSTODIAN_TYPE,
      SEC_CUSTODIAN_VALUE,
      SEC_MATURITY_DATE,
      SEC_PERFECTION_DATE,
      LEGAL_ENFORCE,
      LEGAL_ENFORCE_DATE,
      EXCHANGE_CTRL_APPROVAL,
	  SOURCE_SEC_ID,
	  source_security_sub_type,
	  '1',
      'ACTIVE',
      cms_security_subtype_id,
      cms_security_subtype_id  
      FROM SI_TEMP_MIMB_CO003 t
      WHERE t.IS_VALID = 'Y' 
      AND a.CMS_COLLATERAL_ID = t.cms_stg_collateral_id)
  WHERE EXISTS (  SELECT 1 FROM SI_TEMP_MIMB_CO003 t1
                  WHERE t1.IS_VALID = 'Y'
                  AND a.CMS_COLLATERAL_ID = t1.cms_stg_collateral_id fetch first row only) 
  AND a.SCI_SECURITY_TYPE_VALUE = 'MS'
  AND a.SOURCE_ID = 'MIMB';--  

	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 10);--
  commit;--

  INSERT INTO CMS_STAGE_SECURITY
  ( cms_collateral_id,
    SCI_SECURITY_DTL_ID,
    SCI_SECURITY_TYPE_VALUE,
    SCI_ORIG_SECURITY_CURRENCY,
    SCI_SECURITY_CURRENCY, 
    SECURITY_LOCATION,
    SECURITY_ORGANISATION,
    CUSTODIAN_TYPE,
    SECURITY_CUSTODIAN,
    SECURITY_MATURITY_DATE,  
    SECURITY_PERFECTION_DATE,
    IS_LEGAL_ENFORCE,
    IS_LEGAL_ENFORCE_DATE,
    EXCHANGE_CONTROL_OBTAINED,
	SCI_REFERENCE_NOTE,
	SOURCE_SECURITY_SUB_TYPE,
	COLLATERAL_STATUS,
    status,     source_id,
    sci_security_subtype_value,
    security_sub_type_id  )
    ( SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT), 
      SOURCE_SEC_ID, SEC_TYPE,
      ORIG_SEC_CURRENCY,
      CMS_SEC_CURRENCY, 
      SEC_LOCATION,
      BRANCH_NAME_CODE, 
      SEC_CUSTODIAN_TYPE,
      SEC_CUSTODIAN_VALUE,
      SEC_MATURITY_DATE,  
      SEC_PERFECTION_DATE,
      LEGAL_ENFORCE,
      LEGAL_ENFORCE_DATE,
      EXCHANGE_CTRL_APPROVAL,
	  SOURCE_SEC_ID,
	  source_security_sub_type,
	  '1',
      'ACTIVE',       'MIMB',
      cms_security_subtype_id,
      cms_security_subtype_id  
      FROM SI_TEMP_MIMB_CO003
      WHERE IS_VALID = 'Y' 
	  AND NOT EXISTS (  SELECT 1 FROM CMS_STAGE_SECURITY
	                    WHERE SCI_SECURITY_DTL_ID = SOURCE_SEC_ID
	                    AND SOURCE_ID = 'MIMB' fetch first row only));--  

	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 11);--
  commit;--

  UPDATE CMS_STAGE_SECURITY A
  SET (TYPE_NAME, SUBTYPE_NAME) =
    ( SELECT SECURITY_TYPE_NAME, SUBTYPE_NAME 
      FROM CMS_SECURITY_SUB_TYPE
      WHERE SECURITY_SUB_TYPE_ID = A.SECURITY_SUB_TYPE_ID
    )
  WHERE SOURCE_ID = 'MIMB'
  AND SUBTYPE_NAME IS NULL;--    

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 12);--
  commit;--

  CALL SI_AUTO_CREATE_TRANSACTION_FOR_COLLATERAL;--
  
  -- If user updated security
  UPDATE SI_TEMP_MIMB_CO003 T
  SET (cms_collateral_id, cms_stg_collateral_id) = 
	(SELECT reference_id, staging_reference_id FROM transaction
			WHERE reference_id = (SELECT CMS_COLLATERAL_ID 
									FROM CMS_SECURITY S
									WHERE S.SCI_SECURITY_DTL_ID = T.SOURCE_SEC_ID
									AND source_id = 'MIMB')
			AND transaction_type = 'COL')  
  WHERE T.IS_VALID = 'Y'
  AND EXISTS (select 1 from TRANSACTION tran, CMS_SECURITY sec
				where tran.reference_id = sec.CMS_COLLATERAL_ID
				and sec.SCI_SECURITY_DTL_ID = T.SOURCE_SEC_ID
				and transaction_type = 'COL'
				and source_id = 'MIMB' fetch first row only);--  
  
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 13);--
  commit;--
  
  -------------------------------------
  -- Actual Table
  -- CMS_MARKETABLE_SEC
  --
  -------------------------------------

  INSERT INTO CMS_MARKETABLE_SEC ( CMS_COLLATERAL_ID, STOCK_COUNTER_CODE )
    ( SELECT S.CMS_COLLATERAL_ID, T.STOCK_CODE
      FROM CMS_SECURITY S, SI_TEMP_MIMB_CO003 T
      WHERE T.cms_collateral_id = S.CMS_COLLATERAL_ID
      AND T.IS_VALID = 'Y'
      AND NOT EXISTS ( SELECT 1 FROM CMS_MARKETABLE_SEC
                       WHERE CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID fetch first row only));--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 14);--
  commit;--

  -------------------------------------
  -- Staging Table
  -- CMS_STAGE_MARKETABLE_SEC
  --
  -------------------------------------
  
  INSERT INTO CMS_STAGE_MARKETABLE_SEC (CMS_COLLATERAL_ID, STOCK_COUNTER_CODE )
    ( SELECT S.CMS_COLLATERAL_ID, T.STOCK_CODE
      FROM CMS_STAGE_SECURITY S, SI_TEMP_MIMB_CO003 T
      WHERE T.cms_stg_collateral_id = S.CMS_COLLATERAL_ID
      AND T.IS_VALID = 'Y'
      AND NOT EXISTS ( SELECT 1 FROM CMS_STAGE_MARKETABLE_SEC
                       WHERE CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID fetch first row only));--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 15);--
  commit;--  

  -------------------------------------
  -- Actual Table
  -- CMS_PORTFOLIO_ITEM
  --
  -------------------------------------
  call SI_RUNSTATS('CMS_PORTFOLIO_ITEM');--

  -- LOCK TABLE CMS_PORTFOLIO_ITEM IN SHARE MODE;--
  -- UPDATE CMS_PORTFOLIO_ITEM P 
   -- SET STATUS = 'DELETED' 
  -- WHERE P.SOURCE_ID = 'MIMB' 
   -- AND NOT EXISTS (SELECT 1 FROM SI_TEMP_MIMB_CO003 T, CMS_MARKETABLE_SEC M, CMS_SECURITY S 
                    -- WHERE ,P.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID 
                      -- AND M.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID 
                      -- AND S.SCI_SECURITY_DTL_ID = T.SOURCE_SEC_ID 
                      -- AND T.IS_VALID = 'Y' fetch first row only);--
					  
	DECLARE GLOBAL TEMPORARY TABLE SESSION.temp_portfolio_item
			(CMS_COLLATERAL_ID BIGINT)
    WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;--
	
	INSERT INTO SESSION.temp_portfolio_item (
		SELECT P.CMS_COLLATERAL_ID FROM SI_TEMP_MIMB_CO003 T, CMS_MARKETABLE_SEC M, CMS_SECURITY S, CMS_PORTFOLIO_ITEM P  
	    WHERE P.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID 
	      AND M.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID 
	      AND S.SCI_SECURITY_DTL_ID = T.SOURCE_SEC_ID 
	      AND T.IS_VALID = 'Y' );--
	
	create index SESSION.idx_main_prf on SESSION.temp_portfolio_item
    (CMS_COLLATERAL_ID)
    allow reverse scans;--
	
	UPDATE CMS_PORTFOLIO_ITEM P 
	   SET STATUS = 'DELETED' 
	  WHERE P.SOURCE_ID = 'MIMB' 
	   AND NOT EXISTS (SELECT 1 FROM SESSION.temp_portfolio_item T
	                    WHERE P.CMS_COLLATERAL_ID = T.CMS_COLLATERAL_ID fetch first row only);--
	   
	drop table SESSION.temp_portfolio_item;--					  
	commit;--

  -- LOCK TABLE CMS_PORTFOLIO_ITEM IN SHARE MODE;--
	-- UPDATE CMS_PORTFOLIO_ITEM A 
	-- SET (TYPE, 
        -- CDS_NUMBER, 
        -- AGENT_NAME, 
        -- RECOGNIZED_EXCHANGE_FLAG, 
        -- RECOGN_EXCHANGE, 
        -- CUSTODIAN_TYPE, 
        -- REGISTERED_NAME, 
        -- NO_OF_UNITS, 
        -- UNIT_PRICE, 
        -- UNIT_PRICE_CURRENCY, 
        -- STOCK_EXCHANGE, 
        -- STOCK_EXCHANGE_COUNTRY, 
        -- EXCHANGE_CONTROL_OBTAINED, 
        -- STOCK_CODE, 
        -- BASEL_COMPLIANT_TEXT, 
        -- status) = (SELECT EQUITY_TYPE, 
					       -- CDS_NUMBER, 
					       -- NOMINEE_NAME, 
					       -- RECOG_EXCHANGE, 
						   -- CASE RECOG_EXCHANGE WHEN 'Y' THEN 'TRUE' WHEN 'N' THEN 'FALSE' ELSE RECOG_EXCHANGE END, 
					       -- SEC_CUSTODIAN_TYPE, 
					       -- REG_OWNER, 
					       -- NUMBER_UNITS, 
					       -- UNIT_PRICE, 
					       -- CMS_SEC_CURRENCY, 
					       -- STOCK_EXCHANGE, 
					       -- COUNTRY_STOCK_EXCHANGE, 
					       -- EXCHANGE_CTRL_APPROVAL, 
					       -- STOCK_CODE, 
					       -- BASEL_COMPLT_UNIT_TRUST, 
					       -- 'ACTIVE' 
					 -- FROM SI_TEMP_MIMB_CO003 T1, 
						  -- CMS_MARKETABLE_SEC M1, 
						  -- CMS_SECURITY S1 
					-- WHERE T1.SOURCE_SEC_ID = S1.SCI_SECURITY_DTL_ID 
					  -- AND T1.IS_VALID = 'Y' 
					  -- AND S1.CMS_COLLATERAL_ID = M1.CMS_COLLATERAL_ID 
					  -- AND A.CMS_COLLATERAL_ID = M1.CMS_COLLATERAL_ID 
					  -- AND SCI_SECURITY_TYPE_VALUE = 'MS') 
	 -- WHERE A.CMS_COLLATERAL_ID IN (SELECT M2.CMS_COLLATERAL_ID FROM SI_TEMP_MIMB_CO003 T2, CMS_MARKETABLE_SEC M2, CMS_SECURITY S2 
									-- WHERE T2.SOURCE_SEC_ID = S2.SCI_SECURITY_DTL_ID 
									  -- AND T2.IS_VALID = 'Y' 
									  -- AND S2.CMS_COLLATERAL_ID = M2.CMS_COLLATERAL_ID 
									  -- AND SCI_SECURITY_TYPE_VALUE = 'MS' 
									  -- AND S2.SOURCE_ID = 'MIMB' 
									-- GROUP BY M2.CMS_COLLATERAL_ID);--

	DECLARE GLOBAL TEMPORARY TABLE SESSION.temp_portfolio_item1
			(CMS_COLLATERAL_ID BIGINT)
    WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;--
	
	INSERT INTO SESSION.temp_portfolio_item1 (
		SELECT M2.CMS_COLLATERAL_ID FROM SI_TEMP_MIMB_CO003 T2, CMS_MARKETABLE_SEC M2, CMS_SECURITY S2 
									WHERE T2.SOURCE_SEC_ID = S2.SCI_SECURITY_DTL_ID 
									  AND T2.IS_VALID = 'Y' 
									  AND S2.CMS_COLLATERAL_ID = M2.CMS_COLLATERAL_ID 
									  AND SCI_SECURITY_TYPE_VALUE = 'MS' 
									  AND S2.SOURCE_ID = 'MIMB' 
									GROUP BY M2.CMS_COLLATERAL_ID );--
	
	create index SESSION.idx_main_prf on SESSION.temp_portfolio_item1
    (CMS_COLLATERAL_ID)
    allow reverse scans;--
	
	UPDATE CMS_PORTFOLIO_ITEM A 
	SET (TYPE, 
        CDS_NUMBER, 
        AGENT_NAME, 
        RECOGNIZED_EXCHANGE_FLAG, 
        RECOGN_EXCHANGE, 
        CUSTODIAN_TYPE, 
        REGISTERED_NAME, 
        NO_OF_UNITS, 
        UNIT_PRICE, 
        UNIT_PRICE_CURRENCY, 
        STOCK_EXCHANGE, 
        STOCK_EXCHANGE_COUNTRY, 
        EXCHANGE_CONTROL_OBTAINED, 
        STOCK_CODE, 
        BASEL_COMPLIANT_TEXT, 
        status) = (SELECT EQUITY_TYPE, 
					       CDS_NUMBER, 
					       NOMINEE_NAME, 
					       RECOG_EXCHANGE, 
						   CASE RECOG_EXCHANGE WHEN 'Y' THEN 'TRUE' WHEN 'N' THEN 'FALSE' ELSE RECOG_EXCHANGE END, 
					       SEC_CUSTODIAN_TYPE, 
					       REG_OWNER, 
					       NUMBER_UNITS, 
					       UNIT_PRICE, 
					       CMS_SEC_CURRENCY, 
					       STOCK_EXCHANGE, 
					       COUNTRY_STOCK_EXCHANGE, 
					       EXCHANGE_CTRL_APPROVAL, 
					       STOCK_CODE, 
					       BASEL_COMPLT_UNIT_TRUST, 
					       'ACTIVE' 
					 FROM SI_TEMP_MIMB_CO003 T1, 
						  CMS_MARKETABLE_SEC M1, 
						  CMS_SECURITY S1 
					WHERE T1.SOURCE_SEC_ID = S1.SCI_SECURITY_DTL_ID 
					  AND T1.IS_VALID = 'Y' 
					  AND S1.CMS_COLLATERAL_ID = M1.CMS_COLLATERAL_ID 
					  AND A.CMS_COLLATERAL_ID = M1.CMS_COLLATERAL_ID 
					  AND SCI_SECURITY_TYPE_VALUE = 'MS') 
	WHERE EXISTS (select 1 from SESSION.temp_portfolio_item1 T
					where T.CMS_COLLATERAL_ID = A.CMS_COLLATERAL_ID fetch first row only);--
	   
	drop table SESSION.temp_portfolio_item1;--
	commit;--

  -- LOCK TABLE CMS_PORTFOLIO_ITEM IN EXCLUSIVE MODE;--
	INSERT INTO CMS_PORTFOLIO_ITEM	
  ( cms_collateral_id,
	item_id, TYPE,
	CDS_NUMBER, AGENT_NAME, 
	RECOGNIZED_EXCHANGE_FLAG,  
	RECOGN_EXCHANGE,
	CUSTODIAN_TYPE,
	REGISTERED_NAME,
	NO_OF_UNITS, UNIT_PRICE, 
	UNIT_PRICE_CURRENCY,
	STOCK_EXCHANGE, STOCK_EXCHANGE_COUNTRY,
	EXCHANGE_CONTROL_OBTAINED,
	STOCK_CODE, BASEL_COMPLIANT_TEXT, 
	source_id,
	cms_ref_id,
	status  )
    ( SELECT M.CMS_COLLATERAL_ID,
      CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT),
      EQUITY_TYPE,
      CDS_NUMBER,  NOMINEE_NAME,
      RECOG_EXCHANGE, 
	  (CASE RECOG_EXCHANGE WHEN 'Y' THEN 'TRUE' WHEN 'N' THEN 'FALSE' ELSE RECOG_EXCHANGE END),
	  SEC_CUSTODIAN_TYPE,
	  REG_OWNER,
      NUMBER_UNITS, UNIT_PRICE,
	  CMS_SEC_CURRENCY,
      STOCK_EXCHANGE, COUNTRY_STOCK_EXCHANGE,
      EXCHANGE_CTRL_APPROVAL,
      STOCK_CODE, BASEL_COMPLT_UNIT_TRUST,
      'MIMB',
      CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT),
      'ACTIVE'
      FROM SI_TEMP_MIMB_CO003 T, CMS_MARKETABLE_SEC M, CMS_SECURITY S
      WHERE S.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID 
      AND T.SOURCE_SEC_ID = S.SCI_SECURITY_DTL_ID 
      AND T.IS_VALID = 'Y'
      AND NOT EXISTS (  SELECT 1 FROM CMS_PORTFOLIO_ITEM 
                        WHERE SOURCE_ID = 'MIMB' 
                        AND CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID fetch first row only));--
	
	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 16);--
	commit;--
  
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_PORTFOLIO_ITEM
	--
	-------------------------------------
	-- LOCK TABLE CMS_STAGE_PORTFOLIO_ITEM IN SHARE MODE;--
	-- UPDATE CMS_STAGE_PORTFOLIO_ITEM P 
	   -- SET STATUS = 'DELETED' 
	 -- WHERE P.SOURCE_ID = 'MIMB' 
	   -- AND NOT EXISTS (SELECT 1 FROM SI_TEMP_MIMB_CO003 T, CMS_STAGE_MARKETABLE_SEC M, CMS_STAGE_SECURITY S, transaction trx 
	                    -- WHERE P.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID
	                      -- AND M.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID 
	                      -- AND S.SCI_SECURITY_DTL_ID = T.SOURCE_SEC_ID 
	                      -- AND SOURCE_ID = 'MIMB' 
	                      -- AND T.IS_VALID = 'Y' 
	                      -- AND trx.transaction_type = 'COL' 
	                      -- AND trx.staging_reference_id = S.cms_collateral_id 
	                      -- AND S.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID fetch first row only);--
						  
	DECLARE GLOBAL TEMPORARY TABLE SESSION.temp_stage_portfolio_item
		(CMS_COLLATERAL_ID BIGINT)
    WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;--
	
	INSERT INTO SESSION.temp_stage_portfolio_item (
		SELECT P.CMS_COLLATERAL_ID FROM SI_TEMP_MIMB_CO003 T, CMS_STAGE_MARKETABLE_SEC M, CMS_STAGE_SECURITY S, transaction trx, CMS_STAGE_PORTFOLIO_ITEM P 
	                    WHERE P.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID
	                      AND M.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID 
	                      AND S.SCI_SECURITY_DTL_ID = T.SOURCE_SEC_ID 
	                      AND P.SOURCE_ID = 'MIMB' 
	                      AND T.IS_VALID = 'Y' 
	                      AND trx.transaction_type = 'COL' 
	                      AND trx.staging_reference_id = S.cms_collateral_id 
	                      AND S.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID);--
	
	create index SESSION.idx_main_prf on SESSION.temp_stage_portfolio_item
		(CMS_COLLATERAL_ID)
    allow reverse scans;--
	
	UPDATE CMS_STAGE_PORTFOLIO_ITEM P 
	   SET STATUS = 'DELETED' 
	 WHERE P.SOURCE_ID = 'MIMB' 
	   AND NOT EXISTS (SELECT 1 FROM SESSION.temp_stage_portfolio_item T
						WHERE T.CMS_COLLATERAL_ID = P.CMS_COLLATERAL_ID fetch first row only);--
	   
	drop table SESSION.temp_stage_portfolio_item;--						  

	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 17);--
	commit;--

	-- LOCK TABLE CMS_STAGE_PORTFOLIO_ITEM IN SHARE MODE;--
	-- UPDATE CMS_STAGE_PORTFOLIO_ITEM A 
	-- SET (TYPE, 
        -- CDS_NUMBER, 
        -- AGENT_NAME, 
        -- RECOGNIZED_EXCHANGE_FLAG, 
        -- RECOGN_EXCHANGE, 
        -- CUSTODIAN_TYPE, 
        -- REGISTERED_NAME, 
        -- NO_OF_UNITS, 
        -- UNIT_PRICE, 
        -- UNIT_PRICE_CURRENCY, 
        -- STOCK_EXCHANGE, 
        -- STOCK_EXCHANGE_COUNTRY, 
        -- EXCHANGE_CONTROL_OBTAINED, 
        -- STOCK_CODE, 
        -- BASEL_COMPLIANT_TEXT, 
        -- status) = (SELECT EQUITY_TYPE, 
					       -- CDS_NUMBER, 
					       -- NOMINEE_NAME, 
					       -- RECOG_EXCHANGE, 
						   -- CASE RECOG_EXCHANGE WHEN 'Y' THEN 'TRUE' WHEN 'N' THEN 'FALSE' ELSE RECOG_EXCHANGE END, 
					       -- SEC_CUSTODIAN_TYPE, 
					       -- REG_OWNER, 
					       -- NUMBER_UNITS, 
					       -- UNIT_PRICE, 
					       -- CMS_SEC_CURRENCY, 
					       -- STOCK_EXCHANGE, 
					       -- COUNTRY_STOCK_EXCHANGE, 
					       -- EXCHANGE_CTRL_APPROVAL, 
					       -- STOCK_CODE, 
					       -- BASEL_COMPLT_UNIT_TRUST, 
					       -- 'ACTIVE' 
					 -- FROM SI_TEMP_MIMB_CO003 T1, CMS_STAGE_MARKETABLE_SEC M1, CMS_STAGE_SECURITY S1, transaction TRX1 
					-- WHERE TRX1.staging_reference_id = S1.cms_collateral_id 
					  -- AND TRX1.transaction_type = 'COL' 
					  -- AND T1.SOURCE_SEC_ID = S1.SCI_SECURITY_DTL_ID 
					  -- AND S1.SOURCE_ID = 'MIMB' 
					  -- AND T1.IS_VALID = 'Y' 
					  -- AND S1.CMS_COLLATERAL_ID = M1.CMS_COLLATERAL_ID 
					  -- AND A.CMS_COLLATERAL_ID = M1.CMS_COLLATERAL_ID) 
	 -- WHERE EXISTS (SELECT 1 FROM SI_TEMP_MIMB_CO003 T2, CMS_STAGE_MARKETABLE_SEC M2, CMS_STAGE_SECURITY S2, transaction TRX2 
	                -- WHERE T2.SOURCE_SEC_ID = S2.SCI_SECURITY_DTL_ID 
	                  -- AND T2.IS_VALID = 'Y' 
	                  -- AND S2.CMS_COLLATERAL_ID = M2.CMS_COLLATERAL_ID 
	                  -- AND A.CMS_COLLATERAL_ID = M2.CMS_COLLATERAL_ID
	                  -- AND S2.SOURCE_ID = 'MIMB' 
	                  -- AND TRX2.transaction_type = 'COL' 
	                  -- AND TRX2.staging_reference_id = S2.cms_collateral_id fetch first row only);--
					  
	DECLARE GLOBAL TEMPORARY TABLE SESSION.temp_stage_portfolio_item2
			(CMS_COLLATERAL_ID BIGINT)
    WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;--
	
	INSERT INTO SESSION.temp_stage_portfolio_item2 (
		SELECT A.CMS_COLLATERAL_ID FROM SI_TEMP_MIMB_CO003 T2, CMS_STAGE_MARKETABLE_SEC M2, CMS_STAGE_SECURITY S2, transaction TRX2, CMS_STAGE_PORTFOLIO_ITEM A 
	                WHERE T2.SOURCE_SEC_ID = S2.SCI_SECURITY_DTL_ID 
	                  AND T2.IS_VALID = 'Y' 
	                  AND S2.CMS_COLLATERAL_ID = M2.CMS_COLLATERAL_ID 
	                  AND A.CMS_COLLATERAL_ID = M2.CMS_COLLATERAL_ID
	                  AND S2.SOURCE_ID = 'MIMB' 
	                  AND TRX2.transaction_type = 'COL' 
	                  AND TRX2.staging_reference_id = S2.cms_collateral_id);--
	
	create index SESSION.idx_main_prf on SESSION.temp_stage_portfolio_item2
		(CMS_COLLATERAL_ID)
    allow reverse scans;--
	
	UPDATE CMS_STAGE_PORTFOLIO_ITEM A 
	SET (TYPE, 
        CDS_NUMBER, 
        AGENT_NAME, 
        RECOGNIZED_EXCHANGE_FLAG, 
        RECOGN_EXCHANGE, 
        CUSTODIAN_TYPE, 
        REGISTERED_NAME, 
        NO_OF_UNITS, 
        UNIT_PRICE, 
        UNIT_PRICE_CURRENCY, 
        STOCK_EXCHANGE, 
        STOCK_EXCHANGE_COUNTRY, 
        EXCHANGE_CONTROL_OBTAINED, 
        STOCK_CODE, 
        BASEL_COMPLIANT_TEXT, 
        status) = (SELECT EQUITY_TYPE, 
					       CDS_NUMBER, 
					       NOMINEE_NAME, 
					       RECOG_EXCHANGE, 
						   CASE RECOG_EXCHANGE WHEN 'Y' THEN 'TRUE' WHEN 'N' THEN 'FALSE' ELSE RECOG_EXCHANGE END, 
					       SEC_CUSTODIAN_TYPE, 
					       REG_OWNER, 
					       NUMBER_UNITS, 
					       UNIT_PRICE, 
					       CMS_SEC_CURRENCY, 
					       STOCK_EXCHANGE, 
					       COUNTRY_STOCK_EXCHANGE, 
					       EXCHANGE_CTRL_APPROVAL, 
					       STOCK_CODE, 
					       BASEL_COMPLT_UNIT_TRUST, 
					       'ACTIVE' 
					 FROM SI_TEMP_MIMB_CO003 T1, CMS_STAGE_MARKETABLE_SEC M1, CMS_STAGE_SECURITY S1, transaction TRX1 
					WHERE TRX1.staging_reference_id = S1.cms_collateral_id 
					  AND TRX1.transaction_type = 'COL' 
					  AND T1.SOURCE_SEC_ID = S1.SCI_SECURITY_DTL_ID 
					  AND S1.SOURCE_ID = 'MIMB' 
					  AND T1.IS_VALID = 'Y' 
					  AND S1.CMS_COLLATERAL_ID = M1.CMS_COLLATERAL_ID 
					  AND A.CMS_COLLATERAL_ID = M1.CMS_COLLATERAL_ID) 
	 WHERE EXISTS (SELECT 1 FROM SESSION.temp_stage_portfolio_item2 T
					WHERE T.CMS_COLLATERAL_ID = A.CMS_COLLATERAL_ID fetch first row only);--
	   
	drop table SESSION.temp_stage_portfolio_item2;--

	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 18);--
	commit;--

  INSERT INTO CMS_STAGE_PORTFOLIO_ITEM
  (
    cms_collateral_id, item_id,
    TYPE,
    CDS_NUMBER, AGENT_NAME, 
    RECOGNIZED_EXCHANGE_FLAG, 
	RECOGN_EXCHANGE,  
	CUSTODIAN_TYPE,
    REGISTERED_NAME,
    NO_OF_UNITS, UNIT_PRICE, 
	UNIT_PRICE_CURRENCY,
    STOCK_EXCHANGE, STOCK_EXCHANGE_COUNTRY,
    EXCHANGE_CONTROL_OBTAINED,
    STOCK_CODE,
    BASEL_COMPLIANT_TEXT, 
    source_id, cms_ref_id,
    status
  )
  (  SELECT CMS_STG_COLLATERAL_ID,
     CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT),
     EQUITY_TYPE,
     CDS_NUMBER, NOMINEE_NAME,
     RECOG_EXCHANGE,  
	 (CASE RECOG_EXCHANGE WHEN 'Y' THEN 'TRUE' WHEN 'N' THEN 'FALSE' ELSE RECOG_EXCHANGE END),
	 SEC_CUSTODIAN_TYPE,
	 REG_OWNER,
     NUMBER_UNITS, UNIT_PRICE,
	 CMS_SEC_CURRENCY,
     STOCK_EXCHANGE, COUNTRY_STOCK_EXCHANGE,
     EXCHANGE_CTRL_APPROVAL,
     STOCK_CODE,
     BASEL_COMPLT_UNIT_TRUST,
     'MIMB',
     CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT),
     'ACTIVE'
      FROM SI_TEMP_MIMB_CO003 T, CMS_STAGE_MARKETABLE_SEC M, CMS_STAGE_SECURITY S
      WHERE S.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID 
      AND T.SOURCE_SEC_ID = S.SCI_SECURITY_DTL_ID 
      AND T.IS_VALID = 'Y'
      AND NOT EXISTS (  SELECT 1 FROM CMS_STAGE_PORTFOLIO_ITEM 
                        WHERE SOURCE_ID = 'MIMB' 
                        AND CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID fetch first row only));--
						
	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 19);--
	commit;--
  
  ---------------------------------------------------
  -- Actual Table
  -- Update CMS_PORTFOLIO_ITEM - ISIN_CODE
  ---------------------------------------------------

  update CMS_PORTFOLIO_ITEM p
  set (ISIN_CODE, ISSUER_NAME) = (select ISIN_CODE, NAME from CMS_PRICE_FEED f
		where f.STOCK_CODE = p.STOCK_CODE fetch first row only);--  
  
  commit;--  
  
  ---------------------------------------------------
  -- Actual Table
  -- Update CMS_STAGE_PORTFOLIO_ITEM - ISIN_CODE
  ---------------------------------------------------

  update CMS_STAGE_PORTFOLIO_ITEM p
  set (ISIN_CODE, ISSUER_NAME) = (select ISIN_CODE, NAME from CMS_STAGE_PRICE_FEED f
		where f.TICKER = p.STOCK_CODE fetch first row only);--  
  
  commit;--    

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 20);--
  commit;--    
  

  UPDATE SI_TEMP_MIMB_CO003 T
  SET ( CMS_LSP_APPR_LMTS_ID, 
        CMS_LIMIT_PROFILE_ID) = 
    ( SELECT distinct L.CMS_LSP_APPR_LMTS_ID, L.CMS_LIMIT_PROFILE_ID
      FROM SCI_LSP_APPR_LMTS L
      WHERE L.LMT_ID = T.SOURCE_LMT_ID
      AND L.SOURCE_ID = 'MIMB')
  WHERE T.IS_VALID = 'Y';--


 CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 21);--
	commit;--

  UPDATE CMS_LIMIT_SECURITY_MAP LSM
  SET LSM.UPDATE_STATUS_IND = 'D',
      LSM.DELETION_DATE = CURRENT_TIMESTAMP
  WHERE EXISTS ( SELECT 1 FROM CMS_SECURITY S, SCI_LSP_APPR_LMTS L
                 WHERE LSM.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID 
                 AND LSM.CMS_LSP_APPR_LMTS_ID = L.CMS_LSP_APPR_LMTS_ID 
                 AND S.SCI_SECURITY_TYPE_VALUE = 'MS'
                 AND (S.STATUS = 'DELETED' OR L.CMS_LIMIT_STATUS = 'DELETED') 
                 AND S.SOURCE_ID = 'MIMB' 
                 AND L.SOURCE_ID = 'MIMB' fetch first row only)
    AND LSM.SOURCE_ID = 'MIMB' 
    AND UPDATE_STATUS_IND <> 'D';--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 22);--
  commit;--

  INSERT INTO CMS_LIMIT_SECURITY_MAP
  ( CHARGE_ID,
    CMS_LSP_APPR_LMTS_ID,
    CMS_COLLATERAL_ID,
    SCI_LAS_LE_ID,
    CUSTOMER_CATEGORY,
    CMS_LSP_LMT_PROFILE_ID,
    SCI_LAS_SEC_ID,
	SCI_LAS_BCA_REF_NUM,
	SCI_LAS_LMT_ID,
	SCI_LAS_LSP_ID,
    UPDATE_STATUS_IND,
    SOURCE_ID
  )
  ( SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_MAP_SEQ), 2)) as BIGINT),
    CMS_LSP_APPR_LMTS_ID,
    CMS_COLLATERAL_ID,
    SOURCE_LMT_ID,
    'MB',
    CMS_LIMIT_PROFILE_ID,
    SOURCE_SEC_ID,
	AA_NO,
	SOURCE_LMT_ID,
	1,
    'I',
    'MIMB'
    FROM SI_TEMP_MIMB_CO003 T
    WHERE T.IS_VALID = 'Y' 
    AND NOT EXISTS ( SELECT 1 FROM CMS_LIMIT_SECURITY_MAP M, CMS_SECURITY S 
                     WHERE T.IS_VALID = 'Y' 
                     AND M.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID
                     AND S.SCI_SECURITY_DTL_ID = T.SOURCE_SEC_ID 
                     AND M.SOURCE_ID = 'MIMB' 
                     AND S.SOURCE_ID = 'MIMB' fetch first row only ) );--  

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 23);--
  commit;--


  
  -------------------------------------
  -- Staging Table
  -- CMS_STAGE_LIMIT_SECURITY_MAP
  --
  -------------------------------------
  
  UPDATE CMS_STAGE_LIMIT_SECURITY_MAP LSM
  SET LSM.UPDATE_STATUS_IND = 'D',
	LSM.DELETION_DATE = CURRENT_TIMESTAMP
  WHERE EXISTS (  SELECT 1 FROM CMS_STAGE_SECURITY S, SCI_LSP_APPR_LMTS L, transaction trx
                  WHERE LSM.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID 
                  AND LSM.CMS_LSP_APPR_LMTS_ID = L.CMS_LSP_APPR_LMTS_ID 
                  AND S.SCI_SECURITY_TYPE_VALUE = 'MS'
                  AND (S.STATUS = 'DELETED' OR L.CMS_LIMIT_STATUS = 'DELETED') 
                  AND LSM.SOURCE_ID = 'MIMB' 
				  AND trx.transaction_type = 'COL'
				  AND trx.staging_reference_id = S.cms_collateral_id fetch first row only );--  

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 24);--	   
  commit;--

  INSERT INTO CMS_STAGE_LIMIT_SECURITY_MAP
  ( CHARGE_ID,
    CMS_LSP_APPR_LMTS_ID,
    CMS_COLLATERAL_ID,
    SCI_LAS_LE_ID,
    CUSTOMER_CATEGORY,
    CMS_LSP_LMT_PROFILE_ID,
    SCI_LAS_SEC_ID,
	SCI_LAS_BCA_REF_NUM,
	SCI_LAS_LMT_ID,	
	SCI_LAS_LSP_ID,
    UPDATE_STATUS_IND,
    SOURCE_ID
  )
  ( SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_MAP_SEQ), 2)) as BIGINT),
    CMS_LSP_APPR_LMTS_ID,
    cms_stg_collateral_id,
    SOURCE_LMT_ID,
    'MB',
    CMS_LIMIT_PROFILE_ID,
    SOURCE_SEC_ID,
	AA_NO,
	SOURCE_LMT_ID,	
	1,
    'I',
    'MIMB'
    FROM SI_TEMP_MIMB_CO003 T
    WHERE T.IS_VALID = 'Y' 
    AND NOT EXISTS (  SELECT 1 FROM CMS_STAGE_LIMIT_SECURITY_MAP M
                      WHERE M.CMS_COLLATERAL_ID = T.cms_stg_collateral_id));--  

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 25);--
  commit;--     
  
  ----------------------------
  -- Actual table
  -- SCI_PLEDGOR_DTL
  ----------------------------

--  FOR cur_upd_plg_dtl AS
--      SELECT SEC_PLEDGOR_ID  temp_SEC_PLEDGOR_ID ,
--      --distinct SEC_PLEDGOR_ID  temp_SEC_PLEDGOR_ID ,
--      SEC_PLEDGOR_NAME name,
--      SEC_PLEDGOR_REL_CAT     cat,
--      SEC_PLEDGOR_REL_CODE    code
--      FROM SI_TEMP_MIMB_CO003, sci_pledgor_dtl a
--      WHERE SEC_PLEDGOR_ID = a.plg_le_id
--      group by SEC_PLEDGOR_ID,
--              SEC_PLEDGOR_NAME,
--              SEC_PLEDGOR_REL_CAT,
--              SEC_PLEDGOR_REL_CODE
--  DO
--    UPDATE sci_pledgor_dtl a
--    SET  PLG_LEGAL_NAME = cur_upd_plg_dtl.name,
--        PLG_REL_TYPE_NUM = cur_upd_plg_dtl.cat,
--        PLG_REL_TYPE_VALUE = cur_upd_plg_dtl.code,
--        UPDATE_STATUS_IND = 'U'
--    WHERE source_id = 'MIMB'
--    AND EXISTS ( SELECT 1 FROM SI_TEMP_MIMB_CO003
--               WHERE a.plg_le_id = cur_upd_plg_dtl.temp_SEC_PLEDGOR_ID
--               fetch first row only
--             );
--  END FOR;--

  UPDATE sci_pledgor_dtl a
  SET ( PLG_LEGAL_NAME,
        PLG_REL_TYPE_NUM,
        PLG_REL_TYPE_VALUE,
		PLG_INC_NUM_TEXT,
        UPDATE_STATUS_IND
      ) =
    ( SELECT distinct SEC_PLEDGOR_NAME,
      SEC_PLEDGOR_REL_CAT,
      SEC_PLEDGOR_REL_CODE,
	  (select LMP_ID_NUMBER from sci_le_main_profile WHERE lmp_le_id = t.SEC_PLEDGOR_ID and source_id = 'MIMB'),
      'U'
      FROM SI_TEMP_MIMB_CO003 t
      WHERE SEC_PLEDGOR_ID = a.plg_le_id
	  AND t.IS_VALID = 'Y'
    )
  WHERE source_id = 'MIMB'
  AND EXISTS ( SELECT 1 FROM SI_TEMP_MIMB_CO003
               WHERE a.plg_le_id = SEC_PLEDGOR_ID 
			   AND IS_VALID = 'Y' fetch first row only );--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 26);--
  commit;--

  INSERT INTO sci_pledgor_dtl
  ( cms_pledgor_dtl_id,
    PLG_LE_ID,
    PLG_LEGAL_NAME,
    PLG_REL_TYPE_NUM,
    PLG_REL_TYPE_VALUE,
	PLG_INC_NUM_TEXT,
    source_id,
    update_status_ind
  )
  (  SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 2)) as BIGINT),
      SEC_PLEDGOR_ID,
      SEC_PLEDGOR_NAME,
      SEC_PLEDGOR_REL_CAT,
      SEC_PLEDGOR_REL_CODE,
	  (select LMP_ID_NUMBER from sci_le_main_profile WHERE lmp_le_id = SEC_PLEDGOR_ID and source_id = 'MIMB'),
      'MIMB',
      'I'
      FROM (SELECT distinct SEC_PLEDGOR_ID, SEC_PLEDGOR_NAME, SEC_PLEDGOR_REL_CAT, SEC_PLEDGOR_REL_CODE FROM SI_TEMP_MIMB_CO003 t
            WHERE NOT EXISTS (  SELECT 1 FROM sci_pledgor_dtl
                          WHERE t.SEC_PLEDGOR_ID = plg_le_id
                          AND source_id = 'MIMB' fetch first row only )
            AND t.IS_VALID = 'Y') as pledgor);--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 27);--
  commit;--
  
  ----------------------------
  -- Staging table
  -- STAGE_PLEDGOR_DTL
  ----------------------------
  
  UPDATE stage_pledgor_dtl a
  SET ( PLG_LEGAL_NAME,
        PLG_REL_TYPE_NUM,
        PLG_REL_TYPE_VALUE,
		PLG_INC_NUM_TEXT,
        UPDATE_STATUS_IND) =
    ( SELECT distinct SEC_PLEDGOR_NAME,
      SEC_PLEDGOR_REL_CAT,
      SEC_PLEDGOR_REL_CODE,
	  (select LMP_ID_NUMBER from sci_le_main_profile WHERE lmp_le_id = t.SEC_PLEDGOR_ID and source_id = 'MIMB'),
      'U'
      FROM SI_TEMP_MIMB_CO003 t
      WHERE SEC_PLEDGOR_ID = a.plg_le_id
	  AND t.IS_VALID = 'Y'
    )
  WHERE source_id = 'MIMB'
  AND EXISTS (  SELECT 1 FROM SI_TEMP_MIMB_CO003
                WHERE a.plg_le_id = SEC_PLEDGOR_ID
				AND IS_VALID = 'Y' fetch first row only);--

  commit;--
	
  INSERT INTO stage_pledgor_dtl
  ( cms_pledgor_dtl_id,
    PLG_LE_ID,
    PLG_LEGAL_NAME,
    PLG_REL_TYPE_NUM,
    PLG_REL_TYPE_VALUE,
	PLG_INC_NUM_TEXT,
    source_id,
    update_status_ind
  )
  (  SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 2)) as BIGINT),
      SEC_PLEDGOR_ID,
      SEC_PLEDGOR_NAME,
      SEC_PLEDGOR_REL_CAT,
      SEC_PLEDGOR_REL_CODE,
	  (select LMP_ID_NUMBER from sci_le_main_profile WHERE lmp_le_id = SEC_PLEDGOR_ID and source_id = 'MIMB'),
      'MIMB',
      'I'
      FROM (SELECT distinct SEC_PLEDGOR_ID, SEC_PLEDGOR_NAME, SEC_PLEDGOR_REL_CAT, SEC_PLEDGOR_REL_CODE FROM SI_TEMP_MIMB_CO003 t
            WHERE NOT EXISTS (  SELECT 1 FROM stage_pledgor_dtl
                          WHERE t.SEC_PLEDGOR_ID = plg_le_id
                          AND source_id = 'MIMB' fetch first row only )
            AND t.IS_VALID = 'Y') as stage_pledgor);--

	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 28);--
	commit;--  

	---------------------------------------------------
	-- Staging Table
	-- STAGE_SEC_PLDGR_MAP
	--
	---------------------------------------------------

	UPDATE SI_TEMP_MIMB_CO003 T
	SET CMS_STG_PLEDGOR_DTL_ID = 
		( SELECT P.CMS_PLEDGOR_DTL_ID
		  FROM STAGE_PLEDGOR_DTL P
		  WHERE T.SEC_PLEDGOR_ID = P.PLG_LE_ID 
		  AND P.SOURCE_ID = 'MIMB' fetch first row only)
	WHERE T.IS_VALID = 'Y';--

	commit;--
  
	UPDATE STAGE_SEC_PLDGR_MAP spm 
	SET UPDATE_STATUS_IND = 'D'
	WHERE spm.SOURCE_ID = 'MIMB'
	AND EXISTS ( SELECT 1 FROM CMS_SECURITY sec, SCI_PLEDGOR_DTL plg, transaction trx
				 WHERE spm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID 
				 AND spm.CMS_PLEDGOR_DTL_ID = plg.CMS_PLEDGOR_DTL_ID 
				 AND sec.SCI_SECURITY_TYPE_VALUE = 'MS'
				 AND (sec.STATUS = 'DELETED' OR plg.UPDATE_STATUS_IND = 'D') 
				 AND spm.SOURCE_ID = 'MIMB' 
				 AND sec.SOURCE_ID = 'MIMB' 
				 AND plg.SOURCE_ID = 'MIMB' 
				 AND trx.transaction_type = 'COL'
				 AND trx.staging_reference_id = sec.cms_collateral_id);--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 29);--
	commit;--
	
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
		t.SOURCE_SEC_ID,
		t.CMS_STG_PLEDGOR_DTL_ID,
		t.CMS_STG_COLLATERAL_ID,
		t.SEC_PLEDGOR_REL_CAT,
		t.SEC_PLEDGOR_REL_CODE,
		'I', 'MIMB'
		FROM SI_TEMP_MIMB_CO003 t
		WHERE t.IS_VALID = 'Y' 
		AND t.CMS_STG_COLLATERAL_ID IS NOT NULL 
		AND t.CMS_STG_PLEDGOR_DTL_ID IS NOT NULL 
		AND NOT EXISTS (  SELECT 1 FROM STAGE_SEC_PLDGR_MAP
						  WHERE cms_collateral_id = t.CMS_STG_COLLATERAL_ID
						  AND cms_pledgor_dtl_id = t.CMS_STG_PLEDGOR_DTL_ID fetch first row only));--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 30);--
	commit;--
	
	-- Set reference id
	UPDATE STAGE_SEC_PLDGR_MAP spm
	SET SPM_ID = (select spm1.cms_sec_pldgr_map_id from STAGE_SEC_PLDGR_MAP spm1
					where spm1.cms_sec_pldgr_map_id = spm.cms_sec_pldgr_map_id)
	WHERE SPM_ID is null;--

	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 31);--  
	commit;--  

  ---------------------------------------------------
  -- Actual Table
  -- SCI_SEC_PLDGR_MAP
  --
  ---------------------------------------------------

	UPDATE SI_TEMP_MIMB_CO003 T
	SET CMS_PLEDGOR_DTL_ID = 
		( SELECT P.CMS_PLEDGOR_DTL_ID
		  FROM SCI_PLEDGOR_DTL P
		  WHERE T.SEC_PLEDGOR_ID = P.PLG_LE_ID 
		  AND P.SOURCE_ID = 'MIMB' fetch first row only)
	WHERE T.IS_VALID = 'Y';--

	commit;--
  
	UPDATE SCI_SEC_PLDGR_MAP spm 
	SET UPDATE_STATUS_IND = 'D'
	WHERE spm.SOURCE_ID = 'MIMB'
	AND EXISTS ( SELECT 1 FROM CMS_SECURITY sec, SCI_PLEDGOR_DTL plg
				 WHERE spm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID 
				 AND spm.CMS_PLEDGOR_DTL_ID = plg.CMS_PLEDGOR_DTL_ID 
				 AND sec.SCI_SECURITY_TYPE_VALUE = 'MS'
				 AND (sec.STATUS = 'DELETED' OR plg.UPDATE_STATUS_IND = 'D') 
				 AND sec.SOURCE_ID = 'MIMB' 
				 AND plg.SOURCE_ID = 'MIMB' fetch first row only);--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 32);--
	commit;--
	
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
		t.SOURCE_SEC_ID,
		t.CMS_PLEDGOR_DTL_ID,
		t.CMS_COLLATERAL_ID,
		t.SEC_PLEDGOR_REL_CAT,
		t.SEC_PLEDGOR_REL_CODE,
		'I', 'MIMB'
		FROM SI_TEMP_MIMB_CO003 t
		WHERE t.IS_VALID = 'Y' 
		AND t.CMS_COLLATERAL_ID IS NOT NULL 
		AND t.CMS_PLEDGOR_DTL_ID IS NOT NULL 
		AND NOT EXISTS (  SELECT 1 FROM sci_sec_pldgr_map
						  WHERE cms_collateral_id = t.CMS_COLLATERAL_ID
						  AND cms_pledgor_dtl_id = t.CMS_PLEDGOR_DTL_ID fetch first row only));--

	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 33);--
	commit;--
	
	-- Set reference id point to staging reference id
	UPDATE SCI_SEC_PLDGR_MAP spm
	SET SPM_ID = (select sspm.cms_sec_pldgr_map_id from STAGE_SEC_PLDGR_MAP sspm, transaction trx, SI_TEMP_MIMB_CO003 t 
					where trx.transaction_type = 'COL'
					and trx.reference_id = spm.cms_collateral_id
					and trx.staging_reference_id = sspm.cms_collateral_id
					and t.CMS_COLLATERAL_ID = spm.CMS_COLLATERAL_ID
					and t.CMS_PLEDGOR_DTL_ID = spm.CMS_PLEDGOR_DTL_ID)
	WHERE SPM_ID is null;--

	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 34);--  
	commit;--

	----------------------------
	-- Actual table
	-- CMS_CHARGE_DETAIL
	----------------------------
	-- UPDATE SI_TEMP_MIMB_CO003 T
	-- SET cms_act_chrg_dtl_id =
		-- (SELECT CHARGE_DETAIL_ID
		-- FROM CMS_CHARGE_DETAIL chrg
		-- WHERE chrg.STATUS = 'ACTIVE'
		-- AND chrg.CMS_COLLATERAL_ID = T.cms_collateral_id
		-- AND chrg.SOURCE_ID = 'MIMB')
	-- WHERE IS_VALID = 'Y';--
	
	DECLARE GLOBAL TEMPORARY TABLE SESSION.temp_charge_detail
			(CHARGE_DETAIL_ID BIGINT, 
			CMS_COLLATERAL_ID BIGINT)
    WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;--
	
	INSERT INTO SESSION.temp_charge_detail (
		SELECT chrg.CHARGE_DETAIL_ID, chrg.CMS_COLLATERAL_ID
		FROM CMS_CHARGE_DETAIL chrg, SI_TEMP_MIMB_CO003 T
		WHERE chrg.STATUS = 'ACTIVE'
		AND chrg.CMS_COLLATERAL_ID = T.cms_collateral_id
		AND chrg.SOURCE_ID = 'MIMB');--
	
	create index SESSION.idx_main_prf on SESSION.temp_charge_detail
		(CHARGE_DETAIL_ID, CMS_COLLATERAL_ID)
    allow reverse scans;--
	
	UPDATE SI_TEMP_MIMB_CO003 T
	SET cms_act_chrg_dtl_id =
		(SELECT CHARGE_DETAIL_ID FROM SESSION.temp_charge_detail chrg
		WHERE chrg.CMS_COLLATERAL_ID = T.CMS_COLLATERAL_ID)
	WHERE IS_VALID = 'Y';--
	   
	drop table SESSION.temp_charge_detail;--
	commit;--

	-- UPDATE cms_charge_detail a
	-- SET ( CHARGE_NATURE,
		-- CHARGE_CURRENCY_CODE,
		-- CHARGE_AMOUNT,
		-- LEGAL_CHARGE_DATE,
		-- CHARGE_TYPE,
		-- STATUS
	  -- ) =
	-- ( SELECT NATURE_CHARGE,
	  -- CMS_SEC_CURRENCY,
	  -- AMOUNT_CHARGE,
	  -- DATE_LEGAL_CHARGED,
	  -- CHARGE_TYPE,
	  -- 'ACTIVE'
	  -- FROM SI_TEMP_MIMB_CO003
	  -- WHERE CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID
	  -- AND cms_act_chrg_dtl_id = a.charge_detail_id 
	  -- AND IS_VALID = 'Y')
	  -- WHERE source_id = 'MIMB'
	  -- AND EXISTS ( SELECT 1 FROM SI_TEMP_MIMB_CO003
				   -- WHERE a.CMS_COLLATERAL_ID = CMS_COLLATERAL_ID
				   -- AND cms_act_chrg_dtl_id = a.charge_detail_id 
				   -- AND IS_VALID = 'Y' fetch first row only);--
				   
	DECLARE GLOBAL TEMPORARY TABLE SESSION.temp_charge_detail1
			(CMS_COLLATERAL_ID BIGINT,
			CMS_ACT_CHRG_DTL_ID BIGINT)
    WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;--
	
	INSERT INTO SESSION.temp_charge_detail1 (
		SELECT T.CMS_COLLATERAL_ID, T.CMS_ACT_CHRG_DTL_ID FROM SI_TEMP_MIMB_CO003 T, CMS_CHARGE_DETAIL a
		WHERE a.CMS_COLLATERAL_ID = T.CMS_COLLATERAL_ID
		AND T.cms_act_chrg_dtl_id = a.charge_detail_id 
		AND T.IS_VALID = 'Y');--
	
	create index SESSION.idx_main_prf on SESSION.temp_charge_detail1
		(CMS_COLLATERAL_ID, CMS_ACT_CHRG_DTL_ID)
    allow reverse scans;--
	
	UPDATE cms_charge_detail a
	SET ( CHARGE_NATURE,
		CHARGE_CURRENCY_CODE,
		CHARGE_AMOUNT,
		LEGAL_CHARGE_DATE,
		CHARGE_TYPE,
		STATUS
	  ) =
	( SELECT NATURE_CHARGE,
	  CMS_SEC_CURRENCY,
	  AMOUNT_CHARGE,
	  DATE_LEGAL_CHARGED,
	  CHARGE_TYPE,
	  'ACTIVE'
	  FROM SI_TEMP_MIMB_CO003
	  WHERE CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID
	  AND cms_act_chrg_dtl_id = a.charge_detail_id 
	  AND IS_VALID = 'Y')
	  WHERE source_id = 'MIMB'
	  AND EXISTS ( SELECT 1 FROM SESSION.temp_charge_detail1 T
				   WHERE T.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID
				   AND T.CMS_ACT_CHRG_DTL_ID = a.CHARGE_DETAIL_ID fetch first row only);--
	   
	drop table SESSION.temp_charge_detail1;--				   

	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 35);--
	commit;--

  INSERT INTO cms_charge_detail
  ( charge_detail_id,
    CHARGE_NATURE,
	CHARGE_CURRENCY_CODE,
    CHARGE_AMOUNT,
    LEGAL_CHARGE_DATE,
    CHARGE_TYPE,
	CMS_COLLATERAL_ID,
	SCI_LAS_SEC_ID,
	STATUS,
    source_id,
	cms_ref_id)
  ( SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR col_limit_charge_seq), 2)) as BIGINT),
    NATURE_CHARGE,
	CMS_SEC_CURRENCY,
    AMOUNT_CHARGE,
    DATE_LEGAL_CHARGED,
    CHARGE_TYPE,
	CMS_COLLATERAL_ID,
	SOURCE_SEC_ID,
	'ACTIVE',
    'MIMB',
	CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR col_limit_charge_seq), 2)) as BIGINT)
    FROM SI_TEMP_MIMB_CO003 t
    WHERE IS_VALID = 'Y'
	AND NOT EXISTS (  SELECT 1 FROM cms_charge_detail
                      WHERE t.CMS_COLLATERAL_ID = CMS_COLLATERAL_ID
                      AND source_id = 'MIMB' fetch first row only));--
	commit;--
                      
  INSERT INTO cms_limit_charge_map 
  	( LIMIT_CHARGE_MAP_ID,
  	  CHARGE_ID,
  	  CHARGE_DETAIL_ID,
  	  CMS_LSP_APPR_LMTS_ID,
  	  CMS_COLLATERAL_ID,
  	  STATUS,
  	  CUSTOMER_CATEGORY,
  	  CMS_LSP_LMT_PROFILE_ID)
  (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR LIMIT_CHARGE_MAP_SEQ), 2)) as BIGINT),
		  m.charge_id,
		  CHARGE_DETAIL_ID,
		  m.CMS_LSP_APPR_LMTS_ID,
		  chrg.cms_collateral_id,
		  'ACTIVE',
		  'MB',
		  CMS_LIMIT_PROFILE_ID
	 FROM cms_limit_security_map m, cms_charge_detail chrg, si_temp_mimb_co003 t
	WHERE m.cms_collateral_id = chrg.cms_collateral_id
	  AND t.cms_collateral_id = chrg.cms_collateral_id
	  AND t.is_valid = 'Y'
	  AND NOT EXISTS (SELECT 1 from cms_limit_charge_map
	    			   WHERE charge_id = m.charge_id fetch first row only));--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 36);--
  commit;--  

	----------------------------
	-- Actual table
	-- CMS_STAGE_CHARGE_DETAIL
	----------------------------
	-- UPDATE SI_TEMP_MIMB_CO003 T
	-- SET cms_stg_chrg_dtl_id =
		-- (SELECT CHARGE_DETAIL_ID
		-- FROM CMS_STAGE_CHARGE_DETAIL chrg
		-- WHERE chrg.STATUS = 'ACTIVE'
		-- AND chrg.CMS_COLLATERAL_ID = T.cms_stg_collateral_id
		-- AND chrg.SOURCE_ID = 'MIMB')
	-- WHERE IS_VALID = 'Y';--
	
	DECLARE GLOBAL TEMPORARY TABLE SESSION.temp_stage_charge_detail
		(CMS_COLLATERAL_ID BIGINT, 
		CHARGE_DETAIL_ID BIGINT)
    WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;--
	
	INSERT INTO SESSION.temp_stage_charge_detail (
		SELECT chrg.CMS_COLLATERAL_ID, chrg.CHARGE_DETAIL_ID
		FROM CMS_STAGE_CHARGE_DETAIL chrg, SI_TEMP_MIMB_CO003 T
		WHERE chrg.STATUS = 'ACTIVE'
		AND chrg.CMS_COLLATERAL_ID = T.cms_stg_collateral_id
		AND chrg.SOURCE_ID = 'MIMB');--
	
	create index SESSION.idx_main_prf on SESSION.temp_stage_charge_detail
		(CMS_COLLATERAL_ID, CHARGE_DETAIL_ID)
    allow reverse scans;--
	
	UPDATE SI_TEMP_MIMB_CO003 T
	SET cms_stg_chrg_dtl_id =
		(SELECT CHARGE_DETAIL_ID FROM SESSION.temp_stage_charge_detail chrg
		WHERE chrg.CMS_COLLATERAL_ID = T.cms_stg_collateral_id fetch first row only)
	WHERE IS_VALID = 'Y';--
	   
	drop table SESSION.temp_stage_charge_detail;--	
	commit;--

	-- UPDATE cms_stage_charge_detail a
	-- SET ( CHARGE_NATURE,
			-- CHARGE_CURRENCY_CODE,
			-- CHARGE_AMOUNT,
			-- LEGAL_CHARGE_DATE,
			-- CHARGE_TYPE,
			-- STATUS
	  -- ) =
	-- ( SELECT NATURE_CHARGE,
		  -- CMS_SEC_CURRENCY,
		  -- AMOUNT_CHARGE,
		  -- DATE_LEGAL_CHARGED,
		  -- CHARGE_TYPE,
		  -- 'ACTIVE'
		  -- FROM SI_TEMP_MIMB_CO003
		  -- WHERE cms_stg_collateral_id = a.CMS_COLLATERAL_ID
		  -- AND cms_stg_chrg_dtl_id = a.charge_detail_id 
		  -- AND IS_VALID = 'Y'
	-- )
	-- WHERE source_id = 'MIMB'
	-- AND EXISTS (SELECT 1 FROM SI_TEMP_MIMB_CO003
			  -- WHERE a.CMS_COLLATERAL_ID = cms_stg_collateral_id
			  -- AND cms_stg_chrg_dtl_id = a.charge_detail_id 
			  -- AND IS_VALID = 'Y' fetch first row only );--

				   
	DECLARE GLOBAL TEMPORARY TABLE SESSION.temp_stage_charge_detail1
		(CMS_STG_COLLATERAL_ID BIGINT, 
		CMS_STG_CHRG_DTL_ID BIGINT)
    WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;--
	
	INSERT INTO SESSION.temp_stage_charge_detail1 (
		SELECT T.CMS_STG_COLLATERAL_ID, T.CMS_STG_CHRG_DTL_ID FROM SI_TEMP_MIMB_CO003 T, cms_stage_charge_detail a
		WHERE a.CMS_COLLATERAL_ID = T.cms_stg_collateral_id
		AND T.cms_stg_chrg_dtl_id = a.charge_detail_id 
		AND IS_VALID = 'Y');--
	
	create index SESSION.idx_main_prf on SESSION.temp_stage_charge_detail1
		(CMS_STG_COLLATERAL_ID, CMS_STG_CHRG_DTL_ID)
    allow reverse scans;--
	
	UPDATE cms_stage_charge_detail a
	SET ( CHARGE_NATURE,
			CHARGE_CURRENCY_CODE,
			CHARGE_AMOUNT,
			LEGAL_CHARGE_DATE,
			CHARGE_TYPE,
			STATUS
	  ) =
	( SELECT NATURE_CHARGE,
		  CMS_SEC_CURRENCY,
		  AMOUNT_CHARGE,
		  DATE_LEGAL_CHARGED,
		  CHARGE_TYPE,
		  'ACTIVE'
		  FROM SI_TEMP_MIMB_CO003
		  WHERE cms_stg_collateral_id = a.CMS_COLLATERAL_ID
		  AND cms_stg_chrg_dtl_id = a.charge_detail_id 
		  AND IS_VALID = 'Y'
	)
	WHERE source_id = 'MIMB'
	AND EXISTS (SELECT 1 FROM SESSION.temp_stage_charge_detail1 T
				  WHERE a.CMS_COLLATERAL_ID = T.cms_stg_collateral_id
				  AND T.cms_stg_chrg_dtl_id = a.CHARGE_DETAIL_ID fetch first row only );--
	   
	drop table SESSION.temp_stage_charge_detail1;--
	commit;--

	INSERT INTO cms_stage_charge_detail
	( charge_detail_id,
		CHARGE_NATURE,
		CHARGE_CURRENCY_CODE,
		CHARGE_AMOUNT,
		LEGAL_CHARGE_DATE,
		CHARGE_TYPE, 
		CMS_COLLATERAL_ID,
		SCI_LAS_SEC_ID,
		STATUS,
		source_id
		)
	( SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR col_limit_charge_seq), 2)) as BIGINT),
		NATURE_CHARGE,
		CMS_SEC_CURRENCY,
		AMOUNT_CHARGE,
		DATE_LEGAL_CHARGED,
		CHARGE_TYPE,
		cms_stg_collateral_id,
		SOURCE_SEC_ID,
		'ACTIVE',
		'MIMB'
		FROM SI_TEMP_MIMB_CO003 t
		WHERE NOT EXISTS (SELECT 1 FROM cms_stage_charge_detail
						  WHERE t.cms_stg_collateral_id = CMS_COLLATERAL_ID)
	AND t.IS_VALID = 'Y');--

	commit;--
	
	  INSERT INTO cms_stage_limit_charge_map 
  	( LIMIT_CHARGE_MAP_ID,
  	  CHARGE_ID,
  	  CHARGE_DETAIL_ID,
  	  CMS_LSP_APPR_LMTS_ID,
  	  CMS_COLLATERAL_ID,
  	  STATUS,
  	  CUSTOMER_CATEGORY,
  	  CMS_LSP_LMT_PROFILE_ID)
  (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR LIMIT_CHARGE_MAP_SEQ), 2)) as BIGINT),
		  m.charge_id,
		  CHARGE_DETAIL_ID,
		  m.CMS_LSP_APPR_LMTS_ID,
		  chrg.cms_collateral_id,
		  'ACTIVE',
		  'MB',
		  CMS_LIMIT_PROFILE_ID
	 FROM cms_stage_limit_security_map m, cms_stage_charge_detail chrg, si_temp_mimb_co003 t
	WHERE m.cms_collateral_id = chrg.cms_collateral_id
	  AND t.cms_stg_collateral_id = chrg.cms_collateral_id
	  AND t.is_valid = 'Y'
	  AND NOT EXISTS (SELECT 1 from cms_stage_limit_charge_map
	    			   WHERE charge_id = m.charge_id fetch first row only));--

	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO003', 'MIMB', 0);--
	commit;--

END@


CREATE PROCEDURE SI_RUN_TEMP_MIMB_CO004
  LANGUAGE SQL
BEGIN
  DECLARE v_security_sub_type_id   VARCHAR(100);--
  DECLARE v_subtype_name           VARCHAR(100);--
  DECLARE v_security_type_name     VARCHAR(100);--
  DECLARE v_security_type_id       VARCHAR(100);--
  DECLARE mimb_ref_entry_code VARCHAR(40);--
  
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 1);--

  SELECT security_sub_type_id, subtype_name, security_type_name, security_type_id
  INTO   v_security_sub_type_id, v_subtype_name, v_security_type_name, v_security_type_id
  FROM   cms_security_sub_type 
  WHERE  security_sub_type_id='CS200';--  
  
  SELECT entry_code INTO mimb_ref_entry_code FROM common_code_category_entry
  	WHERE category_code = 'CENTRE' AND entry_source = 'MIMB';--

  -------------------------------------
  -- Auto Feed Std Code
  -- COMMON_CODE_CATEGORY_ENTRY
  --
  -------------------------------------

  FOR cur_std_code AS
    SELECT DISTINCT BRANCH_NAME_CODE code, BRANCH_NAME_DESC desc,
         BRANCH_NAME_CAT cat, 'MIMB' source_id
      FROM SI_TEMP_MIMB_CO004
     WHERE LENGTH(BRANCH_NAME_CODE) > 0
       AND LENGTH(BRANCH_NAME_DESC) > 0
       AND IS_VALID = 'Y'
  DO
    CALL si_auto_feed_standard_code_wf_ref(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id, mimb_ref_entry_code);--
  END FOR;--
  
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 2);--
  commit;--
  
  -------------------------------------
  -- Actual Table
  -- CMS_SECURITY
  --
  -------------------------------------
  
	UPDATE SI_TEMP_MIMB_CO004 a SET (cms_act_col_id, cms_stg_col_id) =
	(SELECT reference_id, staging_reference_id
		FROM transaction, cms_security
		WHERE transaction_type = 'COL'
	    AND reference_id = cms_collateral_id
		AND a.SOURCE_SEC_ID = sci_security_dtl_id
		AND source_id = 'MIMB')
	WHERE IS_VALID = 'Y';--	  
		
	commit;--
    
	UPDATE CMS_SECURITY S
	SET STATUS = 'DELETED',
	  S.DELETED_DATE = CURRENT_TIMESTAMP
	WHERE S.SOURCE_ID = 'MIMB'
	AND S.SCI_SECURITY_TYPE_VALUE = 'CS'
    AND NOT EXISTS (  SELECT 1 FROM SI_TEMP_MIMB_CO004 T
                      WHERE T.cms_act_col_id = S.CMS_COLLATERAL_ID
                      AND T.IS_VALID = 'Y');--

  commit;--

  UPDATE CMS_SECURITY a
  SET ( security_sub_type_id,
        subtype_name,
        type_name,
        sci_security_subtype_value,
        sci_security_type_value,
        SCI_SECURITY_DTL_ID,
        SCI_ORIG_SECURITY_CURRENCY,
        SCI_SECURITY_CURRENCY,
        SECURITY_LOCATION,
        SECURITY_ORGANISATION,
        CUSTODIAN_TYPE,
        SECURITY_CUSTODIAN,
        SECURITY_PERFECTION_DATE,
        IS_LEGAL_ENFORCE,
        IS_LEGAL_ENFORCE_DATE,
        EXCHANGE_CONTROL_OBTAINED,
		SCI_REFERENCE_NOTE,
		SOURCE_SECURITY_SUB_TYPE,		
		COLLATERAL_STATUS,
        status 
      ) =
    ( SELECT v_security_sub_type_id,
             v_subtype_name,
             v_security_type_name,
             v_security_sub_type_id,
             v_security_type_id,
             SOURCE_SEC_ID,
             ORIG_SEC_CURRENCY,
             CMS_SEC_CURRENCY,
             SEC_LOCATION,
          BRANCH_NAME_CODE, 
            SEC_CUSTODIAN_TYPE,
            SEC_CUSTODIAN_VALUE,
            SEC_PERFECTION_DATE,
            LEGAL_ENFORCE,
            LEGAL_ENFORCE_DATE,
        --EXCHANGE_CTRL_APPROVAL,
        ( CASE WHEN ( EXCHANGE_CTRL_APPROVAL = 'NA')  THEN 'O' ELSE EXCHANGE_CTRL_APPROVAL  END ),
			SOURCE_SEC_ID,
			source_security_sub_type,	
			'1',
            'ACTIVE'
      FROM SI_TEMP_MIMB_CO004 
      WHERE IS_VALID = 'Y' 
      AND a.CMS_COLLATERAL_ID = cms_act_col_id
      and source_id='MIMB')
  WHERE EXISTS (  select 1 from SI_TEMP_MIMB_CO004 
                  where a.CMS_COLLATERAL_ID = cms_act_col_id
                  and source_id='MIMB' 
				  and IS_VALID = 'Y' fetch first row only);--

  commit;--

  INSERT INTO cms_security 
  ( cms_collateral_id,
    security_sub_type_id,
    subtype_name,
    type_name,
    sci_security_subtype_value,
    sci_security_type_value,
    SCI_SECURITY_DTL_ID,
    SCI_ORIG_SECURITY_CURRENCY,
    SCI_SECURITY_CURRENCY,
    SECURITY_LOCATION,
    SECURITY_ORGANISATION,  
    CUSTODIAN_TYPE,
    SECURITY_CUSTODIAN,
    SECURITY_PERFECTION_DATE,
    IS_LEGAL_ENFORCE,
    IS_LEGAL_ENFORCE_DATE,
    EXCHANGE_CONTROL_OBTAINED,
	SCI_REFERENCE_NOTE,
	SOURCE_SECURITY_SUB_TYPE,	
	COLLATERAL_STATUS,
    source_id,
    status)
    ( SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
      v_security_sub_type_id,
      v_subtype_name,
      v_security_type_name,
      v_security_sub_type_id,
      v_security_type_id,
      SOURCE_SEC_ID,
      ORIG_SEC_CURRENCY,
      CMS_SEC_CURRENCY,
      SEC_LOCATION,
          BRANCH_NAME_CODE,
      SEC_CUSTODIAN_TYPE,
      SEC_CUSTODIAN_VALUE,
      SEC_PERFECTION_DATE,
      LEGAL_ENFORCE,
      LEGAL_ENFORCE_DATE,
        --EXCHANGE_CTRL_APPROVAL,
        ( CASE WHEN ( EXCHANGE_CTRL_APPROVAL = 'NA')  THEN 'O' ELSE EXCHANGE_CTRL_APPROVAL  END ),
		SOURCE_SEC_ID,
		source_security_sub_type,		
		'1',
      'MIMB',
      'ACTIVE'
      FROM SI_TEMP_MIMB_CO004 t 
      WHERE NOT EXISTS (  SELECT 1 FROM cms_security 
                          WHERE t.IS_VALID = 'Y' 
                          AND sci_security_dtl_id=SOURCE_SEC_ID 
                          and source_id='MIMB' fetch first row only)
	  AND t.IS_VALID = 'Y');--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 3);--              
  commit;--

  ------------------------------------------
  -- Update Transaction
  -- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
  --
  ------------------------------------------  
  FOR cur_col_key AS
    SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
    FROM CMS_SECURITY a
    WHERE EXISTS (  SELECT 1 FROM SI_TEMP_MIMB_CO004
                    WHERE a.SCI_SECURITY_DTL_ID = SOURCE_SEC_ID                   
                    AND is_valid = 'Y'
                 )
  DO
    CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);--
  END FOR;--  

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 4);--  
  commit;--

  -- cms_security_source     

  UPDATE cms_security_source
  SET ( cms_collateral_id,
        source_security_id,
        source_id, 
        last_update_date,
        security_sub_type_id
      ) =
    ( SELECT sec.cms_collateral_id,
      t.SOURCE_SEC_ID,
      'MIMB',
      current_timestamp,
      v_security_sub_type_id
      FROM cms_security sec, SI_TEMP_MIMB_CO004 t 
      WHERE sec.sci_security_dtl_id = SOURCE_SEC_ID
      AND sec.sci_security_dtl_id = source_security_id 
      AND source_id = 'MIMB' 
      AND is_valid = 'Y')
  WHERE EXISTS ( SELECT 1 FROM SI_TEMP_MIMB_CO004
                 WHERE source_security_id = SOURCE_SEC_ID 
                 AND is_valid = 'Y')
  AND source_id = 'MIMB';--

  commit;--

  INSERT INTO cms_security_source
  ( cms_security_source_id,
    cms_collateral_id,
    source_security_id,
    source_id, 
    status,
    last_update_date,
    security_sub_type_id
  )
  ( SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
    sec.cms_collateral_id,
    t.SOURCE_SEC_ID,
    'MIMB',
    'ACTIVE',
    CURRENT_TIMESTAMP,
    v_security_sub_type_id
    FROM cms_security sec, SI_TEMP_MIMB_CO004 t
    WHERE NOT EXISTS ( SELECT 1 FROM cms_security_source 
                       WHERE source_security_id = SOURCE_SEC_ID 
                       AND source_id = 'MIMB') 
    AND is_valid = 'Y'
    AND sec.sci_security_dtl_id = t.SOURCE_SEC_ID
    AND source_id = 'MIMB');--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 5);--  
  commit;--

  -- Update ID to temp table

  UPDATE SI_TEMP_MIMB_CO004 T
  SET CMS_COLLATERAL_ID = 
    ( SELECT S.CMS_COLLATERAL_ID
      FROM CMS_SECURITY S
      WHERE S.SCI_SECURITY_DTL_ID = T.SOURCE_SEC_ID 
      AND S.SOURCE_ID = 'MIMB'
    )
  WHERE T.IS_VALID = 'Y';--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 6);--  
  commit;--

  -------------------------------------
  -- Staging Table
  -- CMS_STAGE_SECURITY
  --
  -------------------------------------

  UPDATE CMS_STAGE_SECURITY S
  SET STATUS = 'DELETED',
      S.DELETED_DATE = CURRENT_TIMESTAMP
  WHERE S.SOURCE_ID = 'MIMB' 
  AND S.SCI_SECURITY_TYPE_VALUE = 'CS'
  AND NOT EXISTS ( SELECT 1 FROM SI_TEMP_MIMB_CO004 T 
                   WHERE S.CMS_COLLATERAL_ID = cms_stg_col_id
                   AND T.IS_VALID = 'Y' fetch first row only);--

  commit;--

  UPDATE CMS_STAGE_SECURITY a
  SET ( security_sub_type_id,
        subtype_name,
        type_name,
        sci_security_subtype_value,
        sci_security_type_value,
        SCI_SECURITY_DTL_ID,
        SCI_ORIG_SECURITY_CURRENCY,
        SCI_SECURITY_CURRENCY,
        SECURITY_LOCATION,
        SECURITY_ORGANISATION,  
        CUSTODIAN_TYPE,
        SECURITY_CUSTODIAN,
        SECURITY_PERFECTION_DATE,
        IS_LEGAL_ENFORCE,
        IS_LEGAL_ENFORCE_DATE,
        EXCHANGE_CONTROL_OBTAINED,
		SCI_REFERENCE_NOTE,
		SOURCE_SECURITY_SUB_TYPE,	
		COLLATERAL_STATUS,		
        status
      ) =
    ( SELECT v_security_sub_type_id,
             v_subtype_name,
             v_security_type_name,
             v_security_sub_type_id,
             v_security_type_id,
             SOURCE_SEC_ID,
             ORIG_SEC_CURRENCY,
             CMS_SEC_CURRENCY,
             SEC_LOCATION,
          BRANCH_NAME_CODE,
             SEC_CUSTODIAN_TYPE,
             SEC_CUSTODIAN_VALUE,
             SEC_PERFECTION_DATE,
             LEGAL_ENFORCE,
             LEGAL_ENFORCE_DATE,
        --EXCHANGE_CTRL_APPROVAL,
        ( CASE WHEN ( EXCHANGE_CTRL_APPROVAL = 'NA')  THEN 'O' ELSE EXCHANGE_CTRL_APPROVAL  END ),
			SOURCE_SEC_ID,
			source_security_sub_type,	
			'1',
            'ACTIVE'
      FROM SI_TEMP_MIMB_CO004 
      WHERE IS_VALID = 'Y' 
      AND a.CMS_COLLATERAL_ID = cms_stg_col_id
	  AND source_id = 'MIMB')
  WHERE EXISTS ( select 1 from SI_TEMP_MIMB_CO004 
                 where a.CMS_COLLATERAL_ID = cms_stg_col_id
                 and source_id = 'MIMB'
				 and IS_VALID = 'Y' fetch first row only );--

  commit;--

  INSERT INTO cms_stage_security
  ( cms_collateral_id,
    security_sub_type_id,
    subtype_name,
    type_name,
    sci_security_subtype_value,
    sci_security_type_value,
    SCI_SECURITY_DTL_ID,
    SCI_ORIG_SECURITY_CURRENCY,
    SCI_SECURITY_CURRENCY,
    SECURITY_LOCATION,
    SECURITY_ORGANISATION,  
    CUSTODIAN_TYPE,
    SECURITY_CUSTODIAN,
    SECURITY_PERFECTION_DATE,
    IS_LEGAL_ENFORCE,
    IS_LEGAL_ENFORCE_DATE,
    EXCHANGE_CONTROL_OBTAINED,
	SCI_REFERENCE_NOTE,
	SOURCE_SECURITY_SUB_TYPE,	
	COLLATERAL_STATUS,
    source_id
  )
    ( SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT), 
      v_security_sub_type_id,
      v_subtype_name,
      v_security_type_name,
      v_security_sub_type_id,
      v_security_type_id,
      SOURCE_SEC_ID,
      ORIG_SEC_CURRENCY,
      CMS_SEC_CURRENCY,
      SEC_LOCATION,
        BRANCH_NAME_CODE,
      SEC_CUSTODIAN_TYPE,
      SEC_CUSTODIAN_VALUE,
      SEC_PERFECTION_DATE,
      LEGAL_ENFORCE,
      LEGAL_ENFORCE_DATE,
        --EXCHANGE_CTRL_APPROVAL,
        ( CASE WHEN ( EXCHANGE_CTRL_APPROVAL = 'NA')  THEN 'O' ELSE EXCHANGE_CTRL_APPROVAL  END ),
		SOURCE_SEC_ID,
		source_security_sub_type,		
		'1',
      'MIMB'
      FROM SI_TEMP_MIMB_CO004 t 
      WHERE NOT EXISTS ( SELECT 1 FROM cms_stage_security 
                         WHERE t.IS_VALID = 'Y' 
                         AND sci_security_dtl_id = SOURCE_SEC_ID 
                         and source_id = 'MIMB' fetch first row only )
	AND t.IS_VALID = 'Y');--  

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 7);--  
  commit;--

  CALL SI_AUTO_CREATE_TRANSACTION_FOR_COLLATERAL;--
  
  -- If user updated security
  UPDATE SI_TEMP_MIMB_CO004 T
  SET cms_stg_collateral_id = 
	(SELECT staging_reference_id FROM transaction
			WHERE reference_id = (SELECT CMS_COLLATERAL_ID 
									FROM CMS_SECURITY S
									WHERE S.SCI_SECURITY_DTL_ID = T.SOURCE_SEC_ID
									AND source_id = 'MIMB')
			AND transaction_type = 'COL')  
  WHERE T.IS_VALID = 'Y'
  AND EXISTS (select 1 from TRANSACTION tran, CMS_SECURITY sec
				where tran.reference_id = sec.CMS_COLLATERAL_ID
				and sec.SCI_SECURITY_DTL_ID = T.SOURCE_SEC_ID
				and transaction_type = 'COL'
				and source_id = 'MIMB');--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 8);--  
  commit;--  

  ----------------------------
  -- Actual table
  -- SCI_PLEDGOR_DTL
  ----------------------------

  UPDATE SCI_PLEDGOR_DTL A
  SET ( PLG_LE_ID,
        PLG_LEGAL_NAME,
        PLG_REL_TYPE_NUM,
        PLG_REL_TYPE_VALUE,
		PLG_INC_NUM_TEXT,
        UPDATE_STATUS_IND
      ) =
    ( SELECT SEC_PLEDGOR_ID,
      SEC_PLEDGOR_NAME,
      SEC_PLEDGOR_REL_CAT,
      SEC_PLEDGOR_REL_CODE,
	  (select LMP_ID_NUMBER from sci_le_main_profile WHERE lmp_le_id = t.SEC_PLEDGOR_ID and source_id = 'MIMB'),
      'U'
      FROM SI_TEMP_MIMB_CO004 t
      WHERE SEC_PLEDGOR_ID = A.PLG_LE_ID
	  AND t.IS_VALID = 'Y'
    )
  WHERE SOURCE_ID = 'MIMB'
  AND EXISTS ( SELECT 1 FROM SI_TEMP_MIMB_CO004
               WHERE A.PLG_LE_ID = SEC_PLEDGOR_ID 
			   AND IS_VALID = 'Y' fetch first row only );--

  commit;--

  INSERT INTO sci_pledgor_dtl
  ( cms_pledgor_dtl_id,
    PLG_LE_ID,
    PLG_LEGAL_NAME,
    PLG_REL_TYPE_NUM,
    PLG_REL_TYPE_VALUE,
	PLG_INC_NUM_TEXT,
    source_id,
    update_status_ind
  )
  (  SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 2)) as BIGINT),
      SEC_PLEDGOR_ID,
      SEC_PLEDGOR_NAME,
      SEC_PLEDGOR_REL_CAT,
      SEC_PLEDGOR_REL_CODE,
	  (select LMP_ID_NUMBER from sci_le_main_profile WHERE lmp_le_id = SEC_PLEDGOR_ID and source_id = 'MIMB'),
      'MIMB',
      'I'
      FROM (SELECT distinct SEC_PLEDGOR_ID, SEC_PLEDGOR_NAME, SEC_PLEDGOR_REL_CAT, SEC_PLEDGOR_REL_CODE FROM SI_TEMP_MIMB_CO004 t
            WHERE NOT EXISTS (  SELECT 1 FROM sci_pledgor_dtl
		                          WHERE t.SEC_PLEDGOR_ID = plg_le_id
		                          AND source_id = 'MIMB' fetch first row only )
            AND t.IS_VALID = 'Y') as pledgor);--      	

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 9);--  
  commit;--
  
  ----------------------------
  -- Staging table
  -- STAGE_PLEDGOR_DTL
  ----------------------------
  
  UPDATE stage_pledgor_dtl a
  SET ( PLG_LEGAL_NAME,
        PLG_REL_TYPE_NUM,
        PLG_REL_TYPE_VALUE,
		PLG_INC_NUM_TEXT,
        UPDATE_STATUS_IND) =
    ( SELECT distinct SEC_PLEDGOR_NAME,
      SEC_PLEDGOR_REL_CAT,
      SEC_PLEDGOR_REL_CODE,
	  (select LMP_ID_NUMBER from sci_le_main_profile WHERE lmp_le_id = t.SEC_PLEDGOR_ID and source_id = 'MIMB'),
      'U'
      FROM SI_TEMP_MIMB_CO004 t
      WHERE SEC_PLEDGOR_ID = a.plg_le_id
	  AND t.IS_VALID = 'Y'
    )
  WHERE source_id = 'MIMB'
  AND EXISTS (  SELECT 1 FROM SI_TEMP_MIMB_CO004
                WHERE a.plg_le_id = SEC_PLEDGOR_ID
				AND IS_VALID = 'Y' fetch first row only);--

  commit;--
	
  INSERT INTO stage_pledgor_dtl
  ( cms_pledgor_dtl_id,
    PLG_LE_ID,
    PLG_LEGAL_NAME,
    PLG_REL_TYPE_NUM,
    PLG_REL_TYPE_VALUE,
	PLG_INC_NUM_TEXT,
    source_id,
    update_status_ind
  )
  (  SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 2)) as BIGINT),
      SEC_PLEDGOR_ID,
      SEC_PLEDGOR_NAME,
      SEC_PLEDGOR_REL_CAT,
      SEC_PLEDGOR_REL_CODE,
	  (select LMP_ID_NUMBER from sci_le_main_profile WHERE lmp_le_id = SEC_PLEDGOR_ID and source_id = 'MIMB'),
      'MIMB',
      'I'
      FROM (SELECT distinct SEC_PLEDGOR_ID, SEC_PLEDGOR_NAME, SEC_PLEDGOR_REL_CAT, SEC_PLEDGOR_REL_CODE FROM SI_TEMP_MIMB_CO004 t
            WHERE NOT EXISTS (  SELECT 1 FROM stage_pledgor_dtl
                          WHERE t.SEC_PLEDGOR_ID = plg_le_id
                          AND source_id = 'MIMB' fetch first row only )
            AND t.IS_VALID = 'Y') as stage_pledgor);--
					   
  commit;--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 10);--
  commit;--    
  
  ---------------------------------------------------
  -- Staging Table
  -- STAGE_SEC_PLDGR_MAP
  --
  ---------------------------------------------------

	UPDATE SI_TEMP_MIMB_CO004 T
	SET CMS_STG_PLEDGOR_DTL_ID = 
		( SELECT P.CMS_PLEDGOR_DTL_ID
		  FROM STAGE_PLEDGOR_DTL P
		  WHERE T.SEC_PLEDGOR_ID = P.PLG_LE_ID 
		  AND P.SOURCE_ID = 'MIMB' fetch first row only)
	WHERE T.IS_VALID = 'Y';--

	commit;--
  
	UPDATE STAGE_SEC_PLDGR_MAP spm 
	SET UPDATE_STATUS_IND = 'D'
	WHERE spm.SOURCE_ID = 'MIMB'
	AND EXISTS ( SELECT 1 FROM CMS_SECURITY sec, SCI_PLEDGOR_DTL plg, transaction trx
				 WHERE spm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID 
				 AND spm.CMS_PLEDGOR_DTL_ID = plg.CMS_PLEDGOR_DTL_ID 
				 AND sec.SCI_SECURITY_TYPE_VALUE = 'CS'
				 AND (sec.STATUS = 'DELETED' OR plg.UPDATE_STATUS_IND = 'D') 
				 AND spm.SOURCE_ID = 'MIMB' 
				 AND sec.SOURCE_ID = 'MIMB' 
				 AND plg.SOURCE_ID = 'MIMB' 
				 AND trx.transaction_type = 'COL'
				 AND trx.staging_reference_id = sec.cms_collateral_id fetch first row only);--

	commit;--
	
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
		t.SOURCE_SEC_ID,
		t.CMS_STG_PLEDGOR_DTL_ID,
		t.CMS_STG_COLLATERAL_ID,
		t.SEC_PLEDGOR_REL_CAT,
		t.SEC_PLEDGOR_REL_CODE,
		'I', 'MIMB'
		FROM SI_TEMP_MIMB_CO004 t
		WHERE t.IS_VALID = 'Y' 
		AND t.CMS_STG_COLLATERAL_ID IS NOT NULL 
		AND t.CMS_STG_PLEDGOR_DTL_ID IS NOT NULL 
		AND NOT EXISTS (  SELECT 1 FROM STAGE_SEC_PLDGR_MAP
						  WHERE cms_collateral_id = t.CMS_STG_COLLATERAL_ID
						  AND cms_pledgor_dtl_id = t.CMS_STG_PLEDGOR_DTL_ID fetch first row only));--
					  
	commit;--
	
	-- Set reference id
	UPDATE STAGE_SEC_PLDGR_MAP spm
	SET SPM_ID = (select spm1.cms_sec_pldgr_map_id from STAGE_SEC_PLDGR_MAP spm1
					where spm1.cms_sec_pldgr_map_id = spm.cms_sec_pldgr_map_id)
	WHERE SPM_ID is null;--

	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 11);--  
	commit;--    

  ---------------------------------------------------
  -- Actual Table
  -- SCI_SEC_PLDGR_MAP
  --
  ---------------------------------------------------

  	UPDATE SI_TEMP_MIMB_CO004 T
	SET CMS_PLEDGOR_DTL_ID = 
		( SELECT P.CMS_PLEDGOR_DTL_ID
		  FROM SCI_PLEDGOR_DTL P
		  WHERE T.SEC_PLEDGOR_ID = P.PLG_LE_ID 
		  AND P.SOURCE_ID = 'MIMB')
	WHERE T.IS_VALID = 'Y';--

	commit;--
  
	UPDATE SCI_SEC_PLDGR_MAP spm 
	SET UPDATE_STATUS_IND = 'D'
	WHERE spm.SOURCE_ID = 'MIMB'
	AND EXISTS ( SELECT 1 FROM CMS_SECURITY sec, SCI_PLEDGOR_DTL plg
				 WHERE spm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID 
				 AND spm.CMS_PLEDGOR_DTL_ID = plg.CMS_PLEDGOR_DTL_ID 
				 AND sec.SCI_SECURITY_TYPE_VALUE = 'CS'
				 AND (sec.STATUS = 'DELETED' OR plg.UPDATE_STATUS_IND = 'D') 
				 AND sec.SOURCE_ID = 'MIMB' 
				 AND plg.SOURCE_ID = 'MIMB' fetch first row only);--

	commit;--
	
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
		t.SOURCE_SEC_ID,
		t.CMS_PLEDGOR_DTL_ID,
		t.CMS_COLLATERAL_ID,
		t.SEC_PLEDGOR_REL_CAT,
		t.SEC_PLEDGOR_REL_CODE,
		'I', 'MIMB'
		FROM SI_TEMP_MIMB_CO004 t
		WHERE t.IS_VALID = 'Y' 
		AND t.CMS_COLLATERAL_ID IS NOT NULL 
		AND t.CMS_PLEDGOR_DTL_ID IS NOT NULL 
		AND NOT EXISTS (  SELECT 1 FROM sci_sec_pldgr_map
						  WHERE cms_collateral_id = t.CMS_COLLATERAL_ID
						  AND cms_pledgor_dtl_id = t.CMS_PLEDGOR_DTL_ID fetch first row only));--
					  
	commit;--
	
	-- Set reference id point to staging reference id
	UPDATE SCI_SEC_PLDGR_MAP spm
	SET SPM_ID = (select sspm.cms_sec_pldgr_map_id from STAGE_SEC_PLDGR_MAP sspm, transaction trx, SI_TEMP_MIMB_CO004 t
	                where trx.transaction_type = 'COL'
	                and trx.reference_id = spm.cms_collateral_id
	                and trx.staging_reference_id = sspm.cms_collateral_id
	                and t.CMS_COLLATERAL_ID = spm.CMS_COLLATERAL_ID
	                and t.CMS_PLEDGOR_DTL_ID = spm.CMS_PLEDGOR_DTL_ID)
	WHERE SPM_ID is null;--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 12);--  
  commit;--  

  ----------------------------
  -- Actual table
  -- CMS_LIMIT_SECURITY_MAP
  ----------------------------
  LOCK TABLE SI_TEMP_MIMB_CO004 IN SHARE MODE;--
  UPDATE SI_TEMP_MIMB_CO004 T
  SET ( CMS_LSP_APPR_LMTS_ID,
        CMS_LIMIT_PROFILE_ID
      ) = 
    ( SELECT L.CMS_LSP_APPR_LMTS_ID,
      L.CMS_LIMIT_PROFILE_ID
      FROM SCI_LSP_APPR_LMTS L
      WHERE L.LMT_ID = T.SOURCE_LMT_ID 
      AND L.SOURCE_ID = 'MIMB'
    )
  WHERE T.IS_VALID = 'Y';--

  commit;--

  LOCK TABLE CMS_LIMIT_SECURITY_MAP IN SHARE MODE;--
  UPDATE CMS_LIMIT_SECURITY_MAP LSM
  SET LSM.UPDATE_STATUS_IND = 'D',
      LSM.DELETION_DATE = CURRENT_TIMESTAMP
  WHERE EXISTS ( SELECT 1 FROM CMS_SECURITY S, SCI_LSP_APPR_LMTS L
                 WHERE LSM.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID 
                 AND LSM.CMS_LSP_APPR_LMTS_ID = L.CMS_LSP_APPR_LMTS_ID 
                 AND S.SCI_SECURITY_TYPE_VALUE = 'CS'
                 AND (S.STATUS = 'DELETED' OR L.CMS_LIMIT_STATUS = 'DELETED') 
                 AND LSM.SOURCE_ID = 'MIMB' 
                 AND S.SOURCE_ID = 'MIMB' 
                 AND L.SOURCE_ID = 'MIMB'
               );--

  commit;--

  INSERT INTO CMS_LIMIT_SECURITY_MAP
  ( CHARGE_ID,
    CMS_LSP_APPR_LMTS_ID,
    CMS_COLLATERAL_ID,
    SCI_LAS_LE_ID,
    CUSTOMER_CATEGORY,
    CMS_LSP_LMT_PROFILE_ID,
    SCI_LAS_SEC_ID,
    SCI_LAS_LSP_ID,
    UPDATE_STATUS_IND,
    SOURCE_ID
  )
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_MAP_SEQ), 2)) as BIGINT),
      CMS_LSP_APPR_LMTS_ID,
      CMS_COLLATERAL_ID,
      SOURCE_LMT_ID,
      'MB',
      CMS_LIMIT_PROFILE_ID,
      SOURCE_SEC_ID,
      1,
      'I',
      'MIMB'
      FROM SI_TEMP_MIMB_CO004 T
      WHERE T.IS_VALID = 'Y' 
      AND NOT EXISTS ( SELECT 1 FROM CMS_LIMIT_SECURITY_MAP M, CMS_SECURITY S 
                       WHERE T.IS_VALID = 'Y' 
                       AND M.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID
                       AND S.SCI_SECURITY_DTL_ID = T.SOURCE_SEC_ID 
                       AND M.SOURCE_ID = 'MIMB' 
                       AND S.SOURCE_ID = 'MIMB' fetch first row only));--    

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 13);--              
  commit;--  

  ----------------------------
  -- Staging table
  -- CMS_STAGE_LIMIT_SECURITY_MAP
  ----------------------------

  UPDATE CMS_STAGE_LIMIT_SECURITY_MAP LSM
  SET LSM.UPDATE_STATUS_IND = 'D',
      LSM.DELETION_DATE = CURRENT_TIMESTAMP
  WHERE EXISTS ( SELECT 1 FROM CMS_STAGE_SECURITY S, SCI_LSP_APPR_LMTS L, transaction trx
                 WHERE LSM.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID 
                 AND LSM.CMS_LSP_APPR_LMTS_ID = L.CMS_LSP_APPR_LMTS_ID 
                 AND S.SCI_SECURITY_TYPE_VALUE = 'CS'
                 AND (S.STATUS = 'DELETED' OR L.CMS_LIMIT_STATUS = 'DELETED') 
                 AND LSM.SOURCE_ID = 'MIMB' 
				 AND trx.transaction_type = 'COL' 
				 AND trx.staging_reference_id = S.cms_collateral_id fetch first row only);--
  
  commit;--  

  INSERT INTO CMS_STAGE_LIMIT_SECURITY_MAP
  ( CHARGE_ID,
    CMS_LSP_APPR_LMTS_ID,
    CMS_COLLATERAL_ID,
    SCI_LAS_LE_ID,
    CUSTOMER_CATEGORY,
    CMS_LSP_LMT_PROFILE_ID,
    SCI_LAS_SEC_ID,
    SCI_LAS_LSP_ID,
    UPDATE_STATUS_IND,
    SOURCE_ID
  )
    ( SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_MAP_SEQ), 2)) as BIGINT),
      CMS_LSP_APPR_LMTS_ID,
      cms_stg_collateral_id,
      SOURCE_LMT_ID,
      'MB',
      CMS_LIMIT_PROFILE_ID,
      SOURCE_SEC_ID,
      1,
      'I',
      'MIMB'
      FROM SI_TEMP_MIMB_CO004 T
      WHERE T.IS_VALID = 'Y' 
      AND NOT EXISTS ( SELECT 1 FROM CMS_STAGE_LIMIT_SECURITY_MAP M, CMS_STAGE_SECURITY S 
                       WHERE T.IS_VALID = 'Y' 
					   AND M.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID
                       AND S.SCI_SECURITY_DTL_ID = T.SOURCE_SEC_ID 
                       AND M.SCI_LAS_SEC_ID = T.SOURCE_SEC_ID 
                       AND M.SOURCE_ID = 'MIMB' 
                       AND S.SOURCE_ID = 'MIMB' fetch first row only ));--    

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 14);--              
  commit;--

  -------------------------------------
  -- Actual Table
  -- CMS_CASH
  --
  -------------------------------------

	INSERT INTO CMS_CASH ( CMS_COLLATERAL_ID )
    ( SELECT T.CMS_COLLATERAL_ID 
      FROM SI_TEMP_MIMB_CO004 T
      WHERE T.IS_VALID = 'Y'
      AND NOT EXISTS ( SELECT 1 FROM CMS_CASH C, CMS_SECURITY S
                       WHERE C.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID  
                       AND S.SCI_SECURITY_DTL_ID = T.SOURCE_SEC_ID 
                       AND SOURCE_ID = 'MIMB' fetch first row only));--

	CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 15);--    
	commit;--

  -------------------------------------
  -- Staging Table
  -- CMS_STAGE_CASH
  --
  -------------------------------------

	INSERT INTO CMS_STAGE_CASH ( CMS_COLLATERAL_ID )
    ( SELECT T.cms_stg_collateral_id
      FROM SI_TEMP_MIMB_CO004 T
      WHERE T.IS_VALID = 'Y'
      AND NOT EXISTS ( SELECT 1 FROM CMS_STAGE_CASH C, CMS_STAGE_SECURITY S
                       WHERE C.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID 
                       AND S.SCI_SECURITY_DTL_ID = T.SOURCE_SEC_ID 
                       AND SOURCE_ID = 'MIMB' ));--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 16);--    
  commit;--  

  -------------------------------------
  -- Actual Table
  -- CMS_CASH_DEPOSIT
  --
  -------------------------------------

  UPDATE CMS_CASH_DEPOSIT D1 
   SET D1.STATUS = 'DELETED' 
 WHERE D1.SOURCE_ID = 'MIMB' 
   AND EXISTS (SELECT 1 FROM TABLE (SELECT D22.CMS_COLLATERAL_ID CMS_COLLATERAL_ID, 
								       D22.CASH_DEPOSIT_ID CASH_DEPOSIT_ID FROM CMS_CASH_DEPOSIT D22) D21, 
								       CMS_CASH C, CMS_SECURITY S 
				 WHERE D21.CMS_COLLATERAL_ID = C.CMS_COLLATERAL_ID 
				   AND C.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID 
				   AND S.SOURCE_ID = 'MIMB' 
				   AND D21.CASH_DEPOSIT_ID = D1.CASH_DEPOSIT_ID fetch first row only) 
   AND NOT EXISTS (SELECT 1 FROM SI_TEMP_MIMB_CO004 T 
                    WHERE T.IS_VALID = 'Y' 
                      AND T.DEPOSIT_REF_NUMBER = D1.DEPOSIT_REFERENCE_NUMBER fetch first row only);--
  
  commit;--

  UPDATE CMS_CASH_DEPOSIT a set(DEPOSIT_AMOUNT_CURRENCY, DEPOSIT_AMOUNT, CMS_COLLATERAL_ID, source_id) =
    (SELECT t.DEPOSIT_CURRENCY,  t.DEPOSIT_AMOUNT, s.CMS_COLLATERAL_ID, 'MIMB'
    FROM SI_TEMP_MIMB_CO004 t, CMS_SECURITY s 
    WHERE t.IS_VALID = 'Y' 
    AND t.DEPOSIT_REF_NUMBER=a.DEPOSIT_REFERENCE_NUMBER 
    AND a.source_id='MIMB'
    AND s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID 
    AND s.SOURCE_ID='MIMB') 
  WHERE EXISTS (select 1 from SI_TEMP_MIMB_CO004 
          where IS_VALID = 'Y' 
          and DEPOSIT_REF_NUMBER=a.DEPOSIT_REFERENCE_NUMBER 
          and a.source_id = 'MIMB' fetch first row only);--
  
  commit;--
      
  INSERT INTO CMS_CASH_DEPOSIT
  ( CASH_DEPOSIT_ID,
    DEPOSIT_REFERENCE_NUMBER,
    DEPOSIT_AMOUNT_CURRENCY,
    DEPOSIT_AMOUNT,
    CMS_COLLATERAL_ID,
    SOURCE_ID,
    CMS_REF_ID
  )
    ( SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT), 
      t.DEPOSIT_REF_NUMBER,
      t.DEPOSIT_CURRENCY,
      t.DEPOSIT_AMOUNT,
      s.CMS_COLLATERAL_ID,
      'MIMB',
      CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT)
     FROM SI_TEMP_MIMB_CO004 t, CMS_SECURITY s 
    WHERE t.IS_VALID = 'Y' 
    AND s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID 
    AND s.source_id='MIMB' 
    AND NOT EXISTS (SELECT 1 FROM CMS_CASH_DEPOSIT 
            WHERE t.IS_VALID = 'Y' 
            AND DEPOSIT_REFERENCE_NUMBER = t.DEPOSIT_REF_NUMBER 
            AND source_id='MIMB' fetch first row only));--
  
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 17);--
  commit;--

  -------------------------------------
  -- Staging Table
  -- CMS_STAGE_CASH_DEPOSIT
  --
  -------------------------------------
  
  UPDATE CMS_STAGE_CASH_DEPOSIT D SET D.STATUS = 'DELETED'
  WHERE D.SOURCE_ID = 'MIMB'
  AND EXISTS (SELECT 1 FROM CMS_STAGE_CASH C, CMS_STAGE_SECURITY S 
        WHERE D.CMS_COLLATERAL_ID = C.CMS_COLLATERAL_ID
        AND C.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID 
        AND S.SOURCE_ID = 'MIMB' fetch first row only)
  AND NOT EXISTS (SELECT 1 FROM SI_TEMP_MIMB_CO004 T
          WHERE T.IS_VALID = 'Y' 
          AND T.DEPOSIT_REF_NUMBER = D.DEPOSIT_REFERENCE_NUMBER 
		  AND T.IS_VALID = 'Y' fetch first row only);--  
  
  commit;--
  
  UPDATE CMS_STAGE_CASH_DEPOSIT a set(DEPOSIT_AMOUNT_CURRENCY, DEPOSIT_AMOUNT, CMS_COLLATERAL_ID, source_id) =
    (SELECT t.DEPOSIT_CURRENCY,  t.DEPOSIT_AMOUNT, s.CMS_COLLATERAL_ID, 'MIMB'
    FROM SI_TEMP_MIMB_CO004 t, CMS_STAGE_SECURITY s 
    WHERE t.IS_VALID = 'Y' 
    AND t.DEPOSIT_REF_NUMBER=a.DEPOSIT_REFERENCE_NUMBER 
    AND a.source_id='MIMB'
    AND s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID 
    AND s.SOURCE_ID='MIMB') 
  WHERE EXISTS (select 1 from SI_TEMP_MIMB_CO004, transaction trx, cms_stage_security s, cms_stage_cash c
          where DEPOSIT_REF_NUMBER = a.DEPOSIT_REFERENCE_NUMBER 
          and a.cms_collateral_id = c.cms_collateral_id
		  and c.cms_collateral_id = s.cms_collateral_id
		  and s.SCI_SECURITY_DTL_ID = SOURCE_SEC_ID
          and a.source_id = 'MIMB' 
		  and s.cms_collateral_id = trx.staging_reference_id
		  and trx.transaction_type = 'COL'
		  and IS_VALID = 'Y' fetch first row only);--  
		  
  commit;--
  
  INSERT INTO CMS_STAGE_CASH_DEPOSIT (CASH_DEPOSIT_ID, DEPOSIT_REFERENCE_NUMBER, DEPOSIT_AMOUNT_CURRENCY, DEPOSIT_AMOUNT, CMS_COLLATERAL_ID,
      SOURCE_ID, CMS_REF_ID)
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT), 
      t.DEPOSIT_REF_NUMBER, t.DEPOSIT_CURRENCY, t.DEPOSIT_AMOUNT, s.CMS_COLLATERAL_ID,'MIMB',
      CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT)
     FROM SI_TEMP_MIMB_CO004 t, CMS_STAGE_SECURITY s 
    WHERE t.IS_VALID = 'Y' 
    AND s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID 
    AND s.source_id='MIMB' 
    AND NOT EXISTS (SELECT 1 FROM CMS_STAGE_CASH_DEPOSIT 
            WHERE t.IS_VALID = 'Y' 
            AND DEPOSIT_REFERENCE_NUMBER = t.DEPOSIT_REF_NUMBER 
            AND source_id='MIMB' fetch first row only));--  
      
  CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_MIMB_CO004', 'MIMB', 0);--
    
END@


CREATE PROCEDURE SI_RUN_TEMP_MIMB_PF002
  LANGUAGE SQL
BEGIN
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_PF002', 'MIMB', 1);--
  
  -------------------------------------
  -- Auto Feed Std Code
  -- COMMON_CODE_CATEGORY_ENTRY
  --
  -----------------------------------

  -- FOR cur_std_code AS
    -- SELECT DISTINCT STOCK_EXCHG_TRD_BRD_CODE code, STOCK_EXCHG_TRD_BRD_DESC desc,
         -- STOCK_EXCHG_TRD_BRD_CAT cat, 'MIMB' source_id
      -- FROM SI_TEMP_MIMB_PF002
     -- WHERE LENGTH(STOCK_EXCHG_TRD_BRD_CODE) > 0
       -- AND LENGTH(STOCK_EXCHG_TRD_BRD_DESC) > 0
       -- AND IS_VALID = 'Y'
  -- DO
    -- CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);--
  -- END FOR;--
  
  -- CALL si_log_proc_time('SI_RUN_TEMP_MIMB_PF002', 'MIMB', 2);--
  -- commit;--

  ---------------------------------------------------
  -- Temp Table
  -- Update feed_group_id
  --
  ---------------------------------------------------

  UPDATE SI_TEMP_MIMB_PF002 SET FEED_GROUP_ID = 
    (SELECT G.FEED_GROUP_ID FROM CMS_FEED_GROUP G
       WHERE G.GROUP_TYPE = 'STOCK' 
     AND G.GROUP_SUBTYPE = EXCHANGE_CODE 
     AND G.GROUP_STOCK_TYPE = STOCK_TYPES)
  WHERE IS_VALID = 'Y';--
  
  commit;--

  UPDATE SI_TEMP_MIMB_PF002 SET STAGE_FEED_GROUP_ID = 
    (SELECT T.STAGING_REFERENCE_ID FROM TRANSACTION T, CMS_FEED_GROUP G 
    WHERE T.REFERENCE_ID = G.FEED_GROUP_ID 
    AND T.TRANSACTION_TYPE = 'STOCK_FEED_GROUP'
        AND G.GROUP_TYPE = 'STOCK' 
    AND G.GROUP_SUBTYPE = EXCHANGE_CODE 
    AND G.GROUP_STOCK_TYPE = STOCK_TYPES)
  WHERE IS_VALID = 'Y';--
  
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_PF002', 'MIMB', 3);--
  commit;--

  ---------------------------------------------------
  -- Actual Table
  -- CMS_PRICE_FEED
  --
  ---------------------------------------------------

  UPDATE CMS_PRICE_FEED A set (NAME, EXCHANGE, UNIT_PRICE, CURRENCY, 
    ISIN_CODE, BOARD_TYPE, TYPE, LISTEDSHARE_QUANTITY, PAR_VALUE,
    PAID_UP_CAPITAL, EXPIRY_DATE, SHARE_STATUS, IS_SUSPENDED, DATE_LAUNCHED, LAST_UPDATED_DATE) = 
    (SELECT COUNTER_NAME, EXCHANGE_CODE, UNIT_PRICE, UNIT_PRICE_CURR,
      ISIN_CODE, STOCK_EXCHG_TRD_BRD_CODE,  STOCK_TYPES, LISTED_SHARES_QTY,  PAR_VALUE,
      PAID_UP_CAPITAL, EXPIRY_DATE, SHARE_STATUS, STOCK_EXCHG_SUSP_IND, LAUNCH_DATE, CURRENT_TIMESTAMP    
    FROM SI_TEMP_MIMB_PF002 T 
    WHERE T.IS_VALID = 'Y' 
    AND T.STOCK_CODE = A.STOCK_CODE 
    AND T.EXCHANGE_CODE = A.EXCHANGE)
  WHERE EXISTS (SELECT 1 FROM SI_TEMP_MIMB_PF002 T 
          WHERE T.IS_VALID = 'Y' 
          AND T.STOCK_CODE = A.STOCK_CODE 
          AND T.EXCHANGE_CODE = A.EXCHANGE fetch first row only);--

  commit;--  
    
  INSERT INTO CMS_PRICE_FEED (FEED_ID, TICKER, STOCK_CODE, NAME, EXCHANGE, COUNTRY,
    UNIT_PRICE, CURRENCY, ISIN_CODE, BOARD_TYPE, TYPE, 
    LISTEDSHARE_QUANTITY, PAR_VALUE, PAID_UP_CAPITAL, EXPIRY_DATE, SHARE_STATUS, 
    IS_SUSPENDED, FEED_REF, FEED_GROUP_ID, DATE_LAUNCHED, LAST_UPDATED_DATE, CMS_VERSION_TIME, OFFER)
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_PRICE_FEED_SEQ), 2)) as BIGINT),
      STOCK_CODE, STOCK_CODE, COUNTER_NAME, EXCHANGE_CODE, 
      (SELECT COUNTRY FROM COMMON_CODE_CATEGORY_ENTRY WHERE CATEGORY_CODE = 'STOCK_EXCHANGE' AND ENTRY_CODE = EXCHANGE_CODE) AS COUNTRY,
      UNIT_PRICE, UNIT_PRICE_CURR, ISIN_CODE, STOCK_EXCHG_TRD_BRD_CODE, STOCK_TYPES, 
      LISTED_SHARES_QTY, PAR_VALUE, PAID_UP_CAPITAL, EXPIRY_DATE, SHARE_STATUS,  
      STOCK_EXCHG_SUSP_IND,
      CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_PRICE_FEED_SEQ), 2)) as BIGINT), 
      T.FEED_GROUP_ID, LAUNCH_DATE, CURRENT_TIMESTAMP, 0, 0
    FROM SI_TEMP_MIMB_PF002 T
    WHERE T.IS_VALID = 'Y' 
    AND NOT EXISTS (SELECT 1 FROM CMS_PRICE_FEED A 
            WHERE T.IS_VALID = 'Y' 
            AND T.STOCK_CODE = A.STOCK_CODE 
            AND T.EXCHANGE_CODE = A.EXCHANGE fetch first row only));--
            
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_PF002', 'MIMB', 4);--
  commit;--            

  ---------------------------------------------------
  -- Staging Table
  -- CMS_STAGE_PRICE_FEED
  ---------------------------------------------------
  
  UPDATE CMS_STAGE_PRICE_FEED A set (NAME, EXCHANGE, UNIT_PRICE, CURRENCY, 
    ISIN_CODE, BOARD_TYPE, TYPE, PAR_VALUE,
    PAID_UP_CAPITAL, EXPIRY_DATE, SHARE_STATUS, IS_SUSPENDED, DATE_LAUNCHED, LAST_UPDATED_DATE) = 
    (SELECT COUNTER_NAME, EXCHANGE_CODE, UNIT_PRICE, UNIT_PRICE_CURR,
      ISIN_CODE, STOCK_EXCHG_TRD_BRD_CODE,  STOCK_TYPES, PAR_VALUE,
      PAID_UP_CAPITAL, EXPIRY_DATE, SHARE_STATUS, STOCK_EXCHG_SUSP_IND, LAUNCH_DATE, CURRENT_TIMESTAMP    
    FROM SI_TEMP_MIMB_PF002 T 
    WHERE T.IS_VALID = 'Y' 
    AND T.STOCK_CODE = A.TICKER 
    AND T.EXCHANGE_CODE = A.EXCHANGE)
  WHERE EXISTS (SELECT 1 FROM SI_TEMP_MIMB_PF002 T 
          WHERE T.IS_VALID = 'Y' 
          AND T.STOCK_CODE = A.TICKER 
          AND T.EXCHANGE_CODE = A.EXCHANGE fetch first row only);--

  commit;--

  INSERT INTO CMS_STAGE_PRICE_FEED (FEED_ID, TICKER, NAME, EXCHANGE,
    UNIT_PRICE, CURRENCY, ISIN_CODE, BOARD_TYPE, TYPE, 
    PAR_VALUE, PAID_UP_CAPITAL, EXPIRY_DATE, SHARE_STATUS, 
    IS_SUSPENDED, FEED_REF, FEED_GROUP_ID, DATE_LAUNCHED, LAST_UPDATED_DATE, CMS_VERSION_TIME, OFFER)
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_PRICE_FEED_SEQ), 2)) as BIGINT),
      STOCK_CODE, COUNTER_NAME, EXCHANGE_CODE, 
      UNIT_PRICE, UNIT_PRICE_CURR, ISIN_CODE, STOCK_EXCHG_TRD_BRD_CODE, STOCK_TYPES, 
      PAR_VALUE, PAID_UP_CAPITAL, EXPIRY_DATE, SHARE_STATUS,  
      STOCK_EXCHG_SUSP_IND,
      CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_PRICE_FEED_SEQ), 2)) as BIGINT), 
      T.FEED_GROUP_ID, LAUNCH_DATE, CURRENT_TIMESTAMP, 0, 0
    FROM SI_TEMP_MIMB_PF002 T
    WHERE T.IS_VALID = 'Y' 
    AND NOT EXISTS (SELECT 1 FROM CMS_STAGE_PRICE_FEED A 
            WHERE T.IS_VALID = 'Y' 
            AND T.STOCK_CODE = A.TICKER 
            AND T.EXCHANGE_CODE = A.EXCHANGE fetch first row only));--
            
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_PF002', 'MIMB', 5);--
  commit;--    
  
  ---------------------------------------------------
  -- History Table
  -- CMS_PRICE_FEED_HISTORY
  ---------------------------------------------------

  INSERT INTO CMS_PRICE_FEED_HISTORY (HISTORY_ID, NAME, EXCHANGE, UNIT_PRICE, CURRENCY, 
    ISIN_CODE, BOARD_TYPE, TYPE, LISTEDSHARE_QUANTITY, PAR_VALUE, 
    PAID_UP_CAPITAL, EXPIRY_DATE, SHARE_STATUS, IS_SUSPENDED, FEED_REF, 
    FEED_GROUP_ID, DATE_LAUNCHED, LAST_UPDATED_DATE)
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_PRICE_FEED_HISTORY_SEQ), 2)) as BIGINT),
      NAME, EXCHANGE, UNIT_PRICE, CURRENCY, 
      ISIN_CODE, BOARD_TYPE, TYPE, LISTEDSHARE_QUANTITY, PAR_VALUE, 
      PAID_UP_CAPITAL, EXPIRY_DATE, SHARE_STATUS,  IS_SUSPENDED, FEED_REF, 
      FEED_GROUP_ID, DATE_LAUNCHED, CURRENT_TIMESTAMP
    FROM CMS_PRICE_FEED
    WHERE EXISTS (SELECT 1 FROM CMS_PRICE_FEED A, SI_TEMP_MIMB_PF002 T 
            WHERE T.IS_VALID = 'Y' 
            AND T.STOCK_CODE = A.STOCK_CODE
            AND T.EXCHANGE_CODE = A.EXCHANGE fetch first row only));--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_PF002', 'MIMB', 6);--
  commit;--

  ---------------------------------------------------
  -- Actual Table
  -- CMS_CREDIT_RISK_PARAM
  ---------------------------------------------------

  UPDATE CMS_CREDIT_RISK_PARAM A SET (IS_INT_SUSPEND, VERSION_TIME, BOARD_TYPE, SHARE_STATUS, PREV_SHARE_STATUS, 
  		PARAM_TYPE, is_acceptable, unacceptable_date)=
    (SELECT IS_SUSPENDED, CMS_VERSION_TIME, BOARD_TYPE, SHARE_STATUS, A.SHARE_STATUS, TYPE,
    	case when share_status = '1' then 'Y' else 'N' end,
    	case when a.share_status = '1' and share_status <> '1' then current timestamp else a.unacceptable_date end
    FROM CMS_PRICE_FEED
    WHERE A.FEED_ID = FEED_ID fetch first row only)
  WHERE EXISTS (SELECT 1 FROM CMS_PRICE_FEED R, SI_TEMP_MIMB_PF002 T 
          WHERE T.IS_VALID = 'Y' 
          AND T.STOCK_CODE = R.STOCK_CODE 
          AND T.EXCHANGE_CODE = R.EXCHANGE fetch first row only)
  AND EXISTS (SELECT 1 FROM CMS_CREDIT_RISK_PARAM A, CMS_PRICE_FEED R 
        WHERE A.FEED_ID = R.FEED_ID fetch first row only);--
  
  commit;--
  
  INSERT INTO CMS_CREDIT_RISK_PARAM (PARAM_ID, IS_INT_SUSPEND, FEED_ID, PARAM_REF, VERSION_TIME, BOARD_TYPE, SHARE_STATUS, 
  		PARAM_TYPE, is_acceptable, unacceptable_date)
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_CREDIT_RISK_PARAM_SEQ), 2)) as BIGINT),
      IS_SUSPENDED, FEED_ID, CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_CREDIT_RISK_PARAM_SEQ), 2)) as BIGINT),
      CMS_VERSION_TIME, BOARD_TYPE, SHARE_STATUS, TYPE,
      case when share_status = '1' then 'Y' else 'N' end,
      case when share_status <> '1' then current timestamp else null end
    FROM CMS_PRICE_FEED R
    WHERE EXISTS (SELECT 1 FROM CMS_PRICE_FEED R, SI_TEMP_MIMB_PF002 T 
            WHERE T.IS_VALID = 'Y' 
            AND T.STOCK_CODE = R.STOCK_CODE 
            AND T.EXCHANGE_CODE = R.EXCHANGE fetch first row only)
    AND NOT EXISTS (SELECT 1 FROM CMS_CREDIT_RISK_PARAM A
            WHERE A.FEED_ID = R.FEED_ID fetch first row only));--
  
  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_PF002', 'MIMB', 7);--
  commit;--

  ---------------------------------------------------
  -- Staging Table
  -- CMS_STAGE_CREDIT_RISK_PARAM
  ---------------------------------------------------
  
  UPDATE CMS_STAGE_CREDIT_RISK_PARAM A SET (IS_INT_SUSPEND, VERSION_TIME, BOARD_TYPE, SHARE_STATUS, PREV_SHARE_STATUS, 
  		PARAM_TYPE, is_acceptable, unacceptable_date)=
    (SELECT IS_SUSPENDED, CMS_VERSION_TIME, BOARD_TYPE, SHARE_STATUS, A.SHARE_STATUS, TYPE,
	    case when share_status = '1' then 'Y' else 'N' end,
    	case when a.share_status = '1' and share_status <> '1' then current timestamp else a.unacceptable_date end    
    FROM CMS_STAGE_PRICE_FEED
    WHERE A.FEED_ID = FEED_ID fetch first row only)
  WHERE EXISTS (SELECT 1 FROM CMS_STAGE_PRICE_FEED R, SI_TEMP_MIMB_PF002 T 
          WHERE T.IS_VALID = 'Y' 
          AND T.STOCK_CODE = R.TICKER 
          AND T.EXCHANGE_CODE = R.EXCHANGE fetch first row only)
  AND EXISTS (SELECT 1 FROM CMS_CREDIT_RISK_PARAM A, CMS_STAGE_PRICE_FEED R 
        WHERE A.FEED_ID = R.FEED_ID fetch first row only);--
  
  commit;--
  
  INSERT INTO CMS_STAGE_CREDIT_RISK_PARAM (PARAM_ID, IS_INT_SUSPEND, FEED_ID, PARAM_REF, VERSION_TIME, BOARD_TYPE, SHARE_STATUS, 
  		PARAM_TYPE, is_acceptable, unacceptable_date)
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_CREDIT_RISK_PARAM_SEQ), 2)) as BIGINT),
      IS_SUSPENDED, FEED_ID, CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_CREDIT_RISK_PARAM_SEQ), 2)) as BIGINT),
      CMS_VERSION_TIME, BOARD_TYPE, SHARE_STATUS, TYPE,
      case when share_status = '1' then 'Y' else 'N' end,
      case when share_status <> '1' then current timestamp else null end
    FROM CMS_STAGE_PRICE_FEED R
    WHERE EXISTS (SELECT 1 FROM CMS_STAGE_PRICE_FEED R, SI_TEMP_MIMB_PF002 T 
            WHERE T.IS_VALID = 'Y' 
            AND T.STOCK_CODE = R.TICKER 
            AND T.EXCHANGE_CODE = R.EXCHANGE fetch first row only)
    AND NOT EXISTS (SELECT 1 FROM CMS_STAGE_CREDIT_RISK_PARAM A
            WHERE A.FEED_ID = R.FEED_ID fetch first row only));--

  CALL si_log_proc_time('SI_RUN_TEMP_MIMB_PF002', 'MIMB', 0);--

END@

commit work@
