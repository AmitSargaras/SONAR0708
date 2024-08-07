--SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,ABCLIMS@
DROP PROCEDURE SI_RUN_TEMP_QUAN_CU008@
DROP PROCEDURE SI_RUN_TEMP_QUAN_CU002@
DROP PROCEDURE SI_RUN_TEMP_QUAN_CA020@
DROP PROCEDURE SI_RUN_ALL_QUAN@


CREATE PROCEDURE SI_RUN_TEMP_QUAN_CU008
	LANGUAGE SQL
BEGIN
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CU008', 'QUAN', 1);
	
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	-- CUST_CLASS_CAT = '56'
	-- CUST_SEGMENT_CAT = 'ID_TYPE'
	-------------------------------------
		
	FOR cur_std_code AS
		SELECT DISTINCT cust_class_code code, cust_class_desc desc, 
				cust_class_cat cat, 'QUAN' source_id
			FROM SI_TEMP_QUAN_CU008
		WHERE LENGTH(CUST_CLASS_CODE) > 0
			AND LENGTH(CUST_CLASS_DESC) > 0
			and is_valid = 'Y'
		UNION
		SELECT DISTINCT cust_segment_code code, cust_segment_desc desc,
			   cust_segment_cat cat, 'QUAN' source_id
		  FROM SI_TEMP_QUAN_CU008
		 WHERE LENGTH(cust_segment_code) > 0
		   AND LENGTH(cust_segment_desc) > 0
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;	
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CU008', 'QUAN', 2);

	UPDATE SI_TEMP_QUAN_CU008 a SET cms_le_main_profile_id = 
	(SELECT cms_le_main_profile_id FROM sci_le_main_profile
	  WHERE lmp_le_id = a.cif_id
		AND source_id = 'QUAN')
	 WHERE is_valid = 'Y';
	 
	 call si_runstats ('SI_TEMP_QUAN_CU008');
	 
	 CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CU008', 'QUAN', 3);
	commit;
	
	-------------------------------------
	-- Actual Table
	-- SCI_LE_MAIN_PROFILE
	--
	-------------------------------------	
    lock table sci_le_main_profile in share mode; 		
	UPDATE sci_le_main_profile a SET (LMP_LE_ID, LMP_LONG_NAME, LMP_SHORT_NAME,
									LMP_LEGAL_CONST_NUM, LMP_LEGAL_CONST_VALUE, LMP_INC_CNTRY_ISO_CODE, 
									--LMP_ID_TYPE_NUM, LMP_ID_TYPE_VALUE, LMP_INC_NUM_TEXT,
									LMP_ID_TYPE_NUM, LMP_ID_TYPE_VALUE, LMP_ID_NUMBER,
									--LMP_SECOND_ID_TYPE_NUM, LMP_SECOND_ID_TYPE_VALUE, LMP_ID_OLD_NUM,
									LMP_SECOND_ID_TYPE_NUM, LMP_SECOND_ID_TYPE_VALUE, LMP_SECOND_ID_NUMBER,
									LMP_TYPE_NUM, LMP_TYPE_VALUE, 
									LMP_SGMNT_CODE_NUM, LMP_SGMNT_CODE_VALUE,
									UPDATE_STATUS_IND, SOURCE_ID) =
		(SELECT 
			CIF_ID, CUST_NAME_LONG, CUST_NAME_SHORT,
			CUST_CLASS_CAT, CUST_CLASS_CODE, ID_ISSUE_COUNTRY, 
			ID_TYPE_CAT, ID_TYPE_CODE, ID_NUMBER, 
			SECONDARY_ID_TYPE_CAT, SECONDARY_ID_TYPE_CODE, SECONDARY_ID_NUMBER, 
			CUST_TYPE_CAT, CUST_TYPE_CODE, 
			CUST_SEGMENT_CAT, CUST_SEGMENT_CODE, 
			'U', 'QUAN' 
		FROM SI_TEMP_QUAN_CU008 t 
		WHERE 
		t.cms_le_main_profile_id = a.cms_le_main_profile_id
			AND IS_VALID = 'Y'			
			)
	WHERE 
	EXISTS (SELECT '1' FROM SI_TEMP_QUAN_CU008 
			   WHERE cms_le_main_profile_id = a.cms_le_main_profile_id
			   AND IS_VALID = 'Y')
	AND source_id = 'QUAN';
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CU008', 'QUAN', 4);
	commit;
	
	
	lock table sci_le_main_profile in exclusive mode; 		
	INSERT INTO sci_le_main_profile (CMS_LE_MAIN_PROFILE_ID, 
									LMP_LE_ID, LMP_LONG_NAME, LMP_SHORT_NAME,
									LMP_LEGAL_CONST_NUM, LMP_LEGAL_CONST_VALUE, LMP_INC_CNTRY_ISO_CODE, 
									--LMP_ID_TYPE_NUM, LMP_ID_TYPE_VALUE, LMP_INC_NUM_TEXT,
									LMP_ID_TYPE_NUM, LMP_ID_TYPE_VALUE, LMP_ID_NUMBER,
									--LMP_SECOND_ID_TYPE_NUM, LMP_SECOND_ID_TYPE_VALUE, LMP_ID_OLD_NUM, 
									LMP_SECOND_ID_TYPE_NUM, LMP_SECOND_ID_TYPE_VALUE, LMP_SECOND_ID_NUMBER,
									LMP_TYPE_NUM, LMP_TYPE_VALUE, 
									LMP_SGMNT_CODE_NUM, LMP_SGMNT_CODE_VALUE,
									UPDATE_STATUS_IND, SOURCE_ID)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR legal_entity_seq), 2)) as BIGINT), 
			CIF_ID, CUST_NAME_LONG, CUST_NAME_SHORT, 	
			CUST_CLASS_CAT, CUST_CLASS_CODE, ID_ISSUE_COUNTRY, 		
			ID_TYPE_CAT, ID_TYPE_CODE, ID_NUMBER, 
			SECONDARY_ID_TYPE_CAT, SECONDARY_ID_TYPE_CODE, SECONDARY_ID_NUMBER, 
			CUST_TYPE_CAT, CUST_TYPE_CODE, 
			CUST_SEGMENT_CAT, CUST_SEGMENT_CODE,
			'I', 'QUAN' 
	 FROM SI_TEMP_QUAN_CU008 t 
	 WHERE  
	 IS_VALID = 'Y' 
	 AND t.cms_le_main_profile_id IS NULL);
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CU008', 'QUAN', 5);
	commit;
	
	-------------------------------------
	-- Temp Table
	-- SI_TEMP_QUAN_CU008
	-- populate main profile id
	--
	-------------------------------------
		
	UPDATE SI_TEMP_QUAN_CU008 a SET cms_le_main_profile_id = 
	(SELECT cms_le_main_profile_id FROM sci_le_main_profile
	  WHERE lmp_le_id = a.cif_id
		AND source_id = 'QUAN')
	 WHERE is_valid = 'Y';
	 
	 CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CU008', 'QUAN', 6);
	commit;
	
	-------------------------------------
	-- Temp Table
	-- SI_TEMP_QUAN_CU008
	-- populate sub profile id
	--
	-------------------------------------
	
	UPDATE SI_TEMP_QUAN_CU008 a SET cms_le_sub_profile_id = 
	(SELECT cms_le_sub_profile_id FROM sci_le_sub_profile
	  WHERE lsp_le_id = a.cif_id
		AND cms_le_main_profile_id = a.cms_le_main_profile_id)
	 WHERE is_valid = 'Y';
	 
	 CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CU008', 'QUAN', 7);
	commit;
	-------------------------------------
	-- Actual Table
	-- SCI_LE_SUB_PROFILE
	--
	-------------------------------------
	lock table sci_le_sub_profile in share mode; 							   
	UPDATE sci_le_sub_profile a 
	SET 
	(LSP_ID, LSP_LE_ID, LSP_SHORT_NAME, LSP_DMCL_CNTRY_ISO_CODE, UPDATE_STATUS_IND, CMS_LE_MAIN_PROFILE_ID) =
		(SELECT 1, lmp_le_id, lmp_short_name, lmp_inc_cntry_iso_code, 'U', cms_le_main_profile_id
		   FROM sci_le_main_profile t
		  WHERE t.cms_le_main_profile_id = a.cms_le_main_profile_id
		    AND source_id = 'QUAN'
		  )
	WHERE exists
		(select '1'
		 from SI_TEMP_QUAN_CU008 
		     WHERE cif_id = a.lsp_le_id
	  				   AND a.cms_le_sub_profile_id = cms_le_sub_profile_id
	  				   AND a.cms_le_main_profile_id = cms_le_main_profile_id
	  				   AND is_valid = 'Y');
	  
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CU008', 'QUAN', 8);
	commit;
	
	lock table sci_le_sub_profile in share mode; 				
	INSERT INTO sci_le_sub_profile 
	(CMS_LE_SUB_PROFILE_ID, LSP_ID, LSP_LE_ID, LSP_SHORT_NAME, LSP_DMCL_CNTRY_ISO_CODE, 
	UPDATE_STATUS_IND, CMS_LE_MAIN_PROFILE_ID)
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR customer_seq), 2)) as BIGINT),
		1, lmp_le_id, lmp_short_name, lmp_inc_cntry_iso_code, 'I', cms_le_main_profile_id
	    FROM sci_le_main_profile t 				
			 WHERE NOT EXISTS (SELECT '1' FROM sci_le_sub_profile 
	  					 WHERE cms_le_main_profile_id = t.cms_le_main_profile_id)
	    AND source_id = 'QUAN');

	
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CU008', 'QUAN', 9);
	commit;
	
	-------------------------------------
	-- Actual Table
	-- SCI_LSP_OFF_ADDR
	--
	-------------------------------------
	lock table sci_le_reg_addr in share mode; 			
	
	UPDATE sci_le_reg_addr a SET (lra_type_num, lra_type_value, lra_addr_line_1,
									lra_addr_line_2, lra_addr_line_3, lra_addr_line_4, 
									lra_post_code, LRA_CNTRY_ISO_CODE, UPDATE_STATUS_IND) =
	(SELECT PRIMARY_ADD_TYPE_CAT, PRIMARY_ADD_TYPE_CODE, PRIMARY_ADD_1, 
			PRIMARY_ADD_2, PRIMARY_ADD_3, PRIMARY_ADD_4, 
			PRIMARY_POSTCODE, PRIMARY_COUNTRY, 'U'
	   FROM SI_TEMP_QUAN_CU008 t
	  WHERE t.cif_id = a.lra_le_id
	    AND a.cms_le_main_profile_id = t.cms_le_main_profile_id
		and t.PRIMARY_ADD_TYPE_CODE = a.lra_type_value
		and is_valid = 'Y'
	  )
	 WHERE EXISTS 
 	   (SELECT '1'
    	FROM SI_TEMP_QUAN_CU008 
    	WHERE cif_id = a.lra_le_id
	 				  AND a.lra_type_value = PRIMARY_ADD_TYPE_CODE
	 				  AND a.cms_le_main_profile_id = cms_le_main_profile_id
	 				  AND is_valid = 'Y');
			
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CU008', 'QUAN', 10);
	commit;			
	
	lock table sci_le_reg_addr in share mode; 		
	INSERT INTO sci_le_reg_addr (cms_le_reg_addr_id, 
								lra_le_id, lra_type_num, lra_type_value, 
								lra_addr_line_1, lra_addr_line_2, 
								lra_addr_line_3, lra_addr_line_4, 
								lra_post_code, LRA_CNTRY_ISO_CODE, 
								cms_le_main_profile_id,
								UPDATE_STATUS_IND )
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR contact_seq), 2)) as BIGINT),
			cif_id, PRIMARY_ADD_TYPE_CAT, PRIMARY_ADD_TYPE_CODE, 
			PRIMARY_ADD_1, PRIMARY_ADD_2, 
			PRIMARY_ADD_3, PRIMARY_ADD_4, 
			PRIMARY_POSTCODE, PRIMARY_COUNTRY,
		    cms_le_main_profile_id, 
		    'I'
	  FROM SI_TEMP_QUAN_CU008 t
	  WHERE 
	  NOT EXISTS (SELECT '1' FROM sci_le_reg_addr addr
	  					 WHERE addr.cms_le_main_profile_id = t.cms_le_main_profile_id
							 and t.PRIMARY_ADD_TYPE_CODE = addr.lra_type_value)
	AND t.IS_VALID = 'Y'     
	and PRIMARY_ADD_TYPE_CODE is not null
	and PRIMARY_ADD_TYPE_CODE <> '');
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CU008', 'QUAN', 0);
	commit;
	
END@


CREATE PROCEDURE SI_RUN_TEMP_QUAN_CU002
	LANGUAGE SQL
BEGIN

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CU002', 'QUAN', 1);
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	-- CREDIT_GRADE_VALUE_CAT = '19'
	-------------------------------------

	FOR cur_std_code AS
		 SELECT DISTINCT credit_grade_value code, credit_grade_value desc,
			   credit_grade_value_cat cat, 'QUAN' source_id
		  FROM SI_TEMP_QUAN_CU002
		 WHERE LENGTH(credit_grade_value) > 0
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CU002', 'QUAN', 2);
	
	-------------------------------------
	-- Temp Table
	-- SI_TEMP_QUAN_CU002
	-- populate main profile id
	--
	-------------------------------------

	UPDATE SI_TEMP_QUAN_CU002 a SET cms_le_main_profile_id = 
	(SELECT cms_le_main_profile_id FROM sci_le_main_profile
	  WHERE lmp_le_id = a.cif_id
		AND source_id = 'QUAN')
	 WHERE is_valid = 'Y';
	 
	 CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CU002', 'QUAN', 3);
	commit;
	-------------------------------------
	-- Actual Table
	-- SCI_LE_CREDIT_GRADE
	--
	-------------------------------------	

	UPDATE sci_le_credit_grade a SET (lcg_le_id, lcg_crdt_grade_type_num, lcg_crdt_grade_type_value,
									lcg_crdt_grade_code_num, lcg_crdt_grade_code_value, lcg_crdt_grade_start_date,
									UPDATE_STATUS_IND, cms_main_profile_id) =
	(SELECT cif_id, credit_grade_type_cat, credit_grade_type, credit_grade_value_cat, credit_grade_value, 
			credit_grade_effective_date, 'U', cms_le_main_profile_id
	  FROM SI_TEMP_QUAN_CU002 t
	  WHERE t.cif_id = a.lcg_le_id
	  AND IS_VALID = 'Y'	 
		)
	  WHERE exists (SELECT '1' 
						  FROM SI_TEMP_QUAN_CU002 
						 WHERE cif_id = lcg_le_id
						   AND cms_le_main_profile_id = a.cms_main_profile_id
						   AND IS_VALID = 'Y'
							);		

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CU002', 'QUAN', 4);
	commit;
										 
	INSERT INTO sci_le_credit_grade 
	(cms_le_credit_grade_id, lcg_le_id, lcg_crdt_grade_type_num,
	lcg_crdt_grade_type_value, lcg_crdt_grade_code_num, lcg_crdt_grade_code_value,
	lcg_crdt_grade_start_date, UPDATE_STATUS_IND, cms_main_profile_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR credit_grade_seq), 2)) as BIGINT),
			cif_id, credit_grade_type_cat, credit_grade_type, credit_grade_value_cat, credit_grade_value, 
			credit_grade_effective_date, 'I', 
			cms_le_main_profile_id
	  FROM SI_TEMP_QUAN_CU002 t
	  WHERE 		
		NOT EXISTS (SELECT '1' FROM sci_le_credit_grade cg
	  					 WHERE lcg_le_id = t.cif_id
	  					   AND t.cms_le_main_profile_id = cg.cms_main_profile_id)
		AND is_valid = 'Y');								 	
										 
    CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CU002', 'QUAN', 0);
    
END@


CREATE PROCEDURE SI_RUN_TEMP_QUAN_CA020
	LANGUAGE SQL
BEGIN

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 1);
	
	------------------------------------------
	-- Temp Table
	-- si_temp_QUAN_ca002
	-- populate sub profile id - customer id
	-- cms bca key - act and stg from trx
	-- 
	------------------------------------------

	UPDATE si_temp_QUAN_CA020 a SET cms_customer_id = 
	(SELECT cms_le_sub_profile_id 
	   FROM sci_le_sub_profile sp, sci_le_main_profile mp
	  WHERE lsp_le_id = a.cif_id
	    AND lmp_le_id = a.cif_id
	    AND sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
		AND source_id = 'QUAN')
	 WHERE is_valid = 'Y' and mrex_cust_ind = 'Y';
	 
	 UPDATE si_temp_QUAN_CA020 a SET cms_customer_id = 
	(SELECT cms_le_sub_profile_id 
	   FROM sci_le_sub_profile sp, sci_le_main_profile mp
	  WHERE lsp_le_id = a.cif_id
	    AND lmp_le_id = a.cif_id
	    AND sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
		AND source_id = 'ARBS')
	 WHERE is_valid = 'Y' and mrex_cust_ind = 'N';
	 
	  CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 2);
	commit;
	
	
	UPDATE si_temp_QUAN_CA020 a SET (cms_act_aa_id, cms_stg_aa_id) =
	(SELECT reference_id, staging_reference_id
	   FROM sci_lsp_lmt_profile, transaction
	  WHERE reference_id = cms_lsp_lmt_profile_id
	    AND transaction_type = 'LIMITPROFILE'
	    AND llp_bca_ref_num = a.aa_number
	    AND source_id = 'QUAN')
	 WHERE is_valid = 'Y';
	 
	 CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 3);
	commit;
	
	-------------------------------------
	-- Actual Table
	-- SCI_LSP_LMT_PROFILE
	--
	-------------------------------------

	UPDATE sci_lsp_lmt_profile a SET (LLP_LE_ID, CIF_SOURCE_ID, LLP_LSP_ID, 
									LLP_BCA_REF_NUM, LMT_PROFILE_TYPE, 
									SOURCE_ID, CMS_BCA_STATUS, UPDATE_STATUS_IND) =
	(SELECT CIF_ID, 'QUAN', 1, 
	    AA_NUMBER, 'BANKING', 
	    'QUAN', 'ACTIVE', 'U'
	   FROM SI_TEMP_QUAN_CA020 t
	  WHERE t.aa_number = a.llp_bca_ref_num
	  AND a.cms_customer_id = t.cms_customer_id
	  AND IS_VALID = 'Y'
		and a.source_id = 'QUAN' fetch first 1 row only
	  )
	  WHERE EXISTS (SELECT '1' FROM SI_TEMP_QUAN_CA020 
	  				 WHERE LLP_BCA_REF_NUM = AA_NUMBER
					  AND cms_customer_id = a.cms_customer_id
	  				   AND a.cms_lsp_lmt_profile_id = cms_act_aa_id
					 AND IS_VALID = 'Y'
					 and a.source_id = 'QUAN');

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 4);
	commit;
	
	INSERT INTO SCI_LSP_LMT_PROFILE (CMS_LSP_LMT_PROFILE_ID, 
									LLP_LE_ID, CIF_SOURCE_ID, LLP_LSP_ID, LLP_BCA_REF_NUM, 
									CMS_CUSTOMER_ID, LMT_PROFILE_TYPE, 
									SOURCE_ID, CMS_BCA_STATUS, UPDATE_STATUS_IND)
	(SELECT 
	CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_profile_seq), 2)) as BIGINT),
		CIF_ID, 'QUAN', 1, AA_NUMBER, 
		cms_customer_id, 'BANKING', 
		'QUAN', 'ACTIVE', 'I'
	   FROM SI_TEMP_QUAN_CA020 t
	  WHERE 
	  cms_act_aa_id IS NULL
	  AND IS_VALID = 'Y' group by CIF_ID, AA_NUMBER, cms_customer_id);
	  
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 5);
	commit;
	  
	-------------------------------------
	-- Staging Table
	-- STAGE_LIMIT_PROFILE
	--
	-------------------------------------
	  
	UPDATE stage_limit_profile s SET (LLP_LE_ID, CIF_SOURCE_ID, LLP_LSP_ID, LLP_BCA_REF_NUM,
									LMT_PROFILE_TYPE, SOURCE_ID, CMS_BCA_STATUS, UPDATE_STATUS_IND) =
	(SELECT 
		CIF_ID, 'QUAN', 1, AA_NUMBER, 
		'BANKING', 'QUAN', 'ACTIVE', 'U'
	   FROM SI_TEMP_QUAN_CA020 t
	  WHERE t.aa_number = s.llp_bca_ref_num
	    AND t.cms_customer_id = s.cms_customer_id
	  	AND t.cms_stg_aa_id = s.cms_lsp_lmt_profile_id
		and s.source_id = 'QUAN'
	  AND IS_VALID = 'Y' fetch first 1 row only
	  )
	 WHERE EXISTS (SELECT '1' FROM si_temp_QUAN_CA020
	  				 WHERE cms_customer_id = s.cms_customer_id
	  				   AND cms_stg_aa_id = s.cms_lsp_lmt_profile_id
	  				   AND is_valid = 'Y'
		AND source_id = 'QUAN');

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 6);
	commit;
																  
																  	  
	INSERT INTO stage_limit_profile (CMS_LSP_LMT_PROFILE_ID, 
									LLP_LE_ID, CIF_SOURCE_ID, LLP_LSP_ID, LLP_BCA_REF_NUM, 
									CMS_CUSTOMER_ID, LMT_PROFILE_TYPE, 
									SOURCE_ID, CMS_BCA_STATUS, UPDATE_STATUS_IND)
	(SELECT 
	CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_profile_seq), 2)) as BIGINT),
		CIF_ID, 'QUAN', 1, AA_NUMBER,  
		cms_customer_id, 'BANKING', 
		'QUAN', 'ACTIVE', 'I'						
	   FROM SI_TEMP_QUAN_CA020 t
	  WHERE cms_stg_aa_id IS NULL
	   AND IS_VALID = 'Y' group by CIF_ID, AA_NUMBER, ORI_LOC_ORG_CODE, cms_customer_id);
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 7);
	
	-------------------------------------
	-- Remove unused limit profile
	-- 
	--
	-------------------------------------
	
	lock table sci_lsp_lmt_profile in share mode;
	UPDATE sci_lsp_lmt_profile a SET (cms_bca_status, LAST_UPDATE_DATE, UPDATE_STATUS_IND) =
	('DELETED', current_timestamp, 'D')
	WHERE source_id = 'QUAN' AND cms_bca_status <> 'DELETED'
		AND EXISTS (SELECT '1' FROM SI_TEMP_QUAN_CA020 t
	  				 WHERE a.LLP_LE_ID = t.CIF_ID 
	  	and a.llp_bca_ref_num = t.aa_number AND is_valid = 'Y' 
	  	and a.cms_customer_id != t.cms_customer_id);
	
	
	lock table stage_limit_profile in share mode;
	UPDATE stage_limit_profile a SET (cms_bca_status, LAST_UPDATE_DATE, UPDATE_STATUS_IND) =
	('DELETED', current_timestamp, 'D')
	WHERE source_id = 'QUAN' AND cms_bca_status <> 'DELETED'
		AND EXISTS (SELECT '1' FROM SI_TEMP_QUAN_CA020 t
	  				 WHERE a.LLP_LE_ID = t.CIF_ID 
	  	and a.llp_bca_ref_num = t.aa_number AND is_valid = 'Y' 
	  	and a.cms_customer_id != t.cms_customer_id);
	
	  	
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------
	
	FOR cur_std_prod_type_code AS
		SELECT DISTINCT product_type_code code, product_type_desc desc,
			   'QUAN' source_id
		  FROM SI_TEMP_QUAN_CA020
		 WHERE LENGTH(product_type_code) > 0
		   AND LENGTH(product_type_desc) > 0
	DO
		CALL SI_AUTO_UPDATE_NEW_PRODUCT_TYPE(cur_std_prod_type_code.code, cur_std_prod_type_code.desc, cur_std_prod_type_code.source_id);
	END FOR;

	FOR cur_std_code AS
		SELECT DISTINCT ori_loc_org_code code, ori_loc_org_desc desc,
			   ori_loc_org_cat cat, 'QUAN' source_id
		  FROM SI_TEMP_QUAN_CA020
		 WHERE LENGTH(ori_loc_org_code) > 0
		   AND LENGTH(ori_loc_org_desc) > 0
		 UNION
		SELECT DISTINCT product_type_code code, product_type_desc desc,
			   product_type_cat cat, 'QUAN' source_id
		  FROM SI_TEMP_QUAN_CA020
		 WHERE LENGTH(product_type_code) > 0
		   AND LENGTH(product_type_desc) > 0
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 8);
	commit;
	
	------------------------------------------
	-- Temp Table
	-- SI_TEMP_QUAN_CA020
	-- populate limit profile id
	-- cms limit key - act and stg from trx
	-- 
	------------------------------------------

	CALL SI_RUNSTATS('SI_TEMP_QUAN_CA020');
	lock table SI_TEMP_QUAN_CA020 in share mode; 
	
	---------------------------------------
	-- update is_outer_lmt indicator
	---------------------------------------
	update SI_TEMP_QUAN_CA020
	set is_outer_lmt = 'Y'
	where outer_limit_id is null
	or outer_limit_id = ''
	or outer_limit_id = limit_id;
	
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 9);
	commit;
		 
	lock table SI_TEMP_QUAN_CA020 in exclusive mode; 
	---------------------------------------
	-- update limit profile id
	---------------------------------------	
	update SI_TEMP_QUAN_CA020
	set cms_limit_profile_id = 
		(select cms_lsp_lmt_profile_id
		from sci_lsp_lmt_profile
		where llp_bca_ref_num = aa_number
		AND source_id = 'QUAN' AND cms_bca_status = 'ACTIVE')
	where is_valid = 'Y';	
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 10);
	commit;

	CALL SI_RUNSTATS('SI_TEMP_QUAN_CA020');
	lock table SI_TEMP_QUAN_CA020 in share mode; 
	
	UPDATE SI_TEMP_QUAN_CA020 a SET (cms_act_lmt_id, cms_stg_lmt_id) =
	(SELECT reference_id, staging_reference_id
	   FROM sci_lsp_appr_lmts, transaction
	  WHERE reference_id = cms_lsp_appr_lmts_id
	    AND transaction_type = 'LIMIT'
	    AND source_id = 'QUAN'	
		AND lmt_id = a.limit_id	   
		AND is_valid = 'Y' 		
		)
	 WHERE is_valid = 'Y';	 		
		
	CALL SI_RUNSTATS('SI_TEMP_QUAN_CA020');
			
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 11);
	commit;
	
	-------------------------------------
	-- Actual Table
	-- SCI_LSP_APPR_LMTS
	-- OUTER LIMIT first then Inner Limit
	--
	-------------------------------------  
	
	
    lock table sci_lsp_appr_lmts in share mode; 
	
	UPDATE sci_lsp_appr_lmts a SET (CMS_LIMIT_PROFILE_ID, LMT_ID, 
									LMT_LE_ID, LMT_BCA_REF_NUM, 
									CMS_BKG_ORGANISATION, 
									LMT_PRD_TYPE_NUM, LMT_PRD_TYPE_VALUE, 
									LMT_FAC_TYPE_NUM, LMT_FAC_TYPE_VALUE,
									LMT_TYPE_NUM, LMT_TYPE_VALUE,
									LMT_EXPRY_DATE, LMT_CRRNCY_ISO_CODE, LMT_AMT, CMS_OUTSTANDING_AMT,
									SOURCE_ID, CMS_LIMIT_STATUS, UPDATE_STATUS_IND,
									LMT_LOAN_SECTOR_VALUE, DISBURSED_IND) = 
	(SELECT CMS_LIMIT_PROFILE_ID, LIMIT_ID, 
			CIF_ID, AA_NUMBER, 
			ORI_LOC_ORG_CODE,
			PRODUCT_TYPE_CAT, PRODUCT_TYPE_CODE, 
			'26', PRODUCT_TYPE_CODE, 
			'25','OUTER',
			EXPIRY_DATE, LIMIT_CURRENCY, LIMIT_AMT, OUTSTANDING_AMT,
			'QUAN', 'ACTIVE', 'U', 
			LOAN_SECTOR_CODE, DISBURSED_IND
	 FROM SI_TEMP_QUAN_CA020 t
	 WHERE t.limit_id = a.lmt_id
	 AND cms_act_lmt_id = a.cms_lsp_appr_lmts_id
	 and a.source_id = 'QUAN'
	 and is_outer_lmt = 'Y'
	 aND IS_VALID = 'Y'
	 )
	 WHERE a.source_id = 'QUAN'
	 and EXISTS (SELECT '1' 
	 				FROM SI_TEMP_QUAN_CA020 t
	  			WHERE a.lmt_id = limit_id
				 AND a.cms_lsp_appr_lmts_id = cms_act_lmt_id
					AND IS_VALID = 'Y'
					and is_outer_lmt = 'Y');
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 12);
	commit;
	
	lock table sci_lsp_appr_lmts in share mode; 
	INSERT INTO sci_lsp_appr_lmts (CMS_LSP_APPR_LMTS_ID, 
								   CMS_REF_ID, 
								   CMS_LIMIT_PROFILE_ID, LMT_ID, LMT_LE_ID, LMT_BCA_REF_NUM,
								   CMS_BKG_ORGANISATION, LMT_PRD_TYPE_NUM, LMT_PRD_TYPE_VALUE, 
								   LMT_FAC_TYPE_NUM, LMT_FAC_TYPE_VALUE,
								   LMT_TYPE_NUM, LMT_TYPE_VALUE,
								   LMT_EXPRY_DATE, LMT_CRRNCY_ISO_CODE, LMT_AMT, CMS_OUTSTANDING_AMT, 
								   SOURCE_ID, CMS_LIMIT_STATUS, UPDATE_STATUS_IND, 
								   LMT_LOAN_SECTOR_VALUE, DISBURSED_IND)
	(SELECT 
			CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT),
			CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT),
			CMS_LIMIT_PROFILE_ID, LIMIT_ID, CIF_ID, AA_NUMBER,
			ORI_LOC_ORG_CODE, PRODUCT_TYPE_CAT, PRODUCT_TYPE_CODE, 
			'26', PRODUCT_TYPE_CODE, 
			'25','OUTER', 
			EXPIRY_DATE, LIMIT_CURRENCY, LIMIT_AMT, OUTSTANDING_AMT,
			'QUAN', 'ACTIVE', 'I', 
			LOAN_SECTOR_CODE, DISBURSED_IND
	   FROM SI_TEMP_QUAN_CA020 t
	  WHERE 
	  cms_act_lmt_id is null
		AND (outer_limit_id IS NULL OR outer_limit_id = '' OR outer_limit_id = limit_id)
		AND IS_VALID = 'Y');

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 13);
	
	commit;				
		
	----------------------------------
	-- update outer limit id
	----------------------------------
	lock table SI_TEMP_QUAN_CA020 in share mode; 
	
	update SI_TEMP_QUAN_CA020
	set cms_outer_limit_id = 
		(select cms_lsp_appr_lmts_id
		from sci_lsp_appr_lmts
		where lmt_id = outer_limit_id  
		and source_id = 'QUAN'		
		)
	where is_valid = 'Y'
	and is_outer_lmt = 'N';
	
	CALL SI_RUNSTATS('SI_TEMP_QUAN_CA020');
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 14);
	commit;	
	CALL SI_RUNSTATS('sci_lsp_appr_lmts');
	-------------------------------------
	-- Actual Table
	-- SCI_LSP_APPR_LMTS
	-- INNER LIMIT
	--
	-------------------------------------
	lock table sci_lsp_appr_lmts in share mode; 
	UPDATE sci_lsp_appr_lmts a SET (LMT_ID, CMS_LIMIT_PROFILE_ID, CMS_OUTER_LMT_REF, 
									LMT_OUTER_LMT_ID, LMT_LE_ID, LMT_BCA_REF_NUM, 
									CMS_BKG_ORGANISATION, 
									LMT_PRD_TYPE_NUM, LMT_PRD_TYPE_VALUE, 
									LMT_FAC_TYPE_NUM, LMT_FAC_TYPE_VALUE,
									LMT_TYPE_NUM, LMT_TYPE_VALUE,
									LMT_EXPRY_DATE, LMT_CRRNCY_ISO_CODE, LMT_AMT, CMS_OUTSTANDING_AMT,
									SOURCE_ID, CMS_LIMIT_STATUS, UPDATE_STATUS_IND, 
									LMT_LOAN_SECTOR_VALUE, DISBURSED_IND) = 
	(SELECT limit_id, cms_limit_profile_id, outer_limit_id, 
			cms_outer_limit_id, CIF_ID, AA_NUMBER, 
			ORI_LOC_ORG_CODE,
			PRODUCT_TYPE_CAT, PRODUCT_TYPE_CODE, 
			'26', PRODUCT_TYPE_CODE, 
			'25', 'INNER', 
			EXPIRY_DATE, LIMIT_CURRENCY, LIMIT_AMT, OUTSTANDING_AMT,
			'QUAN', 'ACTIVE', 'U', 
			LOAN_SECTOR_CODE, DISBURSED_IND						
	   FROM SI_TEMP_QUAN_CA020 t
	  WHERE t.limit_id = a.lmt_id
	  AND cms_act_lmt_id = a.cms_lsp_appr_lmts_id
	  AND IS_VALID = 'Y'
		and is_outer_lmt = 'N'
	  )
	  WHERE EXISTS (SELECT '1' FROM SI_TEMP_QUAN_CA020
	  				 WHERE a.lmt_id = limit_id
					  AND cms_act_lmt_id = a.cms_lsp_appr_lmts_id
					 	 AND IS_VALID = 'Y'
						 and is_outer_lmt = 'N')
		and a.source_id = 'QUAN';
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 15);
	commit;		
	
	CALL SI_RUNSTATS('sci_lsp_appr_lmts');
	
	lock table sci_lsp_appr_lmts in share mode; 
	INSERT INTO sci_lsp_appr_lmts (CMS_LSP_APPR_LMTS_ID, 
								   CMS_REF_ID, 
								   CMS_LIMIT_PROFILE_ID, 
								   LMT_ID, CMS_OUTER_LMT_REF, 
								   LMT_OUTER_LMT_ID, 
								   LMT_LE_ID, LMT_BCA_REF_NUM, 
								   CMS_BKG_ORGANISATION, 
								   LMT_PRD_TYPE_NUM, LMT_PRD_TYPE_VALUE, 
								   LMT_FAC_TYPE_NUM, LMT_FAC_TYPE_VALUE,
								   LMT_TYPE_NUM, LMT_TYPE_VALUE,
								   LMT_EXPRY_DATE, LMT_CRRNCY_ISO_CODE, LMT_AMT, CMS_OUTSTANDING_AMT,
								   SOURCE_ID, CMS_LIMIT_STATUS, UPDATE_STATUS_IND, 
								   LMT_LOAN_SECTOR_VALUE, DISBURSED_IND)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT),
			(CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT)),
			cms_limit_profile_id,
			LIMIT_ID, outer_limit_id,
			cms_outer_limit_id,
			CIF_ID, AA_NUMBER, 
			ORI_LOC_ORG_CODE,
			PRODUCT_TYPE_CAT, PRODUCT_TYPE_CODE, 
			'26', PRODUCT_TYPE_CODE, 
			'25','INNER',
			EXPIRY_DATE, LIMIT_CURRENCY, LIMIT_AMT, OUTSTANDING_AMT,
			'QUAN', 'ACTIVE', 'I',
			LOAN_SECTOR_CODE, DISBURSED_IND	
	   FROM SI_TEMP_QUAN_CA020 t
	  WHERE cms_act_lmt_id IS NULL		
		and is_outer_lmt = 'N'
		AND IS_VALID = 'Y');
		
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 16);
		
	commit;
	-------------------------------------
	-- Staging Table
	-- STAGE_LIMIT
	-- OUTER LIMIT first then Inner Limit
	--
	-------------------------------------
	lock table stage_limit in share mode; 
	UPDATE stage_limit a SET (LMT_ID, CMS_LIMIT_PROFILE_ID, LMT_LE_ID, LMT_BCA_REF_NUM, 
							  CMS_BKG_ORGANISATION, 
							  LMT_PRD_TYPE_NUM, LMT_PRD_TYPE_VALUE, 
							  LMT_FAC_TYPE_NUM, LMT_FAC_TYPE_VALUE,
							  LMT_TYPE_NUM, LMT_TYPE_VALUE, 
							  LMT_EXPRY_DATE, LMT_CRRNCY_ISO_CODE, LMT_AMT, CMS_OUTSTANDING_AMT,
							  SOURCE_ID, CMS_LIMIT_STATUS, UPDATE_STATUS_IND,
							  LMT_LOAN_SECTOR_VALUE, DISBURSED_IND) = 
	(SELECT LIMIT_ID, CMS_LIMIT_PROFILE_ID, CIF_ID, AA_NUMBER, 
			ORI_LOC_ORG_CODE,
			PRODUCT_TYPE_CAT, PRODUCT_TYPE_CODE, 
			'26', PRODUCT_TYPE_CODE, 
			'25', 'OUTER',
			EXPIRY_DATE, LIMIT_CURRENCY, LIMIT_AMT, OUTSTANDING_AMT,
			'QUAN', 'ACTIVE', 'U',
			LOAN_SECTOR_CODE, DISBURSED_IND
	   FROM SI_TEMP_QUAN_CA020 t
	  WHERE 
	 t.limit_id = a.lmt_id 
	    AND a.cms_lsp_appr_lmts_id = t.cms_stg_lmt_id
	    AND t.IS_VALID = 'Y'
		AND t.is_outer_lmt = 'Y' 
	  )
	  WHERE EXISTS (SELECT '1' FROM SI_TEMP_QUAN_CA020
	  				 WHERE limit_id = a.lmt_id
	  				   AND cms_stg_lmt_id = a.cms_lsp_appr_lmts_id
	 				   AND is_valid = 'Y')
		AND lmt_outer_lmt_id IS NULL 	
		and source_id = 'QUAN';  
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 17);
	commit;	
		
	lock table stage_limit in share mode; 	
	INSERT INTO stage_limit (CMS_LSP_APPR_LMTS_ID, LMT_ID, 
	                         CMS_LIMIT_PROFILE_ID, LMT_LE_ID, LMT_BCA_REF_NUM, 
							 CMS_BKG_ORGANISATION, 
							 LMT_PRD_TYPE_NUM, LMT_PRD_TYPE_VALUE, 
							 LMT_FAC_TYPE_NUM, LMT_FAC_TYPE_VALUE,
							 LMT_TYPE_NUM, LMT_TYPE_VALUE, 
							 LMT_EXPRY_DATE, LMT_CRRNCY_ISO_CODE, LMT_AMT, CMS_OUTSTANDING_AMT,
							 SOURCE_ID, CMS_LIMIT_STATUS, UPDATE_STATUS_IND,
							 LMT_LOAN_SECTOR_VALUE, DISBURSED_IND)
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT), LIMIT_ID, 
		CMS_LIMIT_PROFILE_ID, CIF_ID, AA_NUMBER,
		ORI_LOC_ORG_CODE,
		PRODUCT_TYPE_CAT, PRODUCT_TYPE_CODE, 
		'26', PRODUCT_TYPE_CODE, 
		'25','OUTER',
		EXPIRY_DATE, LIMIT_CURRENCY, LIMIT_AMT, OUTSTANDING_AMT,
		'QUAN', 'ACTIVE', 'I',
		LOAN_SECTOR_CODE, DISBURSED_IND	
	  FROM SI_TEMP_QUAN_CA020 t
	  WHERE 
	  cms_stg_lmt_id is null
	  AND IS_VALID = 'Y'
      AND (outer_limit_id IS NULL OR outer_limit_id = '' OR outer_limit_id = limit_id));
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 18);
	commit;

	----------------------------------
	-- update outer limit id
	----------------------------------
	CALL SI_RUNSTATS('SI_TEMP_QUAN_CA020');
	
	lock table SI_TEMP_QUAN_CA020 in share mode; 	
	
	update SI_TEMP_QUAN_CA020
	set cms_stg_outer_limit_id = 
		(select s.cms_lsp_appr_lmts_id
		from stage_limit s, sci_lsp_appr_lmts a, TRANSACTION trx
		where 
		a.lmt_id = outer_limit_id
		AND a.source_id = 'QUAN'	
		AND s.source_id = 'QUAN'		
		AND trx.reference_id = a.cms_lsp_appr_lmts_id
		AND trx.staging_reference_id = s.cms_lsp_appr_lmts_id
		AND trx.transaction_type = 'LIMIT' )
	where is_valid = 'Y'
	and is_outer_lmt = 'N';
		
	CALL SI_RUNSTATS('SI_TEMP_QUAN_CA020');
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 19);
	commit;	
	-------------------------------------
	-- Staging Table
	-- STAGE_LIMIT
	-- INNER LIMIT
	--
	-------------------------------------
	lock table stage_limit in share mode; 
	UPDATE stage_limit a SET (LMT_ID, CMS_LIMIT_PROFILE_ID,
							  CMS_OUTER_LMT_REF, LMT_OUTER_LMT_ID, 
							  LMT_LE_ID, LMT_BCA_REF_NUM, 
							  CMS_BKG_ORGANISATION, 
							  LMT_PRD_TYPE_NUM, LMT_PRD_TYPE_VALUE, 
							  LMT_FAC_TYPE_NUM, LMT_FAC_TYPE_VALUE,
							  LMT_TYPE_NUM, LMT_TYPE_VALUE,
							  LMT_EXPRY_DATE, LMT_CRRNCY_ISO_CODE, LMT_AMT, CMS_OUTSTANDING_AMT,
							  SOURCE_ID, CMS_LIMIT_STATUS, UPDATE_STATUS_IND,
							  LMT_LOAN_SECTOR_VALUE, DISBURSED_IND) = 
	(SELECT limit_id,  CMS_LIMIT_PROFILE_ID,
			 outer_limit_id, cms_stg_outer_limit_id,
			CIF_ID, AA_NUMBER,  
			ORI_LOC_ORG_CODE,
			PRODUCT_TYPE_CAT, PRODUCT_TYPE_CODE, 
			'26', PRODUCT_TYPE_CODE, 
			'25', 'INNER',
			EXPIRY_DATE, LIMIT_CURRENCY, LIMIT_AMT, OUTSTANDING_AMT,
			'QUAN', 'ACTIVE', 'I',
			LOAN_SECTOR_CODE, DISBURSED_IND						
	   FROM SI_TEMP_QUAN_CA020 t
	  WHERE t.limit_id = a.lmt_id
	   AND a.cms_lsp_appr_lmts_id = t.cms_stg_lmt_id
		and a.source_id = 'QUAN'
	  AND IS_VALID = 'Y'
		and is_outer_lmt = 'N'	
	  )
	   WHERE EXISTS (SELECT '1' FROM SI_TEMP_QUAN_CA020
					 WHERE limit_id = a.lmt_id
					   AND a.cms_lsp_appr_lmts_id = cms_stg_lmt_id
					   AND is_valid = 'Y')
     AND lmt_outer_lmt_id IS NOT NULL				   
	 and source_id = 'QUAN'; 
	 
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 20);
	commit;	 
	
	lock table stage_limit in share mode; 
	INSERT INTO stage_limit (CMS_LSP_APPR_LMTS_ID, 
								LMT_ID, CMS_LIMIT_PROFILE_ID, 
								CMS_OUTER_LMT_REF, LMT_OUTER_LMT_ID, 
								LMT_LE_ID, LMT_BCA_REF_NUM,  
								CMS_BKG_ORGANISATION, 
								LMT_PRD_TYPE_NUM, LMT_PRD_TYPE_VALUE, 
								LMT_FAC_TYPE_NUM, LMT_FAC_TYPE_VALUE,
								LMT_TYPE_NUM, LMT_TYPE_VALUE,
								LMT_EXPRY_DATE, LMT_CRRNCY_ISO_CODE, LMT_AMT, CMS_OUTSTANDING_AMT,
								SOURCE_ID, CMS_LIMIT_STATUS, UPDATE_STATUS_IND,
								LMT_LOAN_SECTOR_VALUE, DISBURSED_IND)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT),
					limit_id, CMS_LIMIT_PROFILE_ID,
			 outer_limit_id, cms_stg_outer_limit_id,
			CIF_ID, AA_NUMBER, 
			ORI_LOC_ORG_CODE,
			PRODUCT_TYPE_CAT, PRODUCT_TYPE_CODE, 
			'26', PRODUCT_TYPE_CODE, 
			'25', 'INNER',
			EXPIRY_DATE, LIMIT_CURRENCY, LIMIT_AMT, OUTSTANDING_AMT,
			'QUAN', 'ACTIVE', 'I',
			LOAN_SECTOR_CODE, DISBURSED_IND
	   FROM SI_TEMP_QUAN_CA020 t 
	   WHERE cms_stg_lmt_id IS NULL
	   and IS_VALID = 'Y'
	   and is_outer_lmt = 'N');
		 
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 21);
	commit;	
	
	
	-------------------------------------
	-- Remove unused limit 
	-- 
	--
	-------------------------------------
	
	lock table sci_lsp_appr_lmts in share mode;
	UPDATE sci_lsp_appr_lmts a SET (cms_limit_status, LAST_UPDATE_DATE, UPDATE_STATUS_IND)=
	('DELETED', current_timestamp, 'D')
	WHERE source_id = 'QUAN' AND cms_limit_status <> 'DELETED'
		AND EXISTS (SELECT '1' FROM SI_TEMP_QUAN_CA020 t WHERE
	  				 t.limit_id = a.lmt_id
					   AND a.cms_lsp_appr_lmts_id != t.cms_act_lmt_id 
					   AND is_valid = 'Y');
	
	
	lock table stage_limit in share mode;
	UPDATE stage_limit a SET (cms_limit_status, LAST_UPDATE_DATE, UPDATE_STATUS_IND)=
	('DELETED', current_timestamp, 'D')
	WHERE source_id = 'QUAN' AND cms_limit_status <> 'DELETED'
		AND EXISTS (SELECT '1' FROM SI_TEMP_QUAN_CA020 t WHERE
	  				 t.limit_id = a.lmt_id
					   AND a.cms_lsp_appr_lmts_id != t.cms_stg_lmt_id 
					   AND is_valid = 'Y');
	
	
	
	---------------------------------------
	-- Tag DELETED for non-exist records
	-- Actual table
	-- sci_lsp_lmt_profile
	--
	---------------------------------------
	lock table sci_lsp_lmt_profile in share mode;
	UPDATE sci_lsp_lmt_profile a SET (cms_bca_status, LAST_UPDATE_DATE, UPDATE_STATUS_IND) =
	('DELETED', current_timestamp, 'D')
	WHERE source_id = 'QUAN'
		AND cms_bca_status <> 'DELETED'
		AND NOT EXISTS (SELECT '1' FROM si_temp_quan_ca020 
	  	WHERE llp_bca_ref_num = aa_number AND is_valid = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 22);
	commit;

	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Staging Table
	-- STAGE_LIMIT_PROFILE
	--
	-------------------------------------
	lock table stage_limit_profile in share mode;
	UPDATE stage_limit_profile s SET (cms_bca_status, LAST_UPDATE_DATE, UPDATE_STATUS_IND) =
	('DELETED', current_timestamp, 'D')
  WHERE source_id = 'QUAN'
		AND cms_bca_status <> 'DELETED'
		AND NOT EXISTS (SELECT '1' FROM si_temp_quan_ca020 
				WHERE llp_bca_ref_num = aa_number AND is_valid = 'Y')
		AND cms_lsp_lmt_profile_id IN (SELECT staging_reference_id
										FROM transaction
										WHERE transaction_type = 'LIMITPROFILE'
											AND reference_id IN (SELECT cms_lsp_lmt_profile_id 
																	FROM sci_lsp_lmt_profile a
																	WHERE a.llp_bca_ref_num = s.llp_bca_ref_num
																		AND a.source_id = 'QUAN'));
																		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 23);
	commit;
	
	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Actual Table
	-- SCI_LSP_APPR_LMTS
	--
	-------------------------------------
	lock table sci_lsp_appr_lmts in share mode;
	UPDATE sci_lsp_appr_lmts a SET (cms_limit_status, LAST_UPDATE_DATE, UPDATE_STATUS_IND)=
	('DELETED', current_timestamp, 'D')
  WHERE source_id = 'QUAN'
		AND cms_limit_status = 'ACTIVE'
		AND NOT EXISTS (SELECT '1' from SI_TEMP_QUAN_CA020 t
			WHERE t.LIMIT_ID=a.LMT_ID AND t.is_valid = 'Y');		

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 24);
	commit;

	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Staging Table
	-- STAGE_LIMIT
	--
	-------------------------------------
	lock table stage_limit in share mode;
	UPDATE stage_limit a SET (cms_limit_status, LAST_UPDATE_DATE, UPDATE_STATUS_IND)=
	('DELETED', current_timestamp, 'D')
	 	WHERE source_id = 'QUAN'
			AND cms_limit_status = 'ACTIVE'
			AND NOT EXISTS (SELECT '1' from SI_TEMP_QUAN_CA020 t
				WHERE t.LIMIT_ID = a.LMT_ID AND t.is_valid = 'Y')
			AND CMS_LSP_APPR_LMTS_ID IN (select staging_reference_id from transaction
								where reference_id IN (select CMS_LSP_APPR_LMTS_ID 
														from sci_lsp_appr_lmts lmt
													where lmt.LMT_ID = a.LMT_ID
													and lmt.source_id = 'QUAN')
										and transaction_type = 'LIMIT');
		
  CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_QUAN_CA020', 'QUAN', 0);
  commit;
		
END@


CREATE PROCEDURE SI_RUN_ALL_QUAN
	LANGUAGE SQL
BEGIN
	DECLARE v_count INTEGER;

	SELECT count(*) into v_count FROM SI_TEMP_QUAN_CU008;
	IF v_count > 0 THEN
		CALL SI_VALIDATE_TEMP_QUAN_CU008;
		CALL SI_RUN_TEMP_QUAN_CU008;
		CALL UTIL_TRUNCATE_TABLE('SI_TEMP_QUAN_CU008');
	END IF;
	
	SELECT count(*) into v_count FROM SI_TEMP_QUAN_CU002;
	IF v_count > 0 THEN
		CALL SI_VALIDATE_TEMP_QUAN_CU002;
		CALL SI_RUN_TEMP_QUAN_CU002;
		CALL UTIL_TRUNCATE_TABLE('SI_TEMP_QUAN_CU002');
	END IF;
	
	SELECT count(*) into v_count FROM SI_TEMP_QUAN_CA020;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_QUAN_CA020;
		CALL SI_RUN_TEMP_QUAN_CA020;
		CALL UTIL_TRUNCATE_TABLE('SI_TEMP_QUAN_CA020');
	END IF;
	
	CALL SI_AUTO_CREATE_TRANSACTION;
	
END@
