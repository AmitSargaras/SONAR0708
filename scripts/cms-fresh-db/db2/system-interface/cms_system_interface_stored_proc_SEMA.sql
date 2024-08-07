--SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,ABCLIMS@
DROP PROCEDURE SI_RUN_TEMP_SEMA_CU004@
DROP PROCEDURE SI_RUN_TEMP_SEMA_CU002@
DROP PROCEDURE SI_RUN_TEMP_SEMA_CA001@
DROP PROCEDURE SI_RUN_TEMP_SEMA_CA012@
DROP PROCEDURE SI_RUN_TEMP_SEMA_CO020@
DROP PROCEDURE SI_RUN_TEMP_SEMA_DELETE@
DROP PROCEDURE SI_RUN_ALL_SEMA@

CREATE PROCEDURE SI_RUN_TEMP_SEMA_CU004
	LANGUAGE SQL
BEGIN
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU004', 'SEMA', 1);

	UPDATE si_temp_sema_cu004 a SET cms_le_main_profile_id = 
	(SELECT cms_le_main_profile_id FROM sci_le_main_profile
	  WHERE lmp_le_id = a.cif_id
		AND source_id = 'SEMA')
	 WHERE is_valid = 'Y';
	 
	 call si_runstats ('SI_TEMP_SEMA_CU004');
	 
	 CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU004', 'SEMA', 2);
	commit;
	-------------------------------------
	-- Actual Table
	-- SCI_LE_MAIN_PROFILE
	--
	-------------------------------------	
    lock table sci_le_main_profile in share mode; 		
	UPDATE sci_le_main_profile a SET (LMP_LE_ID, LMP_LONG_NAME, LMP_SHORT_NAME,
									--LMP_INC_CNTRY_ISO_CODE, LMP_INC_NUM_TEXT,
									LMP_INC_CNTRY_ISO_CODE, LMP_ID_NUMBER,
									LMP_SECOND_ID_TYPE_NUM, LMP_SECOND_ID_TYPE_VALUE, 
									--LMP_ID_OLD_NUM, LMP_SGMNT_CODE_NUM, LMP_SGMNT_CODE_VALUE,
									LMP_SECOND_ID_NUMBER, LMP_SGMNT_CODE_NUM, LMP_SGMNT_CODE_VALUE,
									LMP_LEGAL_CONST_NUM, LMP_LEGAL_CONST_VALUE,
									LMP_ID_TYPE_NUM, LMP_ID_TYPE_VALUE, LMP_INC_DATE,
									LMP_TYPE_NUM, LMP_TYPE_VALUE, LMP_REL_START_DATE,
									CMS_BLACK_LISTED_IND, 
									LMP_INCOME_CODE_NUM, LMP_INCOME_CODE_VALUE,
									UPDATE_STATUS_IND, SOURCE_ID) =
		(SELECT 
			CIF_ID, CUST_NAME_LONG, CUST_NAME_SHORT,
			ID_ISSUE_COUNTRY, ID_NUMBER, 
			SECONDARY_ID_TYPE_CAT, SECONDARY_ID_TYPE_CODE, SECONDARY_ID_NUMBER, 
			CUST_SEGMENT_CAT, CUST_SEGMENT_CODE, 
			CUST_CLASS_CAT, CUST_CLASS_CODE,
			ID_TYPE_CAT, ID_TYPE_CODE, ID_ISSUE_DATE,
			CUST_TYPE_CAT, CUST_TYPE_CODE, CUST_START_DATE,
			BLACKLISTED, INCOME_GROUP_CAT, INCOME_GROUP,
			'U', 'SEMA' 
		FROM SI_TEMP_SEMA_CU004 t 
		WHERE 
		--t.cif_id = a.lmp_le_id
		t.cms_le_main_profile_id = a.cms_le_main_profile_id
			AND IS_VALID = 'Y'			
			)
	WHERE 
	EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CU004 
			   WHERE cms_le_main_profile_id = a.cms_le_main_profile_id
			   AND IS_VALID = 'Y')
	AND source_id = 'SEMA';
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU004', 'SEMA', 3);
	commit;
	
	------------------------------------------
	-- ENDED
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
	lock table sci_le_main_profile in exclusive mode; 		
	INSERT INTO sci_le_main_profile (CMS_LE_MAIN_PROFILE_ID, LMP_LE_ID, LMP_LONG_NAME, LMP_SHORT_NAME,			
									--LMP_INC_CNTRY_ISO_CODE, LMP_INC_NUM_TEXT,
									LMP_INC_CNTRY_ISO_CODE, LMP_ID_NUMBER,
									LMP_SECOND_ID_TYPE_NUM, 
									--LMP_SECOND_ID_TYPE_VALUE, LMP_ID_OLD_NUM,
									LMP_SECOND_ID_TYPE_VALUE, LMP_SECOND_ID_NUMBER,
									LMP_SGMNT_CODE_NUM, 
									LMP_SGMNT_CODE_VALUE, 
									LMP_LEGAL_CONST_NUM, LMP_LEGAL_CONST_VALUE,
									LMP_ID_TYPE_NUM, LMP_ID_TYPE_VALUE, LMP_INC_DATE,
									LMP_TYPE_NUM, LMP_TYPE_VALUE, LMP_REL_START_DATE,
									CMS_BLACK_LISTED_IND, 
									LMP_INCOME_CODE_NUM, LMP_INCOME_CODE_VALUE,
									UPDATE_STATUS_IND, SOURCE_ID)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR legal_entity_seq), 2)) as BIGINT), 
			CIF_ID, CUST_NAME_LONG, CUST_NAME_SHORT, 				
			ID_ISSUE_COUNTRY, ID_NUMBER, SECONDARY_ID_TYPE_CAT, 
			SECONDARY_ID_TYPE_CODE, SECONDARY_ID_NUMBER,
			CUST_SEGMENT_CAT, CUST_SEGMENT_CODE, 
			CUST_CLASS_CAT, CUST_CLASS_CODE,
			ID_TYPE_CAT, ID_TYPE_CODE, ID_ISSUE_DATE,
			CUST_TYPE_CAT, CUST_TYPE_CODE, CUST_START_DATE,
			BLACKLISTED, INCOME_GROUP_CAT, INCOME_GROUP, 'I', 'SEMA' 
	 FROM SI_TEMP_SEMA_CU004 t 
	 WHERE 
--	 (t.UPDATE_STATUS_IND = 'U' or u.update_status_ind is null) 
	 --AND 
	 IS_VALID = 'Y' 
	 AND t.cms_le_main_profile_id IS NULL);
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU004', 'SEMA', 4);
	commit;
	
	-------------------------------------
	-- Temp Table
	-- si_temp_sema_cu004
	-- populate main profile id
	--
	-------------------------------------
		
	UPDATE si_temp_sema_cu004 a SET cms_le_main_profile_id = 
	(SELECT cms_le_main_profile_id FROM sci_le_main_profile
	  WHERE lmp_le_id = a.cif_id
		AND source_id = 'SEMA')
	 WHERE is_valid = 'Y';
	 
	 CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU004', 'SEMA', 5);
	commit;
	-------------------------------------
	-- Actual Table
	-- SCI_LE_ISIC_DTL
	--
	-------------------------------------
	
	lock table sci_le_isic_dtl in share mode; 		
	UPDATE sci_le_isic_dtl a 
	SET 
	(LID_LE_ID, LID_ISIC_CODE_NUM, LID_ISIC_CODE_VALUE, 
	UPDATE_STATUS_IND, CMS_LE_MAIN_PROFILE_ID) =
		(SELECT cif_id, isic_cat, isic_code, 'U', 
			cms_le_main_profile_id
		 FROM SI_TEMP_SEMA_CU004 t
		 WHERE t.cms_le_main_profile_id = a.cms_le_main_profile_id			
			and is_valid = 'Y')
	 WHERE exists
	 		(select '1'
			from si_temp_sema_cu004 t
			where t.cms_le_main_profile_id = a.cms_le_main_profile_id			
			and is_valid = 'Y');
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU004', 'SEMA', 6);
	commit;
	lock table sci_le_isic_dtl in share mode; 				
	INSERT INTO sci_le_isic_dtl (CMS_LE_ISIC_DTL_ID, LID_LE_ID, LID_ISIC_TYPE_NUM, LID_ISIC_TYPE_VALUE, 
								LID_ISIC_CODE_NUM, LID_ISIC_CODE_VALUE, 
								UPDATE_STATUS_IND,  CMS_LE_MAIN_PROFILE_ID)
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR isic_code_seq), 2)) as BIGINT), 
			cif_id, '15', 'ISIC', isic_cat, isic_code, 'I', 
			CMS_LE_MAIN_PROFILE_ID
	 FROM SI_TEMP_SEMA_CU004 t 	 	
	 WHERE 
	 --t.UPDATE_STATUS_IND = 'U' AND 
	 IS_VALID = 'Y'
	 AND NOT EXISTS (SELECT '1' FROM sci_le_isic_dtl isic
	  					 WHERE lid_le_id = t.cif_id
	  					   AND isic.cms_le_main_profile_id = t.cms_le_main_profile_id)
		AND is_valid = 'Y');	
	
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU004', 'SEMA', 7);
	commit;
	
	-------------------------------------
	-- Temp Table
	-- si_temp_sema_cu004
	-- populate sub profile id
	--
	-------------------------------------
	
	UPDATE si_temp_sema_cu004 a SET cms_le_sub_profile_id = 
	(SELECT cms_le_sub_profile_id FROM sci_le_sub_profile
	  WHERE lsp_le_id = a.cif_id
		AND cms_le_main_profile_id = a.cms_le_main_profile_id)
	 WHERE is_valid = 'Y';
	 
	 CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU004', 'SEMA', 8);
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
		    AND source_id = 'SEMA'
		  )
	WHERE exists
		(select '1'
		 from si_temp_sema_cu004 
		     WHERE cif_id = a.lsp_le_id
	  				   AND a.cms_le_sub_profile_id = cms_le_sub_profile_id
	  				   AND a.cms_le_main_profile_id = cms_le_main_profile_id
	  				   AND is_valid = 'Y');
	  
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU004', 'SEMA', 9);
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
	    AND source_id = 'SEMA');

	
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU004', 'SEMA', 10);
	commit;
	
	-------------------------------------
	-- Actual Table
	-- SCI_LSP_OFF_ADDR
	--
	-------------------------------------
	lock table sci_le_reg_addr in share mode; 			
	
	UPDATE sci_le_reg_addr a SET (lra_type_num, lra_type_value, lra_addr_line_1,
									lra_addr_line_2, lra_addr_line_3, lra_addr_line_4, lra_post_code, UPDATE_STATUS_IND) =
	(SELECT PRIMARY_ADD_TYPE_CAT, PRIMARY_ADD_TYPE_CODE, PRIMARY_ADD_1, PRIMARY_ADD_2, 
			PRIMARY_ADD_3, PRIMARY_ADD_4, PRIMARY_POSTCODE, 'U'
	   FROM SI_TEMP_SEMA_CU004 t
	  WHERE t.cif_id = a.lra_le_id
	    AND a.cms_le_main_profile_id = t.cms_le_main_profile_id
		and t.PRIMARY_ADD_TYPE_CODE = a.lra_type_value
		and is_valid = 'Y'
	  )
	 WHERE EXISTS 
 	   (SELECT '1'
    	FROM SI_TEMP_SEMA_CU004 
    	WHERE cif_id = a.lra_le_id
	 				  AND a.lra_type_value = PRIMARY_ADD_TYPE_CODE
	 				  AND a.cms_le_main_profile_id = cms_le_main_profile_id
	 				  AND is_valid = 'Y');
			
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU004', 'SEMA', 11);
	commit;			
	lock table sci_le_reg_addr in share mode; 		
	INSERT INTO sci_le_reg_addr (cms_le_reg_addr_id, lra_le_id, 
								lra_type_num, lra_type_value, 
								lra_addr_line_1, lra_addr_line_2, 
								lra_addr_line_3, lra_addr_line_4, 
								lra_post_code, cms_le_main_profile_id,
								UPDATE_STATUS_IND )
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR contact_seq), 2)) as BIGINT),
			cif_id, PRIMARY_ADD_TYPE_CAT, PRIMARY_ADD_TYPE_CODE, PRIMARY_ADD_1, PRIMARY_ADD_2, 
			PRIMARY_ADD_3, PRIMARY_ADD_4, PRIMARY_POSTCODE,
		   cms_le_main_profile_id, 'I'
	  FROM SI_TEMP_SEMA_CU004 t
	  WHERE 
	  NOT EXISTS (SELECT '1' FROM sci_le_reg_addr addr
	  					 WHERE addr.cms_le_main_profile_id = t.cms_le_main_profile_id
							 and t.PRIMARY_ADD_TYPE_CODE = addr.lra_type_value)
	AND t.IS_VALID = 'Y'     
	and PRIMARY_ADD_TYPE_CODE is not null
	and PRIMARY_ADD_TYPE_CODE <> '');

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU004', 'SEMA', 12);
	commit;
      
	lock table sci_le_reg_addr in share mode; 		 					  
	UPDATE sci_le_reg_addr a SET (lra_type_num, lra_type_value, lra_addr_line_1,
									lra_addr_line_2, lra_addr_line_3, lra_addr_line_4, lra_post_code, UPDATE_STATUS_IND) =
	(SELECT secondary_add_type_cat, secondary_add_type_code, secondary_add_1, secondary_add_2, 
			secondary_add_3, SECONDARY_ADD_4, secondary_postcode, 'U'
	  FROM SI_TEMP_SEMA_CU004 t
	  WHERE t.cif_id = a.lra_le_id
	    AND a.cms_le_main_profile_id = t.cms_le_main_profile_id
		and t.SECONDARY_ADD_TYPE_CODE = a.lra_type_value
		and is_valid = 'Y'
	 )
	WHERE  EXISTS 
 	   (SELECT '1'
    	FROM SI_TEMP_SEMA_CU004 
    	WHERE cif_id = a.lra_le_id
	 				  AND a.lra_type_value = secondary_add_type_code
	 				  AND a.cms_le_main_profile_id = cms_le_main_profile_id
	 				  AND is_valid = 'Y');
	  
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU004', 'SEMA', 13);
	commit;
	lock table sci_le_reg_addr in share mode; 										  
	INSERT INTO sci_le_reg_addr (cms_le_reg_addr_id, lra_le_id, 
								lra_type_num, lra_type_value, 
								lra_addr_line_1, lra_addr_line_2, 
								lra_addr_line_3, lra_addr_line_4, 
								lra_post_code, cms_le_main_profile_id, UPDATE_STATUS_IND)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR contact_seq), 2)) as BIGINT),
			cif_id, secondary_add_type_cat, secondary_add_type_code, secondary_add_1, secondary_add_2, secondary_add_3, SECONDARY_ADD_4,
			secondary_postcode, 
			cms_le_main_profile_id, 'I'
	   FROM SI_TEMP_SEMA_CU004 t
	  WHERE NOT EXISTS (SELECT '1' FROM sci_le_reg_addr addr
	  					 WHERE addr.cms_le_main_profile_id = t.cms_le_main_profile_id
							 and t.SECONDARY_ADD_TYPE_CODE = addr.lra_type_value)
	   AND IS_VALID = 'Y' 
	   and secondary_add_type_code is not null
       and secondary_add_type_code <> '');	
	   
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU004', 'SEMA', 14);
	commit;
	
	------------------------------------------
	-- Update Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
   FOR cur_lsp_key AS
		SELECT cms_le_sub_profile_id trx_ref_id, 'CUSTOMER' trx_type
		  FROM sci_le_sub_profile a
		 WHERE EXISTS (SELECT '1' FROM si_temp_sema_cu004 
	  				 	WHERE cif_id = a.lsp_le_id
		  				  AND a.cms_le_sub_profile_id = cms_le_sub_profile_id
		  				  AND a.cms_le_main_profile_id = cms_le_main_profile_id
	  				   	  AND is_valid = 'Y')
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_lsp_key.trx_ref_id, cur_lsp_key.trx_type);
	END FOR;
	
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU004', 'SEMA', 0);
END
@

CREATE PROCEDURE SI_RUN_TEMP_SEMA_CU002
	LANGUAGE SQL
BEGIN

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU002', 'SEMA', 1);
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT credit_grade_value code, credit_grade_value desc,
			   credit_grade_value_cat cat, 'SEMA' source_id
		  FROM SI_TEMP_SEMA_CU002
		 WHERE LENGTH(credit_grade_value) > 0
		 AND IS_VALID = 'Y'
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU002', 'SEMA', 2);
	
	-------------------------------------
	-- Temp Table
	-- si_temp_sema_cu002
	-- populate main profile id
	--
	-------------------------------------

	UPDATE si_temp_sema_cu002 a SET cms_le_main_profile_id = 
	(SELECT cms_le_main_profile_id FROM sci_le_main_profile
	  WHERE lmp_le_id = a.cif_id
		AND source_id = 'SEMA')
	 WHERE is_valid = 'Y';
	 
	 CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU002', 'SEMA', 3);
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
	  FROM SI_TEMP_SEMA_CU002 t
	  WHERE t.cif_id = a.lcg_le_id
	  AND IS_VALID = 'Y'	 
		)
	  WHERE exists (SELECT '1' 
						  FROM SI_TEMP_SEMA_CU002 
						 WHERE cif_id = lcg_le_id
						   AND cms_le_main_profile_id = a.cms_main_profile_id
						   AND IS_VALID = 'Y'
							);		

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU002', 'SEMA', 4);
	commit;
										 
	INSERT INTO sci_le_credit_grade 
	(cms_le_credit_grade_id, lcg_le_id, lcg_crdt_grade_type_num,
	lcg_crdt_grade_type_value, lcg_crdt_grade_code_num, lcg_crdt_grade_code_value,
	lcg_crdt_grade_start_date, UPDATE_STATUS_IND, cms_main_profile_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR credit_grade_seq), 2)) as BIGINT),
			cif_id, credit_grade_type_cat, credit_grade_type, credit_grade_value_cat, credit_grade_value, 
			credit_grade_effective_date, 'I', 
			cms_le_main_profile_id
	  FROM SI_TEMP_SEMA_CU002 t
	  WHERE 
	  --t.UPDATE_STATUS_IND = 'U' 
	  --AND 		
		NOT EXISTS (SELECT '1' FROM sci_le_credit_grade cg
	  					 WHERE lcg_le_id = t.cif_id
	  					   AND t.cms_le_main_profile_id = cg.cms_main_profile_id)
		AND is_valid = 'Y');								 

						 
  CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CU002', 'SEMA', 0);
END
@

CREATE PROCEDURE SI_RUN_TEMP_SEMA_CA001
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA001', 'SEMA', 1);
	
	------------------------------------------
	-- Temp Table
	-- si_temp_sema_ca002
	-- populate sub profile id - customer id
	-- cms bca key - act and stg from trx
	-- 
	------------------------------------------

	UPDATE si_temp_sema_ca001 a SET cms_customer_id = 
	(SELECT cms_le_sub_profile_id 
	   FROM sci_le_sub_profile sp, sci_le_main_profile mp
	  WHERE lsp_le_id = a.cif_id
	    AND lmp_le_id = a.cif_id
	    AND sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
		AND source_id = 'SEMA')
	 WHERE is_valid = 'Y';
	 
	  CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA001', 'SEMA', 3);
	commit;
	
	UPDATE si_temp_sema_ca001 a SET (cms_act_aa_id, cms_stg_aa_id) =
	(SELECT reference_id, staging_reference_id
	   FROM sci_lsp_lmt_profile, transaction
	  WHERE reference_id = cms_lsp_lmt_profile_id
	    AND transaction_type = 'LIMITPROFILE'
	    AND llp_bca_ref_num = a.aa_number
	    AND source_id = 'SEMA')
	 WHERE is_valid = 'Y';
	 
	 CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA001', 'SEMA', 4);
	commit;
	-------------------------------------
	-- Actual Table
	-- SCI_LSP_LMT_PROFILE
	--
	-------------------------------------

	UPDATE sci_lsp_lmt_profile a SET (LLP_LE_ID, 
									CIF_SOURCE_ID, LLP_LSP_ID, 
									LLP_BCA_REF_NUM, CMS_BCA_JOINT_IND, 
									LLP_BCA_REF_APPR_DATE, 
									CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION, 
									LLP_NEXT_ANNL_RVW_DATE, 
									LMT_PROFILE_TYPE, SOURCE_ID, CMS_BCA_STATUS, UPDATE_STATUS_IND) =
	(SELECT CIF_ID, CIF_SOURCE, 1, AA_NUMBER, JOINT_BORROWER_IND, 
		AA_APPROVED_DATE, ORI_LOC_COUNTRY, ORI_LOC_ORG_CODE,
		ANNUAL_REVIEW_DATE,  
		'BANKING', 'SEMA', 'ACTIVE', 'U'
	   FROM SI_TEMP_SEMA_CA001 t
	  WHERE t.aa_number = a.llp_bca_ref_num
	  AND a.cms_customer_id = t.cms_customer_id
	  AND IS_VALID = 'Y'
		and source_id = 'SEMA'	 
	  )
	  WHERE EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CA001 
	  				 WHERE LLP_BCA_REF_NUM = AA_NUMBER
					  AND cms_customer_id = a.cms_customer_id
	  				   AND a.cms_lsp_lmt_profile_id = cms_act_aa_id
					 AND IS_VALID = 'Y')
	  	AND source_id = 'SEMA';

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA001', 'SEMA', 5);
	commit;
	  		
	------------------------------------------
	-- Update Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
	    							      
	FOR cur_llp_key AS
		SELECT cms_lsp_lmt_profile_id trx_ref_id, 'LIMITPROFILE' trx_type
		  FROM sci_lsp_lmt_profile a
		 WHERE EXISTS (SELECT '1' FROM si_temp_sema_ca001 
	  				 	WHERE llp_bca_ref_num = aa_number
						 AND cms_customer_id = a.cms_customer_id
	  				   	  AND a.cms_lsp_lmt_profile_id = cms_act_aa_id
	  				   	  AND is_valid = 'Y')
	  	   AND source_id = 'SEMA'
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_llp_key.trx_ref_id, cur_llp_key.trx_type);
	END FOR;
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA001', 'SEMA', 6);
	commit;
	
	------------------------------------------
	-- ENDED
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
	
	INSERT INTO SCI_LSP_LMT_PROFILE (CMS_LSP_LMT_PROFILE_ID, LLP_LE_ID, 
									CIF_SOURCE_ID, LLP_LSP_ID, 
									LLP_BCA_REF_NUM, CMS_BCA_JOINT_IND, 
									LLP_BCA_REF_APPR_DATE, 
									CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION, 
									LLP_NEXT_ANNL_RVW_DATE, CMS_CUSTOMER_ID,
									LMT_PROFILE_TYPE, SOURCE_ID, CMS_BCA_STATUS, UPDATE_STATUS_IND)
	(SELECT 
	CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_profile_seq), 2)) as BIGINT),
		CIF_ID, CIF_SOURCE, 1, AA_NUMBER, JOINT_BORROWER_IND,
		AA_APPROVED_DATE, ORI_LOC_COUNTRY, ORI_LOC_ORG_CODE,
		ANNUAL_REVIEW_DATE,  cms_customer_id,
		'BANKING', 'SEMA', 'ACTIVE', 'I'
	   FROM SI_TEMP_SEMA_CA001 t
	  WHERE 
	  cms_act_aa_id IS NULL
	  AND IS_VALID = 'Y');
	  
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA001', 'SEMA', 7);
	commit;
	  
	-------------------------------------
	-- Staging Table
	-- STAGE_LIMIT_PROFILE
	--
	-------------------------------------
	  
	UPDATE stage_limit_profile s SET (LLP_LE_ID, 
									CIF_SOURCE_ID, LLP_LSP_ID, 
									LLP_BCA_REF_NUM, CMS_BCA_JOINT_IND, 
									LLP_BCA_REF_APPR_DATE, 
									CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION, 
									LLP_NEXT_ANNL_RVW_DATE, 
									LMT_PROFILE_TYPE, SOURCE_ID, CMS_BCA_STATUS, UPDATE_STATUS_IND) =
	(SELECT 
		CIF_ID, CIF_SOURCE, 1, AA_NUMBER, JOINT_BORROWER_IND, 
		AA_APPROVED_DATE, ORI_LOC_COUNTRY, ORI_LOC_ORG_CODE,
		ANNUAL_REVIEW_DATE, 
		'BANKING', 'SEMA', 'ACTIVE', 'U'
	   FROM SI_TEMP_SEMA_CA001 t
	  WHERE t.aa_number = s.llp_bca_ref_num
	    AND t.cms_customer_id = s.cms_customer_id
	  	AND t.cms_stg_aa_id = s.cms_lsp_lmt_profile_id
		and source_id = 'SEMA'
	  AND IS_VALID = 'Y'	
	  )
	 WHERE EXISTS (SELECT '1' FROM si_temp_sema_ca001
	  				 WHERE cms_customer_id = s.cms_customer_id
	  				   AND cms_stg_aa_id = s.cms_lsp_lmt_profile_id
	  				   AND is_valid = 'Y')
		AND source_id = 'SEMA';

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA001', 'SEMA', 8);
	commit;
																  
																  	  
	INSERT INTO stage_limit_profile (CMS_LSP_LMT_PROFILE_ID, LLP_LE_ID, 
									CIF_SOURCE_ID, LLP_LSP_ID, 
									LLP_BCA_REF_NUM, CMS_BCA_JOINT_IND, 
									LLP_BCA_REF_APPR_DATE, 
									CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION, 
									LLP_NEXT_ANNL_RVW_DATE, CMS_CUSTOMER_ID,
									LMT_PROFILE_TYPE, SOURCE_ID, CMS_BCA_STATUS, UPDATE_STATUS_IND)
	(SELECT 
	CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_profile_seq), 2)) as BIGINT),
		CIF_ID, CIF_SOURCE, 1, AA_NUMBER, JOINT_BORROWER_IND, 
		AA_APPROVED_DATE, ORI_LOC_COUNTRY, ORI_LOC_ORG_CODE,
		ANNUAL_REVIEW_DATE,  cms_customer_id,
		'BANKING', 'SEMA', 'ACTIVE', 'I'						
	   FROM SI_TEMP_SEMA_CA001 t
	  WHERE cms_stg_aa_id IS NULL
	   AND IS_VALID = 'Y'  );
	   
  CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA001', 'SEMA', 0);
END
@
  
CREATE PROCEDURE SI_RUN_TEMP_SEMA_CA012
	LANGUAGE SQL
BEGIN
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 1);
    commit;
	
	------------------------------------------
	-- Temp Table
	-- si_temp_sema_ca012
	-- populate limit profile id
	-- cms limit key - act and stg from trx
	-- 
	------------------------------------------

	CALL SI_RUNSTATS('SI_TEMP_SEMA_CA012');
    commit;
	lock table si_temp_sema_ca012 in share mode; 
	---------------------------------------
	-- update is_outer_lmt indicator
	---------------------------------------
	update si_temp_sema_ca012
	set is_outer_lmt = 'Y'
	where outer_limit_id is null
	or outer_limit_id = ''
	or outer_limit_id = limit_id;
	
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 101);
	commit;
	
	--CALL SI_RUNSTATS('SI_TEMP_SEMA_CA012');	 
	lock table si_temp_sema_ca012 in exclusive mode; 
	---------------------------------------
	-- update limit profile id
	---------------------------------------	
	update si_temp_sema_ca012
	set cms_limit_profile_id = 
		(select cms_lsp_lmt_profile_id
		from sci_lsp_lmt_profile
		where llp_bca_ref_num = aa_number
		--and LLP_LE_ID = cif_id
		and source_id = 'SEMA')
	where is_valid = 'Y';	
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 102);
	commit;


	CALL SI_RUNSTATS('SI_TEMP_SEMA_CA012');
    commit;
	lock table si_temp_sema_ca012 in share mode; 
	
	UPDATE si_temp_sema_ca012 a SET (cms_act_lmt_id, cms_stg_lmt_id) =
	(SELECT reference_id, staging_reference_id
	   FROM sci_lsp_appr_lmts, transaction
	  WHERE reference_id = cms_lsp_appr_lmts_id
	    AND transaction_type = 'LIMIT'
	    --AND lmt_bca_ref_num = a.aa_number
	    --AND lmt_le_id = a.cif_id
	    AND source_id = 'SEMA'
		AND lmt_id = a.limit_id	   
		AND is_valid = 'Y' 		
		)
	 WHERE is_valid = 'Y';	 		
		
	CALL SI_RUNSTATS('SI_TEMP_SEMA_CA012');
    commit;	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 104);
	commit;
	
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------
	
	FOR cur_std_code AS
		SELECT DISTINCT PRODUCT_TYPE_CODE code, PRODUCT_TYPE_DESC desc,
			   PRODUCT_TYPE_CAT cat, 'SEMA' source_id
		  FROM SI_TEMP_SEMA_CA012
		 WHERE LENGTH(PRODUCT_TYPE_CODE) > 0
		   AND LENGTH(PRODUCT_TYPE_DESC) > 0	
			AND IS_VALID = 'Y'		   
	DO
		CALL SI_AUTO_UPDATE_NEW_PRODUCT_TYPE(cur_std_code.code, cur_std_code.desc, cur_std_code.source_id);
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, '26', cur_std_code.source_id);
	END FOR;
    commit;

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 2);
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
									--CREATE_DATE, 
									CMS_BKG_COUNTRY, CMS_BKG_ORGANISATION, 
									LMT_PRD_TYPE_NUM, LMT_PRD_TYPE_VALUE, 
									LMT_FAC_TYPE_NUM, LMT_FAC_TYPE_VALUE,
									LMT_TYPE_NUM, LMT_TYPE_VALUE,
									LMT_INTRST_MARGIN, LMT_CRRNCY_ISO_CODE, 
									LMT_AMT, CMS_DRAWING_LIMIT,   
									AVAILABLE_LMT, CMS_OUTSTANDING_AMT,
									SOURCE_ID, CMS_LIMIT_STATUS, UPDATE_STATUS_IND,
									LMT_LOAN_SECTOR_VALUE, DISBURSED_IND) = 
	(SELECT CMS_LIMIT_PROFILE_ID, LIMIT_ID, 
			CIF_ID, AA_NUMBER, 
			--APPROVED_DATE, 
			ORI_LOC_COUNTRY, ORI_LOC_ORG_CODE,
			PRODUCT_TYPE_CAT, PRODUCT_TYPE_CODE, 
			'26', PRODUCT_TYPE_CODE, 
			'25','OUTER',
			(CASE INTEREST_MARGIN_BASIS 
				WHEN 'D' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Days' 
				WHEN 'M' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Months'
				WHEN 'Y' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Years'												
					ELSE '' 
					END ), LIMIT_CURRENCY, 
			LIMIT_AMT, DRAWING_LIMIT_AMT, 
			AVAILABLE_LIMIT, OUTSTANDING_AMT,
			'SEMA', (CASE STATUS 
						WHEN 'C' THEN 'DELETED' 						
						ELSE 'ACTIVE' 
						END ),
			(CASE STATUS 
				WHEN 'C' THEN 'D' 						
				ELSE 'U' 
				END ), 
			LOAN_SECTOR_CODE, DISBURSED_IND
	 FROM SI_TEMP_SEMA_CA012 t
	 WHERE t.limit_id = a.lmt_id
	 AND cms_act_lmt_id = a.cms_lsp_appr_lmts_id
	 and a.source_id = 'SEMA'
	 and is_outer_lmt = 'Y'
	 aND IS_VALID = 'Y'
	 --and is_insert = 'N'	
	 )
	 WHERE a.source_id = 'SEMA'
	 and EXISTS (SELECT '1' 
	 				FROM SI_TEMP_SEMA_CA012 t
	  			WHERE a.lmt_id = limit_id
				 AND a.cms_lsp_appr_lmts_id = cms_act_lmt_id
					AND IS_VALID = 'Y'
					and is_outer_lmt = 'Y');
					--and is_insert = 'N')
	--and a.source_id = 'SEMA';
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 3);
	commit;
	

		------------------------------------------
	-- Update Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
	    				
	--FOR cur_lmt_key AS
	--	SELECT cms_lsp_appr_lmts_id trx_ref_id, 'LIMIT' trx_type
	--	  FROM sci_lsp_appr_lmts a
	--	 WHERE EXISTS (SELECT '1' FROM si_temp_sema_ca012
	-- 				 	WHERE a.lmt_id = limit_id
	-- 				   	 AND a.cms_lsp_appr_lmts_id = cms_act_lmt_id
	--		  		   	  AND is_valid = 'Y')
	--		 and source_id = 'SEMA'
	--	   AND lmt_outer_lmt_id IS NULL
	--DO
	--	CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_lmt_key.trx_ref_id, cur_lmt_key.trx_type);
	--END FOR;
	
	--CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 4);
	--commit;	
	
	------------------------------------------
	-- ENDED
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
	lock table sci_lsp_appr_lmts in share mode; 
	INSERT INTO sci_lsp_appr_lmts (CMS_LSP_APPR_LMTS_ID, CMS_REF_ID, CMS_LIMIT_PROFILE_ID, LMT_ID,
									LMT_LE_ID, LMT_BCA_REF_NUM, CREATE_DATE, 
									CMS_BKG_COUNTRY, CMS_BKG_ORGANISATION, 
									LMT_PRD_TYPE_NUM, LMT_PRD_TYPE_VALUE, 
									LMT_FAC_TYPE_NUM, LMT_FAC_TYPE_VALUE,
									LMT_TYPE_NUM, LMT_TYPE_VALUE,
									LMT_INTRST_MARGIN, LMT_CRRNCY_ISO_CODE, 
									LMT_AMT, CMS_DRAWING_LIMIT,   
									AVAILABLE_LMT, CMS_OUTSTANDING_AMT,
									SOURCE_ID, CMS_LIMIT_STATUS, UPDATE_STATUS_IND, LMT_LOAN_SECTOR_VALUE, DISBURSED_IND)
	(SELECT 
			CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT),
			CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT),
			CMS_LIMIT_PROFILE_ID,
			LIMIT_ID, CIF_ID, AA_NUMBER, APPROVED_DATE, 
			ORI_LOC_COUNTRY, ORI_LOC_ORG_CODE,
			PRODUCT_TYPE_CAT, PRODUCT_TYPE_CODE, 
			'26', PRODUCT_TYPE_CODE, 
			'25','OUTER',
			(CASE INTEREST_MARGIN_BASIS 
				WHEN 'D' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Days' 
				WHEN 'M' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Months'
				WHEN 'Y' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Years'												
					ELSE '' 
					END ), LIMIT_CURRENCY, 
			LIMIT_AMT, DRAWING_LIMIT_AMT, 
			AVAILABLE_LIMIT, OUTSTANDING_AMT,
			'SEMA', (CASE STATUS 
						WHEN 'C' THEN 'DELETED' 						
						ELSE 'ACTIVE' 
						END ),
				(CASE STATUS 
				WHEN 'C' THEN 'D' 						
				ELSE 'I' 
				END ), 
			LOAN_SECTOR_CODE, DISBURSED_IND
	   FROM SI_TEMP_SEMA_CA012 t
	  WHERE 
	  --is_insert = 'Y'
	  cms_act_lmt_id is null
		AND (outer_limit_id IS NULL OR outer_limit_id = '' OR outer_limit_id = limit_id)
		--and is_outer_lmt = 'Y'
		AND IS_VALID = 'Y');

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 5);
	
	--update sci_lsp_appr_lmts
	--set cms_ref_id = cms_lsp_appr_lmts_id
	--where cms_ref_id is null
	--and source_id = 'SEMA';		
	
	--CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 501);
	commit;				
		
	----------------------------------
	-- update outer limit id
	----------------------------------
	lock table si_temp_sema_ca012 in share mode; 
	
	update si_temp_sema_ca012
	set cms_outer_limit_id = 
		(select cms_lsp_appr_lmts_id
		from sci_lsp_appr_lmts
		where lmt_id = outer_limit_id  
		and source_id = 'SEMA'		
		)
	where is_valid = 'Y'
	and is_outer_lmt = 'N';
	
	CALL SI_RUNSTATS('SI_TEMP_SEMA_CA012');
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 105);
	commit;	
	CALL SI_RUNSTATS('sci_lsp_appr_lmts');
	-------------------------------------
	-- Actual Table
	-- SCI_LSP_APPR_LMTS
	-- Outer Limit first then INNER LIMIT
	--
	-------------------------------------
	lock table sci_lsp_appr_lmts in share mode; 
	UPDATE sci_lsp_appr_lmts a SET (LMT_ID, CMS_LIMIT_PROFILE_ID,
									CMS_OUTER_LMT_REF, LMT_OUTER_LMT_ID, 
									LMT_LE_ID, LMT_BCA_REF_NUM,
									--CREATE_DATE, 
									CMS_BKG_COUNTRY, CMS_BKG_ORGANISATION, 
									LMT_PRD_TYPE_NUM, LMT_PRD_TYPE_VALUE, 
									LMT_FAC_TYPE_NUM, LMT_FAC_TYPE_VALUE,
									LMT_TYPE_NUM, LMT_TYPE_VALUE,
									LMT_INTRST_MARGIN, LMT_CRRNCY_ISO_CODE, 
									LMT_AMT, CMS_DRAWING_LIMIT,   
									AVAILABLE_LMT, CMS_OUTSTANDING_AMT,
									SOURCE_ID, CMS_LIMIT_STATUS, UPDATE_STATUS_IND, LMT_LOAN_SECTOR_VALUE, DISBURSED_IND) = 
	(SELECT limit_id, cms_limit_profile_id, outer_limit_id, 
			cms_outer_limit_id, 
			CIF_ID, AA_NUMBER, 
			--APPROVED_DATE, 
			ORI_LOC_COUNTRY, ORI_LOC_ORG_CODE,
			PRODUCT_TYPE_CAT, PRODUCT_TYPE_CODE, 
			'26', PRODUCT_TYPE_CODE, 
			'25', 'INNER',
			(CASE INTEREST_MARGIN_BASIS 
				WHEN 'D' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Days' 
				WHEN 'M' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Months'
				WHEN 'Y' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Years'												
					ELSE '' 
					END ), LIMIT_CURRENCY, 
			LIMIT_AMT, DRAWING_LIMIT_AMT, 
			AVAILABLE_LIMIT, OUTSTANDING_AMT,
			'SEMA', (CASE STATUS 
						WHEN 'C' THEN 'DELETED' 						
						ELSE 'ACTIVE' 
						END ),
				(CASE STATUS 
				WHEN 'C' THEN 'D' 						
				ELSE 'U' 
				END ), 
			LOAN_SECTOR_CODE, DISBURSED_IND						
	   FROM SI_TEMP_SEMA_CA012 t
	  WHERE t.limit_id = a.lmt_id
	  AND cms_act_lmt_id = a.cms_lsp_appr_lmts_id
	  AND IS_VALID = 'Y'
		and is_outer_lmt = 'N'
		--and is_insert = 'N'	
	  )
	  WHERE EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CA012
	  				 WHERE a.lmt_id = limit_id
					  AND cms_act_lmt_id = a.cms_lsp_appr_lmts_id
					 	 AND IS_VALID = 'Y'
					 	-- and is_insert = 'N'
						 and is_outer_lmt = 'N')
		and a.source_id = 'SEMA';
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 6);
	commit;		
	
	CALL SI_RUNSTATS('sci_lsp_appr_lmts');
	
   ------------------------------------------
	-- Update Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
	    							      
	--FOR cur_lmt_key AS
	--	SELECT cms_lsp_appr_lmts_id trx_ref_id, 'LIMIT' trx_type
	--	  FROM sci_lsp_appr_lmts a
	--	 WHERE EXISTS (SELECT '1' FROM si_temp_sema_ca012
	--  				 	WHERE a.lmt_id = limit_id
	--  				   	 AND cms_act_lmt_id = a.cms_lsp_appr_lmts_id
	--		  		   	  AND is_valid = 'Y')
	--	 and a.source_id = 'SEMA'
	--   AND lmt_outer_lmt_id IS NOT NULL
	--DO
	--	CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_lmt_key.trx_ref_id, cur_lmt_key.trx_type);
	--END FOR;
	
--	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 7);
	--commit;		
	
	------------------------------------------
	-- ENDED
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
	lock table sci_lsp_appr_lmts in share mode; 
	INSERT INTO sci_lsp_appr_lmts (CMS_LSP_APPR_LMTS_ID, CMS_REF_ID, CMS_LIMIT_PROFILE_ID, LMT_ID, 
									CMS_OUTER_LMT_REF, LMT_OUTER_LMT_ID, 
									LMT_LE_ID, LMT_BCA_REF_NUM, CREATE_DATE, 
									CMS_BKG_COUNTRY, CMS_BKG_ORGANISATION, 
									LMT_PRD_TYPE_NUM, LMT_PRD_TYPE_VALUE, 
									LMT_FAC_TYPE_NUM, LMT_FAC_TYPE_VALUE,
									LMT_TYPE_NUM, LMT_TYPE_VALUE,
									LMT_INTRST_MARGIN, LMT_CRRNCY_ISO_CODE, 
									LMT_AMT, CMS_DRAWING_LIMIT,   
									AVAILABLE_LMT, CMS_OUTSTANDING_AMT,
									SOURCE_ID, CMS_LIMIT_STATUS, UPDATE_STATUS_IND, 
									LMT_LOAN_SECTOR_VALUE, DISBURSED_IND)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT),
			(CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT)),
				cms_limit_profile_id,
				LIMIT_ID, outer_limit_id,
				cms_outer_limit_id,
				CIF_ID, AA_NUMBER, APPROVED_DATE, 
			ORI_LOC_COUNTRY, ORI_LOC_ORG_CODE,
			PRODUCT_TYPE_CAT, PRODUCT_TYPE_CODE, 
			'26', PRODUCT_TYPE_CODE, 
			'25','INNER',
			(CASE INTEREST_MARGIN_BASIS 
				WHEN 'D' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Days' 
				WHEN 'M' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Months'
				WHEN 'Y' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Years'												
					ELSE '' 
					END ), LIMIT_CURRENCY, 
			LIMIT_AMT, DRAWING_LIMIT_AMT, 
			AVAILABLE_LIMIT, OUTSTANDING_AMT,
			'SEMA', (CASE STATUS 
						WHEN 'C' THEN 'DELETED' 						
						ELSE 'ACTIVE' 
						END ),
				(CASE STATUS 
				WHEN 'C' THEN 'D' 						
				ELSE 'I' 
				END ),
			LOAN_SECTOR_CODE, DISBURSED_IND	
	   FROM SI_TEMP_SEMA_CA012 t
	  WHERE cms_act_lmt_id IS NULL		
		--and is_insert = 'Y'
		and is_outer_lmt = 'N'
		AND IS_VALID = 'Y');
		
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 8);
		
	--update sci_lsp_appr_lmts
	--set cms_ref_id = cms_lsp_appr_lmts_id
	--where cms_ref_id is null
	--and source_id = 'SEMA';	
	
	
	--CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 801);
	commit;
	-------------------------------------
	-- Staging Table
	-- STAGE_LIMIT
	-- OUTER LIMIT first then Inner Limit
	--
	-------------------------------------
	lock table stage_limit in share mode; 
	UPDATE stage_limit a SET (LMT_ID, CMS_LIMIT_PROFILE_ID, LMT_LE_ID, LMT_BCA_REF_NUM, 
	--CREATE_DATE, 
									CMS_BKG_COUNTRY, CMS_BKG_ORGANISATION, 
									LMT_PRD_TYPE_NUM, LMT_PRD_TYPE_VALUE, 
									LMT_FAC_TYPE_NUM, LMT_FAC_TYPE_VALUE,
									LMT_TYPE_NUM, LMT_TYPE_VALUE,
									LMT_INTRST_MARGIN, LMT_CRRNCY_ISO_CODE, 
									LMT_AMT, CMS_DRAWING_LIMIT,   
									AVAILABLE_LMT, CMS_OUTSTANDING_AMT,
									SOURCE_ID, CMS_LIMIT_STATUS, UPDATE_STATUS_IND,
									LMT_LOAN_SECTOR_VALUE, DISBURSED_IND) = 
	(SELECT LIMIT_ID, CMS_LIMIT_PROFILE_ID, CIF_ID, AA_NUMBER, 
	--APPROVED_DATE, 
			ORI_LOC_COUNTRY, ORI_LOC_ORG_CODE,
			PRODUCT_TYPE_CAT, PRODUCT_TYPE_CODE, 
			'26', PRODUCT_TYPE_CODE, 
			'25', 'OUTER',
			(CASE INTEREST_MARGIN_BASIS 
				WHEN 'D' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Days' 
				WHEN 'M' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Months'
				WHEN 'Y' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Years'												
					ELSE '' 
					END ), LIMIT_CURRENCY, 
			LIMIT_AMT, DRAWING_LIMIT_AMT, 
			AVAILABLE_LIMIT, OUTSTANDING_AMT,
			'SEMA', (CASE STATUS 
						WHEN 'C' THEN 'DELETED' 						
						ELSE 'ACTIVE' 
						END ),
				(CASE STATUS 
				WHEN 'C' THEN 'D' 						
				ELSE 'U' 
				END ),
			LOAN_SECTOR_CODE, DISBURSED_IND
	   FROM SI_TEMP_SEMA_CA012 t
	  WHERE 
	 t.limit_id = a.lmt_id 
	    AND a.cms_lsp_appr_lmts_id = t.cms_stg_lmt_id
	    AND t.IS_VALID = 'Y'
		AND t.is_outer_lmt = 'Y'
		--AND t.is_insert = 'N'	 
	  )
	  WHERE EXISTS (SELECT '1' FROM si_temp_sema_ca012
	  				 WHERE limit_id = a.lmt_id
	  				   AND cms_stg_lmt_id = a.cms_lsp_appr_lmts_id
	 				   AND is_valid = 'Y')
		AND lmt_outer_lmt_id IS NULL 	
		and source_id = 'SEMA';  
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 9);
	commit;	

	lock table stage_limit in share mode; 	
	INSERT INTO stage_limit (CMS_LSP_APPR_LMTS_ID, LMT_ID, CMS_LIMIT_PROFILE_ID,
								LMT_LE_ID, LMT_BCA_REF_NUM, CREATE_DATE, 
								CMS_BKG_COUNTRY, CMS_BKG_ORGANISATION, 
								LMT_PRD_TYPE_NUM, LMT_PRD_TYPE_VALUE, 
								LMT_FAC_TYPE_NUM, LMT_FAC_TYPE_VALUE,
								LMT_TYPE_NUM, LMT_TYPE_VALUE,
								LMT_INTRST_MARGIN, LMT_CRRNCY_ISO_CODE, 
								LMT_AMT, CMS_DRAWING_LIMIT,   
								AVAILABLE_LMT, CMS_OUTSTANDING_AMT,
								SOURCE_ID, CMS_LIMIT_STATUS, UPDATE_STATUS_IND,
								LMT_LOAN_SECTOR_VALUE, DISBURSED_IND)
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT),
			LIMIT_ID, CMS_LIMIT_PROFILE_ID, CIF_ID, AA_NUMBER, APPROVED_DATE, 
		ORI_LOC_COUNTRY, ORI_LOC_ORG_CODE,
		PRODUCT_TYPE_CAT, PRODUCT_TYPE_CODE, 
		'26', PRODUCT_TYPE_CODE, 
		'25','OUTER',
		(CASE INTEREST_MARGIN_BASIS 
			WHEN 'D' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Days' 
			WHEN 'M' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Months'
			WHEN 'Y' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Years'												
				ELSE '' 
				END ), LIMIT_CURRENCY, 
		LIMIT_AMT, DRAWING_LIMIT_AMT, 
		AVAILABLE_LIMIT, OUTSTANDING_AMT,
		'SEMA', (CASE STATUS 
					WHEN 'C' THEN 'DELETED' 						
					ELSE 'ACTIVE' 
					END ),
				(CASE STATUS 
				WHEN 'C' THEN 'D' 						
				ELSE 'I' 
				END ),
		LOAN_SECTOR_CODE, DISBURSED_IND	
	  FROM SI_TEMP_SEMA_CA012 t
	  WHERE 
	  cms_stg_lmt_id is null
	  --is_insert = 'Y'
	 AND IS_VALID = 'Y'
	 --and cms_stg_lmt_id IS NULL
	 --and is_outer_lmt = 'Y');
	 AND (outer_limit_id IS NULL OR outer_limit_id = '' OR outer_limit_id = limit_id));
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 10);
	commit;

	----------------------------------
	-- update outer limit id
	----------------------------------
	CALL SI_RUNSTATS('SI_TEMP_SEMA_CA012');
	
	lock table si_temp_sema_ca012 in share mode; 	
	
	update si_temp_sema_ca012
	set cms_stg_outer_limit_id = 
		(select s.cms_lsp_appr_lmts_id
		from stage_limit s, sci_lsp_appr_lmts a, TRANSACTION trx
		where 
		a.lmt_id = outer_limit_id
		AND a.source_id = 'SEMA'	
		AND s.source_id = 'SEMA'		
		AND trx.reference_id = a.cms_lsp_appr_lmts_id
		AND trx.staging_reference_id = s.cms_lsp_appr_lmts_id
		AND trx.transaction_type = 'LIMIT' )
	where is_valid = 'Y'
	and is_outer_lmt = 'N';
		
	CALL SI_RUNSTATS('SI_TEMP_SEMA_CA012');
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 106);
	commit;	
	-------------------------------------
	-- Staging Table
	-- STAGE_LIMIT
	-- outer limit first then INNER LIMIT
	--
	-------------------------------------
	lock table stage_limit in share mode; 
	UPDATE stage_limit a SET (LMT_ID, CMS_LIMIT_PROFILE_ID,
							  CMS_OUTER_LMT_REF, LMT_OUTER_LMT_ID, 
							  LMT_LE_ID, LMT_BCA_REF_NUM, 
							  --CREATE_DATE,  
								CMS_BKG_COUNTRY, CMS_BKG_ORGANISATION, 
								LMT_PRD_TYPE_NUM, LMT_PRD_TYPE_VALUE, 
								LMT_FAC_TYPE_NUM, LMT_FAC_TYPE_VALUE,
								LMT_TYPE_NUM, LMT_TYPE_VALUE,
								LMT_INTRST_MARGIN, LMT_CRRNCY_ISO_CODE, 
								LMT_AMT, CMS_DRAWING_LIMIT,   
								AVAILABLE_LMT, CMS_OUTSTANDING_AMT,
								SOURCE_ID, CMS_LIMIT_STATUS, UPDATE_STATUS_IND,
								LMT_LOAN_SECTOR_VALUE, DISBURSED_IND) = 
	(SELECT limit_id,  CMS_LIMIT_PROFILE_ID,
			 outer_limit_id, 
			cms_stg_outer_limit_id,
			CIF_ID, AA_NUMBER, 
			--APPROVED_DATE, 
			ORI_LOC_COUNTRY, ORI_LOC_ORG_CODE,
			PRODUCT_TYPE_CAT, PRODUCT_TYPE_CODE, 
			'26', PRODUCT_TYPE_CODE, 
			'25', 'INNER',
			(CASE INTEREST_MARGIN_BASIS 
				WHEN 'D' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Days' 
				WHEN 'M' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Months'
				WHEN 'Y' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Years'												
					ELSE '' 
					END ), LIMIT_CURRENCY, 
			LIMIT_AMT, DRAWING_LIMIT_AMT, 
			AVAILABLE_LIMIT, OUTSTANDING_AMT,
			'SEMA', (CASE STATUS 
						WHEN 'C' THEN 'DELETED' 						
						ELSE 'ACTIVE' 
						END ),
				(CASE STATUS 
				WHEN 'C' THEN 'D' 						
				ELSE 'U' 
				END ),
			LOAN_SECTOR_CODE, DISBURSED_IND						
	   FROM SI_TEMP_SEMA_CA012 t
	  WHERE t.limit_id = a.lmt_id
	   AND a.cms_lsp_appr_lmts_id = t.cms_stg_lmt_id
		and a.source_id = 'SEMA'
	  AND IS_VALID = 'Y'
		--and is_insert = 'N'
		and is_outer_lmt = 'N'	
	  )
	   WHERE EXISTS (SELECT '1' FROM si_temp_sema_ca012
					 WHERE limit_id = a.lmt_id
					   AND a.cms_lsp_appr_lmts_id = cms_stg_lmt_id
					   AND is_valid = 'Y')
     AND lmt_outer_lmt_id IS NOT NULL				   
	 and source_id = 'SEMA'; 
	 
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 11);
	commit;	 
	
	lock table stage_limit in share mode; 
	INSERT INTO stage_limit (CMS_LSP_APPR_LMTS_ID, 
								LMT_ID, CMS_LIMIT_PROFILE_ID, 
								CMS_OUTER_LMT_REF, LMT_OUTER_LMT_ID, 
								LMT_LE_ID, LMT_BCA_REF_NUM, 
								--CREATE_DATE,  
								CMS_BKG_COUNTRY, CMS_BKG_ORGANISATION, 
								LMT_PRD_TYPE_NUM, LMT_PRD_TYPE_VALUE, 
								LMT_FAC_TYPE_NUM, LMT_FAC_TYPE_VALUE,
								LMT_TYPE_NUM, LMT_TYPE_VALUE,
								LMT_INTRST_MARGIN, LMT_CRRNCY_ISO_CODE, 
								LMT_AMT, CMS_DRAWING_LIMIT,   
								AVAILABLE_LMT, CMS_OUTSTANDING_AMT,
								SOURCE_ID, CMS_LIMIT_STATUS, UPDATE_STATUS_IND,
								LMT_LOAN_SECTOR_VALUE, DISBURSED_IND)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT),
					limit_id, CMS_LIMIT_PROFILE_ID,
			 outer_limit_id, 
			cms_stg_outer_limit_id,
			CIF_ID, AA_NUMBER, 
			--APPROVED_DATE, 
			ORI_LOC_COUNTRY, ORI_LOC_ORG_CODE,
			PRODUCT_TYPE_CAT, PRODUCT_TYPE_CODE, 
			'26', PRODUCT_TYPE_CODE, 
			'25', 'INNER',
			(CASE INTEREST_MARGIN_BASIS 
				WHEN 'D' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Days' 
				WHEN 'M' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Months'
				WHEN 'Y' THEN rtrim( char( int( INTEREST_MARGIN ) ) ) concat substr( char( INTEREST_MARGIN ),7,5 ) || ' Years'												
					ELSE '' 
					END ), LIMIT_CURRENCY, 
			LIMIT_AMT, DRAWING_LIMIT_AMT, 
			AVAILABLE_LIMIT, OUTSTANDING_AMT,
			'SEMA', (CASE STATUS 
						WHEN 'C' THEN 'DELETED' 						
						ELSE 'ACTIVE' 
						END ),
				(CASE STATUS 
				WHEN 'C' THEN 'D' 						
				ELSE 'I' 
				END ),
			LOAN_SECTOR_CODE, DISBURSED_IND
	   FROM SI_TEMP_SEMA_CA012 t 
	   WHERE cms_stg_lmt_id IS NULL
	   and IS_VALID = 'Y'
		-- and is_insert = 'Y'
		 and is_outer_lmt = 'N');
		 
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 12);
	commit;	
		 
		 
	-------------------------------------
	-- Update/insertion table
	-- SCI_LSP_SYS_XREF
	--
	-------------------------------------
	lock table SCI_LSP_SYS_XREF in share mode;
	UPDATE SCI_LSP_SYS_XREF x SET(
	LSX_EXT_SYS_CODE_VALUE,
	LSX_EXT_SYS_ACCT_NUM,
	LSX_LE_ID,
	CMS_LE_SUB_PROFILE_ID,
	LSX_BCA_REF_NUM,
	LSX_BKG_LOCTN_CTRY, 
	LSX_BKG_LOCTN_ORG,
	LSX_LSP_ID,
	UPDATE_STATUS_IND,
	ACCT_STATUS
	)=
	(select 'SEMA',
	t.EXTERNAL_SYSTEM_ACCT_NO,
	(SELECT LLP_LE_ID FROM sci_lsp_lmt_profile
		WHERE llp_bca_ref_num = t.AA_NUMBER 
		AND source_id = 'SEMA'
			FETCH FIRST 1 ROW ONLY),
	(select pf.cms_customer_id 
	from sci_lsp_lmt_profile pf
		where pf.SOURCE_ID = 'SEMA'
		and pf.LLP_BCA_REF_NUM = t.AA_NUMBER),
	t.AA_NUMBER,
	ORI_LOC_COUNTRY,
	ORI_LOC_ORG_CODE,
	1,
	(CASE STATUS 
				WHEN 'C' THEN 'D' 						
				ELSE 'U' 
				END ),
    (CASE STATUS WHEN 'C' THEN 'D' ELSE 'A' END)
	FROM SI_TEMP_SEMA_CA012 t 
	WHERE LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO 
		and LSX_EXT_SYS_CODE_VALUE='SEMA' 
		AND t.is_valid = 'Y' AND is_outer_lmt = 'Y')
	WHERE EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CA012 t 
		WHERE LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO
			and LSX_EXT_SYS_CODE_VALUE='SEMA' 
			AND t.is_valid = 'Y')
	AND LSX_EXT_SYS_CODE_VALUE='SEMA';
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 13);
	commit;
	
	INSERT INTO SCI_LSP_SYS_XREF(
	CMS_LSP_SYS_XREF_ID,
	LSX_EXT_SYS_CODE_VALUE,
	LSX_EXT_SYS_ACCT_NUM,
	LSX_LE_ID,
	CMS_LE_SUB_PROFILE_ID,
	LSX_BCA_REF_NUM,
	LSX_BKG_LOCTN_CTRY, 
	LSX_BKG_LOCTN_ORG,
	LSX_LSP_ID,
	ACCT_DELQ_IND,
	UPDATE_STATUS_IND,
	ACCT_STATUS,
	LSX_EXT_SYS_CODE_NUM,
	LSX_EXT_CTY_CODE_VALUE)
	(select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CUSTOMER_X_REF_SEQ), 2)) as BIGINT),
	'SEMA',
	t.EXTERNAL_SYSTEM_ACCT_NO,
	(SELECT LLP_LE_ID FROM sci_lsp_lmt_profile
		WHERE llp_bca_ref_num = t.AA_NUMBER 
		AND source_id = 'SEMA'
		FETCH FIRST 1 ROW ONLY),
	(select pf.cms_customer_id 
	from sci_lsp_lmt_profile pf
		where pf.SOURCE_ID = 'SEMA'
		and pf.LLP_BCA_REF_NUM = t.AA_NUMBER
			FETCH FIRST 1 ROW ONLY),
	t.AA_NUMBER,
	ORI_LOC_COUNTRY,
	ORI_LOC_ORG_CODE,
	1,
	'N',
	'I',
	'A',
	'37',
	ORI_LOC_COUNTRY
	FROM SI_TEMP_SEMA_CA012 t WHERE t.is_valid = 'Y' AND is_outer_lmt = 'Y'
		AND NOT EXISTS (SELECT '1' 
			FROM SCI_LSP_SYS_XREF 
			WHERE LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO 
				and LSX_EXT_SYS_CODE_VALUE='SEMA'));
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 14);
	commit;

	-------------------------------------
	-- Update/insertion table
	-- CMS_STAGE_LSP_SYS_XREF
	--
	-------------------------------------
	lock table CMS_STAGE_LSP_SYS_XREF in share mode;
	UPDATE CMS_STAGE_LSP_SYS_XREF s SET(
	LSX_EXT_SYS_CODE_VALUE,
	LSX_EXT_SYS_ACCT_NUM,
	LSX_LE_ID,
	CMS_LE_SUB_PROFILE_ID,
	LSX_BCA_REF_NUM,
	LSX_BKG_LOCTN_CTRY, 
	LSX_BKG_LOCTN_ORG,
	LSX_LSP_ID,
	UPDATE_STATUS_IND,
	ACCT_STATUS
	)=
	(select 'SEMA',
	t.EXTERNAL_SYSTEM_ACCT_NO,
	(SELECT LLP_LE_ID FROM sci_lsp_lmt_profile
		WHERE llp_bca_ref_num = t.AA_NUMBER 
		AND source_id = 'SEMA'
			FETCH FIRST 1 ROW ONLY),
	(select pf.CMS_CUSTOMER_ID
	from sci_lsp_lmt_profile pf
	where pf.LLP_BCA_REF_NUM = t.aa_number
	and pf.source_id = 'SEMA'
		FETCH FIRST 1 ROW ONLY),
	t.AA_NUMBER,
	ORI_LOC_COUNTRY,
	ORI_LOC_ORG_CODE,
	1,
	(CASE STATUS 
				WHEN 'C' THEN 'D' 						
				ELSE 'U' 
				END ),
	(CASE STATUS 
				WHEN 'C' THEN 'D' ELSE 'A' END) 
	FROM SI_TEMP_SEMA_CA012 t 
	WHERE LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO 
	and LSX_EXT_SYS_CODE_VALUE='SEMA' 
	AND t.is_valid = 'Y' 
	AND is_outer_lmt = 'Y')
 	WHERE exists (select '1'
		from SI_TEMP_SEMA_CA012 t
		where lsx_ext_sys_acct_num = t.external_system_acct_no
		and lsx_ext_sys_code_value = 'SEMA' and is_outer_lmt = 'Y'
		and exists (select '1'
					from stage_limit_xref map
					where s.CMS_LSP_SYS_XREF_ID = map.CMS_LSP_SYS_XREF_ID
					and exists 
						(select '1'
						from transaction 
						where transaction_type = 'LIMIT'
						and staging_reference_id = map.CMS_LSP_APPR_LMTS_ID)));
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 15);
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
	LSX_LSP_ID,
	ACCT_DELQ_IND,
	UPDATE_STATUS_IND,
	ACCT_STATUS,
	LSX_EXT_SYS_CODE_NUM,
	LSX_EXT_CTY_CODE_VALUE)
	(select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CUSTOMER_X_REF_SEQ), 2)) as BIGINT),
	'SEMA',
	t.EXTERNAL_SYSTEM_ACCT_NO,
	(SELECT LLP_LE_ID FROM sci_lsp_lmt_profile
		WHERE llp_bca_ref_num = t.AA_NUMBER 
		AND source_id = 'SEMA'
			FETCH FIRST 1 ROW ONLY),
	(select pf.cms_customer_id
	from sci_lsp_lmt_profile pf
	where pf.llp_bca_ref_num = t.aa_number
	and pf.source_id = 'SEMA'
		FETCH FIRST 1 ROW ONLY),
	t.AA_NUMBER,
	ORI_LOC_COUNTRY,
	ORI_LOC_ORG_CODE,
	1,
	'N',
	'I',
	'A',
	'37',
	ORI_LOC_COUNTRY
	FROM SI_TEMP_SEMA_CA012 t 
	WHERE is_outer_lmt = 'Y' and NOT EXISTS 
		(SELECT '1' 
		FROM CMS_STAGE_LSP_SYS_XREF 
		WHERE LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO 
		and LSX_EXT_SYS_CODE_VALUE='SEMA')
	AND t.is_valid = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 16);
	commit;
	
	-------------------------------------
	-- Update/insertion table
	-- SCI_LSP_LMTS_XREF_MAP
	--
	-------------------------------------
	lock table SCI_LSP_LMTS_XREF_MAP in share mode;
	UPDATE SCI_LSP_LMTS_XREF_MAP b SET(
	CMS_STATUS,
	UPDATE_STATUS_IND)=
	(select 
	(CASE WHEN t.STATUS = 'C' THEN 'DELETED' ELSE 'ACTIVE' END),
	(CASE t.STATUS 
				WHEN 'C' THEN 'D' 						
				ELSE 'U' 
				END)
	FROM SI_TEMP_SEMA_CA012 t, SCI_LSP_SYS_XREF xf
	WHERE xf.CMS_LSP_SYS_XREF_ID = b.CMS_LSP_SYS_XREF_ID
			and xf.LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO 
			and xf.LSX_EXT_SYS_CODE_VALUE='SEMA'
			and t.is_valid = 'Y' AND is_outer_lmt = 'Y')
	WHERE EXISTS (SELECT 1 from SI_TEMP_SEMA_CA012 t, SCI_LSP_SYS_XREF xf
		WHERE xf.CMS_LSP_SYS_XREF_ID = b.CMS_LSP_SYS_XREF_ID
			and xf.LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO 
			and xf.LSX_EXT_SYS_CODE_VALUE='SEMA'
			and t.is_valid = 'Y' AND is_outer_lmt = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 17);
	commit;
			
	call si_runstats('sci_lsp_appr_lmts');
	call si_runstats('SCI_LSP_SYS_XREF');
	commit;
	
	INSERT INTO SCI_LSP_LMTS_XREF_MAP(
	CMS_LSP_LMTS_XREF_MAP_ID,
	LXM_LE_ID,
	LXM_LMT_ID,
	CMS_LSP_APPR_LMTS_ID,
	CMS_LSP_SYS_XREF_ID,
	CMS_STATUS,
	UPDATE_STATUS_IND)
	(select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_x_ref_seq), 2)) as BIGINT),
	lmts.LMT_LE_ID,
	lmts.lmt_id,
	lmts.CMS_LSP_APPR_LMTS_ID,
	(SELECT CMS_LSP_SYS_XREF_ID 
	FROM SCI_LSP_SYS_XREF 
	WHERE LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO 
		and LSX_EXT_SYS_CODE_VALUE='SEMA'),
	'ACTIVE',
	'I'
	FROM SI_TEMP_SEMA_CA012 t, sci_lsp_appr_lmts lmts
	WHERE LMT_BCA_REF_NUM = t.AA_NUMBER 
	and source_id = 'SEMA'
	and NOT EXISTS 
	(SELECT '1' FROM SCI_LSP_SYS_XREF a, SCI_LSP_LMTS_XREF_MAP b 
		WHERE a.CMS_LSP_SYS_XREF_ID=b.CMS_LSP_SYS_XREF_ID 
			and a.LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO
			and a.LSX_EXT_SYS_CODE_VALUE='SEMA') 
	AND t.is_valid = 'Y' AND is_outer_lmt = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 18);
	commit;
	-------------------------------------
	-- Update/insertion table
	-- STAGE_LIMIT_XREF
	--
	-------------------------------------
	lock table STAGE_LIMIT_XREF in share mode;
	UPDATE STAGE_LIMIT_XREF b SET(
	CMS_STATUS,
	UPDATE_STATUS_IND)=
	(select 
	(CASE WHEN t.STATUS = 'C' THEN 'DELETED' ELSE 'ACTIVE' END),
	(CASE t.STATUS 
				WHEN 'C' THEN 'D' 						
				ELSE 'U' 
				END )
	FROM SI_TEMP_SEMA_CA012 t, CMS_STAGE_LSP_SYS_XREF a 
		WHERE a.CMS_LSP_SYS_XREF_ID=b.CMS_LSP_SYS_XREF_ID 
			and a.LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO
			and a.LSX_EXT_SYS_CODE_VALUE='SEMA' 
			AND t.is_valid = 'Y' AND is_outer_lmt = 'Y')
 	WHERE CMS_LSP_APPR_LMTS_ID IN (select staging_reference_id from transaction
									where reference_id IN (select CMS_LSP_APPR_LMTS_ID 
															from sci_lsp_appr_lmts, SI_TEMP_SEMA_CA012
														where LMT_BCA_REF_NUM = AA_NUMBER 
														and source_id = 'SEMA' 
														AND is_valid = 'Y')
												and transaction_type = 'LIMIT');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 19);
	commit;
												
	INSERT INTO STAGE_LIMIT_XREF(
	CMS_LSP_LMTS_XREF_MAP_ID,
	LXM_LE_ID,
	LXM_LMT_ID,
	CMS_LSP_APPR_LMTS_ID,
	CMS_LSP_SYS_XREF_ID,
	CMS_STATUS,
	UPDATE_STATUS_IND)
	(select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_x_ref_seq), 2)) as BIGINT),
	lmts.LMT_LE_ID,
	lmts.lmt_id,
	lmts.CMS_LSP_APPR_LMTS_ID,
	(SELECT max(CMS_LSP_SYS_XREF_ID)
	FROM cms_stage_lsp_sys_xref
	WHERE LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO 
		and LSX_EXT_SYS_CODE_VALUE='SEMA'),
	'ACTIVE',
	'I'
	FROM SI_TEMP_SEMA_CA012 t, stage_limit lmts
	WHERE LMT_BCA_REF_NUM = t.AA_NUMBER 
	and source_id = 'SEMA' 
	and NOT EXISTS 
	(SELECT '1' 
	FROM CMS_STAGE_LSP_SYS_XREF a, STAGE_LIMIT_XREF b
		WHERE a.CMS_LSP_SYS_XREF_ID=b.CMS_LSP_SYS_XREF_ID 
			and a.LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO
			and a.LSX_EXT_SYS_CODE_VALUE='SEMA') 
	AND t.is_valid = 'Y' AND is_outer_lmt = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 20);
	commit;
	
	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Actual Table
	-- SCI_LSP_SYS_XREF
	--
	-------------------------------------
	lock table SCI_LSP_SYS_XREF in share mode;
	UPDATE SCI_LSP_SYS_XREF a SET (ACCT_STATUS, UPDATE_STATUS_IND)=('D', 'D')
  WHERE LSX_EXT_SYS_CODE_VALUE = 'SEMA'
		AND ACCT_STATUS = 'A'
		AND NOT EXISTS (SELECT '1' from SI_TEMP_SEMA_CA012 t
			WHERE t.EXTERNAL_SYSTEM_ACCT_NO = a.LSX_EXT_SYS_ACCT_NUM 
				AND t.is_valid = 'Y' and t.is_outer_lmt = 'Y');		

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 21);
	commit;

	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Staging Table
	-- CMS_STAGE_LSP_SYS_XREF
	--
	-------------------------------------
	lock table CMS_STAGE_LSP_SYS_XREF in share mode;
	UPDATE CMS_STAGE_LSP_SYS_XREF a SET (ACCT_STATUS, UPDATE_STATUS_IND)=('D', 'D')
  WHERE LSX_EXT_SYS_CODE_VALUE = 'SEMA'
		AND ACCT_STATUS = 'A'
		AND EXISTS (select '1'
					from stage_limit_xref map
					where a.CMS_LSP_SYS_XREF_ID = map.CMS_LSP_SYS_XREF_ID
					and exists 
						(select '1'
						from transaction 
						where transaction_type = 'LIMIT'
						and staging_reference_id = map.CMS_LSP_APPR_LMTS_ID))
		AND NOT EXISTS (SELECT '1' from SI_TEMP_SEMA_CA012 t
			WHERE t.EXTERNAL_SYSTEM_ACCT_NO = a.LSX_EXT_SYS_ACCT_NUM 
				AND t.is_valid = 'Y' and t.is_outer_lmt = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 22);
	commit;
	
	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Actual Table
	-- SCI_LSP_LMTS_XREF_MAP
	-- 
	-------------------------------------
	lock table SCI_LSP_LMTS_XREF_MAP in share mode;
	UPDATE SCI_LSP_LMTS_XREF_MAP a SET (CMS_STATUS, UPDATE_STATUS_IND)=('DELETED', 'D')
  WHERE CMS_STATUS = 'ACTIVE'
		AND EXISTS (SELECT 1 from SCI_LSP_SYS_XREF xf
			WHERE xf.CMS_LSP_SYS_XREF_ID = a.CMS_LSP_SYS_XREF_ID
				and xf.LSX_EXT_SYS_CODE_VALUE='SEMA'
				and xf.ACCT_STATUS = 'D');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 23);
	commit;

	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Staging Table
	-- STAGE_LIMIT_XREF
	--
	-------------------------------------
	lock table STAGE_LIMIT_XREF in share mode;
	UPDATE STAGE_LIMIT_XREF a SET (CMS_STATUS, UPDATE_STATUS_IND)=('DELETED', 'D')
  WHERE CMS_STATUS = 'ACTIVE'
		AND EXISTS (SELECT 1 from CMS_STAGE_LSP_SYS_XREF xf
			WHERE xf.CMS_LSP_SYS_XREF_ID = a.CMS_LSP_SYS_XREF_ID
				and xf.LSX_EXT_SYS_CODE_VALUE='SEMA'
				and xf.ACCT_STATUS = 'D');
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 24);
	commit;			
				
	-------------------------------------
	-- Actual Table
	-- cms_npl
	--
	-------------------------------------
	
	UPDATE cms_npl a SET (	
		ACCOUNT_NUMBER,
		NPL_BCA_REF_NUM,
		STATUS,
		NPL_DATE,
		SOURCE_ID) =
	(SELECT
		EXTERNAL_SYSTEM_ACCT_NO,
		AA_NUMBER,
		NPL_STAT,
		NPL_DATE,
		'SEMA'
	   FROM SI_TEMP_SEMA_CA012 t
	  WHERE t.AA_NUMBER = a.NPL_BCA_REF_NUM and a.SOURCE_ID = 'SEMA' and a.ACCOUNT_NUMBER=t.EXTERNAL_SYSTEM_ACCT_NO AND t.is_valid = 'Y' AND is_outer_lmt = 'Y')
	  WHERE EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CA012 t
	  	WHERE t.AA_NUMBER = a.NPL_BCA_REF_NUM and a.SOURCE_ID='SEMA' and a.ACCOUNT_NUMBER=t.EXTERNAL_SYSTEM_ACCT_NO AND t.is_valid = 'Y' AND is_outer_lmt = 'Y')
		and a.SOURCE_ID='SEMA';

	insert into cms_npl(
		CMS_NPL_ID,
		ACCOUNT_NUMBER,
		NPL_BCA_REF_NUM,
		STATUS,
		NPL_DATE,
		SOURCE_ID)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR NPL_SEQ), 2)) as BIGINT),
		EXTERNAL_SYSTEM_ACCT_NO,
		AA_NUMBER,
		NPL_STAT,
		NPL_DATE,
		'SEMA'
	    FROM SI_TEMP_SEMA_CA012 t
			WHERE NOT EXISTS (SELECT 1 FROM cms_npl WHERE NPL_BCA_REF_NUM=t.AA_NUMBER and ACCOUNT_NUMBER=t.EXTERNAL_SYSTEM_ACCT_NO and source_id = 'SEMA')
				AND EXISTS (SELECT 1 FROM sci_lsp_sys_xref WHERE LSX_BCA_REF_NUM=t.AA_NUMBER 
					and LSX_EXT_SYS_CODE_VALUE = 'SEMA'
					AND LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO)
			AND t.is_valid = 'Y' AND t.is_outer_lmt = 'Y');
			
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 25);
	commit;	
	
	
	-------------------------------------
	-- Update SYS REF table from CMS_NPL status
	-- sci_lsp_sys_xref
	--
	-------------------------------------
	update sci_lsp_sys_xref a set ACCT_DELQ_IND = 
	(SELECT NPL_STAT FROM SI_TEMP_SEMA_CA012 t 
		WHERE a.LSX_BCA_REF_NUM=t.AA_NUMBER AND a.LSX_EXT_SYS_CODE_VALUE = 'SEMA'
			AND a.LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO
			AND t.NPL_STAT in ('Y', 'N') AND t.is_valid = 'Y' AND t.is_outer_lmt = 'Y')
	 WHERE EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CA012 t
			WHERE a.LSX_BCA_REF_NUM=t.AA_NUMBER and a.LSX_EXT_SYS_CODE_VALUE = 'SEMA'
				AND a.LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO
				AND t.NPL_STAT in ('Y', 'N') AND t.is_valid = 'Y' AND t.is_outer_lmt = 'Y');
							
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CA012', 'SEMA', 0);
	commit;		
			
END
@

CREATE PROCEDURE SI_RUN_TEMP_SEMA_CO020
	LANGUAGE SQL
BEGIN

	
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	DECLARE v_security_sub_type_id VARCHAR(100);	
	DECLARE v_subtype_name VARCHAR(100);	
	DECLARE v_security_type_name VARCHAR(100);
	DECLARE v_security_type_id VARCHAR(100);
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 1);
	
	CALL SI_RUNSTATS('SI_TEMP_SEMA_CO020');
	
	----------------------------------------------------------    
	-- Select the security details 
	----------------------------------------------------------	
	SELECT 
	SECURITY_SUB_TYPE_ID, SUBTYPE_NAME, SECURITY_TYPE_NAME, SECURITY_TYPE_ID
	INTO 
	v_security_sub_type_id, v_subtype_name, v_security_type_name, v_security_type_id
	FROM 
	CMS_SECURITY_SUB_TYPE 
	WHERE 
	SECURITY_SUB_TYPE_ID = 'CS202';
	
	lock table SI_TEMP_SEMA_CO020 in share mode; 		
	UPDATE SI_TEMP_SEMA_CO020 a SET (CMS_COLLATERAL_ID, CMS_STG_COLLATERAL_ID) =
	(SELECT reference_id, staging_reference_id
	   FROM CMS_SECURITY, transaction
	  WHERE reference_id = CMS_COLLATERAL_ID
	    AND transaction_type = 'COL'
	    AND SCI_SECURITY_DTL_ID = a.SOURCE_SEC_ID	   
	    AND source_id = 'SEMA')
	 WHERE is_valid = 'Y';

	 CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 101);
	 commit;	
	 
	 lock table SI_TEMP_SEMA_CO020 in share mode; 
	
	UPDATE SI_TEMP_SEMA_CO020 a SET (cms_act_lmt_id, cms_stg_lmt_id) =
	(SELECT reference_id, staging_reference_id
	   FROM sci_lsp_appr_lmts, transaction
	  WHERE reference_id = cms_lsp_appr_lmts_id
	    AND transaction_type = 'LIMIT'	    
	    AND source_id = 'SEMA'
		AND lmt_id = a.CIF_ID	    		
		)
	 WHERE is_valid = 'Y';	 
				
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 102);
	commit;
	
	----------------------------------------------------------    
	-- Process Security table 
	----------------------------------------------------------		
	lock table CMS_SECURITY in share mode; 		
	UPDATE CMS_SECURITY s
	SET
		(SECURITY_SUB_TYPE_ID,
		SUBTYPE_NAME,
		TYPE_NAME,
		SCI_SECURITY_SUBTYPE_VALUE,
		SCI_SECURITY_TYPE_VALUE,
		SECURITY_LOCATION,
		SCI_SECURITY_DTL_ID,
		SCI_SECURITY_CURRENCY,
		STATUS,
		SCI_ORIG_SECURITY_CURRENCY,
		SECURITY_ORGANISATION,
		IS_MIGRATED_IND,
		SOURCE_ID) =
	(SELECT 
		v_security_sub_type_id, v_subtype_name, v_security_type_name, v_security_sub_type_id, v_security_type_id,
		'MY', CIF_ID||FD_RECEIPT_NO, 'MYR', 'ACTIVE', 'MYR', '033', 'N', 'SEMA'
		FROM SI_TEMP_SEMA_CO020 t
		WHERE 
		s.CMS_COLLATERAL_ID = t.CMS_COLLATERAL_ID)
	WHERE 
	EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CO020 
	WHERE s.CMS_COLLATERAL_ID = CMS_COLLATERAL_ID 
	AND IS_VALID = 'Y');

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 2);
	commit;	
	 ------------------------------------------
	-- Update Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
						      
	FOR cur_col_key AS
		SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
		  FROM CMS_SECURITY a
		 WHERE EXISTS (SELECT '1' FROM si_temp_sema_co020
	  				 	WHERE a.SCI_SECURITY_DTL_ID = SOURCE_SEC_ID	  				   	  
			  		   	  AND is_valid = 'Y')		  
		and a.source_id = 'SEMA'						  
		  
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
	END FOR;
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 201);
	commit;	
	------------------------------------------
	-- ENDED
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
	lock table CMS_SECURITY in share mode; 		
	
	INSERT INTO 
		CMS_SECURITY(
		CMS_COLLATERAL_ID,
		SECURITY_SUB_TYPE_ID,
		SUBTYPE_NAME,
		TYPE_NAME,
		SCI_SECURITY_SUBTYPE_VALUE,
		SCI_SECURITY_TYPE_VALUE,
		SECURITY_LOCATION,
		SCI_SECURITY_DTL_ID,
		SCI_SECURITY_CURRENCY,
		STATUS,
		SCI_ORIG_SECURITY_CURRENCY,
		SECURITY_ORGANISATION,
		IS_MIGRATED_IND,
		SOURCE_ID)
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COLLATERAL_SEQ), 2)) as BIGINT), 
		v_security_sub_type_id, v_subtype_name, v_security_type_name, v_security_sub_type_id, v_security_type_id,
		'MY', CIF_ID||FD_RECEIPT_NO, 'MYR', 'ACTIVE', 'MYR', '033', 'N', 'SEMA'
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE 
		CMS_COLLATERAL_ID is null
		AND IS_VALID = 'Y');
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 3);
	commit;	
	----------------------------------------------------------    
	-- Process Security Source table 
	----------------------------------------------------------
	lock table CMS_SECURITY_SOURCE in share mode; 		
	
	UPDATE CMS_SECURITY_SOURCE c
	SET(						
			SOURCE_SECURITY_ID,
			SOURCE_ID,
			STATUS) =
	(SELECT 
		t.SOURCE_SEC_ID, 'SEMA', 'ACTIVE'
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE c.CMS_COLLATERAL_ID = t.CMS_COLLATERAL_ID 			
			AND IS_VALID = 'Y')
	WHERE 
		EXISTS 
			(SELECT '1' 
				FROM SI_TEMP_SEMA_CO020 t 
				WHERE c.CMS_COLLATERAL_ID = t.CMS_COLLATERAL_ID 
				AND IS_VALID = 'Y');
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA',4);
	commit;	
	
	lock table CMS_SECURITY_SOURCE in share mode; 	
	lock table CMS_SECURITY in share mode; 		
	
	INSERT INTO 
		CMS_SECURITY_SOURCE(
			CMS_SECURITY_SOURCE_ID,
			CMS_COLLATERAL_ID,
			SOURCE_SECURITY_ID,
			SOURCE_ID,
			STATUS)
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) as BIGINT), 
		s.CMS_COLLATERAL_ID,		 
		t.SOURCE_SEC_ID, 'SEMA', 'ACTIVE'
	FROM SI_TEMP_SEMA_CO020 t, CMS_SECURITY s
	WHERE 
		NOT EXISTS (SELECT '1' FROM CMS_SECURITY_SOURCE o
		WHERE 
			o.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID 
			AND SOURCE_SECURITY_ID = SOURCE_SEC_ID
			AND SOURCE_ID = 'SEMA')
	AND IS_VALID = 'Y'
	AND s.SCI_SECURITY_DTL_ID = SOURCE_SEC_ID
	AND s.SOURCE_ID = 'SEMA');
			
			
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 5);
	commit;	
	----------------------------------------------------------    
	-- Process Cash table 
	----------------------------------------------------------	
	lock table CMS_CASH in share mode; 		
	
	UPDATE CMS_CASH c
	SET(		
		TOTAL_DEPOSIT_AMT, COUNT_DEPOSIT) =
	(SELECT 
		t.FD_DEPOSIT_AMT,
		1		
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE c.CMS_COLLATERAL_ID = t.CMS_COLLATERAL_ID 			
			AND IS_VALID = 'Y'				
			)		
	WHERE 
		EXISTS 
			(SELECT '1'
				FROM SI_TEMP_SEMA_CO020
				WHERE 
					c.CMS_COLLATERAL_ID = CMS_COLLATERAL_ID 
					AND IS_VALID = 'Y');
	
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 6);
	commit;	
	
	lock table CMS_CASH in share mode; 	
	
	INSERT INTO 
		CMS_CASH (CMS_COLLATERAL_ID, TOTAL_DEPOSIT_AMT, COUNT_DEPOSIT)
	(SELECT 
		s.CMS_COLLATERAL_ID,	
		t.FD_DEPOSIT_AMT,
		1			
	FROM SI_TEMP_SEMA_CO020 t, CMS_SECURITY s 
	WHERE 
		NOT EXISTS 
			(SELECT '1'
			FROM CMS_CASH c
			WHERE c.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID)
	AND IS_VALID = 'Y'
	AND s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
	AND s.SOURCE_ID = 'SEMA');		
										
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 7);
	commit;			
	----------------------------------------------------------    
	-- Process Cash Deposit table 
	----------------------------------------------------------	
	
	lock table CMS_CASH_DEPOSIT in share mode; 						
					
	UPDATE CMS_CASH_DEPOSIT c
	SET(		
	SOURCE_SECURITY_ID,
		DEPOSIT_RECEIPT_NUMBER,
		DEPOSIT_AMOUNT_CURRENCY,
		DEPOSIT_AMOUNT,
		DEPOSIT_MATURITY_DATE,
		SOURCE_ID,
		STATUS) =
	(SELECT 
	SOURCE_SEC_ID,
		FD_RECEIPT_NO,
		FD_DEPOSIT_AMT_CURR,
		FD_DEPOSIT_AMT,
		FD_DEPOSIT_MATURITY_DATE,
		'SEMA',
		'ACTIVE'
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE 
		c.CMS_COLLATERAL_ID = t.CMS_COLLATERAL_ID 			
			AND IS_VALID = 'Y'			
			)			
	WHERE 
		EXISTS (SELECT '1'
				FROM SI_TEMP_SEMA_CO020
				WHERE 
					c.CMS_COLLATERAL_ID = CMS_COLLATERAL_ID 
					AND IS_VALID = 'Y');

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 8);
	commit;	
	
	lock table CMS_CASH_DEPOSIT in share mode; 	
	
	INSERT INTO 
		CMS_CASH_DEPOSIT (
		CASH_DEPOSIT_ID,
		CMS_REF_ID,
		CMS_COLLATERAL_ID,
		SOURCE_SECURITY_ID,
		DEPOSIT_RECEIPT_NUMBER,
		DEPOSIT_AMOUNT_CURRENCY,
		DEPOSIT_AMOUNT,
		DEPOSIT_MATURITY_DATE,
		SOURCE_ID,
		STATUS)
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CASH_DEPOSIT_SEQ), 2)) as BIGINT), 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CASH_DEPOSIT_SEQ), 2)) as BIGINT), 
	--(SELECT 
		s.CMS_COLLATERAL_ID 
		--	FROM CMS_SECURITY 
		--	WHERE SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
		--	AND SOURCE_ID = 'SEMA')
			,
			SOURCE_SEC_ID,
		FD_RECEIPT_NO,
		FD_DEPOSIT_AMT_CURR,
		FD_DEPOSIT_AMT,
		FD_DEPOSIT_MATURITY_DATE,
		'SEMA',
		'ACTIVE'
	FROM SI_TEMP_SEMA_CO020 t ,  CMS_SECURITY s 
	WHERE 
		NOT EXISTS (SELECT '1' FROM CMS_CASH_DEPOSIT c WHERE 
			c.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID
			--and SOURCE_ID = 'SEMA'
			)			
		AND s.SOURCE_ID = 'SEMA'
		AND s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
		AND IS_VALID = 'Y'
		);							
		
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 9);
		
	
	--update CMS_CASH_DEPOSIT
	--set cms_ref_id = CASH_DEPOSIT_ID
	--where cms_ref_id is null
	--and source_id='SEMA';
	
	--CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 901);
	commit;	
	----------------------------------------------------------    
	-- Process Limit - security linkage table 
	----------------------------------------------------------
	lock table CMS_LIMIT_SECURITY_MAP in share mode; 				
	UPDATE CMS_LIMIT_SECURITY_MAP c
	SET(				
		CMS_LSP_APPR_LMTS_ID,
		SCI_LAS_LMT_ID,
		CUSTOMER_CATEGORY,
		CMS_LSP_LMT_PROFILE_ID,
		SCI_LAS_LE_ID,
		CREATE_DATE,
		SOURCE_ID,
		UPDATE_STATUS_IND) =
	(SELECT 
		t.CMS_ACT_LMT_ID,		
		t.CIF_ID,
		'MB',  
		(SELECT 
		CMS_LIMIT_PROFILE_ID 
			FROM SCI_LSP_APPR_LMTS 
			WHERE CMS_LSP_APPR_LMTS_ID = t.CMS_ACT_LMT_ID 
			AND SOURCE_ID = 'SEMA'			
			),
		t.CIF_ID,
		CURRENT TIMESTAMP,
		'SEMA',
		'U'
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE c.CMS_COLLATERAL_ID = t.CMS_COLLATERAL_ID 		
		    --and c.SCI_LAS_LMT_ID = t.CIF_ID 	
			AND c.CMS_LSP_APPR_LMTS_ID = t.CMS_ACT_LMT_ID 	
			AND IS_VALID = 'Y'					
			)
	WHERE 
		EXISTS 
			(SELECT '1' 
				FROM SI_TEMP_SEMA_CO020  
				WHERE c.CMS_COLLATERAL_ID = CMS_COLLATERAL_ID 
				--and c.SCI_LAS_LMT_ID = CIF_ID 
				AND c.CMS_LSP_APPR_LMTS_ID = CMS_ACT_LMT_ID 
				AND IS_VALID = 'Y');
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 10);
	commit;		
	
	lock table CMS_LIMIT_SECURITY_MAP in share mode; 		
	
	INSERT INTO 
		CMS_LIMIT_SECURITY_MAP (
		CHARGE_ID,
		CMS_LSP_APPR_LMTS_ID,
		CMS_COLLATERAL_ID,
		SCI_LAS_LMT_ID,
		CUSTOMER_CATEGORY,
		CMS_LSP_LMT_PROFILE_ID,
		SCI_LAS_LE_ID,
		CREATE_DATE,
		SOURCE_ID,
		UPDATE_STATUS_IND)
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_MAP_SEQ), 2)) as BIGINT), 
		CMS_ACT_LMT_ID,
		(SELECT CMS_COLLATERAL_ID 
				FROM CMS_SECURITY 
				WHERE SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
				AND SOURCE_ID = 'SEMA'				
				),		
		t.CIF_ID,		
		'MB',
		(SELECT CMS_LIMIT_PROFILE_ID 
			FROM SCI_LSP_APPR_LMTS 
			WHERE CMS_LSP_APPR_LMTS_ID = t.CMS_ACT_LMT_ID 
			AND SOURCE_ID = 'SEMA'			
			),
		t.CIF_ID,	
		CURRENT TIMESTAMP,
		'SEMA',
		'I'
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE 
		NOT EXISTS 
			(SELECT '1' 
				FROM CMS_LIMIT_SECURITY_MAP m, CMS_SECURITY s 
				WHERE m.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID 
				AND s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
				--and SCI_LAS_LMT_ID = t.CIF_ID 
				AND m.CMS_LSP_APPR_LMTS_ID = t.CMS_ACT_LMT_ID 
				AND m.SOURCE_ID = 'SEMA'
				AND s.SOURCE_ID = 'SEMA')
		AND IS_VALID = 'Y');

	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 11);
	commit;				
	---------------------------------------------------------    
	-- Process Charge table 
	----------------------------------------------------------	
	lock table CMS_CHARGE_DETAIL in share mode; 		
	UPDATE CMS_CHARGE_DETAIL c
	SET(		
		CHARGE_AMOUNT, CHARGE_CURRENCY_CODE, SCI_LAS_SEC_ID, SOURCE_ID,
		STATUS) =
	(SELECT 
		t.FD_PLEDGED_AMT, t.FD_PLEDGED_AMT_CURR, t.SOURCE_SEC_ID, 'SEMA',	
		'ACTIVE'
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE c.CMS_COLLATERAL_ID = t.CMS_COLLATERAL_ID 			
			AND IS_VALID = 'Y') 
	WHERE 
		EXISTS 
			(SELECT '1'
				FROM SI_TEMP_SEMA_CO020
				WHERE 
					c.CMS_COLLATERAL_ID = CMS_COLLATERAL_ID 
					AND IS_VALID = 'Y');
	
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 12);
	commit;	
	lock table CMS_CHARGE_DETAIL in share mode; 
	
	INSERT INTO 
		CMS_CHARGE_DETAIL (CHARGE_DETAIL_ID, CMS_REF_ID, CHARGE_AMOUNT, CHARGE_CURRENCY_CODE,
		CMS_COLLATERAL_ID, SCI_LAS_SEC_ID, SOURCE_ID,
		STATUS)
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_CHARGE_SEQ), 2)) as BIGINT), 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_CHARGE_SEQ), 2)) as BIGINT), 
		t.FD_PLEDGED_AMT, t.FD_PLEDGED_AMT_CURR,
		(SELECT CMS_COLLATERAL_ID 
			FROM CMS_SECURITY
			WHERE SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
			AND SOURCE_ID = 'SEMA'),	
		t.SOURCE_SEC_ID, 'SEMA',			
		'ACTIVE'			
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE 
		NOT EXISTS 
			(SELECT '1'
			FROM CMS_CHARGE_DETAIL
			WHERE 				
				SCI_LAS_SEC_ID = t.SOURCE_SEC_ID
				AND SOURCE_ID = 'SEMA')
				AND IS_VALID = 'Y');		
				
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 13);
	commit;	
	--lock table CMS_CHARGE_DETAIL in share mode; 
	
	--update cms_charge_detail
	--set cms_ref_id = charge_detail_id
	--where cms_ref_id is null;
			
		
	--CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 1301);
	--commit;	
			
		----------------------------------------------------------    
	-- Process Charge - limit linkage table 
	----------------------------------------------------------	
	lock table CMS_LIMIT_CHARGE_MAP in share mode; 	
    UPDATE CMS_LIMIT_CHARGE_MAP c
	SET(				
		CMS_LSP_APPR_LMTS_ID,
		CHARGE_ID,
		CHARGE_DETAIL_ID,
		STATUS,
		CUSTOMER_CATEGORY) =
	(SELECT 
		t.CMS_ACT_LMT_ID, 
		(SELECT CHARGE_ID 
				FROM CMS_LIMIT_SECURITY_MAP m
				WHERE 
				m.CMS_COLLATERAL_ID = t.CMS_COLLATERAL_ID
				--AND SCI_LAS_LMT_ID = t.CIF_ID 
				AND m.CMS_LSP_APPR_LMTS_ID = t.CMS_ACT_LMT_ID				
				AND m.SOURCE_ID = 'SEMA'
				), 
		(SELECT CHARGE_DETAIL_ID 
				FROM CMS_CHARGE_DETAIL c
				where c.CMS_COLLATERAL_ID = t.CMS_COLLATERAL_ID				
				),
		'ACTIVE',
		'MB'		
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE c.CMS_COLLATERAL_ID = t.CMS_COLLATERAL_ID 			
			AND IS_VALID = 'Y')
	WHERE 
		EXISTS 
			(SELECT '1' 
				FROM SI_TEMP_SEMA_CO020  
				WHERE c.CMS_COLLATERAL_ID = CMS_COLLATERAL_ID 
				AND IS_VALID = 'Y');
				
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 14);
	commit;		
	lock table CMS_LIMIT_CHARGE_MAP in share mode; 	
	
	INSERT INTO 
		CMS_LIMIT_CHARGE_MAP (
		LIMIT_CHARGE_MAP_ID,
		CMS_LSP_APPR_LMTS_ID,
		CHARGE_ID,
		CHARGE_DETAIL_ID,
		CMS_COLLATERAL_ID,
		STATUS,
		CUSTOMER_CATEGORY  )
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR LIMIT_CHARGE_MAP_SEQ), 2)) as BIGINT), 
		t.CMS_ACT_LMT_ID,
		(SELECT CHARGE_ID 
				FROM CMS_LIMIT_SECURITY_MAP m, CMS_SECURITY s
				WHERE 
				m.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID
				and s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID 
				--and SCI_LAS_LMT_ID = T.CIF_ID 
				and m.CMS_LSP_APPR_LMTS_ID = t.CMS_ACT_LMT_ID
				AND m.SOURCE_ID = 'SEMA'		
				AND s.SOURCE_ID = 'SEMA'					
				), 
		(SELECT CHARGE_DETAIL_ID 
				FROM CMS_CHARGE_DETAIL
				where 
				SCI_LAS_SEC_ID = t.SOURCE_SEC_ID
				AND SOURCE_ID = 'SEMA'				
				),
		(SELECT CMS_COLLATERAL_ID 
				FROM CMS_SECURITY 
				WHERE SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
				AND SOURCE_ID = 'SEMA'				
				), 
		'ACTIVE',
		'MB'		
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE 
		NOT EXISTS 
			(SELECT '1' 
				FROM CMS_LIMIT_CHARGE_MAP m, CMS_SECURITY s 
				WHERE m.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID 
				AND s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
				AND s.SOURCE_ID = 'SEMA')
	AND IS_VALID = 'Y');
				
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 15);
	commit;			
	----------------------------------------------------------    
	-- Process Pledgor table 
	----------------------------------------------------------	
	lock table SCI_PLEDGOR_DTL in share mode; 	
	update SCI_PLEDGOR_DTL
	set
		(PLG_PLEDGOR_ID, PLG_LE_ID, PLG_LEGAL_NAME, 
		PLG_INC_CNTRY_ISO_CODE, PLG_INC_NUM_TEXT, 		
		PLG_ID_TYPE_NUM, PLG_ID_TYPE_VALUE,
		PLG_LE_ID_SRC_NUM, PLG_LE_ID_SRC_VALUE, 
		CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION,
		SOURCE_ID, UPDATE_STATUS_IND)=
	(select 
		0, lmp_le_id, LMP_LONG_NAME, 
		--LMP_INC_CNTRY_ISO_CODE,  LMP_INC_NUM_TEXT,
		LMP_INC_CNTRY_ISO_CODE,  LMP_ID_NUMBER,
		LMP_ID_TYPE_NUM,     LMP_ID_TYPE_VALUE,
		LMP_LE_ID_SRC_NUM,     LMP_LE_ID_SRC_VALUE,  
		s.CMS_SUB_ORIG_COUNTRY,
		s.CMS_SUB_ORIG_ORGANISATION,
		--(select CMS_SUB_ORIG_COUNTRY 
		--from sci_le_sub_profile where LSP_LE_ID = lmp_le_id AND SOURCE_ID='SEMA'),
		--(select CMS_SUB_ORIG_ORGANISATION 
		--from sci_le_sub_profile where LSP_LE_ID = lmp_le_id AND SOURCE_ID='SEMA'),	
		'SEMA', 'U'		
		FROM sci_le_main_profile m, sci_le_sub_profile s
		WHERE 	
		PLG_LE_ID = m.lmp_le_id 
		and m.CMS_LE_MAIN_PROFILE_ID = s.CMS_LE_MAIN_PROFILE_ID
		and m.source_id='SEMA')
			WHERE 
				SOURCE_ID = 'SEMA'
				AND
				EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CO020 WHERE PLG_LE_ID = CIF_ID AND IS_VALID = 'Y');

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 16);
	commit;	
	
	lock table SCI_PLEDGOR_DTL in share mode; 	
	
	FOR cur_pldgor AS
		SELECT distinct CIF_ID
		  FROM SI_TEMP_SEMA_CO020 t 
		where 			 
			IS_VALID = 'Y' and
			NOT EXISTS (SELECT '1' FROM SCI_PLEDGOR_DTL 
				WHERE 
				PLG_LE_ID = t.CIF_ID)			      
	    							      	
	DO
		insert into SCI_PLEDGOR_DTL
		(CMS_PLEDGOR_DTL_ID, PLG_PLEDGOR_ID, PLG_LE_ID, PLG_LEGAL_NAME, 
		PLG_INC_CNTRY_ISO_CODE, PLG_INC_NUM_TEXT, 		
		PLG_ID_TYPE_NUM, PLG_ID_TYPE_VALUE,
		PLG_LE_ID_SRC_NUM, PLG_LE_ID_SRC_VALUE, 
		CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION,
		SOURCE_ID, UPDATE_STATUS_IND)	
	(select 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 2)) as BIGINT), 
		0,  lmp_le_id, LMP_LONG_NAME, 
		--LMP_INC_CNTRY_ISO_CODE,  LMP_INC_NUM_TEXT,
		LMP_INC_CNTRY_ISO_CODE,  LMP_ID_NUMBER,
		LMP_ID_TYPE_NUM,     LMP_ID_TYPE_VALUE,
		LMP_LE_ID_SRC_NUM,     LMP_LE_ID_SRC_VALUE ,
		(select CMS_SUB_ORIG_COUNTRY 
		from sci_le_sub_profile where LSP_LE_ID = lmp_le_id AND SOURCE_ID='SEMA'),
		(select CMS_SUB_ORIG_ORGANISATION 
		from sci_le_sub_profile where LSP_LE_ID = lmp_le_id AND SOURCE_ID='SEMA'),		
		'SEMA', 'I'
		from sci_le_main_profile 
		where lmp_le_id = cur_pldgor.CIF_ID	
			and SOURCE_ID='SEMA' );
	END FOR;

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 17);
	commit;	
----------------------------------------------------------    
	-- Process Security - Pledogor linkage table 
	----------------------------------------------------------	
	lock table SCI_SEC_PLDGR_MAP in share mode; 	
	
	UPDATE SCI_SEC_PLDGR_MAP c
	SET(				
		SPM_MAP_ID, 
		CMS_PLEDGOR_DTL_ID, 
		CMS_COLLATERAL_ID, 
		UPDATE_STATUS_IND,
		SOURCE_ID ) =
	(SELECT 
		0,
		(SELECT CMS_PLEDGOR_DTL_ID 
				FROM SCI_PLEDGOR_DTL 
				WHERE PLG_LE_ID = t.CIF_ID
				AND SOURCE_ID = 'SEMA'),		
		t.CMS_COLLATERAL_ID,
		'U',
		'SEMA'
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE c.CMS_COLLATERAL_ID = t.CMS_COLLATERAL_ID 			
			AND IS_VALID = 'Y')
	WHERE 
		EXISTS 
			(SELECT '1' 
				FROM SI_TEMP_SEMA_CO020
				WHERE c.CMS_COLLATERAL_ID = CMS_COLLATERAL_ID 
				AND IS_VALID = 'Y');
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 18);
	commit;			
	
	lock table SCI_SEC_PLDGR_MAP in share mode; 
	
	insert into SCI_SEC_PLDGR_MAP
		(CMS_SEC_PLDGR_MAP_ID, SPM_MAP_ID, 
		CMS_PLEDGOR_DTL_ID, CMS_COLLATERAL_ID, 
		UPDATE_STATUS_IND,
		SOURCE_ID,
		SEC_PLEDGOR_RELATIONSHIP_NUM, 
        SEC_PLEDGOR_RELATIONSHIP_VALUE )	
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_PLEDGOR_MAP_SEQ), 2)) as BIGINT), 
		0,
		(SELECT CMS_PLEDGOR_DTL_ID 
				FROM SCI_PLEDGOR_DTL 
				WHERE PLG_LE_ID = t.CIF_ID
				AND SOURCE_ID = 'SEMA'),
		(SELECT CMS_COLLATERAL_ID 
				FROM CMS_SECURITY 
				WHERE SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
				AND SOURCE_ID = 'SEMA'),		
		'I', 'SEMA', '34', '1st'
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE 
		NOT EXISTS 
			(SELECT '1' 
				FROM SCI_SEC_PLDGR_MAP m, CMS_SECURITY s 
				WHERE m.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID 
				AND s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
				AND s.SOURCE_ID = 'SEMA'
				AND m.SOURCE_ID = 'SEMA')
		AND IS_VALID = 'Y'
	);

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 19);
	commit;	
	----------------------------------------------------------    
	--
	-- Process Staging table s
	--
	----------------------------------------------------------	
	
	----------------------------------------------------------    
	-- Process Security table 
	----------------------------------------------------------		
	lock table CMS_STAGE_SECURITY in share mode; 			
	UPDATE CMS_STAGE_SECURITY s
	SET
		(SECURITY_SUB_TYPE_ID,
		SUBTYPE_NAME,
		TYPE_NAME,
		SCI_SECURITY_SUBTYPE_VALUE,
		SCI_SECURITY_TYPE_VALUE,
		SECURITY_LOCATION,
		SCI_SECURITY_DTL_ID,
		SCI_SECURITY_CURRENCY,
		STATUS,
		SCI_ORIG_SECURITY_CURRENCY,
		SECURITY_ORGANISATION,
		SOURCE_ID) =
	(SELECT 	                                                                            
		v_security_sub_type_id, v_subtype_name, v_security_type_name, v_security_sub_type_id, v_security_type_id,
		'MY', CIF_ID||FD_RECEIPT_NO, 'MYR', 'ACTIVE', 'MYR', '033', 'SEMA'
		FROM SI_TEMP_SEMA_CO020 
		WHERE 
		s.CMS_COLLATERAL_ID = CMS_STG_COLLATERAL_ID)
	WHERE 
	EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CO020 
	WHERE s.CMS_COLLATERAL_ID = CMS_STG_COLLATERAL_ID 
	AND IS_VALID = 'Y');

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 20);
	commit;	
	lock table CMS_STAGE_SECURITY in share mode; 	
	
	INSERT INTO 
		CMS_STAGE_SECURITY(
		CMS_COLLATERAL_ID,
		SECURITY_SUB_TYPE_ID,
		SUBTYPE_NAME,
		TYPE_NAME,
		SCI_SECURITY_SUBTYPE_VALUE,
		SCI_SECURITY_TYPE_VALUE,
		SECURITY_LOCATION,
		SCI_SECURITY_DTL_ID,
		SCI_SECURITY_CURRENCY,
		STATUS,
		SCI_ORIG_SECURITY_CURRENCY,
		SECURITY_ORGANISATION,
		SOURCE_ID)
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COLLATERAL_SEQ), 2)) as BIGINT), 
		v_security_sub_type_id, v_subtype_name, v_security_type_name, v_security_sub_type_id, v_security_type_id,
		'MY', CIF_ID||FD_RECEIPT_NO, 'MYR', 'ACTIVE', 'MYR', '033', 'SEMA'
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE 
	CMS_STG_COLLATERAL_ID is null
	AND IS_VALID = 'Y');
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 21);
	commit;
	----------------------------------------------------------    
	-- Process Cash table 
	----------------------------------------------------------	
	lock table CMS_STAGE_CASH in share mode; 	
	
	UPDATE CMS_STAGE_CASH c
	SET(		
		TOTAL_DEPOSIT_AMT, COUNT_DEPOSIT) =
	(SELECT 
		t.FD_DEPOSIT_AMT,
		1		
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE c.CMS_COLLATERAL_ID = t.CMS_STG_COLLATERAL_ID 
			AND IS_VALID = 'Y'	
			)		
	WHERE 
		EXISTS 
			(SELECT '1'
				FROM SI_TEMP_SEMA_CO020
				WHERE 
					c.CMS_COLLATERAL_ID = CMS_STG_COLLATERAL_ID 
					AND IS_VALID = 'Y');
	
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 22);
	commit;
	lock table CMS_STAGE_CASH in share mode; 	
	
	INSERT INTO 
		CMS_STAGE_CASH (CMS_COLLATERAL_ID, TOTAL_DEPOSIT_AMT, COUNT_DEPOSIT)
	(SELECT 
		s.CMS_COLLATERAL_ID,	
		t.FD_DEPOSIT_AMT,
		1			
	FROM SI_TEMP_SEMA_CO020 t, CMS_STAGE_SECURITY s 
	WHERE 
		NOT EXISTS 
			(SELECT '1'
			FROM CMS_STAGE_CASH c
			WHERE 
				c.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID 
				)
	AND IS_VALID = 'Y'
	AND s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
	AND s.SOURCE_ID = 'SEMA');		
										
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 23);
	commit;		
	----------------------------------------------------------    
	-- Process Cash Deposit table 
	----------------------------------------------------------	
	
	lock table CMS_STAGE_CASH_DEPOSIT in share mode; 				
					
	UPDATE CMS_STAGE_CASH_DEPOSIT c
	SET(		
	SOURCE_SECURITY_ID,
		DEPOSIT_RECEIPT_NUMBER,
		DEPOSIT_AMOUNT_CURRENCY,
		DEPOSIT_AMOUNT,
		DEPOSIT_MATURITY_DATE,
		SOURCE_ID,
		STATUS) =
	(SELECT 
	SOURCE_SEC_ID,
		FD_RECEIPT_NO,
		FD_DEPOSIT_AMT_CURR,
		FD_DEPOSIT_AMT,
		FD_DEPOSIT_MATURITY_DATE,
		'SEMA',
		'ACTIVE'
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE 
		c.CMS_COLLATERAL_ID = t.CMS_STG_COLLATERAL_ID 			
			AND IS_VALID = 'Y')			
	WHERE 
		EXISTS (SELECT '1'
				FROM SI_TEMP_SEMA_CO020
				WHERE 
					c.CMS_COLLATERAL_ID = CMS_STG_COLLATERAL_ID 
					AND IS_VALID = 'Y');

	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 24);
	commit;	
	lock table CMS_STAGE_CASH_DEPOSIT in share mode; 	
	
	INSERT INTO 
		CMS_STAGE_CASH_DEPOSIT (
		CASH_DEPOSIT_ID,
		CMS_COLLATERAL_ID,
		SOURCE_SECURITY_ID,
		DEPOSIT_RECEIPT_NUMBER,
		DEPOSIT_AMOUNT_CURRENCY,
		DEPOSIT_AMOUNT,
		DEPOSIT_MATURITY_DATE,
		SOURCE_ID,
		STATUS,
		CMS_REF_ID)
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CASH_DEPOSIT_SEQ), 2)) as BIGINT), 
		--(SELECT 
		s.CMS_COLLATERAL_ID 
		----	FROM CMS_STAGE_SECURITY 
		--	WHERE SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
		--	AND SOURCE_ID = 'SEMA'		)
		,
		SOURCE_SEC_ID,
		FD_RECEIPT_NO,
		FD_DEPOSIT_AMT_CURR,
		FD_DEPOSIT_AMT,
		FD_DEPOSIT_MATURITY_DATE,
		'SEMA',
		'ACTIVE',  
		(SELECT cms_ref_id from CMS_CASH_DEPOSIT
			WHERE SOURCE_SECURITY_ID = t.SOURCE_SEC_ID
			AND SOURCE_ID = 'SEMA' 			
		)
	FROM SI_TEMP_SEMA_CO020 t , CMS_STAGE_SECURITY s 
	WHERE 
		NOT EXISTS 
			(SELECT '1' FROM CMS_STAGE_CASH_DEPOSIT c WHERE 
			c.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID
			)
		AND IS_VALID = 'Y'
		AND s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
		AND s.SOURCE_ID = 'SEMA'
		);
		
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 25);
	commit;
		
	----------------------------------------------------------    
	-- Process Limit - security linkage table 
	----------------------------------------------------------	
	lock table CMS_STAGE_LIMIT_SECURITY_MAP in share mode; 	
	UPDATE CMS_STAGE_LIMIT_SECURITY_MAP c
	SET(				
		CMS_LSP_APPR_LMTS_ID,
		SCI_LAS_LMT_ID,
		CUSTOMER_CATEGORY,
		CMS_LSP_LMT_PROFILE_ID,
		SCI_LAS_LE_ID,
		--CREATE_DATE,
		SOURCE_ID,
		UPDATE_STATUS_IND) =
	(SELECT 
		cms_stg_lmt_id,
		t.CIF_ID,
		'MB',
		(SELECT 
		CMS_LIMIT_PROFILE_ID 
			FROM STAGE_LIMIT 
			WHERE CMS_LSP_APPR_LMTS_ID = t.cms_stg_lmt_id 
			AND SOURCE_ID = 'SEMA'			
			),
		t.CIF_ID,
		--CURRENT TIMESTAMP,
		'SEMA',
		'U'
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE  c.CMS_COLLATERAL_ID = t.CMS_COLLATERAL_ID 		
		    --AND SCI_LAS_LMT_ID = t.CIF_ID		
			AND CMS_LSP_APPR_LMTS_ID = t.cms_stg_lmt_id 			
			AND IS_VALID = 'Y'			
			)
	WHERE 
		EXISTS 
			(SELECT '1' 
				FROM SI_TEMP_SEMA_CO020 t, CMS_SECURITY s
				WHERE c.CMS_COLLATERAL_ID = t.CMS_COLLATERAL_ID		
				--and c.SCI_LAS_LMT_ID = t.CIF_ID	
				AND c.CMS_LSP_APPR_LMTS_ID = t.CMS_STG_LMT_ID 
				and c.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID 
				AND s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
				AND s.SOURCE_ID = 'SEMA'							
				AND IS_VALID = 'Y');
						
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 26);
	commit;	
	
	lock table CMS_STAGE_LIMIT_SECURITY_MAP in share mode; 	
	
	INSERT INTO 
		CMS_STAGE_LIMIT_SECURITY_MAP (
		CHARGE_ID,
		CMS_LSP_APPR_LMTS_ID,
		CMS_COLLATERAL_ID,
		SCI_LAS_LMT_ID,
		CUSTOMER_CATEGORY,
		CMS_LSP_LMT_PROFILE_ID,
		SCI_LAS_LE_ID ,
		CREATE_DATE,
		SOURCE_ID,
		UPDATE_STATUS_IND)
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_MAP_SEQ), 2)) as BIGINT), 
		cms_stg_lmt_id, 
		(SELECT CMS_COLLATERAL_ID 
				FROM CMS_SECURITY 
				WHERE SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
				AND SOURCE_ID = 'SEMA'			
				),		
		t.CIF_ID,
		'MB',
		(SELECT CMS_LIMIT_PROFILE_ID 
			FROM STAGE_LIMIT 
			WHERE CMS_LSP_APPR_LMTS_ID = t.cms_stg_lmt_id 
			AND SOURCE_ID = 'SEMA'		
			),
		t.CIF_ID,
		CURRENT TIMESTAMP,
		'SEMA',
		'I'
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE 
		NOT EXISTS 
			(SELECT '1' 
				FROM CMS_STAGE_LIMIT_SECURITY_MAP m, CMS_SECURITY s 
				WHERE m.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID 
				AND s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
				--and m.SCI_LAS_LMT_ID = T.CIF_ID 
				AND m.CMS_LSP_APPR_LMTS_ID = t.CMS_STG_LMT_ID 
				AND m.SOURCE_ID = 'SEMA'
				AND s.SOURCE_ID = 'SEMA')
		AND IS_VALID = 'Y');

	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 27);
	commit;			
	---------------------------------------------------------    
	-- Process Charge table 
	----------------------------------------------------------	
	lock table CMS_STAGE_CHARGE_DETAIL in share mode; 	
	UPDATE CMS_STAGE_CHARGE_DETAIL c
	SET(		
		CHARGE_AMOUNT, CHARGE_CURRENCY_CODE, SCI_LAS_SEC_ID, SOURCE_ID,
		STATUS) =
	(SELECT 
		t.FD_PLEDGED_AMT, t.FD_PLEDGED_AMT_CURR, SOURCE_SEC_ID, 'SEMA',
		'ACTIVE'
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE c.CMS_COLLATERAL_ID = t.CMS_STG_COLLATERAL_ID 			
			AND IS_VALID = 'Y') 
	WHERE 
		EXISTS 
			(SELECT '1'
				FROM SI_TEMP_SEMA_CO020
				WHERE 
					c.CMS_COLLATERAL_ID = CMS_STG_COLLATERAL_ID 					
					AND IS_VALID = 'Y');
	
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 28);
	commit;
	
	lock table CMS_STAGE_CHARGE_DETAIL in share mode; 	
		
	INSERT INTO 
		CMS_STAGE_CHARGE_DETAIL (CHARGE_DETAIL_ID, CHARGE_AMOUNT, CHARGE_CURRENCY_CODE,
		CMS_COLLATERAL_ID, CMS_REF_ID, SCI_LAS_SEC_ID, SOURCE_ID, STATUS)
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_CHARGE_SEQ), 2)) as BIGINT), 
		t.FD_PLEDGED_AMT, t.FD_PLEDGED_AMT_CURR,
		s.CMS_COLLATERAL_ID,
		(SELECT d.cms_ref_id from CMS_CHARGE_DETAIL d
			WHERE SCI_LAS_SEC_ID = t.SOURCE_SEC_ID
			AND SOURCE_ID = 'SEMA' 			
		), SOURCE_SEC_ID, 'SEMA',
		'ACTIVE'			
	FROM SI_TEMP_SEMA_CO020 t, CMS_STAGE_SECURITY s 
	WHERE 
		NOT EXISTS 
		(SELECT '1'
			FROM CMS_STAGE_CHARGE_DETAIL
			WHERE 				
				SCI_LAS_SEC_ID = t.SOURCE_SEC_ID
				AND SOURCE_ID = 'SEMA')			
		AND IS_VALID = 'Y'
		AND s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
		AND s.SOURCE_ID = 'SEMA');		
										
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 29);
	commit;		
		----------------------------------------------------------    
	-- Process Charge - limit linkage table 
	----------------------------------------------------------	
			
	lock table CMS_STAGE_LIMIT_CHARGE_MAP in share mode; 	
	
    UPDATE CMS_STAGE_LIMIT_CHARGE_MAP c
	SET(				
		CMS_LSP_APPR_LMTS_ID,
		CHARGE_ID,
		CHARGE_DETAIL_ID,
		STATUS,
		CUSTOMER_CATEGORY) =
	(SELECT 
		t.CMS_ACT_LMT_ID,
		(SELECT CHARGE_ID 
				FROM CMS_LIMIT_SECURITY_MAP m, CMS_SECURITY s
				WHERE 
				m.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID
				and s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID 
				--and SCI_LAS_LMT_ID = T.CIF_ID 
				AND m.CMS_LSP_APPR_LMTS_ID = t.CMS_ACT_LMT_ID 	
				AND m.SOURCE_ID = 'SEMA'		
				AND s.SOURCE_ID = 'SEMA'						
				),
		(SELECT CHARGE_DETAIL_ID 
				FROM CMS_STAGE_CHARGE_DETAIL c
				where c.CMS_COLLATERAL_ID = t.CMS_STG_COLLATERAL_ID				
				),
		'ACTIVE',
		'MB'		
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE c.CMS_COLLATERAL_ID = t.CMS_STG_COLLATERAL_ID 			
			AND IS_VALID = 'Y')
	WHERE 
		EXISTS 
			(SELECT '1' 
				FROM SI_TEMP_SEMA_CO020 t 
				WHERE c.CMS_COLLATERAL_ID = CMS_STG_COLLATERAL_ID 
				AND IS_VALID = 'Y');
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 30);
	commit;
	lock table CMS_STAGE_LIMIT_CHARGE_MAP in share mode; 	
	
	INSERT INTO 
		CMS_STAGE_LIMIT_CHARGE_MAP (
		LIMIT_CHARGE_MAP_ID,
		CMS_LSP_APPR_LMTS_ID,
		CHARGE_ID,
		CHARGE_DETAIL_ID,
		CMS_COLLATERAL_ID,
		STATUS,
		CUSTOMER_CATEGORY  )
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR LIMIT_CHARGE_MAP_SEQ), 2)) as BIGINT), 
		t.CMS_ACT_LMT_ID, 
		(SELECT CHARGE_ID 
				FROM CMS_LIMIT_SECURITY_MAP m, CMS_SECURITY s
				WHERE 
				m.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID
				and s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID 
				--and SCI_LAS_LMT_ID = T.CIF_ID 
				AND m.CMS_LSP_APPR_LMTS_ID = t.CMS_ACT_LMT_ID 	
				AND m.SOURCE_ID = 'SEMA'
				AND s.SOURCE_ID = 'SEMA'				
				), 
		(SELECT CHARGE_DETAIL_ID 
				FROM CMS_STAGE_CHARGE_DETAIL c, CMS_STAGE_SECURITY s
				where c.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID
				and s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
				AND s.SOURCE_ID = 'SEMA'				
				),
		(SELECT CMS_COLLATERAL_ID 
				FROM CMS_STAGE_SECURITY 
				WHERE SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
				AND SOURCE_ID = 'SEMA'			
				), 
		'ACTIVE',
		'MB'		
	FROM SI_TEMP_SEMA_CO020 t 
	WHERE 
		NOT EXISTS 
			(SELECT '1' 
				FROM CMS_STAGE_LIMIT_CHARGE_MAP m, CMS_STAGE_SECURITY s 
				WHERE m.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID 
				AND s.SCI_SECURITY_DTL_ID = t.SOURCE_SEC_ID
				AND s.SOURCE_ID = 'SEMA')
				AND IS_VALID = 'Y');
				
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_CO020', 'SEMA', 0);
	commit;		
	
	
END
@
  
CREATE PROCEDURE SI_RUN_TEMP_SEMA_DELETE
	LANGUAGE SQL
BEGIN

	DECLARE v_count INTEGER;
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 1);		
			
	
	--------------------------------------------------------------------------
	--
	---  Update limit profile status and create date        
	--
	--------------------------------------------------------------------------
	
	CALL SI_RUNSTATS('SCI_LSP_APPR_LMTS');
	
	--------------------------------------------------------------------------	
	--- 1) Update outer limit to deleted if all inner limit is deleted	
	--------------------------------------------------------------------------
	
	DECLARE GLOBAL TEMPORARY TABLE SESSION.del_limit(approve_limit_id bigint, limit_profile_id bigint) 
		WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;	
		
	lock table SCI_LSP_APPR_LMTS in share mode; 
	
	insert into SESSION.del_limit (approve_limit_id, limit_profile_id)
	(select CMS_LSP_APPR_LMTS_ID, CMS_LIMIT_PROFILE_ID
		from sci_lsp_appr_lmts p
		where 		 
		NOT EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS	 WHERE  					  
								 LMT_OUTER_LMT_ID IS NOT NULL   -- no active inner limits
								 AND LMT_OUTER_LMT_ID = p.CMS_LSP_APPR_LMTS_ID
								 AND CMS_LIMIT_STATUS ='ACTIVE'
							     AND source_id = 'SEMA'
								 )
-- 		AND
-- 		EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS WHERE  					  
-- 								 CMS_OUTER_LMT_REF IS NOT NULL  --all inner limits deleted
-- 								 AND CMS_OUTER_LMT_REF  = char(p.CMS_LSP_APPR_LMTS_ID)
-- 								 AND CMS_LIMIT_STATUS ='DELETED'
-- 								 AND source_id = 'SEMA'
-- 								 )
		AND CMS_LIMIT_STATUS ='ACTIVE'
		AND SOURCE_ID = 'SEMA'
		AND lmt_outer_lmt_id IS NULL);	
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 2);
	commit;
	
	create index session.t_del_lmt_profile_idx on session.del_limit (limit_profile_id desc) allow reverse scans;
	create index session.t_del_limit_idx on session.del_limit (approve_limit_id desc) allow reverse scans;
		
	lock table SCI_LSP_APPR_LMTS in share mode; 
	
	UPDATE SCI_LSP_APPR_LMTS a SET CMS_LIMIT_STATUS ='DELETED', UPDATE_STATUS_IND = 'D'  
    where a.cms_lsp_appr_lmts_id in 
		(select approve_limit_id from session.del_limit);
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 3);
	commit;
	
	lock table sci_lsp_lmt_profile in share mode; 			

	update sci_lsp_lmt_profile a set cms_bca_status = 'DELETED', UPDATE_STATUS_IND = 'D'
	where a.cms_lsp_lmt_profile_id in 
		(select distinct limit_profile_id from session.del_limit)
	and a.cms_bca_status = 'ACTIVE'
	and source_id = 'SEMA';
	 
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 4);
	commit;	 
	
	--drop TABLE SESSION.del_limit;  	
	
	--------------------------------------------------------------------------	
	--- 2) update limit profile to deleted if all inner limit is deleted
	--------------------------------------------------------------------------
	
	DECLARE GLOBAL TEMPORARY TABLE SESSION.del_limit_stg(stg_approve_limit_id bigint, stg_limit_profile_id bigint) 
		WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;	
		
	lock table STAGE_LIMIT in share mode; 
	
	insert into SESSION.del_limit_stg (stg_approve_limit_id, stg_limit_profile_id)
		(select cms_lsp_appr_lmts_id, cms_limit_profile_id
		from STAGE_LIMIT, transaction t
		where 
		reference_id in 
		(select approve_limit_id from session.del_limit) 
		AND staging_reference_id = cms_lsp_appr_lmts_id
		AND transaction_type = 'LIMIT'
		);
			
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 5);
	commit;
	
	create index session.t_del_lmt_profile_idx_stg on session.del_limit_stg (stg_limit_profile_id desc) allow reverse scans;
	create index session.t_del_limit_idx_stg on session.del_limit_stg (stg_approve_limit_id desc) allow reverse scans;
	
	lock table STAGE_LIMIT in share mode; 
	
	UPDATE STAGE_LIMIT a SET CMS_LIMIT_STATUS ='DELETED', UPDATE_STATUS_IND = 'D'  
    where a.cms_lsp_appr_lmts_id in 
		(select stg_approve_limit_id from session.del_limit_stg);
		
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 6);
	commit;	
	
	lock table stage_limit_profile in share mode; 			

	update stage_limit_profile a set cms_bca_status = 'DELETED', UPDATE_STATUS_IND = 'D'
	where a.cms_lsp_lmt_profile_id in 
		(select distinct stg_limit_profile_id from session.del_limit_stg)
	and a.cms_bca_status = 'ACTIVE'
	and source_id = 'SEMA';
	 
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 7);
	commit;	 
	
	drop TABLE SESSION.del_limit;  
	drop TABLE SESSION.del_limit_stg;  	
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 8);
	commit;	 
	
	--------------------------------------------------------------------------	
	--- 3) CLIMS to derived the earliest facility approval date.
	--------------------------------------------------------------------------
   
	lock table si_sema_update_AA_date in share mode; 
    delete from si_sema_update_AA_date;
   
    CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 9);
    commit;
	
    lock table si_sema_update_AA_date in share mode; 
    insert into si_sema_update_AA_date (CMS_LIMIT_PROFILE_ID, CREATE_DATE)
	(select cms_limit_profile_id, min(create_date) 
	from sci_lsp_appr_lmts
	where source_id = 'SEMA'
	and create_date is not null
	group by cms_limit_profile_id);
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 10);
	commit;
	
	
	lock table si_sema_update_AA_date in share mode; 
    update si_sema_update_AA_date a set cms_stg_limit_profile_id= 
	(select staging_reference_id
	from transaction
	where a.cms_limit_profile_id = reference_id
	AND transaction_type = 'LIMITPROFILE'
	);
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 11);
	commit;
	
	--CALL SI_RUNSTATS('SI_SEMA_UPDATE_AA_DATE');
	--CALL SYSPROC.ADMIN_CMD('REORG INDEXES ALL FOR TABLE SI_SEMA_UPDATE_AA_DATE ALLOW READ ACCESS');	
			 
	lock table sci_lsp_lmt_profile in share mode; 
	
	UPDATE sci_lsp_lmt_profile a SET (cms_bca_create_date) = 
    (select create_date from si_sema_update_AA_date
	where a.cms_lsp_lmt_profile_id = cms_limit_profile_id ) 
  	WHERE a.cms_bca_status ='ACTIVE'
	AND source_id = 'SEMA'
	and cms_bca_create_date is null;	
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 12);
	commit; 
	
	lock table stage_limit_profile in share mode; 
	
	UPDATE stage_limit_profile a SET (cms_bca_create_date) = 
    (select create_date from si_sema_update_AA_date
	where a.cms_lsp_lmt_profile_id = cms_stg_limit_profile_id ) 
  	WHERE a.cms_bca_status ='ACTIVE'
	AND source_id = 'SEMA'
	and cms_bca_create_date is null;	
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 13);
	commit; 
	
	----------------------------------------------------------    
	-- 4) Update status to DELETED in limit-sec linkage tables if records not found in SI file
	----------------------------------------------------------
			
	--------------------------------------------------------------------------	
	---  Update security	
	--------------------------------------------------------------------------

	SELECT COUNT(*) INTO v_count FROM SI_TEMP_SEMA_CO020	;
	IF v_count > 0 THEN
	
		DECLARE GLOBAL TEMPORARY TABLE SESSION.del_security(col_id bigint, stg_col_id bigint) 
			WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;	
			
		lock table CMS_SECURITY in share mode; 
		
		insert into SESSION.del_security (col_id)
		(select CMS_COLLATERAL_ID
			from CMS_SECURITY s
			where 					
			-- security not found in SI
			NOT EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CO020 where  					  
									s.SCI_SECURITY_DTL_ID = SOURCE_SEC_ID
									AND IS_VALID = 'Y' )		
			AND STATUS <> 'DELETED'
			AND SOURCE_ID = 'SEMA'
		--UNION		
		--select CMS_COLLATERAL_ID
		--	from CMS_LIMIT_SECURITY_MAP m
		--	where 						
			-- all account is closed
		--	EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS where  					  
		--						 ( LMT_OUTER_LMT_ID IS NULL  --parent limit only
			--					 or LMT_OUTER_LMT_ID = CMS_LSP_APPR_LMTS_ID )
				--				 AND CMS_LSP_APPR_LMTS_ID  = m.CMS_LSP_APPR_LMTS_ID
					--			 AND CMS_LIMIT_STATUS ='DELETED'
					--			  AND source_id = 'SEMA'
						--		 ) 
		--	AND UPDATE_STATUS_IND <> 'D'		
			);	
			
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 14);
		commit;
		
		insert into SESSION.del_security (stg_col_id)
			(select CMS_COLLATERAL_ID
			from CMS_STAGE_SECURITY, transaction t
			where 
			reference_id in 
			(select col_id from session.del_security) 
			AND staging_reference_id = CMS_COLLATERAL_ID
			AND transaction_type = 'COL'
			);
				
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 15);
		commit;
		
		create index session.t_del_security_idx on session.del_security (col_id desc) allow reverse scans;
		create index session.t_del_security_idx_stg on session.del_security (stg_col_id desc) allow reverse scans;
		
		----------------------------------------------------------    
		-- 5) Update status to DELETED in limit-charge linkage tables if records not found in SI file
		----------------------------------------------------------	
		lock table CMS_LIMIT_CHARGE_MAP in share mode; 	
		
		UPDATE CMS_LIMIT_CHARGE_MAP
		SET 
		STATUS = 'DELETED'
		WHERE 
		CMS_COLLATERAL_ID in 
			(select distinct col_id from session.del_security);  	
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 16);
		commit;
		
		lock table CMS_LIMIT_SECURITY_MAP in share mode; 	
		
		UPDATE CMS_LIMIT_SECURITY_MAP
		SET 
		UPDATE_STATUS_IND = 'D',
		DELETION_DATE = CURRENT TIMESTAMP	
		WHERE 
		SOURCE_ID = 'SEMA'
		AND CMS_COLLATERAL_ID in 
			(select distinct col_id from session.del_security);  	
					
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 17);
		commit;	
		
		
		----------------------------------------------------------    
		-- 8) Update status to DELETED in charge detail if no record found in limit-charge linkage tables 
		----------------------------------------------------------
		lock table CMS_CHARGE_DETAIL in share mode; 		
		
		UPDATE CMS_CHARGE_DETAIL c
		SET 
		STATUS = 'DELETED'
		WHERE 
		STATUS <> 'DELETED' 
		AND SOURCE_ID = 'SEMA' 
		AND 	
		--c.CMS_COLLATERAL_ID in
		--(SELECT CMS_COLLATERAL_ID FROM CMS_SECURITY s	
		--	WHERE 
		--		SOURCE_ID = 'SEMA' 
		--		AND 
		--		NOT EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CO020
		--			WHERE c.SCI_LAS_SEC_ID = SOURCE_SEC_ID
		--			AND c.SOURCE_ID='SEMA'
		--			AND IS_VALID = 'Y') 
		--)	
		--AND
		NOT EXISTS (SELECT '1' FROM CMS_LIMIT_CHARGE_MAP m 
			WHERE  c.CMS_COLLATERAL_ID = m.CMS_COLLATERAL_ID 
					and STATUS <> 'DELETED'
					);	
	
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 20);
		commit;
		
		----------------------------------------------------------    
		-- 9) Update status to DELETED in cash deposit detail if no record found in limit-sec linkage tables 
		----------------------------------------------------------
		lock table CMS_CASH_DEPOSIT in share mode; 	
		
		UPDATE CMS_CASH_DEPOSIT c
		SET 
		STATUS = 'DELETED'
		WHERE 
		STATUS <> 'DELETED' 
		AND 
		--c.CMS_COLLATERAL_ID in
		--(SELECT CMS_COLLATERAL_ID FROM CMS_SECURITY s	
		--	WHERE 
		--		SOURCE_ID = 'SEMA' 
		--		AND 
		--		NOT EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CO020
		--			WHERE c.SOURCE_SECURITY_ID = SOURCE_SEC_ID
					--and SOURCE_ID = 'SEMA' 
		--			AND IS_VALID = 'Y') 
		--)
		--AND
		NOT EXISTS (SELECT '1' FROM CMS_LIMIT_SECURITY_MAP m 
			WHERE  c.CMS_COLLATERAL_ID = m.CMS_COLLATERAL_ID 
					and m.SOURCE_ID = 'SEMA'
			and UPDATE_STATUS_IND <> 'D'
					);
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 21);
		commit;
		
		----------------------------------------------------------    
		-- 10) Update status to DELETED in security source detail if no record found in limit-sec linkage tables 
		----------------------------------------------------------
		lock table CMS_SECURITY_SOURCE in share mode; 	
		
		UPDATE CMS_SECURITY_SOURCE c
		SET 
		STATUS = 'DELETED'
		WHERE 
		STATUS <> 'DELETED' 
		AND SOURCE_ID = 'SEMA' 
		AND
		--c.CMS_COLLATERAL_ID in
		--(SELECT CMS_COLLATERAL_ID FROM CMS_SECURITY s	
		--	WHERE 
		--		SOURCE_ID = 'SEMA' 
		--		AND 
		--		NOT EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CO020
		--			WHERE c.SOURCE_SECURITY_ID = SOURCE_SEC_ID
					--and c.SOURCE_ID = 'SEMA'
		--			AND IS_VALID = 'Y') 
		--)
		--AND
		NOT EXISTS (SELECT '1' FROM CMS_LIMIT_SECURITY_MAP m 
			WHERE  c.CMS_COLLATERAL_ID = m.CMS_COLLATERAL_ID 
			and m.SOURCE_ID = 'SEMA'
					and UPDATE_STATUS_IND <> 'D'
					);
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 22);
		commit;
		
		----------------------------------------------------------    
		-- 11) Update status to DELETED in Security detail if no record found in limit-sec linkage tables 
		----------------------------------------------------------
		lock table CMS_SECURITY in share mode; 	
		
		UPDATE CMS_SECURITY s 
		SET 
		STATUS = 'DELETED'
		WHERE 
		SOURCE_ID = 'SEMA' 
		AND STATUS <> 'DELETED' 
		AND	
		--NOT EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CO020
		--	WHERE  s.SCI_SECURITY_DTL_ID = SOURCE_SEC_ID
			--and s.SOURCE_ID = 'SEMA'
		--	AND IS_VALID = 'Y')
		--AND
		NOT EXISTS (SELECT '1' FROM CMS_LIMIT_SECURITY_MAP m 
			WHERE  s.CMS_COLLATERAL_ID = m.CMS_COLLATERAL_ID 
			and m.SOURCE_ID = 'SEMA'
					and UPDATE_STATUS_IND <> 'D'
					);
			
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 23);
		commit;
		
		--lock table CMS_CASH_DEPOSIT in share mode; 	
		--UPDATE CMS_CASH_DEPOSIT c
		--SET 
		--STATUS = 'DELETED'
		--WHERE 
		--STATUS <> 'DELETED' 
		--AND 
		--NOT EXISTS (SELECT '1' FROM CMS_SECURITY m 
		--	WHERE  c.CMS_COLLATERAL_ID = m.CMS_COLLATERAL_ID 
		--	and SOURCE_ID = 'SEMA' 
		--	and STATUS <> 'DELETED'
		--	);  
		
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 24);
		commit;
		
		----------------------------------------------------------    
		-- 12) Update status to DELETED in sec-pledgor linkages if no record found in security tables 
		----------------------------------------------------------
		lock table SCI_SEC_PLDGR_MAP in share mode; 	
		UPDATE SCI_SEC_PLDGR_MAP c
		SET 
		UPDATE_STATUS_IND = 'D'
		WHERE 
		UPDATE_STATUS_IND <> 'D' 	
		AND SOURCE_ID = 'SEMA'
		AND 
		NOT EXISTS (SELECT '1' FROM CMS_SECURITY m 
			WHERE  c.CMS_COLLATERAL_ID = m.CMS_COLLATERAL_ID 
			and SOURCE_ID = 'SEMA' 
			and STATUS <> 'DELETED'
			);   
		
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 25);
		commit;
		
		----------------------------------------------------------    
		-- 13) Update status to DELETED in pledgor detail if no record found in security-pledgor linkages tables 
		----------------------------------------------------------
		lock table SCI_PLEDGOR_DTL in share mode; 	
		
		UPDATE SCI_PLEDGOR_DTL p
		SET 
		UPDATE_STATUS_IND = 'D'
		WHERE 
		UPDATE_STATUS_IND <> 'D'     
		AND SOURCE_ID = 'SEMA'  
		AND NOT EXISTS 
		(SELECT '1' FROM SCI_SEC_PLDGR_MAP m	
			WHERE 
				m.SOURCE_ID = 'SEMA' 			
				AND p.CMS_PLEDGOR_DTL_ID = m.CMS_PLEDGOR_DTL_ID 
				AND m.UPDATE_STATUS_IND <> 'D');  		
			
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 26);
		commit;
		
		----------------------------------------------------------    
		-- 6) Update status to DELETED in limit-charge linkage tables if all account is close
		----------------------------------------------------------
					
		lock table CMS_LIMIT_CHARGE_MAP in share mode; 	
		
		UPDATE CMS_LIMIT_CHARGE_MAP m
		SET 
		STATUS = 'DELETED'
		WHERE 
		STATUS <> 'DELETED' 
		AND 
		EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS where  					  
								( LMT_OUTER_LMT_ID IS NULL  --parent limit only
								or LMT_OUTER_LMT_ID = CMS_LSP_APPR_LMTS_ID )
								AND CMS_LSP_APPR_LMTS_ID  = m.CMS_LSP_APPR_LMTS_ID
								AND CMS_LIMIT_STATUS ='DELETED'
									AND source_id = 'SEMA'
								);  
								
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 2601);
		commit;
		
		----------------------------------------------------------    
		-- 7) Update status to DELETED in limit-sec linkage tables if all account is close
		----------------------------------------------------------
		lock table CMS_LIMIT_SECURITY_MAP in share mode; 	
		UPDATE CMS_LIMIT_SECURITY_MAP m
		SET 
		UPDATE_STATUS_IND = 'D',
		DELETION_DATE = CURRENT TIMESTAMP
		WHERE 
		UPDATE_STATUS_IND <> 'D' 
		AND SOURCE_ID = 'SEMA'
		AND 
		EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS where  					  
								( LMT_OUTER_LMT_ID IS NULL  --parent limit only
								or LMT_OUTER_LMT_ID = CMS_LSP_APPR_LMTS_ID )
								AND CMS_LSP_APPR_LMTS_ID  = m.CMS_LSP_APPR_LMTS_ID
								AND CMS_LIMIT_STATUS ='DELETED'
									AND source_id = 'SEMA'
								);  
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 2602);
		commit;
		
		----------------------------------------------------------    
		-- Staging Tables
		----------------------------------------------------------
		
		----------------------------------------------------------    
		-- 14) Update status to DELETED in limit-charge linkage tables if records not found in SI file
		----------------------------------------------------------
		
		lock table CMS_STAGE_LIMIT_CHARGE_MAP in share mode; 	
		UPDATE CMS_STAGE_LIMIT_CHARGE_MAP m
		SET 
		STATUS = 'DELETED'
		WHERE 
		CMS_COLLATERAL_ID in 
			(select distinct stg_col_id from session.del_security);
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 27);
		commit;
		
		----------------------------------------------------------    
		-- 15) Update status to DELETED in limit-sec linkage tables if records not found in SI file
		----------------------------------------------------------
		lock table CMS_STAGE_LIMIT_SECURITY_MAP in share mode; 	
		
		UPDATE CMS_STAGE_LIMIT_SECURITY_MAP m
		SET 
		UPDATE_STATUS_IND = 'D',
		DELETION_DATE = CURRENT TIMESTAMP	
		WHERE 
		SOURCE_ID = 'SEMA'
		AND CMS_COLLATERAL_ID in 
			(select distinct col_id from session.del_security);
					
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 28);
		commit;
		
		
		----------------------------------------------------------    
		-- 18) Update status to DELETED in charge detail if no record found in limit-charge linkage tables 
		----------------------------------------------------------
		lock table CMS_STAGE_CHARGE_DETAIL in share mode; 	
		
		UPDATE CMS_STAGE_CHARGE_DETAIL c
		SET 
		STATUS = 'DELETED'
		WHERE 
		STATUS <> 'DELETED' 
		AND SOURCE_ID = 'SEMA' 
		--AND c.CMS_COLLATERAL_ID in
		--(SELECT CMS_COLLATERAL_ID FROM CMS_STAGE_SECURITY s	
		--	WHERE 
		--		SOURCE_ID = 'SEMA' 
		--		AND 
		--		NOT EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CO020
		--			WHERE c.SCI_LAS_SEC_ID = SOURCE_SEC_ID
		--			AND c.SOURCE_ID = 'SEMA'
		--			AND IS_VALID = 'Y') 
		--)
		AND
		NOT EXISTS (SELECT '1' FROM CMS_STAGE_LIMIT_CHARGE_MAP m 
			WHERE  c.CMS_COLLATERAL_ID = m.CMS_COLLATERAL_ID 		
					and STATUS <> 'DELETED'
					);	
	
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 31);
		commit;
		
		----------------------------------------------------------    
		-- 19) Update status to DELETED in security detail if no record found in limit-charge linkage tables 
		----------------------------------------------------------
		lock table CMS_STAGE_SECURITY in share mode; 	
		
		UPDATE CMS_STAGE_SECURITY s 
		SET 
		STATUS = 'DELETED'
		WHERE 
		SOURCE_ID = 'SEMA' 
		AND STATUS <> 'DELETED' 
		AND	
		--NOT EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CO020
		--	WHERE  s.SCI_SECURITY_DTL_ID = SOURCE_SEC_ID
		--	AND IS_VALID = 'Y')
		--AND	
		--		(SELECT '1' FROM CMS_SECURITY a
		--	WHERE  s.SCI_SECURITY_DTL_ID = a.SCI_SECURITY_DTL_ID 	
		--	and a.SOURCE_ID = 'SEMA' 		
			--    and STATUS <> 'DELETED'
			--    );
		NOT EXISTS (SELECT '1' FROM CMS_STAGE_LIMIT_CHARGE_MAP m 
			WHERE  s.CMS_COLLATERAL_ID = m.CMS_COLLATERAL_ID 		
					and STATUS <> 'DELETED'
					);	
			
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 32);
		commit;
		
		----------------------------------------------------------    
		-- 20) Update status to DELETED in cash deposit detail if no record found in limit-charge linkage tables 
		----------------------------------------------------------
		lock table CMS_STAGE_CASH_DEPOSIT in share mode; 	
		
		UPDATE CMS_STAGE_CASH_DEPOSIT c
		SET 
		STATUS = 'DELETED'
		WHERE 
		STATUS <> 'DELETED' 
		AND source_id='SEMA'	
		--AND c.CMS_COLLATERAL_ID in
		--(SELECT CMS_COLLATERAL_ID FROM CMS_STAGE_SECURITY s	
		--	WHERE 
		--		SOURCE_ID = 'SEMA' 
		--		AND 
		--		NOT EXISTS (SELECT '1' FROM SI_TEMP_SEMA_CO020
		--			WHERE c.SOURCE_SECURITY_ID = SOURCE_SEC_ID
		--			AND IS_VALID = 'Y') 
		--)
		AND
		--NOT EXISTS	
		--	(SELECT '1' FROM CMS_CASH_DEPOSIT a
		--	WHERE  c.SOURCE_SECURITY_ID = a.SOURCE_SECURITY_ID 	
		--	and a.SOURCE_ID = 'SEMA' 		
			--   and STATUS <> 'DELETED'
				--  );
		NOT EXISTS (SELECT '1' FROM CMS_STAGE_LIMIT_CHARGE_MAP m 
			WHERE  c.CMS_COLLATERAL_ID = m.CMS_COLLATERAL_ID 		
					and STATUS <> 'DELETED'
					);	
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 33);
		commit;	
		
		----------------------------------------------------------    
		-- 16) Update status to DELETED in limit-charge linkage tables if all account is close
		----------------------------------------------------------
		lock table CMS_STAGE_LIMIT_CHARGE_MAP in share mode; 	
		
		UPDATE CMS_STAGE_LIMIT_CHARGE_MAP m
		SET 
		STATUS = 'DELETED'
		WHERE 
		STATUS <> 'DELETED' 
		AND 
		EXISTS (SELECT '1' FROM SCI_LSP_APPR_LMTS where  					  
								( LMT_OUTER_LMT_ID IS NULL  --parent limit only
								or LMT_OUTER_LMT_ID = CMS_LSP_APPR_LMTS_ID )
								AND CMS_LSP_APPR_LMTS_ID  = m.CMS_LSP_APPR_LMTS_ID
								AND CMS_LIMIT_STATUS ='DELETED'
									AND source_id = 'SEMA'
								);  
					
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 34);
		commit;				
		
		----------------------------------------------------------    
		-- 17) Update status to DELETED in limit-sec linkage tables if all account is close
		----------------------------------------------------------
		lock table CMS_STAGE_LIMIT_SECURITY_MAP in share mode; 	
		UPDATE CMS_STAGE_LIMIT_SECURITY_MAP m
		SET 
		UPDATE_STATUS_IND = 'D',
		DELETION_DATE = CURRENT TIMESTAMP
		WHERE 
		UPDATE_STATUS_IND <> 'D' 
		AND SOURCE_ID = 'SEMA'
		AND 
		EXISTS (SELECT '1' FROM STAGE_LIMIT where  					  
								( LMT_OUTER_LMT_ID IS NULL  --parent limit only
								or LMT_OUTER_LMT_ID = CMS_LSP_APPR_LMTS_ID )
								AND CMS_LSP_APPR_LMTS_ID  = m.CMS_LSP_APPR_LMTS_ID
								AND CMS_LIMIT_STATUS ='DELETED'
									AND source_id = 'SEMA'
								);  
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 35);
		commit;
		
		drop TABLE SESSION.del_security;

	END IF;  
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_SEMA_DELETE', 'SEMA', 0);	
	
END
@

CREATE PROCEDURE SI_RUN_ALL_SEMA
	LANGUAGE SQL
BEGIN
	DECLARE v_count INTEGER;

	SELECT count(*) into v_count FROM si_temp_sema_cu004;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_SEMA_CU004;
		CALL SI_RUN_TEMP_SEMA_CU004;
		CALL UTIL_TRUNCATE_TABLE('si_temp_sema_cu004');
	END IF;
	
	SELECT count(*) into v_count FROM si_temp_sema_cu002;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_SEMA_CU002;
		CALL SI_RUN_TEMP_SEMA_CU002;
		CALL UTIL_TRUNCATE_TABLE('si_temp_sema_cu002');
	END IF;
	
	SELECT count(*) into v_count FROM si_temp_sema_ca001;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_SEMA_CA001;
		CALL SI_RUN_TEMP_SEMA_CA001;
		CALL UTIL_TRUNCATE_TABLE('si_temp_sema_ca001');
	END IF;
	
	SELECT count(*) into v_count FROM si_temp_sema_ca012;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_SEMA_CA012;
		CALL SI_RUN_TEMP_SEMA_CA012;
		CALL UTIL_TRUNCATE_TABLE('si_temp_sema_ca012');
	END IF;
	
	CALL SI_AUTO_CREATE_TRANSACTION;
	
	SELECT count(*) into v_count FROM si_temp_sema_co020;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_SEMA_CO020;
		CALL SI_RUN_TEMP_SEMA_CO020;
	END IF;
	
	CALL SI_AUTO_CREATE_TRANSACTION;
	
	CALL SI_RUN_TEMP_SEMA_DELETE;
	CALL UTIL_TRUNCATE_TABLE('si_temp_sema_co020');
END
@

commit work@