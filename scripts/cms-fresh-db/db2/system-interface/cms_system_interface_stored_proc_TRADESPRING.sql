--SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM, ABCLIMS@
DROP PROCEDURE SI_RUN_TEMP_TSPR_CO021@
DROP PROCEDURE SI_RUN_TEMP_TSPR_CA006@
DROP PROCEDURE SI_RUN_TEMP_TSPR_CA008@
DROP PROCEDURE SI_RUN_TEMP_TSPR_CA010@
DROP PROCEDURE SI_RUN_ALL_TSPR@
DROP PROCEDURE SI_RUN_TEMP_TSPR_CO021_DELETE@


CREATE PROCEDURE SI_RUN_TEMP_TSPR_CO021_DELETE
   LANGUAGE SQL
   BEGIN
		
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Actual Table
		-- CMS_LIMIT_SECURITY_MAP
		--
		-------------------------------------	
		lock table cms_limit_security_map in exclusive mode;
		update cms_limit_security_map m set(UPDATE_STATUS_IND, DELETION_DATE)=
		('D', current_timestamp)
		WHERE m.UPDATE_STATUS_IND <> 'D'
			AND m.SOURCE_ID = 'TSPR'
			AND NOT EXISTS (SELECT 1 from SI_TEMP_TSPR_CO021 t, cms_security b, sci_lsp_appr_lmts a
			WHERE m.CMS_COLLATERAL_ID = b.CMS_COLLATERAL_ID
				AND m.CMS_LSP_APPR_LMTS_ID = a.CMS_LSP_APPR_LMTS_ID
				AND a.SOURCE_ID = 'TSPR'
				AND b.SOURCE_ID = 'TSPR'
				AND a.LMT_ID = t.FACILITY_ID 
				AND b.sci_security_dtl_id = t.FACILITY_ID|| t.FD_RECEIPT_NO
				AND t.IS_VALID='Y');
							
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_TSPR_CO021_DELETE', 'TSPR', 1);
		COMMIT;
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Actual Table
		-- CMS_STAGE_LIMIT_SECURITY_MAP
		--
		-------------------------------------
		DECLARE GLOBAL TEMPORARY TABLE SESSION.stg_lmt_sec_map
			(cms_act_col_id BIGINT,
			cms_act_lmt_id BIGINT,
			cms_stg_lmt_id BIGINT)
		WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;
	
		INSERT INTO SESSION.stg_lmt_sec_map (cms_act_col_id, cms_act_lmt_id)
		(SELECT m.cms_collateral_id, m.cms_lsp_appr_lmts_id
			FROM cms_limit_security_map m
			WHERE m.update_status_ind = 'D'
			AND DATE(m.DELETION_DATE) = DATE(CURRENT TIMESTAMP)
			AND m.source_id = 'TSPR'
			AND NOT EXISTS (SELECT 1 from SI_TEMP_TSPR_CO021 t, cms_security b, sci_lsp_appr_lmts a
				WHERE m.CMS_COLLATERAL_ID = b.CMS_COLLATERAL_ID
					AND m.CMS_LSP_APPR_LMTS_ID = a.CMS_LSP_APPR_LMTS_ID
					AND a.SOURCE_ID = 'TSPR'
					AND b.SOURCE_ID = 'TSPR'
					AND a.LMT_ID = t.FACILITY_ID 
					AND b.sci_security_dtl_id = t.FACILITY_ID|| t.FD_RECEIPT_NO 
					AND t.IS_VALID='Y'));
										
		UPDATE SESSION.stg_lmt_sec_map a SET cms_stg_lmt_id =
		(SELECT staging_reference_id FROM transaction
			WHERE transaction_type = 'LIMIT'
			AND reference_id = a.cms_act_lmt_id);
	
		UPDATE cms_stage_limit_security_map set(update_status_ind, deletion_date) = ('D', CURRENT_TIMESTAMP)
		WHERE (cms_collateral_id, cms_lsp_appr_lmts_id) IN 
				(SELECT cms_act_col_id, cms_stg_lmt_id FROM SESSION.stg_lmt_sec_map);
	
		DROP TABLE SESSION.stg_lmt_sec_map;

		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_TSPR_CO021_DELETE', 'TSPR', 2);
		COMMIT;
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Actual Table
		-- CMS_SECURITY
		--
		-------------------------------------
		lock table cms_security in share mode;
		UPDATE cms_security a SET (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
			WHERE source_id = 'TSPR'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'CS202'
				AND NOT EXISTS (SELECT '1' FROM SI_TEMP_TSPR_CO021 t
							WHERE a.sci_security_dtl_id = t.FACILITY_ID || t.FD_RECEIPT_NO
								and t.is_valid = 'Y');
								
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_TSPR_CO021_DELETE', 'TSPR', 3);
		COMMIT;
		
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Staging Table
		-- CMS_STAGE_SECURITY
		--
		-------------------------------------
		lock table cms_stage_security in share mode;
		UPDATE cms_stage_security a set (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
		WHERE source_id = 'TSPR'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'CS202'
				AND NOT EXISTS (SELECT '1' FROM SI_TEMP_TSPR_CO021 t
							WHERE a.sci_security_dtl_id = t.FACILITY_ID || t.FD_RECEIPT_NO
								and t.is_valid = 'Y')
				AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
											WHERE reference_id IN (SELECT cms_collateral_id 
																		FROM cms_security b
																		WHERE a.SCI_SECURITY_DTL_ID = b.SCI_SECURITY_DTL_ID
																			AND b.source_id = 'TSPR')
												AND transaction_type = 'COL');
	
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_TSPR_CO021_DELETE', 'TSPR', 4);
		COMMIT;
		
		------------------------------------
		-- Tag DELETED for non-exist records
		-- cms_security_source
		--
		------------------------------------
		lock table cms_security_source in exclusive mode;
		UPDATE cms_security_source SET(STATUS, last_update_date) =
		('DELETED', current_timestamp)
		WHERE source_id = 'TSPR'
			AND status = 'ACTIVE'
			AND security_sub_type_id = 'CS202'
			AND interface_id = 'CO021'
			AND NOT EXISTS (SELECT 1 FROM SI_TEMP_TSPR_CO021 t
						WHERE source_security_id = t.FACILITY_ID || t.FD_RECEIPT_NO 
							AND t.is_valid = 'Y');

		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_TSPR_CO021_DELETE', 'TSPR', 5);
		COMMIT;
		------------------------------------
		-- Tag DELETED for non-exist records
		-- ACTUAL Table
		-- CMS_CHARGE_DETAIL
		--
		-------------------------------------
		lock table cms_charge_detail in exclusive mode;
		UPDATE cms_charge_detail a SET status = 'DELETED'
			WHERE a.SOURCE_ID = 'TSPR'
				AND status = 'ACTIVE'
				AND NOT EXISTS (SELECT '1' FROM SI_TEMP_TSPR_CO021 t, CMS_SECURITY s
					WHERE t.IS_VALID = 'Y'
						AND s.SCI_SECURITY_DTL_ID = t.FACILITY_ID|| t.FD_RECEIPT_NO 			
						AND s.SOURCE_ID = 'TSPR'
						AND s.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID);
							
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_TSPR_CO021_DELETE', 'TSPR', 6);
		COMMIT;
		
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Staging Table
		-- CMS_STAGE_CHARGE_DETAIL
		--
		-------------------------------------
		lock table cms_stage_charge_detail in exclusive mode;
		UPDATE cms_stage_charge_detail A1 SET status = 'DELETED' 
			WHERE A1.SOURCE_ID = 'TSPR' 
				AND status = 'ACTIVE' 
				AND NOT EXISTS (SELECT '1' FROM SI_TEMP_TSPR_CO021 t, CMS_STAGE_SECURITY s
						WHERE t.IS_VALID = 'Y'
							AND s.SCI_SECURITY_DTL_ID = t.FACILITY_ID|| t.FD_RECEIPT_NO 			
							AND s.SOURCE_ID = 'TSPR'
							AND s.CMS_COLLATERAL_ID = A1.CMS_COLLATERAL_ID)
				AND A1.cms_collateral_id IN (SELECT staging_reference_id FROM transaction
					WHERE reference_id IN (SELECT cms_collateral_id 
												FROM cms_security, SI_TEMP_TSPR_CO021
												WHERE sci_security_dtl_id = FACILITY_ID||FD_RECEIPT_NO
													AND source_id = 'TSPR'  AND is_valid = 'Y')
						AND transaction_type = 'COL');
			 
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_TSPR_CO021_DELETE', 'TSPR', 7);
		COMMIT;
		
		------------------------------------
		-- Tag DELETED for non-exist records
		-- ACTUAL Table
		-- CMS_LIMIT_CHARGE_MAP
		--
		------------------------------------
		lock table cms_limit_charge_map in exclusive mode;
		update cms_limit_charge_map a set status = 'DELETED'
		WHERE status = 'ACTIVE'
			AND exists (select '1' from cms_charge_detail b
					where a.charge_detail_id = b.CHARGE_DETAIL_ID
					and b.SOURCE_ID = 'TSPR'
					and b.STATUS = 'DELETED');
					
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_TSPR_CO021_DELETE', 'TSPR', 8);
		COMMIT;
	
		------------------------------------
		-- Tag DELETED for non-exist records
		-- Staging Table
		-- CMS_STAGE_LIMIT_CHARGE_MAP
		--
		--------------------------------------	
		lock table cms_stage_limit_charge_map in exclusive mode;
		update cms_stage_limit_charge_map a set status = 'DELETED'
		WHERE status = 'ACTIVE'
			AND exists (select '1' from cms_stage_charge_detail b
					where a.charge_detail_id = b.CHARGE_DETAIL_ID
					and b.SOURCE_ID = 'TSPR'
					and b.STATUS = 'DELETED');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_TSPR_CO021_DELETE', 'TSPR', 9);
		COMMIT;

		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Actual Table
		-- CMS_CASH_DEPOSIT
		--
		-------------------------------------
		lock table cms_cash_deposit in exclusive mode;
		UPDATE cms_cash_deposit a set status = 'DELETED'
			WHERE source_id = 'TSPR'
				AND status = 'ACTIVE'
				AND exists (SELECT '1' FROM cms_security s
							WHERE s.cms_collateral_id = a.cms_collateral_id
								and s.source_id = 'TSPR'
								and s.STATUS = 'DELETED');
	
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_TSPR_CO021_DELETE', 'TSPR', 10);
		COMMIT;
		
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Staging Table
		-- CMS_STAGE_CASH_DEPOSIT
		--
		-------------------------------------
		lock table cms_stage_cash_deposit in exclusive mode;
		UPDATE cms_stage_cash_deposit a SET status='DELETED'
			WHERE source_id = 'TSPR'
				and status = 'ACTIVE'
				and exists (SELECT '1' FROM cms_stage_security s
							WHERE s.cms_collateral_id = a.cms_collateral_id
								and s.source_id = 'TSPR'
								and s.STATUS = 'DELETED');

		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_TSPR_CO021_DELETE', 'TSPR', 11);
		COMMIT;
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Actual Table
		-- SCI_PLEDGOR_DTL
		--
		-------------------------------------
		lock table SCI_PLEDGOR_DTL in exclusive mode; 	
		update SCI_PLEDGOR_DTL p set (UPDATE_STATUS_IND, LAST_UPDATE_DATE) = ('D', CURRENT_TIMESTAMP)
		WHERE p.PLG_LE_ID NOT IN (SELECT a.LMT_LE_ID FROM SI_TEMP_TSPR_CO021 t, sci_lsp_appr_lmts a 
				WHERE t.FACILITY_ID=a.LMT_ID AND a.source_id = 'TSPR' 
					AND t.is_valid = 'Y')
			AND p.source_id = 'TSPR';
						
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_TSPR_CO021_DELETE', 'TSPR', 12);
		COMMIT;
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Actual Table
		-- SCI_SEC_PLDGR_MAP
		--
		-------------------------------------
		lock table SCI_SEC_PLDGR_MAP in exclusive mode;
		UPDATE SCI_SEC_PLDGR_MAP c SET (UPDATE_STATUS_IND, LAST_UPDATE_DATE) = ('D', CURRENT_TIMESTAMP)
			WHERE EXISTS (SELECT '1' FROM SCI_PLEDGOR_DTL s
							WHERE s.CMS_PLEDGOR_DTL_ID = c.CMS_PLEDGOR_DTL_ID
								and s.SOURCE_ID = 'TSPR'
								and s.UPDATE_STATUS_IND = 'D');
				
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_TSPR_CO021_DELETE', 'TSPR', 0);
		COMMIT;
END@

CREATE PROCEDURE SI_RUN_TEMP_TSPR_CO021
   LANGUAGE SQL
   BEGIN
	 	DECLARE v_security_sub_type_id VARCHAR(100);
		DECLARE v_subtype_name VARCHAR(100);
		DECLARE v_security_type_name VARCHAR(100);
		DECLARE v_security_type_id VARCHAR(100);
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 1);
		commit;
		
		select security_sub_type_id, subtype_name, security_type_name, security_type_id
		into v_security_sub_type_id, v_subtype_name, v_security_type_name, v_security_type_id
		from cms_security_sub_type 
		where security_sub_type_id='CS202';
		
		----------------------------
		-- Actual table
		-- CMS_SECURITY
		----------------------------
		lock table CMS_SECURITY in exclusive mode;
		UPDATE cms_security SET(
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
		source_id)=
		(SELECT v_security_sub_type_id, v_subtype_name, v_security_type_name, v_security_sub_type_id, v_security_type_id,
		'MY', FACILITY_ID||FD_RECEIPT_NO, 'MYR', 'ACTIVE', 'MY', '000','N', 'TSPR'
 		FROM SI_TEMP_TSPR_CO021 WHERE sci_security_dtl_id=FACILITY_ID||FD_RECEIPT_NO and source_id='TSPR' AND is_valid = 'Y')
			where exists (select 1 from SI_TEMP_TSPR_CO021 where sci_security_dtl_id= FACILITY_ID||FD_RECEIPT_NO and source_id='TSPR' AND is_valid = 'Y');

		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 2);
		commit;

		------------------------------------------
		-- START Update Collateral Transaction
		-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
		--
		------------------------------------------	
		FOR cur_col_key AS
			SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
				FROM CMS_SECURITY a
			WHERE EXISTS (SELECT '1' FROM SI_TEMP_TSPR_CO021 t
								WHERE a.SCI_SECURITY_DTL_ID = t.FACILITY_ID || t.FD_RECEIPT_NO	  				   	  
										AND t.is_valid = 'Y')
				AND a.SOURCE_ID = 'TSPR'	   
				
		DO
			CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
		END FOR;
	
		------------------------------------------
		-- END Update Collateral Transaction
		-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
		--
		------------------------------------------

		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 3);
		commit;
		
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
		'MY', FACILITY_ID||FD_RECEIPT_NO, 'MYR', 'ACTIVE', 'MY', '000','N', 'TSPR'
 		FROM SI_TEMP_TSPR_CO021 t WHERE NOT EXISTS 
			(SELECT 1 FROM cms_security WHERE sci_security_dtl_id=FACILITY_ID||FD_RECEIPT_NO and source_id='TSPR')
			AND t.is_valid = 'Y');
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 4);
		commit;
		
		----------------------------
		-- Staging table
		-- CMS_STAGE_SECURITY
		----------------------------
		lock table cms_stage_security in exclusive mode;
		UPDATE cms_stage_security a SET(
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
		source_id)=
		(SELECT v_security_sub_type_id, v_subtype_name, v_security_type_name, v_security_sub_type_id, v_security_type_id,
		'MY', FACILITY_ID||FD_RECEIPT_NO, 'MYR', 'ACTIVE', 'MY', '000', 'TSPR'
 		FROM SI_TEMP_TSPR_CO021 WHERE sci_security_dtl_id=FACILITY_ID||FD_RECEIPT_NO and source_id='TSPR' AND is_valid = 'Y')
		WHERE EXISTS (SELECT '1' FROM cms_stage_security, SI_TEMP_TSPR_CO021
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND sci_security_dtl_id = FACILITY_ID||FD_RECEIPT_NO
	    			   AND source_id = 'TSPR' AND is_valid = 'Y')
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security, SI_TEMP_TSPR_CO021
	  							   						   WHERE sci_security_dtl_id = FACILITY_ID||FD_RECEIPT_NO
	  							   						     AND source_id = 'TSPR'  AND is_valid = 'Y')
	  							   	 AND transaction_type = 'COL');
	
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 5);
		commit;
	
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
		'MY', FACILITY_ID || FD_RECEIPT_NO, 'MYR', 'ACTIVE', 'MY', '000', 'TSPR'
 		FROM SI_TEMP_TSPR_CO021 t WHERE NOT EXISTS 
			(SELECT 1 FROM cms_stage_security WHERE sci_security_dtl_id=FACILITY_ID||FD_RECEIPT_NO and source_id='TSPR')
			AND t.is_valid = 'Y');
	
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 6);
		commit;
		
		----------------------------
		-- Actual table
		-- CMS_CASH_DEPOSIT
		----------------------------
		
		lock table CMS_CASH_DEPOSIT in exclusive mode;
		UPDATE CMS_CASH_DEPOSIT set(
		DEPOSIT_RECEIPT_NUMBER,
		DEPOSIT_AMOUNT_CURRENCY,
		DEPOSIT_AMOUNT,
		ISSUE_DATE,
		source_id,
		source_security_id,
		status)=
		(SELECT FD_RECEIPT_NO,
		FD_DEPOSIT_AMT_CURRENCY,
		FD_DEPOSIT_AMT,
		FD_DEPOSIT_DATE,
		'TSPR',
		FACILITY_ID||FD_RECEIPT_NO,
		'ACTIVE'
		FROM SI_TEMP_TSPR_CO021 t where FD_RECEIPT_NO=DEPOSIT_RECEIPT_NUMBER 
			and SOURCE_SECURITY_ID=FACILITY_ID||FD_RECEIPT_NO
			and source_id='TSPR' AND is_valid = 'Y') 
		where exists (select 1 from SI_TEMP_TSPR_CO021 where FD_RECEIPT_NO=DEPOSIT_RECEIPT_NUMBER 
				and SOURCE_SECURITY_ID=FACILITY_ID||FD_RECEIPT_NO
				and source_id='TSPR' AND is_valid = 'Y');

		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 7);
		commit;
		
		INSERT INTO CMS_CASH_DEPOSIT (
			CASH_DEPOSIT_ID,
			DEPOSIT_RECEIPT_NUMBER,
			DEPOSIT_AMOUNT_CURRENCY,
			DEPOSIT_AMOUNT,
			ISSUE_DATE,
			SOURCE_ID,
			cms_ref_id,
			status,
			source_security_id,
			CMS_COLLATERAL_ID)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT), 
			FD_RECEIPT_NO,
			FD_DEPOSIT_AMT_CURRENCY,
			FD_DEPOSIT_AMT,
			FD_DEPOSIT_DATE,
			'TSPR',
			CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT),
			'ACTIVE',
			FACILITY_ID||FD_RECEIPT_NO,
			CMS_COLLATERAL_ID
			FROM cms_security sec, SI_TEMP_TSPR_CO021 t 
			WHERE sec.sci_security_dtl_id = t.FACILITY_ID || t.FD_RECEIPT_NO
				AND sec.source_id = 'TSPR'
				AND t.is_valid = 'Y'
				AND NOT EXISTS 
				(SELECT 1 FROM CMS_CASH_DEPOSIT d WHERE 
					d.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID));

		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 8);
		commit;
		
		----------------------------
		-- Staging table
		-- CMS_STAGE_CASH_DEPOSIT
		----------------------------
		lock table CMS_STAGE_CASH_DEPOSIT in exclusive mode;
		UPDATE CMS_STAGE_CASH_DEPOSIT a set(
		DEPOSIT_RECEIPT_NUMBER,
		DEPOSIT_AMOUNT_CURRENCY,
		DEPOSIT_AMOUNT,
		ISSUE_DATE,
		source_id,
		source_security_id,
		status) =
		(SELECT FD_RECEIPT_NO,
		FD_DEPOSIT_AMT_CURRENCY,
		FD_DEPOSIT_AMT,
		FD_DEPOSIT_DATE,
		'TSPR',
		FACILITY_ID||FD_RECEIPT_NO,
		'ACTIVE'
		FROM SI_TEMP_TSPR_CO021 where FD_RECEIPT_NO=a.DEPOSIT_RECEIPT_NUMBER 
			AND a.SOURCE_SECURITY_ID=FACILITY_ID||FD_RECEIPT_NO
			AND is_valid = 'Y')
		WHERE EXISTS (SELECT '1' FROM SI_TEMP_TSPR_CO021 t
						WHERE a.SOURCE_SECURITY_ID = t.FACILITY_ID||t.FD_RECEIPT_NO
							AND source_id = 'TSPR' AND is_valid = 'Y')
			AND source_id = 'TSPR'
			AND a.cms_collateral_id IN (SELECT staging_reference_id FROM transaction
										WHERE reference_id IN (SELECT cms_collateral_id 
																	FROM cms_security, SI_TEMP_TSPR_CO021
																	WHERE sci_security_dtl_id=FACILITY_ID||FD_RECEIPT_NO
																		AND source_id = 'TSPR' AND is_valid = 'Y')
											AND transaction_type = 'COL');

		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 9);
		commit;
		
		lock table CMS_STAGE_CASH_DEPOSIT in exclusive mode;
		INSERT INTO CMS_STAGE_CASH_DEPOSIT (
			CASH_DEPOSIT_ID,
			DEPOSIT_RECEIPT_NUMBER,
			DEPOSIT_AMOUNT_CURRENCY,
			DEPOSIT_AMOUNT,
			ISSUE_DATE,
			SOURCE_ID,
			cms_ref_id,
			status,
			source_security_id,
			CMS_COLLATERAL_ID)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT), 
			FD_RECEIPT_NO,
			FD_DEPOSIT_AMT_CURRENCY,
			FD_DEPOSIT_AMT,
			FD_DEPOSIT_DATE,
			'TSPR',
			(SELECT cms_ref_id FROM CMS_CASH_DEPOSIT WHERE DEPOSIT_RECEIPT_NUMBER = t.FD_RECEIPT_NO 
				and SOURCE_SECURITY_ID=t.FACILITY_ID||t.FD_RECEIPT_NO
				and source_id='TSPR'),
			'ACTIVE',
			FACILITY_ID||FD_RECEIPT_NO,
			cms_collateral_id
			FROM cms_stage_security sec, SI_TEMP_TSPR_CO021 t
	  		WHERE sec.sci_security_dtl_id = t.FACILITY_ID||t.FD_RECEIPT_NO
	    		AND sec.source_id = 'TSPR'
					AND t.is_valid = 'Y'
				  AND NOT EXISTS (SELECT '1' FROM cms_stage_cash_deposit s
						WHERE s.cms_collateral_id = sec.cms_collateral_id
							AND s.SOURCE_ID = 'TSPR'));

		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 10);
		commit;
		
		----------------------------
		-- Actual table
		-- cms_limit_security_map
		----------------------------
		INSERT INTO cms_limit_security_map (
		charge_id,
		cms_lsp_appr_lmts_id,
		cms_collateral_id,
		sci_las_lmt_id,
		customer_category,
		cms_lsp_lmt_profile_id,
		source_id)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_MAP_SEQ), 2)) as BIGINT), 
		a.CMS_LSP_APPR_LMTS_ID,
		s.cms_collateral_id,
		t.FACILITY_ID,
		'MB',
		a.CMS_LIMIT_PROFILE_ID,
		'TSPR'
 		FROM SI_TEMP_TSPR_CO021 t ,sci_lsp_appr_lmts a, cms_security s
			WHERE t.is_valid = 'Y'
				and a.source_id = 'TSPR' 
				and a.LMT_ID = t.FACILITY_ID 
				and s.sci_security_dtl_id = t.FACILITY_ID || t.FD_RECEIPT_NO 
				and s.source_id = 'TSPR'		
				AND NOT EXISTS
				(SELECT 1 FROM cms_limit_security_map m, cms_security b, sci_lsp_appr_lmts a
					WHERE m.CMS_COLLATERAL_ID = b.CMS_COLLATERAL_ID
						and m.CMS_LSP_APPR_LMTS_ID = a.CMS_LSP_APPR_LMTS_ID
						and a.source_id = 'TSPR' 
						and a.LMT_ID = t.FACILITY_ID 
						and b.sci_security_dtl_id = t.FACILITY_ID|| t.FD_RECEIPT_NO 
						and b.source_id = 'TSPR'));

		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 12);
		commit;
		
		-------------------------------
		-- Staging table
		-- cms_stage_limit_security_map
		-------------------------------
		INSERT INTO cms_stage_limit_security_map (
		charge_id,
		cms_lsp_appr_lmts_id,
		cms_collateral_id,
		sci_las_lmt_id,
		customer_category,
		cms_lsp_lmt_profile_id,
		source_id)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_LIMIT_MAP_SEQ), 2)) as BIGINT), 
		a.CMS_LSP_APPR_LMTS_ID,
		(select cms_collateral_id from cms_stage_security where sci_security_dtl_id = t.FACILITY_ID || t.FD_RECEIPT_NO and source_id = 'TSPR'),
		t.FACILITY_ID,
		'MB',
		a.CMS_LIMIT_PROFILE_ID,
		'TSPR'
 		FROM SI_TEMP_TSPR_CO021 t ,stage_limit a, cms_security s
			WHERE t.is_valid = 'Y'
				and a.source_id = 'TSPR' 
				and a.LMT_ID = t.FACILITY_ID 
				and s.sci_security_dtl_id = t.FACILITY_ID || t.FD_RECEIPT_NO 
				and s.source_id = 'TSPR'		
				AND NOT EXISTS
				(SELECT 1 FROM cms_stage_limit_security_map m, cms_stage_security b, stage_limit a
					WHERE m.CMS_COLLATERAL_ID = b.CMS_COLLATERAL_ID
						and m.CMS_LSP_APPR_LMTS_ID = a.CMS_LSP_APPR_LMTS_ID
						and a.source_id = 'TSPR' 
						and a.LMT_ID = t.FACILITY_ID 
						and b.sci_security_dtl_id = t.FACILITY_ID|| t.FD_RECEIPT_NO 
						and b.source_id = 'TSPR'));
						
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 14);
		commit;
		
		------------------------------------------
		-- Actual table
		-- CMS_CASH
		-----------------------------------------
		
		lock table CMS_CASH in exclusive mode; 		
		UPDATE CMS_CASH c
		SET(TOTAL_DEPOSIT_AMT, COUNT_DEPOSIT) =
		(SELECT t.FD_DEPOSIT_AMT, 1
		FROM SI_TEMP_TSPR_CO021 t 
		WHERE CMS_COLLATERAL_ID = (SELECT CMS_COLLATERAL_ID FROM CMS_SECURITY
				WHERE SCI_SECURITY_DTL_ID = t.FACILITY_ID|| t.FD_RECEIPT_NO 
				AND SOURCE_ID = 'TSPR')
				AND IS_VALID = 'Y')		
		WHERE EXISTS 
				(SELECT '1' FROM SI_TEMP_TSPR_CO021, CMS_SECURITY s
					WHERE c.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID 
						AND s.SCI_SECURITY_DTL_ID = FACILITY_ID|| FD_RECEIPT_NO 
						AND s.SOURCE_ID = 'TSPR'
						AND IS_VALID = 'Y');
		
		commit;
		
		INSERT INTO CMS_CASH (CMS_COLLATERAL_ID, TOTAL_DEPOSIT_AMT, COUNT_DEPOSIT)
		(select (SELECT CMS_COLLATERAL_ID from cms_security
			where sci_security_dtl_id = t.FACILITY_ID|| t.FD_RECEIPT_NO and source_id='TSPR'),
		t.FD_DEPOSIT_AMT, 1
		FROM SI_TEMP_TSPR_CO021 t WHERE NOT EXISTS 
			(SELECT 1 FROM CMS_CASH a, cms_security b WHERE a.CMS_COLLATERAL_ID=b.CMS_COLLATERAL_ID and b.sci_security_dtl_id = t.FACILITY_ID|| t.FD_RECEIPT_NO and source_id='TSPR')
			AND t.is_valid = 'Y');

		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 15);
		commit;

		------------------------------------------
		-- Staging table
		-- CMS_STAGE_CASH
		-----------------------------------------
		lock table CMS_STAGE_CASH in exclusive mode; 
		UPDATE CMS_STAGE_CASH c
		SET(TOTAL_DEPOSIT_AMT, COUNT_DEPOSIT) =
		(SELECT t.FD_DEPOSIT_AMT,1 FROM SI_TEMP_TSPR_CO021 t 
		WHERE CMS_COLLATERAL_ID = (SELECT CMS_COLLATERAL_ID 
				FROM CMS_STAGE_SECURITY
				WHERE SCI_SECURITY_DTL_ID = t.FACILITY_ID|| t.FD_RECEIPT_NO
				AND SOURCE_ID = 'TSPR')
				AND IS_VALID = 'Y')		
		WHERE EXISTS (SELECT '1' FROM SI_TEMP_TSPR_CO021 t, CMS_STAGE_SECURITY s
					WHERE c.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID 
						AND s.SCI_SECURITY_DTL_ID = t.FACILITY_ID|| t.FD_RECEIPT_NO
						AND s.SOURCE_ID = 'TSPR'
						AND IS_VALID = 'Y')
	  	AND c.cms_collateral_id IN (SELECT staging_reference_id FROM transaction
				   WHERE reference_id IN (SELECT cms_collateral_id 
				   							FROM cms_security, SI_TEMP_TSPR_CO021
				   						   WHERE sci_security_dtl_id = FACILITY_ID||FD_RECEIPT_NO
				   						     AND source_id = 'TSPR'  AND is_valid = 'Y')
				   	 AND transaction_type = 'COL');
		
		commit;
		
		INSERT INTO CMS_STAGE_CASH (CMS_COLLATERAL_ID, TOTAL_DEPOSIT_AMT, COUNT_DEPOSIT)
		(select (SELECT CMS_COLLATERAL_ID from cms_stage_security
			where sci_security_dtl_id = t.FACILITY_ID|| t.FD_RECEIPT_NO and source_id='TSPR'),
		t.FD_DEPOSIT_AMT, 1
		FROM SI_TEMP_TSPR_CO021 t WHERE NOT EXISTS 
		(SELECT 1 FROM CMS_STAGE_CASH a, cms_stage_security b WHERE a.CMS_COLLATERAL_ID=b.CMS_COLLATERAL_ID 
			and b.sci_security_dtl_id = t.FACILITY_ID|| t.FD_RECEIPT_NO and b.source_id='TSPR')
			AND t.is_valid = 'Y');
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 16);
		commit;
		
	----------------------------------------------------------    
	-- Actual table
	-- SCI_PLEDGOR_DTL
	--
	----------------------------------------------------------
	update SI_TEMP_TSPR_CO021 set CIF_ID 
	= (select LMT_LE_ID from sci_lsp_appr_lmts where source_id = 'TSPR' and lmt_id = facility_id)
	where is_valid = 'Y';
	
	
	lock table SCI_PLEDGOR_DTL in exclusive mode; 	
	update SCI_PLEDGOR_DTL plg
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
		'TSPR', 'U'		
		FROM sci_le_main_profile m, sci_le_sub_profile s, SI_TEMP_TSPR_CO021 t
		WHERE m.lmp_le_id = s.LSP_LE_ID
			and m.LMP_LE_ID = t.CIF_ID
			and m.SOURCE_ID = 'ARBS'
			and m.lmp_le_id = plg.PLG_LE_ID
			and plg.SOURCE_ID = 'TSPR'
			group by lmp_le_id, LMP_LONG_NAME, 
				--LMP_INC_CNTRY_ISO_CODE,  LMP_INC_NUM_TEXT,
				LMP_INC_CNTRY_ISO_CODE,  LMP_ID_NUMBER,
				LMP_ID_TYPE_NUM,     LMP_ID_TYPE_VALUE,
				LMP_LE_ID_SRC_NUM,     LMP_LE_ID_SRC_VALUE,  
				s.CMS_SUB_ORIG_COUNTRY,
				s.CMS_SUB_ORIG_ORGANISATION)
	WHERE EXISTS (SELECT '1' FROM SI_TEMP_TSPR_CO021 t
		where t.is_valid = 'Y'
		and t.CIF_ID = plg.PLG_LE_ID)
	and source_id = 'TSPR';

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 17);
	commit;	
	
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
		s.CMS_SUB_ORIG_COUNTRY,
		s.CMS_SUB_ORIG_ORGANISATION,		
		'TSPR', 'I'
		from sci_le_main_profile m, sci_le_sub_profile s, SI_TEMP_TSPR_CO021 t
		WHERE m.lmp_le_id = s.LSP_LE_ID
			and m.LMP_LE_ID = t.CIF_ID
			and m.SOURCE_ID = 'ARBS'
			and t.is_valid = 'Y'
			and not EXISTS (SELECT '1' FROM SCI_PLEDGOR_DTL b
					WHERE b.PLG_LE_ID = t.CIF_ID
					and b.SOURCE_ID = 'TSPR')
			group by lmp_le_id, LMP_LONG_NAME, 
				--LMP_INC_CNTRY_ISO_CODE,  LMP_INC_NUM_TEXT,
				LMP_INC_CNTRY_ISO_CODE,  LMP_ID_NUMBER,
				LMP_ID_TYPE_NUM,     LMP_ID_TYPE_VALUE,
				LMP_LE_ID_SRC_NUM,     LMP_LE_ID_SRC_VALUE ,
				s.CMS_SUB_ORIG_COUNTRY,
				s.CMS_SUB_ORIG_ORGANISATION);

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 18);
	commit;	
	
	----------------------------------------------------------    
	-- Actual table
	-- SCI_SEC_PLDGR_MAP
	--
	----------------------------------------------------------	
	lock table SCI_SEC_PLDGR_MAP in exclusive mode; 	
	UPDATE SCI_SEC_PLDGR_MAP c
	SET(				
		SPM_MAP_ID, 
		CMS_PLEDGOR_DTL_ID, 
		CMS_COLLATERAL_ID, 
		UPDATE_STATUS_IND) =
	(SELECT 
		0,
		COALESCE((SELECT CMS_PLEDGOR_DTL_ID 
			FROM SCI_PLEDGOR_DTL pld
			WHERE pld.PLG_LE_ID = t.CIF_ID
				and pld.SOURCE_ID = 'TSPR'),
		0),
		s.CMS_COLLATERAL_ID, 'U'
	FROM SI_TEMP_TSPR_CO021 t, CMS_SECURITY s
	WHERE s.SCI_SECURITY_DTL_ID = t.FACILITY_ID|| t.FD_RECEIPT_NO 
		AND s.SOURCE_ID = 'TSPR'
		AND IS_VALID = 'Y'
		and c.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID)
	WHERE EXISTS (SELECT '1' FROM SI_TEMP_TSPR_CO021 t, CMS_SECURITY s 
				WHERE c.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID 
				AND s.SCI_SECURITY_DTL_ID = t.FACILITY_ID|| t.FD_RECEIPT_NO 
				AND s.SOURCE_ID = 'TSPR'
				AND IS_VALID = 'Y');
		
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 19);
	commit;			
		
	insert into SCI_SEC_PLDGR_MAP
		(CMS_SEC_PLDGR_MAP_ID, SPM_MAP_ID, 
		CMS_PLEDGOR_DTL_ID, CMS_COLLATERAL_ID,
		SEC_PLEDGOR_RELATIONSHIP_NUM,
		SEC_PLEDGOR_RELATIONSHIP_VALUE,
		UPDATE_STATUS_IND)	
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR COL_PLEDGOR_MAP_SEQ), 2)) as BIGINT), 
		0,
		COALESCE((SELECT CMS_PLEDGOR_DTL_ID 
			FROM SCI_PLEDGOR_DTL pld
			WHERE pld.PLG_LE_ID = t.CIF_ID
				and pld.SOURCE_ID = 'TSPR'),
		0),
		s.CMS_COLLATERAL_ID,
		'34',
		'1st',
		'I'
	FROM SI_TEMP_TSPR_CO021 t, CMS_SECURITY s
	WHERE SCI_SECURITY_DTL_ID = t.FACILITY_ID|| t.FD_RECEIPT_NO 
		AND SOURCE_ID = 'TSPR'
		AND IS_VALID = 'Y'
		and NOT EXISTS 
			(SELECT '1' FROM SCI_SEC_PLDGR_MAP m, CMS_SECURITY s 
				WHERE m.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID 
				AND s.SCI_SECURITY_DTL_ID = t.FACILITY_ID|| t.FD_RECEIPT_NO 
				AND s.SOURCE_ID = 'TSPR'));

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 20);
	commit;	
	
	---------------------------------------------------------    
	-- Actual table
	-- CMS_CHARGE_DETAIL
	--
	----------------------------------------------------------	
	lock table CMS_CHARGE_DETAIL in exclusive mode; 		
	UPDATE CMS_CHARGE_DETAIL c
	SET(		
		CHARGE_AMOUNT, CHARGE_CURRENCY_CODE,
		STATUS) =
	(SELECT 
		t.FD_DEPOSIT_AMT, t.FD_DEPOSIT_AMT_CURRENCY,
		'ACTIVE'
	FROM SI_TEMP_TSPR_CO021 t, CMS_SECURITY s
	WHERE IS_VALID = 'Y'
		AND s.SCI_SECURITY_DTL_ID = t.FACILITY_ID|| t.FD_RECEIPT_NO 			
		AND s.SOURCE_ID = 'TSPR'
		AND s.CMS_COLLATERAL_ID = c.CMS_COLLATERAL_ID) 
	WHERE EXISTS (SELECT '1' FROM SI_TEMP_TSPR_CO021 t, CMS_SECURITY s
		WHERE IS_VALID = 'Y'
			AND s.SCI_SECURITY_DTL_ID = t.FACILITY_ID|| t.FD_RECEIPT_NO 			
			AND s.SOURCE_ID = 'TSPR'
			AND s.CMS_COLLATERAL_ID = c.CMS_COLLATERAL_ID);
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 21);
	commit;	
	
	lock table CMS_CHARGE_DETAIL in exclusive mode; 
	INSERT INTO CMS_CHARGE_DETAIL 
	(CHARGE_DETAIL_ID, CHARGE_AMOUNT, CHARGE_CURRENCY_CODE, CMS_COLLATERAL_ID, STATUS)
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_CHARGE_DETAIL_SEQ), 2)) as BIGINT), 
		t.FD_DEPOSIT_AMT, t.FD_DEPOSIT_AMT_CURRENCY,
		s.CMS_COLLATERAL_ID,
		'ACTIVE'			
	FROM SI_TEMP_TSPR_CO021 t, CMS_SECURITY s
	WHERE IS_VALID = 'Y'
		AND s.SCI_SECURITY_DTL_ID = t.FACILITY_ID|| t.FD_RECEIPT_NO 			
		AND s.SOURCE_ID = 'TSPR'
		AND NOT EXISTS 
		(SELECT '1'FROM CMS_CHARGE_DETAIL c
			WHERE c.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID));
		
	update cms_charge_detail
	set cms_ref_id = charge_detail_id
	where cms_ref_id is null;
									
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 22);
	commit;	

	---------------------------------------------------------    
	-- Staging table
	-- CMS_STAGE_CHARGE_DETAIL
	--
	----------------------------------------------------------	
	lock table CMS_STAGE_CHARGE_DETAIL in exclusive mode; 	
	UPDATE CMS_STAGE_CHARGE_DETAIL c
	SET(		
		CHARGE_AMOUNT, CHARGE_CURRENCY_CODE,
		STATUS) =
	(SELECT 
		t.FD_DEPOSIT_AMT, t.FD_DEPOSIT_AMT_CURRENCY,
		'ACTIVE'
	FROM SI_TEMP_TSPR_CO021 t, CMS_STAGE_SECURITY s
	WHERE IS_VALID = 'Y'
		AND s.SCI_SECURITY_DTL_ID = t.FACILITY_ID|| t.FD_RECEIPT_NO 			
		AND s.SOURCE_ID = 'TSPR'
		AND s.CMS_COLLATERAL_ID = c.CMS_COLLATERAL_ID)
	WHERE EXISTS (SELECT '1' FROM SI_TEMP_TSPR_CO021 t, CMS_STAGE_SECURITY s
			WHERE t.IS_VALID = 'Y'
				AND s.SCI_SECURITY_DTL_ID = t.FACILITY_ID|| t.FD_RECEIPT_NO 			
				AND s.SOURCE_ID = 'TSPR'
				AND s.CMS_COLLATERAL_ID = c.CMS_COLLATERAL_ID)
  	AND c.cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	   WHERE reference_id IN (SELECT cms_collateral_id 
	   							FROM cms_security, SI_TEMP_TSPR_CO021
	   						   WHERE sci_security_dtl_id = FACILITY_ID||FD_RECEIPT_NO
	   						     AND source_id = 'TSPR'  AND is_valid = 'Y')
	   	 AND transaction_type = 'COL');
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 23);
	commit;
	
	lock table CMS_STAGE_CHARGE_DETAIL in exclusive mode; 	
	INSERT INTO 
		CMS_STAGE_CHARGE_DETAIL (CHARGE_DETAIL_ID, CHARGE_AMOUNT, CHARGE_CURRENCY_CODE,
		CMS_COLLATERAL_ID, STATUS)
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_CHARGE_DETAIL_SEQ), 2)) as BIGINT), 
		t.FD_DEPOSIT_AMT, t.FD_DEPOSIT_AMT_CURRENCY,
		s.CMS_COLLATERAL_ID,
		'ACTIVE'			
	FROM SI_TEMP_TSPR_CO021 t, CMS_STAGE_SECURITY s
	WHERE IS_VALID = 'Y'
		AND s.SCI_SECURITY_DTL_ID = t.FACILITY_ID|| t.FD_RECEIPT_NO 			
		AND s.SOURCE_ID = 'TSPR'
		AND NOT EXISTS 
		(SELECT '1'FROM CMS_STAGE_CHARGE_DETAIL c
			WHERE c.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID));
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 24);
	commit;		
	
	---------------------------------------------------------    
	-- Actual table
	-- CMS_LIMIT_CHARGE_MAP
	--
	----------------------------------------------------------	
	-- need to handle revived limit charge map
	lock table cms_limit_charge_map in exclusive mode;
	update cms_limit_charge_map a
	set status = 'ACTIVE'
	WHERE status = 'DELETED'
		AND exists (select '1' from cms_charge_detail b
				where a.charge_detail_id = b.CHARGE_DETAIL_ID
				and b.SOURCE_ID = 'TSPR'
				and b.STATUS = 'ACTIVE');
				
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 25);
	commit;		
	
	lock table CMS_LIMIT_CHARGE_MAP in exclusive mode; 	
	INSERT INTO CMS_LIMIT_CHARGE_MAP (
		LIMIT_CHARGE_MAP_ID,
		CMS_LSP_APPR_LMTS_ID,
		CHARGE_ID,
		CHARGE_DETAIL_ID,
		CMS_COLLATERAL_ID,
		STATUS,
		CUSTOMER_CATEGORY  )
	(SELECT 
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR LIMIT_CHARGE_MAP_SEQ), 2)) as BIGINT), 
		(SELECT CMS_LSP_APPR_LMTS_ID 
				FROM SCI_LSP_APPR_LMTS 
				WHERE LMT_ID = T.FACILITY_ID 
				AND SOURCE_ID = 'TSPR'),
		(SELECT CHARGE_ID 
				FROM CMS_LIMIT_SECURITY_MAP m, SCI_LSP_APPR_LMTS l
				WHERE m.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID
					and m.SOURCE_ID = 'TSPR'
					and m.CMS_LSP_APPR_LMTS_ID = l.CMS_LSP_APPR_LMTS_ID
					and LMT_ID = T.FACILITY_ID
					and l.source_id = 'TSPR'),
		(SELECT CHARGE_DETAIL_ID
				FROM CMS_CHARGE_DETAIL c
				where c.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID),	
		s.CMS_COLLATERAL_ID,
		'ACTIVE',
		'MB'		
	FROM SI_TEMP_TSPR_CO021 t, CMS_SECURITY s
	WHERE t.IS_VALID = 'Y'
			AND s.SCI_SECURITY_DTL_ID = t.FACILITY_ID || t.FD_RECEIPT_NO			
			AND s.SOURCE_ID = 'TSPR'
			AND NOT EXISTS 
			(SELECT '1' 
				FROM CMS_LIMIT_CHARGE_MAP m, SCI_LSP_APPR_LMTS l 
				WHERE m.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID
					AND m.CMS_LSP_APPR_LMTS_ID = l.CMS_LSP_APPR_LMTS_ID
					AND l.SOURCE_ID = 'TSPR'));
				
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 26);
	commit;			
	
	---------------------------------------------------------    
	-- Staging table
	-- CMS_STAGE_LIMIT_CHARGE_MAP
	--
	----------------------------------------------------------	
	-- need to handle revived stage limit charge map
	lock table cms_stage_limit_charge_map in exclusive mode;
	update cms_stage_limit_charge_map a
	set status = 'ACTIVE'
	WHERE status = 'DELETED'
		AND exists (select '1' from cms_stage_charge_detail b
				where a.charge_detail_id = b.CHARGE_DETAIL_ID
				and b.SOURCE_ID = 'TSPR'
				and b.STATUS = 'ACTIVE');
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 27);
	commit;
	
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
		(SELECT CMS_LSP_APPR_LMTS_ID 
				FROM SCI_LSP_APPR_LMTS 
				WHERE LMT_ID = T.FACILITY_ID 
				AND SOURCE_ID = 'TSPR'),
		(SELECT CHARGE_ID 
				FROM CMS_STAGE_LIMIT_SECURITY_MAP m, STAGE_LIMIT l
				WHERE m.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID
					and m.SOURCE_ID = 'TSPR'
					and m.CMS_LSP_APPR_LMTS_ID = l.CMS_LSP_APPR_LMTS_ID
					and LMT_ID = T.FACILITY_ID
					and l.source_id = 'TSPR'),
		(SELECT CHARGE_DETAIL_ID
				FROM CMS_STAGE_CHARGE_DETAIL c
				where c.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID),	
		s.CMS_COLLATERAL_ID,
		'ACTIVE',
		'MB'		
	FROM SI_TEMP_TSPR_CO021 t, CMS_STAGE_SECURITY s
	WHERE t.IS_VALID = 'Y'
			AND s.SCI_SECURITY_DTL_ID = t.FACILITY_ID || t.FD_RECEIPT_NO			
			AND s.SOURCE_ID = 'TSPR'
			AND NOT EXISTS 
			(SELECT '1' 
				FROM CMS_STAGE_LIMIT_CHARGE_MAP m, STAGE_LIMIT l 
				WHERE m.CMS_COLLATERAL_ID = s.CMS_COLLATERAL_ID 
				AND m.CMS_LSP_APPR_LMTS_ID = l.CMS_LSP_APPR_LMTS_ID
				AND l.SOURCE_ID = 'TSPR'));
				
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 28);
	commit;		
	
	----------------------------
	-- Begin Update
	-- cms_security_source
	--
	----------------------------
	lock table cms_security_source in exclusive mode; 
	UPDATE cms_security_source SET(
	CMS_COLLATERAL_ID,
	source_security_id,
	source_id,
	last_update_date,
	security_sub_type_id)=
	(SELECT COALESCE((select cms_collateral_id from cms_security where sci_security_dtl_id = FACILITY_ID || FD_RECEIPT_NO and source_id = 'TSPR'),0),
	FACILITY_ID||FD_RECEIPT_NO, 'TSPR', CURRENT_TIMESTAMP,
	(select security_sub_type_id from cms_security where sci_security_dtl_id = FACILITY_ID || FD_RECEIPT_NO and source_id = 'TSPR')
	FROM SI_TEMP_TSPR_CO021 WHERE source_security_id=FACILITY_ID||FD_RECEIPT_NO and source_id = 'TSPR' AND is_valid = 'Y')
		where exists (select 1 from SI_TEMP_TSPR_CO021 where source_security_id= FACILITY_ID||FD_RECEIPT_NO and source_id = 'TSPR' AND is_valid = 'Y');
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 29);
	commit;
	
	----------------------------
	-- Begin Insertion
	-- cms_security_source
	--
	----------------------------
	lock table cms_security_source in exclusive mode; 
	insert into cms_security_source(
	cms_security_source_id,
	CMS_COLLATERAL_ID,
	source_security_id,
	source_id,
	status,
	last_update_date,
	security_sub_type_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) as BIGINT),
	COALESCE((select cms_collateral_id from cms_security where sci_security_dtl_id = FACILITY_ID || FD_RECEIPT_NO and source_id = 'TSPR'),0),
	FACILITY_ID||FD_RECEIPT_NO, 'TSPR', 'ACTIVE', CURRENT_TIMESTAMP,
	(select security_sub_type_id from cms_security where sci_security_dtl_id = FACILITY_ID || FD_RECEIPT_NO and source_id = 'TSPR')
	FROM SI_TEMP_TSPR_CO021 
		WHERE NOT EXISTS (SELECT 1 FROM cms_security_source WHERE source_security_id=FACILITY_ID||FD_RECEIPT_NO and source_id = 'TSPR')
			AND is_valid = 'Y');

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 30);
	COMMIT;
	
	CALL SI_RUN_TEMP_TSPR_CO021_DELETE;
	COMMIT;
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CO021', 'TSPR', 0);
END@

CREATE PROCEDURE SI_RUN_TEMP_TSPR_CA006
   LANGUAGE SQL
   BEGIN
	 
	 CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 1);
	 	-------------------------------------
		-- Auto Feed Std Code
		-- COMMON_CODE_CATEGORY_ENTRY
		--
		-------------------------------------
		
	   FOR cur_std_code AS
			SELECT DISTINCT PRODUCT_TYPE_CODE code, PRODUCT_TYPE_DESC desc, 
					PRODUCT_TYPE_CAT cat, 'TSPR' source_id
				FROM SI_TEMP_TSPR_CA006
			WHERE LENGTH(PRODUCT_TYPE_CODE) > 0
				AND LENGTH(PRODUCT_TYPE_DESC) > 0
			UNION
			SELECT DISTINCT product_type_code code, product_type_desc desc,
			   '26' cat, 'TSPR' source_id
		  FROM SI_TEMP_TSPR_CA006
		 WHERE LENGTH(product_type_code) > 0
		   AND LENGTH(product_type_desc) > 0
		DO
			CALL SI_AUTO_UPDATE_NEW_PRODUCT_TYPE(cur_std_code.code, cur_std_code.desc, cur_std_code.source_id);
			CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
		END FOR;
	 
		----------------------------
		-- Actual table
		-- SCI_LSP_LMT_PROFILE
		----------------------------
		UPDATE SCI_LSP_LMT_PROFILE SET(
		LLP_LE_ID,
		LLP_BCA_REF_NUM,
		LLP_SEGMENT_CODE_VALUE,
		ISLAMIC_FLAG,
		CMS_CUSTOMER_ID,
		CMS_ORIG_COUNTRY,
		CMS_ORIG_ORGANISATION,
		CMS_BCA_COMPLETE_IND,
		SOURCE_ID,
		LMT_PROFILE_TYPE)=
		(select CIF_ID,
		TRADE_ACCT_NO,
		BUSINESS_UNIT,
		ISLAMIC_FLAG,
		(select b.CMS_LE_SUB_PROFILE_ID from sci_le_sub_profile b, sci_le_main_profile a 
			where b.CMS_LE_MAIN_PROFILE_ID=a.CMS_LE_MAIN_PROFILE_ID and a.SOURCE_ID='ARBS' 
				and a.LMP_LE_ID=LLP_LE_ID),
		ORI_LOC_COUNTRY,
		ORG_LOC_ORG,
		'N',
		'TSPR',
		'BANKING'
 		FROM SI_TEMP_TSPR_CA006 t WHERE LLP_BCA_REF_NUM = t.TRADE_ACCT_NO
			and LLP_LE_ID = t.CIF_ID
			and (outer_limit_id IS NULL OR outer_limit_id = '' OR outer_limit_id = limit_id) 
			and SOURCE_ID='TSPR' 
			AND is_valid = 'Y'
			group by CIF_ID,TRADE_ACCT_NO,BUSINESS_UNIT,ISLAMIC_FLAG,ORI_LOC_COUNTRY,ORG_LOC_ORG)
			WHERE EXISTS (SELECT 1 FROM SI_TEMP_TSPR_CA006 WHERE LLP_BCA_REF_NUM = TRADE_ACCT_NO 
				and LLP_LE_ID = CIF_ID
				and (outer_limit_id IS NULL OR outer_limit_id = '' OR outer_limit_id = limit_id) 
				and SOURCE_ID='TSPR' 
				AND is_valid = 'Y')
			and source_id='TSPR';
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 2);
		COMMIT;
		
		INSERT INTO SCI_LSP_LMT_PROFILE(
			CMS_LSP_LMT_PROFILE_ID,
			LLP_LE_ID,
			LLP_BCA_REF_NUM,
			LLP_SEGMENT_CODE_VALUE,
			ISLAMIC_FLAG,
			CMS_CUSTOMER_ID,
			CMS_BCA_STATUS,
			CMS_ORIG_COUNTRY,
			CMS_ORIG_ORGANISATION,
			CMS_BCA_COMPLETE_IND,
			SOURCE_ID,
			LMT_PROFILE_TYPE,
			UPDATE_STATUS_IND
		)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR LIMIT_PROFILE_SEQ), 2)) as BIGINT),
			CIF_ID,
			TRADE_ACCT_NO,
			BUSINESS_UNIT,
			ISLAMIC_FLAG,
			(select b.CMS_LE_SUB_PROFILE_ID from sci_le_sub_profile b, sci_le_main_profile a 
				where b.CMS_LE_MAIN_PROFILE_ID=a.CMS_LE_MAIN_PROFILE_ID and a.SOURCE_ID='ARBS' and a.LMP_LE_ID=t.CIF_ID),
			'ACTIVE',
			ORI_LOC_COUNTRY,
			ORG_LOC_ORG,
			'N',
			'TSPR',
			'BANKING',
			'I'
 		FROM SI_TEMP_TSPR_CA006 t WHERE NOT EXISTS 
			(SELECT 1 FROM SCI_LSP_LMT_PROFILE WHERE LLP_BCA_REF_NUM = t.TRADE_ACCT_NO 
				and LLP_LE_ID = t.CIF_ID
				and SOURCE_ID='TSPR')
		and (outer_limit_id IS NULL OR outer_limit_id = '' OR outer_limit_id = limit_id) 
		AND t.is_valid = 'Y'
		group by CIF_ID,TRADE_ACCT_NO,BUSINESS_UNIT,ISLAMIC_FLAG,ORI_LOC_COUNTRY,ORG_LOC_ORG);

		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 3);
		commit;
		
		--------------------------------
		-- Staging table
		-- STAGE_LIMIT_PROFILE
		--
		---------------------------------
		UPDATE STAGE_LIMIT_PROFILE SET(
		LLP_LE_ID,
		LLP_BCA_REF_NUM,
		LLP_SEGMENT_CODE_VALUE,
		ISLAMIC_FLAG,
		CMS_CUSTOMER_ID,
		CMS_ORIG_COUNTRY,
		CMS_ORIG_ORGANISATION,
		CMS_BCA_COMPLETE_IND,
		SOURCE_ID,
		LMT_PROFILE_TYPE)=
		(SELECT CIF_ID,
		TRADE_ACCT_NO,
		BUSINESS_UNIT,
		ISLAMIC_FLAG,
		(select b.CMS_LE_SUB_PROFILE_ID from sci_le_sub_profile b, sci_le_main_profile a 
			where b.CMS_LE_MAIN_PROFILE_ID=a.CMS_LE_MAIN_PROFILE_ID and a.SOURCE_ID='TSPR' and a.LMP_LE_ID=t.CIF_ID),
		ORI_LOC_COUNTRY,
		ORG_LOC_ORG,
		'N',
		'TSPR',
		'BANKING'
 		FROM SI_TEMP_TSPR_CA006 t WHERE LLP_BCA_REF_NUM = t.TRADE_ACCT_NO 
			and LLP_LE_ID = CIF_ID
			and (outer_limit_id IS NULL OR outer_limit_id = '' OR outer_limit_id = limit_id) 
			and SOURCE_ID='TSPR' 
			AND t.is_valid = 'Y'
			group by CIF_ID,TRADE_ACCT_NO,BUSINESS_UNIT,ISLAMIC_FLAG,ORI_LOC_COUNTRY,ORG_LOC_ORG)
	  WHERE cms_lsp_lmt_profile_id IN (SELECT staging_reference_id
										 FROM transaction
										WHERE transaction_type = 'LIMITPROFILE'
										  AND reference_id IN (SELECT cms_lsp_lmt_profile_id 
										  						 FROM sci_lsp_lmt_profile a, 
										  						 	  SI_TEMP_TSPR_CA006
										   						WHERE a.llp_bca_ref_num = TRADE_ACCT_NO
										   						  AND a.llp_le_id = cif_id
																		and (outer_limit_id IS NULL OR outer_limit_id = '' OR outer_limit_id = limit_id) 
										   						  AND a.source_id = 'TSPR' AND is_valid = 'Y'))
		and source_id='TSPR';
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 4);
		COMMIT;

		INSERT INTO STAGE_LIMIT_PROFILE(
		CMS_LSP_LMT_PROFILE_ID,
		LLP_LE_ID,
		LLP_BCA_REF_NUM,
		LLP_SEGMENT_CODE_VALUE,
		ISLAMIC_FLAG,
		CMS_CUSTOMER_ID,
		CMS_BCA_STATUS,
		CMS_ORIG_COUNTRY,
		CMS_ORIG_ORGANISATION,
		CMS_BCA_COMPLETE_IND,
		SOURCE_ID,
		LMT_PROFILE_TYPE,
		UPDATE_STATUS_IND
		)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR LIMIT_PROFILE_SEQ), 2)) as BIGINT),
		CIF_ID,
		TRADE_ACCT_NO,
		BUSINESS_UNIT,
		ISLAMIC_FLAG,
		(select b.CMS_LE_SUB_PROFILE_ID from sci_le_sub_profile b, sci_le_main_profile a 
			where b.CMS_LE_MAIN_PROFILE_ID=a.CMS_LE_MAIN_PROFILE_ID and a.SOURCE_ID='TSPR' and a.LMP_LE_ID=t.CIF_ID),
		'ACTIVE',
		ORI_LOC_COUNTRY,
		ORG_LOC_ORG,
		'N',
		'TSPR',
		'BANKING',
		'I'
 		FROM SI_TEMP_TSPR_CA006 t WHERE NOT EXISTS 
			(SELECT 1 FROM STAGE_LIMIT_PROFILE WHERE LLP_BCA_REF_NUM = t.TRADE_ACCT_NO 
			and LLP_LE_ID = CIF_ID
			and SOURCE_ID='TSPR')
		and (outer_limit_id IS NULL OR outer_limit_id = '' OR outer_limit_id = limit_id) 
		AND t.is_valid = 'Y'
		group by CIF_ID,TRADE_ACCT_NO,BUSINESS_UNIT,ISLAMIC_FLAG,ORI_LOC_COUNTRY,ORG_LOC_ORG);
			
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 5);
		commit;
		
		-----------------------------------
		-- Actual table for outer limit
		-- SCI_LSP_APPR_LMTS
		-----------------------------------
		
		UPDATE SCI_LSP_APPR_LMTS SET(
		CMS_LIMIT_PROFILE_ID,
		LMT_LE_ID,
		LMT_ID,
		LMT_EXPRY_DATE,
		CMS_BKG_COUNTRY,
		CMS_BKG_ORGANISATION,
		LMT_OMNIBUS_IND,
		LMT_PRD_TYPE_VALUE,
		LMT_CRRNCY_ISO_CODE,
		LMT_AMT,
		LMT_TENOR,
		LMT_TENOR_BASIS_VALUE,
		CMS_ACTIVATED_LIMIT,
		CMS_OUTSTANDING_AMT,
		LMT_DESC,
		LMT_PRD_TYPE_NUM,
		LMT_TYPE_NUM,
		LMT_TYPE_VALUE,
		CMS_LIMIT_STATUS,
		SOURCE_ID,
		--CMS_OUTER_LMT_REF,
		LMT_BCA_REF_NUM,
		DISBURSED_IND,
		LMT_LOAN_SECTOR_NUM,
		LMT_LOAN_SECTOR_VALUE,
		UPDATE_STATUS_IND)=
		(SELECT CMS_LSP_LMT_PROFILE_ID,
		CIF_ID,
		LIMIT_ID,
		EXPIRY_MATURITY_DATE,
		ORI_LOC_COUNTRY,
		ORG_LOC_ORG,
		OMNIBUS_IND,
		PRODUCT_TYPE_CODE,
		LIMIT_CURRENCY,
		LIMIT_AMT,
		LIMITTENOR,
		LIMIT_TENOR_UOM,
		DRAWING_ACTIVATED_LIMIT_AMT,
		OUTSTANDING_AMT,
		LIMIT_DESC,
		'27','25','OUTER',
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END),
		'TSPR',
		--t.OUTER_LIMIT_ID,
		TRADE_ACCT_NO,
		t.DISBURSED_IND,
		'17',
		t.SECTORIAL_CODE,
		t.UPDATE_STAT_IND
 		FROM SI_TEMP_TSPR_CA006 t, SCI_LSP_LMT_PROFILE 
			where LLP_BCA_REF_NUM=t.TRADE_ACCT_NO 
				and SOURCE_ID='TSPR'
				and LMT_ID = t.LIMIT_ID
				and t.is_valid = 'Y')
		WHERE EXISTS (SELECT 1 FROM SI_TEMP_TSPR_CA006 t
				where t.LIMIT_ID=LMT_ID and t.is_valid = 'Y')
		AND LMT_TYPE_VALUE = 'OUTER'
		AND SOURCE_ID = 'TSPR';  

		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 6);
		COMMIT;
	------------------------------------------
	-- Update Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
	    							      
	FOR cur_lmt_key AS
		SELECT cms_lsp_appr_lmts_id trx_ref_id, 'LIMIT' trx_type
		  FROM sci_lsp_appr_lmts a
		 WHERE EXISTS (SELECT '1' FROM SI_TEMP_TSPR_CA006
	  				 	WHERE a.lmt_id = limit_id
	  				   	  AND cms_limit_profile_id = (SELECT cms_lsp_lmt_profile_id FROM sci_lsp_lmt_profile
			  										   WHERE llp_bca_ref_num = TRADE_ACCT_NO
															 	and LLP_LE_ID = CIF_ID
			  										  	 AND source_id = 'TSPR'
			  										   FETCH FIRST 1 ROW ONLY)
			  		   	  AND is_valid = 'Y')
			 and source_id = 'TSPR'
		   AND cms_outer_lmt_ref IS NULL
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_lmt_key.trx_ref_id, cur_lmt_key.trx_type);
	END FOR;
	
	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 7);
	COMMIT;
	
	INSERT INTO SCI_LSP_APPR_LMTS(
		CMS_LSP_APPR_LMTS_ID,
		CMS_LIMIT_PROFILE_ID,
		LMT_LE_ID,
		LMT_ID,
		LMT_EXPRY_DATE,
		CMS_BKG_COUNTRY,
		CMS_BKG_ORGANISATION,
		LMT_OMNIBUS_IND,
		LMT_PRD_TYPE_VALUE,
		LMT_CRRNCY_ISO_CODE,
		LMT_AMT,
		LMT_TENOR,
		LMT_TENOR_BASIS_VALUE,
		CMS_ACTIVATED_LIMIT,
		CMS_OUTSTANDING_AMT,
		LMT_DESC,
		LMT_PRD_TYPE_NUM,
		LMT_TYPE_NUM,
		LMT_TYPE_VALUE,
		CMS_LIMIT_STATUS,
		SOURCE_ID,
		--CMS_OUTER_LMT_REF,
		LMT_BCA_REF_NUM,
		CMS_REF_ID,
		DISBURSED_IND,
		LMT_LOAN_SECTOR_NUM,
		LMT_LOAN_SECTOR_VALUE,
		UPDATE_STATUS_IND
		)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR LIMIT_SEQ), 2)) as BIGINT), 
		CMS_LSP_LMT_PROFILE_ID,
		CIF_ID,
		LIMIT_ID,
		EXPIRY_MATURITY_DATE,
		ORI_LOC_COUNTRY,
		ORG_LOC_ORG,
		OMNIBUS_IND,
		PRODUCT_TYPE_CODE,
		LIMIT_CURRENCY,
		LIMIT_AMT,
		LIMITTENOR,
		LIMIT_TENOR_UOM,
		DRAWING_ACTIVATED_LIMIT_AMT,
		OUTSTANDING_AMT,
		LIMIT_DESC,
		'27','25','OUTER','ACTIVE','TSPR',
		--t.OUTER_LIMIT_ID,
		trade_acct_no,
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR LIMIT_SEQ), 2)) as BIGINT),
		t.DISBURSED_IND,
		'17',
		t.SECTORIAL_CODE,
		t.UPDATE_STAT_IND
 		FROM SI_TEMP_TSPR_CA006 t, SCI_LSP_LMT_PROFILE 
			where LLP_BCA_REF_NUM=t.TRADE_ACCT_NO 
				and SOURCE_ID='TSPR'
				and outer_limit_id = limit_id
				and t.is_valid = 'Y'
				and NOT EXISTS (SELECT 1 FROM SCI_LSP_APPR_LMTS WHERE LMT_ID = t.LIMIT_ID and SOURCE_ID='TSPR'));
	
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 8);
		COMMIT;
		
		-----------------------------------
		-- Actual table for inner limit
		-- SCI_LSP_APPR_LMTS
		-----------------------------------
		
		UPDATE SCI_LSP_APPR_LMTS a SET(
		CMS_LIMIT_PROFILE_ID,
		LMT_LE_ID,
		LMT_ID,
		LMT_EXPRY_DATE,
		CMS_BKG_COUNTRY,
		CMS_BKG_ORGANISATION,
		LMT_OMNIBUS_IND,
		LMT_PRD_TYPE_VALUE,
		LMT_CRRNCY_ISO_CODE,
		LMT_AMT,
		LMT_TENOR,
		LMT_TENOR_BASIS_VALUE,
		CMS_ACTIVATED_LIMIT,
		CMS_OUTSTANDING_AMT,
		LMT_DESC,
		LMT_PRD_TYPE_NUM,
		LMT_TYPE_NUM,
		LMT_TYPE_VALUE,
		CMS_LIMIT_STATUS,
		SOURCE_ID,
		LMT_OUTER_LMT_ID,
		CMS_OUTER_LMT_REF,
		LMT_BCA_REF_NUM,
		DISBURSED_IND,
		LMT_LOAN_SECTOR_NUM,
		LMT_LOAN_SECTOR_VALUE,
		UPDATE_STATUS_IND)=
		(SELECT b.CMS_LIMIT_PROFILE_ID,
		CIF_ID,
		LIMIT_ID,
		EXPIRY_MATURITY_DATE,
		ORI_LOC_COUNTRY,
		ORG_LOC_ORG,
		OMNIBUS_IND,
		PRODUCT_TYPE_CODE,
		LIMIT_CURRENCY,
		LIMIT_AMT,
		LIMITTENOR,
		LIMIT_TENOR_UOM,
		DRAWING_ACTIVATED_LIMIT_AMT,
		OUTSTANDING_AMT,
		LIMIT_DESC,
		'27','25','INNER',
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END),
		'TSPR',
		b.CMS_LSP_APPR_LMTS_ID,
		OUTER_LIMIT_ID,
		TRADE_ACCT_NO,
		t.DISBURSED_IND,
		'17',
		t.SECTORIAL_CODE,
		t.UPDATE_STAT_IND
 		FROM SI_TEMP_TSPR_CA006 t, SCI_LSP_APPR_LMTS b
			where b.LMT_ID=t.OUTER_LIMIT_ID AND b.SOURCE_ID='TSPR'
			and t.is_valid = 'Y'
			and a.LMT_ID = t.LIMIT_ID)
		WHERE EXISTS(SELECT 1 FROM SI_TEMP_TSPR_CA006 t
			where t.LIMIT_ID=a.LMT_ID
				and t.is_valid = 'Y')
		AND LMT_TYPE_VALUE = 'INNER'
		AND SOURCE_ID = 'TSPR';
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 9);
		COMMIT;
  
	------------------------------------------
	-- Update Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
	    							      
	FOR cur_lmt_key AS
		SELECT cms_lsp_appr_lmts_id trx_ref_id, 'LIMIT' trx_type
		  FROM sci_lsp_appr_lmts a
		 WHERE EXISTS (SELECT '1' FROM SI_TEMP_TSPR_CA006
	  				 	WHERE a.lmt_id = limit_id
	  				   	  AND cms_limit_profile_id = (SELECT cms_lsp_lmt_profile_id FROM sci_lsp_lmt_profile
			  										   WHERE llp_bca_ref_num = TRADE_ACCT_NO
															 	and LLP_LE_ID = CIF_ID
			  										  	 AND source_id = 'TSPR'
			  										   FETCH FIRST 1 ROW ONLY)
			  		   	  AND is_valid = 'Y')
		 and a.source_id = 'TSPR'
	   AND cms_outer_lmt_ref IS NOT NULL
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_lmt_key.trx_ref_id, cur_lmt_key.trx_type);
	END FOR;

	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 10);
	COMMIT;
	
	INSERT INTO SCI_LSP_APPR_LMTS(
		CMS_LSP_APPR_LMTS_ID,
		CMS_LIMIT_PROFILE_ID,
		LMT_LE_ID,
		LMT_ID,
		LMT_EXPRY_DATE,
		CMS_BKG_COUNTRY,
		CMS_BKG_ORGANISATION,
		LMT_OMNIBUS_IND,
		LMT_PRD_TYPE_VALUE,
		LMT_CRRNCY_ISO_CODE,
		LMT_AMT,
		LMT_TENOR,
		LMT_TENOR_BASIS_VALUE,
		CMS_ACTIVATED_LIMIT,
		CMS_OUTSTANDING_AMT,
		LMT_DESC,
		LMT_PRD_TYPE_NUM,
		LMT_TYPE_NUM,
		LMT_TYPE_VALUE,
		CMS_LIMIT_STATUS,
		SOURCE_ID,
		LMT_OUTER_LMT_ID,
		CMS_OUTER_LMT_REF,
		LMT_BCA_REF_NUM,
		CMS_REF_ID,
		DISBURSED_IND,
		LMT_LOAN_SECTOR_NUM,
		LMT_LOAN_SECTOR_VALUE,
		UPDATE_STATUS_IND
		)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR LIMIT_SEQ), 2)) as BIGINT), 
		b.CMS_LIMIT_PROFILE_ID,
		CIF_ID,
		LIMIT_ID,
		EXPIRY_MATURITY_DATE,
		ORI_LOC_COUNTRY,
		ORG_LOC_ORG,
		OMNIBUS_IND,
		PRODUCT_TYPE_CODE,
		LIMIT_CURRENCY,
		LIMIT_AMT,
		LIMITTENOR,
		LIMIT_TENOR_UOM,
		DRAWING_ACTIVATED_LIMIT_AMT,
		OUTSTANDING_AMT,
		LIMIT_DESC,
		'27','25','INNER','ACTIVE','TSPR',
		b.CMS_LSP_APPR_LMTS_ID,
		OUTER_LIMIT_ID,
		trade_acct_no,
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR LIMIT_SEQ), 2)) as BIGINT),
		t.DISBURSED_IND,
		'17',
		t.SECTORIAL_CODE,
		t.UPDATE_STAT_IND
 		FROM SI_TEMP_TSPR_CA006 t, SCI_LSP_APPR_LMTS b
			where b.LMT_ID=t.OUTER_LIMIT_ID 
				and b.SOURCE_ID='TSPR'
				and t.is_valid = 'Y'
				and t.OUTER_LIMIT_ID<>t.LIMIT_ID
				and NOT EXISTS (SELECT 1 FROM SCI_LSP_APPR_LMTS WHERE LMT_ID = t.LIMIT_ID and SOURCE_ID='TSPR'));
			
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 11);
		commit;
		
		------------------------------------
		-- Staging table for Outer limit
		-- STAGE_LIMIT
		--
		------------------------------------
		
		UPDATE STAGE_LIMIT a SET(
		CMS_LIMIT_PROFILE_ID,
		LMT_LE_ID,
		LMT_ID,
		LMT_EXPRY_DATE,
		CMS_BKG_COUNTRY,
		CMS_BKG_ORGANISATION,
		LMT_OMNIBUS_IND,
		LMT_PRD_TYPE_VALUE,
		LMT_CRRNCY_ISO_CODE,
		LMT_AMT,
		LMT_TENOR,
		LMT_TENOR_BASIS_VALUE,
		CMS_ACTIVATED_LIMIT,
		CMS_OUTSTANDING_AMT,
		LMT_DESC,
		SOURCE_ID,
		LMT_BCA_REF_NUM,
		CMS_LIMIT_STATUS,
		DISBURSED_IND,
		LMT_LOAN_SECTOR_NUM,
		LMT_LOAN_SECTOR_VALUE,
		UPDATE_STATUS_IND)=
		(SELECT CMS_LSP_LMT_PROFILE_ID,
		CIF_ID,
		LIMIT_ID,
		EXPIRY_MATURITY_DATE,
		ORI_LOC_COUNTRY,
		ORG_LOC_ORG,
		OMNIBUS_IND,
		PRODUCT_TYPE_CODE,
		LIMIT_CURRENCY,
		LIMIT_AMT,
		LIMITTENOR,
		LIMIT_TENOR_UOM,
		DRAWING_ACTIVATED_LIMIT_AMT,
		OUTSTANDING_AMT,
		LIMIT_DESC,
		'TSPR',
		TRADE_ACCT_NO,
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END),
		t.DISBURSED_IND,
		'17',
		t.SECTORIAL_CODE,
		t.UPDATE_STAT_IND
 		FROM SI_TEMP_TSPR_CA006 t, SCI_LSP_LMT_PROFILE b 
			where b.LLP_BCA_REF_NUM=t.TRADE_ACCT_NO 
			and b.SOURCE_ID='TSPR'
			and a.LMT_ID = t.LIMIT_ID 
			and t.is_valid = 'Y')
		where CMS_LSP_APPR_LMTS_ID IN (SELECT staging_reference_id
									   FROM transaction
									  WHERE transaction_type = 'LIMIT'
										AND reference_id IN
										(SELECT cms_lsp_appr_lmts_id
									     FROM sci_lsp_appr_lmts lmt, si_temp_tspr_ca006 t
										  WHERE lmt.lmt_id = t.LIMIT_ID
											and lmt.source_id = 'TSPR'
											and t.IS_VALID='Y'))
		AND LMT_TYPE_VALUE = 'OUTER'
		and source_id='TSPR';	

		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 12);
		COMMIT;
		
		INSERT INTO STAGE_LIMIT(
		CMS_LSP_APPR_LMTS_ID,
		CMS_LIMIT_PROFILE_ID,
		LMT_LE_ID,
		LMT_ID,
		LMT_EXPRY_DATE,
		CMS_BKG_COUNTRY,
		CMS_BKG_ORGANISATION,
		LMT_OMNIBUS_IND,
		LMT_PRD_TYPE_VALUE,
		LMT_CRRNCY_ISO_CODE,
		LMT_AMT,
		LMT_TENOR,
		LMT_TENOR_BASIS_VALUE,
		CMS_ACTIVATED_LIMIT,
		CMS_OUTSTANDING_AMT,
		LMT_DESC,
		LMT_PRD_TYPE_NUM,
		LMT_TYPE_NUM,
		LMT_TYPE_VALUE,
		CMS_LIMIT_STATUS,
		SOURCE_ID,
		LMT_BCA_REF_NUM,
		DISBURSED_IND,
		LMT_LOAN_SECTOR_NUM,
		LMT_LOAN_SECTOR_VALUE,
		UPDATE_STATUS_IND
		)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR LIMIT_SEQ), 2)) as BIGINT), 
		CMS_LSP_LMT_PROFILE_ID,
		CIF_ID,
		LIMIT_ID,
		EXPIRY_MATURITY_DATE,
		ORI_LOC_COUNTRY,
		ORG_LOC_ORG,
		OMNIBUS_IND,
		PRODUCT_TYPE_CODE,
		LIMIT_CURRENCY,
		LIMIT_AMT,
		LIMITTENOR,
		LIMIT_TENOR_UOM,
		DRAWING_ACTIVATED_LIMIT_AMT,
		OUTSTANDING_AMT,
		LIMIT_DESC,
		'27','25','OUTER','ACTIVE','TSPR',
		trade_acct_no,
		t.DISBURSED_IND,
		'17',
		t.SECTORIAL_CODE,
		t.UPDATE_STAT_IND
 		FROM SI_TEMP_TSPR_CA006 t, SCI_LSP_LMT_PROFILE 
			where LLP_BCA_REF_NUM=t.TRADE_ACCT_NO 
			and SOURCE_ID='TSPR'
			and t.outer_limit_id = t.limit_id 
			and NOT EXISTS (SELECT 1 FROM STAGE_LIMIT WHERE LMT_ID = t.LIMIT_ID and SOURCE_ID='TSPR')
			AND t.is_valid = 'Y');
			
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 13);
		commit;
		
		---------------------------------------
		-- Staging table for inner limit
		-- STAGE_LIMIT
		--
		--------------------------------------	

		UPDATE STAGE_LIMIT a SET(
		CMS_LIMIT_PROFILE_ID,
		LMT_LE_ID,
		LMT_ID,
		LMT_EXPRY_DATE,
		CMS_BKG_COUNTRY,
		CMS_BKG_ORGANISATION,
		LMT_OMNIBUS_IND,
		LMT_PRD_TYPE_VALUE,
		LMT_CRRNCY_ISO_CODE,
		LMT_AMT,
		LMT_TENOR,
		LMT_TENOR_BASIS_VALUE,
		CMS_ACTIVATED_LIMIT,
		CMS_OUTSTANDING_AMT,
		LMT_DESC,
		LMT_PRD_TYPE_NUM,
		LMT_TYPE_NUM,
		CMS_LIMIT_STATUS,
		SOURCE_ID,
		LMT_OUTER_LMT_ID,
		CMS_OUTER_LMT_REF,
		LMT_BCA_REF_NUM,
		DISBURSED_IND,
		LMT_LOAN_SECTOR_NUM,
		LMT_LOAN_SECTOR_VALUE,
		UPDATE_STATUS_IND)=
		(SELECT b.CMS_LIMIT_PROFILE_ID,
		CIF_ID,
		LIMIT_ID,
		EXPIRY_MATURITY_DATE,
		ORI_LOC_COUNTRY,
		ORG_LOC_ORG,
		OMNIBUS_IND,
		PRODUCT_TYPE_CODE,
		LIMIT_CURRENCY,
		LIMIT_AMT,
		LIMITTENOR,
		LIMIT_TENOR_UOM,
		DRAWING_ACTIVATED_LIMIT_AMT,
		OUTSTANDING_AMT,
		LIMIT_DESC,
		'27','25',
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END),
		'TSPR',
		b.CMS_LSP_APPR_LMTS_ID,
		OUTER_LIMIT_ID,
		TRADE_ACCT_NO,
		t.DISBURSED_IND,
		'17',
		t.SECTORIAL_CODE,
		t.UPDATE_STAT_IND
 		FROM SI_TEMP_TSPR_CA006 t, stage_limit b
			where b.LMT_ID=t.OUTER_LIMIT_ID
				and b.SOURCE_ID='TSPR'
				and t.is_valid = 'Y' 
				and t.LIMIT_ID = a.LMT_ID
				and b.CMS_LSP_APPR_LMTS_ID IN (SELECT staging_reference_id
									   FROM transaction
									  WHERE transaction_type = 'LIMIT'
										AND reference_id IN
										(SELECT cms_lsp_appr_lmts_id
									     FROM sci_lsp_appr_lmts lmt
										  WHERE lmt.lmt_id = t.OUTER_LIMIT_ID
											and lmt.source_id = 'TSPR'))
		)
	 	WHERE CMS_LSP_APPR_LMTS_ID IN (SELECT staging_reference_id
									   FROM transaction
									  WHERE transaction_type = 'LIMIT'
										AND reference_id IN
										(SELECT cms_lsp_appr_lmts_id
									     FROM sci_lsp_appr_lmts lmt, si_temp_tspr_ca006 t
										  WHERE lmt.lmt_id = t.LIMIT_ID
											and lmt.source_id = 'TSPR'
											and t.IS_VALID = 'Y'))
		and LMT_TYPE_VALUE = 'INNER'
		and source_id='TSPR';	

		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 14);
		COMMIT;
		
		INSERT INTO STAGE_LIMIT(
		CMS_LSP_APPR_LMTS_ID,
		CMS_LIMIT_PROFILE_ID,
		LMT_OUTER_LMT_ID,
		LMT_LE_ID,
		LMT_ID,
		CMS_OUTER_LMT_REF,
		LMT_EXPRY_DATE,
		CMS_BKG_COUNTRY,
		CMS_BKG_ORGANISATION,
		LMT_OMNIBUS_IND,
		LMT_PRD_TYPE_VALUE,
		LMT_CRRNCY_ISO_CODE,
		LMT_AMT,
		LMT_TENOR,
		LMT_TENOR_BASIS_VALUE,
		CMS_ACTIVATED_LIMIT,
		CMS_OUTSTANDING_AMT,
		LMT_DESC,
		LMT_PRD_TYPE_NUM,
		LMT_TYPE_NUM,
		LMT_TYPE_VALUE,
		CMS_LIMIT_STATUS,
		SOURCE_ID,
		LMT_BCA_REF_NUM,
		DISBURSED_IND,
		LMT_LOAN_SECTOR_NUM,
		LMT_LOAN_SECTOR_VALUE,
		UPDATE_STATUS_IND)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR LIMIT_SEQ), 2)) as BIGINT), 
		b.CMS_LIMIT_PROFILE_ID,
		b.CMS_LSP_APPR_LMTS_ID,
		CIF_ID,
		LIMIT_ID,
		OUTER_LIMIT_ID,
		EXPIRY_MATURITY_DATE,
		ORI_LOC_COUNTRY,
		ORG_LOC_ORG,
		OMNIBUS_IND,
		PRODUCT_TYPE_CODE,
		LIMIT_CURRENCY,
		LIMIT_AMT,
		LIMITTENOR,
		LIMIT_TENOR_UOM,
		DRAWING_ACTIVATED_LIMIT_AMT,
		OUTSTANDING_AMT,
		LIMIT_DESC,
		'27','25','INNER','ACTIVE','TSPR',
		trade_acct_no,
		t.DISBURSED_IND,
		'17',
		t.SECTORIAL_CODE,
		t.UPDATE_STAT_IND
 		FROM SI_TEMP_TSPR_CA006 t, stage_limit b
			where b.LMT_ID=t.OUTER_LIMIT_ID 
				and b.SOURCE_ID='TSPR'
				and t.is_valid = 'Y'
				and t.outer_limit_id <> t.limit_id
				and NOT EXISTS (SELECT 1 FROM STAGE_LIMIT WHERE LMT_ID = t.LIMIT_ID and SOURCE_ID='TSPR'));
			
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 15);
		commit;
		
		-----------------------
		-- Actual table
		-- CMS_TRADE_COMMISSION
		--
		------------------------
		
		UPDATE CMS_TRADE_COMMISSION b SET(
		CMS_LSP_APPR_LMTS_ID,
		COMMISSION_TYPE,
		COMMISSION_TIER_TYPE,
		COMMISSION_RATE)=
		(select a.CMS_LSP_APPR_LMTS_ID,
		COMMISSION_TYPE,
		TIER_TYPE,
		COMMISSION_RATE
		FROM SI_TEMP_TSPR_CA006 t, SCI_LSP_APPR_LMTS a 
			where a.LMT_ID = t.LIMIT_ID and a.SOURCE_ID='TSPR'
			and a.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID
			and t.is_valid = 'Y')
		WHERE EXISTS (SELECT 1 FROM SI_TEMP_TSPR_CA006 t, SCI_LSP_APPR_LMTS a 
			where a.LMT_ID = t.LIMIT_ID and a.SOURCE_ID='TSPR'
			and a.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID
			and t.is_valid = 'Y');
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 16);
		COMMIT;
		
		INSERT INTO CMS_TRADE_COMMISSION(
		CMS_TRADE_COMMISSION_ID,
		CMS_LSP_APPR_LMTS_ID,
		COMMISSION_TYPE,
		COMMISSION_TIER_TYPE,
		COMMISSION_RATE)
		(select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_TRADE_COMMISSION_SEQ), 2)) as BIGINT),
		a.CMS_LSP_APPR_LMTS_ID,
		COMMISSION_TYPE,
		TIER_TYPE,
		COMMISSION_RATE
		FROM SI_TEMP_TSPR_CA006 t, SCI_LSP_APPR_LMTS a 
			where a.LMT_ID = t.LIMIT_ID and a.SOURCE_ID='TSPR'
			and NOT EXISTS 
			(SELECT 1 FROM SCI_LSP_APPR_LMTS a, CMS_TRADE_COMMISSION b 
				where a.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID 
				and a.SOURCE_ID='TSPR'
				and a.LMT_ID = t.LIMIT_ID)
			and t.IS_VALID='Y');
			
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 17);
		commit;
		
		-----------------------------------
		-- Actual table
		-- CMS_TRADE_LIMIT
		--
		------------------------------------
		
		UPDATE CMS_TRADE_LIMIT b SET(
		TRADE_ACCT_SEQ,
		REVOLVING_IND,
		PRODUCT_INSTRUCTION,
		REVIEW_DATE,
		TEMPORARY_LINE,
		AUTO_PURGE_FLAG,
		LOAN_PURPOSE_CODE_VALUE,
		BROAD_PROP_SEC_EXEMPTION_FLAG,
		LOAN_SEC_MATRIX_CODE_VALUE,
		SECTORIAL_CODE_VALUE)=
		(select TRADE_ACCT_SEQ,
		REVOLVING_IND,
		PRODUCT_INSTRUCTION,
		REVIEW_DATE,
		TEMPORARY_LINE,
		AUTO_PURGE_FLAG,
		LOAN_PURPOSE_CODE,
		BROAD_PROPERTY_SECTOR_EXEMPTIO,
		LOAN_SECURITY_MATRIX_CODE_,
		SECTORIAL_CODE
		FROM SI_TEMP_TSPR_CA006 t, SCI_LSP_APPR_LMTS a 
			WHERE	t.is_valid='Y'
				and a.source_id='TSPR'
				and a.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID 
				and a.LMT_ID = t.LIMIT_ID)
			WHERE EXISTS (SELECT 1 FROM SI_TEMP_TSPR_CA006 t, SCI_LSP_APPR_LMTS a 
				WHERE t.is_valid='Y'
					and a.source_id='TSPR'
					and a.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID 
					and a.LMT_ID = t.LIMIT_ID);

		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 18);
		commit;
		
		INSERT INTO CMS_TRADE_LIMIT(
		CMS_LSP_APPR_LMTS_ID,
		TRADE_ACCT_SEQ,
		REVOLVING_IND,
		PRODUCT_INSTRUCTION,
		REVIEW_DATE,
		TEMPORARY_LINE,
		AUTO_PURGE_FLAG,
		LOAN_PURPOSE_CODE_VALUE,
		BROAD_PROP_SEC_EXEMPTION_FLAG,
		LOAN_SEC_MATRIX_CODE_VALUE,
		SECTORIAL_CODE_VALUE)
		(select lmts.CMS_LSP_APPR_LMTS_ID,
		TRADE_ACCT_SEQ,
		REVOLVING_IND,
		PRODUCT_INSTRUCTION,
		REVIEW_DATE,
		TEMPORARY_LINE,
		AUTO_PURGE_FLAG,
		LOAN_PURPOSE_CODE,
		BROAD_PROPERTY_SECTOR_EXEMPTIO,
		LOAN_SECURITY_MATRIX_CODE_,
		SECTORIAL_CODE
		FROM SI_TEMP_TSPR_CA006 t, SCI_LSP_APPR_LMTS lmts 
		WHERE t.is_valid='Y' AND lmts.LMT_ID = t.LIMIT_ID and lmts.SOURCE_ID='TSPR'
		AND NOT EXISTS
			(SELECT 1 FROM SCI_LSP_APPR_LMTS a, CMS_TRADE_LIMIT b 
				WHERE a.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID and a.LMT_ID = t.LIMIT_ID and a.SOURCE_ID = 'TSPR'));
			
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 19);
		commit;
		
		-----------------------------
		-- Update/Insert table
		-- SCI_LSP_SYS_XREF
		--
		-----------------------------
		
		UPDATE SCI_LSP_SYS_XREF SET(
			LSX_EXT_SYS_CODE_VALUE,
			LSX_EXT_SYS_ACCT_NUM,
			LSX_EXT_SYS_ACCT_SEQ,
			LSX_EXT_SYS_CUST_ID,
			ACCOUNT_DESC_VALUE,
			CMS_LE_SUB_PROFILE_ID,
			LSX_BCA_REF_NUM,
			LSX_LMT_ID,
			LSX_LE_ID,
			LSX_BKG_LOCTN_CTRY, 
			LSX_BKG_LOCTN_ORG,
			LSX_LSP_ID,
			UPDATE_STATUS_IND,
			ACCT_STATUS)=
		(select 'TSPR',
			t.TRADE_ACCT_NO,
			t.TRADE_ACCT_SEQ,
			t.CIF_ID,
			ACCT_DESC_CODE,
			(select b.CMS_LE_SUB_PROFILE_ID from sci_le_sub_profile b, sci_le_main_profile a 
				where b.CMS_LE_MAIN_PROFILE_ID=a.CMS_LE_MAIN_PROFILE_ID and a.SOURCE_ID='TSPR' and a.LMP_LE_ID=t.CIF_ID),
			t.TRADE_ACCT_NO,
			t.LIMIT_ID,
			t.CIF_ID,
			t.ORI_LOC_COUNTRY,
			t.ORG_LOC_ORG,
			1,
			t.UPDATE_STAT_IND,
			(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'D' ELSE 'A' END)
		FROM SI_TEMP_TSPR_CA006 t WHERE LSX_EXT_SYS_ACCT_NUM = t.TRADE_ACCT_NO
			and LSX_EXT_SYS_ACCT_SEQ = t.TRADE_ACCT_SEQ
			and LSX_LMT_ID=t.LIMIT_ID
			and LSX_EXT_SYS_CODE_VALUE='TSPR' AND t.is_valid = 'Y')
			WHERE EXISTS (SELECT 1 FROM SI_TEMP_TSPR_CA006 t WHERE LSX_EXT_SYS_ACCT_NUM = t.TRADE_ACCT_NO
				and LSX_EXT_SYS_ACCT_SEQ = t.TRADE_ACCT_SEQ
				and LSX_LMT_ID=t.LIMIT_ID
				and LSX_EXT_SYS_CODE_VALUE='TSPR' AND t.is_valid = 'Y');
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 20);
		commit;
		
		INSERT INTO SCI_LSP_SYS_XREF(
			CMS_LSP_SYS_XREF_ID,
			LSX_EXT_SYS_CODE_VALUE,
			LSX_EXT_SYS_ACCT_NUM,
			LSX_EXT_SYS_ACCT_SEQ,
			LSX_EXT_SYS_CUST_ID,
			ACCOUNT_DESC_VALUE,
			CMS_LE_SUB_PROFILE_ID,
			LSX_BCA_REF_NUM,
			LSX_LMT_ID,
			LSX_LE_ID,
			LSX_BKG_LOCTN_CTRY, 
			LSX_BKG_LOCTN_ORG,
			LSX_LSP_ID,
			ACCT_DELQ_IND,
			UPDATE_STATUS_IND,
			ACCT_STATUS)
		(select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CUSTOMER_X_REF_SEQ), 2)) as BIGINT),
			'TSPR',
			t.TRADE_ACCT_NO,
			t.TRADE_ACCT_SEQ,
			t.CIF_ID,
			ACCT_DESC_CODE,
			(select b.CMS_LE_SUB_PROFILE_ID from sci_le_sub_profile b, sci_le_main_profile a 
				where b.CMS_LE_MAIN_PROFILE_ID=a.CMS_LE_MAIN_PROFILE_ID and a.SOURCE_ID='TSPR' and a.LMP_LE_ID=t.CIF_ID),
			t.TRADE_ACCT_NO,
			t.LIMIT_ID,
			t.CIF_ID,
			t.ORI_LOC_COUNTRY,
			t.ORG_LOC_ORG,
			1,
			'N',
			t.UPDATE_STAT_IND,
			'A'
		FROM SI_TEMP_TSPR_CA006 t WHERE NOT EXISTS 
		(SELECT 1 FROM SCI_LSP_SYS_XREF WHERE 
			LSX_EXT_SYS_ACCT_NUM = t.TRADE_ACCT_NO 
			and LSX_EXT_SYS_ACCT_SEQ = t.TRADE_ACCT_SEQ
			and LSX_EXT_SYS_CODE_VALUE='TSPR'
			and LSX_LMT_ID=t.LIMIT_ID)
		AND t.is_valid = 'Y');
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 21);
		commit;
		
		-----------------------------
		-- Update/Insert table
		-- CMS_STAGE_LSP_SYS_XREF
		--
		-----------------------------
		
		UPDATE CMS_STAGE_LSP_SYS_XREF s SET(
			LSX_EXT_SYS_CODE_VALUE,
			LSX_EXT_SYS_ACCT_NUM,
			lsx_ext_sys_acct_seq,
			LSX_EXT_SYS_CUST_ID,
			ACCOUNT_DESC_VALUE,
			CMS_LE_SUB_PROFILE_ID,
			LSX_BCA_REF_NUM,
			LSX_LMT_ID,
			LSX_LE_ID,
			LSX_BKG_LOCTN_CTRY, 
			LSX_BKG_LOCTN_ORG,
			LSX_LSP_ID,
			UPDATE_STATUS_IND,
			ACCT_STATUS)=
		(select 'TSPR',
			t.TRADE_ACCT_NO,
			t.TRADE_ACCT_SEQ,
			t.CIF_ID,
			ACCT_DESC_CODE,
			(select b.CMS_LE_SUB_PROFILE_ID from sci_le_sub_profile b, sci_le_main_profile a 
				where b.CMS_LE_MAIN_PROFILE_ID=a.CMS_LE_MAIN_PROFILE_ID and a.SOURCE_ID='TSPR' and a.LMP_LE_ID=t.CIF_ID),
			t.TRADE_ACCT_NO,
			t.LIMIT_ID,
			t.CIF_ID,
			t.ORI_LOC_COUNTRY,
			t.ORG_LOC_ORG,
			1,
			t.UPDATE_STAT_IND,
			(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'D' ELSE 'A' END)
		FROM SI_TEMP_TSPR_CA006 t WHERE LSX_EXT_SYS_ACCT_NUM = t.TRADE_ACCT_NO
			and LSX_EXT_SYS_ACCT_SEQ = t.TRADE_ACCT_SEQ
			and LSX_LMT_ID=t.LIMIT_ID
			and LSX_EXT_SYS_CODE_VALUE='TSPR' AND t.is_valid = 'Y')
		WHERE exists (select '1'
			from SI_TEMP_TSPR_CA006 t
			where lsx_ext_sys_acct_num = t.TRADE_ACCT_NO
			and lsx_ext_sys_acct_seq = t.TRADE_ACCT_SEQ
			and LSX_LMT_ID=t.LIMIT_ID
			and lsx_ext_sys_code_value = 'TSPR'
			and exists (select '1'
						from stage_limit_xref map
						where s.CMS_LSP_SYS_XREF_ID = map.CMS_LSP_SYS_XREF_ID
						and exists 
							(select '1'
							from transaction 
							where transaction_type = 'LIMIT'
							and staging_reference_id = map.CMS_LSP_APPR_LMTS_ID)));
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 22);
		commit;
		
		INSERT INTO CMS_STAGE_LSP_SYS_XREF(
			CMS_LSP_SYS_XREF_ID,
			LSX_EXT_SYS_CODE_VALUE,
			LSX_EXT_SYS_ACCT_NUM,
			LSX_EXT_SYS_ACCT_SEQ,
			LSX_EXT_SYS_CUST_ID,
			ACCOUNT_DESC_VALUE,
			CMS_LE_SUB_PROFILE_ID,
			LSX_BCA_REF_NUM,
			LSX_LMT_ID,
			LSX_LE_ID,
			LSX_BKG_LOCTN_CTRY, 
			LSX_BKG_LOCTN_ORG,
			LSX_LSP_ID,
			UPDATE_STATUS_IND,
			ACCT_STATUS)
		(select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CUSTOMER_X_REF_SEQ), 2)) as BIGINT),
			'TSPR',
			t.TRADE_ACCT_NO,
			t.TRADE_ACCT_SEQ,
			t.CIF_ID,
			ACCT_DESC_CODE,
			(select b.CMS_LE_SUB_PROFILE_ID from sci_le_sub_profile b, sci_le_main_profile a 
				where b.CMS_LE_MAIN_PROFILE_ID=a.CMS_LE_MAIN_PROFILE_ID and a.SOURCE_ID='TSPR' and a.LMP_LE_ID=t.CIF_ID),
			t.TRADE_ACCT_NO,
			t.LIMIT_ID,
			t.CIF_ID,
			t.ORI_LOC_COUNTRY,
			t.ORG_LOC_ORG,
			1,
			t.UPDATE_STAT_IND,
			'A'
		FROM SI_TEMP_TSPR_CA006 t WHERE NOT EXISTS 
		(SELECT 1 FROM CMS_STAGE_LSP_SYS_XREF WHERE LSX_EXT_SYS_ACCT_NUM = t.TRADE_ACCT_NO 
			and LSX_EXT_SYS_ACCT_SEQ = t.TRADE_ACCT_SEQ
			and LSX_EXT_SYS_CODE_VALUE='TSPR'
			and LSX_LMT_ID=t.LIMIT_ID)
		AND t.is_valid = 'Y');
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 23);
		commit;
		-----------------------------
		-- Update/Insert table
		-- SCI_LSP_LMTS_XREF_MAP
		--
		-----------------------------
		
		UPDATE SCI_LSP_LMTS_XREF_MAP b SET(
			LXM_LE_ID,
			LXM_LMT_ID,
			CMS_LSP_APPR_LMTS_ID,
			CMS_LSP_SYS_XREF_ID,
			CMS_STATUS,
			UPDATE_STATUS_IND)=
		(select t.CIF_ID,
			t.LIMIT_ID,
			(SELECT CMS_LSP_APPR_LMTS_ID FROM SCI_LSP_APPR_LMTS WHERE LMT_ID=LIMIT_ID
				and LMT_BCA_REF_NUM=t.TRADE_ACCT_NO 
				AND SOURCE_ID='TSPR'),
			a.CMS_LSP_SYS_XREF_ID,
			(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END),
			t.UPDATE_STAT_IND
		FROM SI_TEMP_TSPR_CA006 t, SCI_LSP_SYS_XREF a 
			WHERE a.CMS_LSP_SYS_XREF_ID=b.CMS_LSP_SYS_XREF_ID and a.LSX_EXT_SYS_ACCT_NUM = t.TRADE_ACCT_NO
			and a.LSX_LMT_ID = t.LIMIT_ID
			and a.LSX_EXT_SYS_CODE_VALUE='TSPR' AND t.is_valid = 'Y')
		WHERE EXISTS (SELECT 1 FROM SI_TEMP_TSPR_CA006 t, SCI_LSP_SYS_XREF a 
			WHERE t.is_valid = 'Y'
			and a.CMS_LSP_SYS_XREF_ID=b.CMS_LSP_SYS_XREF_ID 
			and a.LSX_EXT_SYS_ACCT_NUM = t.TRADE_ACCT_NO
			and a.LSX_LMT_ID = t.LIMIT_ID
			and a.LSX_EXT_SYS_CODE_VALUE='TSPR');
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 24);
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
			t.CIF_ID,
			t.LIMIT_ID,
			(SELECT CMS_LSP_APPR_LMTS_ID FROM SCI_LSP_APPR_LMTS WHERE LMT_ID=t.LIMIT_ID 
				and LMT_BCA_REF_NUM=t.TRADE_ACCT_NO 
				AND SOURCE_ID='TSPR'),
			a.CMS_LSP_SYS_XREF_ID,
			'ACTIVE',
			t.UPDATE_STAT_IND
		FROM SI_TEMP_TSPR_CA006 t, SCI_LSP_SYS_XREF a
		where t.is_valid = 'Y'
			AND a.LSX_EXT_SYS_ACCT_NUM = t.TRADE_ACCT_NO 
			AND a.LSX_EXT_SYS_CODE_VALUE='TSPR'
			AND a.LSX_LMT_ID = t.LIMIT_ID
			AND NOT EXISTS 
				(SELECT 1 FROM SCI_LSP_LMTS_XREF_MAP b 
					WHERE a.CMS_LSP_SYS_XREF_ID=b.CMS_LSP_SYS_XREF_ID 
					and b.LXM_LMT_ID = t.LIMIT_ID));
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 25);
		commit;
		-----------------------------
		-- Update/Insert table
		-- STAGE_LIMIT_XREF
		--
		-----------------------------
		
		UPDATE STAGE_LIMIT_XREF b SET(
			LXM_LE_ID,
			LXM_LMT_ID,
			CMS_LSP_SYS_XREF_ID,
			CMS_STATUS,
			UPDATE_STATUS_IND)=
		(select t.CIF_ID,
			t.LIMIT_ID,
			a.CMS_LSP_SYS_XREF_ID,
			(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END),
			t.UPDATE_STAT_IND
		FROM SI_TEMP_TSPR_CA006 t, CMS_STAGE_LSP_SYS_XREF a 
			WHERE a.CMS_LSP_SYS_XREF_ID=b.CMS_LSP_SYS_XREF_ID
			and a.LSX_LMT_ID = t.LIMIT_ID
			and a.LSX_EXT_SYS_ACCT_NUM = t.TRADE_ACCT_NO 
			and a.LSX_EXT_SYS_CODE_VALUE='TSPR' AND t.is_valid = 'Y')
		WHERE CMS_LSP_APPR_LMTS_ID IN (select staging_reference_id from transaction
										where reference_id IN (select CMS_LSP_APPR_LMTS_ID 
																from sci_lsp_appr_lmts, SI_TEMP_TSPR_CA006
															where is_valid = 'Y'
																and source_id = 'TSPR'
																and lmt_id = limit_id)
													and transaction_type = 'LIMIT');
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 26);
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
			t.CIF_ID,
			t.LIMIT_ID,
			(select trx.staging_reference_id from sci_lsp_appr_lmts lmt, TRANSACTION trx
				where lmt.LMT_ID = t.LIMIT_ID
				and lmt.SOURCE_ID = 'TSPR'		
				and lmt.cms_lsp_appr_lmts_id = trx.reference_id
				and trx.transaction_type = 'LIMIT'),
			a.CMS_LSP_SYS_XREF_ID,
			'ACTIVE',
			t.UPDATE_STAT_IND
		FROM SI_TEMP_TSPR_CA006 t, CMS_STAGE_LSP_SYS_XREF a 
		WHERE t.is_valid = 'Y'
			AND a.LSX_EXT_SYS_ACCT_NUM = t.TRADE_ACCT_NO 
			AND a.LSX_EXT_SYS_CODE_VALUE='TSPR'
			AND a.LSX_LMT_ID = t.LIMIT_ID
			AND NOT EXISTS 
		(SELECT 1 FROM STAGE_LIMIT_XREF b 
			WHERE a.CMS_LSP_SYS_XREF_ID=b.CMS_LSP_SYS_XREF_ID
				and b.LXM_LMT_ID = t.LIMIT_ID));
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 27);
		commit;
		-----------------------------
		-- Update/Insert table
		-- CMS_NPL
		--
		-----------------------------
		
		UPDATE CMS_NPL SET(
			ACCOUNT_NUMBER,
			SOURCE_ID,
			STATUS,
			NPL_DATE,
			AUTO_NPL_FLAG,
			NPL_BCA_REF_NUM)=
		(select distinct TRADE_ACCT_NO,
			'TSPR',
			NPL_STAT,
			NPL_DATE,
			AUTO_NPL_FLAG,
			TRADE_ACCT_NO
		FROM SI_TEMP_TSPR_CA006 t WHERE ACCOUNT_NUMBER = t.TRADE_ACCT_NO and SOURCE_ID='TSPR' AND t.is_valid = 'Y')
			WHERE EXISTS (SELECT 1 FROM SI_TEMP_TSPR_CA006 t WHERE ACCOUNT_NUMBER = t.TRADE_ACCT_NO and SOURCE_ID='TSPR' AND t.is_valid = 'Y');

		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 28);
		commit;
		
		INSERT INTO CMS_NPL(
			CMS_NPL_ID,
			ACCOUNT_NUMBER,
			SOURCE_ID,
			STATUS,
			NPL_DATE,
			AUTO_NPL_FLAG,
			NPL_BCA_REF_NUM)
		(select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR NPL_SEQ), 2)) as BIGINT),
			TRADE_ACCT_NO,
			'TSPR',
			NPL_STAT,
			NPL_DATE,
			AUTO_NPL_FLAG,
			TRADE_ACCT_NO
		FROM SI_TEMP_TSPR_CA006 t WHERE NOT EXISTS 
		(SELECT 1 FROM CMS_NPL WHERE ACCOUNT_NUMBER = t.TRADE_ACCT_NO and SOURCE_ID='TSPR')
		AND t.is_valid = 'Y' group by TRADE_ACCT_NO, NPL_STAT, NPL_DATE, AUTO_NPL_FLAG);
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 29);
		commit;
		
		--revive deleted AA when one OUTER limit ACTIVE
		UPDATE SCI_LSP_LMT_PROFILE SET(CMS_BCA_STATUS, UPDATE_STATUS_IND)=('ACTIVE', 'U')
		where SOURCE_ID='TSPR'
		and CMS_BCA_STATUS='DELETED'
		and exists(select 1 from sci_lsp_appr_lmts lmt 
			where lmt.CMS_LIMIT_PROFILE_ID=CMS_LSP_LMT_PROFILE_ID
			and lmt.SOURCE_ID='TSPR'
			and lmt.LMT_TYPE_VALUE='OUTER'
			and lmt.CMS_LIMIT_STATUS='ACTIVE');

		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 30);
		commit;
		
		--soft delete AA when all OUTER limit DELETED
		UPDATE SCI_LSP_LMT_PROFILE SET(CMS_BCA_STATUS, UPDATE_STATUS_IND)=('DELETED', 'D')
		where SOURCE_ID='TSPR'
		and CMS_BCA_STATUS='ACTIVE'
		and not exists(select 1 from sci_lsp_appr_lmts lmt 
			where lmt.CMS_LIMIT_PROFILE_ID=CMS_LSP_LMT_PROFILE_ID
			and lmt.SOURCE_ID='TSPR'
			and lmt.LMT_TYPE_VALUE='OUTER'
			and lmt.CMS_LIMIT_STATUS='ACTIVE');

		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 31);
		commit;
	
		--revive deleted AA when one OUTER limit ACTIVE
		UPDATE STAGE_LIMIT_PROFILE SET(CMS_BCA_STATUS, UPDATE_STATUS_IND)=('ACTIVE', 'U')
		where SOURCE_ID='TSPR'
		and CMS_BCA_STATUS='DELETED'
		and cms_lsp_lmt_profile_id IN (SELECT staging_reference_id
												FROM transaction
												WHERE transaction_type = 'LIMITPROFILE'
													AND reference_id IN (SELECT cms_lsp_lmt_profile_id 
																			FROM sci_lsp_lmt_profile a
																			WHERE a.llp_bca_ref_num = llp_bca_ref_num
																				AND a.llp_le_id = llp_le_id
																				AND a.source_id = 'TSPR'
																				AND a.CMS_BCA_STATUS='ACTIVE'));
		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 32);
		commit;

		--soft delete AA when all OUTER limit DELETED
		UPDATE STAGE_LIMIT_PROFILE SET(CMS_BCA_STATUS, UPDATE_STATUS_IND)=('DELETED', 'D')
		where SOURCE_ID='TSPR'
		and CMS_BCA_STATUS='ACTIVE'
		and cms_lsp_lmt_profile_id IN (SELECT staging_reference_id
												FROM transaction
												WHERE transaction_type = 'LIMITPROFILE'
													AND reference_id IN (SELECT cms_lsp_lmt_profile_id 
																			FROM sci_lsp_lmt_profile a
																			WHERE a.llp_bca_ref_num = llp_bca_ref_num
																				AND a.llp_le_id = llp_le_id
																				AND a.source_id = 'TSPR'
																				AND a.CMS_BCA_STATUS='DELETED'));
																		
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 33);
		commit;								
		------------------------------------------
		-- START Update Limit Profile Transaction
		-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
		--
		------------------------------------------
														
		FOR cur_llp_key AS
			SELECT cms_lsp_lmt_profile_id trx_ref_id, 'LIMITPROFILE' trx_type
				FROM sci_lsp_lmt_profile a
			WHERE EXISTS (SELECT '1' FROM SI_TEMP_TSPR_CA006 t
								WHERE t.TRADE_ACCT_NO = a.llp_bca_ref_num
										AND t.CIF_ID = a.LLP_LE_ID
										AND t.is_valid = 'Y')
					AND source_id = 'TSPR'
		DO
			CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_llp_key.trx_ref_id, cur_llp_key.trx_type);
		END FOR;
		
		------------------------------------------
		-- END Update Limit Profile Transaction
		-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
		--
		------------------------------------------
	
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA006', 'TSPR', 0);
		
END@

CREATE PROCEDURE SI_RUN_TEMP_TSPR_CA010
   LANGUAGE SQL
   BEGIN
	 
	 	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA010', 'TSPR', 1);
   	----------------------------
		-- Begin Update
		----------------------------
  	update CMS_TRADE_SUPPLIER_BUYER b set(
		CMS_LSP_APPR_LMTS_ID,
		TYPE,
		NAME)=
		(select a.CMS_LSP_APPR_LMTS_ID,
		TYPE,
		SUPPLIER_BUYER_NAME
 		FROM SI_TEMP_TSPR_CA010 t, SCI_LSP_APPR_LMTS a 
			where a.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID 
				and a.SOURCE_ID='TSPR' 
				and a.LMT_ID=t.LIMIT_ID 
				and t.TYPE=b.TYPE
				and t.SUPPLIER_BUYER_NAME=b.NAME
				and t.is_valid = 'Y')
		WHERE EXISTS
			(select 1 from SI_TEMP_TSPR_CA010 t, SCI_LSP_APPR_LMTS a 
				where a.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID 
					and a.SOURCE_ID='TSPR' 
					and a.LMT_ID=t.LIMIT_ID 
					and t.TYPE=b.TYPE
					and t.SUPPLIER_BUYER_NAME=b.NAME
					and t.is_valid = 'Y');
	
   	----------------------------
		-- Begin Insertion
		----------------------------
	 	INSERT INTO CMS_TRADE_SUPPLIER_BUYER(
		CMS_TRADE_SUPPLIER_BUYER_ID,
		CMS_LSP_APPR_LMTS_ID,
		TYPE,
		NAME)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_TRADE_SUPPLIER_BUYER_SEQ), 2)) as BIGINT),
		a.CMS_LSP_APPR_LMTS_ID,
		TYPE,
		SUPPLIER_BUYER_NAME
 		FROM SI_TEMP_TSPR_CA010 t, SCI_LSP_APPR_LMTS a 
			WHERE a.LMT_ID=t.LIMIT_ID
				and a.SOURCE_ID='TSPR' 
				and t.is_valid = 'Y'
				and NOT EXISTS
				(SELECT 1 FROM SCI_LSP_APPR_LMTS a, CMS_TRADE_SUPPLIER_BUYER b 
					WHERE a.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID 
						and a.SOURCE_ID='TSPR' 
						and a.LMT_ID=t.LIMIT_ID
						and b.TYPE=t.TYPE
						and b.NAME=t.SUPPLIER_BUYER_NAME));

	 	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA010', 'TSPR', 0);
END@

CREATE PROCEDURE SI_RUN_TEMP_TSPR_CA008
   LANGUAGE SQL
   BEGIN
	 
	 	CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA008', 'TSPR', 1);

   	----------------------------
		-- Begin Update
		----------------------------
		update CMS_TRADE_PRICING b set(
		CMS_LSP_APPR_LMTS_ID,
		PRICING_TYPE,
		INTEREST_MODE,
		PRICING_TIER_TYPE,
		TIER_RATE_TYPE,
		TIER_RATE)=
		(SELECT a.CMS_LSP_APPR_LMTS_ID,
		PRICING_TYPE,
		INTEREST_MODE,
		SINGLE_MULTIPLE_TIER,
		TIER_RATE_TYPE,
		TIER_RATE
 		FROM SI_TEMP_TSPR_CA008 t, SCI_LSP_APPR_LMTS a WHERE a.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID 
			and a.SOURCE_ID='TSPR' 
			and a.LMT_ID=t.LIMIT_ID 
			and t.INTEREST_MODE=b.INTEREST_MODE
			and t.is_valid = 'Y')
			WHERE EXISTS (SELECT 1 FROM SI_TEMP_TSPR_CA008 t, SCI_LSP_APPR_LMTS a 
					WHERE a.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID 
						and a.SOURCE_ID='TSPR' 
						and a.LMT_ID=t.LIMIT_ID
						and t.INTEREST_MODE=b.INTEREST_MODE
						and t.is_valid = 'Y');
	
    ----------------------------
		-- Begin Insertion
		----------------------------
	 	INSERT INTO CMS_TRADE_PRICING(
		CMS_TRADE_PRICING_ID,
		CMS_LSP_APPR_LMTS_ID,
		PRICING_TYPE,
		INTEREST_MODE,
		PRICING_TIER_TYPE,
		TIER_RATE_TYPE,
		TIER_RATE
		)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_TRADE_PRICING_SEQ), 2)) as BIGINT),
		a.CMS_LSP_APPR_LMTS_ID,
		PRICING_TYPE,
		INTEREST_MODE,
		SINGLE_MULTIPLE_TIER,
		TIER_RATE_TYPE,
		TIER_RATE
 		FROM SI_TEMP_TSPR_CA008 t, SCI_LSP_APPR_LMTS a WHERE a.LMT_ID=t.LIMIT_ID
			and a.SOURCE_ID='TSPR' 
			AND t.is_valid = 'Y'
			and NOT EXISTS 
			(SELECT 1 FROM SCI_LSP_APPR_LMTS a, CMS_TRADE_PRICING b 
				WHERE a.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID 
					and a.SOURCE_ID='TSPR' 
					and a.LMT_ID=t.LIMIT_ID
					and b.INTEREST_MODE=t.INTEREST_MODE));
			
		CALL SI_LOG_PROC_TIME('SI_RUN_TEMP_TSPR_CA008', 'TSPR', 0);
END@

CREATE PROCEDURE SI_RUN_ALL_TSPR
	LANGUAGE SQL
BEGIN
	DECLARE v_count INTEGER;
	
	SELECT COUNT(*) INTO v_count FROM SI_TEMP_TSPR_CA006;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_TSPR_CA006;
		call SI_RUN_TEMP_TSPR_CA006;
		call UTIL_TRUNCATE_TABLE('SI_TEMP_TSPR_CA006');
	END IF;
	
	SELECT COUNT(*) INTO v_count FROM SI_TEMP_TSPR_CO021;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_TSPR_CO021;
		call SI_RUN_TEMP_TSPR_CO021;
		call UTIL_TRUNCATE_TABLE('SI_TEMP_TSPR_CO021');
	END IF;

	SELECT COUNT(*) INTO v_count FROM SI_TEMP_TSPR_CA008;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_TSPR_CA008;
		call SI_RUN_TEMP_TSPR_CA008;
		call UTIL_TRUNCATE_TABLE('SI_TEMP_TSPR_CA008');
	END IF;

	SELECT COUNT(*) INTO v_count FROM SI_TEMP_TSPR_CA010;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_TSPR_CA010;
		call SI_RUN_TEMP_TSPR_CA010;
		call UTIL_TRUNCATE_TABLE('SI_TEMP_TSPR_CA010');
	END IF;	
	
	call SI_AUTO_CREATE_TRANSACTION;
	
END@

commit work@
