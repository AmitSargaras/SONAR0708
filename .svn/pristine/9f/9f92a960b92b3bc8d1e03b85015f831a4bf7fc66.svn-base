--SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,ABCLIMS@
DROP PROCEDURE SI_RUN_TEMP_BOST_CU005@
DROP PROCEDURE SI_RUN_TEMP_BOST_CA001@
DROP PROCEDURE SI_RUN_TEMP_BOST_CA015@
DROP PROCEDURE SI_RUN_TEMP_BOST_CO022@
DROP PROCEDURE SI_RUN_TEMP_BOST_CO023@
DROP PROCEDURE SI_RUN_TEMP_BOST_CO025@
DROP PROCEDURE SI_RUN_TEMP_BOST_SH001@
DROP PROCEDURE SI_RUN_TEMP_BOST_PLEDGOR@
DROP PROCEDURE SI_RUN_ALL_BOST@

CREATE PROCEDURE SI_RUN_TEMP_BOST_CU005
	LANGUAGE SQL
BEGIN
  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CU005', 'BOST', 1);

	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------
	
	FOR cur_std_code AS
		SELECT DISTINCT CUST_CLASS_CODE code, CUST_CLASS_DESC desc,
				CUST_CLASS_CAT cat, 'BOST' source_id
			FROM SI_TEMP_BOST_CU005
			WHERE LENGTH(CUST_CLASS_CODE) > 0
				AND LENGTH(CUST_CLASS_DESC) > 0
				AND IS_VALID = 'Y'
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);--
	END FOR;--
	

	-------------------------------------
	-- Actual Table
	-- SCI_LE_MAIN_PROFILE
	--
	-------------------------------------

	UPDATE sci_le_main_profile a SET 
    (LMP_LE_ID, 
      LMP_LONG_NAME, 
      LMP_SHORT_NAME, 
      LMP_LEGAL_CONST_NUM, 
			LMP_LEGAL_CONST_VALUE, 
      LMP_INC_CNTRY_ISO_CODE, 
      LMP_ID_TYPE_NUM, 
      LMP_ID_TYPE_VALUE, 
      --LMP_INC_NUM_TEXT,
      LMP_ID_NUMBER,
			LMP_INC_DATE, 
      LMP_SECOND_ID_TYPE_NUM, 
      LMP_SECOND_ID_TYPE_VALUE, 
      --LMP_ID_OLD_NUM,
      LMP_SECOND_ID_NUMBER,
      LMP_TYPE_NUM,
      LMP_TYPE_VALUE, 
			LMP_REL_START_DATE, 
      LMP_SGMNT_CODE_NUM, 
      LMP_SGMNT_CODE_VALUE, 
      LMP_LE_ID_SRC_NUM,
      LMP_LE_ID_SRC_VALUE,
      source_id,
			UPDATE_STATUS_IND) = 
		(SELECT CIF_ID, 
      CUST_NAME_LONG, 
      CUST_NAME_SHORT, 
      CUST_CLASS_CAT, 
      CUST_CLASS_CODE, 
      ID_ISSUE_COUNTRY, 
			ID_TYPE_CAT,
      ID_TYPE_CODE, 
      ID_NUMBER, 
      ID_ISSUE_DATE, 
      SECONDARY_ID_TYPE_CAT, 
      SECONDARY_ID_TYPE_CODE,
			SECONDARY_ID_NUMBER, 
			'8' CUST_TYPE_CAT,
      CUST_TYPE, 
      CUST_START_DATE, 
      CUST_SEGMENT_CAT, 
      CUST_SEGMENT_CODE, 
      'BOST',
      'BOST',
      'BOST', UPDATE_STAT_IND
			FROM SI_TEMP_BOST_CU005 t
			WHERE t.cif_id = a.lmp_le_id AND t.IS_VALID = 'Y'
			FETCH FIRST 1 ROW ONLY)
		WHERE EXISTS (SELECT '1' FROM SI_TEMP_BOST_CU005 WHERE cif_id = a.lmp_le_id) AND source_id = 'BOST';--
	
	INSERT INTO sci_le_main_profile 
    (cms_le_main_profile_id, 
      LMP_LE_ID, 
      LMP_LONG_NAME, 
      LMP_SHORT_NAME, 
      LMP_LEGAL_CONST_NUM, 
			LMP_LEGAL_CONST_VALUE, 
      LMP_INC_CNTRY_ISO_CODE, 
      LMP_ID_TYPE_NUM, 
      LMP_ID_TYPE_VALUE, 
      --LMP_INC_NUM_TEXT,
      LMP_ID_NUMBER,
			LMP_INC_DATE, 
      LMP_SECOND_ID_TYPE_NUM, 
      LMP_SECOND_ID_TYPE_VALUE, 
      --LMP_ID_OLD_NUM,
      LMP_SECOND_ID_NUMBER,
      LMP_TYPE_NUM,
      LMP_TYPE_VALUE, 
			LMP_REL_START_DATE, 
      LMP_SGMNT_CODE_NUM, 
      LMP_SGMNT_CODE_VALUE, 
      LMP_LE_ID_SRC_NUM,
      LMP_LE_ID_SRC_VALUE,
      source_id,
			UPDATE_STATUS_IND)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR legal_entity_seq), 2)) as BIGINT), 
			CIF_ID, 
      CUST_NAME_LONG, 
      CUST_NAME_SHORT, 
      CUST_CLASS_CAT, 
      CUST_CLASS_CODE, 
      ID_ISSUE_COUNTRY, 
			ID_TYPE_CAT, 
      ID_TYPE_CODE, 
      ID_NUMBER, 
      ID_ISSUE_DATE, 
      SECONDARY_ID_TYPE_CAT, 
      SECONDARY_ID_TYPE_CODE,
			SECONDARY_ID_NUMBER, 
			'8' CUST_TYPE_CAT,
      CUST_TYPE, 
      CUST_START_DATE, 
      CUST_SEGMENT_CAT, 
      CUST_SEGMENT_CODE, 
      'BOST',
      'BOST',
      'BOST', 'I'
	  	FROM SI_TEMP_BOST_CU005 t 
			WHERE t.IS_VALID = 'Y' AND NOT EXISTS (SELECT '1' FROM sci_le_main_profile WHERE lmp_le_id = t.cif_id AND source_id = 'BOST'));--

  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CU005', 'BOST', 2);
  COMMIT;
  
	-------------------------------------
	-- Actual Table
	-- SCI_LE_SUB_PROFILE
	--
	-------------------------------------
	  
	UPDATE sci_le_sub_profile a SET 
    (
      LSP_ID, 
      LSP_LE_ID, 
      LSP_SHORT_NAME, 
      LSP_DMCL_CNTRY_ISO_CODE, 
      CMS_LE_MAIN_PROFILE_ID,
      CMS_SUB_ORIG_COUNTRY,
			UPDATE_STATUS_IND) =
	(SELECT 
      1, 
      LMP_LE_ID, 
      LMP_SHORT_NAME, 
      LMP_INC_CNTRY_ISO_CODE, 
      CMS_LE_MAIN_PROFILE_ID,
      'MY', UPDATE_STATUS_IND
	   FROM sci_le_main_profile t
	  WHERE t.cms_le_main_profile_id = a.cms_le_main_profile_id
	    AND source_id = 'BOST'
	  FETCH FIRST 1 ROW ONLY)
	  WHERE EXISTS (SELECT '1' FROM SI_TEMP_BOST_CU005 WHERE cif_id = a.lsp_le_id AND IS_VALID = 'Y')
	    AND cms_le_main_profile_id IN (SELECT cms_le_main_profile_id 
	    								 FROM sci_le_main_profile, SI_TEMP_BOST_CU005 
	    							    WHERE cif_id = lmp_le_id AND IS_VALID = 'Y'
	    							      AND source_id = 'BOST');--
	  
	INSERT INTO sci_le_sub_profile (cms_le_sub_profile_id, lsp_id, lsp_le_id, lsp_short_name, lsp_dmcl_cntry_iso_code, 
									cms_le_main_profile_id, CMS_SUB_ORIG_COUNTRY, UPDATE_STATUS_IND)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR customer_seq), 2)) as BIGINT),
			1, lmp_le_id, lmp_short_name, lmp_inc_cntry_iso_code, cms_le_main_profile_id, 'MY', 'I'
	   FROM sci_le_main_profile t
	  WHERE NOT EXISTS (SELECT '1' FROM sci_le_sub_profile WHERE lsp_le_id = t.lmp_le_id)
	    AND source_id = 'BOST');--

  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CU005', 'BOST', 3);
  COMMIT;
	  
	-------------------------------------
	-- Actual Table
	-- SCI_LE_REG_ADDR
	--
	-------------------------------------
	
	UPDATE SCI_LE_REG_ADDR b SET 
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
			a.cms_le_main_profile_id, UPDATE_STAT_IND
		FROM SI_TEMP_BOST_CU005 t, SCI_LE_MAIN_PROFILE a 
			where a.CMS_LE_MAIN_PROFILE_ID = b.CMS_LE_MAIN_PROFILE_ID 
			-- WLS: only update when address type code is not empty
			and length(t.PRIMARY_ADD_TYPE_CODE)>0
			and a.SOURCE_ID='BOST' 
			and a.LMP_LE_ID=t.CIF_ID 
			and t.PRIMARY_ADD_TYPE_CODE = b.LRA_TYPE_VALUE 
			AND t.is_valid = 'Y'
			FETCH FIRST 1 ROW ONLY)
		WHERE EXISTS (select 1 
								from SI_TEMP_BOST_CU005 t, SCI_LE_MAIN_PROFILE a 
								where a.CMS_LE_MAIN_PROFILE_ID = b.CMS_LE_MAIN_PROFILE_ID
								-- WLS: only update when address type code is not empty
								and length(t.PRIMARY_ADD_TYPE_CODE)>0
								and a.SOURCE_ID='BOST' 
								and a.LMP_LE_ID=t.CIF_ID 
								and t.PRIMARY_ADD_TYPE_CODE = b.LRA_TYPE_VALUE
								AND t.is_valid = 'Y');--
	  
	INSERT INTO SCI_LE_REG_ADDR 
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
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR contact_seq), 2)) as BIGINT),
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
			a.CMS_LE_MAIN_PROFILE_ID, 'I'
		FROM SI_TEMP_BOST_CU005 t, sci_le_main_profile a
		WHERE a.lmp_le_id = t.cif_id
		-- WLS: only insert when address type code is not empty
		and length(t.PRIMARY_ADD_TYPE_CODE)>0
		and a.source_id = 'BOST'
		and NOT EXISTS 
			(SELECT 1 FROM SCI_LE_REG_ADDR b
				WHERE b.CMS_LE_MAIN_PROFILE_ID = a.CMS_LE_MAIN_PROFILE_ID
				and t.PRIMARY_ADD_TYPE_CODE=b.LRA_TYPE_VALUE) 
		AND is_valid = 'Y');--

  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CU005', 'BOST', 0);
	COMMIT;
END@

CREATE PROCEDURE SI_RUN_TEMP_BOST_CA001
	LANGUAGE SQL
BEGIN
  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CA001', 'BOST', 1);

	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT ori_loc_org_code code, ori_loc_org_desc desc,
			   ori_loc_org_cat cat, 'BOST' source_id
		  FROM si_temp_bost_ca001
		 WHERE LENGTH(ori_loc_org_code) > 0
		   AND LENGTH(ori_loc_org_desc) > 0
			 AND IS_VALID = 'Y'
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);--
	END FOR;--

	-------------------------------------
	-- Actual Table
	-- SCI_LSP_LMT_PROFILE
	--
	-------------------------------------

	UPDATE sci_lsp_lmt_profile a SET (UPDATE_STATUS_IND, llp_le_id, cif_source_id, llp_lsp_id, llp_bca_ref_num,
									cms_bca_joint_ind, llp_bca_ref_appr_date, cms_orig_country, cms_orig_organisation, 
									llp_next_annl_rvw_date, cms_bca_status, cms_bca_create_date, cms_customer_id) =
	(SELECT 'U', cif_id, cif_source, 1, aa_number, joint_borrower_ind, aa_approved_date, ori_loc_country, ori_loc_org_code,
			annual_review_date, aa_stat, aa_create_date, (SELECT cms_le_sub_profile_id 
															FROM sci_le_sub_profile sp, sci_le_main_profile mp
														   WHERE lmp_le_id = t.cif_id
														     AND sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
														     AND mp.source_id = 'BOST'
														   FETCH FIRST 1 ROW ONLY)
	   FROM si_temp_bost_ca001 t
	  WHERE t.aa_number = a.llp_bca_ref_num and t.IS_VALID = 'Y'
	  FETCH FIRST 1 ROW ONLY)
	  WHERE EXISTS (SELECT '1' FROM si_temp_bost_ca001 
	  				 WHERE llp_bca_ref_num = aa_number and IS_VALID = 'Y')
	  	AND source_id = 'BOST';--

	INSERT INTO sci_lsp_lmt_profile (UPDATE_STATUS_IND, cms_lsp_lmt_profile_id, llp_le_id, cif_source_id, llp_lsp_id, llp_bca_ref_num, 
									cms_bca_joint_ind, llp_bca_ref_appr_date, cms_orig_country, cms_orig_organisation, 
									llp_next_annl_rvw_date, cms_bca_status, cms_bca_create_date, cms_customer_id,
									lmt_profile_type, source_id)
	(SELECT 'I',  CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_profile_seq), 2)) as BIGINT),
			cif_id, cif_source, 1, aa_number, joint_borrower_ind, aa_approved_date, ori_loc_country, ori_loc_org_code,
			annual_review_date, aa_stat, aa_create_date, (SELECT cms_le_sub_profile_id FROM sci_le_sub_profile
														   WHERE lsp_le_id = t.cif_id
														   FETCH FIRST 1 ROW ONLY),
			'BANKING', 'BOST'
	   FROM si_temp_bost_ca001 t
	  WHERE t.IS_VALID = 'Y' AND NOT EXISTS (SELECT '1' FROM sci_lsp_lmt_profile 
	  					 WHERE llp_bca_ref_num = t.aa_number
	  					   AND source_id = 'BOST'));--

  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CA001', 'BOST', 2);
  COMMIT;
  	  
	-------------------------------------
	-- Staging Table
	-- STAGE_LIMIT_PROFILE
	--
	-------------------------------------
	  
	UPDATE stage_limit_profile s SET (UPDATE_STATUS_IND, llp_le_id, cif_source_id, llp_lsp_id, llp_bca_ref_num, 
									cms_bca_joint_ind, llp_bca_ref_appr_date, cms_orig_country, cms_orig_organisation, 
									llp_next_annl_rvw_date, cms_bca_status, cms_bca_create_date, cms_customer_id) =
	(SELECT 'U', cif_id, cif_source, 1, aa_number, joint_borrower_ind, aa_approved_date, ori_loc_country, ori_loc_org_code,
			annual_review_date, aa_stat, aa_create_date, (SELECT cms_le_sub_profile_id FROM sci_le_sub_profile
														   WHERE lsp_le_id = t.cif_id
														   FETCH FIRST 1 ROW ONLY)
	   FROM si_temp_bost_ca001 t
	  WHERE t.aa_number = s.llp_bca_ref_num and t.IS_VALID = 'Y'
	  FETCH FIRST 1 ROW ONLY)
	  WHERE cms_lsp_lmt_profile_id IN (SELECT staging_reference_id
										 FROM transaction
										WHERE transaction_type = 'LIMITPROFILE'
										  AND reference_id IN (SELECT cms_lsp_lmt_profile_id 
										  						 FROM sci_lsp_lmt_profile a, 
										  						 	  si_temp_bost_ca001
										   						WHERE a.llp_bca_ref_num = aa_number
																		AND IS_VALID = 'Y'
										   						  AND a.llp_le_id = cif_id
										   						  AND a.source_id = 'BOST'));--
	  
	INSERT INTO stage_limit_profile (UPDATE_STATUS_IND, cms_lsp_lmt_profile_id, llp_le_id, cif_source_id, llp_lsp_id, llp_bca_ref_num, 
									cms_bca_joint_ind, llp_bca_ref_appr_date, cms_orig_country, cms_orig_organisation, 
									llp_next_annl_rvw_date, cms_bca_status, cms_bca_create_date, cms_customer_id,
									lmt_profile_type, source_id)
	(SELECT 'I', CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_profile_seq), 2)) as BIGINT),
			cif_id, cif_source, 1, aa_number, joint_borrower_ind, aa_approved_date, ori_loc_country, ori_loc_org_code,
			annual_review_date, aa_stat, aa_create_date, (SELECT cms_le_sub_profile_id FROM sci_le_sub_profile
														   WHERE lsp_le_id = t.cif_id
														   FETCH FIRST 1 ROW ONLY), 'BANKING', 'BOST'
	   FROM si_temp_bost_ca001 t
	  WHERE t.IS_VALID = 'Y' AND NOT EXISTS (SELECT '1' FROM stage_limit_profile 
	  					 WHERE llp_bca_ref_num = t.aa_number
	  					   AND source_id = 'BOST'));--

CALL si_log_proc_time('SI_RUN_TEMP_BOST_CA001', 'BOST', 0); 
COMMIT;
END@

CREATE PROCEDURE SI_RUN_TEMP_BOST_CA015
	LANGUAGE SQL
BEGIN
  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CA015', 'BOST', 1);

	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------
	
	FOR cur_std_prod_type_code AS
		SELECT DISTINCT product_type_code code, product_type_desc desc,
			   'BOST' source_id
		  FROM SI_TEMP_BOST_CA015
		 WHERE LENGTH(product_type_code) > 0
		   AND LENGTH(product_type_desc) > 0
	DO
		CALL SI_AUTO_UPDATE_NEW_PRODUCT_TYPE(cur_std_prod_type_code.code, cur_std_prod_type_code.desc, cur_std_prod_type_code.source_id);
	END FOR;

	FOR cur_std_code AS
		SELECT DISTINCT ORG_LOC_ORG_CODE code, ORG_LOC_ORG_DESC desc,
			   ORG_LOC_ORG_CAT cat, 'BOST' source_id
		  FROM SI_TEMP_BOST_CA015
		 WHERE LENGTH(ORG_LOC_ORG_CODE) > 0
		   AND LENGTH(ORG_LOC_ORG_DESC) > 0
			 AND IS_VALID = 'Y'
		 UNION
		SELECT DISTINCT PRODUCT_TYPE_CODE code, PRODUCT_TYPE_DESC desc,
			   PRODUCT_TYPE_CAT cat, 'BOST' source_id
		  FROM SI_TEMP_BOST_CA015
		 WHERE LENGTH(PRODUCT_TYPE_CODE) > 0
		   AND LENGTH(PRODUCT_TYPE_DESC) > 0
			 AND IS_VALID = 'Y'
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);--
	END FOR;--

	-------------------------------------
	-- Actual Table
	-- SCI_LSP_APPR_LMTS
	--
	-------------------------------------
		
--	UPDATE SCI_LSP_APPR_LMTS L SET L.CMS_LIMIT_STATUS = 'DELETED', L.UPDATE_STATUS_IND = 'D'
--	WHERE L.SOURCE_ID = 'BOST'
--		AND EXISTS (SELECT 1 FROM SCI_LE_SUB_PROFILE SP, SCI_LE_MAIN_PROFILE MP 
--			WHERE L.LMT_LE_ID = SP.LSP_LE_ID AND SP.UPDATE_STATUS_IND = 'D'
--				AND L.LMT_LE_ID = MP.LMP_LE_ID AND MP.UPDATE_STATUS_IND = 'D'
--				AND SP.CMS_LE_MAIN_PROFILE_ID = MP.CMS_LE_MAIN_PROFILE_ID AND MP.SOURCE_ID = 'BOST');

	UPDATE SCI_LSP_APPR_LMTS L SET L.CMS_LIMIT_STATUS = 'DELETED' --, L.UPDATE_STATUS_IND = 'D'
	WHERE L.SOURCE_ID = 'BOST'
		AND NOT EXISTS (SELECT 1 FROM SI_TEMP_BOST_CA015 T WHERE T.LIMIT_ID = L.LMT_ID AND T.IS_VALID = 'Y');
	
	UPDATE sci_lsp_appr_lmts a SET (
			LMT_LE_ID, 
      LMT_BCA_REF_NUM, 
      LMT_ID, 
      LMT_EXPRY_DATE, 
      CMS_BKG_COUNTRY, 
      CMS_BKG_ORGANISATION, 
      LMT_PRD_TYPE_NUM,
			LMT_PRD_TYPE_VALUE, 
      LMT_CRRNCY_ISO_CODE, 
      LMT_AMT, 
      LMT_INTRST_MARGIN, 
      AVAILABLE_LMT, 
      CMS_OUTSTANDING_AMT,
			cms_limit_profile_id,
      source_id,
			LMT_LOAN_SECTOR_NUM,
			LMT_LOAN_SECTOR_VALUE,
			DISBURSED_IND,
      UPDATE_STATUS_IND
	)=
	(SELECT 
			CIF_ID, AA_NUMBER, LIMIT_ID, EXPIRY_DATE, ORI_LOC_COUNTRY, ORG_LOC_ORG_CODE, PRODUCT_TYPE_CAT, 
			PRODUCT_TYPE_CODE, LIMIT_CURRENCY, LIMIT_AMT, CAST(INTEREST_MARGIN AS CHAR), AVAILABLE_LIMIT, cast(OUTSTANDING_AMT_SIGN||char(OUTSTANDING_AMT) as decimal(17,2))OUTSTANDING_AMT,
			(SELECT cms_lsp_lmt_profile_id FROM sci_lsp_lmt_profile	WHERE llp_bca_ref_num = t.AA_NUMBER	AND source_id = 'BOST' FETCH FIRST 1 ROW ONLY),
			'BOST', '17', LOAN_SECTOR_CODE, DISBURSED_IND, 'U'
		FROM SI_TEMP_BOST_CA015 t, sci_lsp_lmt_profile pf
		WHERE t.limit_id = a.lmt_id 
		AND t.is_valid = 'Y'
		and a.source_id = 'BOST'
		AND a.cms_limit_profile_id = pf.cms_lsp_lmt_profile_id
		and pf.llp_bca_ref_num = t.aa_number
		and pf.source_id = 'BOST'
  FETCH FIRST 1 ROW ONLY)
  WHERE EXISTS (SELECT '1' from SI_TEMP_BOST_CA015 t
  	WHERE t.limit_id = a.lmt_id AND t.is_valid = 'Y'
    	AND cms_limit_profile_id = (SELECT cms_lsp_lmt_profile_id FROM sci_lsp_lmt_profile
		  	WHERE llp_bca_ref_num = t.aa_number
		  	AND source_id = 'BOST')) 
		and source_id = 'BOST';
				
	insert into sci_lsp_appr_lmts (
			CMS_LSP_APPR_LMTS_ID,
			LMT_LE_ID, LMT_BCA_REF_NUM, LMT_ID, LMT_EXPRY_DATE, CMS_BKG_COUNTRY, CMS_BKG_ORGANISATION, LMT_PRD_TYPE_NUM,
			LMT_PRD_TYPE_VALUE, LMT_TYPE_NUM, LMT_TYPE_VALUE,
			LMT_CRRNCY_ISO_CODE, LMT_AMT, LMT_INTRST_MARGIN, AVAILABLE_LMT, CMS_OUTSTANDING_AMT,
			cms_limit_profile_id, cms_limit_status, source_id, CMS_REF_ID, LMT_LOAN_SECTOR_NUM, LMT_LOAN_SECTOR_VALUE,
			DISBURSED_IND, UPDATE_STATUS_IND
	)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT),
			CIF_ID, AA_NUMBER, LIMIT_ID, EXPIRY_DATE, ORI_LOC_COUNTRY, ORG_LOC_ORG_CODE, PRODUCT_TYPE_CAT, 
			PRODUCT_TYPE_CODE, '25', 'OUTER',
			LIMIT_CURRENCY, LIMIT_AMT, CAST(INTEREST_MARGIN AS CHAR), AVAILABLE_LIMIT,
			cast(OUTSTANDING_AMT_SIGN||char(OUTSTANDING_AMT) as decimal(17,2)) OUTSTANDING_AMT,
			(SELECT cms_lsp_lmt_profile_id FROM sci_lsp_lmt_profile
						WHERE llp_bca_ref_num = t.AA_NUMBER AND t.IS_VALID = 'Y'
							AND source_id = 'BOST'
						FETCH FIRST 1 ROW ONLY),
			'ACTIVE',
			'BOST', CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT), 
			'17', LOAN_SECTOR_CODE, DISBURSED_IND, 'I'
		FROM SI_TEMP_BOST_CA015 t
		WHERE NOT EXISTS (SELECT '1' FROM sci_lsp_appr_lmts
	  					 WHERE lmt_id = t.limit_id
							 and source_id = 'BOST')
		AND t.is_valid = 'Y');--

  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CA015', 'BOST', 2);
  COMMIT;
  		
	-------------------------------------
	-- Staging Table
	-- STAGE_LIMIT
	--
	-------------------------------------
	
	UPDATE STAGE_LIMIT L SET L.CMS_LIMIT_STATUS = 'DELETED' --, L.UPDATE_STATUS_IND = 'D'
	WHERE L.SOURCE_ID = 'BOST'
		AND NOT EXISTS (SELECT 1 FROM SI_TEMP_BOST_CA015 T WHERE T.LIMIT_ID = L.LMT_ID AND T.IS_VALID = 'Y');

	UPDATE stage_limit s SET (
			LMT_LE_ID, LMT_BCA_REF_NUM, LMT_ID, LMT_EXPRY_DATE, CMS_BKG_COUNTRY, CMS_BKG_ORGANISATION, LMT_PRD_TYPE_NUM,
			LMT_PRD_TYPE_VALUE, LMT_CRRNCY_ISO_CODE, LMT_AMT, LMT_INTRST_MARGIN, AVAILABLE_LMT, CMS_OUTSTANDING_AMT,
			cms_limit_profile_id,source_id, LMT_LOAN_SECTOR_NUM, LMT_LOAN_SECTOR_VALUE, DISBURSED_IND, UPDATE_STATUS_IND
	)=
	(SELECT 
			CIF_ID, AA_NUMBER, LIMIT_ID, EXPIRY_DATE, ORI_LOC_COUNTRY, ORG_LOC_ORG_CODE, PRODUCT_TYPE_CAT, 
			PRODUCT_TYPE_CODE, LIMIT_CURRENCY, LIMIT_AMT, CAST(INTEREST_MARGIN AS CHAR), AVAILABLE_LIMIT, cast(OUTSTANDING_AMT_SIGN||char(OUTSTANDING_AMT) as decimal(17,2))OUTSTANDING_AMT,
			(SELECT cms_lsp_lmt_profile_id FROM sci_lsp_lmt_profile
						WHERE llp_bca_ref_num = t.AA_NUMBER AND t.IS_VALID = 'Y'
							AND source_id = 'BOST'
						FETCH FIRST 1 ROW ONLY),
			'BOST', '17', LOAN_SECTOR_CODE, DISBURSED_IND, 'U'
		FROM SI_TEMP_BOST_CA015 t
	  WHERE --t.aa_number = s.lmt_bca_ref_num 
		t.LIMIT_ID = s.LMT_ID
		and s.source_id = 'BOST'
		AND t.is_valid = 'Y'
	  FETCH FIRST 1 ROW ONLY)
	 	WHERE CMS_LSP_APPR_LMTS_ID IN (select staging_reference_id from transaction
								where reference_id IN (select CMS_LSP_APPR_LMTS_ID 
														from sci_lsp_appr_lmts lmt, SI_TEMP_BOST_CA015 t
													where lmt.lmt_id = t.limit_id 
													and source_id = 'BOST' 
													AND is_valid = 'Y')
											and transaction_type = 'LIMIT') 
		and source_id = 'BOST';--
				
				
	insert into stage_limit (
			CMS_LSP_APPR_LMTS_ID,
			LMT_LE_ID, LMT_BCA_REF_NUM, LMT_ID, LMT_EXPRY_DATE, CMS_BKG_COUNTRY, CMS_BKG_ORGANISATION, LMT_PRD_TYPE_NUM,
			LMT_PRD_TYPE_VALUE, LMT_TYPE_NUM, LMT_TYPE_VALUE, 
			LMT_CRRNCY_ISO_CODE, LMT_AMT, LMT_INTRST_MARGIN, AVAILABLE_LMT, CMS_OUTSTANDING_AMT,
			cms_limit_profile_id,
			cms_limit_status,
			source_id, LMT_LOAN_SECTOR_NUM, LMT_LOAN_SECTOR_VALUE, DISBURSED_IND, UPDATE_STATUS_IND
	)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT),
			CIF_ID, AA_NUMBER, LIMIT_ID, EXPIRY_DATE, ORI_LOC_COUNTRY, ORG_LOC_ORG_CODE, PRODUCT_TYPE_CAT, 
			PRODUCT_TYPE_CODE, '25', 'OUTER',
			LIMIT_CURRENCY, LIMIT_AMT, CAST(INTEREST_MARGIN AS CHAR), AVAILABLE_LIMIT, cast(OUTSTANDING_AMT_SIGN||char(OUTSTANDING_AMT) as decimal(17,2))OUTSTANDING_AMT,
			(SELECT cms_lsp_lmt_profile_id FROM sci_lsp_lmt_profile
						WHERE llp_bca_ref_num = t.AA_NUMBER AND t.IS_VALID = 'Y'
							AND source_id = 'BOST'
						FETCH FIRST 1 ROW ONLY),
			'ACTIVE',
			'BOST', '17', LOAN_SECTOR_CODE, DISBURSED_IND, 'I'
		FROM SI_TEMP_BOST_CA015 t
		WHERE NOT EXISTS (SELECT '1' FROM stage_limit
	  					 WHERE lmt_id = t.limit_id
							 and source_id = 'BOST')
		and is_valid = 'Y');--

  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CA015', 'BOST', 0);
	COMMIT;
END@

CREATE PROCEDURE SI_RUN_TEMP_BOST_CO022
		LANGUAGE SQL
	BEGIN
	 CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 1);
		
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT ORG_LOC_ORG_CODE code, ORG_LOC_ORG_DESC desc,
			   ORG_LOC_ORG_CAT cat, 'BOST' source_id
		  FROM SI_TEMP_BOST_CO022
		 WHERE LENGTH(ORG_LOC_ORG_CODE) > 0
		   AND LENGTH(ORG_LOC_ORG_DESC) > 0
			 AND IS_VALID = 'Y'
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);--
	END FOR;--

	----------------------------------------------
	-- Update security type and subtype id
	-- SI_RUN_TEMP_BOST_CO022
	----------------------------------------------

--	UPDATE SI_TEMP_BOST_CO022 a 
--	   SET (cms_security_type_id, cms_security_subtype_id) =
--	(SELECT security_type_id, security_sub_type_id
--	   FROM si_host_col_code_map
--	  WHERE host_col_code = a.source_security_sub_type);

	LOCK TABLE SI_TEMP_BOST_CO022 IN EXCLUSIVE MODE;
	UPDATE SI_TEMP_BOST_CO022 a
	   SET (cms_security_type_id, cms_security_subtype_id) =
	(SELECT 'MS', SI_GET_SUBTYPE_BY_STOCK_CODE_AND_EXCHANGE(STOCK_CODE, CASE STOCK_EXCHANGE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE STOCK_EXCHANGE END)
	   FROM SI_TEMP_BOST_CO022
	  WHERE security_id = a.security_id);

	COMMIT;

	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------

	UPDATE CMS_SECURITY S SET STATUS = 'DELETED', S.DELETED_DATE = CURRENT_TIMESTAMP
	WHERE S.SOURCE_ID = 'BOST' AND S.SCI_SECURITY_TYPE_VALUE = 'MS'
		AND NOT EXISTS (SELECT 1 FROM SI_TEMP_BOST_CO022 T WHERE T.SECURITY_ID = S.SCI_SECURITY_DTL_ID AND T.IS_VALID = 'Y');
		
	COMMIT;

	UPDATE CMS_SECURITY SET (SCI_ORIG_SECURITY_CURRENCY, SECURITY_LOCATION, CUSTODIAN_TYPE, SECURITY_MATURITY_DATE,
		EXCHANGE_CONTROL_OBTAINED, IS_LEGAL_ENFORCE, IS_LEGAL_ENFORCE_DATE, SECURITY_PERFECTION_DATE, STATUS, 
    SCI_SECURITY_TYPE_VALUE, SCI_SECURITY_SUBTYPE_VALUE, SECURITY_SUB_TYPE_ID, SECURITY_ORGANISATION) =
	(SELECT ORIGINAL_CURRENCY, LOC_COUNTRY, CUSTODIAN_TYPE, SECURITY_EXPIRY_DATE, EXCHANGE_CONTROL_OBTAINED,
		LEGAL_ENFORCEABILITY, LEGAL_ENFORCEABILITY_DATE, SECURITY_PERFECTION_DATE, 'ACTIVE', CMS_SECURITY_TYPE_ID, CMS_SECURITY_SUBTYPE_ID,
		CMS_SECURITY_SUBTYPE_ID, ORG_LOC_ORG_CODE
		FROM SI_TEMP_BOST_CO022
		WHERE IS_VALID = 'Y' AND SCI_SECURITY_DTL_ID = SECURITY_ID)
	WHERE EXISTS (SELECT 1 FROM SI_TEMP_BOST_CO022 WHERE IS_VALID = 'Y' AND SCI_SECURITY_DTL_ID = SECURITY_ID AND SOURCE_ID = 'BOST') AND SOURCE_ID = 'BOST';--
	
	COMMIT;

	INSERT INTO CMS_SECURITY (CMS_COLLATERAL_ID, SCI_SECURITY_DTL_ID, SCI_SECURITY_CURRENCY, SCI_ORIG_SECURITY_CURRENCY, SECURITY_LOCATION, CUSTODIAN_TYPE, SECURITY_MATURITY_DATE,
		EXCHANGE_CONTROL_OBTAINED, IS_LEGAL_ENFORCE, IS_LEGAL_ENFORCE_DATE, SECURITY_PERFECTION_DATE, STATUS, SOURCE_ID, 
    SCI_SECURITY_TYPE_VALUE, SCI_SECURITY_SUBTYPE_VALUE, SECURITY_SUB_TYPE_ID, SECURITY_ORGANISATION, IS_MIGRATED_IND)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT), 
		SECURITY_ID, ORIGINAL_CURRENCY, ORIGINAL_CURRENCY, LOC_COUNTRY, CUSTODIAN_TYPE, SECURITY_EXPIRY_DATE, EXCHANGE_CONTROL_OBTAINED,
		LEGAL_ENFORCEABILITY, LEGAL_ENFORCEABILITY_DATE, SECURITY_PERFECTION_DATE, 'ACTIVE', 'BOST', CMS_SECURITY_TYPE_ID, CMS_SECURITY_SUBTYPE_ID,
		CMS_SECURITY_SUBTYPE_ID, ORG_LOC_ORG_CODE, 'N'
		FROM SI_TEMP_BOST_CO022
		WHERE IS_VALID = 'Y' AND NOT EXISTS (SELECT 1 FROM CMS_SECURITY WHERE SCI_SECURITY_DTL_ID = SECURITY_ID AND SOURCE_ID = 'BOST'));--
		
	COMMIT;

  UPDATE CMS_SECURITY A SET (TYPE_NAME, SUBTYPE_NAME) =
	(SELECT SECURITY_TYPE_NAME, SUBTYPE_NAME 
	   FROM CMS_SECURITY_SUB_TYPE
	  WHERE SECURITY_SUB_TYPE_ID = A.SECURITY_SUB_TYPE_ID)
	 WHERE SOURCE_ID = 'BOST'
	   AND (TYPE_NAME IS NULL OR SUBTYPE_NAME IS NULL);		
	   
	COMMIT;

  -- cms_security_source	   
	   
	UPDATE cms_security_source SET(cms_collateral_id, source_security_id, source_id, 
								   last_update_date, security_sub_type_id) =
	(SELECT sec.cms_collateral_id, t.security_id, 'BOST', current_timestamp, t.cms_security_subtype_id
	   FROM cms_security sec, si_temp_bost_co022 t 
	  WHERE sec.sci_security_dtl_id = security_id
	    AND sec.sci_security_dtl_id = source_security_id 
	    AND source_id = 'BOST' 
	    AND is_valid = 'Y')
	 WHERE EXISTS (SELECT 1 FROM si_temp_bost_co022
	 				WHERE source_security_id = security_id 
	 				  AND is_valid = 'Y')
	   AND source_id = 'BOST';
		
	COMMIT;

	INSERT INTO cms_security_source (cms_security_source_id, cms_collateral_id, source_security_id, source_id, 
									 status, last_update_date, security_sub_type_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
			sec.cms_collateral_id, t.security_id, 'BOST', 'ACTIVE', CURRENT_TIMESTAMP, t.cms_security_subtype_id
	   FROM cms_security sec, si_temp_bost_co022 t
	  WHERE NOT EXISTS (SELECT 1 FROM cms_security_source 
						 WHERE source_security_id = security_id 
						   AND source_id = 'BOST') 
		AND is_valid = 'Y'
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'BOST');
		
	COMMIT;

	-- Update ID to temp table
	
	LOCK TABLE SI_TEMP_BOST_CO022 IN EXCLUSIVE MODE;
	UPDATE SI_TEMP_BOST_CO022 T SET CMS_COLLATERAL_ID = 
	(SELECT S.CMS_COLLATERAL_ID
		FROM CMS_SECURITY S
		WHERE S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND S.SOURCE_ID = 'BOST')
	WHERE T.IS_VALID = 'Y';
	
	
  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 2);
  COMMIT;	   

	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------

	UPDATE CMS_STAGE_SECURITY S SET STATUS = 'DELETED', S.DELETED_DATE = CURRENT_TIMESTAMP
	WHERE S.SOURCE_ID = 'BOST' AND S.SCI_SECURITY_TYPE_VALUE = 'MS'
		AND NOT EXISTS (SELECT 1 FROM SI_TEMP_BOST_CO022 T WHERE T.SECURITY_ID = S.SCI_SECURITY_DTL_ID AND T.IS_VALID = 'Y');

	COMMIT;

	UPDATE CMS_STAGE_SECURITY SET (SCI_ORIG_SECURITY_CURRENCY, SECURITY_LOCATION, CUSTODIAN_TYPE, SECURITY_MATURITY_DATE,
		EXCHANGE_CONTROL_OBTAINED, IS_LEGAL_ENFORCE, IS_LEGAL_ENFORCE_DATE, SECURITY_PERFECTION_DATE, STATUS, 
    SCI_SECURITY_TYPE_VALUE, SCI_SECURITY_SUBTYPE_VALUE, SECURITY_SUB_TYPE_ID, SECURITY_ORGANISATION) =
	(SELECT ORIGINAL_CURRENCY, LOC_COUNTRY, CUSTODIAN_TYPE, SECURITY_EXPIRY_DATE, EXCHANGE_CONTROL_OBTAINED,
		LEGAL_ENFORCEABILITY, LEGAL_ENFORCEABILITY_DATE, SECURITY_PERFECTION_DATE, 'ACTIVE', CMS_SECURITY_TYPE_ID, CMS_SECURITY_SUBTYPE_ID,
		CMS_SECURITY_SUBTYPE_ID, ORG_LOC_ORG_CODE
		FROM SI_TEMP_BOST_CO022
		WHERE IS_VALID = 'Y' AND SCI_SECURITY_DTL_ID = SECURITY_ID)
	WHERE EXISTS (SELECT 1 FROM SI_TEMP_BOST_CO022 WHERE IS_VALID = 'Y' AND SCI_SECURITY_DTL_ID = SECURITY_ID AND SOURCE_ID = 'BOST') AND SOURCE_ID = 'BOST';--
	
	COMMIT;

	INSERT INTO CMS_STAGE_SECURITY (CMS_COLLATERAL_ID, SCI_SECURITY_DTL_ID, SCI_SECURITY_CURRENCY, SCI_ORIG_SECURITY_CURRENCY, SECURITY_LOCATION, CUSTODIAN_TYPE, SECURITY_MATURITY_DATE,
		EXCHANGE_CONTROL_OBTAINED, IS_LEGAL_ENFORCE, IS_LEGAL_ENFORCE_DATE, SECURITY_PERFECTION_DATE, STATUS, SOURCE_ID, 
    SCI_SECURITY_TYPE_VALUE, SCI_SECURITY_SUBTYPE_VALUE, SECURITY_SUB_TYPE_ID, SECURITY_ORGANISATION)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT), 
		SECURITY_ID, ORIGINAL_CURRENCY, ORIGINAL_CURRENCY, LOC_COUNTRY, CUSTODIAN_TYPE, SECURITY_EXPIRY_DATE, EXCHANGE_CONTROL_OBTAINED,
		LEGAL_ENFORCEABILITY, LEGAL_ENFORCEABILITY_DATE, SECURITY_PERFECTION_DATE, 'ACTIVE', 'BOST', CMS_SECURITY_TYPE_ID, CMS_SECURITY_SUBTYPE_ID,
		CMS_SECURITY_SUBTYPE_ID, ORG_LOC_ORG_CODE
		FROM SI_TEMP_BOST_CO022
		WHERE IS_VALID = 'Y' AND NOT EXISTS (SELECT 1 FROM CMS_STAGE_SECURITY WHERE SCI_SECURITY_DTL_ID = SECURITY_ID AND SOURCE_ID = 'BOST'));--
	
	COMMIT;

  UPDATE CMS_STAGE_SECURITY A SET (TYPE_NAME, SUBTYPE_NAME) =
	(SELECT SECURITY_TYPE_NAME, SUBTYPE_NAME 
	   FROM CMS_SECURITY_SUB_TYPE
	  WHERE SECURITY_SUB_TYPE_ID = A.SECURITY_SUB_TYPE_ID)
	 WHERE SOURCE_ID = 'BOST'
	   AND SUBTYPE_NAME IS NULL;		

	COMMIT;

	-- Update ID to temp table
	
	LOCK TABLE SI_TEMP_BOST_CO022 IN EXCLUSIVE MODE;
	UPDATE SI_TEMP_BOST_CO022 T SET CMS_COLLATERAL_ID_STG = 
	(SELECT S.CMS_COLLATERAL_ID
		FROM CMS_STAGE_SECURITY S
		WHERE S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND S.SOURCE_ID = 'BOST')
	WHERE T.IS_VALID = 'Y';

  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 3);
  COMMIT;	   
	
	-------------------------------------
	-- Actual Table
	-- CMS_MARKETABLE_SEC
	--
	-------------------------------------
	
	INSERT INTO CMS_MARKETABLE_SEC (CMS_COLLATERAL_ID)
	(SELECT S.CMS_COLLATERAL_ID
	   FROM CMS_SECURITY S, SI_TEMP_BOST_CO022 T
	  WHERE T.SECURITY_ID = S.SCI_SECURITY_DTL_ID AND T.IS_VALID = 'Y'
	    AND SOURCE_ID = 'BOST'
	    AND NOT EXISTS (SELECT '1' FROM CMS_MARKETABLE_SEC
	    				 WHERE CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID));--
	
	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 31);
	COMMIT;

	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_MARKETABLE_SEC
	--
	-------------------------------------
	
	INSERT INTO CMS_STAGE_MARKETABLE_SEC (CMS_COLLATERAL_ID)
	(SELECT S.CMS_COLLATERAL_ID
	   FROM CMS_STAGE_SECURITY S, SI_TEMP_BOST_CO022 T
	  WHERE T.SECURITY_ID = S.SCI_SECURITY_DTL_ID AND T.IS_VALID = 'Y'
	    AND SOURCE_ID = 'BOST'
	    AND NOT EXISTS (SELECT '1' FROM CMS_STAGE_MARKETABLE_SEC
	    				 WHERE CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID));--
	
	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 32);
	COMMIT;

	-------------------------------------
	-- Actual Table
	-- CMS_PORTFOLIO_ITEM
	--
	-------------------------------------
	
	LOCK TABLE CMS_PORTFOLIO_ITEM IN SHARE MODE;
	UPDATE CMS_PORTFOLIO_ITEM P SET STATUS = 'DELETED'
	WHERE P.SOURCE_ID = 'BOST'
		AND NOT EXISTS (SELECT 1 FROM SI_TEMP_BOST_CO022 T, CMS_MARKETABLE_SEC M, CMS_SECURITY S
			WHERE P.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID AND M.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID
			AND S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND T.IS_VALID = 'Y');
	
	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 33);
	COMMIT;

	LOCK TABLE CMS_PORTFOLIO_ITEM IN SHARE MODE;
	UPDATE CMS_PORTFOLIO_ITEM A SET (TYPE, AGENT_NAME, REGISTERED_NAME, NO_OF_UNITS, UNIT_PRICE, CUSTODIAN_TYPE, SECURITY_CUSTODIAN,
		SECURITY_MATURITY_DATE, STOCK_EXCHANGE, STOCK_EXCHANGE_COUNTRY, INDEX_NAME, STOCK_CODE, ISIN_CODE,
		RECOGNIZED_EXCHANGE_FLAG, COUNTER_CODE, STATUS) = 
	(SELECT TYPE, NOMINEE_NAME, REGISTERED_NAME, cast(UNITS_SIGN||char(UNITS) as bigint)UNITS, UNIT_PRICE, T.CUSTODIAN_TYPE, CUSTODIAN, MATURITY_DATE, 
		CASE STOCK_EXCHANGE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE STOCK_EXCHANGE END,
		STOCK_EXCHANGE_COUNTRY, INDEX_NAME, STOCK_CODE, ISIN_CODE, RECOGNIZED_EXCHANGE, T.COUNTER_CODE, 'ACTIVE'
		FROM SI_TEMP_BOST_CO022 T, CMS_MARKETABLE_SEC M, CMS_SECURITY S
		WHERE T.SECURITY_ID = S.SCI_SECURITY_DTL_ID AND T.IS_VALID = 'Y'
			AND S.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID
			AND A.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID)
	WHERE EXISTS (SELECT 1 FROM SI_TEMP_BOST_CO022 T, CMS_MARKETABLE_SEC M, CMS_SECURITY S
									WHERE T.SECURITY_ID = S.SCI_SECURITY_DTL_ID AND T.IS_VALID = 'Y'
										AND S.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID
										AND A.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID AND S.SOURCE_ID = 'BOST');--
	
	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 34);
	COMMIT;

	INSERT INTO CMS_PORTFOLIO_ITEM (CMS_COLLATERAL_ID, ITEM_ID, TYPE, AGENT_NAME, REGISTERED_NAME, NO_OF_UNITS, UNIT_PRICE,
		CUSTODIAN_TYPE, SECURITY_CUSTODIAN, SECURITY_MATURITY_DATE, STOCK_EXCHANGE,
		STOCK_EXCHANGE_COUNTRY, INDEX_NAME, STOCK_CODE, ISIN_CODE, RECOGNIZED_EXCHANGE_FLAG, COUNTER_CODE, SOURCE_ID, CMS_REF_ID, STATUS)
	(SELECT M.CMS_COLLATERAL_ID,
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT),
		TYPE, NOMINEE_NAME, REGISTERED_NAME, cast(UNITS_SIGN||char(UNITS) as bigint)UNITS, UNIT_PRICE, T.CUSTODIAN_TYPE, CUSTODIAN, MATURITY_DATE, 
		CASE STOCK_EXCHANGE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE STOCK_EXCHANGE END,
		STOCK_EXCHANGE_COUNTRY, INDEX_NAME, STOCK_CODE, ISIN_CODE, RECOGNIZED_EXCHANGE, T.COUNTER_CODE, 'BOST',
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT), 'ACTIVE'
		FROM SI_TEMP_BOST_CO022 T, CMS_MARKETABLE_SEC M, CMS_SECURITY S
		WHERE S.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID AND T.SECURITY_ID = S.SCI_SECURITY_DTL_ID AND T.IS_VALID = 'Y'
			AND NOT EXISTS (SELECT 1 FROM CMS_PORTFOLIO_ITEM WHERE SOURCE_ID = 'BOST' AND CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID));--
	
	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 35);
	COMMIT;

	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_PORTFOLIO_ITEM
	--
	-------------------------------------
	
	LOCK TABLE CMS_STAGE_PORTFOLIO_ITEM IN SHARE MODE;
	UPDATE CMS_STAGE_PORTFOLIO_ITEM P SET STATUS = 'DELETED'
	WHERE P.SOURCE_ID = 'BOST'
		AND NOT EXISTS (SELECT 1 FROM SI_TEMP_BOST_CO022 T, CMS_STAGE_MARKETABLE_SEC M, CMS_STAGE_SECURITY S
			WHERE P.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID AND M.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID
			AND S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND T.IS_VALID = 'Y');
	
	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 36);
	COMMIT;

	LOCK TABLE CMS_STAGE_PORTFOLIO_ITEM IN SHARE MODE;
	UPDATE CMS_STAGE_PORTFOLIO_ITEM A SET (TYPE, AGENT_NAME, REGISTERED_NAME, NO_OF_UNITS, UNIT_PRICE, CUSTODIAN_TYPE, SECURITY_CUSTODIAN,
		SECURITY_MATURITY_DATE, STOCK_EXCHANGE, STOCK_EXCHANGE_COUNTRY, INDEX_NAME, STOCK_CODE, ISIN_CODE,
		RECOGNIZED_EXCHANGE_FLAG, COUNTER_CODE, STATUS) = 
	(SELECT TYPE, NOMINEE_NAME, REGISTERED_NAME, cast(UNITS_SIGN||char(UNITS) as bigint)UNITS, UNIT_PRICE, T.CUSTODIAN_TYPE, CUSTODIAN, MATURITY_DATE, 
		CASE STOCK_EXCHANGE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE STOCK_EXCHANGE END,
		STOCK_EXCHANGE_COUNTRY, INDEX_NAME, STOCK_CODE, ISIN_CODE, RECOGNIZED_EXCHANGE, T.COUNTER_CODE, 'ACTIVE'
		FROM SI_TEMP_BOST_CO022 T, CMS_STAGE_MARKETABLE_SEC M, CMS_STAGE_SECURITY S
		WHERE T.SECURITY_ID = S.SCI_SECURITY_DTL_ID AND T.IS_VALID = 'Y'
			AND S.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID
			AND A.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID)
	WHERE EXISTS (SELECT 1 FROM SI_TEMP_BOST_CO022 T, CMS_STAGE_MARKETABLE_SEC M, CMS_STAGE_SECURITY S
									WHERE T.SECURITY_ID = S.SCI_SECURITY_DTL_ID AND T.IS_VALID = 'Y'
										AND S.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID
										AND A.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID AND S.SOURCE_ID = 'BOST');--
	
	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 37);
	COMMIT;

	INSERT INTO CMS_STAGE_PORTFOLIO_ITEM (CMS_COLLATERAL_ID, ITEM_ID, TYPE, AGENT_NAME, REGISTERED_NAME, NO_OF_UNITS, UNIT_PRICE,
		CUSTODIAN_TYPE, SECURITY_CUSTODIAN, SECURITY_MATURITY_DATE, STOCK_EXCHANGE, STOCK_EXCHANGE_COUNTRY, INDEX_NAME, 
		STOCK_CODE, ISIN_CODE, RECOGNIZED_EXCHANGE_FLAG, COUNTER_CODE, SOURCE_ID, CMS_REF_ID, STATUS)
	(SELECT M.CMS_COLLATERAL_ID,
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT),
		TYPE, NOMINEE_NAME, REGISTERED_NAME, cast(UNITS_SIGN||char(UNITS) as bigint)UNITS, UNIT_PRICE, T.CUSTODIAN_TYPE, CUSTODIAN, MATURITY_DATE, 
		CASE STOCK_EXCHANGE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE STOCK_EXCHANGE END,
		STOCK_EXCHANGE_COUNTRY, INDEX_NAME, STOCK_CODE, ISIN_CODE, RECOGNIZED_EXCHANGE, T.COUNTER_CODE, 'BOST',
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT), 'ACTIVE'
		FROM SI_TEMP_BOST_CO022 T, CMS_STAGE_MARKETABLE_SEC M, CMS_STAGE_SECURITY S
		WHERE S.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID AND T.SECURITY_ID = S.SCI_SECURITY_DTL_ID AND T.IS_VALID = 'Y'
			AND NOT EXISTS (SELECT 1 FROM CMS_STAGE_PORTFOLIO_ITEM WHERE SOURCE_ID = 'BOST' AND CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID));--

  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 4);
  COMMIT;	   
	
	-------------------------------------
	-- Actual Table
	-- CMS_LIMIT_SECURITY_MAP
	--
	-------------------------------------

	UPDATE SI_TEMP_BOST_CO022 T SET (CMS_LSP_APPR_LMTS_ID, CMS_LIMIT_PROFILE_ID) = 
	(SELECT L.CMS_LSP_APPR_LMTS_ID, L.CMS_LIMIT_PROFILE_ID
		FROM SCI_LSP_APPR_LMTS L
		WHERE L.LMT_ID = T.CIF_ID AND L.SOURCE_ID = 'BOST')
	WHERE T.IS_VALID = 'Y';
	
	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 41);
	COMMIT;

	LOCK TABLE CMS_LIMIT_SECURITY_MAP IN SHARE MODE;
	UPDATE CMS_LIMIT_SECURITY_MAP LSM SET LSM.UPDATE_STATUS_IND = 'D', LSM.DELETION_DATE = CURRENT_TIMESTAMP
	WHERE EXISTS (SELECT 1 FROM CMS_SECURITY S, SCI_LSP_APPR_LMTS L
		WHERE LSM.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID AND LSM.CMS_LSP_APPR_LMTS_ID = L.CMS_LSP_APPR_LMTS_ID AND S.SCI_SECURITY_TYPE_VALUE = 'MS'
			AND (S.STATUS = 'DELETED' OR L.CMS_LIMIT_STATUS = 'DELETED') AND LSM.SOURCE_ID = 'BOST' AND S.SOURCE_ID = 'BOST' AND L.SOURCE_ID = 'BOST');

	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 42);
	COMMIT;

	LOCK TABLE CMS_LIMIT_SECURITY_MAP IN SHARE MODE;
	INSERT INTO CMS_LIMIT_SECURITY_MAP (CHARGE_ID, CMS_LSP_APPR_LMTS_ID, CMS_COLLATERAL_ID, SCI_LAS_LE_ID, CUSTOMER_CATEGORY,
      CMS_LSP_LMT_PROFILE_ID, SCI_LAS_SEC_ID, UPDATE_STATUS_IND, SOURCE_ID)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_MAP_SEQ), 2)) as BIGINT),
			CMS_LSP_APPR_LMTS_ID, CMS_COLLATERAL_ID, CIF_ID, 'MB', CMS_LIMIT_PROFILE_ID, SECURITY_ID, 'I', 'BOST'
		FROM SI_TEMP_BOST_CO022 T
		WHERE T.IS_VALID = 'Y' AND NOT EXISTS (SELECT 1 FROM CMS_LIMIT_SECURITY_MAP M, CMS_SECURITY S WHERE T.IS_VALID = 'Y' AND M.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID
											AND S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND M.SOURCE_ID = 'BOST' AND S.SOURCE_ID = 'BOST')
	);--	

	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 43);
	COMMIT;

	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_LIMIT_SECURITY_MAP
	--
	-------------------------------------
	
	LOCK TABLE CMS_STAGE_LIMIT_SECURITY_MAP IN SHARE MODE;
	UPDATE CMS_STAGE_LIMIT_SECURITY_MAP LSM SET LSM.UPDATE_STATUS_IND = 'D', LSM.DELETION_DATE = CURRENT_TIMESTAMP
	WHERE EXISTS (SELECT 1 FROM CMS_STAGE_SECURITY S, SCI_LSP_APPR_LMTS L
		WHERE LSM.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID AND LSM.CMS_LSP_APPR_LMTS_ID = L.CMS_LSP_APPR_LMTS_ID AND S.SCI_SECURITY_TYPE_VALUE = 'MS'
			AND (S.STATUS = 'DELETED' OR L.CMS_LIMIT_STATUS = 'DELETED') AND LSM.SOURCE_ID = 'BOST' AND S.SOURCE_ID = 'BOST' AND L.SOURCE_ID = 'BOST');

	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 44);
	COMMIT;

	LOCK TABLE CMS_STAGE_LIMIT_SECURITY_MAP IN SHARE MODE;
	INSERT INTO CMS_STAGE_LIMIT_SECURITY_MAP (CHARGE_ID, CMS_LSP_APPR_LMTS_ID, CMS_COLLATERAL_ID, SCI_LAS_LE_ID, CUSTOMER_CATEGORY,
  	CMS_LSP_LMT_PROFILE_ID, SCI_LAS_SEC_ID, UPDATE_STATUS_IND, SOURCE_ID)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_MAP_SEQ), 2)) as BIGINT),
			CMS_LSP_APPR_LMTS_ID, CMS_COLLATERAL_ID_STG, CIF_ID, 'MB', CMS_LIMIT_PROFILE_ID, SECURITY_ID, 'I', 'BOST'
		FROM SI_TEMP_BOST_CO022 T
		WHERE T.IS_VALID = 'Y' AND NOT EXISTS (SELECT 1 FROM CMS_STAGE_LIMIT_SECURITY_MAP M, CMS_STAGE_SECURITY S WHERE T.IS_VALID = 'Y' AND M.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID
											AND S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND M.SOURCE_ID = 'BOST' AND S.SOURCE_ID = 'BOST')
	);--
	
  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 5);
  COMMIT;	   

	----------------------------
	-- Actual table
	-- sci_pledgor_dtl
	----------------------------

	DELETE FROM SI_TEMP_BOST_CO022_PLEDGOR;
	
	INSERT INTO SI_TEMP_BOST_CO022_PLEDGOR
	--(SELECT DISTINCT LMP_LE_ID, 'BOST', LMP_SHORT_NAME, LMP_INC_CNTRY_ISO_CODE, LMP_ID_TYPE_NUM, LMP_ID_TYPE_VALUE, LMP_INC_NUM_TEXT
	(SELECT DISTINCT LMP_LE_ID, 'BOST', LMP_SHORT_NAME, LMP_INC_CNTRY_ISO_CODE, LMP_ID_TYPE_NUM, LMP_ID_TYPE_VALUE, LMP_ID_NUMBER
		FROM SCI_LE_MAIN_PROFILE M, SI_TEMP_BOST_CO022 T
		WHERE T.CIF_ID = M.LMP_LE_ID AND M.SOURCE_ID = 'BOST' AND T.IS_VALID = 'Y');
		
	COMMIT;

--	UPDATE SCI_PLEDGOR_DTL PD SET PD.UPDATE_STATUS_IND = 'D'
--	WHERE PD.SOURCE_ID = 'BOST'
--		AND NOT EXISTS (SELECT 1 FROM SI_TEMP_BOST_CO022_PLEDGOR T WHERE T.CIF_NUMBER = PD.PLG_LE_ID);

	UPDATE sci_pledgor_dtl a SET (plg_legal_name, PLG_INC_NUM_TEXT, UPDATE_STATUS_IND) =
		(SELECT PLEDGOR_LEGAL_NAME, INC_NUM_TEXT, 'U'
			FROM SI_TEMP_BOST_CO022_PLEDGOR
			WHERE CIF_NUMBER = a.plg_le_id)
		WHERE source_id = 'BOST'
			AND EXISTS (SELECT '1' FROM SI_TEMP_BOST_CO022_PLEDGOR
							WHERE a.plg_le_id = CIF_NUMBER);
	
	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 51);
	COMMIT;

	INSERT INTO sci_pledgor_dtl (cms_pledgor_dtl_id, plg_le_id, plg_le_id_src_num, plg_le_id_src_value, 
									plg_id_type_num, plg_id_type_value, plg_legal_name, plg_inc_cntry_iso_code, PLG_INC_NUM_TEXT, source_id, UPDATE_STATUS_IND)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 2)) as BIGINT),
				CIF_NUMBER, '37', PLEDGOR_CIF_SOURCE, ID_CAT, ID_TYPE, PLEDGOR_LEGAL_NAME, INCORPORATION_COUNTRY, INC_NUM_TEXT, 'BOST', 'I'
			FROM SI_TEMP_BOST_CO022_PLEDGOR t
			WHERE NOT EXISTS (SELECT '1' FROM sci_pledgor_dtl
								WHERE t.CIF_NUMBER = plg_le_id
									AND source_id = 'BOST'));
	
	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 52);
	COMMIT;

	---------------------------------------------------
	-- Actual Table
	-- sci_sec_pldgr_map
	--
	---------------------------------------------------

	UPDATE SI_TEMP_BOST_CO022 T SET CMS_PLEDGOR_DTL_ID = 
	(SELECT P.CMS_PLEDGOR_DTL_ID
		FROM SCI_PLEDGOR_DTL P
		WHERE T.CIF_ID = P.PLG_LE_ID AND P.SOURCE_ID = 'BOST' FETCH FIRST 1 ROW ONLY)
	WHERE T.IS_VALID = 'Y';
	
	COMMIT;

--	UPDATE SCI_SEC_PLDGR_MAP SPM SET UPDATE_STATUS_IND = 'D'
--	WHERE EXISTS (SELECT 1 FROM SCI_PLEDGOR_DTL PD WHERE PD.SOURCE_ID = 'BOST' AND PD.CMS_PLEDGOR_DTL_ID = SPM.CMS_PLEDGOR_DTL_ID)
--		AND NOT EXISTS (SELECT 1 FROM SCI_PLEDGOR_DTL PD, SI_TEMP_BOST_CO022_PLEDGOR T WHERE PD.SOURCE_ID = 'BOST'
--			AND PD.CMS_PLEDGOR_DTL_ID = SPM.CMS_PLEDGOR_DTL_ID AND PD.PLG_LE_ID = T.CIF_NUMBER);
	
	INSERT INTO sci_sec_pldgr_map (cms_sec_pldgr_map_id, spm_sec_id, cms_pledgor_dtl_id, cms_collateral_id,
	SEC_PLEDGOR_RELATIONSHIP_NUM, SEC_PLEDGOR_RELATIONSHIP_VALUE, UPDATE_STATUS_IND, SOURCE_ID)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR col_pledgor_map_seq), 2)) as BIGINT),
				t.SECURITY_ID, 
				t.CMS_PLEDGOR_DTL_ID,
				t.CMS_COLLATERAL_ID,
				'34',
				'1st',
				'I',
				'BOST'
			FROM SI_TEMP_BOST_CO022 t
			WHERE t.IS_VALID = 'Y' AND t.CMS_COLLATERAL_ID IS NOT NULL AND t.CMS_PLEDGOR_DTL_ID IS NOT NULL
			AND NOT EXISTS (SELECT '1' FROM sci_sec_pldgr_map
											WHERE cms_collateral_id = t.CMS_COLLATERAL_ID
											AND cms_pledgor_dtl_id = t.CMS_PLEDGOR_DTL_ID)
		);

	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO022', 'BOST', 0);
	COMMIT;
END@
  
  	
CREATE PROCEDURE SI_RUN_TEMP_BOST_CO023
	LANGUAGE SQL
BEGIN
  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO023', 'BOST', 1);
	
	UPDATE SI_TEMP_BOST_CO023 T SET T.CMS_ITEM_ID = 
	(SELECT P.ITEM_ID FROM CMS_PORTFOLIO_ITEM P, CMS_SECURITY S, CMS_MARKETABLE_SEC M
				WHERE P.CMS_COLLATERAL_ID = M.CMS_COLLATERAL_ID AND M.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID 
				AND S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND T.IS_VALID = 'Y' AND S.SOURCE_ID = 'BOST' AND P.SOURCE_ID = 'BOST')
	WHERE T.IS_VALID = 'Y';
	
	---------------------------------------------------
	-- Actual Table
	-- CMS_PORTFOLIO_ITEM_DTL
	--
	---------------------------------------------------

--	UPDATE CMS_PORTFOLIO_ITEM_DTL I SET NUMBER_OF_UNITS = 0
--	WHERE EXISTS (SELECT 1 FROM CMS_PORTFOLIO_ITEM P, CMS_MARKETABLE_SEC MS, CMS_SECURITY S
--			WHERE I.ITEM_ID = P.ITEM_ID AND P.CMS_COLLATERAL_ID = MS.CMS_COLLATERAL_ID AND MS.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID
--				AND P.SOURCE_ID = 'BOST' AND S.SOURCE_ID = 'BOST' AND I.SHARE_TYPE = 'P')
--		AND NOT EXISTS (SELECT 1 FROM CMS_PORTFOLIO_ITEM P, CMS_MARKETABLE_SEC MS, CMS_SECURITY S, SI_TEMP_BOST_CO023 T
--			WHERE I.ITEM_ID = P.ITEM_ID AND P.CMS_COLLATERAL_ID = MS.CMS_COLLATERAL_ID AND MS.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID
--				AND S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND I.SHARE_ID = T.SHARE_ID
--				AND P.SOURCE_ID = 'BOST' AND S.SOURCE_ID = 'BOST' AND T.IS_VALID = 'Y');

	DELETE FROM CMS_PORTFOLIO_ITEM_DTL I
	WHERE NOT EXISTS
		(SELECT 1 FROM CMS_PORTFOLIO_ITEM P, CMS_MARKETABLE_SEC MS, CMS_SECURITY S, SI_TEMP_BOST_CO023 T
		WHERE I.ITEM_ID = P.ITEM_ID AND P.CMS_COLLATERAL_ID = MS.CMS_COLLATERAL_ID AND MS.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID
			AND S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND I.SHARE_ID = T.SHARE_ID
			AND P.SOURCE_ID = 'BOST' AND S.SOURCE_ID = 'BOST' AND T.IS_VALID = 'Y');

  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO023', 'BOST', 2);
	COMMIT;
	
	UPDATE CMS_PORTFOLIO_ITEM_DTL I SET (NUMBER_OF_UNITS, SHARE_TYPE, TRANSACTION_DATE, UNIT_SIGN, COUNTER_CODE) = 
	(SELECT T.UNITS, T.SHARES_TYPE, T.TRANSACTION_DATE, CASE SIGN_OF_UNITS WHEN '' THEN '+' ELSE SIGN_OF_UNITS END, T.COUNTER_CODE
		FROM SI_TEMP_BOST_CO023 T
		WHERE T.IS_VALID = 'Y' AND T.SHARE_ID = I.SHARE_ID)
	WHERE EXISTS (SELECT 1 FROM CMS_PORTFOLIO_ITEM P, CMS_MARKETABLE_SEC MS, CMS_SECURITY S, SI_TEMP_BOST_CO023 T
		WHERE I.ITEM_ID = P.ITEM_ID AND P.CMS_COLLATERAL_ID = MS.CMS_COLLATERAL_ID AND MS.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID
			AND S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND I.SHARE_ID = T.SHARE_ID
			AND P.SOURCE_ID = 'BOST' AND S.SOURCE_ID = 'BOST' AND T.IS_VALID = 'Y');

  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO023', 'BOST', 3);
	COMMIT;
	
	INSERT INTO CMS_PORTFOLIO_ITEM_DTL (ITEM_DTL_ID, ITEM_ID, NUMBER_OF_UNITS, SHARE_TYPE, STATUS, TRANSACTION_DATE, UNIT_SIGN, COUNTER_CODE, SHARE_ID)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT),
			CMS_ITEM_ID, UNITS, SHARES_TYPE, 'ACTIVE', TRANSACTION_DATE, CASE SIGN_OF_UNITS WHEN '' THEN '+' ELSE SIGN_OF_UNITS END, T.COUNTER_CODE, T.SHARE_ID
		FROM SI_TEMP_BOST_CO023 T
		WHERE T.IS_VALID = 'Y' 
			AND NOT EXISTS (SELECT 1 FROM CMS_PORTFOLIO_ITEM_DTL I, CMS_PORTFOLIO_ITEM P, CMS_MARKETABLE_SEC MS, CMS_SECURITY S
				WHERE I.ITEM_ID = P.ITEM_ID AND P.CMS_COLLATERAL_ID = MS.CMS_COLLATERAL_ID AND MS.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID
					AND S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND I.SHARE_ID = T.SHARE_ID
					AND P.SOURCE_ID = 'BOST' AND S.SOURCE_ID = 'BOST' AND T.IS_VALID = 'Y'));
	
	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO023', 'BOST', 0);
	COMMIT;
END@

CREATE PROCEDURE SI_RUN_TEMP_BOST_CO025
		LANGUAGE SQL
	BEGIN
		DECLARE v_security_sub_type_id VARCHAR(100);--
		DECLARE v_subtype_name VARCHAR(100);--
		DECLARE v_security_type_name VARCHAR(100);--
		DECLARE v_security_type_id VARCHAR(100);--
		
		CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO025', 'BOST', 1);

		select security_sub_type_id, subtype_name, security_type_name, security_type_id
		into v_security_sub_type_id, v_subtype_name, v_security_type_name, v_security_type_id
		from cms_security_sub_type 
		where security_sub_type_id='CS200';--	
		
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT ORG_LOC_ORG_CODE code, ORG_LOC_ORG_DESC desc,
			   ORG_LOC_ORG_CAT cat, 'BOST' source_id
		  FROM SI_TEMP_BOST_CO025
		 WHERE LENGTH(ORG_LOC_ORG_CODE) > 0
		   AND LENGTH(ORG_LOC_ORG_DESC) > 0
			 AND IS_VALID = 'Y'
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);--
	END FOR;--

	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------
		
	UPDATE CMS_SECURITY S SET STATUS = 'DELETED', S.DELETED_DATE = CURRENT_TIMESTAMP
	WHERE S.SOURCE_ID = 'BOST' AND S.SCI_SECURITY_TYPE_VALUE = 'CS'
		AND NOT EXISTS (SELECT 1 FROM SI_TEMP_BOST_CO025 T WHERE T.SECURITY_ID = S.SCI_SECURITY_DTL_ID AND T.IS_VALID = 'Y');
		
	COMMIT;

	UPDATE CMS_SECURITY SET(
		security_sub_type_id,
		subtype_name,
		type_name,
		sci_security_subtype_value,
		sci_security_type_value,
		security_location,
		sci_security_dtl_id,
		sci_security_currency,
		status,
		sci_orig_security_currency,
		security_organisation)=
		(SELECT v_security_sub_type_id, v_subtype_name, v_security_type_name, v_security_sub_type_id, v_security_type_id,
		SECURITY_LOC, SECURITY_ID, CURRENCY, 'ACTIVE', CURRENCY, ORG_LOC_ORG_CODE
 		FROM SI_TEMP_BOST_CO025 WHERE IS_VALID = 'Y' AND sci_security_dtl_id=SECURITY_ID and source_id='BOST')
			where exists (select 1 from SI_TEMP_BOST_CO025 where sci_security_dtl_id= SECURITY_ID and source_id='BOST');--
			
	COMMIT;

  INSERT INTO cms_security(
		cms_collateral_id,
		security_sub_type_id,
		subtype_name,
		type_name,
		sci_security_subtype_value,
		sci_security_type_value,
		security_location,
		sci_security_dtl_id,
		sci_security_currency,
		status,
		sci_orig_security_currency,
		security_organisation,
		is_migrated_ind,
		source_id)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT), 
		v_security_sub_type_id, v_subtype_name, v_security_type_name, v_security_sub_type_id, v_security_type_id,
		SECURITY_LOC, SECURITY_ID, CURRENCY, 'ACTIVE', CURRENCY, ORG_LOC_ORG_CODE,'N', 'BOST'
 		FROM SI_TEMP_BOST_CO025 t WHERE NOT EXISTS (SELECT 1 FROM cms_security WHERE t.IS_VALID = 'Y' AND  sci_security_dtl_id=SECURITY_ID and source_id='BOST'));--
 		

	------------------------------------------
	-- Update Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------	
		FOR cur_col_key AS
			SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
				FROM CMS_SECURITY a
			WHERE EXISTS (SELECT '1' FROM SI_TEMP_BOST_CO025
								WHERE a.SCI_SECURITY_DTL_ID = SECURITY_ID	  				   	  
										AND is_valid = 'Y')		   
				
		DO
			CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
		END FOR;
		

	-- cms_security_source	   
	   
	UPDATE cms_security_source SET(cms_collateral_id, source_security_id, source_id, 
								   last_update_date, security_sub_type_id) =
	(SELECT sec.cms_collateral_id, t.security_id, 'BOST', current_timestamp, v_security_sub_type_id
	   FROM cms_security sec, si_temp_bost_co025 t 
	  WHERE sec.sci_security_dtl_id = security_id
	    AND sec.sci_security_dtl_id = source_security_id 
	    AND source_id = 'BOST' 
	    AND is_valid = 'Y')
	 WHERE EXISTS (SELECT 1 FROM si_temp_bost_co025
	 				WHERE source_security_id = security_id 
	 				  AND is_valid = 'Y')
	   AND source_id = 'BOST';
		
	COMMIT;

	INSERT INTO cms_security_source (cms_security_source_id, cms_collateral_id, source_security_id, source_id, 
									 status, last_update_date, security_sub_type_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
			sec.cms_collateral_id, t.security_id, 'BOST', 'ACTIVE', CURRENT_TIMESTAMP, v_security_sub_type_id
	   FROM cms_security sec, si_temp_bost_co025 t
	  WHERE NOT EXISTS (SELECT 1 FROM cms_security_source 
						 WHERE source_security_id = security_id 
						   AND source_id = 'BOST') 
		AND is_valid = 'Y'
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'BOST');
	
	COMMIT;
	
	-- Update ID to temp table

	UPDATE SI_TEMP_BOST_CO025 T SET CMS_COLLATERAL_ID = 
	(SELECT S.CMS_COLLATERAL_ID
		FROM CMS_SECURITY S
		WHERE S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND S.SOURCE_ID = 'BOST')
	WHERE T.IS_VALID = 'Y';

	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO025', 'BOST', 2);
  COMMIT;
  	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------

	UPDATE CMS_STAGE_SECURITY S SET STATUS = 'DELETED', S.DELETED_DATE = CURRENT_TIMESTAMP
	WHERE S.SOURCE_ID = 'BOST' AND S.SCI_SECURITY_TYPE_VALUE = 'CS'
		AND NOT EXISTS (SELECT 1 FROM SI_TEMP_BOST_CO025 T WHERE T.SECURITY_ID = S.SCI_SECURITY_DTL_ID AND T.IS_VALID = 'Y');

	COMMIT;

	UPDATE cms_stage_security SET(
		security_sub_type_id,
		subtype_name,
		type_name,
		sci_security_subtype_value,
		sci_security_type_value,
		security_location,
		sci_security_dtl_id,
		sci_security_currency,
		status,
		sci_orig_security_currency,
		security_organisation)=
		(SELECT v_security_sub_type_id, v_subtype_name, v_security_type_name, v_security_sub_type_id, v_security_type_id,
		'MY', SECURITY_ID, 'MYR', 'ACTIVE', 'MYR', ORG_LOC_ORG_CODE
 		FROM SI_TEMP_BOST_CO025 WHERE IS_VALID = 'Y' AND sci_security_dtl_id=SECURITY_ID and source_id='BOST')
			where exists (select 1 from SI_TEMP_BOST_CO025 where IS_VALID = 'Y' AND sci_security_dtl_id= SECURITY_ID and source_id='BOST');--
			
	COMMIT;

	INSERT INTO cms_stage_security(
		cms_collateral_id,
		security_sub_type_id,
		subtype_name,
		type_name,
		sci_security_subtype_value,
		sci_security_type_value,
		security_location,
		sci_security_dtl_id,
		sci_security_currency,
		status,
		sci_orig_security_currency,
		security_organisation,
		source_id)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT), 
		v_security_sub_type_id, v_subtype_name, v_security_type_name, v_security_sub_type_id, v_security_type_id,
		'MY', SECURITY_ID, 'MYR', 'ACTIVE', 'MYR', ORG_LOC_ORG_CODE,'BOST'
 		FROM SI_TEMP_BOST_CO025 t WHERE t.IS_VALID = 'Y' AND NOT EXISTS (SELECT 1 FROM cms_stage_security WHERE sci_security_dtl_id=SECURITY_ID and source_id='BOST'));--			

	COMMIT;

	-- Update ID to temp table
	
	UPDATE SI_TEMP_BOST_CO025 T SET CMS_COLLATERAL_ID_STG = 
	(SELECT S.CMS_COLLATERAL_ID
		FROM CMS_STAGE_SECURITY S
		WHERE S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND S.SOURCE_ID = 'BOST')
	WHERE T.IS_VALID = 'Y';

  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO025', 'BOST', 3);
  COMMIT;

	----------------------------
	-- Actual table
	-- sci_pledgor_dtl
	----------------------------

	DELETE FROM SI_TEMP_BOST_CO025_PLEDGOR;
	
	INSERT INTO SI_TEMP_BOST_CO025_PLEDGOR
	--(SELECT DISTINCT LMP_LE_ID, 'BOST', LMP_SHORT_NAME, LMP_INC_CNTRY_ISO_CODE, LMP_ID_TYPE_NUM, LMP_ID_TYPE_VALUE, LMP_INC_NUM_TEXT
	(SELECT DISTINCT LMP_LE_ID, 'BOST', LMP_SHORT_NAME, LMP_INC_CNTRY_ISO_CODE, LMP_ID_TYPE_NUM, LMP_ID_TYPE_VALUE, LMP_ID_NUMBER
		FROM SCI_LE_MAIN_PROFILE M, SI_TEMP_BOST_CO025 T
		WHERE T.CIF_NUMBER = M.LMP_LE_ID AND M.SOURCE_ID = 'BOST' AND T.IS_VALID = 'Y');
	
	COMMIT;

--	UPDATE SCI_PLEDGOR_DTL PD SET PD.UPDATE_STATUS_IND = 'D'
--	WHERE PD.SOURCE_ID = 'BOST'
--		AND NOT EXISTS (SELECT 1 FROM SI_TEMP_BOST_CO025_PLEDGOR T WHERE T.CIF_NUMBER = PD.PLG_LE_ID);
			
	UPDATE SCI_PLEDGOR_DTL A SET (PLG_LEGAL_NAME, PLG_INC_NUM_TEXT, UPDATE_STATUS_IND) =
		(SELECT PLEDGOR_LEGAL_NAME, INC_NUM_TEXT, 'U'
			FROM SI_TEMP_BOST_CO025_PLEDGOR
			WHERE CIF_NUMBER = A.PLG_LE_ID FETCH FIRST 1 ROW ONLY)
		WHERE SOURCE_ID = 'BOST'
			AND EXISTS (SELECT '1' FROM SI_TEMP_BOST_CO025_PLEDGOR
							WHERE A.PLG_LE_ID = CIF_NUMBER);
	
	COMMIT;
	
	INSERT INTO SCI_PLEDGOR_DTL (CMS_PLEDGOR_DTL_ID, PLG_LE_ID, PLG_LE_ID_SRC_NUM, PLG_LE_ID_SRC_VALUE, 
									PLG_ID_TYPE_NUM, PLG_ID_TYPE_VALUE, PLG_LEGAL_NAME, PLG_INC_CNTRY_ISO_CODE, PLG_INC_NUM_TEXT, SOURCE_ID, UPDATE_STATUS_IND)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR PLEDGOR_SEQ), 2)) AS BIGINT),
				CIF_NUMBER, '37', PLEDGOR_CIF_SOURCE, ID_CAT, ID_TYPE, PLEDGOR_LEGAL_NAME, INCORPORATION_COUNTRY, INC_NUM_TEXT, 'BOST', 'I'
			FROM SI_TEMP_BOST_CO025_PLEDGOR T
			WHERE NOT EXISTS (SELECT '1' FROM SCI_PLEDGOR_DTL
								WHERE T.CIF_NUMBER = PLG_LE_ID
									AND SOURCE_ID = 'BOST'));
	
	COMMIT;
		
	---------------------------------------------------
	-- Actual Table
	-- sci_sec_pldgr_map
	--
	---------------------------------------------------

	UPDATE SI_TEMP_BOST_CO025 T SET CMS_PLEDGOR_DTL_ID = 
	(SELECT P.CMS_PLEDGOR_DTL_ID
		FROM SCI_PLEDGOR_DTL P
		WHERE T.CIF_NUMBER = P.PLG_LE_ID AND P.SOURCE_ID = 'BOST' FETCH FIRST 1 ROW ONLY)
	WHERE T.IS_VALID = 'Y';
	
	COMMIT;
	
--	UPDATE SCI_SEC_PLDGR_MAP SPM SET UPDATE_STATUS_IND = 'D'
--	WHERE EXISTS (SELECT 1 FROM SCI_PLEDGOR_DTL PD WHERE PD.SOURCE_ID = 'BOST' AND PD.CMS_PLEDGOR_DTL_ID = SPM.CMS_PLEDGOR_DTL_ID)
--		AND NOT EXISTS (SELECT 1 FROM SCI_PLEDGOR_DTL PD, SI_TEMP_BOST_CO025_PLEDGOR T WHERE PD.SOURCE_ID = 'BOST'
--			AND PD.CMS_PLEDGOR_DTL_ID = SPM.CMS_PLEDGOR_DTL_ID AND PD.PLG_LE_ID = T.CIF_NUMBER);

	INSERT INTO sci_sec_pldgr_map (cms_sec_pldgr_map_id, spm_sec_id, cms_pledgor_dtl_id, cms_collateral_id,
		SEC_PLEDGOR_RELATIONSHIP_NUM, SEC_PLEDGOR_RELATIONSHIP_VALUE, UPDATE_STATUS_IND, SOURCE_ID)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR col_pledgor_map_seq), 2)) as BIGINT),
				t.SECURITY_ID, 
				t.CMS_PLEDGOR_DTL_ID,
				t.CMS_COLLATERAL_ID,
				'34',
				'1st', 'I', 'BOST'
			FROM SI_TEMP_BOST_CO025 t
			WHERE t.IS_VALID = 'Y' AND t.CMS_COLLATERAL_ID IS NOT NULL AND t.CMS_PLEDGOR_DTL_ID IS NOT NULL
			AND NOT EXISTS (SELECT '1' FROM sci_sec_pldgr_map
											WHERE cms_collateral_id = t.CMS_COLLATERAL_ID
											AND cms_pledgor_dtl_id = t.CMS_PLEDGOR_DTL_ID)
		);
		
  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO025', 'BOST', 4);
  COMMIT;
		
	----------------------------
	-- Actual table
	-- cms_limit_security_map
	----------------------------
	
	UPDATE SI_TEMP_BOST_CO025 T SET (CMS_LSP_APPR_LMTS_ID, CMS_LIMIT_PROFILE_ID) = 
	(SELECT L.CMS_LSP_APPR_LMTS_ID, L.CMS_LIMIT_PROFILE_ID
		FROM SCI_LSP_APPR_LMTS L
		WHERE L.LMT_ID = T.CIF_NUMBER AND L.SOURCE_ID = 'BOST')
	WHERE T.IS_VALID = 'Y';
	
	COMMIT;

	UPDATE CMS_LIMIT_SECURITY_MAP LSM SET LSM.UPDATE_STATUS_IND = 'D', LSM.DELETION_DATE = CURRENT_TIMESTAMP
	WHERE EXISTS (SELECT 1 FROM CMS_SECURITY S, SCI_LSP_APPR_LMTS L
		WHERE LSM.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID AND LSM.CMS_LSP_APPR_LMTS_ID = L.CMS_LSP_APPR_LMTS_ID AND S.SCI_SECURITY_TYPE_VALUE = 'CS'
			AND (S.STATUS = 'DELETED' OR L.CMS_LIMIT_STATUS = 'DELETED') AND LSM.SOURCE_ID = 'BOST' AND S.SOURCE_ID = 'BOST' AND L.SOURCE_ID = 'BOST');
	
	COMMIT;

	INSERT INTO CMS_LIMIT_SECURITY_MAP (
		CHARGE_ID,
		CMS_LSP_APPR_LMTS_ID,
		CMS_COLLATERAL_ID,
		SCI_LAS_LMT_ID,
		CUSTOMER_CATEGORY,
		CMS_LSP_LMT_PROFILE_ID,
		UPDATE_STATUS_IND,
		SOURCE_ID)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_MAP_SEQ), 2)) as BIGINT), 
			CMS_LSP_APPR_LMTS_ID,
			CMS_COLLATERAL_ID,
			CIF_NUMBER,
			'MB',
			CMS_LIMIT_PROFILE_ID,
			'I',
			'BOST'
			FROM SI_TEMP_BOST_CO025 T
			WHERE T.IS_VALID = 'Y'
				AND NOT EXISTS (SELECT 1 FROM CMS_LIMIT_SECURITY_MAP M, CMS_SECURITY S 
						WHERE M.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID AND S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND M.SOURCE_ID = 'BOST' AND S.SOURCE_ID = 'BOST')
		);
	
	COMMIT;

	----------------------------
	-- Staging table
	-- cms_stage_limit_security_map
	----------------------------
		
	UPDATE CMS_STAGE_LIMIT_SECURITY_MAP LSM SET LSM.UPDATE_STATUS_IND = 'D', LSM.DELETION_DATE = CURRENT_TIMESTAMP
	WHERE EXISTS (SELECT 1 FROM CMS_STAGE_SECURITY S, SCI_LSP_APPR_LMTS L
		WHERE LSM.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID AND LSM.CMS_LSP_APPR_LMTS_ID = L.CMS_LSP_APPR_LMTS_ID AND S.SCI_SECURITY_TYPE_VALUE = 'CS'
			AND (S.STATUS = 'DELETED' OR L.CMS_LIMIT_STATUS = 'DELETED') AND LSM.SOURCE_ID = 'BOST' AND S.SOURCE_ID = 'BOST' AND L.SOURCE_ID = 'BOST');
	
	COMMIT;

	INSERT INTO CMS_STAGE_LIMIT_SECURITY_MAP (
		CHARGE_ID,
		CMS_LSP_APPR_LMTS_ID,
		CMS_COLLATERAL_ID,
		SCI_LAS_LMT_ID,
		CUSTOMER_CATEGORY,
		CMS_LSP_LMT_PROFILE_ID,
		UPDATE_STATUS_IND,
		SOURCE_ID)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_MAP_SEQ), 2)) as BIGINT), 
			CMS_LSP_APPR_LMTS_ID,
			CMS_COLLATERAL_ID_STG,
			CIF_NUMBER,
			'MB',
			CMS_LIMIT_PROFILE_ID,
			'I',
			'BOST'
			FROM SI_TEMP_BOST_CO025 T
			WHERE T.IS_VALID = 'Y'
				AND NOT EXISTS (SELECT 1 FROM CMS_STAGE_LIMIT_SECURITY_MAP M, CMS_STAGE_SECURITY S 
						WHERE M.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID AND S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND M.SOURCE_ID = 'BOST' AND S.SOURCE_ID = 'BOST')
		);

  CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO025', 'BOST', 5);
  COMMIT;
	
	-------------------------------------
	-- Actual Table
	-- CMS_CASH
	--
	-------------------------------------
	
	INSERT INTO CMS_CASH (CMS_COLLATERAL_ID)
	(SELECT T.CMS_COLLATERAL_ID	FROM SI_TEMP_BOST_CO025 T
		WHERE T.IS_VALID = 'Y'
			AND NOT EXISTS (SELECT 1 FROM CMS_CASH C, CMS_SECURITY S
												WHERE C.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID	AND S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND SOURCE_ID = 'BOST')
	);--
	
	COMMIT;
	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_CASH
	--
	-------------------------------------
	
	INSERT INTO CMS_STAGE_CASH (CMS_COLLATERAL_ID)
	(SELECT T.CMS_COLLATERAL_ID_STG FROM SI_TEMP_BOST_CO025 T
		WHERE T.IS_VALID = 'Y'
			AND NOT EXISTS (SELECT 1 FROM CMS_STAGE_CASH C, CMS_STAGE_SECURITY S
												WHERE C.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID AND S.SCI_SECURITY_DTL_ID = T.SECURITY_ID AND SOURCE_ID = 'BOST')
	);--
	
	COMMIT;

	
	-------------------------------------
	-- Actual Table
	-- CMS_CASH_DEPOSIT
	--
	-------------------------------------
	
	UPDATE CMS_CASH_DEPOSIT D SET D.STATUS = 'DELETED'
	WHERE D.SOURCE_ID = 'BOST'
		AND EXISTS (SELECT 1 FROM CMS_CASH C, CMS_SECURITY S WHERE D.CMS_COLLATERAL_ID = C.CMS_COLLATERAL_ID
			AND C.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID AND S.SOURCE_ID = 'BOST')
		AND NOT EXISTS (SELECT 1 FROM SI_TEMP_BOST_CO025 T
			WHERE T.IS_VALID = 'Y' AND T.DEPOSIT_RECEIPT_NO = D.DEPOSIT_RECEIPT_NUMBER);
	
	COMMIT;

	UPDATE CMS_CASH_DEPOSIT a set(
		DEPOSIT_AMOUNT_CURRENCY,
		DEPOSIT_AMOUNT,
		CMS_COLLATERAL_ID,
		ISSUE_DATE,
		source_id)=
		(SELECT 
		t.CURRENCY,
		t.DEPOSIT_AMT,
		s.CMS_COLLATERAL_ID,
		t.LEGAL_ENFORCEABILITY_DATE,
		'BOST'
		FROM SI_TEMP_BOST_CO025 t, CMS_SECURITY s where t.IS_VALID = 'Y' AND t.DEPOSIT_RECEIPT_NO=a.DEPOSIT_RECEIPT_NUMBER and a.source_id='BOST'
			and s.SCI_SECURITY_DTL_ID = t.SECURITY_ID AND s.SOURCE_ID='BOST') 
		where exists (select 1 from SI_TEMP_BOST_CO025 where IS_VALID = 'Y' AND DEPOSIT_RECEIPT_NO=a.DEPOSIT_RECEIPT_NUMBER and a.source_id='BOST');--
	
	COMMIT;
			
	INSERT INTO CMS_CASH_DEPOSIT (
		CASH_DEPOSIT_ID,
		DEPOSIT_RECEIPT_NUMBER,
		DEPOSIT_AMOUNT_CURRENCY,
		DEPOSIT_AMOUNT,
		CMS_COLLATERAL_ID,
		ISSUE_DATE,
		SOURCE_ID,
		CMS_REF_ID)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT), 
		t.DEPOSIT_RECEIPT_NO,
		t.CURRENCY,
		t.DEPOSIT_AMT,
		s.CMS_COLLATERAL_ID,
		t.LEGAL_ENFORCEABILITY_DATE,
		'BOST',
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT)
 		FROM SI_TEMP_BOST_CO025 t, CMS_SECURITY s WHERE t.IS_VALID = 'Y' AND s.SCI_SECURITY_DTL_ID = t.SECURITY_ID and s.source_id='BOST' 
			AND NOT EXISTS (SELECT 1 FROM CMS_CASH_DEPOSIT WHERE t.IS_VALID = 'Y' AND DEPOSIT_RECEIPT_NUMBER = t.DEPOSIT_RECEIPT_NO and source_id='BOST'));--
	
	COMMIT;
	
	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_CASH_DEPOSIT
	--
	-------------------------------------
	
	UPDATE CMS_STAGE_CASH_DEPOSIT D SET D.STATUS = 'DELETED'
	WHERE D.SOURCE_ID = 'BOST'
		AND EXISTS (SELECT 1 FROM CMS_STAGE_CASH C, CMS_STAGE_SECURITY S
			WHERE D.CMS_COLLATERAL_ID = C.CMS_COLLATERAL_ID AND C.CMS_COLLATERAL_ID = S.CMS_COLLATERAL_ID AND S.SOURCE_ID = 'BOST')
		AND NOT EXISTS (SELECT 1 FROM SI_TEMP_BOST_CO025 T
			WHERE T.IS_VALID = 'Y' AND T.DEPOSIT_RECEIPT_NO = D.DEPOSIT_RECEIPT_NUMBER);
	
	COMMIT;

	UPDATE CMS_STAGE_CASH_DEPOSIT a set(
		DEPOSIT_RECEIPT_NUMBER,
		DEPOSIT_AMOUNT_CURRENCY,
		DEPOSIT_AMOUNT,
		CMS_COLLATERAL_ID,
		ISSUE_DATE,
		source_id)=
		(SELECT DEPOSIT_RECEIPT_NO,
		CURRENCY,
		DEPOSIT_AMT,
		s.CMS_COLLATERAL_ID,
		LEGAL_ENFORCEABILITY_DATE,
		'BOST'
		FROM SI_TEMP_BOST_CO025 t, CMS_STAGE_SECURITY s where t.IS_VALID = 'Y' AND t.DEPOSIT_RECEIPT_NO=a.DEPOSIT_RECEIPT_NUMBER and a.source_id='BOST'
			and s.SCI_SECURITY_DTL_ID = t.SECURITY_ID AND s.SOURCE_ID='BOST') 
		where exists (select 1 from SI_TEMP_BOST_CO025 where IS_VALID = 'Y' AND DEPOSIT_RECEIPT_NO=a.DEPOSIT_RECEIPT_NUMBER and a.source_id='BOST');--
	
	COMMIT;
			
	INSERT INTO CMS_STAGE_CASH_DEPOSIT (
		CASH_DEPOSIT_ID,
		DEPOSIT_RECEIPT_NUMBER,
		DEPOSIT_AMOUNT_CURRENCY,
		DEPOSIT_AMOUNT,
		CMS_COLLATERAL_ID,
		ISSUE_DATE,
		SOURCE_ID,
		CMS_REF_ID)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT), 
		DEPOSIT_RECEIPT_NO,
		CURRENCY,
		DEPOSIT_AMT,
		s.CMS_COLLATERAL_ID,
		LEGAL_ENFORCEABILITY_DATE,
		'BOST',
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT)
 		FROM SI_TEMP_BOST_CO025 t, CMS_STAGE_SECURITY s WHERE t.IS_VALID = 'Y' AND s.SCI_SECURITY_DTL_ID = t.SECURITY_ID and s.source_id='BOST'
			AND NOT EXISTS (SELECT 1 FROM CMS_STAGE_CASH_DEPOSIT WHERE t.IS_VALID = 'Y' AND DEPOSIT_RECEIPT_NUMBER = t.DEPOSIT_RECEIPT_NO and source_id='BOST'));--

	CALL si_log_proc_time('SI_RUN_TEMP_BOST_CO025', 'BOST', 0);
	END@
	
CREATE PROCEDURE SI_RUN_TEMP_BOST_SH001
		LANGUAGE SQL
	BEGIN
	 CALL si_log_proc_time('SI_RUN_TEMP_BOST_SH001', 'BOST', 1);
	 
	UPDATE CMS_EARMARK_GROUP G SET G.STATUS = 'DELETED'
	WHERE NOT EXISTS (SELECT 1 FROM SI_TEMP_BOST_SH001 T WHERE T.COUNTER_CODE = G.COUNTER_CODE AND T.IS_VALID = 'Y')
		AND G.SOURCE_SYSTEM_ID = 'BOST';

	UPDATE CMS_EARMARK_GROUP G SET (TOTAL_NO_OF_UNITS, STATUS) =
		(SELECT CAST(A.SIGN_OF_UNIT||CHAR(A.TOTAL_NO_OF_UNIT) AS BIGINT) TOTAL_NO_OF_UNIT, 'ACTIVE' FROM SI_TEMP_BOST_SH001 A, CMS_PRICE_FEED B 
			WHERE A.IS_VALID = 'Y' AND A.COUNTER_CODE = G.COUNTER_CODE AND A.STOCK_CODE = B.STOCK_CODE AND LENGTH(A.STOCK_CODE) > 0
			AND CASE A.STOCK_EXCHANGE_CODE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE A.STOCK_EXCHANGE_CODE END = B.EXCHANGE
			AND G.FEED_ID = B.FEED_ID AND G.SOURCE_SYSTEM_ID = 'BOST')
	WHERE EXISTS 
		(SELECT 1 FROM SI_TEMP_BOST_SH001 A, CMS_PRICE_FEED B 
			WHERE A.IS_VALID = 'Y' AND A.COUNTER_CODE = G.COUNTER_CODE AND A.STOCK_CODE = B.STOCK_CODE AND LENGTH(A.STOCK_CODE) > 0
			AND CASE A.STOCK_EXCHANGE_CODE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE A.STOCK_EXCHANGE_CODE END = B.EXCHANGE
			AND G.FEED_ID = B.FEED_ID AND G.SOURCE_SYSTEM_ID = 'BOST');
				
	INSERT INTO CMS_EARMARK_GROUP (
		EARMARK_GROUP_ID,
		FEED_ID,
		SOURCE_SYSTEM_ID,
		TOTAL_NO_OF_UNITS,
		COUNTER_CODE,
		STATUS)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_EARMARK_GROUP_SEQ), 2)) as BIGINT),
			B.FEED_ID,
			'BOST',
			CAST(A.SIGN_OF_UNIT||CHAR(A.TOTAL_NO_OF_UNIT) AS BIGINT) TOTAL_NO_OF_UNIT,
			A.COUNTER_CODE,
			'ACTIVE'
			FROM SI_TEMP_BOST_SH001 A, CMS_PRICE_FEED B
			WHERE A.IS_VALID = 'Y' AND A.STOCK_CODE = B.STOCK_CODE AND LENGTH(A.STOCK_CODE) > 0
				AND CASE A.STOCK_EXCHANGE_CODE WHEN '1' THEN 'KLS' WHEN '2' THEN 'SES' ELSE A.STOCK_EXCHANGE_CODE END = B.EXCHANGE
				AND NOT EXISTS (SELECT 1 FROM CMS_EARMARK_GROUP WHERE A.COUNTER_CODE = COUNTER_CODE AND SOURCE_SYSTEM_ID = 'BOST'));
	 
	 CALL si_log_proc_time('SI_RUN_TEMP_BOST_SH001', 'BOST', 0);
	 
	UPDATE CMS_PORTFOLIO_ITEM P SET P.ISSUER_NAME = 
		(SELECT T.ISSUER_NAME FROM SI_TEMP_BOST_SH001 T WHERE T.COUNTER_CODE = P.COUNTER_CODE AND P.SOURCE_ID = 'BOST')
	WHERE EXISTS
		(SELECT 1 FROM SI_TEMP_BOST_SH001 T WHERE T.COUNTER_CODE = P.COUNTER_CODE AND P.SOURCE_ID = 'BOST');
	
	
	END@
	
CREATE PROCEDURE SI_RUN_TEMP_BOST_PLEDGOR
		LANGUAGE SQL
	BEGIN
		CALL si_log_proc_time('SI_RUN_TEMP_BOST_PLEDGOR', 'BOST', 1);
		
		UPDATE SCI_PLEDGOR_DTL PD SET PD.UPDATE_STATUS_IND = 'D'
		WHERE PD.SOURCE_ID = 'BOST'
			AND NOT EXISTS (SELECT 1 FROM SI_TEMP_BOST_CO022_PLEDGOR T WHERE T.CIF_NUMBER = PD.PLG_LE_ID)
			AND NOT EXISTS (SELECT 1 FROM SI_TEMP_BOST_CO025_PLEDGOR T WHERE T.CIF_NUMBER = PD.PLG_LE_ID);
		
		UPDATE SCI_SEC_PLDGR_MAP SPM SET UPDATE_STATUS_IND = 'D'
		WHERE SPM.SOURCE_ID = 'BOST'
			AND NOT EXISTS (SELECT 1 FROM SCI_PLEDGOR_DTL PD, SI_TEMP_BOST_CO022_PLEDGOR T WHERE PD.SOURCE_ID = 'BOST'
				AND PD.CMS_PLEDGOR_DTL_ID = SPM.CMS_PLEDGOR_DTL_ID AND PD.PLG_LE_ID = T.CIF_NUMBER)
			AND NOT EXISTS (SELECT 1 FROM SCI_PLEDGOR_DTL PD, SI_TEMP_BOST_CO025_PLEDGOR T WHERE PD.SOURCE_ID = 'BOST'
				AND PD.CMS_PLEDGOR_DTL_ID = SPM.CMS_PLEDGOR_DTL_ID AND PD.PLG_LE_ID = T.CIF_NUMBER);

		CALL si_log_proc_time('SI_RUN_TEMP_BOST_PLEDGOR', 'BOST', 0);
	END@
	
CREATE PROCEDURE SI_RUN_ALL_BOST
	LANGUAGE SQL
	BEGIN
	DECLARE v_count INTEGER;

  SELECT COUNT(*) INTO v_count FROM SI_TEMP_BOST_CU005;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_BOST_CU005;
		call SI_RUN_TEMP_BOST_CU005;
		call UTIL_TRUNCATE_TABLE('SI_TEMP_BOST_CU005');
	END IF;	

  SELECT COUNT(*) INTO v_count FROM SI_TEMP_BOST_CA001;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_BOST_CA001;
		call SI_RUN_TEMP_BOST_CA001;
		call UTIL_TRUNCATE_TABLE('SI_TEMP_BOST_CA001');
	END IF;

  SELECT COUNT(*) INTO v_count FROM SI_TEMP_BOST_CA015;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_BOST_CA015;
		call SI_RUN_TEMP_BOST_CA015;
		call UTIL_TRUNCATE_TABLE('SI_TEMP_BOST_CA015');
	END IF;

  SELECT COUNT(*) INTO v_count FROM SI_TEMP_BOST_CO025;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_BOST_CO025;
		call SI_RUN_TEMP_BOST_CO025;
		call UTIL_TRUNCATE_TABLE('SI_TEMP_BOST_CO025');
	END IF;

  SELECT COUNT(*) INTO v_count FROM SI_TEMP_BOST_CO022;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_BOST_CO022;
		call SI_RUN_TEMP_BOST_CO022;
		call UTIL_TRUNCATE_TABLE('SI_TEMP_BOST_CO022');
	END IF;

  SELECT COUNT(*) INTO v_count FROM SI_TEMP_BOST_CO023;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_BOST_CO023;
		call SI_RUN_TEMP_BOST_CO023;
		call UTIL_TRUNCATE_TABLE('SI_TEMP_BOST_CO023');
	END IF;

  SELECT COUNT(*) INTO v_count FROM SI_TEMP_BOST_CO022_PLEDGOR;
	IF v_count > 0 THEN
    SELECT COUNT(*) INTO v_count FROM SI_TEMP_BOST_CO025_PLEDGOR;
	  IF v_count > 0 THEN
    	CALL SI_RUN_TEMP_BOST_PLEDGOR;
    END IF;
  END IF;
	
  SELECT COUNT(*) INTO v_count FROM SI_TEMP_BOST_SH001;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_BOST_SH001;
		call SI_RUN_TEMP_BOST_SH001;
		call UTIL_TRUNCATE_TABLE('SI_TEMP_BOST_SH001');
	END IF;

	CALL SI_AUTO_CREATE_TRANSACTION;
END@

commit work@
