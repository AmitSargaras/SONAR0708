--DROP PROCEDURE si_log_proc_time@

--DROP PROCEDURE si_runstats@

--DROP PROCEDURE si_auto_create_transaction@

--DROP PROCEDURE si_host_update_transaction@

--DROP PROCEDURE si_host_update_trx_by_ref_and_type@

--DROP PROCEDURE si_auto_feed_standard_code@

--DROP PROCEDURE SI_GET_LOAD_TYPE@

--DROP PROCEDURE UTIL_TRUNCATE_TABLE@

--DROP PROCEDURE si_auto_update_valuation@

--DROP PROCEDURE SI_AUTO_UPDATE_NEW_PRODUCT_TYPE@

--DROP PROCEDURE SI_RUN_PRODUCT_PROGRAM@

--DROP PROCEDURE SI_RUN_PRODUCT_TYPE@

CREATE PROCEDURE SI_LOG_PROC_TIME (
    IN P_PROC_NAME VARCHAR(255),
    IN P_SOURCE_ID VARCHAR(10),
  	IN P_START_FLAG INT)
  LANGUAGE SQL
BEGIN ATOMIC
 
 INSERT INTO SI_PROC_TIME_LOG (proc_name, source_id, start_flag, time_stamp)
  VALUES (P_PROC_NAME, P_SOURCE_ID, P_START_FLAG, CURRENT_TIMESTAMP);
END
@

CREATE PROCEDURE si_runstats(IN p_table_name VARCHAR(128))
	LANGUAGE SQL
BEGIN
	DECLARE v_curr_schema VARCHAR(20);
	SET v_curr_schema = (VALUES CURRENT SCHEMA);
	
	CALL SYSPROC.ADMIN_CMD('RUNSTATS ON TABLE ' || RTRIM(v_curr_schema) || '.' || p_table_name
						   || ' ON ALL COLUMNS WITH DISTRIBUTION AND DETAILED INDEXES ALL');	
END
@


CREATE PROCEDURE si_auto_create_transaction
	LANGUAGE SQL
BEGIN
	
	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 1);
	
	-- CUSTOMER	
	LOCK TABLE transaction IN SHARE MODE;
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
							 transaction_date, reference_id, status, team_id, 
							 version, opsdesc, customer_id)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			   'ND', -1, 'CUSTOMER', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, cms_le_sub_profile_id, 'ACTIVE', 
			   0, 1, 'CREATE_CUSTOMER', cms_le_sub_profile_id
	   	  FROM sci_le_sub_profile s
	     WHERE NOT EXISTS (SELECT '1' FROM transaction
	   	  					WHERE reference_id = s.cms_le_sub_profile_id 
	   	  					  AND transaction_type = 'CUSTOMER')
	);

	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 2);
	COMMIT;
	
	-- LIMIT PROFILE
	LOCK TABLE transaction IN SHARE MODE;
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
							 transaction_date, reference_id, status, team_id, version, opsdesc, customer_id, 
							 trx_origin_country, trx_origin_organisation, limit_profile_id)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			   'ND', -1, 'LIMITPROFILE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, cms_lsp_lmt_profile_id,
		  	   'ACTIVE', 0, 1, 'CREATE', cms_customer_id, cms_orig_country, cms_orig_organisation, cms_lsp_lmt_profile_id
	   	  FROM SCI_LSP_LMT_PROFILE s
	   	 WHERE NOT EXISTS (SELECT '1' FROM transaction
	   	 					WHERE reference_id = s.cms_lsp_lmt_profile_id 
	   	 					  AND transaction_type = 'LIMITPROFILE')
	);
	
	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 3);
	COMMIT;

	LOCK TABLE transaction IN SHARE MODE;
	UPDATE transaction a SET trx_reference_id = (
		SELECT CAST(transaction_id AS BIGINT) 
		  FROM transaction, sci_le_sub_profile 
		 WHERE reference_id = cms_le_sub_profile_id
		   AND transaction_type = 'CUSTOMER'
		   AND a.customer_id = cms_le_sub_profile_id) 
	 WHERE trx_reference_id IS NULL
	   AND transaction_type = 'LIMITPROFILE';

	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 4);
	COMMIT;
	
	CALL SI_RUNSTATS('SCI_LE_SUB_PROFILE');
	CALL SI_RUNSTATS('SCI_LSP_LMT_PROFILE');
	
	-- update Sub profile's cms_non_borrower_ind

	LOCK TABLE sci_lsp_lmt_profile IN SHARE MODE;
	
	DECLARE GLOBAL TEMPORARY TABLE SESSION.customer_with_lmt_profile(cms_customer_id bigint) 
		WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;		
		
	insert into SESSION.customer_with_lmt_profile (cms_customer_id)
	(select distinct cms_customer_id
	from sci_lsp_lmt_profile 
	where cms_bca_status <> 'DELETED');
	
	commit;
	
	CREATE INDEX session.t_cust_lmt_profile_idx
             ON session.customer_with_lmt_profile(cms_customer_id DESC)
             allow REVERSE SCANS;	
			 
	
	LOCK TABLE sci_le_sub_profile IN SHARE MODE;		
--	UPDATE sci_le_sub_profile sp
--	   SET sp.cms_non_borrower_ind = 'N'
--	 WHERE (sp.cms_non_borrower_ind is null
--			OR sp.cms_non_borrower_ind = 'Y')
--	   AND EXISTS (SELECT 1
--					 FROM sci_lsp_lmt_profile pf
--					WHERE pf.cms_customer_id = sp.cms_le_sub_profile_id
--					  AND pf.llp_le_id = sp.lsp_le_id
--					  AND pf.cms_bca_status <> 'DELETED');
					  
	-- update non borrower ind to N if there is active limit profile
	UPDATE sci_le_sub_profile sp
	   SET sp.cms_non_borrower_ind = 'N'
	 WHERE (sp.cms_non_borrower_ind is null
			OR sp.cms_non_borrower_ind = 'Y')
	   AND EXISTS (SELECT 1
					 FROM SESSION.customer_with_lmt_profile
					WHERE cms_customer_id = sp.cms_le_sub_profile_id);
					
	commit;
	
	LOCK TABLE sci_le_sub_profile IN SHARE MODE;						
	-- update non borrower ind to Y if there is no active limit profile
	UPDATE sci_le_sub_profile sp
	   SET sp.cms_non_borrower_ind = 'Y'
	 WHERE (sp.cms_non_borrower_ind is null
			OR sp.cms_non_borrower_ind = 'N')
	   AND not EXISTS (SELECT 1
					 FROM SESSION.customer_with_lmt_profile
					WHERE cms_customer_id = sp.cms_le_sub_profile_id);
							
	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 5);
	COMMIT;
	
	drop table SESSION.customer_with_lmt_profile;
	
	-- update limit profile segment code based on customer segment code for newly inserted record
	LOCK TABLE sci_lsp_lmt_profile IN SHARE MODE;
	UPDATE sci_lsp_lmt_profile pf
	   SET (llp_segment_code_num, llp_segment_code_value) =
	(SELECT DISTINCT mp.lmp_sgmnt_code_num, mp.lmp_sgmnt_code_value
	   FROM sci_le_main_profile mp
	  WHERE mp.lmp_le_id = pf.llp_le_id
		AND mp.source_id = pf.cif_source_id)
	 WHERE pf.llp_segment_code_num is null
	   AND pf.llp_segment_code_value is null;
	
	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 6);
	COMMIT;
	
	-- LIMITS
	LOCK TABLE TRANSACTION in SHARE MODE;
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
							 transaction_date, reference_id, status, team_id, version, opsdesc, 
							 customer_id, trx_origin_country, trx_origin_organisation, limit_profile_id)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),  
	 	  	   'ND', -1, 'LIMIT', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, lmt.cms_lsp_appr_lmts_id, 'ACTIVE', 0, 1, 
	 	  	   'CREATE', bca.cms_customer_id, bca.cms_orig_country, bca.cms_orig_organisation, lmt.cms_limit_profile_id
	   	  FROM sci_lsp_appr_lmts lmt , sci_lsp_lmt_profile bca
		 WHERE lmt.cms_limit_profile_id = bca.cms_lsp_lmt_profile_id
		   AND NOT EXISTS (SELECT '1' FROM transaction 
		   					WHERE reference_id = lmt.cms_lsp_appr_lmts_id 
		   					  AND transaction_type = 'LIMIT')
	);

	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 7);
	COMMIT;
	
	LOCK TABLE transaction in SHARE MODE;
	UPDATE transaction a SET trx_reference_id = (
		SELECT CAST(transaction_id AS BIGINT) 
		  FROM transaction, sci_lsp_lmt_profile 
		 WHERE reference_id = CMS_LSP_LMT_PROFILE_ID
		   AND transaction_type = 'LIMITPROFILE'
		   AND a.limit_profile_id = CMS_LSP_LMT_PROFILE_ID) 
	 WHERE trx_reference_id IS NULL
	   AND transaction_type = 'LIMIT';

	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 8);
	COMMIT;
	
	-- COBORROWER LIMITS
	LOCK TABLE transaction IN SHARE MODE;
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
							 transaction_date, reference_id, status, team_id, version, opsdesc, customer_id, 
							 trx_origin_country, trx_origin_organisation, limit_profile_id)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),  
	 	  	   'ND', -1, 'COBORROWER_LIMIT', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, cblmt.cms_lsp_co_borrow_lmt_id, 'ACTIVE', 0, 1, 
			   'CREATE', cblmt.cms_customer_id, sp.cms_sub_orig_country, sp.cms_sub_orig_organisation, lmt.cms_limit_profile_id
	   	  FROM sci_lsp_co_borrow_lmt cblmt, sci_lsp_appr_lmts lmt, sci_le_sub_profile sp
		 WHERE cblmt.cms_limit_id = lmt.cms_lsp_appr_lmts_id
		   AND sp.cms_le_sub_profile_id = cblmt.cms_customer_id
		   AND NOT EXISTS (SELECT '1' FROM transaction 
		   					WHERE reference_id = cblmt.cms_lsp_co_borrow_lmt_id 
		   					 AND transaction_type = 'COBORROWER_LIMIT')
	);
	
	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 9);
	COMMIT;
	
	LOCK TABLE transaction in SHARE MODE;

	UPDATE transaction a SET trx_reference_id = (
		SELECT CAST(transaction_id AS BIGINT) 
		  FROM transaction, sci_lsp_appr_lmts mb, sci_lsp_co_borrow_lmt cb
		 WHERE reference_id = cms_lsp_co_borrow_lmt_id
		   AND transaction_type = 'LIMIT'
		   AND mb.cms_lsp_appr_lmts_id = cb.cms_limit_id
		 FETCH FIRST ROW ONLY) 
	 WHERE trx_reference_id IS NULL
	   AND transaction_type = 'COBORROWER_LIMIT';

	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 10);
	COMMIT;
	
	-- COLLATERAL
	LOCK TABLE transaction IN SHARE MODE;
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
							 transaction_date, reference_id, status, team_id, 
							 version, opsdesc)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			   'ND', -1, 'COL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, cms_collateral_id, 'ACTIVE', 0, 1, 'SUBSCRIBE_CREATE'
		  FROM cms_security s
		 WHERE NOT EXISTS (SELECT '1' FROM transaction 
		 					WHERE reference_id = s.cms_collateral_id 
		 					  AND transaction_type = 'COL')
	);

	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 11);
	COMMIT;
	
	CALL SI_RUNSTATS('TRANSACTION');
	CALL SI_RUNSTATS('STAGE_LIMIT_PROFILE');	
	CALL SI_RUNSTATS('SCI_LSP_APPR_LMTS');
	CALL SI_RUNSTATS('STAGE_LIMIT');
	CALL SI_RUNSTATS('CMS_SECURITY');
	CALL SI_RUNSTATS('CMS_STAGE_SECURITY');
	CALL SI_RUNSTATS('SCI_LSP_CO_BORROW_LMT');
	CALL SI_RUNSTATS('STAGE_CO_BORROWER_LIMIT');

	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 12);
	COMMIT;

	LOCK TABLE transaction IN SHARE MODE;
	UPDATE transaction
		 SET staging_reference_id = (SELECT MAX(s.cms_lsp_lmt_profile_id)
		 	 						  	   FROM sci_lsp_lmt_profile a, stage_limit_profile s
										  WHERE	a.llp_bca_ref_num = s.llp_bca_ref_num
										    AND a.source_id = s.source_id
										 	AND	a.cms_lsp_lmt_profile_id = reference_id),
			 cur_trx_history_id = CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') 
			 					  || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))								 	
	 WHERE transaction_type = 'LIMITPROFILE'
	   AND staging_reference_id IS NULL;

	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 13);
	COMMIT;
	
-- 	LOCK TABLE transaction IN SHARE MODE;
-- 	UPDATE transaction
-- 		 SET staging_reference_id = (SELECT max(s.cms_lsp_appr_lmts_id)
-- 									   FROM sci_lsp_appr_lmts a, stage_limit s
-- 									  WHERE a.lmt_id = s.lmt_id
-- 									    AND a.source_id = s.source_id
-- 									    AND a.cms_lsp_appr_lmts_id = reference_id),
-- 			 cur_trx_history_id = CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') 
-- 			 					  || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
-- 	 WHERE transaction_type = 'LIMIT'
-- 	   AND staging_reference_id IS NULL;

	lock table SI_TRX_STG_LMT_UPDATE in share mode; 
	delete from SI_TRX_STG_LMT_UPDATE;
		
	commit;
	lock table SI_TRX_STG_LMT_UPDATE in share mode; 
	
	INSERT INTO SI_TRX_STG_LMT_UPDATE (ACT_LMT_ID, STG_LMT_ID)
	(select lmts.cms_lsp_appr_lmts_id, max(stg.cms_lsp_appr_lmts_id) stg_lmt_id
	from sci_lsp_appr_lmts lmts, stage_limit stg
	where lmts.LMT_ID = stg.lmt_id
	and lmts.source_id = stg.source_id
	group by lmts.cms_lsp_appr_lmts_id);
	
	COMMIT;
	
	CALL SI_RUNSTATS('SI_TRX_STG_LMT_UPDATE');


	LOCK TABLE transaction IN exclusive MODE;
	UPDATE transaction trx
		 SET staging_reference_id = (SELECT STG_LMT_ID
									   FROM SI_TRX_STG_LMT_UPDATE s
									  WHERE trx.reference_id = s.act_lmt_id),
			 cur_trx_history_id = CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') 
			 					  || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
	 WHERE transaction_type = 'LIMIT'
	   AND staging_reference_id IS NULL;

	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 14);
	COMMIT;
	
	LOCK TABLE transaction IN SHARE MODE;
	UPDATE transaction
		 SET staging_reference_id = (SELECT MAX(s.cms_lsp_co_borrow_lmt_id)
		 	 						   FROM sci_lsp_co_borrow_lmt a, stage_co_borrower_limit s
									  WHERE	a.lcl_id = s.lcl_id
										AND a.source_id = s.source_id
										AND	a.cms_lsp_co_borrow_lmt_id = reference_id),
			 cur_trx_history_id = CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') 
			 					  || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
	 WHERE transaction_type = 'COBORROWER_LIMIT'
	   AND staging_reference_id IS NULL;

	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 15);
	COMMIT;
	
	LOCK TABLE transaction IN SHARE MODE;
	UPDATE transaction
		SET staging_reference_id = (SELECT max(s.cms_collateral_id)
									  FROM cms_security a, cms_stage_security s
									 WHERE a.sci_security_dtl_id = s.sci_security_dtl_id
									   AND a.source_id = s.source_id
									   AND a.cms_collateral_id = reference_id),
			cur_trx_history_id = CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') 
			 					  || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
	WHERE transaction_type = 'COL' 
	  AND staging_reference_id IS NULL;

	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 16);
	COMMIT;
	
	LOCK TABLE trans_history IN SHARE MODE;
	INSERT INTO trans_history (tr_history_id, transaction_id, from_state, to_state, user_id, transaction_type, 
							   creation_date, transaction_date, reference_id, status, staging_reference_id, 
							   opsdesc, customer_id, trx_origin_country, trx_origin_organisation, limit_profile_id)
	(
	   SELECT CAST(cur_trx_history_id AS BIGINT), transaction_id, from_state, status, user_id, transaction_type, creation_date,
	   		  transaction_date, CAST(reference_id AS CHAR(17)), status, CAST(staging_reference_id AS CHAR(17)), opsdesc,customer_id, 
	   		  trx_origin_country, trx_origin_organisation, limit_profile_id 
	     FROM transaction t
	    WHERE transaction_type IN ('LIMITPROFILE', 'LIMIT', 'COBORROWER_LIMIT', 'COL') 
	      AND NOT EXISTS (SELECT 's' FROM trans_history
	      				   WHERE transaction_id = t.transaction_id)
	      AND cur_trx_history_id IS NOT NULL
	);
	
	CALL "SI_LOG_PROC_TIME"('si_auto_create_transaction', 'GENERIC', 0);

END
@

CREATE PROCEDURE si_host_update_transaction(p_trx_id VARCHAR(17))
	LANGUAGE SQL
BEGIN ATOMIC

	UPDATE transaction 
	   SET (opsdesc, transaction_date, cur_trx_history_id)
	   = ('HOST_UPDATE', CURRENT_TIMESTAMP, 
	   	  CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17)))
	 WHERE transaction_id = p_trx_id;

	INSERT INTO trans_history (tr_history_id, transaction_id, from_state, to_state, user_id, transaction_type, 
							   transaction_subtype, creation_date, transaction_date, reference_id, status, 
							   staging_reference_id, team_id, version, remarks, opsdesc, to_user_id, to_group_id, 
							   trx_reference_id, legal_name, legal_id, customer_name, customer_id, trx_origin_country, 
							   trx_origin_organisation, limit_profile_id, trx_segment, team_type_id, to_group_type_id, 
							   team_membership_id)
	(
	   SELECT CAST(cur_trx_history_id AS BIGINT), transaction_id, from_state, status, user_id, transaction_type, 
	   		  transaction_subtype, creation_date, transaction_date, CAST(reference_id AS CHAR(17)), status, 
	   		  CAST(staging_reference_id AS CHAR(17)), team_id, version, remarks, opsdesc, to_user_id, to_group_id,
	   		  CAST(trx_reference_id AS CHAR(17)), legal_name, legal_id, customer_name, customer_id, trx_origin_country, 
	   		  trx_origin_organisation, limit_profile_id, trx_segment, team_type_id, to_group_type_id, 
	   		  team_membership_id
	     FROM transaction t
	    WHERE transaction_id = p_trx_id
	);
	
END
@

CREATE PROCEDURE si_host_update_trx_by_ref_and_type(p_reference_id BIGINT, p_trx_type VARCHAR(20))
	LANGUAGE SQL
BEGIN ATOMIC
	DECLARE v_trx_id VARCHAR(17);
	
	SELECT transaction_id
	  INTO v_trx_id
	  FROM transaction
	 WHERE reference_id = p_reference_id
	   AND transaction_type = p_trx_type;
	   
	CALL si_host_update_transaction(v_trx_id);
END
@

CREATE PROCEDURE si_auto_feed_standard_code
		(p_entry_code VARCHAR(40), p_entry_name VARCHAR(255), p_category_code VARCHAR(40), p_entry_source VARCHAR(40))
	LANGUAGE SQL
BEGIN ATOMIC
	DECLARE v_count INT;
	DECLARE v_category_code_id BIGINT;
	
	SELECT COUNT(1) INTO v_count
	  FROM common_code_category_entry
	 WHERE category_code = p_category_code
	   AND entry_code = p_entry_code
	   AND entry_source = p_entry_source;
	   
	IF (v_count > 0) THEN 
		UPDATE common_code_category_entry
		   SET entry_name = p_entry_name
		 WHERE category_code = p_category_code
	   	   AND entry_code = p_entry_code
	   	   AND entry_source = p_entry_source;
	ELSE
		-- MUST make sure Category Code exists
		SELECT category_id
		  INTO v_category_code_id
		  FROM common_code_category
		 WHERE category_code = p_category_code
		 FETCH FIRST 1 ROW ONLY;

		INSERT INTO common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, 
												category_code_id, entry_source, country)
		VALUES ((NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ), p_entry_code, p_entry_name, '1', p_category_code,
				v_category_code_id, p_entry_source, 'MY');
	END IF;
END
@

CREATE PROCEDURE SI_GET_LOAD_TYPE (
    IN P_PROC_NAME VARCHAR(255), OUT R_LOAD_TYPE	VARCHAR(10))
BEGIN ATOMIC
 
 SET R_LOAD_TYPE = (select load_type from si_load_type_config where upper(proc_name)=upper(trim(P_PROC_NAME)) and day_number=DAYOFWEEK_ISO(current_timestamp) fetch first row only);
 
END@

CREATE PROCEDURE UTIL_TRUNCATE_TABLE (
    IN P_TABLE_NAME	VARCHAR(100))
  LANGUAGE SQL
BEGIN ATOMIC
  DECLARE v_stmt VARCHAR(1000);	

	SET v_stmt = 'ALTER TABLE '|| P_TABLE_NAME ||' ACTIVATE NOT LOGGED INITIALLY WITH EMPTY TABLE';
	PREPARE s1 from v_stmt;
	EXECUTE s1;

END@

CREATE PROCEDURE si_auto_update_valuation
	LANGUAGE SQL
BEGIN
	
	CALL "SI_LOG_PROC_TIME"('si_auto_update_valuation', 'GENERIC', 1);
	commit;

    CALL SI_RUNSTATS('CMS_SECURITY');
    commit;

	  CALL SI_RUNSTATS('CMS_VALUATION');
    commit;

    DECLARE GLOBAL TEMPORARY TABLE SESSION.cms_valuation
			(CMS_COLLATERAL_ID BIGINT,
			 VALUATION_CURRENCY CHAR(3),
			 FSV DECIMAL(20,2),
			 CMV DECIMAL(20,2),
			 VALUATION_DATE TIMESTAMP,
			 SOURCE_ID VARCHAR(10),
			 VALUATION_TYPE VARCHAR(10)
			 )
    WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;

	create index SESSION.val_idx4 on SESSION.cms_valuation
    (cms_collateral_id)
    allow reverse scans;

	INSERT INTO SESSION.cms_valuation (CMS_COLLATERAL_ID,VALUATION_CURRENCY, FSV, CMV, VALUATION_DATE,SOURCE_ID,VALUATION_TYPE)
		(SELECT distinct
			CMS_COLLATERAL_ID, VALUATION_CURRENCY, FSV, CMV, VALUATION_DATE, SOURCE_ID, VALUATION_TYPE
		 FROM CMS_VALUATION 
		 where SOURCE_TYPE = 'S' 
			AND VALUATION_TYPE = 'F' 
			AND VALUATION_DATE IS NOT NULL
		 ORDER BY VALUATION_DATE DESC
		);
		
	 UPDATE SESSION.cms_valuation a SET (CMS_COLLATERAL_ID,VALUATION_CURRENCY, FSV, CMV, VALUATION_DATE,SOURCE_ID, VALUATION_TYPE) =
		(SELECT distinct V.CMS_COLLATERAL_ID, V.VALUATION_CURRENCY, V.FSV, V.CMV, V.VALUATION_DATE, V.SOURCE_ID, V.VALUATION_TYPE FROM cms_valuation V
		 WHERE V.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID
			  AND V.SOURCE_TYPE = 'S'
				AND V.VALUATION_TYPE = 'B'
				AND V.VALUATION_DATE > a.VALUATION_DATE
				order by VALUATION_DATE DESC FETCH FIRST 1 ROW ONLY 
		)
	where exists(
			SELECT distinct V.CMS_COLLATERAL_ID, V.VALUATION_CURRENCY, V.FSV, V.CMV, V.VALUATION_DATE, V.SOURCE_ID, V.VALUATION_TYPE FROM cms_valuation V
		  WHERE V.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID
			  AND V.SOURCE_TYPE = 'S'
				AND V.VALUATION_TYPE = 'B'
				AND V.VALUATION_DATE > a.VALUATION_DATE
			order by VALUATION_DATE DESC FETCH FIRST 1 ROW ONLY
	);
	
	CALL "SI_LOG_PROC_TIME"('si_auto_update_valuation', 'GENERIC', 2);
	commit;
	
	INSERT INTO SESSION.cms_valuation(CMS_COLLATERAL_ID,VALUATION_CURRENCY, FSV, CMV, VALUATION_DATE,SOURCE_ID,VALUATION_TYPE)
		(SELECT distinct
			V.CMS_COLLATERAL_ID, V.VALUATION_CURRENCY, V.FSV, V.CMV, V.VALUATION_DATE, V.SOURCE_ID, V.VALUATION_TYPE
		 FROM CMS_VALUATION V
		 where SOURCE_TYPE = 'S' 
			AND V.VALUATION_TYPE = 'B' 
			AND V.VALUATION_DATE IS NOT NULL
		  AND NOT EXISTS
		   (SELECT 1
			   FROM session.cms_valuation a
		     where V.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID
		     AND SOURCE_TYPE = 'S' 
			  )
		 ORDER BY VALUATION_DATE DESC);
	
	UPDATE SESSION.cms_valuation a SET (CMS_COLLATERAL_ID,VALUATION_CURRENCY, FSV, CMV, VALUATION_DATE,SOURCE_ID,VALUATION_TYPE) =
		(SELECT distinct V.CMS_COLLATERAL_ID, V.VALUATION_CURRENCY, V.FSV, V.CMV, V.VALUATION_DATE, V.SOURCE_ID, V.VALUATION_TYPE FROM cms_valuation V
		 WHERE V.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID
			  AND V.SOURCE_TYPE = 'S'
				AND V.VALUATION_TYPE = 'A'
				AND V.VALUATION_DATE > a.VALUATION_DATE
				order by VALUATION_DATE DESC FETCH FIRST 1 ROW ONLY 
		)
	where exists(
			SELECT distinct V.CMS_COLLATERAL_ID, V.VALUATION_CURRENCY, V.FSV, V.CMV, V.VALUATION_DATE, V.SOURCE_ID, V.VALUATION_TYPE FROM cms_valuation V
		  WHERE V.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID
			  AND V.SOURCE_TYPE = 'S'
				AND V.VALUATION_TYPE = 'A'
				AND V.VALUATION_DATE > a.VALUATION_DATE
			order by VALUATION_DATE DESC FETCH FIRST 1 ROW ONLY
	);
	

	CALL "SI_LOG_PROC_TIME"('si_auto_update_valuation', 'GENERIC', 3);
	commit;
	
	INSERT INTO SESSION.cms_valuation (CMS_COLLATERAL_ID, VALUATION_CURRENCY, FSV, CMV, VALUATION_DATE, SOURCE_ID, VALUATION_TYPE)
		(SELECT distinct
			V.CMS_COLLATERAL_ID, V.VALUATION_CURRENCY, V.FSV, V.CMV, V.VALUATION_DATE, V.SOURCE_ID, V.VALUATION_TYPE
		 FROM CMS_VALUATION V
		 where SOURCE_TYPE = 'S' 
			AND VALUATION_TYPE = 'A'  
			AND VALUATION_DATE IS NOT NULL
			AND NOT EXISTS
		   (SELECT 1
			   FROM session.cms_valuation a
		     where V.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID
		     AND SOURCE_TYPE = 'S' 
			  )
		 ORDER BY VALUATION_DATE DESC 
		);
		
	UPDATE SESSION.cms_valuation a SET (CMS_COLLATERAL_ID,VALUATION_CURRENCY, FSV, CMV, VALUATION_DATE,SOURCE_ID,VALUATION_TYPE) =
		(SELECT distinct V.CMS_COLLATERAL_ID, V.VALUATION_CURRENCY, V.FSV, V.CMV, V.VALUATION_DATE, V.SOURCE_ID, V.VALUATION_TYPE FROM cms_valuation V
		 WHERE V.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID
			  AND V.SOURCE_TYPE = 'S'
				AND V.VALUATION_TYPE = 'V'
				AND V.VALUATION_DATE > a.VALUATION_DATE
				order by VALUATION_DATE DESC FETCH FIRST 1 ROW ONLY 
		)
	where exists(
			SELECT distinct V.CMS_COLLATERAL_ID, V.VALUATION_CURRENCY, V.FSV, V.CMV, V.VALUATION_DATE, V.SOURCE_ID, V.VALUATION_TYPE FROM cms_valuation V
		  WHERE V.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID
			  AND V.SOURCE_TYPE = 'S'
				AND V.VALUATION_TYPE = 'V'
				AND V.VALUATION_DATE > a.VALUATION_DATE
			order by VALUATION_DATE DESC FETCH FIRST 1 ROW ONLY
	);
		
	CALL "SI_LOG_PROC_TIME"('si_auto_update_valuation', 'GENERIC', 4);
	commit;
	
	INSERT INTO SESSION.cms_valuation (CMS_COLLATERAL_ID, VALUATION_CURRENCY, FSV, CMV, VALUATION_DATE,SOURCE_ID,VALUATION_TYPE)
		(SELECT distinct
			V.CMS_COLLATERAL_ID, V.VALUATION_CURRENCY, V.FSV, V.CMV, V.VALUATION_DATE, V.SOURCE_ID, V.VALUATION_TYPE
		 FROM CMS_VALUATION V
		 where SOURCE_TYPE = 'S' 
			AND VALUATION_TYPE = 'V'  
			AND VALUATION_DATE IS NOT NULL
			AND NOT EXISTS
		   (SELECT 1
			   FROM session.cms_valuation a
		     where V.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID
		     AND SOURCE_TYPE = 'S' 
			  )
		 ORDER BY VALUATION_DATE DESC
		);
	
	CALL "SI_LOG_PROC_TIME"('si_auto_update_valuation', 'GENERIC', 5);
	commit;
	
	LOCK TABLE CMS_SECURITY IN SHARE MODE;
	
	UPDATE CMS_SECURITY S SET ( FSV_CURRENCY, FSV, CMV_CURRENCY, CMV, LAST_REMARGIN_DATE ) = 
	(
		SELECT 
			V.VALUATION_CURRENCY, V.FSV, V.VALUATION_CURRENCY, V.CMV, V.VALUATION_DATE 
		FROM SESSION.cms_valuation V 
		where S.CMS_COLLATERAL_ID = V.CMS_COLLATERAL_ID
		AND S.SOURCE_ID = V.SOURCE_ID
		AND ( VALUATION_DATE > LAST_REMARGIN_DATE OR LAST_REMARGIN_DATE IS NULL )
		ORDER BY VALUATION_DATE DESC FETCH FIRST 1 ROW ONLY
	)
	where exists
	(
	  SELECT 1
		FROM SESSION.cms_valuation V 
		where S.CMS_COLLATERAL_ID = V.CMS_COLLATERAL_ID
		AND S.SOURCE_ID = V.SOURCE_ID
		AND ( VALUATION_DATE > LAST_REMARGIN_DATE OR LAST_REMARGIN_DATE IS NULL )
	);

       drop table SESSION.cms_valuation;

	CALL "SI_LOG_PROC_TIME"('si_auto_update_valuation', 'GENERIC', 0);
	COMMIT;
		
	CALL SI_RUNSTATS('CMS_SECURITY');

END@

CREATE PROCEDURE SI_AUTO_UPDATE_NEW_PRODUCT_TYPE (
    IN P_ENTRY_CODE	VARCHAR(40),
    IN P_ENTRY_NAME	VARCHAR(255),
    IN P_ENTRY_SOURCE	VARCHAR(40) )

BEGIN 
	DECLARE v_count INT;
	
	SELECT COUNT(1) INTO v_count
	  FROM common_code_category_entry
	 WHERE entry_code = p_entry_code
	   AND entry_source = p_entry_source;
	   
	IF (v_count = 0) THEN 
		INSERT INTO CMS_NEW_PROD_TYPE (prod_type_code, prod_type_desc, source_system)
		VALUES (p_entry_code, p_entry_name, p_entry_source);
	END IF;
END@


CREATE PROCEDURE SI_RUN_PRODUCT_PROGRAM 
    
BEGIN 
	
		INSERT INTO CMS_STAGE_PRODUCT_PROGRAM (product_program_id, product_program_desc, reference_code, status)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR PRODUCT_PROGRAM_SEQ), 2)) as BIGINT),
			PRODUCT_PROGRAM_DESC, 
			REFERENCE_CODE, 'ACTIVE' FROM CMS_TEMP_PRODUCT_PROGRAM);
			
		UPDATE CMS_STAGE_PRODUCT_PROGRAM set (cms_ref_id) = (product_program_id);
			
		CALL "SI_LOG_PROC_TIME"('si_run_product_program', 'GENERIC', 1);
			
		INSERT INTO CMS_PRODUCT_PROGRAM (product_program_id, product_program_desc, reference_code, status)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR PRODUCT_PROGRAM_SEQ), 2)) as BIGINT),
			PRODUCT_PROGRAM_DESC, 
			REFERENCE_CODE, 'ACTIVE' FROM CMS_TEMP_PRODUCT_PROGRAM);
			
		UPDATE CMS_PRODUCT_PROGRAM pp set (cms_ref_id) = (select cms_ref_id from cms_stage_product_program spp where pp.reference_code 
		= spp.reference_code);
			
		CALL "SI_LOG_PROC_TIME"('si_run_product_program', 'GENERIC', 2);
			
		LOCK TABLE transaction IN SHARE MODE;
		INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
							 transaction_date, reference_id, staging_reference_id, status, team_id, 
							 version, opsdesc)
		(
			SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			   'ND', -1, 'PRODUCT_LIMIT', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, pp.product_program_id, 
				 spp.product_program_id, 'ACTIVE', 
			   0, 1, 'MAKER_CREATE'
	   	  	FROM cms_product_program pp join
					cms_stage_product_program spp on pp.reference_code = 
					spp.REFERENCE_CODE
	     	WHERE NOT EXISTS (SELECT '1' FROM transaction
	   	  					WHERE reference_id = pp.product_program_id 
	   	  					  AND transaction_type = 'PRODUCT_LIMIT')
		);

		CALL "SI_LOG_PROC_TIME"('si_run_product_program', 'GENERIC', 0);
		COMMIT;

END@


CREATE PROCEDURE SI_RUN_PRODUCT_TYPE
    
BEGIN 
	
		INSERT INTO CMS_STAGE_PRODUCT_TYPE (product_type_id, product_program_id, product_type_desc, reference_code, status)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR PRODUCT_TYPE_SEQ), 2)) as BIGINT),
		PRODUCT_PROGRAM_ID,
			PRODUCT_TYPE_DESC, 
			pt.REFERENCE_CODE, 'ACTIVE' FROM CMS_TEMP_PRODUCT_TYPE pt left outer join CMS_STAGE_PRODUCT_PROGRAM pp on pp.reference_code = 
			pt.product_program_reference_code);
			
		UPDATE CMS_STAGE_PRODUCT_TYPE set (cms_ref_id) = (product_type_id);
			
		CALL "SI_LOG_PROC_TIME"('si_run_product_type', 'GENERIC', 1);
			
		INSERT INTO CMS_PRODUCT_TYPE (product_type_id, product_program_id, product_type_desc, reference_code, status)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR PRODUCT_TYPE_SEQ), 2)) as BIGINT),
		PRODUCT_PROGRAM_ID,
			PRODUCT_TYPE_DESC, 
			pt.REFERENCE_CODE, 'ACTIVE' FROM CMS_TEMP_PRODUCT_TYPE pt left outer join CMS_PRODUCT_PROGRAM pp on pp.reference_code = 
			pt.product_program_reference_code);
			
		UPDATE CMS_PRODUCT_TYPE pt set (cms_ref_id) = (select cms_ref_id from cms_stage_product_type spt where pt.reference_code 
		= spt.reference_code);
			
		CALL "SI_LOG_PROC_TIME"('si_run_product_type', 'GENERIC', 2);

END@


CREATE PROCEDURE SI_RUN_MAIN_SECTOR
    
BEGIN 
	
		INSERT INTO CMS_STAGE_MAIN_SECTOR_LIMIT (main_sector_limit_id, loan_purpose_code_value, sector_code, status)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR MAIN_SECTOR_LIMIT_SEQ), 2)) as BIGINT),
			LOAN_PURPOSE_CODE_VALUE, 
			SECTOR_CODE, 'ACTIVE' FROM CMS_TEMP_MAIN_SECTOR_LIMIT);
			
		UPDATE CMS_STAGE_MAIN_SECTOR_LIMIT set (cms_ref_id) = (main_sector_limit_id);
			
		CALL "SI_LOG_PROC_TIME"('si_run_main_sector', 'GENERIC', 1);
			
		INSERT INTO CMS_MAIN_SECTOR_LIMIT (main_sector_limit_id, loan_purpose_code_value, sector_code, status)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR MAIN_SECTOR_LIMIT_SEQ), 2)) as BIGINT),
			LOAN_PURPOSE_CODE_VALUE, 
			SECTOR_CODE, 'ACTIVE' FROM CMS_TEMP_MAIN_SECTOR_LIMIT);
			
		UPDATE CMS_MAIN_SECTOR_LIMIT msl set (cms_ref_id) = (select cms_ref_id from CMS_STAGE_MAIN_SECTOR_LIMIT smsl where msl.sector_code 
		= smsl.sector_code);
			
		CALL "SI_LOG_PROC_TIME"('si_run_main_sector', 'GENERIC', 2);
			
		LOCK TABLE transaction IN SHARE MODE;
		INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
							 transaction_date, reference_id, staging_reference_id, status, team_id, 
							 version, opsdesc)
		(
			SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			   'ND', -1, 'SECTOR_LIMIT', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, ms.main_sector_limit_id, 
				 sms.main_sector_limit_id, 'ACTIVE', 
			   0, 1, 'MAKER_CREATE'
	   	  	FROM cms_main_sector_limit ms join
					cms_stage_main_sector_limit sms on ms.sector_code = 
					sms.sector_code
	     	WHERE NOT EXISTS (SELECT '1' FROM transaction
	   	  					WHERE reference_id = ms.main_sector_limit_id 
	   	  					  AND transaction_type = 'PRODUCT_LIMIT')
		);

		CALL "SI_LOG_PROC_TIME"('si_run_main_sector', 'GENERIC', 0);
		COMMIT;

END@


CREATE PROCEDURE SI_RUN_SUB_SECTOR
    
BEGIN 
	
		INSERT INTO CMS_STAGE_SUB_SECTOR_LIMIT (sub_sector_limit_id, main_sector_limit_id, loan_purpose_code_value, sector_code, status)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SUB_SECTOR_LIMIT_SEQ), 2)) as BIGINT),
		MAIN_SECTOR_LIMIT_ID,
			ss.LOAN_PURPOSE_CODE_VALUE, 
			ss.SECTOR_CODE, 'ACTIVE' FROM CMS_STAGE_MAIN_SECTOR_LIMIT ms join CMS_TEMP_SUB_SECTOR_LIMIT ss on ms.sector_code = 
			ss.main_sector_limit_sector_code);
			
		UPDATE CMS_STAGE_SUB_SECTOR_LIMIT set (cms_ref_id) = (sub_sector_limit_id);
			
		CALL "SI_LOG_PROC_TIME"('si_run_sub_sector', 'GENERIC', 1);
			
		INSERT INTO CMS_SUB_SECTOR_LIMIT (sub_sector_limit_id, main_sector_limit_id, loan_purpose_code_value, sector_code, status)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SUB_SECTOR_LIMIT_SEQ), 2)) as BIGINT),
		MAIN_SECTOR_LIMIT_ID,
			ss.LOAN_PURPOSE_CODE_VALUE, 
			ss.SECTOR_CODE, 'ACTIVE' FROM CMS_MAIN_SECTOR_LIMIT ms join CMS_TEMP_SUB_SECTOR_LIMIT ss on ms.sector_code = 
			ss.main_sector_limit_sector_code);
			
		UPDATE CMS_SUB_SECTOR_LIMIT ssl set (cms_ref_id) = (select cms_ref_id from CMS_STAGE_SUB_SECTOR_LIMIT sssl where ssl.sector_code 
		= sssl.sector_code);
			
		CALL "SI_LOG_PROC_TIME"('si_run_sub_sector', 'GENERIC', 2);

END@


CREATE PROCEDURE SI_RUN_ECO_SECTOR
    
BEGIN 
	
		INSERT INTO CMS_STAGE_ECO_SECTOR_LIMIT (eco_sector_limit_id, sub_sector_limit_id, loan_purpose_code_value, sector_code, status)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR ECO_SECTOR_LIMIT_SEQ), 2)) as BIGINT),
		SUB_SECTOR_LIMIT_ID,
			es.LOAN_PURPOSE_CODE_VALUE, 
			es.SECTOR_CODE, 'ACTIVE' FROM CMS_TEMP_ECO_SECTOR_LIMIT es left outer join CMS_STAGE_SUB_SECTOR_LIMIT ss on ss.sector_code = 
			es.sub_sector_limit_sector_code);
			
		UPDATE CMS_STAGE_ECO_SECTOR_LIMIT set (cms_ref_id) = (eco_sector_limit_id);
			
		CALL "SI_LOG_PROC_TIME"('si_run_eco_sector', 'GENERIC', 1);
			
		INSERT INTO CMS_ECO_SECTOR_LIMIT (eco_sector_limit_id, sub_sector_limit_id, loan_purpose_code_value, sector_code, status)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR ECO_SECTOR_LIMIT_SEQ), 2)) as BIGINT),
		SUB_SECTOR_LIMIT_ID,
			es.LOAN_PURPOSE_CODE_VALUE, 
			es.SECTOR_CODE, 'ACTIVE' FROM CMS_TEMP_ECO_SECTOR_LIMIT es left outer join CMS_SUB_SECTOR_LIMIT ss on ss.sector_code = 
			es.sub_sector_limit_sector_code);
			
		UPDATE CMS_ECO_SECTOR_LIMIT esl set (cms_ref_id) = (select cms_ref_id from CMS_STAGE_ECO_SECTOR_LIMIT sesl where esl.sector_code 
		= sesl.sector_code);
			
		CALL "SI_LOG_PROC_TIME"('si_run_eco_sector', 'GENERIC', 2);

END@