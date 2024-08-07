DROP PROCEDURE LOG_PROC_TIME@
DROP SPECIFIC PROCEDURE RUNSTATS_HELPER_COLUMNS@
DROP PROCEDURE RUNSTATS_HELPER@
DROP PROCEDURE RUNSTATS_LIKE_HELPER@
DROP PROCEDURE AUTO_CREATE_TRANSACTION_SET1@
DROP PROCEDURE AUTO_CREATE_TRANSACTION_SET2@
DROP PROCEDURE AUTO_CREATE_TRANSACTION_SET3@
DROP PROCEDURE AUTO_CREATE_CHECKLIST@
DROP PROCEDURE AUTO_CREATE_STP_TRANS_FAC@
DROP PROCEDURE AUTO_CREATE_STP_TRANS_COL@
DROP PROCEDURE AUTO_VALIDATE_ACTUAL_TABLE@

CREATE PROCEDURE LOG_PROC_TIME (
    IN P_PROC_NAME VARCHAR(255),
    IN P_SOURCE_ID VARCHAR(10),
  	IN P_START_FLAG INT)
  LANGUAGE SQL
BEGIN ATOMIC
 
 INSERT INTO PROC_TIME_LOG (proc_name, source_id, start_flag, time_stamp)
  VALUES (P_PROC_NAME, P_SOURCE_ID, P_START_FLAG, CURRENT_TIMESTAMP);

END@



CREATE PROCEDURE RUNSTATS_HELPER(IN p_table_name VARCHAR(128))
	LANGUAGE SQL
BEGIN
	DECLARE v_curr_schema VARCHAR(20);
	SET v_curr_schema = (VALUES CURRENT SCHEMA);
	
	CALL SYSPROC.ADMIN_CMD('RUNSTATS ON TABLE ' || RTRIM(v_curr_schema) || '.' || p_table_name
						   || ' ON ALL COLUMNS WITH DISTRIBUTION AND DETAILED INDEXES ALL');	
END@

CREATE PROCEDURE RUNSTATS_HELPER(IN p_table_name VARCHAR(128), p_columns varchar(255))
	SPECIFIC RUNSTATS_HELPER_COLUMNS
	LANGUAGE SQL
BEGIN
	DECLARE v_curr_schema VARCHAR(20);
	SET v_curr_schema = (VALUES CURRENT SCHEMA);
	
	CALL SYSPROC.ADMIN_CMD('RUNSTATS ON TABLE ' || RTRIM(v_curr_schema) || '.' || p_table_name
						   || ' ON COLUMNS ('|| p_columns||') WITH DISTRIBUTION AND DETAILED INDEXES ALL');	
END@

CREATE PROCEDURE RUNSTATS_LIKE_HELPER(IN p_table_name VARCHAR(128), p_columns VARCHAR(255))
	LANGUAGE SQL
BEGIN
	DECLARE v_curr_schema VARCHAR(20);
	SET v_curr_schema = (VALUES CURRENT SCHEMA);
	
	CALL SYSPROC.ADMIN_CMD('RUNSTATS ON TABLE ' || RTRIM(v_curr_schema) || '.' || p_table_name
						   || ' ON COLUMNS ('|| p_columns||' LIKE STATISTICS)');	
END@


CREATE PROCEDURE AUTO_CREATE_TRANSACTION_SET1
	LANGUAGE SQL
BEGIN
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET1', 'GENERIC', 1);
	commit;
	
	CALL RUNSTATS_HELPER('TRANSACTION', 'TRANSACTION_TYPE');	
	CALL RUNSTATS_HELPER('SCI_LE_SUB_PROFILE');
	
	-- CUSTOMER	
	--LOCK TABLE transaction IN SHARE MODE;
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
				transaction_date, reference_id, status, team_id, 
				version, opsdesc, customer_id)
	(
		 SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			    'ND', -1, 'CUSTOMER', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, cms_le_sub_profile_id, 'ACTIVE', 
			    0, 1, 'CREATE_CUSTOMER', cms_le_sub_profile_id
	   	 FROM sci_le_sub_profile s
	         WHERE NOT EXISTS (SELECT 1 FROM transaction
	   	  		   WHERE reference_id = s.cms_le_sub_profile_id 
	   	  		   AND transaction_type = 'CUSTOMER' fetch first row only)
	 );

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET1', 'GENERIC', 2);
	COMMIT;
	
	--CALL RUNSTATS_HELPER('TRANSACTION');
	CALL RUNSTATS_HELPER('SCI_LSP_LMT_PROFILE', 'IS_MIGRATED_IND');	
	
	DECLARE GLOBAL TEMPORARY TABLE SESSION.lmt_profile_info(
			cms_lsp_lmt_profile_id bigint,
			cms_orig_country char(2),
			cms_orig_organisation varchar(40),
			cms_customer_id bigint,
			los_bca_ref_num varchar(35)
		) 
		WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;		
		
	insert into SESSION.lmt_profile_info (cms_lsp_lmt_profile_id, cms_orig_country, cms_orig_organisation, 
		cms_customer_id, los_bca_ref_num)
	(select cms_lsp_lmt_profile_id, cms_orig_country, cms_orig_organisation, cms_customer_id, los_bca_ref_num
	from sci_lsp_lmt_profile 
	where is_migrated_ind = 'Y');
	
	commit;
	
	CREATE INDEX session.t_lmt_profile_info_idx
             ON session.lmt_profile_info(cms_lsp_lmt_profile_id)
             allow REVERSE SCANS;	
             	
	-- LIMIT PROFILE
	--LOCK TABLE transaction IN SHARE MODE;
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
				transaction_date, reference_id, status, team_id, version, opsdesc, customer_id, LIMIT_PROFILE_REF_NUM,
				trx_origin_country, trx_origin_organisation, limit_profile_id)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			   'ND', -1, 'LIMITPROFILE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, cms_lsp_lmt_profile_id,
		  	   'ACTIVE', 0, 1, 'CREATE', cms_customer_id, los_bca_ref_num, 
		  	   cms_orig_country, cms_orig_organisation, cms_lsp_lmt_profile_id
	   	FROM SESSION.lmt_profile_info s
-- 	   	WHERE NOT EXISTS (SELECT 1 FROM transaction
-- 	   	 		WHERE reference_id = s.cms_lsp_lmt_profile_id 
-- 	   	 		AND transaction_type = 'LIMITPROFILE' fetch first row only)
	);
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET1', 'GENERIC', 3);
	COMMIT;

	--CALL RUNSTATS_HELPER('TRANSACTION');

	-- TAT Document
	--LOCK TABLE transaction IN SHARE MODE;
	
	CALL RUNSTATS_HELPER('CMS_TAT_DOCUMENT');	
	
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
				transaction_date, reference_id, status, team_id, version, opsdesc, customer_id, 
				trx_origin_country, trx_origin_organisation, limit_profile_id)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			   'ND', -1, 'TAT_DOC', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, TAT_ID,
		  	   'ACTIVE', 0, 1, 'CREATE', s.cms_customer_id, s.cms_orig_country, s.cms_orig_organisation, s.cms_lsp_lmt_profile_id
	   	FROM CMS_TAT_DOCUMENT tat, SESSION.lmt_profile_info s
	   	WHERE tat.CMS_LSP_LMT_PROFILE_ID = s.CMS_LSP_LMT_PROFILE_ID
-- 	   	AND NOT EXISTS (SELECT 1 FROM transaction
-- 	   	 		WHERE reference_id = tat.TAT_ID 
-- 	   	 		AND transaction_type = 'TAT_DOC' fetch first row only)
	);

	drop table SESSION.lmt_profile_info;
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET1', 'GENERIC', 4);
	COMMIT;
	

	
--	create index temp_index_1 on transaction
--	(transaction_type, trx_reference_id, customer_id)
--	allow reverse scans
--	collect statistics;
	
--	create index temp_index_1 on transaction
--	(transaction_type, customer_id, transaction_id)
--	allow reverse scans;
		
--	CALL RUNSTATS_HELPER('TRANSACTION', '(TRANSACTION_TYPE, TRX_REFERENCE_ID), TRANSACTION_ID');
--	commit;
	
	--LOCK TABLE transaction IN SHARE MODE;
	UPDATE transaction a SET a.trx_reference_id = (
		SELECT CAST(b.transaction_id AS BIGINT) 
		  FROM transaction b--, sci_le_sub_profile 
		 WHERE b.reference_id = a.customer_id
		   AND b.transaction_type = 'CUSTOMER'
		   --AND a.customer_id = cms_le_sub_profile_id
		   ) 
	 WHERE a.trx_reference_id IS NULL
	   AND a.transaction_type = 'LIMITPROFILE';
	   				
	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET1', 'GENERIC', 5);
	COMMIT;

--	drop index temp_index_1;
	
	--CALL RUNSTATS_HELPER('TRANSACTION');

	create index temp_index_1 on transaction
	(transaction_type, trx_reference_id, limit_profile_id)
	allow reverse scans
	COLLECT STATISTICS;
	
	COMMIT;

--	create index temp_index_1 on transaction
--	(transaction_type, limit_profile_id, transaction_id)
--	allow reverse scans;
	
	--LOCK TABLE transaction IN SHARE MODE;
	UPDATE transaction a SET a.trx_reference_id = (
		SELECT CAST(t.transaction_id AS BIGINT) 
		  FROM transaction t
		 WHERE t.reference_id = a.limit_profile_id 
		   AND t.transaction_type = 'LIMITPROFILE'
		   ) 
	 WHERE a.trx_reference_id IS NULL
	   AND a.transaction_type = 'TAT_DOC';

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET1', 'GENERIC', 6);
	COMMIT;
	
	drop index temp_index_1;
	
	-- update Sub profile's cms_non_borrower_ind

	LOCK TABLE sci_lsp_lmt_profile IN SHARE MODE;
	
	CALL RUNSTATS_HELPER('SCI_LSP_LMT_PROFILE', 'CMS_BCA_STATUS');
	
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
	
	COMMIT;
	
	CALL RUNSTATS_HELPER('SCI_LE_SUB_PROFILE', 'CMS_NON_BORROWER_IND');
	
	LOCK TABLE sci_le_sub_profile IN SHARE MODE;		
	-- update non borrower ind to N if there is active limit profile
	UPDATE sci_le_sub_profile sp
	   SET sp.cms_non_borrower_ind = 'N'
	 WHERE (sp.cms_non_borrower_ind is null
			OR sp.cms_non_borrower_ind = 'Y')
	   AND EXISTS (SELECT 1
					 FROM SESSION.customer_with_lmt_profile cust
					WHERE cust.cms_customer_id = sp.cms_le_sub_profile_id fetch first row only);
					
	commit;
	
	LOCK TABLE sci_le_sub_profile IN SHARE MODE;						
	-- update non borrower ind to Y if there is no active limit profile
	UPDATE sci_le_sub_profile sp
	   SET sp.cms_non_borrower_ind = 'Y'
	 WHERE (sp.cms_non_borrower_ind is null
			OR sp.cms_non_borrower_ind = 'N')
	   AND not EXISTS (SELECT 1
					 FROM SESSION.customer_with_lmt_profile cust
					WHERE cust.cms_customer_id = sp.cms_le_sub_profile_id fetch first row only);
							
	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET1', 'GENERIC', 7);
	COMMIT;
	
	drop table SESSION.customer_with_lmt_profile;
	
	CALL RUNSTATS_HELPER('TRANSACTION', '(TRANSACTION_TYPE, STAGING_REFERENCE_ID)');
	CALL RUNSTATS_HELPER('STAGE_LIMIT_PROFILE', 'LOS_BCA_REF_NUM, SOURCE_ID, CMS_LSP_LMT_PROFILE_ID');	

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET1', 'GENERIC', 8);
	COMMIT;

	LOCK TABLE transaction IN SHARE MODE;
	UPDATE transaction tranx
	SET tranx.staging_reference_id = (SELECT s.cms_lsp_lmt_profile_id
				 	 		FROM stage_limit_profile s
							WHERE tranx.LIMIT_PROFILE_REF_NUM = s.LOS_BCA_REF_NUM
							AND s.source_id = 'RLOS'
					),
	    tranx.cur_trx_history_id = CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))								 	
	WHERE tranx.transaction_type = 'LIMITPROFILE'
	AND tranx.staging_reference_id IS NULL;

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET1', 'GENERIC', 9);
	COMMIT;
	
	create index temp_index_1 on cms_stage_tat_document
		(cms_lsp_lmt_profile_id, tat_id) 
		allow reverse scans
		collect statistics;
		
	COMMIT;
		
	UPDATE transaction tranx
	SET tranx.staging_reference_id = (SELECT s.tat_id
				 	 		FROM CMS_STAGE_TAT_DOCUMENT s
							WHERE tranx.limit_profile_id = s.cms_lsp_lmt_profile_id
					),
	    tranx.cur_trx_history_id = CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))								 	
	WHERE tranx.transaction_type = 'TAT_DOC'
	AND tranx.staging_reference_id IS NULL;	

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET1', 'GENERIC', 10);
	COMMIT;		
	
	drop index temp_index_1;
	
	INSERT INTO trans_history (tr_history_id, transaction_id, from_state, to_state, user_id, transaction_type, 
					creation_date, transaction_date, reference_id, status, staging_reference_id, 
					opsdesc, customer_id, trx_origin_country, trx_origin_organisation, limit_profile_id)
	(
	   SELECT CAST(cur_trx_history_id AS BIGINT), transaction_id, from_state, status, user_id, transaction_type, creation_date,
	   		  transaction_date, CAST(reference_id AS CHAR(17)), status, CAST(staging_reference_id AS CHAR(17)), opsdesc,customer_id, 
	   		  trx_origin_country, trx_origin_organisation, limit_profile_id 
	   FROM transaction t
	   WHERE transaction_type IN ('LIMITPROFILE', 'TAT_DOC') 
	   AND NOT EXISTS (SELECT 1 FROM trans_history
	      		   WHERE transaction_id = t.transaction_id fetch first row only)
	   		   AND cur_trx_history_id IS NOT NULL
	);
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET1', 'GENERIC', 0);

END@

CREATE PROCEDURE AUTO_CREATE_TRANSACTION_SET2
	LANGUAGE SQL
BEGIN
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET2', 'GENERIC', 1);
	commit;
	
-- 	CALL RUNSTATS_HELPER('SCI_LSP_LMT_PROFILE');	
-- 	CALL RUNSTATS_HELPER('SCI_LSP_APPR_LMTS');	
	
	-- LIMITS
	--LOCK TABLE TRANSACTION in SHARE MODE;
-- 	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
-- 					transaction_date, reference_id, status, team_id, version, opsdesc, 
-- 					customer_id, trx_origin_country, trx_origin_organisation, limit_profile_id)
-- 	(
-- 		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),  
-- 	 	  	   'ND', -1, 'LIMIT', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, lmt.cms_lsp_appr_lmts_id, 'ACTIVE', 0, 1, 
-- 	 	  	   'CREATE', bca.cms_customer_id, bca.cms_orig_country, bca.cms_orig_organisation, lmt.cms_limit_profile_id
-- 	   	FROM sci_lsp_appr_lmts lmt , sci_lsp_lmt_profile bca
-- 		WHERE lmt.cms_limit_profile_id = bca.cms_lsp_lmt_profile_id
-- 		AND NOT EXISTS (SELECT '1' FROM transaction 
-- 		   		WHERE reference_id = lmt.cms_lsp_appr_lmts_id 
-- 		   		AND transaction_type = 'LIMIT')
-- 	);
	
	-- INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
					-- transaction_date, reference_id, status, staging_reference_id, team_id, version, opsdesc, 
					-- trx_origin_country, trx_origin_organisation, limit_profile_id)
	-- (
		-- SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),  
	 	  	   -- 'ND', -1, 'LIMIT', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CMS_ACT_LMT_ID, 'ACTIVE', CMS_STG_LMT_ID, 0, 1, 
	 	  	   -- 'CREATE', ORI_LOC_COUNTRY, ORG_LOC_ORG_CODE, cms_act_lmt_profile_id
		-- from mig_ca003_1
		-- where is_valid = 'Y'
	-- );
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),  
	 	  	   ''ND'', -1, ''LIMIT'', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CMS_ACT_LMT_ID, ''ACTIVE'', CMS_STG_LMT_ID, 0, 1, 
	 	  	   ''CREATE'', ORI_LOC_COUNTRY, ORG_LOC_ORG_CODE, cms_act_lmt_profile_id,
			   CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
		from mig_ca003_1
		where is_valid = ''Y'') OF CURSOR 
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
					transaction_date, reference_id, status, staging_reference_id, team_id, version, opsdesc, 
					trx_origin_country, trx_origin_organisation, limit_profile_id, cur_trx_history_id)');	
	

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET2', 'GENERIC', 2);
	COMMIT;
	
	CALL RUNSTATS_HELPER('TRANSACTION', 'TRANSACTION_TYPE, TRX_REFERENCE_ID, REFERENCE_ID, TRANSACTION_ID');

	create index temp_index_1 on transaction
		(transaction_type, trx_reference_id, limit_profile_id)
		allow reverse scans
		collect statistics;
	
	COMMIT;
		
	--LOCK TABLE transaction in SHARE MODE;
	UPDATE transaction a SET a.trx_reference_id = (
		SELECT CAST(t.transaction_id AS BIGINT) 
		  FROM transaction t--, sci_lsp_lmt_profile 
		 WHERE --t.reference_id = CMS_LSP_LMT_PROFILE_ID
		 	t.reference_id = a.limit_profile_id
		   AND t.transaction_type = 'LIMITPROFILE'
		   --AND a.limit_profile_id = CMS_LSP_LMT_PROFILE_ID
		   ) 
	 WHERE a.trx_reference_id IS NULL
	   AND a.transaction_type = 'LIMIT';

	drop index temp_index_1;
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET2', 'GENERIC', 3);
	COMMIT;
	
-- 	CALL RUNSTATS_HELPER('SCI_LSP_CO_BORROW_LMT');	
	
	-- COBORROWER LIMITS
	--LOCK TABLE transaction IN SHARE MODE;
-- 	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
-- 				transaction_date, reference_id, status, team_id, version, opsdesc, customer_id, 
-- 				trx_origin_country, trx_origin_organisation, limit_profile_id)
-- 	(
-- 		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),  
-- 	 	  	   'ND', -1, 'COBORROWER_LIMIT', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, cblmt.cms_lsp_co_borrow_lmt_id, 'ACTIVE', 0, 1, 
-- 			   'CREATE', cblmt.cms_customer_id, sp.cms_sub_orig_country, sp.cms_sub_orig_organisation, lmt.cms_limit_profile_id
-- 	   	FROM sci_lsp_co_borrow_lmt cblmt, sci_lsp_appr_lmts lmt, sci_le_sub_profile sp
-- 		WHERE cblmt.cms_limit_id = lmt.cms_lsp_appr_lmts_id
-- 		AND sp.cms_le_sub_profile_id = cblmt.cms_customer_id
-- 		AND NOT EXISTS (SELECT '1' FROM transaction 
-- 		   		WHERE reference_id = cblmt.cms_lsp_co_borrow_lmt_id 
-- 		   		AND transaction_type = 'COBORROWER_LIMIT')
-- 	);
	--Call SYSPROC.ADMIN_CMD('LOAD FROM 
	--(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),  
	 	  	   --''ND'', -1, ''COBORROWER_LIMIT'', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, cblmt.cms_lsp_co_borrow_lmt_id, ''ACTIVE'', 0, 1, 
			   --''CREATE'', cblmt.cms_customer_id, sp.cms_sub_orig_country, sp.cms_sub_orig_organisation, lmt.cms_limit_profile_id
	   	  --FROM sci_lsp_co_borrow_lmt cblmt, sci_lsp_appr_lmts lmt, sci_le_sub_profile sp
		 --WHERE cblmt.cms_limit_id = lmt.cms_lsp_appr_lmts_id
		   --AND sp.cms_le_sub_profile_id = cblmt.cms_customer_id
		   --AND NOT EXISTS (SELECT ''1'' FROM transaction 
		   					--WHERE reference_id = cblmt.cms_lsp_co_borrow_lmt_id 
		   					 --AND transaction_type = ''COBORROWER_LIMIT'') fetch first row only) OF CURSOR 
	--INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
							 --transaction_date, reference_id, status, team_id, version, opsdesc, customer_id, 
							 --trx_origin_country, trx_origin_organisation, limit_profile_id)');		
	
-- 	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET2', 'GENERIC', 4);
-- 	COMMIT;
	
	--LOCK TABLE transaction in SHARE MODE;

-- 	CALL RUNSTATS_HELPER('TRANSACTION');	

-- 	UPDATE transaction a SET trx_reference_id = (
-- 		SELECT CAST(transaction_id AS BIGINT) 
-- 		  FROM transaction t, sci_lsp_co_borrow_lmt cb
-- 		 WHERE a.reference_id = cb.cms_lsp_co_borrow_lmt_id
-- 		   AND t.transaction_type = 'LIMIT'
-- 		   AND t.reference_id = cb.cms_limit_id
-- 		 FETCH FIRST ROW ONLY) 
-- 	 WHERE trx_reference_id IS NULL
-- 	   AND transaction_type = 'COBORROWER_LIMIT';

-- 	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET2', 'GENERIC', 5);
-- 	COMMIT;
	
	--CALL RUNSTATS_HELPER('CMS_FACILITY_MASTER');
	
	-- Facility
	--LOCK TABLE TRANSACTION in SHARE MODE;
-- 	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
-- 				transaction_date, reference_id, status, team_id, version, opsdesc, 
-- 				customer_id, trx_origin_country, trx_origin_organisation, limit_profile_id)
-- 	(
-- 		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),  
-- 	 	  	   'ND', -1, 'FACILITY', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, fac.ID, 'ACTIVE', 0, 1, 
-- 	 	  	   'CREATE', bca.cms_customer_id, bca.cms_orig_country, bca.cms_orig_organisation, lmt.cms_limit_profile_id
-- 	   	FROM CMS_FACILITY_MASTER fac, sci_lsp_appr_lmts lmt , sci_lsp_lmt_profile bca
-- 		WHERE fac.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID
-- 		AND lmt.cms_limit_profile_id = bca.cms_lsp_lmt_profile_id
-- 		AND NOT EXISTS (SELECT '1' FROM transaction 
-- 		   		WHERE reference_id = fac.ID 
-- 		   		AND transaction_type = 'FACILITY')
-- 	);
	
	-- INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
				-- transaction_date, reference_id, status, staging_reference_id, team_id, version, opsdesc, 
				-- trx_origin_country, trx_origin_organisation, limit_profile_id)
	-- (
		-- SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),  
	 	  	   -- 'ND', -1, 'FACILITY', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CMS_ACT_FAC_MASTER_ID, 'ACTIVE', CMS_STG_FAC_MASTER_ID, 0, 1, 
	 	  	   -- 'CREATE', ORI_LOC_COUNTRY, ORG_LOC_ORG_CODE, cms_act_lmt_profile_id
		-- FROM MIG_CA003_1
		-- WHERE IS_VALID = 'Y'
	-- );
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)),  
	 	  	   ''ND'', -1, ''FACILITY'', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CMS_ACT_FAC_MASTER_ID, ''ACTIVE'', CMS_STG_FAC_MASTER_ID, 0, 1, 
	 	  	   ''CREATE'', ORI_LOC_COUNTRY, ORG_LOC_ORG_CODE, cms_act_lmt_profile_id,
			   CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
		FROM MIG_CA003_1
		WHERE IS_VALID = ''Y'') OF CURSOR 
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
				transaction_date, reference_id, status, staging_reference_id, team_id, version, opsdesc, 
				trx_origin_country, trx_origin_organisation, limit_profile_id, cur_trx_history_id)');		

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET2', 'GENERIC', 4);
	COMMIT;
	
	CALL RUNSTATS_HELPER('TRANSACTION', 'TRANSACTION_TYPE, TRX_REFERENCE_ID, REFERENCE_ID, TRANSACTION_ID');	
	CALL RUNSTATS_HELPER('CMS_FACILITY_MASTER', 'ID, CMS_LSP_APPR_LMTS_ID');

	--LOCK TABLE transaction in SHARE MODE;
	UPDATE transaction a SET a.trx_reference_id = (
		SELECT CAST(t.transaction_id AS BIGINT) 
		from transaction t, cms_facility_master f
		where f.id = a.reference_id
		and f.cms_lsp_appr_lmts_id = t.reference_id
		and t.transaction_type = 'LIMIT'
-- 		  FROM transaction t, sci_lsp_appr_lmts 
-- 		 WHERE t.reference_id = CMS_LSP_APPR_LMTS_ID
-- 		   AND t.transaction_type = 'LIMIT'
		   --AND a.limit_profile_id = CMS_LIMIT_PROFILE_ID
		   ) 
	 WHERE a.trx_reference_id IS NULL
	   AND a.transaction_type = 'FACILITY';

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET2', 'GENERIC', 5);
	COMMIT;
	
--	CALL RUNSTATS_HELPER('TRANSACTION');
-- 	CALL RUNSTATS_HELPER('STAGE_LIMIT');

	-- CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET2', 'GENERIC', 6);
	-- COMMIT;

-- 	LOCK TABLE transaction IN exclusive MODE;
-- 	UPDATE transaction trx
-- 	SET staging_reference_id = (SELECT stg.CMS_LSP_APPR_LMTS_ID
-- 					from sci_lsp_appr_lmts lmts, stage_limit stg
--                                         where lmts.LMT_ID = stg.lmt_id
--                                         and lmts.source_id = stg.source_id
--                                         and trx.REFERENCE_ID = lmts.CMS_LSP_APPR_LMTS_ID),
-- 			 cur_trx_history_id = CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') 
-- 			 					  || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
-- 	 WHERE transaction_type = 'LIMIT'
-- 	   AND staging_reference_id IS NULL;

-- 	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION', 'GENERIC', 17);
-- 	COMMIT;
	
	--lock table TRX_STG_FAC_UPDATE in share mode; 
	--delete from TRX_STG_FAC_UPDATE;
		
	--commit;
	--lock table TRX_STG_FAC_UPDATE in share mode; 
	
	--INSERT INTO TRX_STG_FAC_UPDATE (ACT_FAC_ID, STG_FAC_ID)
	--(SELECT fac.ID, MAX(stgfac.ID) STG_FAC_ID
	--FROM CMS_FACILITY_MASTER fac, SCI_LSP_APPR_LMTS lmts, STAGE_LIMIT stglmts, CMS_STG_FACILITY_MASTER stgfac
	--WHERE fac.CMS_LSP_APPR_LMTS_ID = lmts.CMS_LSP_APPR_LMTS_ID
	--AND lmts.LMT_ID = stglmts.LMT_ID
	--AND lmts.SOURCE_ID = stglmts.SOURCE_ID
	--AND stglmts.CMS_LSP_APPR_LMTS_ID = stgfac.CMS_LSP_APPR_LMTS_ID
	--GROUP BY fac.ID);
	
	--COMMIT;
	
	--CALL RUNSTATS_HELPER('TRX_STG_FAC_UPDATE');

	--LOCK TABLE transaction IN exclusive MODE;
	--UPDATE TRANSACTION trx
	--SET STAGING_REFERENCE_ID = (SELECT STG_FAC_ID
	--			    FROM TRX_STG_FAC_UPDATE s
	--			    WHERE trx.REFERENCE_ID = s.ACT_FAC_ID),
	--CUR_TRX_HISTORY_ID = CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') 
	--			  || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
	--WHERE TRANSACTION_TYPE = 'FACILITY'
	--AND STAGING_REFERENCE_ID IS NULL;

-- 	CALL RUNSTATS_HELPER('TRANSACTION');

-- 	CALL RUNSTATS_HELPER('CMS_STG_FACILITY_MASTER');

-- 	UPDATE TRANSACTION trx
-- 	SET STAGING_REFERENCE_ID = (SELECT stgfac.ID
-- 				   FROM CMS_FACILITY_MASTER fac, SCI_LSP_APPR_LMTS lmts, STAGE_LIMIT stglmts, CMS_STG_FACILITY_MASTER stgfac
--                    WHERE fac.CMS_LSP_APPR_LMTS_ID = lmts.CMS_LSP_APPR_LMTS_ID
--                    AND lmts.LMT_ID = stglmts.LMT_ID
--                    AND lmts.SOURCE_ID = stglmts.SOURCE_ID
--                    AND stglmts.CMS_LSP_APPR_LMTS_ID = stgfac.CMS_LSP_APPR_LMTS_ID
--                    AND fac.ID = trx.REFERENCE_ID),
-- 	CUR_TRX_HISTORY_ID = CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') 
-- 				  || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
-- 	WHERE TRANSACTION_TYPE = 'FACILITY'
-- 	AND STAGING_REFERENCE_ID IS NULL;
	
-- 	update transaction trx
-- 	set staging_reference_id = 
-- 		(select stgfac.id
-- 		from transaction t, cms_stg_facility_master stgfac
-- 		where char(trx.trx_reference_id) = t.transaction_id
-- 		and t.transaction_type = 'LIMIT'
-- 		and t.staging_reference_id = stgfac.cms_lsp_appr_lmts_id)
-- 	where transaction_type = 'FACILITY'
-- 	AND STAGING_REFERENCE_ID IS NULL;

-- 	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET2', 'GENERIC', 9);
-- 	COMMIT;
	
	--LOCK TABLE trans_history IN SHARE MODE;
	CREATE INDEX TEMP_INDEX_1 ON TRANSACTION
		(TRANSACTION_TYPE, TRANSACTION_ID)
		ALLOW REVERSE SCANS
		COLLECT STATISTICS;
		
	COMMIT;
		
	CALL RUNSTATS_HELPER('TRANS_HISTORY', '(TRANSACTION_TYPE, TRANSACTION_ID)');
		
		--LOCK TABLE trans_history IN SHARE MODE;
	INSERT INTO trans_history (tr_history_id, transaction_id, from_state, to_state, user_id, transaction_type, 
				creation_date, transaction_date, reference_id, status, staging_reference_id, 
				opsdesc, customer_id, trx_origin_country, trx_origin_organisation, limit_profile_id)
	(
	   SELECT CAST(cur_trx_history_id AS BIGINT), transaction_id, from_state, status, user_id, transaction_type, creation_date,
	   		  transaction_date, CAST(reference_id AS CHAR(17)), status, CAST(staging_reference_id AS CHAR(17)), opsdesc,customer_id, 
	   		  trx_origin_country, trx_origin_organisation, limit_profile_id 
	   FROM transaction t
	   WHERE transaction_type IN ('LIMIT', 'FACILITY') 
	   AND NOT EXISTS (SELECT 1 FROM trans_history h
	      		WHERE h.transaction_id = t.transaction_id
				AND h.TRANSACTION_TYPE IN ('LIMIT', 'FACILITY') fetch first row only)
	   		--AND cur_trx_history_id IS NOT NULL
	);

	DROP INDEX TEMP_INDEX_1;
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET2', 'GENERIC', 0);

END@

CREATE PROCEDURE AUTO_CREATE_TRANSACTION_SET3
	LANGUAGE SQL
BEGIN
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET3', 'GENERIC', 1);
	commit;
	
	CALL RUNSTATS_HELPER('TRANSACTION', 'TRANSACTION_TYPE, REFERENCE_ID');
	CALL RUNSTATS_HELPER('MIG_CO001_AB', 'IS_VALID');
	CALL RUNSTATS_HELPER('MIG_CO002_AB_GOLD', 'IS_VALID');
	CALL RUNSTATS_HELPER('MIG_CO005_CS', 'IS_VALID');
	CALL RUNSTATS_HELPER('MIG_CO008_MS', 'IS_VALID');
	CALL RUNSTATS_HELPER('MIG_CO009_PT', 'IS_VALID');
	CALL RUNSTATS_HELPER('MIG_CO010_GT', 'IS_VALID');
	CALL RUNSTATS_HELPER('MIG_CO011_OT', 'IS_VALID');
	CALL RUNSTATS_HELPER('MIG_CO012_IN', 'IS_VALID');
	CALL RUNSTATS_HELPER('MIG_CO014_CL', 'IS_VALID');
	
	-- COLLATERAL - AB
	--LOCK TABLE transaction IN SHARE MODE;
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
				transaction_date, reference_id, staging_reference_id, status, team_id, 
				version, opsdesc, cur_trx_history_id)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			   'ND', -1, 'COL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CMS_ACT_COL_ID, CMS_STG_COL_ID, 'ACTIVE', 0, 1, 'SUBSCRIBE_CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
		FROM MIG_CO001_AB s
		WHERE NOT EXISTS (SELECT 1 FROM transaction 
		 		WHERE reference_id = s.CMS_ACT_COL_ID 
		 		AND transaction_type = 'COL' fetch first row only)
		AND s.IS_VALID = 'Y'
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET3', 'GENERIC', 2);
	COMMIT;
	
	-- COLLATERAL - AB-Gold
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
				transaction_date, reference_id, staging_reference_id, status, team_id, 
				version, opsdesc, cur_trx_history_id)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			   'ND', -1, 'COL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CMS_ACT_COL_ID, CMS_STG_COL_ID, 'ACTIVE', 0, 1, 'SUBSCRIBE_CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
		FROM MIG_CO002_AB_GOLD s
		WHERE NOT EXISTS (SELECT 1 FROM transaction 
		 		WHERE reference_id = s.CMS_ACT_COL_ID 
		 		AND transaction_type = 'COL' fetch first row only)
		AND s.IS_VALID = 'Y'
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET3', 'GENERIC', 3);
	COMMIT;
	
	-- COLLATERAL - Cash
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
				transaction_date, reference_id, staging_reference_id, status, team_id, 
				version, opsdesc, cur_trx_history_id)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			   'ND', -1, 'COL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CMS_ACT_COL_ID, CMS_STG_COL_ID, 'ACTIVE', 0, 1, 'SUBSCRIBE_CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
		FROM MIG_CO005_CS s
		WHERE NOT EXISTS (SELECT 1 FROM transaction 
		 		WHERE reference_id = s.CMS_ACT_COL_ID 
		 		AND transaction_type = 'COL' fetch first row only)
		AND s.IS_VALID = 'Y'
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET3', 'GENERIC', 4);
	COMMIT;
	
	-- COLLATERAL - MS
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
				transaction_date, reference_id, staging_reference_id, status, team_id, 
				version, opsdesc, cur_trx_history_id)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			   'ND', -1, 'COL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CMS_ACT_COL_ID, CMS_STG_COL_ID, 'ACTIVE', 0, 1, 'SUBSCRIBE_CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
		FROM MIG_CO008_MS s
		WHERE NOT EXISTS (SELECT 1 FROM transaction 
		 		WHERE reference_id = s.CMS_ACT_COL_ID 
		 		AND transaction_type = 'COL' fetch first row only)
		AND s.IS_VALID = 'Y'
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET3', 'GENERIC', 5);
	COMMIT;
	
	-- COLLATERAL - PT
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
				transaction_date, reference_id, staging_reference_id, status, team_id, 
				version, opsdesc, cur_trx_history_id)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			   'ND', -1, 'COL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CMS_ACT_COL_ID, CMS_STG_COL_ID, 'ACTIVE', 0, 1, 'SUBSCRIBE_CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
		FROM MIG_CO009_PT s
		WHERE NOT EXISTS (SELECT 1 FROM transaction 
		 		WHERE reference_id = s.CMS_ACT_COL_ID 
		 		AND transaction_type = 'COL' fetch first row only)
		AND s.IS_VALID = 'Y'
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET3', 'GENERIC', 6);
	COMMIT;
	
	-- COLLATERAL - GT
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
				transaction_date, reference_id, staging_reference_id, status, team_id, 
				version, opsdesc, cur_trx_history_id)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			   'ND', -1, 'COL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CMS_ACT_COL_ID, CMS_STG_COL_ID, 'ACTIVE', 0, 1, 'SUBSCRIBE_CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
		FROM MIG_CO010_GT s
		WHERE NOT EXISTS (SELECT 1 FROM transaction 
		 		WHERE reference_id = s.CMS_ACT_COL_ID 
		 		AND transaction_type = 'COL' fetch first row only)
		AND s.IS_VALID = 'Y'
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET3', 'GENERIC', 7);
	COMMIT;
	
	-- COLLATERAL - OT
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
				transaction_date, reference_id, staging_reference_id, status, team_id, 
				version, opsdesc, cur_trx_history_id)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			   'ND', -1, 'COL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CMS_ACT_COL_ID, CMS_STG_COL_ID, 'ACTIVE', 0, 1, 'SUBSCRIBE_CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
		FROM MIG_CO011_OT s
		WHERE NOT EXISTS (SELECT 1 FROM transaction 
		 		WHERE reference_id = s.CMS_ACT_COL_ID 
		 		AND transaction_type = 'COL' fetch first row only)
		AND s.IS_VALID = 'Y'
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET3', 'GENERIC', 8);
	COMMIT;
	
	-- COLLATERAL - IN
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
				transaction_date, reference_id, staging_reference_id, status, team_id, 
				version, opsdesc, cur_trx_history_id)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			   'ND', -1, 'COL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CMS_ACT_COL_ID, CMS_STG_COL_ID, 'ACTIVE', 0, 1, 'SUBSCRIBE_CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
		FROM MIG_CO012_IN s
		WHERE NOT EXISTS (SELECT 1 FROM transaction 
		 		WHERE reference_id = s.CMS_ACT_COL_ID 
		 		AND transaction_type = 'COL' fetch first row only)
		AND s.IS_VALID = 'Y'
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET3', 'GENERIC', 9);
	COMMIT;
	
	-- COLLATERAL - CL
	INSERT INTO transaction (transaction_id, from_state, user_id, transaction_type, creation_date, 
				transaction_date, reference_id, staging_reference_id, status, team_id, 
				version, opsdesc, cur_trx_history_id)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
			   'ND', -1, 'COL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CMS_ACT_COL_ID, CMS_STG_COL_ID, 'ACTIVE', 0, 1, 'SUBSCRIBE_CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
		FROM MIG_CO014_CL s
		WHERE NOT EXISTS (SELECT 1 FROM transaction 
		 		WHERE reference_id = s.CMS_ACT_COL_ID 
		 		AND transaction_type = 'COL' fetch first row only)
		AND s.IS_VALID = 'Y'
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET3', 'GENERIC', 10);
	COMMIT;
	
	CALL RUNSTATS_HELPER('TRANSACTION', 'TRANSACTION_TYPE');
	--CALL RUNSTATS_HELPER('TRANS_HISTORY', 'TRANSACTION_ID');

	--LOCK TABLE trans_history IN SHARE MODE;
	INSERT INTO trans_history (tr_history_id, transaction_id, from_state, to_state, user_id, transaction_type, 
				creation_date, transaction_date, reference_id, status, staging_reference_id, 
				opsdesc, customer_id, trx_origin_country, trx_origin_organisation, limit_profile_id)
	(
	   SELECT CAST(cur_trx_history_id AS BIGINT), transaction_id, from_state, status, user_id, transaction_type, creation_date,
	   		  transaction_date, CAST(reference_id AS CHAR(17)), status, CAST(staging_reference_id AS CHAR(17)), opsdesc,customer_id, 
	   		  trx_origin_country, trx_origin_organisation, limit_profile_id 
	   FROM transaction t
	   WHERE transaction_type IN ('COL') 
	   AND NOT EXISTS (SELECT 's' FROM trans_history
	      		WHERE transaction_id = t.transaction_id fetch first row only)
	   		--AND cur_trx_history_id IS NOT NULL
	);
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_TRANSACTION_SET3', 'GENERIC', 0);

END@


CREATE PROCEDURE AUTO_CREATE_CHECKLIST
	LANGUAGE SQL
BEGIN
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 1);
	commit;
	
	call runstats_helper('CMS_CHECKLIST');
	call runstats_helper('STAGE_CHECKLIST');
	
	-- truncate table mig_tmp_aa  
	call util_truncate_table('MIG_TMP_AA');
	
	call runstats_helper('MIG_TMP_AA');
	
	-- only create checklist for the AA if all the facility not in pending status.
	insert into mig_tmp_aa (CMS_LSP_LMT_PROFILE_ID, CMS_CUSTOMER_ID, LLP_BCA_REF_NUM, LOS_BCA_REF_NUM, APPLICATION_TYPE)
	(SELECT aa.cms_act_lmt_profile_id, aa.cms_act_cif_id, aa_number ,los_bca_ref_num, application_type
	from mig_ca001_aa aa
	where is_valid = 'Y'
	and not exists (
		select 1
		from mig_ca003_1 lmt
		where lmt.cms_act_lmt_profile_id = aa.cms_act_lmt_profile_id
		and lmt.is_valid = 'Y'
		and lmt.fac_status_code_value in ('P', 'T')));
		
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 2);		
	commit;
	
	create index mig_tmp_aa_idx1 on mig_tmp_aa
		(cms_lsp_lmt_profile_id) allow reverse scans
		COLLECT STATISTICS;
		
	update mig_tmp_aa
	set transaction_id = (select trx.transaction_id
		from transaction trx
		where trx.transaction_type = 'LIMITPROFILE'
		AND trx.reference_id = cms_lsp_lmt_profile_id);

	drop index mig_tmp_aa_idx1;
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 3);		
	commit;	
	
	create index temp_index_1 on mig_tmp_aa
		(cms_customer_id, cms_lsp_lmt_profile_id, application_type)
		allow reverse scans
		COLLECT STATISTICS;
		
	create index temp_index_2 on cms_checklist
		(category, sub_category, cms_lmp_sub_profile_id, cms_lsp_lmt_profile_id, checklist_id)
		allow reverse scans
		COLLECT STATISTICS;		
			
	-- insert C/C main borrower checklist
    INSERT INTO CMS_CHECKLIST(
        CHECKLIST_ID, MASTERLIST_ID, CATEGORY, VERSION_TIME, 
        CMS_LSP_LMT_PROFILE_ID, CMS_LMP_SUB_PROFILE_ID, SUB_CATEGORY, 
        STATUS, LAST_DOC_REC_DATE, ALLOW_DELETE_IND, DOC_ORIG_COUNTRY, DOC_ORIG_ORGANISATION, 
        APPLICATION_TYPE, REMARKS, DISABLE_COLLABORATION_IND) 
    SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CHECKLIST_SEQ), 2)) as BIGINT), 
        -999999999, 'CC', 0,
        lmt.CMS_LSP_LMT_PROFILE_ID, lmt.cms_customer_id, 'MAIN_BORROWER', 
        'COMPLETED', current timestamp, 'N', sub.CMS_SUB_ORIG_COUNTRY, sub.CMS_SUB_ORIG_ORGANISATION,
        lmt.APPLICATION_TYPE, 'MIGRATION', 'N'
    from mig_tmp_aa lmt, sci_le_sub_profile sub
    where lmt.CMS_CUSTOMER_ID = sub.CMS_LE_SUB_PROFILE_ID
    and NOT EXISTS (SELECT 1 FROM CMS_CHECKLIST chk
    			WHERE chk.category = 'CC'
    			and chk.SUB_CATEGORY = 'MAIN_BORROWER' 
    			and chk.CMS_LMP_SUB_PROFILE_ID = lmt.CMS_CUSTOMER_ID
    			and chk.CMS_LSP_LMT_PROFILE_ID = lmt.CMS_LSP_LMT_PROFILE_ID
    			fetch first row only);	
						    
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 4);		
	commit;	
	
	create index temp_index_3 on stage_checklist
		(category, sub_category, cms_lmp_sub_profile_id, cms_lsp_lmt_profile_id, checklist_id)
		allow reverse scans
		COLLECT STATISTICS;		
	
    INSERT INTO STAGE_CHECKLIST(
        CHECKLIST_ID, MASTERLIST_ID, CATEGORY, VERSION_TIME, 
        CMS_LSP_LMT_PROFILE_ID, CMS_LMP_SUB_PROFILE_ID, SUB_CATEGORY, 
        STATUS, LAST_DOC_REC_DATE, ALLOW_DELETE_IND, DOC_ORIG_COUNTRY, DOC_ORIG_ORGANISATION, 
        APPLICATION_TYPE, REMARKS, DISABLE_COLLABORATION_IND) 
    SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CHECKLIST_SEQ), 2)) as BIGINT), 
        -999999999, 'CC', 0,
        lmt.CMS_LSP_LMT_PROFILE_ID, sub.CMS_LE_SUB_PROFILE_ID, 'MAIN_BORROWER', 
        'COMPLETED', current timestamp, 'N', sub.CMS_SUB_ORIG_COUNTRY, sub.CMS_SUB_ORIG_ORGANISATION,
        lmt.APPLICATION_TYPE, 'MIGRATION', 'N'
    from mig_tmp_aa lmt, sci_le_sub_profile sub
    where lmt.CMS_CUSTOMER_ID = sub.CMS_LE_SUB_PROFILE_ID
    and NOT EXISTS (SELECT 1 FROM STAGE_CHECKLIST chk
    			WHERE chk.category = 'CC'
    			and chk.SUB_CATEGORY = 'MAIN_BORROWER' 
    			and chk.CMS_LMP_SUB_PROFILE_ID = lmt.cms_customer_id
    			and chk.CMS_LSP_LMT_PROFILE_ID = lmt.CMS_LSP_LMT_PROFILE_ID
    			fetch first row only);
    			
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 5);		
	commit;	    	

	drop index temp_index_1;
	
	create table mig_tmp_cc_checklist (
		cms_act_checklist_id	bigint,
		cms_stg_checklist_id	bigint,
		cms_lsp_lmt_profile_id	bigint,
		cms_le_sub_profile_id	bigint,
		cms_customer_id			bigint,
		trx_reference_id		bigint,
		doc_orig_country		varchar(2),
		doc_orig_organisation	varchar(40)
	) in CMS_MIG index in CMS_MIG_INDEX;
	
	call runstats_helper('CMS_CHECKLIST');
	
	insert into mig_tmp_cc_checklist (cms_act_checklist_id, cms_lsp_lmt_profile_id, cms_le_sub_profile_id,
		cms_customer_id, --trx_reference_id, 
		doc_orig_country, doc_orig_organisation)
	(select chk.checklist_id, chk.cms_lsp_lmt_profile_id, chk.CMS_LMP_SUB_PROFILE_ID, chk.CMS_LMP_SUB_PROFILE_ID,
		--cast(aa.transaction_id as bigint), 
		chk.doc_orig_country, chk.doc_orig_organisation
	from cms_checklist chk --mig_tmp_aa aa, 
	where chk.category = 'CC'
	and chk.sub_category = 'MAIN_BORROWER'
	--and aa.cms_customer_id = chk.CMS_LMP_SUB_PROFILE_ID
	--and aa.cms_lsp_lmt_profile_id = chk.cms_lsp_lmt_profile_id
	and not exists ( select 1 from transaction trx
		where trx.transaction_type = 'CHECKLIST'
		AND reference_id = chk.checklist_id));
		
	commit;
		
	create index temp_index_1 on mig_tmp_aa
		(cms_lsp_lmt_profile_id, transaction_id) allow reverse scans
		collect statistics;
	
	create index temp_index_4 on mig_tmp_cc_checklist
		(cms_lsp_lmt_profile_id) allow reverse scans
		collect statistics;
		
	call runstats_helper('mig_tmp_cc_checklist');		
	call runstats_helper('mig_tmp_aa');		
			
	update mig_tmp_cc_checklist chk
	set trx_reference_id = (select cast(aa.transaction_id as bigint)
		from mig_tmp_aa aa
		where chk.cms_lsp_lmt_profile_id = aa.cms_lsp_lmt_profile_id)
	where cms_lsp_lmt_profile_id is not null;
	
	drop index temp_index_1;
 	drop index temp_index_4;
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 6);		
	commit;	 	
	
	call runstats_helper('STAGE_CHECKLIST');
	call runstats_helper('mig_tmp_cc_checklist');	
	
	create index mig_tmp_cc_checklist_IDX1 on mig_tmp_cc_checklist
		(cms_lsp_lmt_profile_id, cms_le_sub_profile_id)
		allow reverse scans
		collect statistics;
			
	update mig_tmp_cc_checklist a
	set cms_stg_checklist_id = (select checklist_id
		from stage_checklist s
		where category = 'CC'
		and sub_category = 'MAIN_BORROWER'
		and s.cms_lmp_sub_profile_id = a.cms_le_sub_profile_id
		and s.cms_lsp_lmt_profile_id = a.cms_lsp_lmt_profile_id)
	where cms_lsp_lmt_profile_id is not null;
		
	drop index mig_tmp_cc_checklist_IDX1;
		
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 7);		
	commit;	 
	
	-- insert checklist transaction for CC Main borrower checklist
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(    SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
        ''ND'', -1, ''CHECKLIST'', current timestamp, current timestamp, cms_act_checklist_id, ''ACTIVE'', cms_stg_checklist_id, 
        0, 1, ''CHECKLIST MIGRATION'', ''SYSTEM_CREATE'', trx_reference_id,
         trim(char(cms_customer_id )),  cms_customer_id , 
        DOC_ORIG_COUNTRY, DOC_ORIG_ORGANISATION,
        c.CMS_LSP_LMT_PROFILE_ID, 
		''--'', ''CC_CHECKLIST'',
        char(-999999999), -999999999, -999999999,
        CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
	from mig_tmp_cc_checklist C) of cursor
    INSERT INTO TRANSACTION(
        TRANSACTION_ID, FROM_STATE, USER_ID, TRANSACTION_TYPE, CREATION_DATE, 
        TRANSACTION_DATE, REFERENCE_ID, STATUS, STAGING_REFERENCE_ID, 
        TEAM_ID, VERSION, REMARKS, OPSDESC, TRX_REFERENCE_ID,
         LEGAL_ID,  CUSTOMER_ID, TRX_ORIGIN_COUNTRY, TRX_ORIGIN_ORGANISATION, 
        LIMIT_PROFILE_ID, 
		TRX_SEGMENT, TRANSACTION_SUBTYPE, 
        TO_GROUP_TYPE_ID, TO_GROUP_ID, TO_USER_ID, CUR_TRX_HISTORY_ID)');	
        
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 8);		
	commit;	         
		
	call runstats_helper('CMS_CHECKLIST');
	call runstats_helper('STAGE_CHECKLIST');
		
	create index mig_tmp_aa_idx1 on mig_tmp_aa
		(cms_lsp_lmt_profile_id, application_type, cms_customer_id)
		allow reverse scans
		collect statistics;
		
	create index temp_mig_ca002_jb_idx1 on mig_ca002_jb
		(is_valid, cms_act_lmt_profile_id, cms_act_cif_id )
		allow reverse scans
		collect statistics;
		
	-- insert C/C checklist for joint borrower
    INSERT INTO CMS_CHECKLIST(
        CHECKLIST_ID, MASTERLIST_ID, CATEGORY, VERSION_TIME, 
        CMS_LSP_LMT_PROFILE_ID, CMS_LMP_SUB_PROFILE_ID, SUB_CATEGORY, 
        STATUS, LAST_DOC_REC_DATE, ALLOW_DELETE_IND, DOC_ORIG_COUNTRY, DOC_ORIG_ORGANISATION, 
        APPLICATION_TYPE, REMARKS, DISABLE_COLLABORATION_IND) 
    SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CHECKLIST_SEQ), 2)) as BIGINT), 
        -999999999, 'CC', 0,
        lmt.CMS_LSP_LMT_PROFILE_ID, jb.cms_act_cif_id, 'JOINT_BORROWER', 
        'COMPLETED', current timestamp, 'N', sub.CMS_SUB_ORIG_COUNTRY, sub.CMS_SUB_ORIG_ORGANISATION,
        lmt.APPLICATION_TYPE, 'MIGRATION', 'N'
    from mig_tmp_aa lmt, mig_ca002_jb jb, sci_le_sub_profile sub
    where jb.is_valid = 'Y'
    and jb.cms_act_lmt_profile_id = lmt.cms_lsp_lmt_profile_id
    and jb.cms_act_cif_id = sub.cms_le_sub_profile_id       
    and NOT EXISTS (SELECT 1 FROM CMS_CHECKLIST chk
    			WHERE chk.category = 'CC'
    			and chk.SUB_CATEGORY = 'JOINT_BORROWER' 
    			and chk.CMS_LMP_SUB_PROFILE_ID = jb.cms_act_cif_id
    			and chk.CMS_LSP_LMT_PROFILE_ID = jb.cms_act_lmt_profile_id
    			fetch first row only);	
					
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 9);		
	commit;	     			
    			
    INSERT INTO STAGE_CHECKLIST(
        CHECKLIST_ID, MASTERLIST_ID, CATEGORY, VERSION_TIME, 
        CMS_LSP_LMT_PROFILE_ID, CMS_LMP_SUB_PROFILE_ID, SUB_CATEGORY, 
        STATUS, LAST_DOC_REC_DATE, ALLOW_DELETE_IND, DOC_ORIG_COUNTRY, DOC_ORIG_ORGANISATION, 
        APPLICATION_TYPE, REMARKS, DISABLE_COLLABORATION_IND) 
    SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CHECKLIST_SEQ), 2)) as BIGINT), 
        -999999999, 'CC', 0,
        lmt.CMS_LSP_LMT_PROFILE_ID, jb.cms_act_cif_id, 'JOINT_BORROWER', 
        'COMPLETED', current timestamp, 'N', sub.CMS_SUB_ORIG_COUNTRY, sub.CMS_SUB_ORIG_ORGANISATION,
        lmt.APPLICATION_TYPE, 'MIGRATION', 'N'
    from mig_tmp_aa lmt, mig_ca002_jb jb, sci_le_sub_profile sub
    where jb.is_valid = 'Y'
    and jb.cms_act_lmt_profile_id = lmt.cms_lsp_lmt_profile_id
    and jb.cms_act_cif_id = sub.cms_le_sub_profile_id       
    and NOT EXISTS (SELECT 1 FROM STAGE_CHECKLIST chk
    			WHERE chk.category = 'CC'
    			and chk.SUB_CATEGORY = 'JOINT_BORROWER' 
    			and chk.CMS_LMP_SUB_PROFILE_ID = jb.cms_act_cif_id
    			and chk.CMS_LSP_LMT_PROFILE_ID = jb.cms_act_lmt_profile_id
    			fetch first row only);	
    			    			
	
	drop index mig_tmp_aa_idx1;
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 10);		
	commit;	  	
	
	call util_truncate_table('mig_tmp_cc_checklist');
	call runstats_helper('mig_tmp_cc_checklist');
	
	insert into mig_tmp_cc_checklist (cms_act_checklist_id, cms_lsp_lmt_profile_id, cms_le_sub_profile_id,
		cms_customer_id, trx_reference_id, doc_orig_country, doc_orig_organisation)
	(select chk.checklist_id, chk.cms_lsp_lmt_profile_id, chk.CMS_LMP_SUB_PROFILE_ID, aa.cms_customer_id, 
		cast(aa.transaction_id as bigint), chk.doc_orig_country, chk.doc_orig_organisation
	from mig_ca002_jb jb, cms_checklist chk, mig_tmp_aa aa
	where chk.category = 'CC'
	and chk.sub_category = 'JOINT_BORROWER'
	and jb.is_valid = 'Y'
	and jb.cms_act_lmt_profile_id = chk.cms_lsp_lmt_profile_id
	and jb.cms_act_cif_id = chk.CMS_LMP_SUB_PROFILE_ID
	and jb.cms_act_lmt_profile_id = aa.cms_lsp_lmt_profile_id
	and not exists ( select 1 from transaction trx
		where trx.transaction_type = 'CHECKLIST'
		AND reference_id = chk.checklist_id));
			
	drop index temp_mig_ca002_jb_idx1;
   		
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 11);
	commit;	  	
	
	create index mig_tmp_cc_checklist_IDX1 on mig_tmp_cc_checklist
		(cms_le_sub_profile_id, cms_lsp_lmt_profile_id)
		allow reverse scans
		collect statistics;
			
	update mig_tmp_cc_checklist a
	set cms_stg_checklist_id = (select checklist_id
		from stage_checklist s
		where category = 'CC'
		and sub_category = 'JOINT_BORROWER'
		and s.cms_lmp_sub_profile_id = a.cms_le_sub_profile_id
		and s.cms_lsp_lmt_profile_id = a.cms_lsp_lmt_profile_id);
		
	drop index mig_tmp_cc_checklist_IDX1;
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 12);
	commit;	  	

	-- insert checklist transaction for CC joint borrower checklist
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(    SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
        ''ND'', -1, ''CHECKLIST'', current timestamp, current timestamp, cms_act_checklist_id, ''ACTIVE'', cms_stg_checklist_id, 
        0, 1, ''CHECKLIST MIGRATION'', ''SYSTEM_CREATE'', trx_reference_id,
         trim(char(cms_customer_id )),  cms_customer_id , 
        DOC_ORIG_COUNTRY, DOC_ORIG_ORGANISATION,
        c.CMS_LSP_LMT_PROFILE_ID, 
		''--'', ''CC_CHECKLIST'',
        char(-999999999), -999999999, -999999999,
        CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
	from mig_tmp_cc_checklist C) of cursor
    INSERT INTO TRANSACTION(
        TRANSACTION_ID, FROM_STATE, USER_ID, TRANSACTION_TYPE, CREATION_DATE, 
        TRANSACTION_DATE, REFERENCE_ID, STATUS, STAGING_REFERENCE_ID, 
        TEAM_ID, VERSION, REMARKS, OPSDESC, TRX_REFERENCE_ID,
         LEGAL_ID,  CUSTOMER_ID, TRX_ORIGIN_COUNTRY, TRX_ORIGIN_ORGANISATION, 
        LIMIT_PROFILE_ID, 
		TRX_SEGMENT, TRANSACTION_SUBTYPE, 
        TO_GROUP_TYPE_ID, TO_GROUP_ID, TO_USER_ID, CUR_TRX_HISTORY_ID)');	
        
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 13);		
	commit;	    	
	
	drop index temp_index_2;
	drop index temp_index_3;	
	drop table mig_tmp_cc_checklist;
	
	create index temp_index_1 on mig_tmp_aa
		(cms_lsp_lmt_profile_id)
		allow reverse scans
		collect statistics;
		
	-- insert C/C checklist for pledgor
	call util_truncate_table('tmp_pledgor_checklist');
	call runstats_helper('tmp_pledgor_checklist');
			
	insert into tmp_pledgor_checklist 
	(cms_pledgor_dtl_id, cms_lsp_lmt_profile_id, doc_orig_country, doc_orig_organisation, 
		cms_customer_id, pledgor_cif_id, application_type, trx_reference_id)
	(select distinct pg.cms_pldgr_id, aa.cms_lsp_lmt_profile_id, pledgor_country, pledgor_org_code,
		aa.cms_customer_id, pg.pledgor_cif_id, application_type, cast(aa.transaction_id as bigint)
	from mig_co018_pg pg, cms_limit_security_map lsm, mig_tmp_aa aa
	where pg.cms_act_col_id = lsm.cms_collateral_id
	and lsm.cms_lsp_lmt_profile_id = aa.cms_lsp_lmt_profile_id
	and pg.is_valid = 'Y');	
	        
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 14);		
	commit;	  	
	
	update tmp_pledgor_checklist
	set pledgor_customer_id = 
		(select cms_le_sub_profile_id
		from sci_le_sub_profile sp, sci_le_main_profile mp
		where sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
		and mp.lmp_le_id = pledgor_cif_id
		and mp.source_id = 'SIBS');
		
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 15);		
	commit;	  		
	
	create index tmp_pledgor_chklist_idx1 on tmp_pledgor_checklist
		(pledgor_customer_id, cms_customer_id)
		allow reverse scans
		collect statistics;
		
	-- set is borrower indicator if the pledgor = main borrower	
	update tmp_pledgor_checklist
	set is_borrower = 'Y'
	where pledgor_customer_id = cms_customer_id;
	
	drop index tmp_pledgor_chklist_idx1;	
		
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 16);		
	commit;	  		

	-- set is borrower indicator if the pledgor = joint borrower
	create index tmp_pledgor_chklist_idx1 on tmp_pledgor_checklist
		(is_borrower, cms_lsp_lmt_profile_id, pledgor_customer_id)
		allow reverse scans
		collect statistics;	
	
	update tmp_pledgor_checklist p
	set is_borrower = 'Y'
	where is_borrower = 'N'
	and exists (select 1 from sci_lsp_joint_borrower jb
		where jb.cms_lmp_limit_profile_id = p.cms_lsp_lmt_profile_id
		and jb.cms_le_sub_profile_id = p.pledgor_customer_id);
		
	drop index tmp_pledgor_chklist_idx1;		
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 17);		
	commit;	 
	
	-- insert pledgor CC checklist
	create index tmp_pledgor_chklist_idx1 on tmp_pledgor_checklist
		(is_borrower, cms_lsp_lmt_profile_id, cms_pledgor_dtl_id)
		allow reverse scans
		collect statistics;		
		
	create index temp_index_2 on cms_checklist
		(category, sub_category, cms_lsp_lmt_profile_id, cms_pledgor_dtl_id, checklist_id)
		allow reverse scans
		COLLECT STATISTICS;	
		
	CALL RUNSTATS_HELPER('CMS_CHECKLIST', 'category, sub_category, cms_lsp_lmt_profile_id, cms_pledgor_dtl_id, checklist_id');	
	
    INSERT INTO CMS_CHECKLIST(
        CHECKLIST_ID, MASTERLIST_ID, CATEGORY, VERSION_TIME, 
        CMS_PLEDGOR_DTL_ID, CMS_LSP_LMT_PROFILE_ID, SUB_CATEGORY, 
        STATUS, LAST_DOC_REC_DATE, ALLOW_DELETE_IND, DOC_ORIG_COUNTRY, DOC_ORIG_ORGANISATION, 
        APPLICATION_TYPE, REMARKS, DISABLE_COLLABORATION_IND) 
    SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CHECKLIST_SEQ), 2)) as BIGINT), 
        -999999999, 'CC', 0,
        cms_pledgor_dtl_id, cms_lsp_lmt_profile_id, 'PLEDGOR', 
        'COMPLETED', current timestamp, 'N', doc_orig_country, doc_orig_organisation,
        APPLICATION_TYPE, 'MIGRATION', 'N'
    from tmp_pledgor_checklist p
    where is_borrower = 'N'
    and not exists (select 1
    	from cms_checklist chk
    	where chk.category = 'CC'
    	and chk.sub_category = 'PLEDGOR'
    	and chk.cms_lsp_lmt_profile_id = p.cms_lsp_lmt_profile_id
    	and chk.cms_pledgor_dtl_id = p.cms_pledgor_dtl_id);
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 18);		
	commit;	     	
	
	create index temp_index_3 on stage_checklist
		(category, sub_category, cms_lsp_lmt_profile_id, cms_pledgor_dtl_id, checklist_id)
		allow reverse scans
		COLLECT STATISTICS;		
			
	CALL RUNSTATS_HELPER('STAGE_CHECKLIST', 'category, sub_category, cms_lsp_lmt_profile_id, cms_pledgor_dtl_id, checklist_id');
			
    INSERT INTO STAGE_CHECKLIST(
        CHECKLIST_ID, MASTERLIST_ID, CATEGORY, VERSION_TIME, 
        CMS_PLEDGOR_DTL_ID, CMS_LSP_LMT_PROFILE_ID, SUB_CATEGORY, 
        STATUS, LAST_DOC_REC_DATE, ALLOW_DELETE_IND, DOC_ORIG_COUNTRY, DOC_ORIG_ORGANISATION, 
        APPLICATION_TYPE, REMARKS, DISABLE_COLLABORATION_IND) 
    SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CHECKLIST_SEQ), 2)) as BIGINT), 
        -999999999, 'CC', 0,
        cms_pledgor_dtl_id, cms_lsp_lmt_profile_id, 'PLEDGOR', 
        'COMPLETED', current timestamp, 'N', doc_orig_country, doc_orig_organisation,
        APPLICATION_TYPE, 'MIGRATION', 'N'
    from tmp_pledgor_checklist p
    where is_borrower = 'N'
    and not exists (select 1
    	from stage_checklist chk
    	where chk.category = 'CC'
    	and chk.sub_category = 'PLEDGOR'
    	and chk.cms_lsp_lmt_profile_id = p.cms_lsp_lmt_profile_id
    	and chk.cms_pledgor_dtl_id = p.cms_pledgor_dtl_id);    
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 19);		
	commit;	  
	    
	update tmp_pledgor_checklist p
	set cms_act_checklist_id = (select checklist_id
		from cms_checklist chk
		where chk.category = 'CC'
		and chk.sub_category = 'PLEDGOR'
		and chk.cms_lsp_lmt_profile_id = p.cms_lsp_lmt_profile_id
		and chk.cms_pledgor_dtl_id = p.cms_pledgor_dtl_id)
	where is_borrower = 'N';
	
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 20);		
	commit;	 
	
	update tmp_pledgor_checklist p
	set cms_stg_checklist_id = (select checklist_id
		from stage_checklist chk
		where chk.category = 'CC'
		and chk.sub_category = 'PLEDGOR'
		and chk.cms_lsp_lmt_profile_id = p.cms_lsp_lmt_profile_id
		and chk.cms_pledgor_dtl_id = p.cms_pledgor_dtl_id)
	where is_borrower = 'N';
			
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 21);		
	commit;	 
	
	drop index temp_index_2;
	drop index temp_index_3;
    drop index tmp_pledgor_chklist_idx1;
    
    CREATE INDEX tmp_pledgor_chklist_idx1 ON tmp_pledgor_checklist
    	(is_borrower, cms_act_checklist_id)
    	allow reverse scans
    	collect statistics;
    	
	-- insert checklist transaction for CC pledgor checklist
-- 	Call SYSPROC.ADMIN_CMD('LOAD FROM 
-- 	(    SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
--         ''ND'', -1, ''CHECKLIST'', current timestamp, current timestamp, cms_act_checklist_id, ''ACTIVE'', cms_stg_checklist_id, 
--         0, 1, ''CHECKLIST MIGRATION'', ''SYSTEM_CREATE'', trx_reference_id,
--          trim(char(cms_customer_id )),  cms_customer_id , 
--         DOC_ORIG_COUNTRY, DOC_ORIG_ORGANISATION,
--         c.CMS_LSP_LMT_PROFILE_ID, 
-- 		''--'', ''CC_CHECKLIST'',
--         char(-999999999), -999999999, -999999999,
--         CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
-- 	from tmp_pledgor_checklist C
-- 	where not exists ( select 1 from transaction trx 
-- 		where transaction_type = ''CHECKLIST'' 
-- 		AND trx.reference_id = cms_act_checklist_id)
-- 	and is_borrower = ''N'') of cursor
--     INSERT INTO TRANSACTION(
--         TRANSACTION_ID, FROM_STATE, USER_ID, TRANSACTION_TYPE, CREATION_DATE, 
--         TRANSACTION_DATE, REFERENCE_ID, STATUS, STAGING_REFERENCE_ID, 
--         TEAM_ID, VERSION, REMARKS, OPSDESC, TRX_REFERENCE_ID,
--          LEGAL_ID,  CUSTOMER_ID, TRX_ORIGIN_COUNTRY, TRX_ORIGIN_ORGANISATION, 
--         LIMIT_PROFILE_ID, 
-- 		TRX_SEGMENT, TRANSACTION_SUBTYPE, 
--         TO_GROUP_TYPE_ID, TO_GROUP_ID, TO_USER_ID, CUR_TRX_HISTORY_ID)');	
        
	INSERT INTO TRANSACTION(
        TRANSACTION_ID, FROM_STATE, USER_ID, TRANSACTION_TYPE, CREATION_DATE, 
        TRANSACTION_DATE, REFERENCE_ID, STATUS, STAGING_REFERENCE_ID, 
        TEAM_ID, VERSION, REMARKS, OPSDESC, TRX_REFERENCE_ID,
         LEGAL_ID,  CUSTOMER_ID, TRX_ORIGIN_COUNTRY, TRX_ORIGIN_ORGANISATION, 
        LIMIT_PROFILE_ID, 
		TRX_SEGMENT, TRANSACTION_SUBTYPE, 
        TO_GROUP_TYPE_ID, TO_GROUP_ID, TO_USER_ID, CUR_TRX_HISTORY_ID)   
	SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
        'ND', -1, 'CHECKLIST', current timestamp, current timestamp, cms_act_checklist_id, 'ACTIVE', cms_stg_checklist_id, 
        0, 1, 'CHECKLIST MIGRATION', 'SYSTEM_CREATE', trx_reference_id,
         trim(char(cms_customer_id )),  cms_customer_id , 
        DOC_ORIG_COUNTRY, DOC_ORIG_ORGANISATION,
        c.CMS_LSP_LMT_PROFILE_ID, 
		'--', 'CC_CHECKLIST',
        char(-999999999), -999999999, -999999999,
        CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
	from tmp_pledgor_checklist C
	where not exists ( select 1 from transaction trx 
		where transaction_type = 'CHECKLIST' 
		AND trx.reference_id = cms_act_checklist_id)
	and is_borrower = 'N';        
		
	drop index tmp_pledgor_chklist_idx1;    
        
	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 22);		
	commit;	   	
		

	
	
    ---------------------------------
    -- COLLATERAL CHECKLIST
    ---------------------------------    
	create index temp_index_2 on cms_checklist
		(category, sub_category, cms_lsp_lmt_profile_id, cms_collateral_id)
		allow reverse scans
		collect statistics;
    
    INSERT INTO CMS_CHECKLIST(
        CHECKLIST_ID, CMS_COLLATERAL_ID, MASTERLIST_ID, CATEGORY, VERSION_TIME, 
        CMS_LSP_LMT_PROFILE_ID, CMS_LMP_SUB_PROFILE_ID, SUB_CATEGORY, 
        STATUS, LAST_DOC_REC_DATE, LAW_FIRM_PANEL_FLAG, ALLOW_DELETE_IND, DOC_ORIG_COUNTRY, DOC_ORIG_ORGANISATION, 
        APPLICATION_TYPE, REMARKS, DISABLE_COLLABORATION_IND) 
    SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CHECKLIST_SEQ), 2)) as BIGINT), 
        sec.CMS_COLLATERAL_ID, -999999999, 'S', 0,
        aa.CMS_LSP_LMT_PROFILE_ID, -999999999, 'MAIN_BORROWER', 
        'COMPLETED', current timestamp, '-', 'N', sec.SECURITY_LOCATION, sec.SECURITY_ORGANISATION,
        aa.APPLICATION_TYPE, 'MIGRATION', 'N'
    from cms_security sec, CMS_LIMIT_SECURITY_MAP lsm, mig_tmp_aa aa
    where sec.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
    and lsm.CMS_LSP_LMT_PROFILE_ID = aa.CMS_LSP_LMT_PROFILE_ID
    and NOT EXISTS (SELECT 1 FROM CMS_CHECKLIST chk
    			WHERE chk.CMS_LSP_LMT_PROFILE_ID = aa.CMS_LSP_LMT_PROFILE_ID
    			and chk.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
				and chk.category = 'S'
    			and chk.SUB_CATEGORY = 'MAIN_BORROWER' fetch first row only)
    group by sec.CMS_COLLATERAL_ID, aa.CMS_LSP_LMT_PROFILE_ID, aa.APPLICATION_TYPE, sec.SECURITY_LOCATION, sec.SECURITY_ORGANISATION;

    CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 23);
    COMMIT;	
		
	create index temp_index_3 on stage_checklist
		(category, sub_category, cms_lsp_lmt_profile_id, cms_collateral_id)
		allow reverse scans
		collect statistics;    
    
    INSERT INTO STAGE_CHECKLIST(
        CHECKLIST_ID, CMS_COLLATERAL_ID, MASTERLIST_ID, CATEGORY, VERSION_TIME, 
        CMS_LSP_LMT_PROFILE_ID, CMS_LMP_SUB_PROFILE_ID, SUB_CATEGORY, 
        STATUS, LAST_DOC_REC_DATE, LAW_FIRM_PANEL_FLAG, ALLOW_DELETE_IND, DOC_ORIG_COUNTRY, DOC_ORIG_ORGANISATION, 
        APPLICATION_TYPE, REMARKS, DISABLE_COLLABORATION_IND) 
    SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CHECKLIST_SEQ), 2)) as BIGINT), 
        sec.CMS_COLLATERAL_ID, -999999999, 'S', 0,
        aa.CMS_LSP_LMT_PROFILE_ID, -999999999, 'MAIN_BORROWER', 
        'COMPLETED', current timestamp, '-', 'N', sec.SECURITY_LOCATION, sec.SECURITY_ORGANISATION,
        aa.APPLICATION_TYPE, 'MIGRATION', 'N'
    from cms_security sec, CMS_LIMIT_SECURITY_MAP lsm, mig_tmp_aa aa
    where sec.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
    and lsm.CMS_LSP_LMT_PROFILE_ID = aa.CMS_LSP_LMT_PROFILE_ID
    and NOT EXISTS (SELECT 1 FROM STAGE_CHECKLIST chk
    			WHERE chk.CMS_LSP_LMT_PROFILE_ID = aa.CMS_LSP_LMT_PROFILE_ID
    			and chk.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
				and chk.category = 'S'
    			and chk.SUB_CATEGORY = 'MAIN_BORROWER' fetch first row only)
    group by sec.CMS_COLLATERAL_ID, aa.CMS_LSP_LMT_PROFILE_ID, aa.APPLICATION_TYPE, sec.SECURITY_LOCATION, sec.SECURITY_ORGANISATION;
    
    CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 24);
    COMMIT;
            
    drop index temp_index_2;
    drop index temp_index_3;
        
	call util_truncate_table('mig_sec_tmp_checklist');
	call runstats_helper('mig_sec_tmp_checklist');	    
	
	create index temp_index_2 on cms_checklist
		(category, checklist_id)
		allow reverse scans
		collect statistics;
	
	insert into mig_sec_tmp_checklist (cms_act_checklist_id, cms_collateral_id, 
		cms_lsp_lmt_profile_id,doc_orig_country, DOC_ORIG_ORGANISATION)
	select chk.checklist_id, chk.cms_collateral_id, chk.cms_lsp_lmt_profile_id, doc_orig_country, 
		DOC_ORIG_ORGANISATION 
	from cms_checklist chk
	where category = 'S'
	and not exists (select 1 from transaction trx
		where transaction_type = 'CHECKLIST'
		and trx.reference_id = chk.checklist_id fetch first row only);	
		
	drop index temp_index_2;
	
    CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 25);
    COMMIT;		
    
	create index temp_index_3 on stage_checklist
		(category, cms_lsp_lmt_profile_id, cms_collateral_id)
		allow reverse scans
		collect statistics;	
		
	create index temp_index_4 on mig_sec_tmp_checklist
		(cms_lsp_lmt_profile_id, cms_collateral_id)
		allow reverse scans
		collect statistics;
		
	call runstats_helper('STAGE_CHECKLIST');
	call runstats_helper('mig_sec_tmp_checklist');
    
	update mig_sec_tmp_checklist c
	set cms_stg_checklist_id = (select checklist_id
		from stage_checklist s
		where s.cms_collateral_id = c.cms_collateral_id
		and s.cms_lsp_lmt_profile_id = c.cms_lsp_lmt_profile_id
		and s.category = 'S');    
		
    drop index temp_index_3;		
	
    CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 26);
    COMMIT;		
    
    -- insert collateral checklist transaction
    		
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(    SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) AS CHAR(17)), 
        ''ND'', -1, ''CHECKLIST'', current timestamp, current timestamp, cms_act_checklist_id, ''ACTIVE'', cms_stg_checklist_id, 
        0, 1, ''CHECKLIST MIGRATION'', ''SYSTEM_CREATE'', CAST(aa.transaction_id AS BIGINT),
         trim(char(cms_customer_id )),  cms_customer_id , 
        DOC_ORIG_COUNTRY, DOC_ORIG_ORGANISATION,
        chk.CMS_LSP_LMT_PROFILE_ID, 
		''--'', ''CC_CHECKLIST'',
        char(-999999999), -999999999, -999999999,
        CAST((TS_FMT(CURRENT_TIMESTAMP, ''yyyymmdd'') || SUBSTR(DIGITS(NEXT VALUE FOR trx_history_seq), 2)) AS CHAR(17))
    FROM mig_sec_tmp_checklist chk, MIG_TMP_AA aa
	where chk.cms_lsp_lmt_profile_id = aa.cms_lsp_lmt_profile_id) of cursor
    INSERT INTO TRANSACTION(
        TRANSACTION_ID, FROM_STATE, USER_ID, TRANSACTION_TYPE, CREATION_DATE, 
        TRANSACTION_DATE, REFERENCE_ID, STATUS, STAGING_REFERENCE_ID, 
        TEAM_ID, VERSION, REMARKS, OPSDESC, TRX_REFERENCE_ID,
         LEGAL_ID,  CUSTOMER_ID, TRX_ORIGIN_COUNTRY, TRX_ORIGIN_ORGANISATION, 
        LIMIT_PROFILE_ID, 
		TRX_SEGMENT, TRANSACTION_SUBTYPE, 
        TO_GROUP_TYPE_ID, TO_GROUP_ID, TO_USER_ID, CUR_TRX_HISTORY_ID)');	        
        
    CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 27);
    COMMIT;	
            
    drop index temp_index_1;

    drop index temp_index_4;
    
	-- LOCK TABLE trans_history IN SHARE MODE;
	INSERT INTO trans_history (tr_history_id, transaction_id, from_state, to_state, user_id, transaction_type, transaction_subtype, 
					creation_date, transaction_date, reference_id, status, staging_reference_id, 
					opsdesc, customer_id, trx_origin_country, trx_origin_organisation, limit_profile_id)
	(
	   SELECT CAST(cur_trx_history_id AS BIGINT), transaction_id, from_state, status, user_id, transaction_type, transaction_subtype, creation_date,
	   		  transaction_date, CAST(reference_id AS CHAR(17)), status, CAST(staging_reference_id AS CHAR(17)), opsdesc,customer_id, 
	   		  trx_origin_country, trx_origin_organisation, limit_profile_id 
	   FROM transaction t
	   WHERE transaction_type = 'CHECKLIST' 
	   AND NOT EXISTS (SELECT 1 FROM trans_history
	      			WHERE transaction_id = t.transaction_id fetch first row only)
	   			--AND cur_trx_history_id IS NOT NULL
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_CHECKLIST', 'GENERIC', 0);
    COMMIT;
    
END
@  	
  	
CREATE PROCEDURE AUTO_CREATE_STP_TRANS_FAC
	LANGUAGE SQL
BEGIN

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_FAC', 'GENERIC', 1);
	commit;
	
    	CALL RUNSTATS_HELPER('TRANSACTION', 'TRANSACTION_TYPE, STATUS');
    	CALL RUNSTATS_HELPER('MIG_CA003_1', 'IS_VALID, CMS_ACT_FAC_MASTER_ID');

	CREATE INDEX temp_index1 ON TRANSACTION
	("TRANSACTION_TYPE" ASC, "STATUS" ASC, "REFERENCE_ID" ASC, "TRANSACTION_ID" ASC, "CUR_TRX_HISTORY_ID" ASC) 
	ALLOW REVERSE SCANS 
	COLLECT STATISTICS; 
	
	COMMIT;
    	
	DECLARE GLOBAL TEMPORARY TABLE SESSION.fac_trx_info(
			fac_master_id bigint,
			transaction_id varchar(20),
			cur_trx_history_id varchar(20),
			stp_master_trx_id bigint
		) 
		WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;		
		
	insert into SESSION.fac_trx_info (fac_master_id, transaction_id, cur_trx_history_id)
	(select CMS_ACT_FAC_MASTER_ID, TRANSACTION_ID, CUR_TRX_HISTORY_ID
		from MIG_CA003_1 fac, TRANSACTION trans 
		where fac.is_valid = 'Y'
		and trans.transaction_type = 'FACILITY'
		and trans.status = 'ACTIVE'
		and trans.reference_id = fac.cms_act_fac_master_id
	);
	
	drop index temp_index1;
	commit;
	
	CREATE INDEX session.fac_trx_info_idx1
             ON session.fac_trx_info(fac_master_id, transaction_id )
             allow REVERSE SCANS
             COLLECT STATISTICS;	    	
    	
	--LOCK TABLE STP_MASTER_TRANS IN SHARE MODE;
	INSERT INTO STP_MASTER_TRANS (MASTER_TRX_ID, TRANSACTION_ID, STATUS, TRANSACTION_TYPE, REFERENCE_ID, LAST_SUBMISSION_DATE)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_MASTER_TRANS_SEQ), 2)) AS BIGINT), 
			   TRANSACTION_ID, 'COMPLETE', 'FACILITY', fac_master_id, CURRENT_TIMESTAMP
		from SESSION.fac_trx_info t
		where not exists (select 1 from STP_MASTER_TRANS mTrans
			where mTrans.transaction_id = t.transaction_id
			and mTrans.reference_id = t.fac_master_id
			and mTrans.transaction_type = 'FACILITY' fetch first row only)
-- 		FROM MIG_CA003_1 fac, TRANSACTION trans
-- 		WHERE REFERENCE_ID = fac.CMS_ACT_FAC_MASTER_ID 
-- 		AND trans.TRANSACTION_TYPE = 'FACILITY'
-- 		AND trans.STATUS = 'ACTIVE'
-- 		AND NOT EXISTS (SELECT 1 FROM STP_MASTER_TRANS mTrans
-- 			WHERE mTrans.TRANSACTION_ID = trans.TRANSACTION_ID
-- 			AND mTrans.REFERENCE_ID = trans.REFERENCE_ID
-- 			AND mTrans.TRANSACTION_TYPE = 'FACILITY' fetch first row only)
-- 		AND fac.IS_VALID = 'Y'
		--AND EXISTS (SELECT 1 FROM MIG_CA003_1 mig, SCI_LSP_APPR_LMTS lmts
			--WHERE mig.LIMIT_ID = lmts.LMT_ID
			--AND lmts.CMS_LSP_APPR_LMTS_ID = fac.CMS_LSP_APPR_LMTS_ID fetch first row only)
	);
	
	CALL RUNSTATS_HELPER('STP_MASTER_TRANS', 'TRANSACTION_TYPE, TRANSACTION_ID, MASTER_TRX_ID');

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_FAC', 'GENERIC', 2);
	COMMIT;
	
	update session.fac_trx_info t
	set stp_master_trx_id = (select s.MASTER_TRX_ID
		from stp_master_trans s
		where s.transaction_id = t.transaction_id
		and s.transaction_type = 'FACILITY');
		
		
	CREATE INDEX session.fac_trx_info_idx2
             ON session.fac_trx_info(fac_master_id, stp_master_trx_id )
             allow REVERSE SCANS;		
	commit;
		
	--LOCK TABLE STP_TRANS IN SHARE MODE;
	INSERT INTO STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, 
				CUR_TRX_HISTORY_ID, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2)) AS BIGINT), 
			   stp_master_trx_id, '321', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS', 
			   CUR_TRX_HISTORY_ID, 1, 'AA', fac_master_id, 'CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2)) AS BIGINT)
		from session.fac_trx_info t
		where not exists (select 1 from stp_trans sTrans
			where sTrans.master_trx_id = stp_master_trx_id
			and sTrans.trx_type = '321' fetch first row only)
-- 		FROM STP_MASTER_TRANS s, TRANSACTION trans, MIG_CA003_1 fac
-- 		WHERE trans.TRANSACTION_ID = s.TRANSACTION_ID 
-- 		AND trans.TRANSACTION_TYPE = 'FACILITY'
-- 		AND s.TRANSACTION_TYPE = 'FACILITY'
-- 		AND trans.STATUS = 'ACTIVE'
-- 		AND trans.REFERENCE_ID = fac.CMS_ACT_FAC_MASTER_ID
-- 		AND fac.IS_VALID = 'Y'
-- 		AND NOT EXISTS (SELECT 1 FROM STP_TRANS sTrans
-- 			WHERE sTrans.MASTER_TRX_ID = s.MASTER_TRX_ID
-- 			AND sTrans.TRX_TYPE = '321' fetch first row only)
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_FAC', 'GENERIC', 3);
	COMMIT;
	
	CALL RUNSTATS_HELPER('MIG_CA003_2_BNM', 'IS_VALID, CMS_ACT_FAC_MASTER_ID');
	
	--LOCK TABLE STP_TRANS IN SHARE MODE;
	INSERT INTO STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, 
				CUR_TRX_HISTORY_ID, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2)) AS BIGINT), 
			   stp_master_trx_id, '327', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS', 
			   CUR_TRX_HISTORY_ID, 1, 'AA', fac_master_id, 'CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2)) AS BIGINT)
		from session.fac_trx_info t, MIG_CA003_2_BNM bnm 
		where bnm.is_valid = 'Y'
		and bnm.cms_act_fac_master_id = fac_master_id
		and not exists ( select 1 from stp_trans sTrans
			where sTrans.master_trx_id = t.stp_master_trx_id
			and sTrans.trx_type = '327' fetch first row only)
-- 		FROM STP_MASTER_TRANS s, TRANSACTION trans, MIG_CA003_2_BNM bnm 
-- 		WHERE trans.TRANSACTION_ID = s.TRANSACTION_ID 
-- 		AND trans.TRANSACTION_TYPE = 'FACILITY'
-- 		AND s.TRANSACTION_TYPE = 'FACILITY'
-- 		AND trans.STATUS = 'ACTIVE'
-- 		AND trans.REFERENCE_ID = bnm.CMS_ACT_FAC_MASTER_ID
-- 		AND bnm.IS_VALID = 'Y'
-- 		AND NOT EXISTS (SELECT 1 FROM STP_TRANS sTrans
-- 			WHERE sTrans.MASTER_TRX_ID = s.MASTER_TRX_ID
-- 			AND sTrans.TRX_TYPE = '327' fetch first row only)
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_FAC', 'GENERIC', 4);
	COMMIT;
	
	CALL RUNSTATS_HELPER('MIG_CA003_3_OFF', 'IS_VALID, CMS_ACT_FAC_MASTER_ID, CMS_ACT_FAC_OFFICER_ID');
	CALL RUNSTATS_HELPER('STP_TRANS', 'TRX_TYPE, REFERENCE_ID, MASTER_TRX_ID');
	
	--LOCK TABLE STP_TRANS IN SHARE MODE;
	INSERT INTO STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, 
				CUR_TRX_HISTORY_ID, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2)) AS BIGINT), 
			   stp_master_trx_id, '328', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS', 
			   CUR_TRX_HISTORY_ID, 1, 'AA', officer.CMS_ACT_FAC_OFFICER_ID, 'CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2)) AS BIGINT)
		from session.fac_trx_info t, MIG_CA003_3_OFF officer 
		where fac_master_id = officer.cms_act_fac_master_id
		and officer.is_valid = 'Y'
		and not exists (select 1 from stp_trans sTRans
			where sTrans.master_trx_id = t.stp_master_trx_id
			and sTrans.reference_id = officer.cms_act_fac_officer_id
			and sTrans.trx_type = '328' fetch first row only)
-- 		FROM STP_MASTER_TRANS s, TRANSACTION trans, MIG_CA003_3_OFF officer 
-- 		WHERE trans.TRANSACTION_ID = s.TRANSACTION_ID 
-- 		AND trans.TRANSACTION_TYPE = 'FACILITY'
-- 		AND s.TRANSACTION_TYPE = 'FACILITY'
-- 		AND trans.STATUS = 'ACTIVE'
-- 		AND trans.REFERENCE_ID = officer.CMS_ACT_FAC_MASTER_ID
-- 		AND officer.IS_VALID = 'Y'
-- 		AND NOT EXISTS (SELECT 1 FROM STP_TRANS sTrans
-- 			WHERE sTrans.MASTER_TRX_ID = s.MASTER_TRX_ID
-- 			AND sTrans.REFERENCE_ID = officer.CMS_ACT_FAC_OFFICER_ID
-- 			AND sTrans.TRX_TYPE = '328' fetch first row only)
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_FAC', 'GENERIC', 5);
	COMMIT;
	
	CALL RUNSTATS_HELPER('MIG_CA003_4_REL', 'IS_VALID, CMS_ACT_FAC_MASTER_ID');
	
	--LOCK TABLE STP_TRANS IN SHARE MODE;
	INSERT INTO STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, 
				CUR_TRX_HISTORY_ID, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2)) AS BIGINT), 
			   stp_master_trx_id, '322', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS', 
			   CUR_TRX_HISTORY_ID, 1, 'AA', rel.CMS_ACT_FAC_RELATIONSHIP_ID, 'CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2)) AS BIGINT)
		from session.fac_trx_info t, MIG_CA003_4_REL rel 
		where t.fac_master_id = rel.cms_act_fac_master_id
		and rel.is_valid = 'Y'
		and not exists (select 1 from stp_trans sTrans
			where sTrans.master_trx_id = stp_master_trx_id
			and sTRans.reference_id = rel.cms_act_fac_relationship_id
			and sTrans.trx_type = '322' fetch first row only)
-- 		FROM STP_MASTER_TRANS s, TRANSACTION trans, MIG_CA003_4_REL rel 
-- 		WHERE trans.TRANSACTION_ID = s.TRANSACTION_ID 
-- 		AND trans.TRANSACTION_TYPE = 'FACILITY'
-- 		AND s.TRANSACTION_TYPE = 'FACILITY'
-- 		AND trans.STATUS = 'ACTIVE'
-- 		AND trans.REFERENCE_ID = rel.CMS_ACT_FAC_MASTER_ID
-- 		AND rel.IS_VALID = 'Y'
-- 		AND NOT EXISTS (SELECT 1 FROM STP_TRANS sTrans
-- 			WHERE sTrans.MASTER_TRX_ID = s.MASTER_TRX_ID
-- 			AND sTrans.REFERENCE_ID = rel.CMS_ACT_FAC_RELATIONSHIP_ID
-- 			AND sTrans.TRX_TYPE = '322' fetch first row only)
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_FAC', 'GENERIC', 6);
	COMMIT;
	
	CALL RUNSTATS_HELPER('MIG_CA003_5_INS', 'IS_VALID, CMS_ACT_FAC_MASTER_ID');
	CALL RUNSTATS_HELPER('STP_TRANS', 'TRX_TYPE, MASTER_TRX_ID');
	--LOCK TABLE STP_TRANS IN SHARE MODE;
	INSERT INTO STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, 
				CUR_TRX_HISTORY_ID, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2)) AS BIGINT), 
				   stp_master_trx_id, '329', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS', 
				   CUR_TRX_HISTORY_ID, 1, 'AA', ins.CMS_ACT_FAC_MASTER_ID, 'CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2)) AS BIGINT)
			from session.fac_trx_info t, MIG_CA003_5_INS ins
			where ins.is_valid = 'Y'
			and t.fac_master_id = ins.cms_act_fac_master_id
			and not exists (select 1 from stp_trans sTrans
				where sTrans.master_trx_id = t.stp_master_trx_id
				and sTrans.trx_type = '329' fetch first row only)
-- 			FROM STP_MASTER_TRANS s, TRANSACTION trans, MIG_CA003_5_INS ins
-- 			WHERE trans.TRANSACTION_ID = s.TRANSACTION_ID 
-- 			AND trans.TRANSACTION_TYPE = 'FACILITY'
-- 			AND s.TRANSACTION_TYPE = 'FACILITY'
-- 			AND trans.STATUS = 'ACTIVE'
-- 			AND trans.REFERENCE_ID = ins.CMS_ACT_FAC_MASTER_ID
-- 			and ins.is_valid = 'Y'
-- 			AND NOT EXISTS (SELECT 1 FROM STP_TRANS sTrans
-- 					WHERE sTrans.MASTER_TRX_ID = s.MASTER_TRX_ID
-- 					AND sTrans.TRX_TYPE = '329' fetch first row only)
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_FAC', 'GENERIC', 7);
	COMMIT;
	
	
	--LOCK TABLE STP_TRANS IN SHARE MODE;
	INSERT INTO STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, 
				CUR_TRX_HISTORY_ID, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2)) AS BIGINT), 
			   stp_master_trx_id, '376', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS', 
			   CUR_TRX_HISTORY_ID, 1, 'AA', islamic.CMS_ACT_FAC_MASTER_ID, 'CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2)) AS BIGINT)
		from session.fac_trx_info t, MIG_CA003_7_ISL islamic 
		where t.fac_master_id = islamic.cms_act_fac_master_id
		and islamic.is_valid = 'Y'
		and not exists (select 1 from stp_trans sTrans
			where sTrans.master_trx_id = t.stp_master_trx_id
			and sTrans.trx_type = '376' fetch first row only)
-- 		FROM STP_MASTER_TRANS s, TRANSACTION trans, MIG_CA003_7_ISL islamic 
-- 		WHERE trans.TRANSACTION_ID = s.TRANSACTION_ID 
-- 		AND trans.TRANSACTION_TYPE = 'FACILITY'
-- 		AND s.TRANSACTION_TYPE = 'FACILITY'
-- 		AND trans.STATUS = 'ACTIVE'
-- 		AND trans.REFERENCE_ID = islamic.CMS_ACT_FAC_MASTER_ID
-- 		AND islamic.IS_VALID = 'Y'
-- 		AND NOT EXISTS (SELECT 1 FROM STP_TRANS sTrans
-- 			WHERE sTrans.MASTER_TRX_ID = s.MASTER_TRX_ID
-- 			AND sTrans.TRX_TYPE = '376' fetch first row only)
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_FAC', 'GENERIC', 8);
	COMMIT;
	
	CALL RUNSTATS_HELPER('STP_TRANS', 'TRX_TYPE, REFERENCE_ID, MASTER_TRX_ID');
	
	--LOCK TABLE STP_TRANS IN SHARE MODE;
	INSERT INTO STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, 
				CUR_TRX_HISTORY_ID, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2)) AS BIGINT), 
			   stp_master_trx_id, '324', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS', 
			   CUR_TRX_HISTORY_ID, 1, 'AA', mtf.CMS_REF_ID, 'CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2)) AS BIGINT)
		from session.fac_trx_info t, MIG_CA003_6_MUL mtf 
		where t.fac_master_id = mtf.cms_act_fac_master_id
		and mtf.is_valid = 'Y'
		and not exists (select 1 from stp_trans sTrans
			where sTrans.master_trx_id = t.stp_master_trx_id
			and sTrans.reference_id = mtf.cms_ref_id
			and sTrans.trx_type = '324' fetch first row only)
-- 		FROM STP_MASTER_TRANS s, TRANSACTION trans, MIG_CA003_6_MUL mtf 
-- 		WHERE trans.TRANSACTION_ID = s.TRANSACTION_ID 
-- 		AND trans.TRANSACTION_TYPE = 'FACILITY'
-- 		AND s.TRANSACTION_TYPE = 'FACILITY'
-- 		AND trans.STATUS = 'ACTIVE'
-- 		AND trans.REFERENCE_ID = mtf.CMS_ACT_FAC_MASTER_ID
-- 		AND mtf.IS_VALID = 'Y'
-- 		AND NOT EXISTS (SELECT 1 FROM STP_TRANS sTrans
-- 			WHERE sTrans.MASTER_TRX_ID = s.MASTER_TRX_ID
-- 			AND sTrans.REFERENCE_ID = mtf.CMS_REF_ID
-- 			AND sTrans.TRX_TYPE = '324' fetch first row only)
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_FAC', 'GENERIC', 9);
	COMMIT;
	
	--LOCK TABLE STP_TRANS IN SHARE MODE;
	INSERT INTO STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, 
				CUR_TRX_HISTORY_ID, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2)) AS BIGINT), 
			   stp_master_trx_id, '371', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS', 
			   CUR_TRX_HISTORY_ID, 1, 'AA', bvp.CMS_ACT_FAC_MASTER_ID, 'CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2)) AS BIGINT)
		from session.fac_trx_info t, MIG_CA003_8_BBA bvp 
		where t.fac_master_id = bvp.cms_act_fac_master_id
		and bvp.is_valid = 'Y'
		and not exists (select 1 from stp_trans sTrans
			where sTrans.master_trx_id = t.stp_master_trx_id
			and sTrans.trx_type = '371' fetch first row only)
-- 		FROM STP_MASTER_TRANS s, TRANSACTION trans, MIG_CA003_8_BBA bvp 
-- 		WHERE trans.TRANSACTION_ID = s.TRANSACTION_ID 
-- 		AND trans.TRANSACTION_TYPE = 'FACILITY'
-- 		AND s.TRANSACTION_TYPE = 'FACILITY'
-- 		AND trans.STATUS = 'ACTIVE'
-- 		AND trans.REFERENCE_ID = bvp.CMS_ACT_FAC_MASTER_ID
-- 		AND bvp.IS_VALID = 'Y'
-- 		AND NOT EXISTS (SELECT 1 FROM STP_TRANS sTrans
-- 			WHERE sTrans.MASTER_TRX_ID = s.MASTER_TRX_ID
-- 			AND sTrans.TRX_TYPE = '371' fetch first row only)
	);

	commit;
	drop table session.fac_trx_info;
	
 	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_FAC', 'GENERIC', 0);
	COMMIT;
	
END
@    

CREATE PROCEDURE AUTO_CREATE_STP_TRANS_COL
	LANGUAGE SQL
BEGIN

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_COL', 'GENERIC', 1);
	commit;
	
    	CALL RUNSTATS_HELPER('TRANSACTION', 'TRANSACTION_TYPE, REFERENCE_ID');
    	CALL RUNSTATS_HELPER('CMS_SECURITY', 'IS_MIGRATED_IND, CMS_COLLATERAL_ID');

	DECLARE GLOBAL TEMPORARY TABLE SESSION.sec_trx_info(
			cms_collateral_id bigint,
			transaction_id varchar(20),
			cur_trx_history_id varchar(20),
			stp_master_trx_id bigint,
			SOURCE_SECURITY_SUB_TYPE varchar(3),
			security_sub_type_id varchar(5)
		) 
		WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;		
		
	insert into SESSION.sec_trx_info 
		(cms_collateral_id, transaction_id, cur_trx_history_id, SOURCE_SECURITY_SUB_TYPE, security_sub_type_id)
	(select cms_collateral_id, TRANSACTION_ID, CUR_TRX_HISTORY_ID, SOURCE_SECURITY_SUB_TYPE, security_sub_type_id
		from CMS_SECURITY s, TRANSACTION trans 
		where s.is_migrated_ind = 'Y'
		and trans.transaction_type = 'COL'
		and trans.reference_id = s.cms_collateral_id
	);
	
	commit;
	
	CREATE INDEX session.sec_trx_info_idx1
             ON session.sec_trx_info(cms_collateral_id, transaction_id )
             allow REVERSE SCANS
             COLLECT STATISTICS;
	commit;
             	    	
    	
	--LOCK TABLE STP_MASTER_TRANS IN SHARE MODE;
	INSERT INTO STP_MASTER_TRANS (MASTER_TRX_ID, TRANSACTION_ID, STATUS, TRANSACTION_TYPE, REFERENCE_ID, LAST_SUBMISSION_DATE)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_MASTER_TRANS_SEQ), 2)) AS BIGINT), 
			   TRANSACTION_ID, 'COMPLETE', 'COL', cms_collateral_id, CURRENT_TIMESTAMP
		from session.sec_trx_info s
		where not exists (select 1 from stp_master_trans mTrans
			where mTrans.transaction_id = s.transaction_id
			and mTrans.reference_id = s.cms_collateral_id
			and mTrans.transaction_type = 'COL' fetch first row only)
-- 		FROM CMS_SECURITY s, TRANSACTION trans
-- 		WHERE REFERENCE_ID = s.CMS_COLLATERAL_ID 
-- 		AND TRANSACTION_TYPE = 'COL'
-- 		AND s.IS_MIGRATED_IND = 'Y'
-- 		AND NOT EXISTS (SELECT 1 FROM STP_MASTER_TRANS mTrans
-- 			WHERE mTrans.TRANSACTION_ID = trans.TRANSACTION_ID
-- 			AND mTrans.REFERENCE_ID = trans.REFERENCE_ID
-- 			AND mTrans.TRANSACTION_TYPE = 'COL' fetch first row only)
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_COL', 'GENERIC', 2);
	COMMIT;
	
	CALL RUNSTATS_HELPER('STP_MASTER_TRANS', 'TRANSACTION_TYPE, TRANSACTION_ID');
    	
	drop index session.sec_trx_info_idx1;	
	
	update session.sec_trx_info t
	set stp_master_trx_id = (select s.MASTER_TRX_ID
		from stp_master_trans s
		where s.transaction_id = t.transaction_id
		and s.transaction_type = 'COL');
		
	commit;
		
	CREATE INDEX session.sec_trx_info_idx2
             ON session.sec_trx_info(cms_collateral_id, stp_master_trx_id, SOURCE_SECURITY_SUB_TYPE )
             allow REVERSE SCANS
			 collect statistics;		

	commit;
	
	CREATE INDEX session.sec_trx_info_idx3
             ON session.sec_trx_info(cms_collateral_id, stp_master_trx_id, security_sub_type_id )
             allow REVERSE SCANS
			 collect statistics;		
	commit;  	
	
	CALL RUNSTATS_HELPER('STP_TRANS', 'TRX_TYPE, MASTER_TRX_ID');	
	commit;

	--LOCK TABLE STP_TRANS IN SHARE MODE;
	INSERT INTO STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, 
				CUR_TRX_HISTORY_ID, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2)) AS BIGINT), 
			   stp_MASTER_TRX_ID, '122', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS', 
			   CUR_TRX_HISTORY_ID, 1, 'AA', cms_collateral_id, 'CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2)) AS BIGINT)
		from session.sec_trx_info s
		where not exists (select 1 from stp_trans sTrans
			where sTrans.master_trx_id = s.stp_master_trx_id
			and sTrans.trx_type = '122' fetch first row only)
-- 		FROM STP_MASTER_TRANS s, TRANSACTION trans, CMS_SECURITY sec
-- 		WHERE trans.TRANSACTION_ID = s.TRANSACTION_ID 
-- 		AND trans.TRANSACTION_TYPE = 'COL'
-- 		AND s.TRANSACTION_TYPE = 'COL'
-- 		AND trans.REFERENCE_ID = sec.CMS_COLLATERAL_ID
-- 		AND sec.IS_MIGRATED_IND = 'Y'
-- 		AND NOT EXISTS (SELECT 1 FROM STP_TRANS sTrans
-- 			WHERE sTrans.MASTER_TRX_ID = s.MASTER_TRX_ID
-- 			AND sTrans.TRX_TYPE = '122' fetch first row only)
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_COL', 'GENERIC', 3);
	COMMIT;
	
    	CALL RUNSTATS_HELPER('STP_TRANS', 'TRX_TYPE, REFERENCE_ID, master_trx_id');
    	CALL RUNSTATS_HELPER('CMS_INSURANCE_POLICY', 'CMS_COLLATERAL_ID, INSURANCE_POLICY_ID');

	--LOCK TABLE STP_TRANS IN SHARE MODE;
	INSERT INTO STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, 
				CUR_TRX_HISTORY_ID, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2)) AS BIGINT), 
			   STP_MASTER_TRX_ID, '124', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS', 
			   CUR_TRX_HISTORY_ID, 1, 'AA', ins.INSURANCE_POLICY_ID, 'CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2)) AS BIGINT)
		From session.sec_trx_info s, cms_insurance_policy ins
		where s.cms_collateral_id = ins.cms_collateral_id
		and not exists (select 1 from stp_trans sTrans
			where sTrans.master_trx_id = s.stp_master_trx_id
			and sTrans.reference_id = ins.insurance_policy_id
			and sTrans.trx_type = '124' fetch first row only)	   
		
-- 		FROM STP_MASTER_TRANS s, TRANSACTION trans, CMS_SECURITY sec, CMS_INSURANCE_POLICY ins
-- 		WHERE trans.TRANSACTION_ID = s.TRANSACTION_ID 
-- 		AND trans.TRANSACTION_TYPE = 'COL'
-- 		AND s.TRANSACTION_TYPE = 'COL'
-- 		AND trans.REFERENCE_ID = sec.CMS_COLLATERAL_ID
-- 		AND sec.IS_MIGRATED_IND = 'Y'
-- 		AND sec.CMS_COLLATERAL_ID = ins.CMS_COLLATERAL_ID
-- 		AND NOT EXISTS (SELECT 1 FROM STP_TRANS sTrans
-- 			WHERE sTrans.MASTER_TRX_ID = s.MASTER_TRX_ID
-- 			AND sTrans.REFERENCE_ID = ins.INSURANCE_POLICY_ID
-- 			AND sTrans.TRX_TYPE = '124' fetch first row only)
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_COL', 'GENERIC', 4);
	COMMIT;
	
    CALL RUNSTATS_HELPER('CMS_ASSET_VEHICLE', 'CMS_COLLATERAL_ID, DOWNPAYMENT_TRADEIN');

	--AB - Vehicle
	--LOCK TABLE STP_TRANS IN SHARE MODE;
	INSERT INTO STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, 
				CUR_TRX_HISTORY_ID, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2)) AS BIGINT), 
			   stp_MASTER_TRX_ID, '125', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS', 
			   CUR_TRX_HISTORY_ID, 1, 'AA', s.CMS_COLLATERAL_ID, 'CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2)) AS BIGINT)
		from session.sec_trx_info s, CMS_ASSET_VEHICLE veh
		where s.cms_collateral_id = veh.cms_collateral_id
		and s.source_security_sub_type in ('F70', 'F71', 'F72', 'F74', 'F75', 'F76')
		and veh.downpayment_tradein > 0
		and not exists (select 1 from stp_trans strans
			where strans.master_trx_id = stp_master_trx_id
			and strans.trx_type = '125' fetch first row only)
-- 		FROM STP_MASTER_TRANS s, TRANSACTION trans, CMS_SECURITY sec, CMS_ASSET_VEHICLE veh
-- 		WHERE trans.TRANSACTION_ID = s.TRANSACTION_ID 
-- 		AND trans.TRANSACTION_TYPE = 'COL'
-- 		AND s.TRANSACTION_TYPE = 'COL'
-- 		AND trans.REFERENCE_ID = sec.CMS_COLLATERAL_ID
-- 		AND sec.IS_MIGRATED_IND = 'Y'
-- 		AND sec.CMS_COLLATERAL_ID = veh.CMS_COLLATERAL_ID
-- 		AND sec.SOURCE_SECURITY_SUB_TYPE IN ('F70', 'F71', 'F72', 'F74', 'F75', 'F76')
-- 		AND veh.DOWNPAYMENT_TRADEIN > 0
-- 		AND NOT EXISTS (SELECT 1 FROM STP_TRANS sTrans
-- 			WHERE sTrans.MASTER_TRX_ID = s.MASTER_TRX_ID
-- 			AND sTrans.TRX_TYPE = '125' fetch first row only)
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_COL', 'GENERIC', 5);
	COMMIT;
	
    CALL RUNSTATS_HELPER('CMS_ASSET_PLANT_EQUIP', 'CMS_COLLATERAL_ID, DOWNPAYMENT_TRADEIN');

	--AB - Plant and Equip
	--LOCK TABLE STP_TRANS IN SHARE MODE;
	INSERT INTO STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, 
				CUR_TRX_HISTORY_ID, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2)) AS BIGINT), 
			   STP_MASTER_TRX_ID, '125', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS', 
			   CUR_TRX_HISTORY_ID, 1, 'AA', s.CMS_COLLATERAL_ID, 'CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2)) AS BIGINT)
		from session.sec_trx_info s, CMS_ASSET_PLANT_EQUIP pe
		where s.cms_collateral_id = pe.cms_collateral_id
		and s.SOURCE_SECURITY_SUB_TYPE IN ('F70', 'F71', 'F72', 'F73')
		AND pe.DOWNPAYMENT_TRADEIN > 0
		AND NOT EXISTS (SELECT 1 FROM STP_TRANS sTrans
			WHERE sTrans.MASTER_TRX_ID = stp_master_trx_id
			AND sTrans.TRX_TYPE = '125' fetch first row only)		
-- 		FROM STP_MASTER_TRANS s, TRANSACTION trans, CMS_SECURITY sec, CMS_ASSET_PLANT_EQUIP pe
-- 		WHERE trans.TRANSACTION_ID = s.TRANSACTION_ID 
-- 		AND trans.TRANSACTION_TYPE = 'COL'
-- 		AND s.TRANSACTION_TYPE = 'COL'
-- 		AND trans.REFERENCE_ID = sec.CMS_COLLATERAL_ID
-- 		AND sec.IS_MIGRATED_IND = 'Y'
-- 		AND sec.CMS_COLLATERAL_ID = pe.CMS_COLLATERAL_ID
-- 		AND sec.SOURCE_SECURITY_SUB_TYPE IN ('F70', 'F71', 'F72', 'F73')
-- 		AND pe.DOWNPAYMENT_TRADEIN > 0
-- 		AND NOT EXISTS (SELECT 1 FROM STP_TRANS sTrans
-- 			WHERE sTrans.MASTER_TRX_ID = s.MASTER_TRX_ID
-- 			AND sTrans.TRX_TYPE = '125' fetch first row only)
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_COL', 'GENERIC', 6);
	COMMIT;
	
    CALL RUNSTATS_HELPER('SCI_SEC_PLDGR_MAP', 'CMS_COLLATERAL_ID, CMS_PLEDGOR_DTL_ID');
    CALL RUNSTATS_HELPER('SCI_PLEDGOR_DTL', 'CMS_PLEDGOR_DTL_ID');

	--LOCK TABLE STP_TRANS IN SHARE MODE;
	INSERT INTO STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, 
				CUR_TRX_HISTORY_ID, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2)) AS BIGINT), 
			   STP_MASTER_TRX_ID, '126', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS', 
			   CUR_TRX_HISTORY_ID, 1, 'AA', CMS_COLLATERAL_ID, 'CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2)) AS BIGINT)
		from session.sec_trx_info s
		where exists (select 1 FROM SCI_SEC_PLDGR_MAP spm, SCI_PLEDGOR_DTL ple
			where s.cms_collateral_id = spm.cms_collateral_id
			and spm.cms_pledgor_dtl_id = ple.cms_pledgor_dtl_id)
		and not exists (select 1 from stp_trans strans
			where strans.master_trx_id = stp_master_trx_id
			and strans.trx_type = '126' fetch first row only)
-- 		FROM STP_MASTER_TRANS s, TRANSACTION trans, CMS_SECURITY sec
-- 		WHERE trans.TRANSACTION_ID = s.TRANSACTION_ID 
-- 		AND trans.TRANSACTION_TYPE = 'COL'
-- 		AND s.TRANSACTION_TYPE = 'COL'
-- 		AND trans.REFERENCE_ID = sec.CMS_COLLATERAL_ID
-- 		AND sec.IS_MIGRATED_IND = 'Y'
-- 		AND EXISTS (SELECT 1 FROM SCI_SEC_PLDGR_MAP spm, SCI_PLEDGOR_DTL ple
-- 			    WHERE sec.CMS_COLLATERAL_ID = spm.CMS_COLLATERAL_ID
-- 			    AND spm.CMS_PLEDGOR_DTL_ID = ple.CMS_PLEDGOR_DTL_ID
-- 			    GROUP BY spm.CMS_COLLATERAL_ID
-- 			    HAVING COUNT(spm.CMS_COLLATERAL_ID) > 0 fetch first row only)
-- 		AND NOT EXISTS (SELECT 1 FROM STP_TRANS sTrans
-- 			WHERE sTrans.MASTER_TRX_ID = s.MASTER_TRX_ID
-- 			AND sTrans.TRX_TYPE = '126' fetch first row only)
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_COL', 'GENERIC', 7);
	COMMIT;
	
    	CALL RUNSTATS_HELPER('CMS_LIMIT_SECURITY_MAP', 'CMS_COLLATERAL_ID, CHARGE_ID');
    	--CALL RUNSTATS_HELPER('SCI_LSP_APPR_LMTS');

	--LOCK TABLE STP_TRANS IN SHARE MODE;
	INSERT INTO STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, 
				CUR_TRX_HISTORY_ID, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2)) AS BIGINT), 
			   STP_MASTER_TRX_ID, '721', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS',
			   CUR_TRX_HISTORY_ID, 1, 'AA', lsm.CHARGE_ID, 'CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2)) AS BIGINT)
		from session.sec_trx_info s, cms_limit_security_map lsm
		where s.cms_collateral_id = lsm.cms_collateral_id
		and not exists (select 1 from stp_trans strans
			where strans.master_trx_id = stp_master_trx_id
			and strans.reference_id = lsm.charge_id
			and strans.trx_type = '721' fetch first row only)
-- 		FROM STP_MASTER_TRANS s, TRANSACTION trans, CMS_SECURITY sec, CMS_LIMIT_SECURITY_MAP lsp, SCI_LSP_APPR_LMTS lmts
-- 		WHERE trans.TRANSACTION_ID = s.TRANSACTION_ID 
-- 		AND trans.TRANSACTION_TYPE = 'COL'
-- 		AND s.TRANSACTION_TYPE = 'COL'
-- 		AND trans.REFERENCE_ID = sec.CMS_COLLATERAL_ID
-- 		AND sec.IS_MIGRATED_IND = 'Y'
-- 		AND sec.CMS_COLLATERAL_ID = lsp.CMS_COLLATERAL_ID
-- 		AND lsp.CMS_LSP_APPR_LMTS_ID = lmts.CMS_LSP_APPR_LMTS_ID
-- 		AND NOT EXISTS (SELECT 1 FROM STP_TRANS sTrans
-- 			WHERE sTrans.MASTER_TRX_ID = s.MASTER_TRX_ID
-- 			AND sTrans.REFERENCE_ID = lsp.CHARGE_ID
-- 			AND sTrans.TRX_TYPE = '721' fetch first row only)
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_COL', 'GENERIC', 8);
	COMMIT;
	
    CALL RUNSTATS_HELPER('CMS_LIMIT_CHARGE_MAP', 'CMS_COLLATERAL_ID, LIMIT_CHARGE_MAP_ID');

	--LOCK TABLE STP_TRANS IN SHARE MODE;
	INSERT INTO STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, 
				CUR_TRX_HISTORY_ID, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2)) AS BIGINT), 
			   stp_MASTER_TRX_ID, '722', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS', 
			   CUR_TRX_HISTORY_ID, 1, 'AA', lcm.LIMIT_CHARGE_MAP_ID, 'CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2)) AS BIGINT)
		from session.sec_trx_info s, CMS_LIMIT_CHARGE_MAP lcm
		where s.cms_collateral_id = lcm.cms_collateral_id
		and (s.security_sub_type_id like 'PT%' or
			s.security_sub_type_id in ('AB100', 'AB101', 'AB102', 'AB103', 'AB109', 'AB111', 'OT900'))
		and not exists (select 1 from stp_trans strans
			where strans.master_trx_id = stp_master_trx_id
			and strans.reference_id = lcm.limit_charge_map_id
			and strans.trx_type = '722' fetch first row only)
-- 		FROM STP_MASTER_TRANS s, TRANSACTION trans, CMS_SECURITY sec, CMS_LIMIT_CHARGE_MAP lcm, SCI_LSP_APPR_LMTS lmts
-- 		WHERE trans.TRANSACTION_ID = s.TRANSACTION_ID 
-- 		AND trans.TRANSACTION_TYPE = 'COL'
-- 		AND s.TRANSACTION_TYPE = 'COL'
-- 		AND trans.REFERENCE_ID = sec.CMS_COLLATERAL_ID
-- 		AND sec.IS_MIGRATED_IND = 'Y'
-- 		AND sec.CMS_COLLATERAL_ID = lcm.CMS_COLLATERAL_ID
-- 		and (sec.security_sub_type_id like 'PT%' or
-- 			sec.security_sub_type_id in ('AB100', 'AB101', 'AB102', 'AB103', 'AB109', 'AB111', 'OT900'))
-- 		AND lcm.CMS_LSP_APPR_LMTS_ID = lmts.CMS_LSP_APPR_LMTS_ID
-- 		AND NOT EXISTS (SELECT 1 FROM STP_TRANS sTrans
-- 			WHERE sTrans.MASTER_TRX_ID = s.MASTER_TRX_ID
-- 			AND sTrans.REFERENCE_ID = lcm.LIMIT_CHARGE_MAP_ID
-- 			AND sTrans.TRX_TYPE = '722' fetch first row only)
	);

	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_COL', 'GENERIC', 9);
	COMMIT;
	
	insert into cms_aa_pending_perfection 
	(SELECT cms_lsp_lmt_profile_id, llp_bca_ref_num, los_bca_ref_num FROM (
	    SELECT lp.cms_lsp_lmt_profile_id, lp.llp_bca_ref_num, lp.los_bca_ref_num
	    FROM cms_tat_document tat, sci_lsp_lmt_profile lp
	    WHERE doc_completion_date IS NULL
	    AND tat.cms_lsp_lmt_profile_id = lp.cms_lsp_lmt_profile_id
	    UNION 
	    SELECT cms_lsp_lmt_profile_id, lp.llp_bca_ref_num, lp.los_bca_ref_num
	    FROM sci_lsp_lmt_profile lp WHERE NOT EXISTS (SELECT 1
	    FROM cms_tat_document WHERE cms_lsp_lmt_profile_id = lp.cms_lsp_lmt_profile_id)) as cr 
	    WHERE NOT EXISTS (select 1 from CMS_AA_PENDING_PERFECTION aap 
	    where aap.CMS_LSP_LMT_PROFILE_ID = cr.cms_lsp_lmt_profile_id)); 
    
 	CALL "LOG_PROC_TIME"('AUTO_CREATE_STP_TRANS_COL', 'GENERIC', 0);
	COMMIT;
	
END
@    

CREATE PROCEDURE AUTO_VALIDATE_ACTUAL_TABLE
	LANGUAGE SQL
BEGIN

	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 1);
	COMMIT;
	
	---------------------------------
	-- Customer Info
	---------------------------------
		
	UPDATE MIG_CU001_CU a SET IS_VALID = 'N'
	WHERE EXISTS (SELECT 1
	  	FROM SCI_LE_MAIN_PROFILE lmp
	  	WHERE a.CIF_ID = lmp.LMP_LE_ID
	  	AND lmp.SOURCE_ID = 'SIBS')
  	and a.is_valid = 'Y';
	  	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(select current_timestamp, 'SIBS', 'CU001', cif_id, 'ACT001', 
		'[M] Customer Info for CIF Id [' || cif_id || '] already exists in the database.'
	FROM MIG_CU001_CU mig
	WHERE mig.IS_VALID = 'N'
	AND EXISTS (SELECT 1
	  	FROM SCI_LE_MAIN_PROFILE lmp
	  	WHERE mig.CIF_ID = lmp.LMP_LE_ID
	  	AND lmp.SOURCE_ID = 'SIBS'));

	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 2);
	COMMIT;
	
	-----------------------------------------
	-- Facility Info
	-----------------------------------------

	UPDATE MIG_CA003_1 a SET IS_VALID = 'N'
	WHERE EXISTS (SELECT 1 FROM SCI_LSP_APPR_LMTS lmt
			WHERE lmt.LMT_ID = a.LIMIT_ID)
  	and a.is_valid = 'Y';
		
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(select current_timestamp, 'SIBS', 'CA003_1', CIF_ID, LIMIT_ID, AA_NUMBER, FACILITY_CODE, trim(char(FACILITY_SEQ)), 'ACT001', 
		'[M] Facility Info for Limit Id [' || limit_id || '] already exists in the database.'
	from MIG_CA003_1 a
	where a.IS_VALID = 'N'
	AND EXISTS (SELECT 1 FROM SCI_LSP_APPR_LMTS lmt
			WHERE lmt.LMT_ID = a.LIMIT_ID));

	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 3);
	commit;

	-----------------------------------------
	-- Facility BNM
	-----------------------------------------
	UPDATE MIG_CA003_2_BNM a SET is_valid = 'N'
	WHERE EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LIMIT_ID = a.LMT_ID
			AND fac.IS_VALID = 'N')
  	and a.is_valid = 'Y';
							
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_2', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'ACT001', 
		'[M] Facility BNM Info for Limit Id [' || LMT_ID || '] already exists in the database.'
	FROM MIG_CA003_2_BNM a
	WHERE is_valid = 'N'
	AND EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LIMIT_ID = a.LMT_ID
			AND fac.IS_VALID = 'N'));
	  
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 4);
	commit;

	-----------------------------------------
	-- Facility Officer
	-----------------------------------------
	UPDATE MIG_CA003_3_OFF a SET is_valid = 'N'
	WHERE EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LIMIT_ID = a.LMT_ID
			AND fac.IS_VALID = 'N')
  	and a.is_valid = 'Y';
	
	COMMIT;
							
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_3', LMT_ID, trim(char(SEQ_NUM)), 'ACT001', 
		'[M] Facility Officer Info for Limit Id [' || LMT_ID 
		|| '] Officer Seq No [' || trim(char(SEQ_NUM)) || '] already exists in the database.'
	FROM MIG_CA003_3_OFF a
	WHERE a.is_valid = 'N'
	AND EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LIMIT_ID = a.LMT_ID
			AND fac.IS_VALID = 'N'));
	  
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 5);
	commit;

	-----------------------------------------
	-- Facility Relationship
	-----------------------------------------
	UPDATE MIG_CA003_4_REL a SET is_valid = 'N'
	WHERE EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LIMIT_ID = a.LMT_ID
			AND fac.IS_VALID = 'N')
  	and a.is_valid = 'Y';
							
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_4', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), trim(char(CIF_NUMBER)), 'ACT001', 
		'[M] Facility Relationship Info for Limit Id [' || LMT_ID 
		|| '] Cif No [' || trim(char(CIF_NUMBER)) || '] already exists in the database.'
	FROM MIG_CA003_4_REL a
	WHERE a.is_valid = 'N'
	AND EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LIMIT_ID = a.LMT_ID
			AND fac.IS_VALID = 'N'));
	  
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 6);
	commit;

	-----------------------------------------
	-- Facility Insurance
	-----------------------------------------
	UPDATE MIG_CA003_5_INS a SET is_valid = 'N'
	WHERE EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LIMIT_ID = a.LMT_ID
			AND fac.IS_VALID = 'N')
  	and a.is_valid = 'Y';
							
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_5', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'ACT001', 
		'[M] Facility Insurance Info for Limit Id [' || LMT_ID || '] already exists in the database.'
	FROM MIG_CA003_5_INS a
	WHERE a.is_valid = 'N'
	AND EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LIMIT_ID = a.LMT_ID
			AND fac.IS_VALID = 'N'));
	  
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 7);
	commit;

	-----------------------------------------
	-- Facility Multi Tier Financing
	-----------------------------------------
	UPDATE MIG_CA003_6_MUL a SET is_valid = 'N'
	WHERE EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LIMIT_ID = a.LMT_ID
			AND fac.IS_VALID = 'N')
  	and a.is_valid = 'Y';
							
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_6', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), trim(CHAR(TIER_SEQ_NO)), 'ACT001', 
		'[M] Facility Multi Tier Financing Info for Limit Id [' || LMT_ID 
		|| '] Tier Seq No [' || CHAR(TIER_SEQ_NO) || '] already exists in the database.'
	FROM MIG_CA003_6_MUL a
	WHERE a.is_valid = 'N'
	AND EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LIMIT_ID = a.LMT_ID
			AND fac.IS_VALID = 'N'));
	  
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 8);
	commit;

	-----------------------------------------
	-- Facility Islamic Master
	-----------------------------------------
	UPDATE MIG_CA003_7_ISL a SET is_valid = 'N'
	WHERE EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LIMIT_ID = a.LMT_ID
			AND fac.IS_VALID = 'N')
  	and a.is_valid = 'Y';
							
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_7', LMT_ID, 'ACT001', 
		'[M] Facility Islamic Master Info for Limit Id [' || LMT_ID || '] already exists in the database.'
	FROM MIG_CA003_7_ISL a
	WHERE a.is_valid = 'N'
	AND EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LIMIT_ID = a.LMT_ID
			AND fac.IS_VALID = 'N'));
	  
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 9);
	commit;

	-----------------------------------------
	-- Facility BBA Vari Package
	-----------------------------------------
	UPDATE MIG_CA003_8_BBA a SET is_valid = 'N'
	WHERE EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LIMIT_ID = a.LMT_ID
			AND fac.IS_VALID = 'N')
  	and a.is_valid = 'Y';
							
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA003_8', LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, trim(char(LMT_FAC_SEQ)), 'ACT001', 
		'[M] Facility BBA Vari Package Info for Limit Id [' || LMT_ID || '] already exists in the database.'
	FROM MIG_CA003_8_BBA a
	WHERE a.is_valid = 'N'
	AND EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LIMIT_ID = a.LMT_ID
			AND fac.IS_VALID = 'N'));
	  
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 10);
	commit;

	-----------------------------------------
	-- AA Info
	-----------------------------------------
	UPDATE MIG_CA001_AA a SET is_valid = 'N'
	WHERE EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LOS_AA_NUMBER = a.LOS_BCA_REF_NUM
			AND fac.IS_VALID = 'N')
  	and a.is_valid = 'Y';
							
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA001', CIF_ID, AA_NUMBER, LOS_BCA_REF_NUM, 'ACT001', 
		'[M] AA Info for LOS AA Number [' || LOS_BCA_REF_NUM || '] AA Number [' || AA_NUMBER || '] already exists in the database.'
	FROM MIG_CA001_AA a
	WHERE a.is_valid = 'N'
	AND EXISTS (SELECT 1 FROM MIG_CA003_1 fac
		    WHERE fac.LOS_AA_NUMBER = a.LOS_BCA_REF_NUM
		    AND fac.IS_VALID = 'N'));
	  
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 11);
	commit;

	-----------------------------------------
	-- Joint Borrower Info
	-----------------------------------------

	UPDATE MIG_CA002_JB a SET IS_VALID = 'N'
	WHERE EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LOS_AA_NUMBER = a.AA_NUMBER
			AND fac.IS_VALID = 'N')
  	and a.is_valid = 'Y';
	  	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(select current_timestamp, 'SIBS', 'CA002',  CIF_ID, AA_NUMBER, 'ACT001', 
		'[M] Joint Borrower Info for CIF ID [' || CIF_ID 
		|| '] AA Number [' || AA_NUMBER || '] already exists in the database.'
	from MIG_CA002_JB a
	where a.IS_VALID = 'N'
	AND EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LOS_AA_NUMBER = a.AA_NUMBER
			AND fac.IS_VALID = 'N'));
			
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 12);
	commit;

	-----------------------------------------
	-- CA - Limit Account Info
	-----------------------------------------
	UPDATE MIG_CA004 a SET is_valid = 'N'
	WHERE EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LIMIT_ID = a.LIMIT_ID
			AND fac.IS_VALID = 'N')
  	and a.is_valid = 'Y';
							
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CA004', LIMIT_ID, AA_NUMBER, EXTERNAL_SYSTEM_ACCT_NO, trim(char(ACCT_SEQ)), 'ACT001', 
		'[M] Limit Account Info for Limit Id [' || LIMIT_ID || '] already exists in the database.'
	FROM MIG_CA004 a
	WHERE a.is_valid = 'N'
	AND EXISTS (SELECT 1 FROM MIG_CA003_1 fac
			WHERE fac.LIMIT_ID = a.LIMIT_ID
			AND fac.IS_VALID = 'N'));
	  
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 13);
	commit;

	-----------------------------------------
	-- Collateral - Asset Based
	-----------------------------------------
	UPDATE MIG_CO001_AB a set is_valid = 'N'
  	where exists (select 1
  			from CMS_SECURITY t
  			where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO001', SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in database for Collateral Name [' 
	  	|| t.SCI_REFERENCE_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO001_AB a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_ID = t.SCI_SECURITY_DTL_ID);
	  
	UPDATE MIG_CO001_AB a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO001', SECURITY_ID, SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in database for Security ID [' 
	  	|| t.SCI_SECURITY_DTL_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO001_AB a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_REF_NOTE = t.SCI_REFERENCE_NOTE);

	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 14);
	commit;

	-----------------------------------------
	-- Collateral - Asset Based - GOLD
	-----------------------------------------

	UPDATE MIG_CO002_AB_GOLD a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO002', SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in database for Collateral Name [' 
	  	|| t.SCI_REFERENCE_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO002_AB_GOLD a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_ID = t.SCI_SECURITY_DTL_ID);
	
	UPDATE MIG_CO002_AB_GOLD a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO002', SECURITY_ID, SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in database for Security ID [' 
	  	|| t.SCI_SECURITY_DTL_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO002_AB_GOLD a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_REF_NOTE = t.SCI_REFERENCE_NOTE);
	
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 15);
	commit;

	-----------------------------------------
	-- Collateral - Cash
	-----------------------------------------

	UPDATE MIG_CO005_CS a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO005', SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in database for Collateral Name [' 
	  	|| t.SCI_REFERENCE_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO005_CS a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_ID = t.SCI_SECURITY_DTL_ID);

	UPDATE MIG_CO005_CS a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO005', SECURITY_ID, SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in database for Security ID [' 
	  	|| t.SCI_SECURITY_DTL_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO005_CS a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_REF_NOTE = t.SCI_REFERENCE_NOTE);
	
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 16);
	commit;

	-----------------------------------------
	-- Collateral - Marketable Security
	-----------------------------------------

	UPDATE MIG_CO008_MS a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO008', SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in database for Collateral Name [' 
	  	|| t.SCI_REFERENCE_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO008_MS a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_ID = t.SCI_SECURITY_DTL_ID);

	UPDATE MIG_CO008_MS a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO008', SECURITY_ID, SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in database for Security ID [' 
	  	|| t.SCI_SECURITY_DTL_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO008_MS a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_REF_NOTE = t.SCI_REFERENCE_NOTE);

	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 17);
	commit;

	-----------------------------------------
	-- Collateral - Property
	-----------------------------------------

	UPDATE MIG_CO009_PT a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO009', SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in database for Collateral Name [' 
	  	|| t.SCI_REFERENCE_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO009_PT a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_ID = t.SCI_SECURITY_DTL_ID);
	
	UPDATE MIG_CO009_PT a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO009', SECURITY_ID, SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in database for Security ID [' 
	  	|| t.SCI_SECURITY_DTL_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO009_PT a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_REF_NOTE = t.SCI_REFERENCE_NOTE);
	
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 18);
	commit;

	-----------------------------------------
	-- Collateral - Guarantee
	-----------------------------------------

	UPDATE MIG_CO010_GT a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO010', SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in database for Collateral Name [' 
	  	|| t.SCI_REFERENCE_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO010_GT a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_ID = t.SCI_SECURITY_DTL_ID);

	UPDATE MIG_CO010_GT a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO010', SECURITY_ID, SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in database for Security ID [' 
	  	|| t.SCI_SECURITY_DTL_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO010_GT a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_REF_NOTE = t.SCI_REFERENCE_NOTE);

	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 19);
	commit;

	-----------------------------------------
	-- Collateral - Others
	-----------------------------------------

	UPDATE MIG_CO011_OT a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO011', SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in database for Collateral Name [' 
	  	|| t.SCI_REFERENCE_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO011_OT a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_ID = t.SCI_SECURITY_DTL_ID);
	
	UPDATE MIG_CO011_OT a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO011', SECURITY_ID, SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in database for Security ID [' 
	  	|| t.SCI_SECURITY_DTL_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO011_OT a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_REF_NOTE = t.SCI_REFERENCE_NOTE);
	
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 20);
	commit;

	-----------------------------------------
	-- Collateral - Insurance
	-----------------------------------------

	UPDATE MIG_CO012_IN a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO012', SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in database for Collateral Name [' 
	  	|| t.SCI_REFERENCE_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO012_IN a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_ID = t.SCI_SECURITY_DTL_ID);
	
	UPDATE MIG_CO012_IN a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO012', SECURITY_ID, SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in database for Security ID [' 
	  	|| t.SCI_SECURITY_DTL_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO012_IN a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_REF_NOTE = t.SCI_REFERENCE_NOTE);
	
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 21);
	commit;

	-----------------------------------------
	-- Collateral - Clean
	-----------------------------------------

	UPDATE MIG_CO014_CL a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_SECURITY_DTL_ID = a.SECURITY_ID)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO014', SECURITY_ID, 'ACT001', 
		'[M] Security info for Security ID [' 
	  	|| a.SECURITY_ID || '] is already exists in database for Collateral Name [' 
	  	|| t.SCI_REFERENCE_NOTE || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO014_CL a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_ID = t.SCI_SECURITY_DTL_ID);
	
	UPDATE MIG_CO014_CL a set is_valid = 'N'
  	where exists (select 1
  	from CMS_SECURITY t
  	where t.SCI_REFERENCE_NOTE = a.SECURITY_REF_NOTE)
  	and a.is_valid = 'Y';
  	
  	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
  	(select current_timestamp, 'SIBS', 'CO014', SECURITY_ID, SECURITY_REF_NOTE, 'ACT002', 
		'[M] Security info for Collateral Name [' 
	  	|| a.SECURITY_REF_NOTE || '] is already exists in database for Security ID [' 
	  	|| t.SCI_SECURITY_DTL_ID || '] , Source Security Sub Type ['
	  	|| t.SOURCE_SECURITY_SUB_TYPE || '] and CMS Security Sub Type ['
	  	|| t.SECURITY_SUB_TYPE_ID || '].'
  	from MIG_CO014_CL a, CMS_SECURITY t
  	where a.is_valid = 'N'
  	and a.SECURITY_REF_NOTE = t.SCI_REFERENCE_NOTE);
	
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 22);
	commit;

	-----------------------------------------
	-- Valuation
	-----------------------------------------

	UPDATE MIG_CO015_VL vl
	SET vl.IS_VALID = 'N'
	WHERE EXISTS
		(select 1 from CMS_SECURITY s
		where s.sci_security_dtl_id = vl.security_id)
	AND vl.IS_VALID = 'Y';
	
	INSERT INTO MIG_ERROR_LOG (time_stamp, system_id, interface_id, key1_value, error_code, error_msg)
		(select current_timestamp, 'SIBS', 'CO015', SECURITY_ID, 'ACT001',
		'[M] Security info for Security ID [' || security_id || '] is already exists in database.'
	FROM MIG_CO015_VL vl
	WHERE vl.IS_VALID = 'N'
	AND EXISTS
		(select 1 from CMS_SECURITY s
		where s.sci_security_dtl_id = vl.security_id));	
		
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 23);
	commit;

	-----------------------------------------
	-- Insurance Policy
	-----------------------------------------

	UPDATE MIG_CO016_IN ins
	SET ins.IS_VALID = 'N'
	WHERE EXISTS
		(SELECT 1 FROM CMS_SECURITY s
		WHERE s.sci_security_dtl_id = ins.security_id)
	AND ins.IS_VALID = 'Y';
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
	(SELECT CURRENT_TIMESTAMP, 'SIBS', 'CO016', SECURITY_ID, POLICY_NUMBER, 'ACT001',
		'[M] Security info for Security ID [' || security_id || '] is already exists in database.'
	FROM MIG_CO016_IN ins
	WHERE ins.IS_VALID = 'N'
	AND EXISTS
		(SELECT 1 FROM CMS_SECURITY s
		WHERE s.sci_security_dtl_id = ins.security_id));	

	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 24);
	commit;

	-----------------------------------------
	-- Pledgor
	-----------------------------------------

	UPDATE MIG_CO018_PG plg
	SET plg.IS_VALID = 'N'
	WHERE EXISTS
		(select 1 from CMS_SECURITY s
		where s.sci_security_dtl_id = plg.SECURITY_ID)
	AND plg.IS_VALID = 'Y';
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, error_code, error_msg)
		(select current_timestamp, 'SIBS', 'CO018', SECURITY_ID, PLEDGOR_CIF_ID, 'ACT001',
		'[M] Security info for Security ID [' || SECURITY_ID || '] is already exists in database.'
	FROM MIG_CO018_PG plg
	WHERE plg.IS_VALID = 'N'
	AND EXISTS
		(select 1 from CMS_SECURITY s
		where s.sci_security_dtl_id = plg.SECURITY_ID));			
		
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 25);
	commit;

	-----------------------------------------
	-- Charge Detail
	-----------------------------------------

	UPDATE MIG_CO017_CD chrg
	SET chrg.IS_VALID = 'N'
	WHERE EXISTS
		(select 1 from CMS_SECURITY s
		where s.sci_security_dtl_id = chrg.SECURITY_ID)
	AND chrg.IS_VALID = 'Y';
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
		(select current_timestamp, 'SIBS', 'CO017', SECURITY_ID, APPLICATION_NO, FACILITY_CODE, TRIM(CHAR(FACILITY_SEQ)), TRIM(CHAR(RANKING_OF_SECURITY)), 'ACT002',
		'[M] Charge Detail info for Security ID [' || security_id || ']  is already exists in database.'
	FROM MIG_CO017_CD chrg
	WHERE chrg.IS_VALID = 'N'
	AND EXISTS
		(select 1 from CMS_SECURITY s
		where s.sci_security_dtl_id = chrg.SECURITY_ID)
	);
	
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 26);
	commit;

	UPDATE MIG_CO017_CD chrg
	SET chrg.IS_VALID = 'N'
	WHERE EXISTS 
		(select 1 from SCI_LSP_APPR_LMTS lmts
		where lmts.LMT_ID = chrg.LIMIT_ID
		and lmts.source_id = 'RLOS')
	AND chrg.IS_VALID = 'Y';
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
		(select current_timestamp, 'SIBS', 'CO017', SECURITY_ID, APPLICATION_NO, FACILITY_CODE, TRIM(CHAR(FACILITY_SEQ)), TRIM(CHAR(RANKING_OF_SECURITY)), 'ACT003',
		'[M] Charge Detail info for Limit ID [' || LIMIT_ID || ']  is already exists in database.'
	FROM MIG_CO017_CD chrg
	WHERE chrg.IS_VALID = 'N'
	AND EXISTS 
		(select 1 from SCI_LSP_APPR_LMTS lmts
		where lmts.LMT_ID = chrg.LIMIT_ID
		and lmts.source_id = 'RLOS')
	);
	
	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 27);
	commit;

	-----------------------------------------
	-- Pledge
	-----------------------------------------

	UPDATE MIG_CO019_PL pl
	SET pl.IS_VALID = 'N'
	WHERE EXISTS
		(select 1 from CMS_SECURITY s
		where s.sci_security_dtl_id = pl.SECURITY_ID)
	AND pl.IS_VALID = 'Y';
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
		(select current_timestamp, 'SIBS', 'CO019', SECURITY_ID, LIMIT_ID, APPLICATION_NO, FACILITY_CODE, trim(char(FACILITY_SEQUENCE)), 'ACT001',
		'[M] Pledge info for Security ID [' || security_id || ']  is already exists in database.'
	FROM MIG_CO019_PL pl
	WHERE pl.IS_VALID = 'N'
	AND EXISTS
		(select 1 from CMS_SECURITY s
		where s.sci_security_dtl_id = pl.SECURITY_ID)
	);

	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 28);
	commit;

	UPDATE MIG_CO019_PL pl
	SET pl.IS_VALID = 'N'
	WHERE EXISTS 
		(select 1 from SCI_LSP_APPR_LMTS lmts
		where lmts.LMT_ID = pl.LIMIT_ID
		and lmts.source_id = 'RLOS')
	AND pl.IS_VALID = 'Y';
	
	INSERT INTO MIG_ERROR_LOG(time_stamp, system_id, interface_id, key1_value, key2_value, key3_value, key4_value, key5_value, error_code, error_msg)
		(select current_timestamp, 'SIBS', 'CO019', SECURITY_ID, LIMIT_ID, APPLICATION_NO, FACILITY_CODE, trim(char(FACILITY_SEQUENCE)), 'ACT002',
		'[M] Pledge info for Limit ID [' || LIMIT_ID || ']  is already exists in database.'
	FROM MIG_CO019_PL pl
	WHERE pl.IS_VALID = 'N'
	AND EXISTS 
		(select 1 from SCI_LSP_APPR_LMTS lmts
		where lmts.LMT_ID = pl.LIMIT_ID
		and lmts.source_id = 'RLOS')
	);

	CALL LOG_PROC_TIME('AUTO_VALIDATE_ACTUAL_TABLE', 'GENERIC', 0);
	commit;
	
END
@    
