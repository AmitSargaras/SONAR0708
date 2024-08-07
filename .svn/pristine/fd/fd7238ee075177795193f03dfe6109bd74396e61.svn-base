--  SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM, CLIMS_LOCAL@
DROP PROCEDURE SI_RUN_TEMP_ARBS_CU001@
DROP PROCEDURE SI_RUN_TEMP_ARBS_CU002@
DROP PROCEDURE SI_RUN_TEMP_ARBS_CU003@
DROP PROCEDURE SI_RUN_TEMP_ARBS_CA001@
DROP PROCEDURE SI_RUN_TEMP_ARBS_CA002@
DROP PROCEDURE SI_RUN_TEMP_ARBS_CA003@
DROP PROCEDURE SI_RUN_TEMP_ARBS_CA004@
DROP PROCEDURE SI_RUN_TEMP_ARBS_CA005@
drop procedure SI_RUN_TEMP_ARBS_CO001@
drop procedure SI_RUN_TEMP_ARBS_CO002@
drop procedure SI_RUN_TEMP_ARBS_CO003@
drop procedure SI_RUN_TEMP_ARBS_CO004@
drop procedure SI_RUN_TEMP_ARBS_CO005@
drop procedure SI_RUN_TEMP_ARBS_CO006@
drop procedure SI_RUN_TEMP_ARBS_CO007@
drop procedure SI_RUN_TEMP_ARBS_CO008@
DROP PROCEDURE SI_RUN_TEMP_ARBS_CO009@
DROP PROCEDURE SI_RUN_TEMP_ARBS_CO010@
DROP PROCEDURE SI_RUN_TEMP_ARBS_CO011@
DROP PROCEDURE SI_RUN_TEMP_ARBS_CO012@
DROP PROCEDURE SI_RUN_TEMP_ARBS_CO013@
DROP PROCEDURE SI_RUN_TEMP_ARBS_CO014@
drop procedure si_run_temp_arbs_co015@
drop procedure si_run_temp_arbs_co016@
drop procedure si_run_temp_arbs_co017@
drop procedure si_run_temp_arbs_co018@
DROP PROCEDURE SI_RUN_TEMP_ARBS_CA019@
DROP PROCEDURE SI_RUN_TEMP_ARBS_PF003@
DROP PROCEDURE SI_RUN_ALL_ARBS@

CREATE PROCEDURE SI_RUN_TEMP_ARBS_CU001
   LANGUAGE SQL
   BEGIN

		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU001', 'ARBS', 1);
		commit;
	 	-------------------------------------
		-- Auto Feed Std Code
		-- COMMON_CODE_CATEGORY_ENTRY
		--
		-------------------------------------
		FOR cur_std_code AS
			SELECT DISTINCT CUST_CLASS_CODE code, CUST_CLASS_DESC desc, 
					CUST_CLASS_CAT cat, 'ARBS' source_id
				FROM SI_TEMP_ARBS_CU001
			WHERE LENGTH(CUST_CLASS_CODE) > 0
				AND LENGTH(CUST_CLASS_DESC) > 0
				and is_valid = 'Y'
		DO
			CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
		END FOR;				
		
		FOR cur_std_code AS
			SELECT DISTINCT ID_TYPE_CODE code, ID_TYPE_DESC desc, 
					ID_TYPE_CAT cat, 'ARBS' source_id
				FROM SI_TEMP_ARBS_CU001
			WHERE LENGTH(ID_TYPE_CODE) > 0
				AND LENGTH(ID_TYPE_DESC) > 0
				and is_valid = 'Y'
		DO
			CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
		END FOR;		
							
		FOR cur_std_code AS
			SELECT DISTINCT SECONDARY_ID_TYPE_CODE code, SECONDARY_ID_TYPE_DESC desc, 
					SECONDARY_ID_TYPE_CAT cat, 'ARBS' source_id
				FROM SI_TEMP_ARBS_CU001
			WHERE LENGTH(SECONDARY_ID_TYPE_CODE) > 0
				AND LENGTH(SECONDARY_ID_TYPE_DESC) > 0
				and is_valid = 'Y'
		DO
			CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
		END FOR;		
				
		FOR cur_std_code AS
			SELECT DISTINCT CUST_SEGMENT_CODE code, CUST_SEGMENT_DESC desc, 
					CUST_SEGMENT_CAT cat, 'ARBS' source_id
				FROM SI_TEMP_ARBS_CU001
			WHERE LENGTH(CUST_SEGMENT_CODE) > 0
				AND LENGTH(CUST_SEGMENT_DESC) > 0
				and is_valid = 'Y'
		DO
			CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
		END FOR;		
				
				
		FOR cur_std_code AS
			SELECT DISTINCT INCOME_GROUP_CODE code, INCOME_GROUP_DESC desc, 
					INCOME_GROUP_CAT cat, 'ARBS' source_id
				FROM SI_TEMP_ARBS_CU001
			WHERE LENGTH(INCOME_GROUP_CODE) > 0
				AND LENGTH(INCOME_GROUP_DESC) > 0		
				and is_valid = 'Y'
		DO
			CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
		END FOR;		
						
		FOR cur_std_code AS
			SELECT DISTINCT CUST_SEGMENT_CODE code, CUST_SEGMENT_DESC desc, 
					CUST_SEGMENT_CAT cat, 'ARBS' source_id
				FROM SI_TEMP_ARBS_CU001
			WHERE LENGTH(CUST_SEGMENT_CODE) > 0
				AND LENGTH(CUST_SEGMENT_DESC) > 0
				and is_valid = 'Y'
		DO
			CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
		END FOR;		
		
		FOR cur_std_code AS
			SELECT DISTINCT ISIC_CODE code, ISIC_DESC desc, 
					ISIC_CAT cat, 'ARBS' source_id
				FROM SI_TEMP_ARBS_CU001
			WHERE LENGTH(ISIC_CODE) > 0
				AND LENGTH(ISIC_DESC) > 0	
				and is_valid = 'Y'
		DO
			CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
		END FOR;		
				
		FOR cur_std_code AS
			SELECT DISTINCT PRIMARY_ADD_TYPE_CODE code, PRIMARY_ADD_TYPE_DESC desc, 
					PRIMARY_ADD_TYPE_CAT cat, 'ARBS' source_id
				FROM SI_TEMP_ARBS_CU001
			WHERE LENGTH(PRIMARY_ADD_TYPE_CODE) > 0
				AND LENGTH(PRIMARY_ADD_TYPE_DESC) > 0		
				and is_valid = 'Y'
		DO
			CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
		END FOR;		
							
		FOR cur_std_code AS
			SELECT DISTINCT LANGUAGE_CODE code, LANGUAGE_DESC desc, 
					LANGUAGE_CAT cat, 'ARBS' source_id
				FROM SI_TEMP_ARBS_CU001
			WHERE LENGTH(LANGUAGE_CODE) > 0
				AND LENGTH(LANGUAGE_DESC) > 0	
				and is_valid = 'Y'
		DO
			CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
		END FOR;		
						
		FOR cur_std_code AS
			SELECT DISTINCT SECONDARY_ADD_TYPE_CODE code, SECONDARY_ADD_TYPE_DESC desc, 
					SECONDARY_ADD_TYPE_CAT cat, 'ARBS' source_id
				FROM SI_TEMP_ARBS_CU001
			WHERE LENGTH(SECONDARY_ADD_TYPE_CODE) > 0
				AND LENGTH(SECONDARY_ADD_TYPE_DESC) > 0		
				and is_valid = 'Y'
		DO
			CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
		END FOR;

	 	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU001', 'ARBS', 2);
	 	commit;
		------------------------------------
		-- Begin update 
		-- SCI_LE_MAIN_PROFILE
		--
		------------------------------------
	 	update SCI_LE_MAIN_PROFILE set
		(LMP_LE_ID,
			LMP_LONG_NAME,
			LMP_SHORT_NAME,
			LMP_LEGAL_CONST_NUM,
			LMP_LEGAL_CONST_VALUE,
			LMP_INC_CNTRY_ISO_CODE,
			LMP_ID_TYPE_NUM,
			LMP_ID_TYPE_VALUE,
			LMP_INC_NUM_TEXT,
			LMP_INC_DATE,
			LMP_SECOND_ID_TYPE_NUM,
			LMP_SECOND_ID_TYPE_VALUE,
			LMP_ID_OLD_NUM,
			LMP_TYPE_NUM,
			LMP_TYPE_VALUE,
			LMP_REL_START_DATE,
			LMP_SGMNT_CODE_NUM,
			LMP_SGMNT_CODE_VALUE,
			CMS_BLACK_LISTED_IND,
			LMP_INCOME_CODE_NUM,
			LMP_INCOME_CODE_VALUE,
			LMP_LANG_CODE_NUM,
			LMP_LANG_CODE_VALUE,
			SOURCE_ID,
			lmp_le_id_src_num,
			lmp_le_id_src_value,
			UPDATE_STATUS_IND)=
		(SELECT CIF_ID, 
			CUST_NAME_L, 
			CUST_NAME_S, 
			CUST_CLASS_CAT,
			CUST_CLASS_CODE, 
			ID_ISSUE_COUNTRY,
			ID_TYPE_CAT,
			ID_TYPE_CODE,
			ID_NUMBER, 
			ID_IISSUE_DATE, 
			t.SECONDARY_ID_TYPE_CAT,
			t.SECONDARY_ID_TYPE_CODE,
			SECONDARY_ID_NUMBER, 
			CUST_TYPE_CAT,
			CUST_TYPE,
			CUST_START_DATE, 
			CUST_SEGMENT_CAT, 
			CUST_SEGMENT_CODE, 
			blacklisted, 
			income_group_cat,
			income_group_code,
			language_cat,
			language_code,
			'ARBS',
			'ARBS',
			'ARBS',
			'U'
		FROM SI_TEMP_ARBS_CU001 t WHERE SOURCE_ID='ARBS' and LMP_LE_ID=t.CIF_ID AND is_valid = 'Y') 
		where EXISTS 
			(SELECT 1 FROM SI_TEMP_ARBS_CU001
				WHERE SOURCE_ID='ARBS' and CIF_ID=LMP_LE_ID AND is_valid = 'Y');

	 	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU001', 'ARBS', 3);
	 	commit;
		------------------------------------
		-- Begin insert 
		-- SCI_LE_MAIN_PROFILE
		--
		------------------------------------
	 	INSERT INTO SCI_LE_MAIN_PROFILE 
		(cms_le_main_profile_id,
			LMP_LE_ID,
			LMP_LONG_NAME,
			LMP_SHORT_NAME,
			LMP_LEGAL_CONST_NUM,
			LMP_LEGAL_CONST_VALUE,
			LMP_INC_CNTRY_ISO_CODE,
			LMP_ID_TYPE_NUM,
			LMP_ID_TYPE_VALUE,
			LMP_INC_NUM_TEXT,
			LMP_INC_DATE,
			LMP_SECOND_ID_TYPE_NUM,
			LMP_SECOND_ID_TYPE_VALUE,
			LMP_ID_OLD_NUM,
			LMP_TYPE_NUM,
			LMP_TYPE_VALUE,
			LMP_REL_START_DATE,
			LMP_SGMNT_CODE_NUM,
			LMP_SGMNT_CODE_VALUE,
			CMS_BLACK_LISTED_IND,
			LMP_INCOME_CODE_NUM,
			LMP_INCOME_CODE_VALUE,
			LMP_LANG_CODE_NUM,
			LMP_LANG_CODE_VALUE,
			SOURCE_ID,
			lmp_le_id_src_num,
			lmp_le_id_src_value,
			UPDATE_STATUS_IND)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR LEGAL_ENTITY_SEQ), 2)) as BIGINT),
			CIF_ID, 
			CUST_NAME_L, 
			CUST_NAME_S,
			CUST_CLASS_CAT,
			CUST_CLASS_CODE,
			ID_ISSUE_COUNTRY,
			ID_TYPE_CAT,
			ID_TYPE_CODE,
			ID_NUMBER, 
			ID_IISSUE_DATE, 
			SECONDARY_ID_TYPE_CAT,
			t.SECONDARY_ID_TYPE_CODE,
			SECONDARY_ID_NUMBER,
			CUST_TYPE_CAT,
			CUST_TYPE,
			CUST_START_DATE,
			CUST_SEGMENT_CAT,
			CUST_SEGMENT_CODE, 
			blacklisted,
			income_group_cat,
			income_group_code,
			language_cat,
			language_code,
			'ARBS',
			'ARBS',
			'ARBS',
			'I'
		FROM SI_TEMP_ARBS_CU001 t WHERE NOT EXISTS 
			(SELECT 1 FROM SCI_LE_MAIN_PROFILE
				WHERE SOURCE_ID='ARBS' and LMP_LE_ID=t.CIF_ID) AND is_valid = 'Y');
		
	 	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU001', 'ARBS', 4);
		commit;
		------------------------------------
		-- Begin update 
		-- SCI_LE_SUB_PROFILE
		--
		------------------------------------
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
			from SI_TEMP_ARBS_CU001 t, SCI_LE_MAIN_PROFILE a 
			where a.CMS_LE_MAIN_PROFILE_ID=b.CMS_LE_MAIN_PROFILE_ID 
			and a.SOURCE_ID='ARBS' 
			and a.LMP_LE_ID=t.CIF_ID 
			AND t.is_valid = 'Y');
		
	 	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU001', 'ARBS', 5);
		commit;
		------------------------------------
		-- Begin insert 
		-- SCI_LE_SUB_PROFILE
		--
		------------------------------------
	 	INSERT INTO SCI_LE_SUB_PROFILE 
		(CMS_LE_SUB_PROFILE_ID,
			LSP_ID,
			LSP_LE_ID,
			LSP_SHORT_NAME,
			LSP_DMCL_CNTRY_ISO_CODE,
			LSP_LANG_CODE_NUM,
			LSP_LANG_CODE_VALUE,
			CMS_LE_MAIN_PROFILE_ID,
			CMS_SUB_ORIG_COUNTRY,
			UPDATE_STATUS_IND)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CUSTOMER_SEQ), 2)) as BIGINT),
			1,
			a.lmp_le_id, 
			a.lmp_short_name, 
			a.lmp_inc_cntry_iso_code,
			a.LMP_LANG_CODE_NUM,
			a.LMP_LANG_CODE_VALUE,
			a.cms_le_main_profile_id,
			'MY',
			'I'
		FROM SI_TEMP_ARBS_CU001 t, sci_le_main_profile a left outer join sci_le_sub_profile b 
			on a.cms_le_main_profile_id = b.cms_le_main_profile_id
		WHERE a.source_id = 'ARBS'
		and a.LMP_LE_ID = t.cif_id
		and t.is_valid = 'Y'
		and b.cms_le_main_profile_id is null);
	
	 	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU001', 'ARBS', 6);
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
		FROM SI_TEMP_ARBS_CU001 t inner join SCI_LE_MAIN_PROFILE a 
			on a.LMP_LE_ID=t.CIF_ID
			-- WLS: only update when address type code is not empty
			where a.CMS_LE_MAIN_PROFILE_ID = b.CMS_LE_MAIN_PROFILE_ID 
			and length(t.PRIMARY_ADD_TYPE_CODE)>0
			and t.PRIMARY_ADD_TYPE_CODE = b.LRA_TYPE_VALUE 
			AND t.is_valid = 'Y'
			and a.source_id = 'ARBS')
		WHERE EXISTS (select 1 from SI_TEMP_ARBS_CU001 t inner join SCI_LE_MAIN_PROFILE a 
								on a.LMP_LE_ID=t.CIF_ID
								-- WLS: only update when address type code is not empty
								where a.CMS_LE_MAIN_PROFILE_ID = b.CMS_LE_MAIN_PROFILE_ID
								and length(t.PRIMARY_ADD_TYPE_CODE)>0
								and t.PRIMARY_ADD_TYPE_CODE = b.LRA_TYPE_VALUE
								AND t.is_valid = 'Y'
								and a.source_id = 'ARBS');
		
	 	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU001', 'ARBS', 7);
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
		FROM SI_TEMP_ARBS_CU001 t inner join SCI_LE_MAIN_PROFILE a 
		on a.LMP_LE_ID=t.CIF_ID
		-- WLS: only update when address type code is not empty
		where a.source_id = 'ARBS'
		and length(t.PRIMARY_ADD_TYPE_CODE)>0
		and NOT EXISTS 
			(SELECT 1 FROM SCI_LE_REG_ADDR b
				WHERE b.CMS_LE_MAIN_PROFILE_ID = a.CMS_LE_MAIN_PROFILE_ID
				--and b.LRA_LE_ID=t.CIF_ID 
				and t.PRIMARY_ADD_TYPE_CODE=b.LRA_TYPE_VALUE)
		AND is_valid = 'Y');
		
	 	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU001', 'ARBS', 8);
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
		FROM SI_TEMP_ARBS_CU001 t inner join SCI_LE_MAIN_PROFILE a 
			on a.LMP_LE_ID=t.CIF_ID 
			-- WLS: only update when address type code is not empty
			where a.source_id = 'ARBS'
			and a.CMS_LE_MAIN_PROFILE_ID = b.CMS_LE_MAIN_PROFILE_ID 
			and length(t.SECONDARY_ADD_TYPE_CODE)>0
			and t.SECONDARY_ADD_TYPE_CODE= b.LRA_TYPE_VALUE 
			and a.LMP_LE_ID=t.CIF_ID 
			AND t.is_valid = 'Y')
		WHERE EXISTS (select 1 from SI_TEMP_ARBS_CU001 t inner join SCI_LE_MAIN_PROFILE a 
			on a.LMP_LE_ID=t.CIF_ID
			-- WLS: only update when address type code is not empty
			where a.SOURCE_ID='ARBS' 
			and a.CMS_LE_MAIN_PROFILE_ID = b.CMS_LE_MAIN_PROFILE_ID 
			and length(t.SECONDARY_ADD_TYPE_CODE)>0
			and t.SECONDARY_ADD_TYPE_CODE = b.LRA_TYPE_VALUE 
			and a.LMP_LE_ID=t.CIF_ID 
			AND t.is_valid = 'Y');
		
	 	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU001', 'ARBS', 9);
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
		FROM SI_TEMP_ARBS_CU001 t inner join SCI_LE_MAIN_PROFILE a 
		on a.LMP_LE_ID=t.CIF_ID
		-- WLS: only update when address type code is not empty
		where a.source_id = 'ARBS'
		and length(t.SECONDARY_ADD_TYPE_CODE)>0
		and NOT EXISTS 
			(SELECT 1 FROM SCI_LE_REG_ADDR b
				WHERE b.CMS_LE_MAIN_PROFILE_ID = a.CMS_LE_MAIN_PROFILE_ID
					and t.SECONDARY_ADD_TYPE_CODE = b.LRA_TYPE_VALUE) 
		AND is_valid = 'Y');
		
	 	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU001', 'ARBS', 10);
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
		FROM SI_TEMP_ARBS_CU001 t, SCI_LE_MAIN_PROFILE a 
			where a.CMS_LE_MAIN_PROFILE_ID = b.CMS_LE_MAIN_PROFILE_ID 
			and a.SOURCE_ID='ARBS' 
			and a.LMP_LE_ID=t.CIF_ID 
			AND t.is_valid = 'Y'
			and length(t.ISIC_CODE)>0)
		WHERE EXISTS (select 1 from SI_TEMP_ARBS_CU001 t, SCI_LE_MAIN_PROFILE a 
			where a.CMS_LE_MAIN_PROFILE_ID = b.CMS_LE_MAIN_PROFILE_ID 
			and a.SOURCE_ID='ARBS' 
			and a.LMP_LE_ID=t.CIF_ID 
			AND t.is_valid = 'Y'
			and length(ISIC_CODE) > 0);
		
	 	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU001', 'ARBS', 11);
		commit;
		------------------------------------
		-- Begin insert 
		-- sci_le_isic_dtl
		--
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
		FROM SI_TEMP_ARBS_CU001 t, SCI_LE_MAIN_PROFILE a left outer join sci_le_isic_dtl b 
			on a.cms_le_main_profile_id = b.cms_le_main_profile_id
		where a.lmp_le_id = t.cif_id
		and a.source_id = 'ARBS'
		AND t.is_valid = 'Y'
		and length(t.ISIC_CODE)>0
		and b.cms_le_main_profile_id is null);
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU001', 'ARBS', 0);
					
END@


CREATE PROCEDURE SI_RUN_TEMP_ARBS_CU002
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU002', 'ARBS', 1);
	commit;
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT credit_grade_value code, credit_grade_value desc,
			   credit_grade_value_cat cat, 'ARBS' source_id
		  FROM si_temp_arbs_cu002
		 WHERE LENGTH(credit_grade_value) > 0
		 union
		SELECT DISTINCT credit_grade_type code, credit_grade_type desc,
			   credit_grade_type_cat cat, 'ARBS' source_id
		  FROM si_temp_arbs_cu002
		 WHERE LENGTH(credit_grade_type) > 0
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU002', 'ARBS', 2);
	commit;
	-------------------------------------
	-- Actual Table
	-- SCI_LE_CREDIT_GRADE
	--
	-------------------------------------	

	UPDATE sci_le_credit_grade a SET (lcg_le_id, lcg_crdt_grade_type_num, lcg_crdt_grade_type_value,
									lcg_crdt_grade_code_num, lcg_crdt_grade_code_value, lcg_crdt_grade_start_date,
									cms_main_profile_id,
									UPDATE_STATUS_IND) =
	(SELECT cif_id, credit_grade_type_cat, credit_grade_type, credit_grade_value_cat, credit_grade_value, 
			credit_grade_effective_date, mp.cms_le_main_profile_id,
			UPDATE_STATUS_IND
	   FROM si_temp_arbs_cu002 t, sci_le_main_profile mp
	  WHERE t.cif_id = mp.lmp_le_id
		and mp.source_id = 'ARBS'
		and mp.cms_le_main_profile_id = a.cms_main_profile_id
	  and t.is_valid = 'Y'
	  and t.credit_grade_type = a.LCG_CRDT_GRADE_TYPE_VALUE)
		where exists (select 1
			from si_temp_arbs_cu002 t, sci_le_main_profile mp
			where mp.cms_le_main_profile_id = a.cms_main_profile_id
			and mp.LMP_LE_ID = t.cif_id
			and t.IS_VALID = 'Y'
			and mp.source_id = 'ARBS'
			and a.LCG_CRDT_GRADE_TYPE_VALUE = t.CREDIT_GRADE_TYPE);

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU002', 'ARBS', 3);
	commit;
	
	INSERT INTO sci_le_credit_grade (cms_le_credit_grade_id, lcg_le_id, lcg_crdt_grade_type_num, lcg_crdt_grade_type_value,
									lcg_crdt_grade_code_num, lcg_crdt_grade_code_value, lcg_crdt_grade_start_date,
									cms_main_profile_id,
									UPDATE_STATUS_IND)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR credit_grade_seq), 2)) as BIGINT),
			cif_id, credit_grade_type_cat, credit_grade_type, credit_grade_value_cat, credit_grade_value, 
			credit_grade_effective_date, mp.cms_le_main_profile_id,
			'I'
	   FROM si_temp_arbs_cu002 t, sci_le_main_profile mp 
	  WHERE is_valid = 'Y'
		and t.cif_id = mp.lmp_le_id
		and mp.source_id = 'ARBS'
		and NOT EXISTS (SELECT 1 
							FROM sci_le_credit_grade cg
	  					WHERE mp.cms_le_main_profile_id = cg.cms_main_profile_id
							and t.CREDIT_GRADE_TYPE = cg.LCG_CRDT_GRADE_TYPE_VALUE));
								 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU002', 'ARBS', 0);
  
END@


CREATE PROCEDURE SI_RUN_TEMP_ARBS_CU003
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU003', 'ARBS', 1);
	commit;
	------------------------------------
	-- Truncate CMS_BATCH_CIF_FUSION
	-- before insertion
	--
	-----------------------------------
	delete from CMS_BATCH_CIF_FUSION;
	commit;
	
	-------------------------------------
	-- Actual Table
	-- CMS_BATCH_CIF_FUSION
	--
	-------------------------------------

	INSERT INTO CMS_BATCH_CIF_FUSION (CMS_BATCH_CIF_FUSION_ID, OLD_LE_ID, NEW_LE_ID, SOURCE_ID, TIME_PROCESSED)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_BATCH_CIF_FUSION_SEQ), 2)) as BIGINT),
			OLD_CIF_ID, NEW_CIF_ID, 'ARBS', CURRENT_TIMESTAMP
	   FROM si_temp_arbs_cu003 t
	  WHERE is_valid = 'Y');
  
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CU003', 'ARBS', 0);
	
END@


CREATE PROCEDURE SI_RUN_TEMP_ARBS_CA001
	LANGUAGE SQL
BEGIN
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA001', 'ARBS', 1);
	commit;
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT ori_loc_org_code code, ori_loc_org_desc desc,
			   ori_loc_org_cat cat, 'ARBS' source_id
		  FROM si_temp_arbs_ca001
		 WHERE LENGTH(ori_loc_org_code) > 0
		   AND LENGTH(ori_loc_org_desc) > 0
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;

	-------------------------------------
	-- Actual Table
	-- SCI_LSP_LMT_PROFILE
	--
	-------------------------------------
	call si_runstats('sci_lsp_lmt_profile');
	lock table sci_lsp_lmt_profile in share mode;
	UPDATE sci_lsp_lmt_profile a SET (llp_le_id, cif_source_id, llp_lsp_id, llp_bca_ref_num,
									cms_bca_joint_ind, llp_bca_ref_appr_date, cms_orig_country, cms_orig_organisation, 
									llp_next_annl_rvw_date, cms_bca_status, cms_bca_create_date, cms_customer_id,
									UPDATE_STATUS_IND) =
	(SELECT cif_id, cif_source, 1, aa_number, joint_borrower_ind, aa_approved_date, ori_loc_country, ori_loc_org_code,
			annual_review_date, aa_stat, aa_create_date, (SELECT cms_le_sub_profile_id 
															FROM sci_le_sub_profile sp, sci_le_main_profile mp
														   WHERE lmp_le_id = t.cif_id
														     AND sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
														     AND mp.source_id = 'ARBS'),
									UPDATE_STATUS_IND
	   FROM si_temp_arbs_ca001 t
	  WHERE t.aa_number = a.llp_bca_ref_num AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_ca001 
	  				 WHERE llp_bca_ref_num = aa_number AND is_valid = 'Y')
	  	AND source_id = 'ARBS';

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA001', 'ARBS', 2);
	commit;
	
	INSERT INTO sci_lsp_lmt_profile (cms_lsp_lmt_profile_id, llp_le_id, cif_source_id, llp_lsp_id, llp_bca_ref_num, 
									cms_bca_joint_ind, llp_bca_ref_appr_date, cms_orig_country, cms_orig_organisation, 
									llp_next_annl_rvw_date, cms_bca_status, cms_bca_create_date, cms_customer_id,
									lmt_profile_type, source_id,
									UPDATE_STATUS_IND)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_profile_seq), 2)) as BIGINT),
			cif_id, cif_source, 1, aa_number, joint_borrower_ind, aa_approved_date, ori_loc_country, ori_loc_org_code,
			annual_review_date, aa_stat, aa_create_date, (SELECT cms_le_sub_profile_id 
															FROM sci_le_sub_profile sp, sci_le_main_profile mp
														   WHERE lmp_le_id = t.cif_id
														     AND sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
														     AND mp.source_id = 'ARBS'),
			'BANKING', 'ARBS',
			'I'
	   FROM si_temp_arbs_ca001 t
	  WHERE NOT EXISTS (SELECT '1' FROM sci_lsp_lmt_profile 
	  					 WHERE llp_bca_ref_num = t.aa_number
	  					   AND source_id = 'ARBS') AND is_valid = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA001', 'ARBS', 3);
	commit;
	-------------------------------------
	-- Staging Table
	-- STAGE_LIMIT_PROFILE
	--
	-------------------------------------
	call si_runstats('stage_limit_profile');
	lock table stage_limit_profile in share mode;
	UPDATE stage_limit_profile s SET (llp_le_id, cif_source_id, llp_lsp_id, llp_bca_ref_num, 
									cms_bca_joint_ind, llp_bca_ref_appr_date, cms_orig_country, cms_orig_organisation, 
									llp_next_annl_rvw_date, cms_bca_status, cms_bca_create_date, cms_customer_id,
									UPDATE_STATUS_IND) =
	(SELECT cif_id, cif_source, 1, aa_number, joint_borrower_ind, aa_approved_date, ori_loc_country, ori_loc_org_code,
			annual_review_date, aa_stat, aa_create_date, (SELECT cms_le_sub_profile_id 
															FROM sci_le_sub_profile sp, sci_le_main_profile mp
														   WHERE lmp_le_id = t.cif_id
														     AND sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
														     AND mp.source_id = 'ARBS'),
									UPDATE_STATUS_IND
	   FROM si_temp_arbs_ca001 t
	  WHERE t.aa_number = s.llp_bca_ref_num AND t.is_valid = 'Y')
	  WHERE cms_lsp_lmt_profile_id IN (SELECT staging_reference_id
										 FROM transaction
										WHERE transaction_type = 'LIMITPROFILE'
										  AND reference_id IN (SELECT cms_lsp_lmt_profile_id 
										  						 FROM sci_lsp_lmt_profile a, 
										  						 	  si_temp_arbs_ca001
										   						WHERE a.llp_bca_ref_num = aa_number
										   						  AND a.llp_le_id = cif_id
										   						  AND a.source_id = 'ARBS' AND is_valid = 'Y'));
	  
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA001', 'ARBS', 4);
	commit;
	
	INSERT INTO stage_limit_profile (cms_lsp_lmt_profile_id, llp_le_id, cif_source_id, llp_lsp_id, llp_bca_ref_num, 
									cms_bca_joint_ind, llp_bca_ref_appr_date, cms_orig_country, cms_orig_organisation, 
									llp_next_annl_rvw_date, cms_bca_status, cms_bca_create_date, cms_customer_id,
									lmt_profile_type, source_id,
									UPDATE_STATUS_IND)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_profile_seq), 2)) as BIGINT),
			cif_id, cif_source, 1, aa_number, joint_borrower_ind, aa_approved_date, ori_loc_country, ori_loc_org_code,
			annual_review_date, aa_stat, aa_create_date, (SELECT cms_le_sub_profile_id 
															FROM sci_le_sub_profile sp, sci_le_main_profile mp
														   WHERE lmp_le_id = t.cif_id
														     AND sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
														     AND mp.source_id = 'ARBS'), 
									'BANKING', 'ARBS',
									'I'
	   FROM si_temp_arbs_ca001 t
	  WHERE NOT EXISTS (SELECT '1' FROM stage_limit_profile 
	  					 WHERE llp_bca_ref_num = t.aa_number
	  					   AND source_id = 'ARBS') AND t.is_valid = 'Y');
								 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA001', 'ARBS', 5);
	commit;
	
	---------------------------------------
	-- Tag DELETED for non-exist records
	-- Actual table
	-- sci_lsp_lmt_profile
	--
	---------------------------------------
	lock table sci_lsp_lmt_profile in share mode;
	UPDATE sci_lsp_lmt_profile a SET (cms_bca_status, LAST_UPDATE_DATE, UPDATE_STATUS_IND) =
	('DELETED', current_timestamp, 'D')
	WHERE source_id = 'ARBS'
		AND cms_bca_status <> 'DELETED'
		AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_ca001 
	  	WHERE llp_bca_ref_num = aa_number AND is_valid = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA001', 'ARBS', 6);
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
  WHERE source_id = 'ARBS'
		AND cms_bca_status <> 'DELETED'
		AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_ca001 
				WHERE llp_bca_ref_num = aa_number AND is_valid = 'Y')
		AND cms_lsp_lmt_profile_id IN (SELECT staging_reference_id
										FROM transaction
										WHERE transaction_type = 'LIMITPROFILE'
											AND reference_id IN (SELECT cms_lsp_lmt_profile_id 
																	FROM sci_lsp_lmt_profile a
																	WHERE a.llp_bca_ref_num = s.llp_bca_ref_num
																		AND a.source_id = 'ARBS'));

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA001', 'ARBS', 0);
  
END@


CREATE PROCEDURE SI_RUN_TEMP_ARBS_CA002
	LANGUAGE SQL
BEGIN
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA002', 'ARBS', 1);
	commit;
	-------------------------------------
	-- Actual Table
	-- SCI_LSP_JOINT_BORROWER
	--
	-------------------------------------
	CALL SYSPROC.ADMIN_CMD('reorg table SCI_LSP_JOINT_BORROWER');
	call si_runstats('SCI_LSP_JOINT_BORROWER');
	
	UPDATE SCI_LSP_JOINT_BORROWER a SET (cms_lmp_limit_profile_id, ljb_le_id,
									ljb_lsp_id, ljb_bca_ref_num, source_id, cms_le_sub_profile_id,
									UPDATE_STATUS_IND) =
	(SELECT 
			(SELECT cms_lsp_lmt_profile_id FROM sci_lsp_lmt_profile
			  WHERE llp_bca_ref_num = t.AA_NUMBER AND source_id = 'ARBS'),
			t.CIF_ID,
			'1',
			t.AA_NUMBER,
			'ARBS',
			(SELECT cms_le_sub_profile_id FROM sci_le_main_profile mp, sci_le_sub_profile sp 
				WHERE sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
			 		AND mp.source_id = 'ARBS' AND mp.lmp_le_id = t.CIF_ID),
			'U'
	   FROM si_temp_arbs_ca002 t
	  WHERE t.aa_number = a.LJB_BCA_REF_NUM
			and t.cif_id = a.LJB_LE_ID
			and t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_ca002 
	  				 WHERE aa_number = ljb_bca_ref_num AND cif_id=a.LJB_LE_ID AND is_valid = 'Y')
	  	AND source_id = 'ARBS';
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA002', 'ARBS', 2);
	commit;

	INSERT INTO SCI_LSP_JOINT_BORROWER (cms_lsp_joint_borrower_id, cms_lmp_limit_profile_id, ljb_le_id,
									 ljb_lsp_id, ljb_bca_ref_num, source_id, cms_le_sub_profile_id,
									 UPDATE_STATUS_IND)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SCI_LSP_JOINT_BORROWER_SEQ), 2)) as BIGINT),
			(SELECT cms_lsp_lmt_profile_id FROM sci_lsp_lmt_profile
			  WHERE llp_bca_ref_num = t.aa_number AND source_id = 'ARBS'),
			t.CIF_ID,
			'1',
			t.AA_NUMBER,
			'ARBS',
			(SELECT cms_le_sub_profile_id FROM sci_le_main_profile mp, sci_le_sub_profile sp 
				WHERE sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
			 		AND mp.source_id = 'ARBS' AND mp.lmp_le_id = t.cif_id),
			'I'
	   FROM si_temp_arbs_ca002 t
	  WHERE NOT EXISTS (SELECT '1' FROM SCI_LSP_JOINT_BORROWER 
	  					 WHERE ljb_bca_ref_num = t.aa_number and ljb_le_id = t.CIF_ID
	  					   AND source_id = 'ARBS') AND t.is_valid = 'Y');
								 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA002', 'ARBS', 3);
	commit;
	
	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Actual Table
	-- SCI_LSP_JOINT_BORROWER
	--
	-------------------------------------

	UPDATE SCI_LSP_JOINT_BORROWER a SET (UPDATE_STATUS_IND) = ('D')
	WHERE source_id = 'ARBS'
		AND UPDATE_STATUS_IND <> 'D'
		AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_ca002 
	  				 WHERE aa_number=ljb_bca_ref_num AND cif_id=a.LJB_LE_ID AND is_valid='Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA002', 'ARBS', 0);
	  
END@


CREATE PROCEDURE SI_RUN_TEMP_ARBS_CA003
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA003', 'ARBS', 1);
	commit;
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT org_loc_org_code code, org_loc_org_desc desc,
			   org_loc_org_cat cat, 'ARBS' source_id
		  FROM si_temp_arbs_ca003
		 WHERE LENGTH(org_loc_org_code) > 0
		   AND LENGTH(org_loc_org_desc) > 0
		 UNION
		SELECT DISTINCT facility_type_code code, facility_type_desc desc,
			   facility_type_cat cat, 'ARBS' source_id
		  FROM si_temp_arbs_ca003
		 WHERE LENGTH(facility_type_code) > 0
		   AND LENGTH(facility_type_desc) > 0
		 UNION
		SELECT DISTINCT product_type_code code, product_type_desc desc,
			   product_type_cat cat, 'ARBS' source_id
		  FROM si_temp_arbs_ca003
		 WHERE LENGTH(product_type_code) > 0
		   AND LENGTH(product_type_desc) > 0
		 UNION
		SELECT DISTINCT loan_sector_code code, loan_sector_desc desc,
			   loan_sector_cat cat, 'ARBS' source_id
		  FROM si_temp_arbs_ca003
		 WHERE LENGTH(loan_sector_code) > 0
		   AND LENGTH(loan_sector_desc) > 0
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA003', 'ARBS', 2);
	commit;
	
	-------------------------------------
	-- Actual Table
	-- SCI_LSP_APPR_LMTS
	--
	-------------------------------------
	
	--------------------------------------
	-- set actual limit id
	--------------------------------------
	lock table si_temp_arbs_ca003 in exclusive mode;
	update si_temp_arbs_ca003 a 
	set cms_act_lmt_id = 
		(select cms_lsp_appr_lmts_id
		from sci_lsp_appr_lmts lmts
		where a.limit_id = lmts.lmt_id
		and lmts.source_id = 'ARBS')
	where a.is_valid = 'Y';
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA003', 'ARBS', 301);
	commit;
	
	call si_runstats('sci_lsp_appr_lmts');
	lock table sci_lsp_appr_lmts in share mode;
	UPDATE sci_lsp_appr_lmts a 
   SET (LMT_LE_ID, 
        LMT_BCA_REF_NUM, 
        LMT_ID, 
        LMT_EXPRY_DATE, 
        CMS_BKG_COUNTRY, 
        CMS_BKG_ORGANISATION, 
        LMT_CRRNCY_ISO_CODE, 
        LMT_AMT, 
        LMT_TENOR, 
        LMT_TENOR_BASIS_VALUE, 
        CMS_ACTIVATED_LIMIT, 
        CMS_OUTSTANDING_AMT, 
        lmt_prd_type_num, 
        lmt_prd_type_value, 
        lmt_fac_type_num, 
        lmt_fac_type_value, 
        cms_limit_profile_id, 
        source_id, 
        LMT_FAC_CODE, 
        LMT_FAC_SEQ, 
		LMT_LOAN_SECTOR_NUM,
		LMT_LOAN_SECTOR_VALUE,
		DISBURSED_IND,
        UPDATE_STATUS_IND, 
        cms_limit_status) = (SELECT CIF_ID, 
       AA_NUMBER, 
       LIMIT_ID, 
       EXPIRY_DATE, 
       ORI_LOC_COUNTRY, 
       ORG_LOC_ORG_CODE, 
       LIMIT_CURRENCY, 
       LIMIT_AMT, 
       LIMIT_TENOR, 
       LIMIT_TENOR_UOM, 
       DRAWING_LIMIT_AMT, 
       OUTSTANDING_AMT, 
       PRODUCT_TYPE_CAT, 
       PRODUCT_TYPE_CODE, 
       FACILITY_TYPE_CAT, 
       FACILITY_TYPE_CODE, 
       cms_act_lmt_profile_id, 
       'ARBS', 
       T1.FACILITY_CODE, 
       T1.FACILITY_SEQ, 
	   LOAN_SECTOR_CAT,
	   LOAN_SECTOR_CODE,
	   DISBURSED_IND,
       'U', 
       'ACTIVE' 
                               from si_temp_arbs_ca003 T1 
                              where T1.cms_act_lmt_id = a.cms_lsp_appr_lmts_id 
                                and T1.is_valid = 'Y') 
 where a.cms_lsp_appr_lmts_id IN (select T2.cms_act_lmt_id 
                                    from si_temp_arbs_ca003 T2 
                                   where T2.is_valid = 'Y' 
                                   GROUP BY T2.cms_act_lmt_id) 
   and a.source_id = 'ARBS';
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA003', 'ARBS', 3);
	commit;
				
	insert into sci_lsp_appr_lmts (
			CMS_LSP_APPR_LMTS_ID,
			LMT_LE_ID,
			LMT_BCA_REF_NUM,
			LMT_ID,
			LMT_EXPRY_DATE,
			CMS_BKG_COUNTRY,
			CMS_BKG_ORGANISATION,
			LMT_CRRNCY_ISO_CODE,
			LMT_AMT,
			LMT_TENOR,
			LMT_TENOR_BASIS_VALUE,
			CMS_ACTIVATED_LIMIT,
			CMS_OUTSTANDING_AMT,
			lmt_prd_type_num, 
			lmt_prd_type_value, 
			lmt_fac_type_num, 
			lmt_fac_type_value,
			lmt_type_num,
			lmt_type_value,
			cms_limit_profile_id,
			cms_limit_status,
			source_id,
			LMT_FAC_CODE,
			LMT_FAC_SEQ,
			cms_ref_id,
			LMT_LOAN_SECTOR_NUM,
			LMT_LOAN_SECTOR_VALUE,
			DISBURSED_IND,
			UPDATE_STATUS_IND
	)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT),
			CIF_ID,
			AA_NUMBER,
			LIMIT_ID,
			EXPIRY_DATE,
			ORI_LOC_COUNTRY,
			ORG_LOC_ORG_CODE,
			LIMIT_CURRENCY,
			LIMIT_AMT,
			LIMIT_TENOR,
			LIMIT_TENOR_UOM,
			DRAWING_LIMIT_AMT,
			OUTSTANDING_AMT,
			PRODUCT_TYPE_CAT,
			PRODUCT_TYPE_CODE,
			FACILITY_TYPE_CAT,
			FACILITY_TYPE_CODE,
			'25', 'OUTER',
			t.cms_act_lmt_profile_id,
--			(SELECT cms_lsp_lmt_profile_id FROM sci_lsp_lmt_profile
--						WHERE llp_bca_ref_num = t.AA_NUMBER
--							AND source_id = 'ARBS'
--						FETCH FIRST 1 ROW ONLY),
			'ACTIVE',
			'ARBS',
			t.FACILITY_CODE,
			t.FACILITY_SEQ,
			CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT),
			LOAN_SECTOR_CAT,
			LOAN_SECTOR_CODE,
			DISBURSED_IND,
			'I'
		FROM si_temp_arbs_ca003 t
		WHERE t.cms_act_lmt_id is null
			AND t.is_valid = 'Y');		
	
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA003', 'ARBS', 4);
	commit;
	
	-------------------------------------
	-- Staging Table
	-- STAGE_LIMIT
	--
	-------------------------------------
	
	-----------------------------------
	-- set cms staging limit id
	-----------------------------------
	lock table si_temp_arbs_ca003 in exclusive mode;
	update si_temp_arbs_ca003 a
	set cms_stg_lmt_id = 
		(select staging_reference_id
		from transaction trx, sci_lsp_appr_lmts lmts
		where trx.transaction_type = 'LIMIT'
		and trx.reference_id = lmts.cms_lsp_appr_lmts_id
		and lmts.source_id = 'ARBS'
		and lmts.lmt_id = a.limit_id
		and a.is_valid = 'Y')
	where is_valid = 'Y';
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA003', 'ARBS', 501);
	commit;

	call si_runstats('stage_limit');
	lock table stage_limit in share mode;
	UPDATE stage_limit s SET (
			LMT_LE_ID,
			LMT_BCA_REF_NUM,
			LMT_ID,
			LMT_EXPRY_DATE,
			CMS_BKG_COUNTRY,
			CMS_BKG_ORGANISATION,
			LMT_CRRNCY_ISO_CODE,
			LMT_AMT,
			LMT_TENOR,
			LMT_TENOR_BASIS_VALUE,
			CMS_ACTIVATED_LIMIT,
			CMS_OUTSTANDING_AMT,
			lmt_prd_type_num, 
			lmt_prd_type_value, 
			lmt_fac_type_num, 
			lmt_fac_type_value,
			cms_limit_profile_id,
			source_id,
			LMT_FAC_CODE,
			LMT_FAC_SEQ,
			LMT_LOAN_SECTOR_NUM,
			LMT_LOAN_SECTOR_VALUE,
			DISBURSED_IND,
			UPDATE_STATUS_IND,
			cms_limit_status
	)=
	(SELECT 
			CIF_ID,
			AA_NUMBER,
			LIMIT_ID,
			EXPIRY_DATE,
			ORI_LOC_COUNTRY,
			ORG_LOC_ORG_CODE,
			LIMIT_CURRENCY,
			LIMIT_AMT,
			LIMIT_TENOR,
			LIMIT_TENOR_UOM,
			DRAWING_LIMIT_AMT,
			OUTSTANDING_AMT,
			PRODUCT_TYPE_CAT,
			PRODUCT_TYPE_CODE,
			FACILITY_TYPE_CAT,
			FACILITY_TYPE_CODE,
			--pf.cms_lsp_lmt_profile_id,
			t.cms_act_lmt_profile_id,
			'ARBS',
			t.FACILITY_CODE,
			t.FACILITY_SEQ,
			LOAN_SECTOR_CAT,
			LOAN_SECTOR_CODE,
			DISBURSED_IND,
			'U',
			'ACTIVE'
			from si_temp_arbs_ca003 t
			where t.cms_stg_lmt_id = s.cms_lsp_appr_lmts_id
			and t.is_valid = 'Y')
		where source_id = 'ARBS'
		and exists (select '1'
				from si_temp_arbs_ca003 t
				where t.cms_stg_lmt_id = s.cms_lsp_appr_lmts_id
				and t.is_valid = 'Y');			
				
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA003', 'ARBS', 5);
	commit;
		
	insert into stage_limit (
			CMS_LSP_APPR_LMTS_ID,
			LMT_LE_ID,
			LMT_BCA_REF_NUM,
			LMT_ID,
			LMT_EXPRY_DATE,
			CMS_BKG_COUNTRY,
			CMS_BKG_ORGANISATION,
			LMT_CRRNCY_ISO_CODE,
			LMT_AMT,
			LMT_TENOR,
			LMT_TENOR_BASIS_VALUE,
			CMS_ACTIVATED_LIMIT,
			CMS_OUTSTANDING_AMT,
			lmt_prd_type_num, 
			lmt_prd_type_value, 
			lmt_fac_type_num, 
			lmt_fac_type_value,
			lmt_type_num,
			lmt_type_value,
			cms_limit_profile_id,
			cms_limit_status,
			source_id,
			LMT_FAC_CODE,
			LMT_FAC_SEQ,
			LMT_LOAN_SECTOR_NUM,
			LMT_LOAN_SECTOR_VALUE,
			DISBURSED_IND,
			UPDATE_STATUS_IND
	)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_seq), 2)) as BIGINT),
			CIF_ID,
			AA_NUMBER,
			LIMIT_ID,
			EXPIRY_DATE,
			ORI_LOC_COUNTRY,
			ORG_LOC_ORG_CODE,
			LIMIT_CURRENCY,
			LIMIT_AMT,
			LIMIT_TENOR,
			LIMIT_TENOR_UOM,
			DRAWING_LIMIT_AMT,
			OUTSTANDING_AMT,
			PRODUCT_TYPE_CAT,
			PRODUCT_TYPE_CODE,
			FACILITY_TYPE_CAT,
			FACILITY_TYPE_CODE,
			'25', 'OUTER',
			t.cms_act_lmt_profile_id,
			'ACTIVE',
			'ARBS',
			t.FACILITY_CODE,
			t.FACILITY_SEQ,
			LOAN_SECTOR_CAT,
			LOAN_SECTOR_CODE,
			DISBURSED_IND,
			'I'
		FROM si_temp_arbs_ca003 t
		WHERE t.cms_stg_lmt_id is null		
			and is_valid = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA003', 'ARBS', 6);
	commit;
	
	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Actual Table
	-- SCI_LSP_APPR_LMTS
	--
	-------------------------------------
	lock table sci_lsp_appr_lmts in share mode;
	UPDATE sci_lsp_appr_lmts a SET (cms_limit_status, UPDATE_STATUS_IND)=
	('DELETED', 'D')
  WHERE source_id = 'ARBS'
		AND cms_limit_status = 'ACTIVE'
		AND NOT EXISTS (SELECT '1' from si_temp_arbs_ca003 t
			WHERE t.LIMIT_ID=a.LMT_ID AND t.is_valid = 'Y');		

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA003', 'ARBS', 7);
	commit;

	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Staging Table
	-- STAGE_LIMIT
	--
	-------------------------------------
	lock table stage_limit in share mode;
	UPDATE stage_limit a SET (cms_limit_status, UPDATE_STATUS_IND)=
	('DELETED', 'D')
	 	WHERE source_id = 'ARBS'
			AND cms_limit_status = 'ACTIVE'
			AND NOT EXISTS (SELECT '1' from si_temp_arbs_ca003 t
				WHERE t.LIMIT_ID = a.LMT_ID AND t.is_valid = 'Y')
			AND CMS_LSP_APPR_LMTS_ID IN (select staging_reference_id from transaction
								where reference_id IN (select CMS_LSP_APPR_LMTS_ID 
														from sci_lsp_appr_lmts lmt
													where lmt.LMT_ID = a.LMT_ID
													and lmt.source_id = 'ARBS')
										and transaction_type = 'LIMIT');
		
  CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA003', 'ARBS', 0);
	 
END@


CREATE PROCEDURE SI_RUN_TEMP_ARBS_CA004
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA004', 'ARBS', 1);
	commit;
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT LOC_ORG_CODE code, LOC_ORG_DESC desc,
			   LOC_ORG_CAT cat, 'ARBS' source_id
		  FROM si_temp_arbs_ca004
		 WHERE LENGTH(LOC_ORG_CODE) > 0
		   AND LENGTH(LOC_ORG_DESC) > 0
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA004', 'ARBS', 2);
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
	LSX_EXT_SYS_ACCT_TYPE,
	LSX_EXT_SYS_ACCT_SEQ,
	LSX_LSP_ID,
	UPDATE_STATUS_IND,
	ACCT_STATUS
	)=
	(select 'ARBS',
	t.EXTERNAL_SYSTEM_ACCT_NO,
	(SELECT LLP_LE_ID FROM sci_lsp_lmt_profile
		WHERE llp_bca_ref_num = t.AA_NUMBER 
		AND source_id = 'ARBS'
			FETCH FIRST 1 ROW ONLY),
	(select pf.cms_customer_id 
	from sci_lsp_lmt_profile pf
		where pf.SOURCE_ID = 'ARBS'
		and pf.LLP_BCA_REF_NUM = t.AA_NUMBER),
	t.AA_NUMBER,
	LOC_COUNTRY,
	LOC_ORG_CODE,
	ACCT_TYPE,
	ACCT_SEQ,
	1,
	t.UPDATE_STAT_IND,
	(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'D' ELSE 'A' END)
	FROM SI_TEMP_ARBS_CA004 t 
	WHERE LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO 
		and LSX_EXT_SYS_CODE_VALUE='ARBS' 
		and t.acct_seq = LSX_EXT_SYS_ACCT_SEQ
		AND t.is_valid = 'Y')
	WHERE EXISTS (SELECT '1' FROM SI_TEMP_ARBS_CA004 t 
		WHERE LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO
			and LSX_EXT_SYS_CODE_VALUE='ARBS' 
			and t.ACCT_SEQ = LSX_EXT_SYS_ACCT_SEQ
			AND t.is_valid = 'Y')
	AND LSX_EXT_SYS_CODE_VALUE='ARBS';
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA004', 'ARBS', 3);
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
	LSX_EXT_SYS_ACCT_TYPE,
	LSX_EXT_SYS_ACCT_SEQ,
	LSX_LSP_ID,
	ACCT_DELQ_IND,
	UPDATE_STATUS_IND,
	ACCT_STATUS,
	LSX_EXT_SYS_CODE_NUM,
	LSX_EXT_CTY_CODE_VALUE)
	(select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CUSTOMER_X_REF_SEQ), 2)) as BIGINT),
	'ARBS',
	t.EXTERNAL_SYSTEM_ACCT_NO,
	(SELECT LLP_LE_ID FROM sci_lsp_lmt_profile
		WHERE llp_bca_ref_num = t.AA_NUMBER 
		AND source_id = 'ARBS'
		FETCH FIRST 1 ROW ONLY),
	(select pf.cms_customer_id 
	from sci_lsp_lmt_profile pf
		where pf.SOURCE_ID = 'ARBS'
		and pf.LLP_BCA_REF_NUM = t.AA_NUMBER
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
	LOC_COUNTRY
	FROM SI_TEMP_ARBS_CA004 t WHERE t.is_valid = 'Y' 
		AND NOT EXISTS (SELECT '1' 
			FROM SCI_LSP_SYS_XREF 
			WHERE LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO 
				and LSX_EXT_SYS_ACCT_SEQ = t.ACCT_SEQ
				and LSX_EXT_SYS_CODE_VALUE='ARBS'));
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA004', 'ARBS', 4);
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
	LSX_EXT_SYS_ACCT_TYPE,
	LSX_EXT_SYS_ACCT_SEQ,
	LSX_LSP_ID,
	UPDATE_STATUS_IND,
	ACCT_STATUS
	)=
	(select 'ARBS',
	t.EXTERNAL_SYSTEM_ACCT_NO,
	(SELECT LLP_LE_ID FROM sci_lsp_lmt_profile
		WHERE llp_bca_ref_num = t.AA_NUMBER 
		AND source_id = 'ARBS'
			FETCH FIRST 1 ROW ONLY),
	(select pf.CMS_CUSTOMER_ID
	from sci_lsp_lmt_profile pf
	where pf.LLP_BCA_REF_NUM = t.aa_number
	and pf.source_id = 'ARBS'
		FETCH FIRST 1 ROW ONLY),
	t.AA_NUMBER,
	LOC_COUNTRY,
	LOC_ORG_CODE,
	ACCT_TYPE,
	ACCT_SEQ,
	1,
	UPDATE_STATUS_IND,
	(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'D' ELSE 'A' END)
	FROM SI_TEMP_ARBS_CA004 t 
	WHERE LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO 
	and t.ACCT_SEQ = lsx_ext_sys_acct_seq
	and LSX_EXT_SYS_CODE_VALUE='ARBS' 
	AND t.is_valid = 'Y')
 	WHERE exists (select '1'
		from si_temp_arbs_ca004 t
		where lsx_ext_sys_acct_num = t.external_system_acct_no
		and lsx_ext_sys_acct_seq = t.acct_seq
		and lsx_ext_sys_code_value = 'ARBS'
		and exists (select '1'
					from stage_limit_xref map
					where s.CMS_LSP_SYS_XREF_ID = map.CMS_LSP_SYS_XREF_ID
					and exists 
						(select '1'
						from transaction 
						where transaction_type = 'LIMIT'
						and staging_reference_id = map.CMS_LSP_APPR_LMTS_ID)));
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA004', 'ARBS', 5);
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
	LSX_EXT_CTY_CODE_VALUE)
	(select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CUSTOMER_X_REF_SEQ), 2)) as BIGINT),
	'ARBS',
	t.EXTERNAL_SYSTEM_ACCT_NO,
	(SELECT LLP_LE_ID FROM sci_lsp_lmt_profile
		WHERE llp_bca_ref_num = t.AA_NUMBER 
		AND source_id = 'ARBS'
			FETCH FIRST 1 ROW ONLY),
	(select pf.cms_customer_id
	from sci_lsp_lmt_profile pf
	where pf.llp_bca_ref_num = t.aa_number
	and pf.source_id = 'ARBS'
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
	LOC_COUNTRY
	FROM SI_TEMP_ARBS_CA004 t 
	WHERE NOT EXISTS 
		(SELECT '1' 
		FROM CMS_STAGE_LSP_SYS_XREF 
		WHERE LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO 
		and lsx_ext_sys_acct_seq = t.ACCT_SEQ
		and LSX_EXT_SYS_CODE_VALUE='ARBS')
	AND t.is_valid = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA004', 'ARBS', 6);
	commit;
	
	-------------------------------------
	-- Update/insertion table
	-- SCI_LSP_LMTS_XREF_MAP
	--
	-------------------------------------
	lock table SCI_LSP_LMTS_XREF_MAP in share mode;
	UPDATE SCI_LSP_LMTS_XREF_MAP b SET(
	LXM_EXT_SYS_ACCT_TYPE,
	LXM_EXT_SYS_ACCT_SEQ,
	CMS_STATUS,
	UPDATE_STATUS_IND)=
	(select 
	ACCT_TYPE,
	ACCT_SEQ,
	(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END),
	t.UPDATE_STAT_IND
	FROM SI_TEMP_ARBS_CA004 t, SCI_LSP_SYS_XREF xf
	WHERE xf.CMS_LSP_SYS_XREF_ID = b.CMS_LSP_SYS_XREF_ID
			and xf.LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO 
			and xf.LSX_EXT_SYS_CODE_VALUE='ARBS'
			and xf.LSX_ext_sys_acct_seq = t.ACCT_SEQ
			and t.is_valid = 'Y')
	WHERE EXISTS (SELECT 1 from SI_TEMP_ARBS_CA004 t, SCI_LSP_SYS_XREF xf
		WHERE xf.CMS_LSP_SYS_XREF_ID = b.CMS_LSP_SYS_XREF_ID
			and xf.LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO 
			and xf.LSX_EXT_SYS_CODE_VALUE='ARBS'
			and xf.LSX_ext_sys_acct_seq = t.ACCT_SEQ
			and t.is_valid = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA004', 'ARBS', 7);
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
	LXM_EXT_SYS_ACCT_TYPE,
	LXM_EXT_SYS_ACCT_SEQ,
	CMS_STATUS,
	UPDATE_STATUS_IND)
	(select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_x_ref_seq), 2)) as BIGINT),
	lmts.LMT_LE_ID,
	lmts.lmt_id,
	lmts.CMS_LSP_APPR_LMTS_ID,
	(SELECT CMS_LSP_SYS_XREF_ID 
	FROM SCI_LSP_SYS_XREF 
	WHERE LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO 
		and LSX_ext_sys_acct_seq = t.ACCT_SEQ
		and LSX_EXT_SYS_CODE_VALUE='ARBS'),
	ACCT_TYPE,
	ACCT_SEQ,
	'ACTIVE',
	'I'
	FROM SI_TEMP_ARBS_CA004 t, sci_lsp_appr_lmts lmts
	WHERE LMT_BCA_REF_NUM = t.AA_NUMBER 
	and lmts.LMT_FAC_CODE = t.FACILITY_CODE
	and lmts.LMT_FAC_SEQ = t.FACILITY_SEQ
	and source_id = 'ARBS' 
	and NOT EXISTS 
	(SELECT '1' FROM SCI_LSP_SYS_XREF a, SCI_LSP_LMTS_XREF_MAP b 
		WHERE a.CMS_LSP_SYS_XREF_ID=b.CMS_LSP_SYS_XREF_ID 
			and a.LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO
			and a.lsx_ext_sys_acct_seq = t.ACCT_SEQ
			and a.LSX_EXT_SYS_CODE_VALUE='ARBS') 
	AND t.is_valid = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA004', 'ARBS', 8);
	commit;
	-------------------------------------
	-- Update/insertion table
	-- STAGE_LIMIT_XREF
	--
	-------------------------------------
	lock table STAGE_LIMIT_XREF in share mode;
	UPDATE STAGE_LIMIT_XREF b SET(
	LXM_EXT_SYS_ACCT_TYPE,
	LXM_EXT_SYS_ACCT_SEQ,
	CMS_STATUS,
	UPDATE_STATUS_IND)=
	(select 
	ACCT_TYPE,
	ACCT_SEQ,
	(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END),
	t.UPDATE_STAT_IND
	FROM SI_TEMP_ARBS_CA004 t, CMS_STAGE_LSP_SYS_XREF a 
		WHERE a.CMS_LSP_SYS_XREF_ID=b.CMS_LSP_SYS_XREF_ID 
			and a.LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO
			and a.lsx_ext_sys_acct_seq = t.ACCT_SEQ
			and a.LSX_EXT_SYS_CODE_VALUE='ARBS' 
			AND t.is_valid = 'Y')
 	WHERE CMS_LSP_APPR_LMTS_ID IN (select staging_reference_id from transaction
									where reference_id IN (select CMS_LSP_APPR_LMTS_ID 
															from sci_lsp_appr_lmts, SI_TEMP_ARBS_CA004
														where LMT_BCA_REF_NUM = AA_NUMBER 
														and lmt_fac_code = facility_code
														and lmt_fac_seq = facility_seq
														and source_id = 'ARBS' 
														AND is_valid = 'Y')
												and transaction_type = 'LIMIT');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA004', 'ARBS', 9);
	commit;
												
	INSERT INTO STAGE_LIMIT_XREF(
	CMS_LSP_LMTS_XREF_MAP_ID,
	LXM_LE_ID,
	LXM_LMT_ID,
	CMS_LSP_APPR_LMTS_ID,
	CMS_LSP_SYS_XREF_ID,
	LXM_EXT_SYS_ACCT_TYPE,
	LXM_EXT_SYS_ACCT_SEQ,
	CMS_STATUS,
	UPDATE_STATUS_IND)
	(select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_x_ref_seq), 2)) as BIGINT),
	lmts.LMT_LE_ID,
	lmts.lmt_id,
	lmts.CMS_LSP_APPR_LMTS_ID,
	(SELECT max(CMS_LSP_SYS_XREF_ID)
	FROM cms_stage_lsp_sys_xref
	WHERE LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO 
		and LSX_EXT_SYS_CODE_VALUE='ARBS'
		and lsx_ext_sys_acct_seq = t.ACCT_SEQ),
	ACCT_TYPE,
	ACCT_SEQ,
	'ACTIVE',
	'I'
	FROM SI_TEMP_ARBS_CA004 t, stage_limit lmts
	WHERE LMT_BCA_REF_NUM = t.AA_NUMBER 
	and lmts.LMT_FAC_CODE = t.FACILITY_CODE
	and lmts.LMT_FAC_SEQ = t.FACILITY_SEQ
	and source_id = 'ARBS' 
	and NOT EXISTS 
	(SELECT '1' 
	FROM CMS_STAGE_LSP_SYS_XREF a, STAGE_LIMIT_XREF b
		WHERE a.CMS_LSP_SYS_XREF_ID=b.CMS_LSP_SYS_XREF_ID 
			and a.LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO
			and a.LSX_ext_sys_acct_seq = t.ACCT_SEQ
			and a.LSX_EXT_SYS_CODE_VALUE='ARBS') 
	AND t.is_valid = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA004', 'ARBS', 10);
	commit;
	
	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Actual Table
	-- SCI_LSP_SYS_XREF
	--
	-------------------------------------
	lock table SCI_LSP_SYS_XREF in share mode;
	UPDATE SCI_LSP_SYS_XREF a SET (ACCT_STATUS, UPDATE_STATUS_IND)=('D', 'D')
  WHERE LSX_EXT_SYS_CODE_VALUE = 'ARBS'
		AND ACCT_STATUS = 'A'
		AND NOT EXISTS (SELECT '1' from si_temp_arbs_ca004 t
			WHERE t.EXTERNAL_SYSTEM_ACCT_NO = a.LSX_EXT_SYS_ACCT_NUM 
				AND t.ACCT_SEQ = a.LSX_EXT_SYS_ACCT_SEQ
				AND t.is_valid = 'Y');		

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA004', 'ARBS', 11);
	commit;

	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Staging Table
	-- CMS_STAGE_LSP_SYS_XREF
	--
	-------------------------------------
	lock table CMS_STAGE_LSP_SYS_XREF in share mode;
	UPDATE CMS_STAGE_LSP_SYS_XREF a SET (ACCT_STATUS, UPDATE_STATUS_IND)=('D', 'D')
  WHERE LSX_EXT_SYS_CODE_VALUE = 'ARBS'
		AND ACCT_STATUS = 'A'
		AND EXISTS (select '1'
					from stage_limit_xref map
					where a.CMS_LSP_SYS_XREF_ID = map.CMS_LSP_SYS_XREF_ID
					and exists 
						(select '1'
						from transaction 
						where transaction_type = 'LIMIT'
						and staging_reference_id = map.CMS_LSP_APPR_LMTS_ID))
		AND NOT EXISTS (SELECT '1' from si_temp_arbs_ca004 t
			WHERE t.EXTERNAL_SYSTEM_ACCT_NO = a.LSX_EXT_SYS_ACCT_NUM 
				AND t.ACCT_SEQ = a.LSX_EXT_SYS_ACCT_SEQ
				AND t.is_valid = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA004', 'ARBS', 12);
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
				and xf.LSX_EXT_SYS_CODE_VALUE='ARBS'
				and xf.ACCT_STATUS = 'D');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA004', 'ARBS', 13);
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
				and xf.LSX_EXT_SYS_CODE_VALUE='ARBS'
				and xf.ACCT_STATUS = 'D');
				
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA004', 'ARBS', 0);
	
END@


CREATE PROCEDURE SI_RUN_TEMP_ARBS_CA005
	LANGUAGE SQL
BEGIN

		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA005', 'ARBS', 1);
		commit;
		
		CALL SI_RUNSTATS('SI_TEMP_ARBS_CA005');
		COMMIT;
		
		lock table cms_limit_security_map in share mode;
		update cms_limit_security_map m set(UPDATE_STATUS_IND, DELETION_DATE)=
		('D', current_timestamp)
		WHERE m.UPDATE_STATUS_IND <> 'D'
			AND m.SOURCE_ID = 'ARBS'
			AND NOT EXISTS (SELECT 1 from SI_TEMP_ARBS_CA005 t
			WHERE t.CMS_ACT_COL_ID=m.CMS_COLLATERAL_ID
				AND t.CMS_ACT_LMT_ID=m.CMS_LSP_APPR_LMTS_ID
				AND t.IS_VALID='Y');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA005', 'ARBS', 2);
		commit;
		
		INSERT INTO cms_limit_security_map (
		charge_id,
		cms_lsp_appr_lmts_id,
		cms_collateral_id,
		sci_las_lmt_id,
		customer_category,
		cms_lsp_lmt_profile_id,
		SCI_LAS_BCA_REF_NUM,
		SCI_LAS_FAC_CODE,
		SCI_LAS_FAC_SEQ,
		SCI_LAS_LE_ID,
		CREATE_DATE,
		SOURCE_ID,
		UPDATE_STATUS_IND
		)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_LIMIT_SECURITY_MAP_SEQ), 2)) as BIGINT), 
		CMS_ACT_LMT_ID,
		CMS_ACT_COL_ID,
		SRC_LMT_ID,
		'MB',
		CMS_ACT_LMT_PROFILE_ID,
		t.AA_NUMBER,
		t.FACILITY_CODE,
		t.FACILITY_SEQ,
		(SELECT LMT_LE_ID FROM sci_lsp_appr_lmts where CMS_LSP_APPR_LMTS_ID = CMS_ACT_LMT_ID),
		current_timestamp,
		'ARBS',
		'I'
 		FROM SI_TEMP_ARBS_CA005 t WHERE t.is_valid = 'Y'
		and cms_act_lmt_id is not null
		and cms_act_col_id is not null
		and not exists
		(select 1 from cms_limit_security_map b
			where b.cms_collateral_id=t.CMS_ACT_COL_ID
			and b.cms_lsp_appr_lmts_id=t.CMS_ACT_LMT_ID)
		group by 
		CMS_ACT_LMT_ID,
		CMS_ACT_COL_ID,
		SRC_LMT_ID,
		CMS_ACT_LMT_PROFILE_ID,
		t.AA_NUMBER,
		t.FACILITY_CODE,
		t.FACILITY_SEQ);
		
		call si_runstats('CMS_LIMIT_SECURITY_MAP');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA005', 'ARBS', 3);
		commit;
		
		---------------------------------
		-- Account and security map table
		-- cms_account_sec_map
		--
		----------------------------------
		lock table cms_account_sec_map in share mode;
		update cms_account_sec_map b set status = 'D'
		where status <> 'D'
			AND EXISTS (select 1 from cms_limit_security_map m 
					where m.CMS_COLLATERAL_ID=b.CMS_COLLATERAL_ID
					AND m.CMS_LSP_APPR_LMTS_ID=b.CMS_LSP_APPR_LMTS_ID
					AND m.UPDATE_STATUS_IND = 'D');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA005', 'ARBS', 4);
		commit;
		
		INSERT INTO cms_account_sec_map (
		 	cms_account_sec_map_id,
 			asm_ext_sys_account_num,
 			asm_ext_sys_account_type,
 			asm_ext_sys_account_seq,
 			asm_src_security_id,
 			cms_lsp_sys_xref_id,
 			cms_collateral_id,
 			cms_lsp_appr_lmts_id,
 			status
		)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_ACCOUNT_SEC_MAP_SEQ), 2)) as BIGINT), 
		t.EXTERNAL_SYSTEM_ACCT_NO,
		t.ACCT_TYPE,
		t.ACCT_SEQ,
		t.SECURITY_ID,
		a.CMS_LSP_SYS_XREF_ID,
		CMS_ACT_COL_ID,
		CMS_ACT_LMT_ID,
		t.UPDATE_STAT_IND
 		FROM SI_TEMP_ARBS_CA005 t inner join SCI_LSP_SYS_XREF a 
		on a.LSX_EXT_SYS_ACCT_NUM = t.EXTERNAL_SYSTEM_ACCT_NO and a.lsx_ext_sys_acct_seq = t.ACCT_SEQ
		WHERE a.LSX_EXT_SYS_CODE_VALUE='ARBS' 
			AND t.is_valid = 'Y'
			and cms_act_lmt_id is not null
			and cms_act_col_id is not null
			and not exists
			(select 1 from cms_account_sec_map b
				where b.cms_collateral_id=t.CMS_ACT_COL_ID 
					and b.cms_lsp_appr_lmts_id=t.CMS_ACT_LMT_ID
					and asm_ext_sys_account_num=t.EXTERNAL_SYSTEM_ACCT_NO
					and asm_ext_sys_account_seq=t.ACCT_SEQ
					and asm_src_security_id=t.SECURITY_ID));
 
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA005', 'ARBS', 5);
		commit;

		DECLARE GLOBAL TEMPORARY TABLE SESSION.stg_lmt_sec_map
			(cms_act_col_id BIGINT,
			 cms_act_lmt_id BIGINT,
			 cms_stg_lmt_id BIGINT)
		WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;

		INSERT INTO SESSION.stg_lmt_sec_map (cms_act_col_id, cms_act_lmt_id)
		(SELECT cms_collateral_id, cms_lsp_appr_lmts_id
		   FROM cms_limit_security_map
		  WHERE update_status_ind = 'D'
			AND DATE(DELETION_DATE) = DATE(CURRENT TIMESTAMP)
			AND source_id = 'ARBS'
			AND NOT EXISTS (SELECT 1 from si_temp_arbs_ca005 t
							 WHERE cms_act_col_id = cms_collateral_id
							   AND cms_act_lmt_id = cms_lsp_appr_lmts_id
							   AND is_valid = 'Y'));
										
		UPDATE SESSION.stg_lmt_sec_map a SET cms_stg_lmt_id =
		(SELECT staging_reference_id FROM transaction
		  WHERE transaction_type = 'LIMIT'
			AND reference_id = a.cms_act_lmt_id);

		UPDATE cms_stage_limit_security_map set(update_status_ind, deletion_date) = ('D', CURRENT_TIMESTAMP)
		 WHERE (cms_collateral_id, cms_lsp_appr_lmts_id) IN 
		 	   (SELECT cms_act_col_id, cms_stg_lmt_id FROM SESSION.stg_lmt_sec_map);

		DROP TABLE SESSION.stg_lmt_sec_map;

		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA005', 'ARBS', 6);
		commit;
		
		-------------------------------------
		-- Update/insertion table
		-- cms_stage_limit_security_map
		--
		-------------------------------------
		INSERT INTO cms_stage_limit_security_map (
		charge_id,
		cms_lsp_appr_lmts_id,
		cms_collateral_id,
		sci_las_lmt_id,
		customer_category,
		cms_lsp_lmt_profile_id,
		SCI_LAS_BCA_REF_NUM,
		SCI_LAS_FAC_CODE,
		SCI_LAS_FAC_SEQ,
		SCI_LAS_LE_ID,
		CREATE_DATE,
		SOURCE_ID,
		UPDATE_STATUS_IND
		)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_LIMIT_SECURITY_MAP_SEQ), 2)) as BIGINT), 
		STG_LMT_ID,
		CMS_ACT_COL_ID,
		SRC_LMT_ID,
		'MB',
		CMS_ACT_LMT_PROFILE_ID,
		t.AA_NUMBER,
		t.FACILITY_CODE,
		t.FACILITY_SEQ,
		(SELECT LMT_LE_ID FROM sci_lsp_appr_lmts where CMS_LSP_APPR_LMTS_ID = STG_LMT_ID),
		current_timestamp,
		'ARBS',
		'I'
 		FROM SI_TEMP_ARBS_CA005 t WHERE t.is_valid = 'Y'
		and STG_LMT_ID is not null
		and CMS_ACT_COL_ID is not null
		and not exists
		(select 1 from cms_stage_limit_security_map b
			where b.cms_collateral_id=t.CMS_ACT_COL_ID
			and b.cms_lsp_appr_lmts_id=t.STG_LMT_ID)
		group by 
		STG_LMT_ID,
		CMS_ACT_COL_ID,
		SRC_LMT_ID,
		CMS_ACT_LMT_PROFILE_ID,
		t.AA_NUMBER,
		t.FACILITY_CODE,
		t.FACILITY_SEQ);
		
	call si_runstats('CMS_STAGE_LIMIT_SECURITY_MAP');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA005', 'ARBS', 0);
	
END@

CREATE PROCEDURE SI_RUN_TEMP_ARBS_CO001(IN LOAD_TYPE VARCHAR(255))
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO001', 'ARBS', 1);
	commit;
	--------------------------------------------
	-- Update security type and subtype id first
	-- si_temp_arbs_co001
	-- @refer si_host_col_code_map
	--
	--------------------------------------------

	UPDATE si_temp_arbs_co001 a 
	   SET (cms_security_type_id, cms_security_subtype_id, asset_type_cat) =
	(SELECT security_type_id, security_sub_type_id,
			CASE security_type_id
				WHEN 'AB101'
					THEN 'PLANT_EQUIP'
				WHEN 'AB102'
					THEN 'VEHICLE_TYPE'
				WHEN 'AB103'
					THEN 'AB_OTHERS_TYPE'
			END
	   FROM si_host_col_code_map
	  WHERE host_col_code = a.source_security_sub_type);

	--------------------------------------
	-- Populate CMS key into Temp table
	-- Collateral, act and stg
	-- brand code
	--------------------------------------
	  
	UPDATE si_temp_arbs_co001 a SET (cms_act_col_id, cms_stg_col_id) =
	(SELECT reference_id, staging_reference_id
	   FROM transaction, cms_security
	  WHERE transaction_type = 'COL'
	    AND reference_id = cms_collateral_id
		AND a.security_id = sci_security_dtl_id
		AND source_id = 'ARBS');
		
	UPDATE si_temp_arbs_co001 a SET brand_entry_code = 
	(SELECT entry_code FROM common_code_category_entry
	  WHERE category_code = 'VEHICLE_BRAND'
		AND entry_name = a.brand)
	 WHERE cms_security_subtype_id = 'AB102';
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO001', 'ARBS', 2);
	COMMIT;
	  
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_security a SET (sci_reference_note, security_sub_type_id, sci_security_type_value, sci_security_subtype_value, 
							   sci_security_currency, security_location, security_organisation, custodian_type, security_maturity_date, 
							   is_legal_enforce, is_legal_enforce_date, security_perfection_date, source_security_type, 
							   source_security_sub_type,
								 status) =
	(SELECT security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, 
			loc_country, loc_org_code, custodian_type, 
			(CASE WHEN year(security_expiry_date)+1>=10000 THEN security_expiry_date ELSE
				(security_expiry_date + (select lifespan from cms_security_asset_life where security_sub_type_id = t.cms_security_subtype_id) year)
			END), 
			legal_enforceability, legal_enforceability_date, 
			security_perfection_date, source_security_type, source_security_sub_type,
			(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co001 t
	  WHERE t.cms_act_col_id = a.cms_collateral_id
			and is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co001
	  				 WHERE a.cms_collateral_id = cms_act_col_id
	  				   AND is_valid = 'Y')
	  	AND source_id = 'ARBS'
	  	AND security_sub_type_id IN ('AB101', 'AB102', 'AB103');

	INSERT INTO cms_security (cms_collateral_id, sci_security_dtl_id, sci_reference_note, security_sub_type_id, 
								sci_security_type_value, sci_security_subtype_value, sci_security_currency, sci_orig_security_currency,
								security_location, security_organisation, custodian_type, security_maturity_date, 
								is_legal_enforce, is_legal_enforce_date, security_perfection_date, source_security_type, 
							    source_security_sub_type, status, source_id, is_migrated_ind)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
			security_id, security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, currency,
			loc_country, loc_org_code, custodian_type, 
			(CASE WHEN year(security_expiry_date)+1>=10000 THEN security_expiry_date ELSE
				(security_expiry_date + (select lifespan from cms_security_asset_life where security_sub_type_id = t.cms_security_subtype_id) year)
			END),
			legal_enforceability, legal_enforceability_date, 
			security_perfection_date, source_security_type, source_security_sub_type, 'ACTIVE', 'ARBS', 'N'
	   FROM si_temp_arbs_co001 t
	  WHERE cms_act_col_id IS NULL
		and is_valid = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO001', 'ARBS', 3);
	commit;
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND type_name IS NULL;
	 
	-------------------------------------
	-- Actual Table
	-- CMS_ASSET
	--
	-------------------------------------
	
	UPDATE cms_asset a SET (asset_description, type_of_asset, purchase_price, purchase_currency, purchase_date,
							reg_date, manufacture_year, model_no, 
							--residual_asset_life, residual_asset_life_uom, 
							asset_value,
							--derived, refering ABCMS-235
							--doc_perfect_age, 
							sales_proceed, reg_no, reg_fee, brand, good_status, reg_card_no, chassis_number,
							repossession_date, repossession_age, yard, ins_indicator, auto_dr_collateral_fee, engine_number,
							horse_power, downpayment_tradein, downpayment_cash, freight_charges, price_list, heavyvehicle_type,
							public_transport, amt_collected_from_sales,
							ASSET_TYPE_HOST_REF) =
	(SELECT asset_desc, asset_type_code, purchase_price, purchase_price_currency, purchase_date, reg_date,
			manufacture_year, model_no, 
			--residual_asset_life, residual_asset_life_unit, 
			asset_value, 
			--document_perfection_age,
			sales_proceed, reg_no, reg_fee, brand_entry_code, 
			CASE good_stat
				WHEN 'I' THEN 'N'
				WHEN 'G' THEN 'N'
				ELSE good_stat
			END,
			reg_card_number, chassis_number, date(reposession_date), reposession_age, yard, insurance_ind, auto_dr_collateral_fee, 
			engine_number, horse_power, down_payment_trade_in, down_payment_cash, freight_charges, price_list, heavy_vehicle_type, 
			public_transport, amt_collected_from_sales,
			t.ASSET_TYPE_DESC
	   FROM cms_security sec, si_temp_arbs_co001 t
	  WHERE sec.cms_collateral_id = t.cms_act_col_id
	    AND a.cms_collateral_id = sec.cms_collateral_id)
	  WHERE EXISTS (SELECT '1' FROM cms_security, si_temp_arbs_co001
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND cms_collateral_id = cms_act_col_id
	    			   AND source_id = 'ARBS'
					   AND is_valid = 'Y'
					   AND security_sub_type_id IN ('AB101', 'AB102', 'AB103'));

	INSERT INTO cms_asset (cms_collateral_id, asset_description, type_of_asset, purchase_price, purchase_currency, purchase_date,
						   reg_date, manufacture_year, model_no, 
							 --residual_asset_life, residual_asset_life_uom, 
							 asset_value,
						   --derived, refering ABCMS-235
								--doc_perfect_age, 
							 sales_proceed, reg_no, reg_fee, brand, good_status, reg_card_no, chassis_number,
						   repossession_date, repossession_age, yard, ins_indicator, auto_dr_collateral_fee, engine_number,
						   horse_power, downpayment_tradein, downpayment_cash, freight_charges, price_list, heavyvehicle_type,
						   public_transport, amt_collected_from_sales,
							 ASSET_TYPE_HOST_REF, env_risky_status)
	(SELECT cms_collateral_id, asset_desc, asset_type_code, purchase_price, purchase_price_currency, purchase_date, reg_date,
			manufacture_year, model_no, 
			--residual_asset_life, residual_asset_life_unit, 
			asset_value, 
			--document_perfection_age,
			sales_proceed, reg_no, reg_fee, brand_entry_code, 
			CASE good_stat
				WHEN 'I' THEN 'N'
				WHEN 'G' THEN 'N'
				ELSE good_stat
			END, 
			reg_card_number, chassis_number, DATE(reposession_date), reposession_age, yard, insurance_ind, auto_dr_collateral_fee, 
			engine_number, horse_power, down_payment_trade_in, down_payment_cash, freight_charges, price_list, heavy_vehicle_type, public_transport, amt_collected_from_sales,
			t.ASSET_TYPE_DESC, 'N'
	   FROM cms_security sec, si_temp_arbs_co001 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS'
	    AND cms_act_col_id IS NULL
		AND is_valid = 'Y'
		AND security_sub_type_id IN ('AB101', 'AB102', 'AB103'));
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO001', 'ARBS', 4);
	COMMIT;
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_stage_security a SET (sci_reference_note, security_sub_type_id, sci_security_type_value, sci_security_subtype_value, 
							   		 sci_security_currency, security_location, security_organisation, custodian_type, 
							   		 security_maturity_date, is_legal_enforce, is_legal_enforce_date, security_perfection_date,
							   		 source_security_type, source_security_sub_type,
										 status) =
	(SELECT security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, 
			loc_country, loc_org_code, custodian_type, 
			(CASE WHEN year(security_expiry_date)+1>=10000 THEN security_expiry_date ELSE
				(security_expiry_date + (select lifespan from cms_security_asset_life where security_sub_type_id = t.cms_security_subtype_id) year)
			END), 
			legal_enforceability, legal_enforceability_date, 
			security_perfection_date, source_security_type, source_security_sub_type,
			(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co001 t
	  WHERE t.security_id = a.sci_security_dtl_id
			and is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co001
	  				 WHERE a.cms_collateral_id = cms_stg_col_id
	  				   and is_valid = 'Y')
	  	AND source_id = 'ARBS'
	  	AND security_sub_type_id IN ('AB101', 'AB102', 'AB103');

	INSERT INTO cms_stage_security (cms_collateral_id, sci_security_dtl_id, sci_reference_note, security_sub_type_id, 
									  sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, sci_security_currency, sci_orig_security_currency,
									  security_location, SECURITY_ORGANISATION, custodian_type, security_maturity_date, 
									  is_legal_enforce, is_legal_enforce_date, security_perfection_date, source_security_type, 
									  source_security_sub_type, status, source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
			security_id, security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, currency,
			loc_country, loc_org_code, custodian_type, 
			(CASE WHEN year(security_expiry_date)+1>=10000 THEN security_expiry_date ELSE
				(security_expiry_date + (select lifespan from cms_security_asset_life where security_sub_type_id = t.cms_security_subtype_id) year)
			END),
			legal_enforceability, legal_enforceability_date, 
			security_perfection_date, source_security_type, source_security_sub_type, 'ACTIVE', 'ARBS'
	   FROM si_temp_arbs_co001 t
	  WHERE cms_stg_col_id IS NULL
	    AND is_valid = 'Y');
			
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO001', 'ARBS', 5);
	COMMIT;
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_stage_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND TYPE_NAME IS NULL;
	 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_ASSET
	--
	-------------------------------------
	
	UPDATE cms_stage_asset a SET (asset_description, type_of_asset, purchase_price, purchase_currency, purchase_date,
								  reg_date, manufacture_year, model_no, 
									--residual_asset_life, residual_asset_life_uom, 
									asset_value,
								  --derived, refering ABCMS-235
									--doc_perfect_age,  
									sales_proceed, reg_no, reg_fee, brand, good_status, reg_card_no, chassis_number,
								  repossession_date, repossession_age, yard, ins_indicator, auto_dr_collateral_fee, engine_number,
								  horse_power, downpayment_tradein, downpayment_cash, freight_charges, price_list, heavyvehicle_type,
								  public_transport, amt_collected_from_sales,
									ASSET_TYPE_HOST_REF) =
	(SELECT asset_desc, asset_type_code, purchase_price, purchase_price_currency, purchase_date, reg_date,
			manufacture_year, model_no, 
			--residual_asset_life, residual_asset_life_unit, 
			asset_value, 
			--document_perfection_age,
			sales_proceed, reg_no, reg_fee, brand_entry_code, 
			CASE good_stat
				WHEN 'I' THEN 'N'
				WHEN 'G' THEN 'N'
				ELSE good_stat
			END, reg_card_number, chassis_number, date(reposession_date), reposession_age, yard, insurance_ind, auto_dr_collateral_fee, 
			engine_number, horse_power, down_payment_trade_in, down_payment_cash, freight_charges, price_list, heavy_vehicle_type, 
			public_transport, amt_collected_from_sales,
			t.ASSET_TYPE_DESC
	   FROM cms_stage_security sec, si_temp_arbs_co001 t
	  WHERE sec.cms_collateral_id  = t.cms_stg_col_id
	    AND a.cms_collateral_id = sec.cms_collateral_id
		AND sec.security_sub_type_id IN ('AB101', 'AB102', 'AB103'))
	  WHERE EXISTS (SELECT '1' FROM cms_stage_security, si_temp_arbs_co001
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND cms_collateral_id = cms_stg_col_id
	    			   AND source_id = 'ARBS'
					   AND is_valid = 'Y'
					   AND security_sub_type_id IN ('AB101', 'AB102', 'AB103'));

	INSERT INTO cms_stage_asset (cms_collateral_id, asset_description, type_of_asset, purchase_price, purchase_currency, 
								   purchase_date, reg_date, manufacture_year, model_no, 
									 --residual_asset_life, residual_asset_life_uom, 
								   asset_value, 
									 --derived, refering ABCMS-235
										--doc_perfect_age,  
									 sales_proceed, reg_no, reg_fee, brand, good_status, reg_card_no, 
								   chassis_number, repossession_date, repossession_age, yard, ins_indicator, auto_dr_collateral_fee, 
								   engine_number, horse_power, downpayment_tradein, downpayment_cash, freight_charges, price_list, 
								   heavyvehicle_type, public_transport, amt_collected_from_sales,
									 ASSET_TYPE_HOST_REF, ENV_RISKY_STATUS)
	(SELECT cms_collateral_id, asset_desc, asset_type_code, purchase_price, purchase_price_currency, purchase_date, reg_date,
			manufacture_year, model_no, 
			--residual_asset_life, residual_asset_life_unit, 
			asset_value, 
			--document_perfection_age,
			sales_proceed, reg_no, reg_fee, brand_entry_code, 
			CASE good_stat
				WHEN 'I' THEN 'N'
				WHEN 'G' THEN 'N'
				ELSE good_stat
			END, reg_card_number, chassis_number, DATE(reposession_date), reposession_age, yard, insurance_ind, auto_dr_collateral_fee, 
			engine_number, horse_power, down_payment_trade_in, down_payment_cash, freight_charges, price_list, heavy_vehicle_type, 
			public_transport, amt_collected_from_sales,
			t.ASSET_TYPE_DESC, 'N'
	   FROM cms_stage_security sec, si_temp_arbs_co001 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS'
	    AND cms_stg_col_id IS NULL
		AND IS_VALID = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO001', 'ARBS', 6);
	COMMIT;

	----------------------------
	-- Begin Update
	-- cms_security_source
	--
	----------------------------
	UPDATE cms_security_source SET(cms_collateral_id, source_security_id, source_id, 
								   last_update_date, security_sub_type_id, interface_id,
									 status) =
	(SELECT cms_collateral_id, security_id, 'ARBS', current_timestamp, cms_security_subtype_id,
		'CO001',
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM cms_security sec, si_temp_arbs_co001 t 
	  WHERE sec.sci_security_dtl_id = security_id
	    AND sec.sci_security_dtl_id = source_security_id 
	    AND source_id = 'ARBS' 
	    AND is_valid = 'Y'
		AND sec.security_sub_type_id IN ('AB101', 'AB102', 'AB103'))
	 WHERE EXISTS (SELECT 1 FROM si_temp_arbs_co001
	 				WHERE source_security_id = security_id 
	 				  AND is_valid = 'Y')
	   AND source_id = 'ARBS';
	
	----------------------------
	-- Begin Insertion
	-- cms_security_source
	--
	----------------------------
	INSERT INTO cms_security_source (cms_security_source_id, cms_collateral_id, source_security_id, source_id, 
									 status, last_update_date, security_sub_type_id, interface_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
			cms_collateral_id, security_id, 'ARBS', 'ACTIVE', CURRENT_TIMESTAMP, cms_security_subtype_id,
			'CO001'
	   FROM cms_security sec, si_temp_arbs_co001 t
	  WHERE NOT EXISTS (SELECT 1 FROM cms_security_source 
						 WHERE source_security_id = security_id 
						   AND source_id = 'ARBS') 
		AND is_valid = 'Y'
		AND sec.sci_security_dtl_id = t.security_id
		AND sec.security_sub_type_id IN ('AB101', 'AB102', 'AB103')
		AND source_id = 'ARBS');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO001', 'ARBS', 7);
	COMMIT;
	
	------------------------------------------
	-- START Update Collateral Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------	
	FOR cur_col_key AS
		SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
			FROM CMS_SECURITY a
		WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co001 t
							WHERE a.SCI_SECURITY_DTL_ID = t.SECURITY_ID		   	  
									AND t.is_valid = 'Y')
			AND a.SOURCE_ID = 'ARBS'	   
			
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
	END FOR;

	IF(upper(LOAD_TYPE)='FULL') THEN
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO001', 'ARBS', 8);
		COMMIT;
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Actual Table
		-- CMS_SECURITY
		--
		-------------------------------------
		UPDATE cms_security a SET (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
			WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id IN ('AB101', 'AB102', 'AB103')
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co001
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y');
		
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Staging Table
		-- CMS_STAGE_SECURITY
		--
		-------------------------------------
		UPDATE cms_stage_security a set (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
		WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id IN ('AB101', 'AB102', 'AB103')
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co001
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y')
				AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
											WHERE reference_id IN (SELECT cms_collateral_id 
																		FROM cms_security b
																		WHERE a.SCI_SECURITY_DTL_ID = b.sci_security_dtl_id
																			AND security_sub_type_id IN ('AB101', 'AB102', 'AB103')
																			AND b.source_id = 'ARBS')
												AND transaction_type = 'COL');
	
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO001', 'ARBS', 9);
		commit;
		
		------------------------------------
		-- Tag DELETED for non-exist records
		-- cms_security_source
		--
		------------------------------------
		UPDATE cms_security_source SET(STATUS, last_update_date) =
		('DELETED', current_timestamp)
		WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
			AND security_sub_type_id IN ('AB101', 'AB102', 'AB103')
			AND NOT EXISTS (SELECT 1 FROM si_temp_arbs_co001
						WHERE source_security_id = security_id
							AND is_valid = 'Y');
	END IF;

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO001', 'ARBS', 0);			
END
@

CREATE PROCEDURE SI_RUN_TEMP_ARBS_CO002 (IN LOAD_TYPE VARCHAR(255))
	LANGUAGE SQL
BEGIN
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO002', 'ARBS', 1);
	commit;
	--------------------------------------------
	-- Update security type and subtype id first
	-- si_temp_arbs_co002
	-- @refer si_host_col_code_map
	--
	--------------------------------------------

	UPDATE si_temp_arbs_co002 a 
	   SET (cms_security_type_id, cms_security_subtype_id) =
	(SELECT security_type_id, security_sub_type_id
	   FROM si_host_col_code_map
	  WHERE host_col_code = a.source_security_sub_type);

	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_security a SET (sci_reference_note, security_sub_type_id, sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, 
							   sci_security_currency, security_location, SECURITY_ORGANISATION, custodian_type, 
							   is_legal_enforce, is_legal_enforce_date, security_perfection_date, source_security_type, 
							   source_security_sub_type,
								 status) =
	(SELECT security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, 
			loc_country, loc_org_code, custodian_type, legal_enforceability, legal_enforceability_date, 
			security_perfection_date, source_security_type, source_security_sub_type,
			(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co002 t
	  WHERE t.security_id = a.sci_security_dtl_id)
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co002
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND IS_VALID = 'Y')
	  	AND source_id = 'ARBS';

	INSERT INTO cms_security (cms_collateral_id, sci_security_dtl_id, sci_reference_note, security_sub_type_id, 
								sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, sci_security_currency, sci_orig_security_currency,
								security_location, SECURITY_ORGANISATION, custodian_type,  
								is_legal_enforce, is_legal_enforce_date, security_perfection_date, source_security_type, 
								source_security_sub_type, status, source_id, is_migrated_ind)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
			security_id, security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, currency,
			loc_country, loc_org_code, custodian_type,  legal_enforceability, legal_enforceability_date, 
			security_perfection_date, SOURCE_SECURITY_TYPE, source_security_sub_type, 'ACTIVE', 'ARBS', 'N'
	   FROM si_temp_arbs_co002 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_security
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS')
		AND IS_VALID = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO002', 'ARBS', 2);
	commit;
	
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND type_name IS NULL;
	 
	-------------------------------------
	-- Actual Table
	-- CMS_ASSET
	--
	-------------------------------------
	
	UPDATE cms_asset a SET (asset_description, type_of_asset, purchase_price, purchase_currency, 
							 sales_proceed, gold_grade, purchase_receipt_no, gold_unit_price, gold_unit_price_uom,
							 gold_weight, gold_uom, auction_date, auction_price, auctioneer, cash_value_for_force_sale) =
	(SELECT asset_desc, asset_type_code, purchase_price, purchase_price_currency, sales_proceed,
			gold_grade, purchase_receipt_no, gold_unit_price, gold_unit_price_uom, gold_weight, gold_weight_uom,
			auction_date, auction_price, auctioneer, cash_value_for_force_sale
	   FROM cms_security sec, si_temp_arbs_co002 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND a.cms_collateral_id = sec.cms_collateral_id)
	  WHERE EXISTS (SELECT '1' FROM cms_security, si_temp_arbs_co002
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND security_id = sci_security_dtl_id
	    			   AND source_id = 'ARBS'
					   AND IS_VALID = 'Y');
					    

	INSERT INTO cms_asset (cms_collateral_id, asset_description, type_of_asset, purchase_price, purchase_currency, 
							 sales_proceed, gold_grade, purchase_receipt_no, gold_unit_price, gold_unit_price_uom,
							 gold_weight, gold_uom, auction_date, auction_price, auctioneer, cash_value_for_force_sale, env_risky_status)
	(SELECT cms_collateral_id, asset_desc, asset_type_code, purchase_price, purchase_price_currency, sales_proceed,
			gold_grade, purchase_receipt_no, gold_unit_price, gold_unit_price_uom, gold_weight, gold_weight_uom,
			auction_date, auction_price, auctioneer, cash_value_for_force_sale, 'N'
	   FROM cms_security sec, si_temp_arbs_co002 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS'
	    AND NOT EXISTS (SELECT '1' FROM cms_asset
	    				 WHERE cms_collateral_id = sec.cms_collateral_id)
			AND IS_VALID = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO002', 'ARBS', 3);
	commit;
	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_stage_security a SET (sci_reference_note, security_sub_type_id, sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, 
							   		 sci_security_currency, security_location, SECURITY_ORGANISATION, custodian_type, 
							   		 is_legal_enforce, is_legal_enforce_date, security_perfection_date,
							   		 source_security_type, source_security_sub_type, status) =
	(SELECT security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, 
			loc_country, loc_org_code, custodian_type, legal_enforceability, legal_enforceability_date, 
			security_perfection_date, source_security_type, source_security_sub_type,
			(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co002 t
	  WHERE t.security_id = a.sci_security_dtl_id)
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co002
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND source_id = 'ARBS'
							 AND IS_VALID = 'Y')
	  	AND source_id = 'ARBS'
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security, si_temp_arbs_co002
	  							   						   WHERE security_id = sci_security_dtl_id
	  							   						     AND source_id = 'ARBS'
																		 AND IS_VALID = 'Y')
	  							   	 AND transaction_type = 'COL');

	INSERT INTO cms_stage_security (cms_collateral_id, sci_security_dtl_id, sci_reference_note, security_sub_type_id, 
									  sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, sci_security_currency, sci_orig_security_currency,
									  security_location, SECURITY_ORGANISATION, custodian_type, 
									  is_legal_enforce, is_legal_enforce_date, security_perfection_date, source_security_type, 
									  source_security_sub_type, status, source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
			security_id, security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, currency,
			loc_country, loc_org_code, custodian_type, legal_enforceability, legal_enforceability_date, 
			security_perfection_date, source_security_type, source_security_sub_type, 'ACTIVE', 'ARBS'
	   FROM si_temp_arbs_co002 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_stage_security
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS')
		AND IS_VALID = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO002', 'ARBS', 4);
	commit;
	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_stage_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND TYPE_NAME IS NULL;
	 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_ASSET
	--
	-------------------------------------
	
	UPDATE cms_stage_asset a SET (asset_description, type_of_asset, purchase_price, purchase_currency, 
							 	   sales_proceed, gold_grade, purchase_receipt_no, gold_unit_price, gold_unit_price_uom,
							 	   gold_weight, gold_uom, auction_date, auction_price, auctioneer, cash_value_for_force_sale) =
	(SELECT asset_desc, asset_type_code, purchase_price, purchase_price_currency, sales_proceed,
			gold_grade, purchase_receipt_no, gold_unit_price, gold_unit_price_uom, gold_weight, gold_weight_uom,
			auction_date, auction_price, auctioneer, cash_value_for_force_sale
	   FROM cms_stage_security sec, si_temp_arbs_co002 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND a.cms_collateral_id = sec.cms_collateral_id)
	  WHERE EXISTS (SELECT '1' FROM cms_stage_security, si_temp_arbs_co002
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND security_id = sci_security_dtl_id
	    			   AND source_id = 'ARBS'
							 AND IS_VALID = 'Y')
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security, si_temp_arbs_co002
	  							   						   WHERE security_id = sci_security_dtl_id
	  							   						     AND source_id = 'ARBS'
																		 AND IS_VALID = 'Y')
	  							   	 AND transaction_type = 'COL');

	INSERT INTO cms_stage_asset (cms_collateral_id, asset_description, type_of_asset, purchase_price, purchase_currency, 
							 	   sales_proceed, gold_grade, purchase_receipt_no, gold_unit_price, gold_unit_price_uom,
							 	   gold_weight, gold_uom, auction_date, auction_price, auctioneer, cash_value_for_force_sale)
	(SELECT cms_collateral_id, asset_desc, asset_type_code, purchase_price, purchase_price_currency, sales_proceed,
			gold_grade, purchase_receipt_no, gold_unit_price, gold_unit_price_uom, gold_weight, gold_weight_uom,
			auction_date, auction_price, auctioneer, cash_value_for_force_sale
	   FROM cms_stage_security sec, si_temp_arbs_co002 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS'
	    AND NOT EXISTS (SELECT '1' FROM cms_stage_asset
	    				 WHERE cms_collateral_id = sec.cms_collateral_id)
			AND IS_VALID = 'Y');
			
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO002', 'ARBS', 5);
	commit;
			
	----------------------------
	-- Begin Update
	-- cms_security_source
	--
	----------------------------
	UPDATE cms_security_source SET(cms_collateral_id, source_security_id, source_id, 
								   last_update_date, security_sub_type_id, interface_id,
									 status) =
	(SELECT cms_collateral_id, security_id, 'ARBS', current_timestamp, cms_security_subtype_id,
		'CO002',
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM cms_security sec, si_temp_arbs_co002 t 
	  WHERE sec.sci_security_dtl_id = security_id
	    AND sec.sci_security_dtl_id = source_security_id 
	    AND source_id = 'ARBS' 
	    AND is_valid = 'Y')
	 WHERE EXISTS (SELECT 1 FROM si_temp_arbs_co002
	 				WHERE source_security_id = security_id 
	 				  AND is_valid = 'Y')
	   AND source_id = 'ARBS';
		
	----------------------------
	-- Begin Insertion
	-- cms_security_source
	--
	----------------------------
	INSERT INTO cms_security_source (cms_security_source_id, cms_collateral_id, source_security_id, source_id, 
									 status, last_update_date, security_sub_type_id, interface_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
			cms_collateral_id, security_id, 'ARBS', 'ACTIVE', CURRENT_TIMESTAMP, cms_security_subtype_id,
			'CO002'
	   FROM cms_security sec, si_temp_arbs_co002 t
	  WHERE NOT EXISTS (SELECT 1 FROM cms_security_source 
						 WHERE source_security_id = security_id 
						   AND source_id = 'ARBS') 
		AND is_valid = 'Y'
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO002', 'ARBS', 6);
	commit;
	
	------------------------------------------
	-- START Update Collateral Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------	
	FOR cur_col_key AS
		SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
			FROM CMS_SECURITY a
		WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co002 t
							WHERE a.SCI_SECURITY_DTL_ID = t.SECURITY_ID		   	  
									AND t.is_valid = 'Y')
			AND a.SOURCE_ID = 'ARBS'	   
			
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
	END FOR;

	IF(upper(LOAD_TYPE)='FULL') THEN
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO002', 'ARBS', 7);
		COMMIT;
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Actual Table
		-- CMS_SECURITY
		--
		-------------------------------------
		UPDATE cms_security a SET (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
			WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id IN ('AB110')
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co002
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y');
		
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Staging Table
		-- CMS_STAGE_SECURITY
		--
		-------------------------------------
		UPDATE cms_stage_security a set (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
		WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id IN ('AB110')
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co002
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y')
				AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
											WHERE reference_id IN (SELECT cms_collateral_id 
																		FROM cms_security b
																		WHERE a.SCI_SECURITY_DTL_ID = b.sci_security_dtl_id
																			AND b.source_id = 'ARBS')
												AND transaction_type = 'COL');
	
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO002', 'ARBS', 8);
		commit;
		
		------------------------------------
		-- Tag DELETED for non-exist records
		-- cms_security_source
		--
		------------------------------------
		UPDATE cms_security_source SET(STATUS, last_update_date) =
		('DELETED', current_timestamp)
		WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
			AND security_sub_type_id IN ('AB110')
			AND NOT EXISTS (SELECT 1 FROM si_temp_arbs_co002
						WHERE source_security_id = security_id 
							AND is_valid = 'Y');
	END IF;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO002', 'ARBS', 0);
	    				 
END
@

CREATE PROCEDURE SI_RUN_TEMP_ARBS_CO003(IN LOAD_TYPE VARCHAR(255))
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO003', 'ARBS', 1);
	commit;
	--------------------------------------------
	-- Update security type and subtype id first
	-- si_temp_arbs_co003
	-- @refer si_host_col_code_map
	--
	--------------------------------------------

	UPDATE si_temp_arbs_co003 a 
	   SET (cms_security_type_id, cms_security_subtype_id) =
	(SELECT security_type_id, security_sub_type_id
	   FROM si_host_col_code_map
	  WHERE host_col_code = a.source_security_sub_type);
	  
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_security a SET (sci_reference_note, security_sub_type_id, sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, 
							   sci_security_currency, security_location, SECURITY_ORGANISATION, custodian_type,  
							   source_security_type, source_security_sub_type, 
								 status) =
	(SELECT security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, 
			loc_country, loc_org_code, custodian_type, source_security_type, source_security_sub_type,
			(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co003 t
	  WHERE t.security_id = a.sci_security_dtl_id)
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co003
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND source_id = 'ARBS'
							 AND IS_VALID = 'Y')
	  	AND source_id = 'ARBS';

	INSERT INTO cms_security (cms_collateral_id, sci_security_dtl_id, sci_reference_note, security_sub_type_id, 
								sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, sci_security_currency, sci_orig_security_currency,
								security_location, SECURITY_ORGANISATION, custodian_type, source_security_type, 
								source_security_sub_type, status, source_id, is_migrated_ind)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
			security_id, security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, currency,
			loc_country, loc_org_code, custodian_type, source_security_type, source_security_sub_type, 'ACTIVE', 'ARBS', 'N'
	   FROM si_temp_arbs_co003 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_security
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS')
		AND IS_VALID = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO003', 'ARBS', 2);
	commit;
	
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND type_name IS NULL;

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO003', 'ARBS', 21);
	commit;
	-------------------------------------
	-- Actual Table
	-- CMS_ASSET
	--
	-------------------------------------
	
	UPDATE cms_asset a SET (asset_description) =
	(SELECT asset_desc
	   FROM cms_security sec, si_temp_arbs_co003 t
	  WHERE sec.SOURCE_ID='ARBS'
			AND sec.sci_security_dtl_id = t.security_id
	    AND a.cms_collateral_id = sec.cms_collateral_id
			AND IS_VALID='Y')
	  WHERE EXISTS (SELECT '1' FROM cms_security, si_temp_arbs_co003
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND security_id = sci_security_dtl_id
	    			   AND source_id = 'ARBS'
							 AND IS_VALID = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO003', 'ARBS', 22);
	commit;
	
	INSERT INTO cms_asset (cms_collateral_id, asset_description, env_risky_status)
	(SELECT cms_collateral_id, asset_desc, 'N'
	   FROM cms_security sec, si_temp_arbs_co003 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS'
	    AND NOT EXISTS (SELECT '1' FROM cms_asset
	    				 WHERE cms_collateral_id = sec.cms_collateral_id)
			AND IS_VALID = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO003', 'ARBS', 3);
	commit;
	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_stage_security a SET (sci_reference_note, security_sub_type_id, sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, 
							   		 sci_security_currency, security_location, SECURITY_ORGANISATION, custodian_type, 
							   		 source_security_type, source_security_sub_type,
										 status) =
	(SELECT security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, 
			loc_country, loc_org_code, custodian_type, source_security_type, source_security_sub_type,
			(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co003 t
	  WHERE t.security_id = a.sci_security_dtl_id)
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co003
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND source_id = 'ARBS'
							 AND IS_VALID = 'Y')
	  	AND source_id = 'ARBS'
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security, si_temp_arbs_co003
	  							   						   WHERE security_id = sci_security_dtl_id
	  							   						     AND source_id = 'ARBS'
																		 AND IS_VALID = 'Y')
	  							   	 AND transaction_type = 'COL');

	INSERT INTO cms_stage_security (cms_collateral_id, sci_security_dtl_id, sci_reference_note, security_sub_type_id, 
									  sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, sci_security_currency, sci_orig_security_currency,
									  security_location, SECURITY_ORGANISATION, custodian_type, source_security_type, 
									  source_security_sub_type, status, source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
			security_id, security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, currency,
			loc_country, loc_org_code, custodian_type, source_security_type, source_security_sub_type, 'ACTIVE', 'ARBS'
	   FROM si_temp_arbs_co003 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_stage_security
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS')
		AND IS_VALID = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO003', 'ARBS', 4);
	commit;
	  	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_stage_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND TYPE_NAME IS NULL;
	 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_ASSET
	--
	-------------------------------------
	
	UPDATE cms_stage_asset a SET (asset_description) =
	(SELECT asset_desc
	   FROM cms_stage_security sec, si_temp_arbs_co003 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND a.cms_collateral_id = sec.cms_collateral_id)
	  WHERE EXISTS (SELECT '1' FROM cms_stage_security, si_temp_arbs_co003
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND security_id = sci_security_dtl_id
	    			   AND source_id = 'ARBS'
							 AND IS_VALID = 'Y')
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security, si_temp_arbs_co003
	  							   						   WHERE security_id = sci_security_dtl_id
	  							   						     AND source_id = 'ARBS'
																		 AND IS_VALID = 'Y')
	  							   	 AND transaction_type = 'COL');

	INSERT INTO cms_stage_asset (cms_collateral_id, asset_description, env_risky_status)
	(SELECT cms_collateral_id, asset_desc, 'N'
	   FROM cms_stage_security sec, si_temp_arbs_co003 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS'
	    AND NOT EXISTS (SELECT '1' FROM cms_stage_asset
	    				 WHERE cms_collateral_id = sec.cms_collateral_id)
			AND IS_VALID = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO003', 'ARBS', 5);
	commit;
	
	----------------------------
	-- Begin Update
	-- cms_security_source
	--
	----------------------------
	UPDATE cms_security_source SET(cms_collateral_id, source_security_id, source_id, 
								   last_update_date, security_sub_type_id, interface_id,
									 status) =
	(SELECT cms_collateral_id, security_id, 'ARBS', current_timestamp, cms_security_subtype_id,
		'CO003',
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
		   FROM cms_security sec, si_temp_arbs_co003 t 
	  WHERE sec.sci_security_dtl_id = security_id
	    AND sec.sci_security_dtl_id = source_security_id 
	    AND source_id = 'ARBS' 
	    AND is_valid = 'Y')
	 WHERE EXISTS (SELECT 1 FROM si_temp_arbs_co003 
	 				WHERE source_security_id = security_id 
	 				  AND is_valid = 'Y')
	   AND source_id = 'ARBS';
		
	----------------------------
	-- Begin Insertion
	-- cms_security_source
	--
	----------------------------
	INSERT INTO cms_security_source (cms_security_source_id, cms_collateral_id, source_security_id, source_id, 
									 status, last_update_date, security_sub_type_id, interface_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
			cms_collateral_id, security_id, 'ARBS', 'ACTIVE', CURRENT_TIMESTAMP, cms_security_subtype_id,
			'CO003'
	   FROM cms_security sec, si_temp_arbs_co003 t
	  WHERE NOT EXISTS (SELECT 1 FROM cms_security_source 
						 WHERE source_security_id = security_id 
						   AND source_id = 'ARBS') 
		AND is_valid = 'Y'
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO003', 'ARBS', 6);
	commit;
	
	------------------------------------------
	-- START Update Collateral Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------	
	FOR cur_col_key AS
		SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
			FROM CMS_SECURITY a
		WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co003 t
							WHERE a.SCI_SECURITY_DTL_ID = t.SECURITY_ID		   	  
									AND t.is_valid = 'Y')
			AND a.SOURCE_ID = 'ARBS'	   
			
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
	END FOR;

	IF(upper(LOAD_TYPE)='FULL') THEN
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO003', 'ARBS', 7);
		COMMIT;
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Actual Table
		-- CMS_SECURITY
		--
		-------------------------------------
		UPDATE cms_security a SET (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
			WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'AB100'
				AND 'CO003' = (select s.INTERFACE_ID from cms_security_source s where s.SOURCE_ID=a.SOURCE_ID and s.SOURCE_SECURITY_ID=a.SCI_SECURITY_DTL_ID)
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co003
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y');
		
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Staging Table
		-- CMS_STAGE_SECURITY
		--
		-------------------------------------
		UPDATE cms_stage_security a set (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
		WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'AB100'
				AND 'CO003' = (select s.INTERFACE_ID from cms_security_source s where s.SOURCE_ID=a.SOURCE_ID and s.SOURCE_SECURITY_ID=a.SCI_SECURITY_DTL_ID)
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co003
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y')
				AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
											WHERE reference_id IN (SELECT cms_collateral_id 
																		FROM cms_security b
																		WHERE a.SCI_SECURITY_DTL_ID = b.sci_security_dtl_id
																			AND b.source_id = 'ARBS')
												AND transaction_type = 'COL');
	
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO003', 'ARBS', 8);
		commit;
		
		------------------------------------
		-- Tag DELETED for non-exist records
		-- cms_security_source
		--
		------------------------------------
		UPDATE cms_security_source SET(STATUS, last_update_date) =
		('DELETED', current_timestamp)
		WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
			AND security_sub_type_id = 'AB100'
			AND interface_id = 'CO003'
			AND NOT EXISTS (SELECT 1 FROM si_temp_arbs_co003
						WHERE source_security_id = security_id 
							AND is_valid = 'Y');
	END IF;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO003', 'ARBS', 0);

END
@

CREATE PROCEDURE SI_RUN_TEMP_ARBS_CO004(IN LOAD_TYPE VARCHAR(255))
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO004', 'ARBS', 1);
	commit;
	--------------------------------------------
	-- Update security type and subtype id first
	-- si_temp_arbs_co004
	-- @refer si_host_col_code_map
	--
	--------------------------------------------

	UPDATE si_temp_arbs_co004 a 
	   SET (cms_security_type_id, cms_security_subtype_id) =
	(SELECT security_type_id, security_sub_type_id
	   FROM si_host_col_code_map
	  WHERE host_col_code = a.source_security_sub_type);
	  
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_security a SET (sci_reference_note, security_sub_type_id, sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, 
							   sci_security_currency, security_location, SECURITY_ORGANISATION, custodian_type, security_maturity_date, 
							   is_legal_enforce, is_legal_enforce_date, security_perfection_date, source_security_type, 
							   source_security_sub_type, 
								 status) =
	(SELECT security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, 
			loc_country, loc_org_code, custodian_type, security_expiry_date, legal_enforcebility, legal_enforcebility_date, 
			security_perfection_date, source_security_type, source_security_sub_type,
			(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co004 t
	  WHERE t.security_id = a.sci_security_dtl_id)
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co004
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND source_id = 'ARBS'
							 AND IS_VALID = 'Y')
	  	AND source_id = 'ARBS';

	INSERT INTO cms_security (cms_collateral_id, sci_security_dtl_id, sci_reference_note, security_sub_type_id, 
								sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, sci_security_currency, sci_orig_security_currency,
								security_location, SECURITY_ORGANISATION, custodian_type, security_maturity_date, 
								is_legal_enforce, is_legal_enforce_date, security_perfection_date, source_security_type, 
								source_security_sub_type, status, source_id, is_migrated_ind)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
			security_id, security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, currency,
			loc_country, loc_org_code, custodian_type, security_expiry_date, legal_enforcebility, legal_enforcebility_date, 
			security_perfection_date, source_security_type, source_security_sub_type, 'ACTIVE', 'ARBS', 'N'
	   FROM si_temp_arbs_co004 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_security
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS')
		AND IS_VALID = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO004', 'ARBS', 2);
	commit;
	
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND type_name IS NULL;
	 
	-------------------------------------
	-- Actual Table
	-- CMS_ASSET
	--
	-------------------------------------
	
	UPDATE cms_asset a SET (asset_description, type_of_asset, bond_issuer_name, bond_issued_date) =
	(SELECT asset_desc, asset_type_code, issuer_name, bond_issued_date
	   FROM cms_security sec, si_temp_arbs_co004 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND a.cms_collateral_id = sec.cms_collateral_id)
	  WHERE EXISTS (SELECT '1' FROM cms_security, si_temp_arbs_co004
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND security_id = sci_security_dtl_id
	    			   AND source_id = 'ARBS'
					   AND is_valid = 'Y');

	INSERT INTO cms_asset (cms_collateral_id, asset_description, type_of_asset, bond_issuer_name, bond_issued_date, env_risky_status)
	(SELECT cms_collateral_id, asset_desc, asset_type_code, issuer_name, bond_issued_date, 'N'
	   FROM cms_security sec, si_temp_arbs_co004 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS'
	    AND NOT EXISTS (SELECT '1' FROM cms_asset
	    				 WHERE cms_collateral_id = sec.cms_collateral_id)
			AND IS_VALID = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO004', 'ARBS', 3);
	commit;
	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_stage_security a SET (sci_reference_note, security_sub_type_id, sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, 
							   		 sci_security_currency, security_location, SECURITY_ORGANISATION, custodian_type, 
							   		 security_maturity_date, is_legal_enforce, is_legal_enforce_date, security_perfection_date,
							   		 source_security_type, source_security_sub_type,
										 status) =
	(SELECT security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, 
			loc_country, loc_org_code, custodian_type, security_expiry_date, legal_enforcebility, legal_enforcebility_date, 
			security_perfection_date, source_security_type, source_security_sub_type,
			(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co004 t
	  WHERE t.security_id = a.sci_security_dtl_id)
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co004
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND source_id = 'ARBS'
							 AND IS_VALID = 'Y')
	  	AND source_id = 'ARBS'
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security, si_temp_arbs_co004
	  							   						   WHERE security_id = sci_security_dtl_id
	  							   						     AND source_id = 'ARBS'
																		 AND IS_VALID = 'Y')
	  							   	 AND transaction_type = 'COL');

	INSERT INTO cms_stage_security (cms_collateral_id, sci_security_dtl_id, sci_reference_note, security_sub_type_id, 
									  sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, sci_security_currency, sci_orig_security_currency,
									  security_location, SECURITY_ORGANISATION, custodian_type, security_maturity_date, 
									  is_legal_enforce, is_legal_enforce_date, security_perfection_date, source_security_type, 
									  source_security_sub_type, status, source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
			security_id, security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, currency,
			loc_country, loc_org_code, custodian_type, security_expiry_date, legal_enforcebility, legal_enforcebility_date, 
			security_perfection_date, source_security_type, source_security_sub_type, 'ACTIVE', 'ARBS'
	   FROM si_temp_arbs_co004 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_stage_security
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS')
		AND is_valid = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO004', 'ARBS', 4);
	commit;
	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_stage_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND TYPE_NAME IS NULL;
	 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_ASSET
	--
	-------------------------------------
	
	UPDATE cms_stage_asset a SET (asset_description, type_of_asset, bond_issuer_name, bond_issued_date) =
	(SELECT asset_desc, asset_type_code, issuer_name, bond_issued_date
	   FROM cms_stage_security sec, si_temp_arbs_co004 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND a.cms_collateral_id = sec.cms_collateral_id)
	  WHERE EXISTS (SELECT '1' FROM cms_stage_security, si_temp_arbs_co004
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND security_id = sci_security_dtl_id
	    			   AND source_id = 'ARBS'
							 AND IS_VALID = 'Y')
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security, si_temp_arbs_co004
	  							   						   WHERE security_id = sci_security_dtl_id
	  							   						     AND source_id = 'ARBS'
																		 AND IS_VALID = 'Y')
	  							   	 AND transaction_type = 'COL');

	INSERT INTO cms_stage_asset (cms_collateral_id, asset_description, type_of_asset, bond_issuer_name, bond_issued_date, env_risky_status)
	(SELECT cms_collateral_id, asset_desc, asset_type_code, issuer_name, bond_issued_date, 'N'
	   FROM cms_stage_security sec, si_temp_arbs_co004 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS'
	    AND NOT EXISTS (SELECT '1' FROM cms_stage_asset
	    				 WHERE cms_collateral_id = sec.cms_collateral_id)
			AND IS_VALID = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO004', 'ARBS', 5);
	commit;
	
	----------------------------
	-- Begin Update
	-- cms_security_source
	--
	----------------------------
	UPDATE cms_security_source SET(cms_collateral_id, source_security_id, source_id, 
								   last_update_date, security_sub_type_id, interface_id,
									 status) =
	(SELECT cms_collateral_id, security_id, 'ARBS', current_timestamp, cms_security_subtype_id,
		'CO004',
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM cms_security sec, si_temp_arbs_co004 t 
	  WHERE sec.sci_security_dtl_id = security_id
	    AND sec.sci_security_dtl_id = source_security_id 
	    AND source_id = 'ARBS' 
	    AND is_valid = 'Y')
	 WHERE EXISTS (SELECT 1 FROM si_temp_arbs_co004
	 				WHERE source_security_id = security_id 
	 				  AND is_valid = 'Y')
	   AND source_id = 'ARBS';
		
	----------------------------
	-- Begin Insertion
	-- cms_security_source
	--
	----------------------------
	INSERT INTO cms_security_source (cms_security_source_id, cms_collateral_id, source_security_id, source_id, 
									 status, last_update_date, security_sub_type_id, interface_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
			cms_collateral_id, security_id, 'ARBS', 'ACTIVE', CURRENT_TIMESTAMP, cms_security_subtype_id,
			'CO004'
	   FROM cms_security sec, si_temp_arbs_co004 t
	  WHERE NOT EXISTS (SELECT 1 FROM cms_security_source 
						 WHERE source_security_id = security_id 
						   AND source_id = 'ARBS') 
		AND is_valid = 'Y'
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO004', 'ARBS', 6);
	commit;
	
	------------------------------------------
	-- START Update Collateral Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------	
	FOR cur_col_key AS
		SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
			FROM CMS_SECURITY a
		WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co004 t
							WHERE a.SCI_SECURITY_DTL_ID = t.SECURITY_ID		   	  
									AND t.is_valid = 'Y')
			AND a.SOURCE_ID = 'ARBS'	   
			
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
	END FOR;

	IF(upper(LOAD_TYPE)='FULL') THEN
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO004', 'ARBS', 7);
		COMMIT;
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Actual Table
		-- CMS_SECURITY
		--
		-------------------------------------
		UPDATE cms_security a SET (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
			WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'AB100'
				AND 'CO004' = (select s.INTERFACE_ID from cms_security_source s where s.SOURCE_ID=a.SOURCE_ID and s.SOURCE_SECURITY_ID=a.SCI_SECURITY_DTL_ID)
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co004
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y');
		
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Staging Table
		-- CMS_STAGE_SECURITY
		--
		-------------------------------------
		UPDATE cms_stage_security a set (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
		WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'AB100'
				AND 'CO004' = (select s.INTERFACE_ID from cms_security_source s where s.SOURCE_ID=a.SOURCE_ID and s.SOURCE_SECURITY_ID=a.SCI_SECURITY_DTL_ID)
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co004
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y')
				AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
											WHERE reference_id IN (SELECT cms_collateral_id 
																		FROM cms_security b
																		WHERE a.SCI_SECURITY_DTL_ID = b.sci_security_dtl_id
																			AND b.source_id = 'ARBS')
												AND transaction_type = 'COL');
	
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO004', 'ARBS', 8);
		commit;
		
		------------------------------------
		-- Tag DELETED for non-exist records
		-- cms_security_source
		--
		------------------------------------
		UPDATE cms_security_source SET(STATUS, last_update_date) =
		('DELETED', current_timestamp)
		WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
			AND security_sub_type_id = 'AB100'
			AND interface_id = 'CO004'
			AND NOT EXISTS (SELECT 1 FROM si_temp_arbs_co004
						WHERE source_security_id = security_id 
							AND is_valid = 'Y');
	END IF;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO004', 'ARBS', 0);

END
@

CREATE PROCEDURE SI_RUN_TEMP_ARBS_CO005(IN LOAD_TYPE VARCHAR(255))
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO005', 'ARBS', 1);
	commit;
	--------------------------------------------
	-- Update security type and subtype id first
	-- si_temp_arbs_co005
	-- @refer si_host_col_code_map
	--
	--------------------------------------------

	UPDATE si_temp_arbs_co005 a 
	   SET (cms_security_type_id, cms_security_subtype_id) =
	(SELECT security_type_id, security_sub_type_id
	   FROM si_host_col_code_map
	  WHERE host_col_code = a.source_security_sub_type);
	  
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_security a SET (sci_reference_note, security_sub_type_id, sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, 
							   sci_security_currency, security_location, security_organisation, custodian_type, security_custodian,
							   security_maturity_date, is_legal_enforce, is_legal_enforce_date, security_perfection_date,
							   source_security_type, source_security_sub_type,
								 status) =
	(SELECT security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, 
			loc_country, loc_org_code, custodian_type, custodian, security_expiry_date, legal_enforcebility, 
			legal_enforcebility_date, security_perfection_date, source_security_type, source_security_sub_type,
			(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co005 t
	  WHERE t.security_id = a.sci_security_dtl_id
	  	AND a.source_security_type = source_security_type
		AND a.source_security_sub_type = source_security_sub_type 
	    AND is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co005
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND source_id = 'ARBS'
					   AND a.source_security_type = source_security_type
					   AND a.source_security_sub_type = source_security_sub_type 
					   AND is_valid = 'Y')
		AND security_sub_type_id IN ('CS200', 'CS202', 'CS203')
	  	AND source_id = 'ARBS';

	INSERT INTO cms_security (cms_collateral_id, sci_security_dtl_id, sci_reference_note, security_sub_type_id, 
								sci_security_type_value, sci_security_subtype_value, sci_security_currency, sci_orig_security_currency,
								security_location, security_organisation, custodian_type, security_custodian,
								security_maturity_date, is_legal_enforce, is_legal_enforce_date, security_perfection_date, 
								source_security_type, source_security_sub_type, status, source_id, is_migrated_ind)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
			security_id, security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, currency,
			loc_country, loc_org_code, custodian_type, custodian, security_expiry_date, legal_enforcebility, 
			legal_enforcebility_date, security_perfection_date, source_security_type, source_security_sub_type, 
			'ACTIVE', 'ARBS', 'N'
	   FROM si_temp_arbs_co005 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_security
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS')
		AND IS_VALID = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO005', 'ARBS', 2);
	commit;
	
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND type_name IS NULL;
	 
	-------------------------------------
	-- Actual Table
	-- CMS_CASH
	--
	-------------------------------------
	
	UPDATE cms_cash a SET (interest_capitialisation) =
	(SELECT interest_capital
	   FROM cms_security sec, si_temp_arbs_co005 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND a.cms_collateral_id = sec.cms_collateral_id)
	  WHERE EXISTS (SELECT '1' FROM cms_security, si_temp_arbs_co005
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND security_id = sci_security_dtl_id
	    			   AND source_id = 'ARBS'
							 AND IS_VALID = 'Y');

	INSERT INTO cms_cash (cms_collateral_id, interest_capitialisation)
	(SELECT cms_collateral_id, interest_capital
	   FROM cms_security sec, si_temp_arbs_co005 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS'
	    AND NOT EXISTS (SELECT '1' FROM cms_cash
	    				 WHERE cms_collateral_id = sec.cms_collateral_id)
		AND is_valid = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO005', 'ARBS', 3);
	commit;
	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_stage_security a SET (sci_reference_note, security_sub_type_id, sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, 
							   		 sci_security_currency, security_location, SECURITY_ORGANISATION, custodian_type, 
							   		 security_custodian, security_maturity_date, is_legal_enforce, is_legal_enforce_date, 
							   		 security_perfection_date, source_security_type, source_security_sub_type,
										 status) =
	(SELECT security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, 
			loc_country, loc_org_code, custodian_type, custodian, security_expiry_date, legal_enforcebility, legal_enforcebility_date, 
			security_perfection_date, source_security_type, source_security_sub_type,
			(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co005 t
	  WHERE t.security_id = a.sci_security_dtl_id
	  	AND a.source_security_type = source_security_type
		AND a.source_security_sub_type = source_security_sub_type
		AND is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co005
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND source_id = 'ARBS'
	  				   AND a.source_security_type = source_security_type
					   AND a.source_security_sub_type = source_security_sub_type 
					   AND is_valid = 'Y')
	  	AND source_id = 'ARBS'
	  	AND security_sub_type_id IN ('CS200', 'CS202', 'CS203')
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security, si_temp_arbs_co005
	  							   						   WHERE security_id = sci_security_dtl_id
	  							   						     AND source_id = 'ARBS'
															 AND is_valid = 'Y')
	  							   	 AND transaction_type = 'COL');

	INSERT INTO cms_stage_security (cms_collateral_id, sci_security_dtl_id, sci_reference_note, security_sub_type_id, 
									  sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, sci_security_currency, sci_orig_security_currency,
									  security_location, SECURITY_ORGANISATION, custodian_type, security_custodian,
									  security_maturity_date, is_legal_enforce, is_legal_enforce_date, security_perfection_date, 
									  source_security_type, source_security_sub_type, status, source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
			security_id, security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, currency,
			loc_country, loc_org_code, custodian_type, custodian, security_expiry_date, legal_enforcebility, 
			legal_enforcebility_date, security_perfection_date, source_security_type, source_security_sub_type, 
			'ACTIVE', 'ARBS'
	   FROM si_temp_arbs_co005 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_stage_security
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS')
		AND IS_VALID = 'Y');
	  	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO005', 'ARBS', 4);
	commit;
	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_stage_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND TYPE_NAME IS NULL;
	 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_CASH
	--
	-------------------------------------
	
	UPDATE cms_stage_cash a SET (interest_capitialisation) =
	(SELECT interest_capital
	   FROM cms_stage_security sec, si_temp_arbs_co005 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND a.cms_collateral_id = sec.cms_collateral_id)
	  WHERE EXISTS (SELECT '1' FROM cms_stage_security, si_temp_arbs_co005
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND security_id = sci_security_dtl_id
	    			   AND source_id = 'ARBS'
							 AND IS_VALID = 'Y')
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security, si_temp_arbs_co005
	  							   						   WHERE security_id = sci_security_dtl_id
	  							   						     AND source_id = 'ARBS'
																		 AND IS_VALID = 'Y')
	  							   	 AND transaction_type = 'COL');

	INSERT INTO cms_stage_cash (cms_collateral_id, interest_capitialisation)
	(SELECT cms_collateral_id, interest_capital
	   FROM cms_stage_security sec, si_temp_arbs_co005 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS'
	    AND NOT EXISTS (SELECT '1' FROM cms_stage_cash
	    				 WHERE cms_collateral_id = sec.cms_collateral_id)
			AND IS_VALID = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO005', 'ARBS', 5);
	commit;
	
	----------------------------
	-- Begin Update
	-- cms_security_source
	--
	----------------------------
	UPDATE cms_security_source SET(cms_collateral_id, source_security_id, source_id, 
								   last_update_date, security_sub_type_id, interface_id,
									 status) =
	(SELECT cms_collateral_id, security_id, 'ARBS', current_timestamp, cms_security_subtype_id,
		'CO005',
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM cms_security sec, si_temp_arbs_co005 t 
	  WHERE sec.sci_security_dtl_id = security_id
	    AND sec.sci_security_dtl_id = source_security_id 
	    AND source_id = 'ARBS' 
	    AND is_valid = 'Y')
	 WHERE EXISTS (SELECT 1 FROM si_temp_arbs_co005 
	 				WHERE source_security_id = security_id 
	 				  AND is_valid = 'Y')
	   AND source_id = 'ARBS';
		
	----------------------------
	-- Begin Insertion
	-- cms_security_source
	--
	----------------------------
	INSERT INTO cms_security_source (cms_security_source_id, cms_collateral_id, source_security_id, source_id, 
									 status, last_update_date, security_sub_type_id, interface_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
			cms_collateral_id, security_id, 'ARBS', 'ACTIVE', CURRENT_TIMESTAMP, cms_security_subtype_id,
			'CO005'
	   FROM cms_security sec, si_temp_arbs_co005 t
	  WHERE NOT EXISTS (SELECT 1 FROM cms_security_source 
						 WHERE source_security_id = security_id 
						   AND source_id = 'ARBS') 
		AND is_valid = 'Y'
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS');
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO005', 'ARBS', 6);
	commit;
	
	------------------------------------------
	-- START Update Collateral Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------	
	FOR cur_col_key AS
		SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
			FROM CMS_SECURITY a
		WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co005 t
							WHERE a.SCI_SECURITY_DTL_ID = t.SECURITY_ID		   	  
									AND t.is_valid = 'Y')
			AND a.SOURCE_ID = 'ARBS'	   
			
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
	END FOR;

	IF(upper(LOAD_TYPE)='FULL') THEN
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO005', 'ARBS', 7);
		COMMIT;
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Actual Table
		-- CMS_SECURITY
		--
		-------------------------------------
		UPDATE cms_security a SET (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
			WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id in ('CS200', 'CS202')
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co005
							WHERE a.sci_security_dtl_id = security_id
									and is_valid = 'Y');
		
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Staging Table
		-- CMS_STAGE_SECURITY
		--
		-------------------------------------
		UPDATE cms_stage_security a set (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
		WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id in ('CS200', 'CS202')
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co005
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y')
				AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
											WHERE reference_id IN (SELECT cms_collateral_id 
																		FROM cms_security b
																		WHERE a.SCI_SECURITY_DTL_ID = b.sci_security_dtl_id
																			AND b.source_id = 'ARBS')
												AND transaction_type = 'COL');
	
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO005', 'ARBS', 8);
		commit;
		
		------------------------------------
		-- Tag DELETED for non-exist records
		-- cms_security_source
		--
		------------------------------------
		UPDATE cms_security_source SET(STATUS, last_update_date) =
		('DELETED', current_timestamp)
		WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
			AND security_sub_type_id in ('CS200', 'CS202')
			AND NOT EXISTS (SELECT 1 FROM si_temp_arbs_co005
						WHERE source_security_id = security_id 
							AND is_valid = 'Y');
	END IF;

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO005', 'ARBS', 0);

END
@

CREATE PROCEDURE SI_RUN_TEMP_ARBS_CO006
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO006', 'ARBS', 1);
	commit;
	-------------------------------------
	-- Actual Table
	-- CMS_CASH_DEPOSIT
	--
	-------------------------------------

	UPDATE cms_cash_deposit a 
	set (deposit_reference_number, deposit_receipt_number, deposit_amount_currency, 
							   deposit_amount, third_party_bank, fdr_rate, issue_date, deposit_maturity_date, 
							   security_deposit_ind, shared_security_ind, account_type_num, account_type_value, 
							   status, source_security_id) =
	(SELECT ref_no, receipt_number, amt_currency, amt, third_party_bank, fdr_rate, issue_date, maturity_date, security_deposit,
			shared_security_ind, 'FD_ACC_TYPE', ACCT_TYPE, 'ACTIVE', security_id
	   FROM si_temp_arbs_co006, cms_security s
	  WHERE receipt_number = a.deposit_receipt_number
		and s.cms_collateral_id = a.cms_collateral_id
		and s.sci_security_dtl_id = security_id
		and s.source_id = 'ARBS'
		AND IS_VALID = 'Y')
	  WHERE source_id = 'ARBS'
	    AND EXISTS (SELECT '1' FROM si_temp_arbs_co006, cms_security s
	    			 WHERE receipt_number = a.deposit_receipt_number
						 and s.cms_collateral_id = a.cms_collateral_id
						 and s.sci_security_dtl_id = security_id
						 and s.source_id = 'ARBS'
						 and is_valid = 'Y');

	INSERT INTO cms_cash_deposit (cash_deposit_id, deposit_reference_number, deposit_receipt_number, deposit_amount_currency, 
									deposit_amount, third_party_bank, fdr_rate, issue_date, deposit_maturity_date, 
									security_deposit_ind, shared_security_ind, account_type_num, account_type_value, 
									cms_collateral_id, status, source_security_id, source_id, 
									cms_ref_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT),
			ref_no, receipt_number, amt_currency, amt, third_party_bank, fdr_rate, issue_date, maturity_date, security_deposit,
			shared_security_ind, 'FD_ACC_TYPE', ACCT_TYPE, c.cms_collateral_id, 'ACTIVE', security_id, 'ARBS',
			CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT)
	   FROM cms_cash c, cms_security sec, si_temp_arbs_co006
	  WHERE c.cms_collateral_id = sec.cms_collateral_id
	    AND sec.sci_security_dtl_id = security_id
	    AND source_id = 'ARBS'
			AND is_valid = 'Y'
	  	AND NOT EXISTS (SELECT '1' FROM cms_cash_deposit s
	  					 WHERE s.cms_collateral_id = c.cms_collateral_id
							 AND receipt_number = s.deposit_receipt_number));
	  					 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO006', 'ARBS', 2);
	commit;
	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_CASH_DEPOSIT
	--
	-------------------------------------
	
	UPDATE cms_stage_cash_deposit a 
	SET (deposit_reference_number, deposit_receipt_number, deposit_amount_currency, 
							   		 deposit_amount, third_party_bank, fdr_rate, issue_date, deposit_maturity_date, 
							   		 security_deposit_ind, shared_security_ind, account_type_num, account_type_value, 
							   		 status, source_security_id) = 
	(SELECT ref_no, receipt_number, amt_currency, amt, third_party_bank, fdr_rate, issue_date, maturity_date, security_deposit,
			shared_security_ind, 'FD_ACC_TYPE', ACCT_TYPE, 'ACTIVE', security_id
	   FROM si_temp_arbs_co006, cms_stage_security s, transaction trx
	  WHERE receipt_number = a.deposit_receipt_number
	    and s.source_id = 'ARBS'
		AND IS_VALID = 'Y'
		and security_id = sci_security_dtl_id
		and s.cms_collateral_id = a.cms_collateral_id
		and trx.transaction_type = 'COL'
		and trx.staging_reference_id = s.cms_collateral_id)
	  WHERE source_id = 'ARBS'
		and exists (select 1
							from si_temp_arbs_co006, transaction trx, cms_stage_security s, cms_stage_cash c
							where receipt_number = a.DEPOSIT_RECEIPT_NUMBER
							and a.cms_collateral_id = c.cms_collateral_id
							and c.cms_collateral_id = s.cms_collateral_id
							and s.SCI_SECURITY_DTL_ID = security_id
							and s.source_id = 'ARBS'
							and s.cms_collateral_id = trx.staging_reference_id
							and trx.transaction_type = 'COL'
							and is_valid = 'Y');

	INSERT INTO cms_stage_cash_deposit (cash_deposit_id, deposit_reference_number, deposit_receipt_number, deposit_amount_currency, 
										  deposit_amount, third_party_bank, fdr_rate, issue_date, deposit_maturity_date, 
										  security_deposit_ind, shared_security_ind, account_type_num, account_type_value, 
										  cms_collateral_id, status, source_security_id, source_id,
											cms_ref_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cash_deposit_seq), 2)) as BIGINT),
			ref_no, receipt_number, amt_currency, amt, third_party_bank, fdr_rate, issue_date, maturity_date, security_deposit,
			shared_security_ind, 'FD_ACC_TYPE', ACCT_TYPE, c.cms_collateral_id, 'ACTIVE', security_id, 'ARBS',
			(SELECT cms_ref_id FROM cms_cash_deposit s WHERE s.SOURCE_ID = 'ARBS' 
				AND RECEIPT_NUMBER = s.DEPOSIT_RECEIPT_NUMBER
				AND security_id = s.source_security_id)
	   FROM cms_stage_cash c, cms_stage_security sec, si_temp_arbs_co006
	  WHERE c.cms_collateral_id = sec.cms_collateral_id
	    AND sec.sci_security_dtl_id = security_id
	    AND source_id = 'ARBS'
			and is_valid = 'Y'
	  AND NOT EXISTS (SELECT '1' FROM cms_stage_cash_deposit s
	  					 WHERE s.cms_collateral_id = c.cms_collateral_id
							 AND RECEIPT_NUMBER = S.DEPOSIT_RECEIPT_NUMBER));

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO006', 'ARBS', 3);
	commit;
	
	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Actual Table
	-- CMS_CASH_DEPOSIT
	--
	-------------------------------------
	lock table cms_cash_deposit in share mode;
	UPDATE cms_cash_deposit a set status = 'DELETED'
		WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
	    AND not exists (SELECT '1' FROM si_temp_arbs_co006, cms_security s
	    			 WHERE receipt_number = a.deposit_receipt_number
							and security_id = s.sci_security_dtl_id
							and s.cms_collateral_id = a.cms_collateral_id
							and s.source_id = 'ARBS'
							and is_valid = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO006', 'ARBS', 4);
	commit;
	
	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Staging Table
	-- CMS_STAGE_CASH_DEPOSIT
	--
	-------------------------------------
	lock table cms_stage_cash_deposit in share mode;
	UPDATE cms_stage_cash_deposit a SET status='DELETED'
	  WHERE source_id = 'ARBS'
			and status = 'ACTIVE'
	    and not exists (SELECT '1' FROM si_temp_arbs_co006, cms_stage_security s
				WHERE receipt_number = a.deposit_receipt_number
					and security_id = s.sci_security_dtl_id
					and s.cms_collateral_id = a.cms_collateral_id
					and s.source_id = 'ARBS'
					and is_valid = 'Y')
			and exists (select '1' from transaction trx
							where a.cms_collateral_id = trx.staging_reference_id
								and trx.transaction_type = 'COL');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO006', 'ARBS', 0);
	
END
@

CREATE PROCEDURE SI_RUN_TEMP_ARBS_CO007
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO007', 'ARBS', 1);
	commit;
	--------------------------------------------
	-- Update security type and subtype id first
	-- si_temp_arbs_co007
	-- @refer si_host_col_code_map
	--
	--------------------------------------------

	UPDATE si_temp_arbs_co007 a 
	   SET (cms_security_type_id, cms_security_subtype_id) =
	(SELECT security_type_id, security_sub_type_id
	   FROM si_host_col_code_map
	  WHERE host_col_code = a.source_security_sub_type);

	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_security a SET (sci_reference_note, security_sub_type_id, sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, 
							   sci_security_currency, security_location, SECURITY_ORGANISATION, security_maturity_date, 
							   is_legal_enforce, is_legal_enforce_date, security_perfection_date, source_security_type, 
							   source_security_sub_type, status) =
	(SELECT security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, 
			loc_country, loc_org_code, security_expiry_date, legal_enforceability, legal_enforceability_date, 
			security_perfection_date, source_security_type, source_security_sub_type, 'ACTIVE'
	   FROM si_temp_arbs_co007 t
	  WHERE t.security_id = a.sci_security_dtl_id)
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co007
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND source_id = 'ARBS'
							 and is_valid = 'Y')
	  	AND source_id = 'ARBS';

	INSERT INTO cms_security (cms_collateral_id, sci_security_dtl_id, sci_reference_note, security_sub_type_id, 
							  sci_security_type_value, sci_security_subtype_value, sci_security_currency, sci_orig_security_currency,
							  security_location, security_organisation, security_maturity_date, 
							  is_legal_enforce, is_legal_enforce_date, security_perfection_date, source_security_type, 
							  source_security_sub_type, status, source_id, is_migrated_ind)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
			security_id, security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, currency,
			loc_country, loc_org_code, security_expiry_date, legal_enforceability, legal_enforceability_date, 
			security_perfection_date, source_security_type, source_security_sub_type, 'ACTIVE', 'ARBS', 'N'
	   FROM si_temp_arbs_co007 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_security
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS')
		and is_valid = 'Y');
	  	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO007', 'ARBS', 2);
	commit;
	
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND type_name IS NULL;
	 
	-------------------------------------
	-- Actual Table
	-- CMS_MARKETABLE_SEC
	-- Nothing to Update but Insert only
	--
	-------------------------------------

	INSERT INTO cms_marketable_sec (cms_collateral_id)
	(SELECT cms_collateral_id
	   FROM cms_security sec, si_temp_arbs_co007 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS'
	    AND NOT EXISTS (SELECT '1' FROM cms_marketable_sec
	    				 WHERE cms_collateral_id = sec.cms_collateral_id)
			and is_valid = 'Y');
	    				 
	-------------------------------------
	-- Actual Table
	-- CMS_PORTFOLIO_ITEM
	--
	-------------------------------------
	
	UPDATE cms_portfolio_item a 
	set (no_of_units, issuer_name, bond_issue_date, bond_maturity_date,
								 recognized_exchange_flag, status) =
	(SELECT number_of_units, issuer_name, bond_issue_date, bond_maturity_date, recognized_exchange, 
			'ACTIVE'
	   FROM cms_marketable_sec m, cms_security sec, si_temp_arbs_co007 t
	  WHERE m.cms_collateral_id = sec.cms_collateral_id
	    AND sec.sci_security_dtl_id = t.security_id
			and sec.SOURCE_ID = 'ARBS'
	    AND a.cms_collateral_id = m.cms_collateral_id
			and is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM cms_marketable_sec m, cms_security sec, si_temp_arbs_co007 t
	  				 WHERE a.cms_collateral_id = m.cms_collateral_id
	  				   AND sec.cms_collateral_id = m.cms_collateral_id
	  				   AND sec.sci_security_dtl_id = t.security_id 
	  				   AND source_id = 'ARBS'
							 AND IS_VALID = 'Y');
	    				 
	INSERT INTO cms_portfolio_item (item_id, cms_collateral_id, currency_code, no_of_units, issuer_name, bond_issue_date, bond_maturity_date,
									  recognized_exchange_flag, status, source_id, CMS_REF_ID)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT),
			m.cms_collateral_id, t.currency, number_of_units, issuer_name, bond_issue_date, bond_maturity_date, recognized_exchange, 
			'ACTIVE', 'ARBS', 
			CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT)
	   FROM cms_marketable_sec m, cms_security sec, si_temp_arbs_co007 t
	  WHERE m.cms_collateral_id = sec.cms_collateral_id
	    AND sec.sci_security_dtl_id = t.security_id
			and sec.SOURCE_ID = 'ARBS'
			and t.IS_VALID = 'Y'
	    AND NOT EXISTS (SELECT '1' FROM cms_portfolio_item
	  					 WHERE cms_collateral_id = m.cms_collateral_id
	  					   AND source_id = 'ARBS'));								  

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO007', 'ARBS', 3);
	commit;
	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_stage_security a SET (sci_reference_note, security_sub_type_id, sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, 
							   		 sci_security_currency, security_location, SECURITY_ORGANISATION, 
							   		 security_maturity_date, is_legal_enforce, is_legal_enforce_date, security_perfection_date,
							   		 source_security_type, source_security_sub_type, status) =
	(SELECT security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, 
			loc_country, loc_org_code, security_expiry_date, legal_enforceability, legal_enforceability_date, 
			security_perfection_date, source_security_type, source_security_sub_type, 'ACTIVE'
	   FROM si_temp_arbs_co007 t
	  WHERE t.security_id = a.sci_security_dtl_id
		and a.source_id = 'ARBS'
		and t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co007
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND source_id = 'ARBS'
							 and is_valid = 'Y')
	  	AND source_id = 'ARBS'
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security, si_temp_arbs_co007
	  							   						   WHERE security_id = sci_security_dtl_id
	  							   						     AND source_id = 'ARBS')
	  							   	 AND transaction_type = 'COL');

	INSERT INTO cms_stage_security (cms_collateral_id, sci_security_dtl_id, sci_reference_note, security_sub_type_id, 
									  sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, sci_security_currency, sci_orig_security_currency,
									  security_location, SECURITY_ORGANISATION, security_maturity_date, 
									  is_legal_enforce, is_legal_enforce_date, security_perfection_date, source_security_type, 
									  source_security_sub_type, status, source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
			security_id, security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, currency,
			loc_country, loc_org_code, security_expiry_date, legal_enforceability, legal_enforceability_date, 
			security_perfection_date, source_security_type, source_security_sub_type, 'ACTIVE', 'ARBS'
	   FROM si_temp_arbs_co007 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_stage_security
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS')
		and is_valid = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO007', 'ARBS', 4);
	commit;
	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	-- Update type_name, subtype_name
	--
	-------------------------------------
	
	UPDATE cms_stage_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND TYPE_NAME IS NULL;
	 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_MARKETABLE_SEC
	-- Nothing to update but insert only
	--
	-------------------------------------

	INSERT INTO cms_stage_marketable_sec (cms_collateral_id)
	(SELECT cms_collateral_id
	   FROM cms_stage_security sec, si_temp_arbs_co007 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS'
		AND is_valid = 'Y'
	    AND NOT EXISTS (SELECT '1' FROM cms_stage_marketable_sec
	    				 WHERE cms_collateral_id = sec.cms_collateral_id));
	    				 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_PORTFOLIO_ITEM
	--
	-------------------------------------
	
	UPDATE cms_stage_portfolio_item a 
	set (no_of_units, issuer_name, bond_issue_date, bond_maturity_date,
								 	   recognized_exchange_flag, status) = 
	(SELECT number_of_units, issuer_name, bond_issue_date, bond_maturity_date, recognized_exchange, 
			'ACTIVE'
	   FROM transaction trx, cms_stage_security sec, si_temp_arbs_co007 t
	  WHERE trx.staging_reference_id = sec.cms_collateral_id
			and trx.transaction_type = 'COL'
	    AND sec.sci_security_dtl_id = t.security_id
			and sec.source_id = 'ARBS'
			and t.IS_VALID = 'Y'
	    AND a.cms_collateral_id = sec.cms_collateral_id)
	  WHERE source_id = 'ARBS'
		and EXISTS (SELECT '1' FROM cms_stage_marketable_sec m, cms_stage_security sec, si_temp_arbs_co007 t, transaction trx
	  				 WHERE a.cms_collateral_id = m.cms_collateral_id
	  				   AND sec.cms_collateral_id = m.cms_collateral_id
	  				   AND sec.sci_security_dtl_id = t.security_id 
	  				   AND source_id = 'ARBS'
							 and t.is_valid = 'Y'
							 and trx.transaction_type = 'COL'
							 and trx.staging_reference_id = sec.cms_collateral_id);
	    				 
	INSERT INTO cms_stage_portfolio_item (item_id, cms_collateral_id, no_of_units, issuer_name, bond_issue_date, 
											bond_maturity_date, recognized_exchange_flag, status, source_id, CMS_REF_ID)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT),
			m.cms_collateral_id, number_of_units, issuer_name, bond_issue_date, bond_maturity_date, recognized_exchange, 
			'ACTIVE', 'ARBS',
			(select cms_ref_id from cms_portfolio_item a WHERE a.cms_collateral_id = m.cms_collateral_id AND a.source_id = 'ARBS')
	   FROM cms_stage_marketable_sec m, cms_stage_security sec, si_temp_arbs_co007 t
	  WHERE m.cms_collateral_id = sec.cms_collateral_id
	    AND sec.sci_security_dtl_id = t.security_id
			and sec.SOURCE_ID = 'ARBS'
			and is_valid = 'Y'
	    AND NOT EXISTS (SELECT '1' FROM cms_stage_portfolio_item
	  					 WHERE cms_collateral_id = m.cms_collateral_id
	  					   AND source_id = 'ARBS'));

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO007', 'ARBS', 5);
	commit;
	
	----------------------------
	-- Begin Update
	-- cms_security_source
	--
	----------------------------
	UPDATE cms_security_source SET(cms_collateral_id, source_security_id, source_id, 
								   last_update_date, security_sub_type_id, interface_id, status) =
	(SELECT cms_collateral_id, security_id, 'ARBS', current_timestamp, cms_security_subtype_id,
			'CO007', 'ACTIVE'
	   FROM cms_security sec, si_temp_arbs_co007 t 
	  WHERE sec.sci_security_dtl_id = security_id
	    AND sec.sci_security_dtl_id = source_security_id 
	    AND source_id = 'ARBS' 
	    AND is_valid = 'Y')
	 WHERE EXISTS (SELECT 1 FROM si_temp_arbs_co007 
	 				WHERE source_security_id = security_id 
	 				  AND is_valid = 'Y')
	   AND source_id = 'ARBS';
		
	----------------------------
	-- Begin Insertion
	-- cms_security_source
	--
	----------------------------
	INSERT INTO cms_security_source (cms_security_source_id, cms_collateral_id, source_security_id, source_id, 
									 status, last_update_date, security_sub_type_id, interface_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
			cms_collateral_id, security_id, 'ARBS', 'ACTIVE', CURRENT_TIMESTAMP, cms_security_subtype_id,
			'CO007'
	   FROM cms_security sec, si_temp_arbs_co007 t
	  WHERE NOT EXISTS (SELECT 1 FROM cms_security_source 
						 WHERE source_security_id = security_id 
						   AND source_id = 'ARBS') 
		AND is_valid = 'Y'
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO007', 'ARBS', 6);
	commit;
	
	------------------------------------------
	-- START Update Collateral Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------	
	FOR cur_col_key AS
		SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
			FROM CMS_SECURITY a
		WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co007 t
							WHERE a.SCI_SECURITY_DTL_ID = t.SECURITY_ID		   	  
									AND t.is_valid = 'Y')
			AND a.SOURCE_ID = 'ARBS'	   
			
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
	END FOR;

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO007', 'ARBS', 7);
	commit;
	
	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------
	UPDATE cms_security a SET (DELETED_DATE, status) =
	(current_timestamp, 'DELETED')
	  WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
			AND security_sub_type_id = 'MS'
			AND 'CO007' = (select s.INTERFACE_ID from cms_security_source s where s.SOURCE_ID=a.SOURCE_ID and s.SOURCE_SECURITY_ID=a.SCI_SECURITY_DTL_ID)
			AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co007
	  				 WHERE security_id = a.sci_security_dtl_id
							 and is_valid = 'Y');
	
	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------
	UPDATE cms_stage_security a set (DELETED_DATE, status) =
	(current_timestamp, 'DELETED')
	 WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
			AND security_sub_type_id = 'MS'
			AND 'CO007' = (select s.INTERFACE_ID from cms_security_source s where s.SOURCE_ID=a.SOURCE_ID and s.SOURCE_SECURITY_ID=a.SCI_SECURITY_DTL_ID)
	  	AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co007
	  				 WHERE a.sci_security_dtl_id = security_id
							 and is_valid = 'Y')
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security b
	  							   						   WHERE a.SCI_SECURITY_DTL_ID = b.sci_security_dtl_id
	  							   						     AND b.source_id = 'ARBS')
	  							   	 AND transaction_type = 'COL');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO007', 'ARBS', 8);
	commit;
	
	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Actual Table
	-- CMS_PORTFOLIO_ITEM
	--
	-------------------------------------
	
	UPDATE cms_portfolio_item a set (status) = ('DELETED')
	  WHERE a.status = 'ACTIVE'
			AND a.SOURCE_ID = 'ARBS'
			AND EXISTS (SELECT '1' FROM cms_marketable_sec m, cms_security sec
	  				 WHERE sec.cms_collateral_id = m.cms_collateral_id
						 		AND sec.security_sub_type_id = 'MS'
								AND 'CO007' = (select s.INTERFACE_ID from cms_security_source s where s.SOURCE_ID=sec.SOURCE_ID and s.SOURCE_SECURITY_ID=sec.SCI_SECURITY_DTL_ID)
								AND a.cms_collateral_id = m.cms_collateral_id
								AND source_id = 'ARBS')
			AND NOT EXISTS (SELECT '1' FROM cms_marketable_sec m, cms_security sec, si_temp_arbs_co007 t
	  				 WHERE sec.cms_collateral_id = m.cms_collateral_id
								AND sec.sci_security_dtl_id = t.security_id
								AND a.cms_collateral_id = m.cms_collateral_id
								AND source_id = 'ARBS'
								AND IS_VALID = 'Y');
							 
	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Staging Table
	-- CMS_STAGE_PORTFOLIO_ITEM
	--
	-------------------------------------
	
	UPDATE cms_stage_portfolio_item a set (status) = ('DELETED')
	  WHERE a.source_id = 'ARBS'
			and a.status = 'ACTIVE'
			AND EXISTS (SELECT '1' FROM cms_stage_marketable_sec m, cms_stage_security sec
	  				 WHERE sec.cms_collateral_id = m.cms_collateral_id
						 		AND sec.security_sub_type_id = 'MS'
								AND 'CO007' = (select s.INTERFACE_ID from cms_security_source s where s.SOURCE_ID=sec.SOURCE_ID and s.SOURCE_SECURITY_ID=sec.SCI_SECURITY_DTL_ID)
								AND a.cms_collateral_id = m.cms_collateral_id
								AND source_id = 'ARBS')
			and NOT EXISTS (SELECT '1' FROM cms_stage_marketable_sec m, cms_stage_security sec, 
							si_temp_arbs_co007 t, transaction trx
							WHERE a.cms_collateral_id = m.cms_collateral_id
								AND sec.cms_collateral_id = m.cms_collateral_id
								AND sec.sci_security_dtl_id = t.security_id 
								AND source_id = 'ARBS'
								and t.is_valid = 'Y'
								and trx.transaction_type = 'COL'
								and trx.staging_reference_id = sec.cms_collateral_id);

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO007', 'ARBS', 9);
	commit;
	
	------------------------------------
	-- Tag DELETED for non-exist records
	-- cms_security_source
	--
	------------------------------------
	UPDATE cms_security_source SET(STATUS, last_update_date) =
	('DELETED', current_timestamp)
	 WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
			AND security_sub_type_id = 'MS'
			AND interface_id = 'CO007'
			AND NOT EXISTS (SELECT 1 FROM si_temp_arbs_co007 
						WHERE source_security_id = security_id 
							AND is_valid = 'Y');
													
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO007', 'ARBS', 0);
	
END
@

CREATE PROCEDURE SI_RUN_TEMP_ARBS_CO008
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO008', 'ARBS', 1);
	commit;
	----------------------------------------------
	-- Update security type and subtype id first
	-- si_temp_arbs_co008
	-- @refer si_host_col_code_map
	-- Need Special Handling, based on Stock Code
	--
	----------------------------------------------

	UPDATE si_temp_arbs_co008 a
	   SET (cms_security_type_id, cms_security_subtype_id) =
	(SELECT security_type_id, security_sub_type_id
	   FROM si_host_col_code_map
	  WHERE host_col_code = a.source_security_sub_type)
	 WHERE source_security_sub_type <> '400';
	 
	UPDATE si_temp_arbs_co008 a
	   SET (cms_security_type_id, cms_security_subtype_id) =
	(SELECT 'MS', SI_GET_SUBTYPE_BY_STOCK_CODE_AND_EXCHANGE(stock_code_bond_code, STOCK_EXCHANGE_BOND_MARKET)
	   FROM si_temp_arbs_co008
	  WHERE security_id = a.security_id)
	 WHERE source_security_sub_type = '400';
	 
	UPDATE si_temp_arbs_co008 a 
	SET (issuer_name) = 
	(select issuer_name from cms_price_feed f where f.stock_code = a.stock_code_bond_code and f.stock_code is not null)
	where a.issuer_name is null;
 

	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_security a SET (sci_reference_note, security_sub_type_id, sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, 
							   sci_security_currency, security_location, security_organisation, source_security_type, source_security_sub_type,
								 status) =
	(SELECT security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, 
			loc_country, loc_org_code, source_security_type, source_security_sub_type,
			'ACTIVE'
	   FROM si_temp_arbs_co008 t
	  WHERE t.security_id = a.sci_security_dtl_id
		and is_valid = 'Y'
		and a.source_id = 'ARBS')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co008
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND source_id = 'ARBS'
							 and is_valid = 'Y')
	  	AND source_id = 'ARBS';

	INSERT INTO cms_security (cms_collateral_id, sci_security_dtl_id, sci_reference_note, security_sub_type_id, 
								sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, sci_security_currency, sci_orig_security_currency,
								security_location, SECURITY_ORGANISATION, source_security_type, source_security_sub_type, 
								status, source_id, is_migrated_ind)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
			security_id, security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, currency,
			loc_country, loc_org_code, source_security_type, source_security_sub_type, 'ACTIVE', 'ARBS', 'N'
	   FROM si_temp_arbs_co008 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_security
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS')
		and is_valid = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO008', 'ARBS', 2);
	commit;
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND type_name IS NULL;
	 
	-------------------------------------
	-- Actual Table
	-- CMS_MARKETABLE_SEC
	-- Nothing to Update but Insert only
	--
	-------------------------------------

	INSERT INTO cms_marketable_sec (cms_collateral_id)
	(SELECT cms_collateral_id
	   FROM cms_security sec, si_temp_arbs_co008 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS'
	    AND NOT EXISTS (SELECT '1' FROM cms_marketable_sec
	    				 WHERE cms_collateral_id = sec.cms_collateral_id)
			and is_valid = 'Y');
	    				 
	commit;
	
	-------------------------------------
	-- Actual Table
	-- CMS_PORTFOLIO_ITEM
	--
	-------------------------------------
	
	UPDATE cms_portfolio_item a 
	set (type, certificate_no, no_of_units, stock_exchange, stock_code,
								 recognized_exchange_flag, status) = 
	(SELECT type, certificate_number, number_of_units, stock_exchange_bond_market, stock_code_bond_code, 
			recognized_exchange, 'ACTIVE'
	   FROM cms_marketable_sec m, cms_security sec, si_temp_arbs_co008 t
	  WHERE m.cms_collateral_id = sec.cms_collateral_id
	    AND sec.sci_security_dtl_id = t.security_id
	    AND a.cms_collateral_id = m.cms_collateral_id
			and sec.source_id = 'ARBS'
			and t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM cms_marketable_sec m, cms_security sec, si_temp_arbs_co008 t
	  				 WHERE a.cms_collateral_id = m.cms_collateral_id
	  				   AND sec.cms_collateral_id = m.cms_collateral_id
	  				   AND sec.sci_security_dtl_id = t.security_id 
	  				   AND source_id = 'ARBS'
							 and is_valid = 'Y');
	    				 
	INSERT INTO cms_portfolio_item (item_id, cms_collateral_id, currency_code, type, certificate_no, no_of_units, stock_exchange, 
									  stock_code, recognized_exchange_flag, status, source_id, CMS_REF_ID)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT),
			m.cms_collateral_id, t.currency, type, certificate_number, number_of_units, stock_exchange_bond_market, stock_code_bond_code, 
			recognized_exchange, 'ACTIVE', 'ARBS',
			CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT)
	   FROM cms_marketable_sec m, cms_security sec, si_temp_arbs_co008 t
	  WHERE m.cms_collateral_id = sec.cms_collateral_id
	    AND sec.sci_security_dtl_id = t.security_id
			and sec.source_id = 'ARBS'
			and t.is_valid = 'Y'
	    AND NOT EXISTS (SELECT '1' FROM cms_portfolio_item
	  					 WHERE cms_collateral_id = m.cms_collateral_id
	  					   AND source_id = 'ARBS'));
									  
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO008', 'ARBS', 3);
	commit;
	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_stage_security a SET (sci_reference_note, security_sub_type_id, sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, 
							   		 sci_security_currency, security_location, SECURITY_ORGANISATION, source_security_type, 
							   		 source_security_sub_type,
										 status) =
	(SELECT security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, 
			loc_country, loc_org_code, source_security_type, source_security_sub_type,
			'ACTIVE'
	   FROM si_temp_arbs_co008 t
	  WHERE t.security_id = a.sci_security_dtl_id
		and a.source_id = 'ARBS'
		and t.IS_VALID = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co008
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND source_id = 'ARBS'
							 and is_valid = 'Y')
	  	AND source_id = 'ARBS'
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security, si_temp_arbs_co008
	  							   						   WHERE security_id = sci_security_dtl_id
	  							   						     AND source_id = 'ARBS')
	  							   	 AND transaction_type = 'COL');

	INSERT INTO cms_stage_security (cms_collateral_id, sci_security_dtl_id, sci_reference_note, security_sub_type_id, 
									  sci_security_type_value, SCI_SECURITY_SUBTYPE_VALUE, sci_security_currency, sci_orig_security_currency,
									  security_location, SECURITY_ORGANISATION, source_security_type, source_security_sub_type, 
									  status, source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
			security_id, security_ref_note, cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, currency, currency,
			loc_country, loc_org_code, source_security_type, source_security_sub_type, 'ACTIVE', 'ARBS'
	   FROM si_temp_arbs_co008 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_stage_security
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS')
		and is_valid = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO008', 'ARBS', 4);
	commit;
	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	-- Update type_name, subtype_name
	--
	-------------------------------------
	
	UPDATE cms_stage_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND TYPE_NAME IS NULL;
	 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_MARKETABLE_SEC
	-- Nothing to update but insert only
	--
	-------------------------------------


	INSERT INTO cms_stage_marketable_sec (cms_collateral_id)
	(SELECT cms_collateral_id
	   FROM cms_stage_security sec, si_temp_arbs_co008 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS'
			and is_valid = 'Y'
	    AND NOT EXISTS (SELECT '1' FROM cms_stage_marketable_sec
	    				 WHERE cms_collateral_id = sec.cms_collateral_id));

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO008', 'ARBS', 5);
	commit;
	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_PORTFOLIO_ITEM
	--
	-------------------------------------
	
	UPDATE cms_stage_portfolio_item a 
	set (type, certificate_no, no_of_units, stock_exchange, stock_code,
								 	   recognized_exchange_flag, status) = 
	(SELECT type, certificate_number, number_of_units, stock_exchange_bond_market, stock_code_bond_code, 
			recognized_exchange, 'ACTIVE'
	   FROM cms_stage_marketable_sec m, cms_stage_security sec, si_temp_arbs_co008 t, transaction trx
	  WHERE m.cms_collateral_id = sec.cms_collateral_id
	    AND sec.sci_security_dtl_id = t.security_id
			and sec.source_id = 'ARBS'
			and t.is_valid = 'Y'
			and sec.CMS_COLLATERAL_ID = trx.staging_reference_id
			and trx.transaction_type = 'COL'
	    AND a.cms_collateral_id = m.cms_collateral_id)
	  WHERE a.source_id = 'ARBS'
		and EXISTS (SELECT '1' 
						FROM cms_stage_marketable_sec m, cms_stage_security sec, si_temp_arbs_co008 t, transaction trx
	  				 WHERE a.cms_collateral_id = m.cms_collateral_id
	  				   AND sec.cms_collateral_id = m.cms_collateral_id
	  				   AND sec.sci_security_dtl_id = t.security_id 
	  				   AND source_id = 'ARBS'
							 and is_valid = 'Y'
							 and trx.transaction_type = 'COL'
							 and trx.staging_reference_id = sec.cms_collateral_id);

	    				 
	INSERT INTO cms_stage_portfolio_item (item_id, cms_collateral_id, type, certificate_no, no_of_units, stock_exchange, 
											stock_code, recognized_exchange_flag, status, source_id, CMS_REF_ID)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR marketable_equity_seq), 2)) as BIGINT),
			m.cms_collateral_id, type, certificate_number, number_of_units, stock_exchange_bond_market, stock_code_bond_code, 
			recognized_exchange, 'ACTIVE', 'ARBS',
			(select cms_ref_id from cms_portfolio_item a WHERE a.cms_collateral_id = m.cms_collateral_id AND a.source_id = 'ARBS')
	   FROM cms_stage_marketable_sec m, cms_stage_security sec, si_temp_arbs_co008 t
	  WHERE m.cms_collateral_id = sec.cms_collateral_id
	    AND sec.sci_security_dtl_id = t.security_id
			and sec.source_id = 'ARBS'
			and is_valid = 'Y'
	    AND NOT EXISTS (SELECT '1' FROM cms_stage_portfolio_item
	  					 WHERE cms_collateral_id = m.cms_collateral_id
	  					   AND source_id = 'ARBS'));

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO008', 'ARBS', 6);
	commit;
	
	----------------------------
	-- Begin Update
	-- cms_security_source
	--
	----------------------------
	UPDATE cms_security_source SET(cms_collateral_id, source_security_id, source_id, 
								   last_update_date, security_sub_type_id, interface_id, status) =
	(SELECT cms_collateral_id, security_id, 'ARBS', current_timestamp, cms_security_subtype_id,
		'CO008', 'ACTIVE'
	   FROM cms_security sec, si_temp_arbs_co008 t 
	  WHERE sec.sci_security_dtl_id = security_id
	    AND sec.sci_security_dtl_id = source_security_id 
	    AND source_id = 'ARBS' 
	    AND is_valid = 'Y')
	 WHERE EXISTS (SELECT 1 FROM si_temp_arbs_co008
	 				WHERE source_security_id = security_id 
	 				  AND is_valid = 'Y')
	   AND source_id = 'ARBS';
		
	----------------------------
	-- Begin Insertion
	-- cms_security_source
	--
	----------------------------
	INSERT INTO cms_security_source (cms_security_source_id, cms_collateral_id, source_security_id, source_id, 
									 status, last_update_date, security_sub_type_id, interface_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
			cms_collateral_id, security_id, 'ARBS', 'ACTIVE', CURRENT_TIMESTAMP, cms_security_subtype_id,
			'CO008'
	   FROM cms_security sec, si_temp_arbs_co008 t
	  WHERE NOT EXISTS (SELECT 1 FROM cms_security_source 
						 WHERE source_security_id = security_id 
						   AND source_id = 'ARBS') 
		AND is_valid = 'Y'
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO008', 'ARBS', 7);
	commit;
	
	------------------------------------------
	-- START Update Collateral Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------	
	FOR cur_col_key AS
		SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
			FROM CMS_SECURITY a
		WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co008 t
							WHERE a.SCI_SECURITY_DTL_ID = t.SECURITY_ID		   	  
									AND t.is_valid = 'Y')
			AND a.SOURCE_ID = 'ARBS'	   
			
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
	END FOR;

	------------------------------------------
	-- END Update Collateral Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO008', 'ARBS', 8);
	commit;
	
	-------------------------------------------
	-- Populate ear mark group for predeal module
	--
	-------------------------------------------
	update cms_earmark_group eg
	set eg.TOTAL_NO_OF_UNITS = (select total_units from
		(select feed.feed_id, coalesce(sum(item.NO_OF_UNITS), 0) as total_units
					from cms_feed_group grp, cms_price_feed feed
							left outer join cms_portfolio_item item on item.STOCK_CODE = feed.stock_code
									and item.type = 'S'
									and item.source_id = 'ARBS'
									and status = 'ACTIVE'
							left outer join cms_security s on s.cms_collateral_id = item.cms_collateral_id
									and s.security_sub_type_id in ('MS600', 'MS601', 'MS605', 'MS606')
					where feed.FEED_GROUP_ID = grp.FEED_GROUP_ID
					and grp.GROUP_TYPE = 'STOCK'
					group by feed.FEED_ID) arbs_feed
					where arbs_feed.feed_id = eg.FEED_ID)
	where eg.SOURCE_SYSTEM_ID = 'ARBS';
    
  INSERT INTO CMS_EARMARK_GROUP (
          EARMARK_GROUP_ID,
          FEED_ID,
          SOURCE_SYSTEM_ID,
          TOTAL_NO_OF_UNITS)
          (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_EARMARK_GROUP_SEQ), 2)) as BIGINT),
          feed_id, 'ARBS', total_units
          from (select feed.feed_id, coalesce(sum(item.NO_OF_UNITS), 0) as total_units
              from cms_feed_group grp, cms_price_feed feed
                  left outer join cms_portfolio_item item on item.STOCK_CODE = feed.stock_code
                      and item.type = 'S'
                      and item.source_id = 'ARBS'
                      and status = 'ACTIVE'
                  left outer join cms_security s on s.cms_collateral_id = item.cms_collateral_id
                      and s.security_sub_type_id in ('MS600', 'MS601', 'MS605', 'MS606')
              where feed.FEED_GROUP_ID = grp.FEED_GROUP_ID
              and grp.GROUP_TYPE = 'STOCK'
              group by feed.FEED_ID) arbs_feed
          where not exists (select '1'
                          from cms_earmark_group gp
                          where gp.feed_id = arbs_feed.feed_id
                          and gp.SOURCE_SYSTEM_ID = 'ARBS'));

	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------
	UPDATE cms_security a SET (DELETED_DATE, status) =
	(current_timestamp, 'DELETED')
	  WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'  
			AND security_sub_type_id = 'MS'
			AND 'CO008' = (select s.INTERFACE_ID from cms_security_source s where s.SOURCE_ID=a.SOURCE_ID and s.SOURCE_SECURITY_ID=a.SCI_SECURITY_DTL_ID)
			AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co008
	  				 WHERE a.sci_security_dtl_id = security_id
							 and is_valid = 'Y');
	
	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------
	UPDATE cms_stage_security a set (DELETED_DATE, status) =
	(current_timestamp, 'DELETED')
	 WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
			AND security_sub_type_id = 'MS'
			AND 'CO008' = (select s.INTERFACE_ID from cms_security_source s where s.SOURCE_ID=a.SOURCE_ID and s.SOURCE_SECURITY_ID=a.SCI_SECURITY_DTL_ID)
	  	AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co008
	  				 WHERE a.sci_security_dtl_id = security_id
							 and is_valid = 'Y')
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security b
	  							   						   WHERE a.SCI_SECURITY_DTL_ID = b.sci_security_dtl_id
	  							   						     AND b.source_id = 'ARBS')
	  							   	 AND transaction_type = 'COL');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO008', 'ARBS', 9);
	commit;
	
	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Actual Table
	-- CMS_PORTFOLIO_ITEM
	--
	-------------------------------------
	
	UPDATE cms_portfolio_item a set (status) = ('DELETED')
	  WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
			AND EXISTS (SELECT '1' FROM cms_marketable_sec m, cms_security sec
	  				 WHERE sec.cms_collateral_id = m.cms_collateral_id
						 		AND sec.security_sub_type_id = 'MS'
								AND 'CO008' = (select s.INTERFACE_ID from cms_security_source s where s.SOURCE_ID=sec.SOURCE_ID and s.SOURCE_SECURITY_ID=sec.SCI_SECURITY_DTL_ID)
								AND a.cms_collateral_id = m.cms_collateral_id
								AND source_id = 'ARBS')
			AND NOT EXISTS (SELECT '1' FROM cms_marketable_sec m, cms_security sec, si_temp_arbs_co008 t
	  				 WHERE a.cms_collateral_id = m.cms_collateral_id
	  				   AND sec.cms_collateral_id = m.cms_collateral_id
	  				   AND sec.sci_security_dtl_id = t.security_id 
	  				   AND source_id = 'ARBS'
							 AND IS_VALID = 'Y');
							 
	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Staging Table
	-- CMS_STAGE_PORTFOLIO_ITEM
	--
	-------------------------------------
	
	UPDATE cms_stage_portfolio_item a set (status) = ('DELETED')
	  WHERE source_id = 'ARBS'
			and status = 'ACTIVE'
			AND EXISTS (SELECT '1' FROM cms_stage_marketable_sec m, cms_stage_security sec
	  				 WHERE sec.cms_collateral_id = m.cms_collateral_id
						 		AND sec.security_sub_type_id = 'MS'
								AND 'CO008' = (select s.INTERFACE_ID from cms_security_source s where s.SOURCE_ID=sec.SOURCE_ID and s.SOURCE_SECURITY_ID=sec.SCI_SECURITY_DTL_ID)
								AND a.cms_collateral_id = m.cms_collateral_id
								AND source_id = 'ARBS')
			and NOT EXISTS (SELECT '1' FROM cms_stage_marketable_sec m, cms_stage_security sec, 
							si_temp_arbs_co008 t, transaction trx
							WHERE a.cms_collateral_id = m.cms_collateral_id
								AND sec.cms_collateral_id = m.cms_collateral_id
								AND sec.sci_security_dtl_id = t.security_id 
								AND source_id = 'ARBS'
								and t.is_valid = 'Y'
								and trx.transaction_type = 'COL'
								and trx.staging_reference_id = sec.cms_collateral_id);

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO008', 'ARBS', 10);
	commit;
	
	------------------------------------
	-- Tag DELETED for non-exist records
	-- cms_security_source
	--
	------------------------------------
	UPDATE cms_security_source SET(STATUS, last_update_date) =
	('DELETED', current_timestamp)
	 WHERE source_id = 'ARBS'
	 		AND status = 'ACTIVE'
			AND security_sub_type_id = 'MS'
			AND interface_id = 'CO008'
	 		AND NOT EXISTS (SELECT 1 FROM si_temp_arbs_co008
	 				WHERE source_security_id = security_id 
	 				  AND is_valid = 'Y');


	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO008', 'ARBS', 0);
END
@

CREATE PROCEDURE SI_RUN_TEMP_ARBS_CO009(IN LOAD_TYPE VARCHAR(255))
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 1);
	commit;
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT LOC_ORG_CODE code, LOC_ORG_DESC desc,
			   LOC_ORG_CAT cat, 'ARBS' source_id
		  FROM si_temp_arbs_co009
		 WHERE LOC_ORG_CODE <> ''
		   AND LOC_ORG_DESC <> ''
		UNION
		SELECT DISTINCT CATEGORY_OF_LAND_USE_CODE code, CATEGORY_OF_LAND_USE_DESC desc,
			   LAND_USE_CAT cat, 'ARBS' source_id
		  FROM si_temp_arbs_co009
		 WHERE CATEGORY_OF_LAND_USE_CODE <> ''
		   AND CATEGORY_OF_LAND_USE_DESC <> ''
		UNION
		SELECT DISTINCT PROPERTY_TYPE_CODE code, PROPERTY_TYPE_DESC desc,
			   PROPERTY_TYPE_CAT cat, 'ARBS' source_id
		  FROM si_temp_arbs_co009
		 WHERE PROPERTY_TYPE_CODE <> ''
		   AND PROPERTY_TYPE_DESC <> ''
		UNION
		SELECT DISTINCT STATE_CODE code, STATE_DESC desc,
			   STATE_CAT cat, 'ARBS' source_id
		  FROM si_temp_arbs_co009
		 WHERE STATE_CODE <> ''
		   AND STATE_DESC <> ''		
		UNION
		SELECT DISTINCT DISTRICT_CODE code, DISTRICT_DESC desc,
			   DISTRICT_CAT cat, 'ARBS' source_id
		  FROM si_temp_arbs_co009
		 WHERE DISTRICT_CODE <> ''
		   AND DISTRICT_DESC <> ''	
		UNION
		SELECT DISTINCT MUKIM_CODE code, MUKIM_DESC desc,
			   MUKIM_CAT cat, 'ARBS' source_id
		  FROM si_temp_arbs_co009
		 WHERE DISTRICT_CODE <> ''
		   AND DISTRICT_DESC <> ''
		UNION
		SELECT DISTINCT DEVELOPER_NAME_CODE code, DEVELOPER_NAME_DESC desc,
			   DEVELOPER_NAME_CAT cat, 'ARBS' source_id
		  FROM si_temp_arbs_co009
		 WHERE DEVELOPER_NAME_CODE <> ''
		   AND DEVELOPER_NAME_DESC <> ''
		UNION
		SELECT DISTINCT PROJECT_NAME_CODE code, PROJECT_NAME_DESC desc,
			   PROJECT_NAME_CAT cat, 'ARBS' source_id
		  FROM si_temp_arbs_co009
		 WHERE PROJECT_NAME_CODE <> ''
		   AND PROJECT_NAME_DESC <> ''
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;

	--------------------------------------------
	-- Update security type and subtype id first
	-- si_temp_arbs_co009
	-- @refer si_host_col_code_map
	--
	--------------------------------------------

	UPDATE si_temp_arbs_co009 a 
	   SET (cms_security_type_id, cms_security_subtype_id) =
	(SELECT security_type_id, security_sub_type_id
	   FROM si_host_col_code_map
	  WHERE host_col_code = a.source_security_sub_type);
	  
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 2);
	COMMIT;
	  
	--------------------------------------
	-- Populate CMS key into Temp table
	-- Collateral, act and stg
	--------------------------------------
	  
	UPDATE si_temp_arbs_co009 a SET (cms_act_col_id, cms_stg_col_id) =
	(SELECT reference_id, staging_reference_id
	   FROM transaction, cms_security
	  WHERE transaction_type = 'COL'
	    AND reference_id = cms_collateral_id
		AND a.security_id = sci_security_dtl_id
		AND source_id = 'ARBS')
	 WHERE is_valid = 'Y';
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 3);
	COMMIT;

	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------
	lock table cms_security in share mode;
	UPDATE cms_security a SET (	
		sci_security_dtl_id, sci_reference_note, sci_security_currency, security_location, security_organisation,
		custodian_type, security_custodian, security_maturity_date, is_legal_enforce, is_legal_enforce_date,
		security_perfection_date, security_sub_type_id, sci_security_type_value, sci_security_subtype_value, 
		source_security_type, source_security_sub_type,
		status) =
	(SELECT
		security_id, security_ref_note, currency, loc_country, loc_org_code, custodian_type, custodian,
		security_expiry_date, legal_enforceability, legal_enforceability_date, security_perfection_date,
		cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, source_security_type,
		source_security_sub_type,
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co009 t
	  WHERE t.security_id = a.sci_security_dtl_id
	    AND t.cms_act_col_id = a.cms_collateral_id
	  	AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co009
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND a.cms_collateral_id = cms_act_col_id
	  				   AND is_valid = 'Y')
	  	AND security_sub_type_id IN ('PT700','PT701','PT702','PT703','PT704','PT706','PT707','PT709')
	  	AND source_id = 'ARBS';

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 31);
	COMMIT;

	INSERT INTO cms_security (
		cms_collateral_id, sci_security_dtl_id, sci_reference_note, sci_security_currency, sci_orig_security_currency,
		security_location, security_organisation, custodian_type, security_custodian, security_maturity_date,
		is_legal_enforce, is_legal_enforce_date, security_perfection_date, security_sub_type_id, 
		sci_security_type_value, sci_security_subtype_value, source_security_type, source_security_sub_type,
		status, source_id, is_migrated_ind)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
		security_id, security_ref_note,	currency, currency, loc_country, loc_org_code, custodian_type, custodian,
		security_expiry_date, legal_enforceability, legal_enforceability_date, security_perfection_date,
		cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, source_security_type,
		source_security_sub_type, 'ACTIVE',	'ARBS', 'N'
	   FROM si_temp_arbs_co009 t
	  WHERE t.cms_act_col_id IS NULL
		AND t.is_valid = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 32);
	COMMIT;
	
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	lock table cms_security in share mode;
	UPDATE cms_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co009
  				 WHERE a.sci_security_dtl_id = security_id
  				   AND a.cms_collateral_id = cms_act_col_id
  				   AND is_valid = 'Y')
  	AND security_sub_type_id IN ('PT700','PT701','PT702','PT703','PT704','PT706','PT707','PT709')
  	AND source_id = 'ARBS';
	 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 4);
	COMMIT;
	 
	-------------------------------------
	-- Actual Table
	-- CMS_PROPERTY
	--
	-------------------------------------
	lock table cms_property in share mode;
	UPDATE cms_property a SET(
		description_asset, sale_purchase_value, title_type, title_number, lot_no, PROPERTY_ADDRESS,
		postcode, tenure, tenure_unit, quit_rent_paid, abandoned_project, sale_purchase_date,
		master_title, master_title_number, town, property_usage, property_completed_flag,
		property_completion_status, category_of_land_use, property_type, insurance, auto_debit, land_value,	building_value,
		tooltips_land, tooltips_builtarea, state, district, mukim, land_area_uom, builtup_area_uom,
		developer_name, project_name)=
	(SELECT 
		asset_desc_code, sale_purchase_agreement_value, title_type, title_number, lot_no, lot_loc,
		post_code, tenure, tenure_unit, quit_rent_amt_paid, abandoned_project, sale_purchase_date,
		master_title, master_title_number, state_code, property_usage, property_completed_flag,
-- 		(case property_completed_flag when
-- 		'Y' then '1'
-- 		when 'W' then '2'
-- 		when 'N' then '3' end),
        property_completed_flag,
		category_of_land_use_code, property_type_code, insurance, auto_debit, land_value, building_value,
		land_area, built_up_area, state_code, district_code, mukim_code, land_area_uom, build_area_uom,
		developer_name_code, project_name_code
		from cms_security sec, si_temp_arbs_co009 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND a.cms_collateral_id = sec.cms_collateral_id
	    AND a.cms_collateral_id = t.cms_act_col_id
		AND sec.source_id = 'ARBS' 
		AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM cms_security, si_temp_arbs_co009
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND a.cms_collateral_id = cms_act_col_id
	    			   AND security_id = sci_security_dtl_id
	    			   AND source_id = 'ARBS' 
	    			   AND is_valid = 'Y');
							 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 41);
	COMMIT;
	
	INSERT INTO cms_property (
		cms_collateral_id, description_asset, sale_purchase_value, title_type, title_number,
		lot_no, PROPERTY_ADDRESS, postcode, tenure, tenure_unit, quit_rent_paid, abandoned_project,
		sale_purchase_date, master_title, master_title_number, property_usage, property_completed_flag,
		property_completion_status, category_of_land_use, property_type, insurance, auto_debit, land_value, building_value, tooltips_land,
		tooltips_builtarea, state, district, mukim, land_area_uom, builtup_area_uom,
		developer_name, project_name, env_risky_status)
	(SELECT 
		sec.cms_collateral_id, asset_desc_code, sale_purchase_agreement_value, title_type, title_number,
		lot_no, lot_loc, post_code, tenure, tenure_unit, quit_rent_amt_paid, abandoned_project,
		sale_purchase_date, master_title, master_title_number, 
		property_usage, property_completed_flag, 
-- 		(case property_completed_flag when
-- 		'Y' then '1'
-- 		when 'W' then '2'
-- 		when 'N' then '3' end),
        property_completed_flag,
		category_of_land_use_code, property_type_code,
		insurance, auto_debit, land_value, building_value, land_area, built_up_area,
		state_code, district_code, mukim_code, land_area_uom, build_area_uom,
		developer_name_code, project_name_code, 'N'
		from cms_security sec, si_temp_arbs_co009 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS' 
	    AND t.is_valid = 'Y'
	    AND t.cms_act_col_id IS NULL);

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 5);
	COMMIT;

	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------
	lock table cms_stage_security in share mode;
	UPDATE cms_stage_security a SET (
		sci_security_dtl_id, sci_reference_note, sci_security_currency, security_location, security_organisation,
		custodian_type, security_custodian, security_maturity_date, is_legal_enforce, is_legal_enforce_date,
		security_perfection_date, security_sub_type_id, sci_security_type_value, sci_security_subtype_value, 
		source_security_type, source_security_sub_type,
		status) =
	(SELECT
		security_id, security_ref_note, currency, loc_country, loc_org_code, custodian_type, custodian,
		security_expiry_date, legal_enforceability, legal_enforceability_date, security_perfection_date,
		cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, source_security_type,
		source_security_sub_type,
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co009 t
	  WHERE t.security_id = a.sci_security_dtl_id
		AND a.cms_collateral_id = t.cms_stg_col_id
	  	AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co009
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND a.cms_collateral_id = cms_stg_col_id
	  				   AND is_valid = 'Y')
	  	AND security_sub_type_id IN ('PT700','PT701','PT702','PT703','PT704','PT706','PT707','PT709')
	  	AND source_id = 'ARBS';

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 51);
	COMMIT;
	
	INSERT INTO cms_stage_security (
		cms_collateral_id, sci_security_dtl_id,	sci_reference_note,	sci_security_currency, sci_orig_security_currency, security_location,
		security_organisation, custodian_type, security_custodian, security_maturity_date, is_legal_enforce,
		is_legal_enforce_date, security_perfection_date, security_sub_type_id, sci_security_type_value, 
		sci_security_subtype_value, source_security_type, source_security_sub_type,	status,	source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
		security_id, security_ref_note,	currency,currency,loc_country, loc_org_code, custodian_type,	custodian,
		security_expiry_date, legal_enforceability, legal_enforceability_date, security_perfection_date,
		cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id, source_security_type,
		source_security_sub_type, 'ACTIVE',	'ARBS'
	   FROM si_temp_arbs_co009 t
	  WHERE t.cms_stg_col_id IS NULL
	    AND t.is_valid = 'Y');
	  					   
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 6);
	COMMIT;
								 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	lock table cms_stage_security in share mode;
	UPDATE cms_stage_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co009
  				 WHERE a.sci_security_dtl_id = security_id
  				   AND a.cms_collateral_id = cms_stg_col_id
  				   AND is_valid = 'Y')
  	AND security_sub_type_id IN ('PT700','PT701','PT702','PT703','PT704','PT706','PT707','PT709')
  	AND source_id = 'ARBS';

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 61);
	COMMIT;
	
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_PROPERTY
	--
	-------------------------------------
	lock table cms_stage_property in share mode;
	UPDATE cms_stage_property a SET(
		description_asset, sale_purchase_value, title_type, title_number, lot_no, PROPERTY_ADDRESS,
		postcode, tenure, tenure_unit, quit_rent_paid, abandoned_project, sale_purchase_date,
		master_title, master_title_number, property_usage, property_completed_flag,
		property_completion_status, category_of_land_use, property_type, insurance, auto_debit, land_value, 
		building_value, tooltips_land, tooltips_builtarea, 
		state, district, mukim, land_area_uom, builtup_area_uom,
		developer_name, project_name)=
	(SELECT 
		asset_desc_code, sale_purchase_agreement_value, title_type, title_number,
		lot_no, lot_loc, post_code, tenure, tenure_unit, quit_rent_amt_paid,
		abandoned_project, sale_purchase_date, master_title, master_title_number,
		property_usage, property_completed_flag, 
-- 		(case property_completed_flag when
-- 		'Y' then '1'
-- 		when 'W' then '2'
-- 		when 'N' then '3' end),
        property_completed_flag,
		category_of_land_use_code,
		property_type_code, insurance, auto_debit, land_value, building_value, land_area, built_up_area,
		state_code, district_code, mukim_code, land_area_uom, build_area_uom,
		developer_name_code, project_name_code
	   FROM cms_stage_security sec, si_temp_arbs_co009 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND a.cms_collateral_id = sec.cms_collateral_id
	    AND sec.cms_collateral_id = t.cms_stg_col_id
		AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM cms_stage_security, si_temp_arbs_co009
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND cms_collateral_id = cms_stg_col_id
	    			   AND security_id = sci_security_dtl_id
	    			   AND source_id = 'ARBS' 
	    			   AND is_valid = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 62);
	COMMIT;

	INSERT INTO cms_stage_property(
		cms_collateral_id, description_asset, sale_purchase_value, title_type, title_number,
		lot_no, PROPERTY_ADDRESS, postcode, tenure, tenure_unit, quit_rent_paid, abandoned_project,
		sale_purchase_date, master_title, master_title_number, property_usage,
		property_completed_flag, property_completion_status, category_of_land_use, property_type, insurance,
		auto_debit, land_value, building_value, tooltips_land, tooltips_builtarea,
		state, district, mukim, land_area_uom, builtup_area_uom,
		developer_name, project_name, env_risky_status)
	(SELECT 
		sec.cms_collateral_id, asset_desc_code, sale_purchase_agreement_value, title_type,
		title_number, lot_no, lot_loc, post_code, tenure, tenure_unit, quit_rent_amt_paid,
		abandoned_project, sale_purchase_date, master_title, master_title_number,
		property_usage, property_completed_flag, 
-- 		(case property_completed_flag when
-- 		'Y' then '1'
-- 		when 'W' then '2'
-- 		when 'N' then '3' end),
        property_completed_flag,
		category_of_land_use_code,
		property_type_code, insurance, auto_debit, land_value, building_value,
		land_area, built_up_area,
		state_code, district_code, mukim_code, land_area_uom, build_area_uom,
		developer_name_code, project_name_code, 'N'
		from cms_stage_security sec, si_temp_arbs_co009 t
	  WHERE sec.sci_security_dtl_id = t.security_id 
	  	AND t.is_valid = 'Y'
	    AND source_id = 'ARBS'
	    AND t.cms_stg_col_id IS NULL);
	    				 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 7);
	COMMIT;
							 
	----------------------------
	-- Begin Update
	-- cms_security_source
	--
	----------------------------
	lock table cms_security_source in share mode;
	UPDATE cms_security_source SET(cms_collateral_id, source_security_id, source_id, 
								   last_update_date, security_sub_type_id, interface_id,
									 status) =
	(SELECT cms_collateral_id, security_id, 'ARBS', current_timestamp, cms_security_subtype_id,
		'CO009',
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM cms_security sec, si_temp_arbs_co009 t 
	  WHERE sec.sci_security_dtl_id = security_id
	    AND sec.sci_security_dtl_id = source_security_id 
	    AND source_id = 'ARBS' 
	    AND is_valid = 'Y')
	 WHERE EXISTS (SELECT 1 FROM si_temp_arbs_co009 
	 				WHERE source_security_id = security_id 
	 				  AND is_valid = 'Y')
	   AND source_id = 'ARBS';

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 71);
	COMMIT;
	----------------------------
	-- Begin Insertion
	-- cms_security_source
	--
	----------------------------
	INSERT INTO cms_security_source (cms_security_source_id, cms_collateral_id, source_security_id, source_id, 
									 status, last_update_date, security_sub_type_id, interface_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
			cms_collateral_id, security_id, 'ARBS', 'ACTIVE', CURRENT_TIMESTAMP, cms_security_subtype_id,
			'CO009'
	   FROM cms_security sec, si_temp_arbs_co009 t
	  WHERE NOT EXISTS (SELECT 1 FROM cms_security_source 
						 WHERE source_security_id = security_id 
						   AND source_id = 'ARBS') 
		AND is_valid = 'Y'
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 8);
	COMMIT;
	------------------------------------------
	-- START Update Collateral Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------	
	FOR cur_col_key AS
		SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
			FROM CMS_SECURITY a
		WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co009 t
							WHERE a.SCI_SECURITY_DTL_ID = t.SECURITY_ID		   	  
									AND t.is_valid = 'Y')
			AND a.SOURCE_ID = 'ARBS'	   
			
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
	END FOR;

	IF(upper(LOAD_TYPE)='FULL') THEN
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 9);
		COMMIT;
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Actual Table
		-- CMS_SECURITY
		--
		-------------------------------------
		UPDATE cms_security a SET (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
			WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'PT'
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co009
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y');
		
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Staging Table
		-- CMS_STAGE_SECURITY
		--
		-------------------------------------
		UPDATE cms_stage_security a set (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
		WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'PT'
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co009
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y')
				AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
											WHERE reference_id IN (SELECT cms_collateral_id 
																		FROM cms_security b
																		WHERE a.SCI_SECURITY_DTL_ID = b.sci_security_dtl_id
																			AND b.source_id = 'ARBS')
												AND transaction_type = 'COL');
	
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 10);
		commit;
		
		------------------------------------
		-- Tag DELETED for non-exist records
		-- cms_security_source
		--
		------------------------------------
		UPDATE cms_security_source SET(STATUS, last_update_date) =
		('DELETED', current_timestamp)
		WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
			AND security_sub_type_id = 'PT'
			AND NOT EXISTS (SELECT 1 FROM si_temp_arbs_co009
						WHERE source_security_id = security_id 
							AND is_valid = 'Y');
	END IF;
										 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO009', 'ARBS', 0);
	
END@


CREATE PROCEDURE SI_RUN_TEMP_ARBS_CO010(IN LOAD_TYPE VARCHAR(255))
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 1);
	commit;
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT LOC_ORG_CODE code, LOC_ORG_DESC desc,
			   LOC_ORG_CAT cat, 'ARBS' source_id
		  FROM si_temp_arbs_co010
		 WHERE LENGTH(LOC_ORG_CODE) > 0
		   AND LENGTH(LOC_ORG_DESC) > 0
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;

	--------------------------------------------
	-- Update security type and subtype id first
	-- si_temp_arbs_co010
	-- @refer si_host_col_code_map
	--
	--------------------------------------------

	UPDATE si_temp_arbs_co010 a 
	   SET (cms_security_type_id, cms_security_subtype_id) =
	(SELECT security_type_id, security_sub_type_id
	   FROM si_host_col_code_map
	  WHERE host_col_code = a.source_security_sub_type);
	  
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 2);
	COMMIT;
	  
	--------------------------------------
	-- Populate CMS key into Temp table
	-- Collateral, act and stg
	--------------------------------------
	  
	UPDATE si_temp_arbs_co010 a SET (cms_act_col_id, cms_stg_col_id) =
	(SELECT reference_id, staging_reference_id
	   FROM transaction, cms_security
	  WHERE transaction_type = 'COL'
		AND reference_id = cms_collateral_id
		AND a.security_id = sci_security_dtl_id
		AND source_id = 'ARBS')
	 WHERE is_valid = 'Y';
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 3);
	COMMIT;

	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------
	lock table cms_security in share mode;
	UPDATE cms_security a SET (	
		sci_security_dtl_id, sci_reference_note, sci_security_currency, security_location, security_organisation,
		custodian_type, security_maturity_date, is_legal_enforce, is_legal_enforce_date, security_perfection_date, 
		security_sub_type_id, sci_security_type_value, sci_security_subtype_value, source_security_type,
		source_security_sub_type,
		status) =
	(SELECT
		security_id, security_ref_note,	currency, loc_country, loc_org_code, custodian_type, security_expiry_date,
		legal_enforceability, legal_enforceability_date, security_perfection_date, cms_security_subtype_id, 
		cms_security_type_id, cms_security_subtype_id, source_security_type, source_security_sub_type,
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co010 t
	  WHERE t.security_id = a.sci_security_dtl_id
	    AND cms_act_col_id = a.cms_collateral_id
	  	AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co010
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND a.cms_collateral_id = cms_act_col_id
	  				   AND is_valid = 'Y')
		AND security_sub_type_id IN ('GT400','GT402','GT405','GT406','GT407','GT408','GT409','GT410')
	  AND source_id = 'ARBS';

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 31);
	COMMIT;
	
	INSERT INTO cms_security (
		cms_collateral_id, sci_security_dtl_id, sci_reference_note, sci_security_currency, sci_orig_security_currency,
		security_location, security_organisation, custodian_type, security_maturity_date, is_legal_enforce, is_legal_enforce_date,
		security_perfection_date, security_sub_type_id, sci_security_type_value, sci_security_subtype_value, 
		source_security_type, source_security_sub_type,	status,	source_id, is_migrated_ind)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
		security_id, security_ref_note, currency, currency, loc_country, loc_org_code, custodian_type, security_expiry_date,
		legal_enforceability, legal_enforceability_date, security_perfection_date, cms_security_subtype_id, 
		cms_security_type_id, cms_security_subtype_id, source_security_type, source_security_sub_type, 
		'ACTIVE', 'ARBS', 'N'
	   FROM si_temp_arbs_co010 t
	  WHERE cms_act_col_id IS NULL
	  	AND t.is_valid = 'Y');
	  	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 32);
	COMMIT;
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	lock table cms_security in share mode;
	UPDATE cms_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co010
  				 WHERE a.sci_security_dtl_id = security_id
  				   AND a.cms_collateral_id = cms_act_col_id
  				   AND is_valid = 'Y')
	AND security_sub_type_id IN ('GT400','GT402','GT405','GT406','GT407','GT408','GT409','GT410')
  AND source_id = 'ARBS';
	 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 4);
	COMMIT;
	 
	-------------------------------------
	-- Actual Table
	-- CMS_GUARANTEE
	--
	-------------------------------------
	lock table cms_guarantee in share mode;
	UPDATE cms_guarantee a SET(
		description, reference_no, guarantee_amt, currency_code, guarantee_date, issuing_bank, issuing_confirm_date,
		insurance, auto_debit
	)=
	(SELECT 
		guarantees_desc, ref_no, guarantee_amt, sec.sci_security_currency, guarantee_date, issuing_bank, issuing_confirmation_date,
		insurance, auto_debit
		FROM cms_security sec, si_temp_arbs_co010 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND a.cms_collateral_id = sec.cms_collateral_id
	    AND sec.cms_collateral_id = t.cms_act_col_id
		AND sec.source_id = 'ARBS'
		AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM cms_security, si_temp_arbs_co010
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND cms_collateral_id = cms_act_col_id
	    			   AND security_id = sci_security_dtl_id
	    			   AND source_id = 'ARBS' 
	    			   AND is_valid = 'Y');
							 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 41);
	COMMIT;
	
	INSERT INTO cms_guarantee(
		cms_collateral_id, description, reference_no, guarantee_amt, currency_code, guarantee_date,
		issuing_bank, issuing_confirm_date,	insurance, auto_debit)
	(SELECT 
		sec.cms_collateral_id, guarantees_desc,	ref_no,	guarantee_amt, sec.sci_security_currency, guarantee_date,
		issuing_bank, issuing_confirmation_date, insurance, auto_debit
	   FROM cms_security sec, si_temp_arbs_co010 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS' 
	    AND t.is_valid = 'Y'
	    AND t.cms_act_col_id IS NULL);
	    
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 5);
	COMMIT;
	 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------
	lock table cms_stage_security in share mode;
	UPDATE cms_stage_security a SET (
		sci_security_dtl_id, sci_reference_note, sci_security_currency, security_location,
		security_organisation, custodian_type, security_maturity_date, is_legal_enforce,
		is_legal_enforce_date, security_perfection_date, security_sub_type_id, 
		sci_security_type_value, sci_security_subtype_value, source_security_type,
		source_security_sub_type,
		status) =
	(SELECT
		security_id, security_ref_note,	currency, loc_country, loc_org_code, custodian_type,
		security_expiry_date, legal_enforceability, legal_enforceability_date, security_perfection_date,
		cms_security_subtype_id, cms_security_type_id, cms_security_subtype_id,	source_security_type,
		source_security_sub_type,
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co010 t
	  WHERE t.security_id = a.sci_security_dtl_id
	    AND t.cms_stg_col_id = a.cms_collateral_id
	    AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co010
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND a.cms_collateral_id = cms_stg_col_id
	  				   AND is_valid = 'Y')
		AND security_sub_type_id IN ('GT400','GT402','GT405','GT406','GT407','GT408','GT409','GT410')
	 	AND source_id = 'ARBS';

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 51);
	COMMIT;
	
	INSERT INTO cms_stage_security (
		cms_collateral_id, sci_security_dtl_id,	sci_reference_note,	sci_security_currency,sci_orig_security_currency, security_location,
		security_organisation, custodian_type, security_maturity_date, is_legal_enforce, is_legal_enforce_date,
		security_perfection_date, security_sub_type_id, sci_security_type_value, sci_security_subtype_value, 
		source_security_type, source_security_sub_type,	status,	source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
		security_id, security_ref_note,	currency, currency, loc_country, loc_org_code, custodian_type, security_expiry_date,
		legal_enforceability, legal_enforceability_date, security_perfection_date, cms_security_subtype_id, 
		cms_security_type_id, cms_security_subtype_id, source_security_type, source_security_sub_type,
		'ACTIVE', 'ARBS'
	   FROM si_temp_arbs_co010 t
	  WHERE cms_stg_col_id IS NULL 
	    AND t.is_valid = 'Y');
								 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	lock table cms_stage_security in share mode;
	UPDATE cms_stage_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co010
  				 WHERE a.sci_security_dtl_id = security_id
  				   AND a.cms_collateral_id = cms_stg_col_id
  				   AND is_valid = 'Y')
	AND security_sub_type_id IN ('GT400','GT402','GT405','GT406','GT407','GT408','GT409','GT410')
 	AND source_id = 'ARBS';

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 6);
	COMMIT;

	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_GUARANTEE
	--
	-------------------------------------
	lock table cms_stage_guarantee in share mode;
	UPDATE cms_stage_guarantee a SET(
		description, reference_no, guarantee_amt, currency_code, guarantee_date, issuing_bank,	issuing_confirm_date,
		insurance, auto_debit)=
	(SELECT 
		guarantees_desc, ref_no, guarantee_amt, sec.sci_security_currency, guarantee_date, issuing_bank, 
		issuing_confirmation_date, insurance, auto_debit
	  FROM cms_stage_security sec, si_temp_arbs_co010 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND a.cms_collateral_id = sec.cms_collateral_id 
	    AND a.cms_collateral_id = t.cms_stg_col_id
	    AND sec.cms_collateral_id = t.cms_stg_col_id
	    AND t.is_valid = 'Y'
	    AND source_id = 'ARBS')
	  WHERE EXISTS (SELECT '1' FROM cms_stage_security, si_temp_arbs_co010
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND a.cms_collateral_id = cms_stg_col_id
	    			   AND sci_security_dtl_id = security_id
	    			   AND cms_collateral_id = cms_stg_col_id
	    			   AND is_valid = 'Y'
	    			   AND source_id = 'ARBS');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 61);
	COMMIT;
	
	INSERT INTO cms_stage_guarantee(
		cms_collateral_id, description, reference_no, guarantee_amt, currency_code, guarantee_date, issuing_bank,
		issuing_confirm_date, insurance, auto_debit)
	(SELECT 
		sec.cms_collateral_id, guarantees_desc, ref_no, guarantee_amt, sec.sci_security_currency, guarantee_date,
		issuing_bank, issuing_confirmation_date, insurance, auto_debit
		from cms_stage_security sec, si_temp_arbs_co010 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS' 
	    AND t.is_valid = 'Y'
	    AND t.cms_stg_col_id IS NULL);
	    
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 7);
	COMMIT;
							
	----------------------------
	-- Begin Update
	-- cms_security_source
	--
	----------------------------
	lock table cms_security_source in share mode;
	UPDATE cms_security_source SET(cms_collateral_id, source_security_id, source_id, 
								   last_update_date, security_sub_type_id, interface_id,
									 status) =
	(SELECT cms_collateral_id, security_id, 'ARBS', current_timestamp, cms_security_subtype_id,
		'CO010',
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM cms_security sec, si_temp_arbs_co010 t 
	  WHERE sec.sci_security_dtl_id = security_id
	    AND sec.sci_security_dtl_id = source_security_id 
	    AND source_id = 'ARBS' 
	    AND is_valid = 'Y')
	 WHERE EXISTS (SELECT 1 FROM si_temp_arbs_co010
	 				WHERE source_security_id = security_id 
	 				  AND is_valid = 'Y')
	   AND source_id = 'ARBS';

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 71);
	COMMIT;
	
	----------------------------
	-- Begin Insertion
	-- cms_security_source
	--
	----------------------------
	INSERT INTO cms_security_source (cms_security_source_id, cms_collateral_id, source_security_id, source_id, 
									 status, last_update_date, security_sub_type_id, interface_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
			cms_collateral_id, security_id, 'ARBS', 'ACTIVE', CURRENT_TIMESTAMP, cms_security_subtype_id,
			'CO010'
	   FROM cms_security sec, si_temp_arbs_co010 t
	  WHERE NOT EXISTS (SELECT 1 FROM cms_security_source 
						 WHERE source_security_id = security_id 
						   AND source_id = 'ARBS') 
		AND is_valid = 'Y'
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 8);
	COMMIT;
	
	------------------------------------------
	-- START Update Collateral Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------	
	FOR cur_col_key AS
		SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
			FROM CMS_SECURITY a
		WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co010 t
							WHERE a.SCI_SECURITY_DTL_ID = t.SECURITY_ID		   	  
									AND t.is_valid = 'Y')
			AND a.SOURCE_ID = 'ARBS'	   
			
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
	END FOR;

	IF(upper(LOAD_TYPE)='FULL') THEN
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 9);
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
			WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'GT'
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co010
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 91);
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
		WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'GT'
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co010
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y')
				AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
											WHERE reference_id IN (SELECT cms_collateral_id 
																		FROM cms_security b
																		WHERE a.SCI_SECURITY_DTL_ID = b.sci_security_dtl_id
																			AND b.source_id = 'ARBS')
												AND transaction_type = 'COL');
	
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 10);
		commit;
		
		------------------------------------
		-- Tag DELETED for non-exist records
		-- cms_security_source
		--
		------------------------------------
		lock table cms_security_source in share mode;
		UPDATE cms_security_source SET(STATUS, last_update_date) =
		('DELETED', current_timestamp)
		WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
			AND security_sub_type_id = 'GT'
			AND NOT EXISTS (SELECT 1 FROM si_temp_arbs_co010
						WHERE source_security_id = security_id 
							AND is_valid = 'Y');
	END IF;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO010', 'ARBS', 0);
	
END@


CREATE PROCEDURE SI_RUN_TEMP_ARBS_CO011(IN LOAD_TYPE VARCHAR(255))
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO011', 'ARBS', 1);
	commit;
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT LOC_ORG_CODE code, LOC_ORG_DESC desc,
			   LOC_ORG_CAT cat, 'ARBS' source_id
		  FROM si_temp_arbs_co011
		 WHERE LENGTH(LOC_ORG_CODE) > 0
		   AND LENGTH(LOC_ORG_DESC) > 0
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;

	--------------------------------------------
	-- Update security type and subtype id first
	-- si_temp_arbs_co011
	-- @refer si_host_col_code_map
	--
	--------------------------------------------

	UPDATE si_temp_arbs_co011 a 
	   SET (cms_security_type_id, cms_security_subtype_id) =
	(SELECT security_type_id, security_sub_type_id
	   FROM si_host_col_code_map
	  WHERE host_col_code = a.source_security_sub_type);
		
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_security a SET (	
		SCI_SECURITY_DTL_ID,
		SCI_REFERENCE_NOTE,
		SCI_SECURITY_CURRENCY,
		SECURITY_LOCATION,
		SECURITY_ORGANISATION,
		CUSTODIAN_TYPE,
		security_sub_type_id, 
		sci_security_type_value, 
		SCI_SECURITY_SUBTYPE_VALUE, 
		source_security_type,
		source_security_sub_type,
		status) =
	(SELECT
		SECURITY_ID,
		SECURITY_REF_NOTE,
		CURRENCY,
		LOC_COUNTRY,
		LOC_ORG_CODE,
		CUSTODIAN_TYPE,
		cms_security_subtype_id, 
		cms_security_type_id, 
		cms_security_subtype_id,
		SOURCE_SECURITY_TYPE,
		SOURCE_SECURITY_SUB_TYPE,
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co011 t
	  WHERE t.SECURITY_ID = a.sci_security_dtl_id 
	    AND a.source_security_type = source_security_type
	    AND a.source_security_sub_type = source_security_sub_type 
	   AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co011
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND a.source_security_type = source_security_type
					   AND a.source_security_sub_type = source_security_sub_type 
	  				   AND is_valid = 'Y')
	  	AND security_sub_type_id = 'OT900'
	  	AND source_id = 'ARBS';

	INSERT INTO cms_security (
		cms_collateral_id, 
		sci_security_dtl_id,
		sci_reference_note,
		sci_security_currency,
		sci_orig_security_currency,
		security_location,
		security_organisation,
		custodian_type,
		security_sub_type_id, 
		sci_security_type_value, 
		sci_security_subtype_value, 
		source_security_type,
		source_security_sub_type,
		status,
		source_id,
		is_migrated_ind)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
		security_id,
		security_ref_note,
		currency,
		currency,
		loc_country,
		loc_org_code,
		custodian_type,
		cms_security_subtype_id, 
		cms_security_type_id, 
		cms_security_subtype_id,
		source_security_type,
		source_security_sub_type,
		'ACTIVE',
		'ARBS',
		'N'
	   FROM si_temp_arbs_co011 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_security t
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS') AND is_valid = 'Y');
	  	
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND type_name IS NULL;
	 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_stage_security a SET (
		sci_security_dtl_id,
		sci_reference_note,
		sci_security_currency,
		security_location,
		security_organisation,
		custodian_type,
		security_sub_type_id, 
		sci_security_type_value, 
		sci_security_subtype_value, 
		source_security_type,
		source_security_sub_type,
		status) =
	(SELECT
		security_id,
		security_ref_note,
		currency,
		loc_country,
		loc_org_code,
		custodian_type,
		cms_security_subtype_id, 
		cms_security_type_id, 
		cms_security_subtype_id,
		source_security_type,
		source_security_sub_type,
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co011 t
	  WHERE t.security_id = a.sci_security_dtl_id 
	    AND a.source_security_type = source_security_type
		AND a.source_security_sub_type = source_security_sub_type 
	  	AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co011
	  				 WHERE a.sci_security_dtl_id = security_id
					   AND a.source_security_type = source_security_type
					   AND a.source_security_sub_type = source_security_sub_type 
	  				   AND is_valid = 'Y')
	  	AND source_id = 'ARBS'
	  	AND security_sub_type_id = 'OT900'
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security, si_temp_arbs_co011
	  							   						   WHERE security_id = sci_security_dtl_id
	  							   						     AND source_id = 'ARBS' AND is_valid = 'Y')
	  							   	 AND transaction_type = 'COL');

	INSERT INTO cms_stage_security (
		cms_collateral_id, 
		SCI_SECURITY_DTL_ID,
		SCI_REFERENCE_NOTE,
		SCI_SECURITY_CURRENCY,
		SCI_ORIG_SECURITY_CURRENCY,
		SECURITY_LOCATION,
		SECURITY_ORGANISATION,
		CUSTODIAN_TYPE,
		security_sub_type_id, 
		sci_security_type_value, 
		SCI_SECURITY_SUBTYPE_VALUE, 
		source_security_type,
		source_security_sub_type,
		status,
		source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
		SECURITY_ID,
		SECURITY_REF_NOTE,
		CURRENCY,
		CURRENCY,
		LOC_COUNTRY,
		LOC_ORG_CODE,
		CUSTODIAN_TYPE,
		cms_security_subtype_id, 
		cms_security_type_id, 
		cms_security_subtype_id,
		SOURCE_SECURITY_TYPE,
		SOURCE_SECURITY_SUB_TYPE,
		'ACTIVE',
		'ARBS'
	   FROM si_temp_arbs_co011 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_stage_security t
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS') AND t.is_valid = 'Y');
								 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_stage_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND TYPE_NAME IS NULL;

	-------------------------------------
	-- Actual Table
	-- CMS_OTHERS
	--
	-------------------------------------
	
	update cms_others a set(
		DESCRIPTION_OTHERS, 
		INS_IND,
		AT_DB_COLLATERAL_FEE,
		COLLATERAL_MSG,
		CASH_VALUE
	)=
	(select 
		DESC,
		INSURANCE_IND,
		AUTO_DEBIT_COLLATERAL_FEE,
		COLLATERAL_MESSAGE,
		CASH_VALUE
		from cms_security sec, si_temp_arbs_co011 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND a.cms_collateral_id = sec.cms_collateral_id
			AND sec.source_id = 'ARBS' AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM cms_security, si_temp_arbs_co011
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND security_id = sci_security_dtl_id
	    			   AND source_id = 'ARBS' AND is_valid = 'Y');
							 
	insert into cms_others(
		CMS_COLLATERAL_ID,
		DESCRIPTION_OTHERS, 
		INS_IND,
		AT_DB_COLLATERAL_FEE,
		COLLATERAL_MSG,
		CASH_VALUE,
		ENV_RISKY_STATUS)
	(select 
		sec.CMS_COLLATERAL_ID,
		DESC,
		INSURANCE_IND,
		AUTO_DEBIT_COLLATERAL_FEE,
		COLLATERAL_MESSAGE,
		CASH_VALUE,
		'N'
		from cms_security sec, si_temp_arbs_co011 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS' AND t.is_valid = 'Y'
	    AND NOT EXISTS (SELECT '1' FROM cms_others
	    				 WHERE cms_collateral_id = sec.cms_collateral_id));

	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_OTHERS
	--
	-------------------------------------

	update cms_stage_others a set(
		DESCRIPTION_OTHERS, 
		INS_IND,
		AT_DB_COLLATERAL_FEE,
		COLLATERAL_MSG,
		CASH_VALUE)=
	(select 
		DESC,
		INSURANCE_IND,
		AUTO_DEBIT_COLLATERAL_FEE,
		COLLATERAL_MESSAGE,
		CASH_VALUE
	  FROM cms_stage_security sec, si_temp_arbs_co011 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND a.cms_collateral_id = sec.cms_collateral_id AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM cms_stage_security, si_temp_arbs_co011
	    			 WHERE a.cms_collateral_id = cms_collateral_id
	    			   AND security_id = sci_security_dtl_id
	    			   AND source_id = 'ARBS' AND is_valid = 'Y')
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security, si_temp_arbs_co011
	  							   						   WHERE security_id = sci_security_dtl_id
	  							   						     AND source_id = 'ARBS' AND is_valid = 'Y')
	  							   	 AND transaction_type = 'COL');
							 
	insert into cms_stage_others(
		CMS_COLLATERAL_ID,
		DESCRIPTION_OTHERS, 
		INS_IND,
		AT_DB_COLLATERAL_FEE,
		COLLATERAL_MSG,
		CASH_VALUE,
		ENV_RISKY_STATUS)
	(select 
		sec.CMS_COLLATERAL_ID,
		DESC,
		INSURANCE_IND,
		AUTO_DEBIT_COLLATERAL_FEE,
		COLLATERAL_MESSAGE,
		CASH_VALUE,
		'N'
		from cms_stage_security sec, si_temp_arbs_co011 t
	  WHERE sec.sci_security_dtl_id = t.security_id
	    AND source_id = 'ARBS' AND t.is_valid = 'Y'
	    AND NOT EXISTS (SELECT '1' FROM cms_stage_others
	    				 WHERE cms_collateral_id = sec.cms_collateral_id));
							
	----------------------------
	-- Begin Update
	-- cms_security_source
	--
	----------------------------
	UPDATE cms_security_source SET(cms_collateral_id, source_security_id, source_id, 
								   last_update_date, security_sub_type_id, interface_id,
									 status) =
	(SELECT cms_collateral_id, security_id, 'ARBS', current_timestamp, cms_security_subtype_id,
		'CO011',
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM cms_security sec, si_temp_arbs_co011 t 
	  WHERE sec.sci_security_dtl_id = security_id
	    AND sec.sci_security_dtl_id = source_security_id 
	    AND source_id = 'ARBS' 
	    AND is_valid = 'Y')
	 WHERE EXISTS (SELECT 1 FROM si_temp_arbs_co011
	 				WHERE source_security_id = security_id 
	 				  AND is_valid = 'Y')
	   AND source_id = 'ARBS';
		
	----------------------------
	-- Begin Insertion
	-- cms_security_source
	--
	----------------------------
	INSERT INTO cms_security_source (cms_security_source_id, cms_collateral_id, source_security_id, source_id, 
									 status, last_update_date, security_sub_type_id, interface_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
			cms_collateral_id, security_id, 'ARBS', 'ACTIVE', CURRENT_TIMESTAMP, cms_security_subtype_id,
			'CO011'
	   FROM cms_security sec, si_temp_arbs_co011 t
	  WHERE NOT EXISTS (SELECT 1 FROM cms_security_source 
						 WHERE source_security_id = security_id 
						   AND source_id = 'ARBS') 
		AND is_valid = 'Y'
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO011', 'ARBS', 2);
	COMMIT;
	------------------------------------------
	-- START Update Collateral Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------	
	FOR cur_col_key AS
		SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
			FROM CMS_SECURITY a
		WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co011 t
							WHERE a.SCI_SECURITY_DTL_ID = t.SECURITY_ID		   	  
									AND t.is_valid = 'Y')
			AND a.SOURCE_ID = 'ARBS'	   
			
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
	END FOR;

	IF(upper(LOAD_TYPE)='FULL') THEN
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO011', 'ARBS', 3);
		COMMIT;
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Actual Table
		-- CMS_SECURITY
		--
		-------------------------------------
		UPDATE cms_security a SET (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
			WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'OT'
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co011
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y');
		
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Staging Table
		-- CMS_STAGE_SECURITY
		--
		-------------------------------------
		UPDATE cms_stage_security a set (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
		WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'OT'
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co011
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y')
				AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
											WHERE reference_id IN (SELECT cms_collateral_id 
																		FROM cms_security b
																		WHERE a.SCI_SECURITY_DTL_ID = b.sci_security_dtl_id
																			AND b.source_id = 'ARBS')
												AND transaction_type = 'COL');
	
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO011', 'ARBS', 4);
		commit;
		
		------------------------------------
		-- Tag DELETED for non-exist records
		-- cms_security_source
		--
		------------------------------------
		UPDATE cms_security_source SET(STATUS, last_update_date) =
		('DELETED', current_timestamp)
		WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
			AND security_sub_type_id = 'OT'
			AND NOT EXISTS (SELECT 1 FROM si_temp_arbs_co011
						WHERE source_security_id = security_id 
							AND is_valid = 'Y');
	END IF;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO011', 'ARBS', 0);
	
END@

CREATE PROCEDURE SI_RUN_TEMP_ARBS_CO012(IN LOAD_TYPE VARCHAR(255))
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO012', 'ARBS', 1);
	commit;
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT LOC_ORG_CODE code, LOC_ORG_DESC desc,
			   LOC_ORG_CAT cat, 'ARBS' source_id
		  FROM si_temp_arbs_co012
		 WHERE LENGTH(LOC_ORG_CODE) > 0
		   AND LENGTH(LOC_ORG_DESC) > 0
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;

	--------------------------------------------
	-- Update security type and subtype id first
	-- si_temp_arbs_co012
	-- @refer si_host_col_code_map
	--
	--------------------------------------------

	UPDATE si_temp_arbs_co012 a 
	   SET (cms_security_type_id, cms_security_subtype_id) =
	(SELECT security_type_id, security_sub_type_id
	   FROM si_host_col_code_map
	  WHERE host_col_code = a.source_security_sub_type);
		

	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_security a SET (	
		sci_security_dtl_id,
		sci_reference_note,
		sci_security_currency,
		security_location,
		security_organisation,
		custodian_type,
		security_maturity_date,
		security_sub_type_id, 
		sci_security_type_value, 
		sci_security_subtype_value, 
		source_security_type,
		source_security_sub_type,
		status) =
	(SELECT
		security_id,
		security_ref_note,
		currency,
		loc_country,
		loc_org_code,
		custodian_type,
		security_expiry_date,
		cms_security_subtype_id, 
		cms_security_type_id, 
		cms_security_subtype_id,
		source_security_type,
		source_security_sub_type,
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co012 t
	  WHERE t.security_id = a.sci_security_dtl_id 
	    AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co012
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND is_valid = 'Y')
		AND security_sub_type_id IN ('IN500', 'IN501', 'IN502', 'IN503')	  				   
	  	AND source_id = 'ARBS';

	INSERT INTO cms_security (
		cms_collateral_id, 
		SCI_SECURITY_DTL_ID,
		SCI_REFERENCE_NOTE,
		SCI_SECURITY_CURRENCY,
		SCI_ORIG_SECURITY_CURRENCY,
		SECURITY_LOCATION,
		SECURITY_ORGANISATION,
		CUSTODIAN_TYPE,
		SECURITY_MATURITY_DATE,
		security_sub_type_id, 
		sci_security_type_value, 
		SCI_SECURITY_SUBTYPE_VALUE, 
		source_security_type,
		source_security_sub_type,
		status,
		source_id,
		is_migrated_ind)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
		SECURITY_ID,
		SECURITY_REF_NOTE,
		CURRENCY,
		CURRENCY,
		LOC_COUNTRY,
		LOC_ORG_CODE,
		CUSTODIAN_TYPE,
		SECURITY_EXPIRY_DATE,
		cms_security_subtype_id, 
		cms_security_type_id, 
		cms_security_subtype_id,
		SOURCE_SECURITY_TYPE,
		SOURCE_SECURITY_SUB_TYPE,
		'ACTIVE',
		'ARBS',
		'N'
	   FROM si_temp_arbs_co012 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_security t
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS') AND t.is_valid = 'Y');
	  	
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND type_name IS NULL;
	 
	-------------------------------------
	-- Actual Table
	-- CMS_INSURANCE
	-- 
	-------------------------------------
	 
	INSERT INTO cms_insurance (cms_collateral_id)
	(SELECT cms_collateral_id
	   FROM cms_security sec, si_temp_arbs_co012 t
	  WHERE sci_security_dtl_id = t.security_id
	    AND is_valid = 'Y'
	    AND source_id = 'ARBS'
	  	AND NOT EXISTS (SELECT 1 FROM cms_insurance
	  					 WHERE cms_collateral_id = sec.cms_collateral_id));
	 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_stage_security a SET (
		sci_security_dtl_id,
		sci_reference_note,
		sci_security_currency,
		security_location,
		security_organisation,
		custodian_type,
		security_maturity_date,
		security_sub_type_id, 
		sci_security_type_value, 
		sci_security_subtype_value, 
		source_security_type,
		source_security_sub_type,
		status) =
	(SELECT
		security_id,
		security_ref_note,
		currency,
		loc_country,
		loc_org_code,
		custodian_type,
		security_expiry_date,
		cms_security_subtype_id, 
		cms_security_type_id, 
		cms_security_subtype_id,
		source_security_type,
		source_security_sub_type,
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co012 t
	  WHERE t.security_id = a.sci_security_dtl_id 
	    AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co012
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND is_valid = 'Y')
		AND security_sub_type_id IN ('IN500', 'IN501', 'IN502', 'IN503')	  				   
	  	AND source_id = 'ARBS'
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security, si_temp_arbs_co012
	  							   						   WHERE security_id = sci_security_dtl_id
	  							   						     AND source_id = 'ARBS' AND is_valid = 'Y')
	  							   	 AND transaction_type = 'COL');

	INSERT INTO cms_stage_security (
		cms_collateral_id, 
		SCI_SECURITY_DTL_ID,
		SCI_REFERENCE_NOTE,
		SCI_SECURITY_CURRENCY,
		SCI_ORIG_SECURITY_CURRENCY,
		SECURITY_LOCATION,
		SECURITY_ORGANISATION,
		CUSTODIAN_TYPE,
		SECURITY_MATURITY_DATE,
		security_sub_type_id, 
		sci_security_type_value, 
		SCI_SECURITY_SUBTYPE_VALUE, 
		source_security_type,
		source_security_sub_type,
		status,
		source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
		SECURITY_ID,
		SECURITY_REF_NOTE,
		CURRENCY,
		CURRENCY,
		LOC_COUNTRY,
		LOC_ORG_CODE,
		CUSTODIAN_TYPE,
		SECURITY_EXPIRY_DATE,
		cms_security_subtype_id, 
		cms_security_type_id, 
		cms_security_subtype_id,
		SOURCE_SECURITY_TYPE,
		SOURCE_SECURITY_SUB_TYPE,
		'ACTIVE',
		'ARBS'
	   FROM si_temp_arbs_co012 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_stage_security t
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS') AND t.is_valid = 'Y');
	  					   
	-------------------------------------
	-- Staging Table
	-- CMS_INSURANCE
	-- 
	-------------------------------------
	 
	INSERT INTO cms_stage_insurance (cms_collateral_id)
	(SELECT cms_collateral_id
	   FROM cms_stage_security sec, si_temp_arbs_co012 t
	  WHERE sci_security_dtl_id = t.security_id
	    AND is_valid = 'Y'
	    AND source_id = 'ARBS'
	  	AND NOT EXISTS (SELECT 1 FROM cms_stage_insurance
	  					 WHERE cms_collateral_id = sec.cms_collateral_id));
								 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_stage_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND TYPE_NAME IS NULL;
							
	----------------------------
	-- Begin Update
	-- cms_security_source
	--
	----------------------------
	UPDATE cms_security_source SET(cms_collateral_id, source_security_id, source_id, 
								   last_update_date, security_sub_type_id, interface_id,
									 status) =
	(SELECT cms_collateral_id, security_id, 'ARBS', current_timestamp, cms_security_subtype_id,
		'CO012',
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM cms_security sec, si_temp_arbs_co012 t 
	  WHERE sec.sci_security_dtl_id = security_id
	    AND sec.sci_security_dtl_id = source_security_id 
	    AND source_id = 'ARBS' 
	    AND is_valid = 'Y')
	 WHERE EXISTS (SELECT 1 FROM si_temp_arbs_co012
	 				WHERE source_security_id = security_id 
	 				  AND is_valid = 'Y')
	   AND source_id = 'ARBS';
		
	----------------------------
	-- Begin Insertion
	-- cms_security_source
	--
	----------------------------
	INSERT INTO cms_security_source (cms_security_source_id, cms_collateral_id, source_security_id, source_id, 
									 status, last_update_date, security_sub_type_id, interface_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
			cms_collateral_id, security_id, 'ARBS', 'ACTIVE', CURRENT_TIMESTAMP, cms_security_subtype_id, 
			'CO012'
	   FROM cms_security sec, si_temp_arbs_co012 t
	  WHERE NOT EXISTS (SELECT 1 FROM cms_security_source 
						 WHERE source_security_id = security_id 
						   AND source_id = 'ARBS') 
		AND is_valid = 'Y'
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO012', 'ARBS', 2);
	COMMIT;
	
	------------------------------------------
	-- START Update Collateral Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------	
	FOR cur_col_key AS
		SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
			FROM CMS_SECURITY a
		WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co012 t
							WHERE a.SCI_SECURITY_DTL_ID = t.SECURITY_ID		   	  
									AND t.is_valid = 'Y')
			AND a.SOURCE_ID = 'ARBS'	   
			
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
	END FOR;

	IF(upper(LOAD_TYPE)='FULL') THEN
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO012', 'ARBS', 3);
		COMMIT;
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Actual Table
		-- CMS_SECURITY
		--
		-------------------------------------
		UPDATE cms_security a SET (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
			WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'IN'
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co012
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y');
		
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Staging Table
		-- CMS_STAGE_SECURITY
		--
		-------------------------------------
		UPDATE cms_stage_security a set (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
		WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'IN'
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co012
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y')
				AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
											WHERE reference_id IN (SELECT cms_collateral_id 
																		FROM cms_security b
																		WHERE a.SCI_SECURITY_DTL_ID = b.sci_security_dtl_id
																			AND b.source_id = 'ARBS')
												AND transaction_type = 'COL');
	
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO012', 'ARBS', 4);
		commit;
		
		------------------------------------
		-- Tag DELETED for non-exist records
		-- cms_security_source
		--
		------------------------------------
		UPDATE cms_security_source SET(STATUS, last_update_date) =
		('DELETED', current_timestamp)
		WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
			AND security_sub_type_id = 'IN'
			AND NOT EXISTS (SELECT 1 FROM si_temp_arbs_co012
						WHERE source_security_id = security_id 
							AND is_valid = 'Y');
	END IF;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO012', 'ARBS', 0);
	
END@


CREATE PROCEDURE SI_RUN_TEMP_ARBS_CO013(IN LOAD_TYPE VARCHAR(255))
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO013', 'ARBS', 1);
	commit;
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT LOC_ORG_CODE code, LOC_ORG_DESC desc,
			   LOC_ORG_CAT cat, 'ARBS' source_id
		  FROM si_temp_arbs_co013
		 WHERE LENGTH(LOC_ORG_CODE) > 0
		   AND LENGTH(LOC_ORG_DESC) > 0
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;

	--------------------------------------------
	-- Update security type and subtype id first
	-- si_temp_arbs_co013
	-- @refer si_host_col_code_map
	--
	--------------------------------------------

	UPDATE si_temp_arbs_co013 a 
	   SET (cms_security_type_id, cms_security_subtype_id) =
	(SELECT security_type_id, security_sub_type_id
	   FROM si_host_col_code_map
	  WHERE host_col_code = a.source_security_sub_type);

	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_security a SET (	
		SCI_SECURITY_DTL_ID,
		SCI_REFERENCE_NOTE,
		SCI_SECURITY_CURRENCY,
		SECURITY_LOCATION,
		SECURITY_ORGANISATION,
		CUSTODIAN_TYPE,
		SECURITY_MATURITY_DATE,
		IS_LEGAL_ENFORCE,
		IS_LEGAL_ENFORCE_DATE,
		SECURITY_PERFECTION_DATE, 
		security_sub_type_id, 
		sci_security_type_value, 
		SCI_SECURITY_SUBTYPE_VALUE, 
		source_security_type,
		source_security_sub_type,
		status) =
	(SELECT
		SECURITY_ID,
		SECURITY_REF_NOTE,
		CURRENCY,
		LOC_COUNTRY,
		LOC_ORG_CODE,
		CUSTODIAN_TYPE,
		SECURITY_EXPIRY_DATE,
		LEGAL_ENFORCEABILITY,
		LEGAL_ENFORCEABILITY_DATE,
		SECURITY_PERFECTION_DATE,
		cms_security_subtype_id, 
		cms_security_type_id, 
		cms_security_subtype_id,
		SOURCE_SECURITY_TYPE,
		SOURCE_SECURITY_SUB_TYPE,
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co013 t
	  WHERE t.SECURITY_ID = a.sci_security_dtl_id 
	    AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co013
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND is_valid = 'Y')
		AND security_sub_type_id IN ('DC300','DC301','DC302','DC303','DC304','DC305','DC306','DC307','DC308')
	  	AND source_id = 'ARBS';

	INSERT INTO cms_security (
		cms_collateral_id, 
		SCI_SECURITY_DTL_ID,
		SCI_REFERENCE_NOTE,
		SCI_SECURITY_CURRENCY,
		SCI_ORIG_SECURITY_CURRENCY,
		SECURITY_LOCATION,
		SECURITY_ORGANISATION,
		CUSTODIAN_TYPE,
		SECURITY_MATURITY_DATE,
		IS_LEGAL_ENFORCE,
		IS_LEGAL_ENFORCE_DATE,
		SECURITY_PERFECTION_DATE, 
		security_sub_type_id, 
		sci_security_type_value, 
		SCI_SECURITY_SUBTYPE_VALUE, 
		source_security_type,
		source_security_sub_type,
		status,
		source_id,
		is_migrated_ind)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
		SECURITY_ID,
		SECURITY_REF_NOTE,
		CURRENCY,
		CURRENCY,
		LOC_COUNTRY,
		LOC_ORG_CODE,
		CUSTODIAN_TYPE,
		SECURITY_EXPIRY_DATE,
		LEGAL_ENFORCEABILITY,
		LEGAL_ENFORCEABILITY_DATE,
		SECURITY_PERFECTION_DATE,
		cms_security_subtype_id, 
		cms_security_type_id, 
		cms_security_subtype_id,
		SOURCE_SECURITY_TYPE,
		SOURCE_SECURITY_SUB_TYPE,
		'ACTIVE',
		'ARBS',
		'N'
	   FROM si_temp_arbs_co013 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_security t
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS') AND t.is_valid = 'Y');
	  					   
	-------------------------------------
	-- Actual Table
	-- CMS_DOCUMENT
	-- 
	-------------------------------------
	 
	INSERT INTO cms_document (cms_collateral_id)
	(SELECT cms_collateral_id
	   FROM cms_security sec, si_temp_arbs_co013 t
	  WHERE sci_security_dtl_id = t.security_id
	    AND is_valid = 'Y'
	    AND source_id = 'ARBS'
	  	AND NOT EXISTS (SELECT 1 FROM cms_document
	  					 WHERE cms_collateral_id = sec.cms_collateral_id));	
	  	
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND type_name IS NULL;
	 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------
	
	UPDATE cms_stage_security a SET (
		SCI_SECURITY_DTL_ID,
		SCI_REFERENCE_NOTE,
		SCI_SECURITY_CURRENCY,
		SECURITY_LOCATION,
		SECURITY_ORGANISATION,
		CUSTODIAN_TYPE,
		SECURITY_MATURITY_DATE,
		IS_LEGAL_ENFORCE,
		IS_LEGAL_ENFORCE_DATE,
		SECURITY_PERFECTION_DATE, 
		security_sub_type_id, 
		sci_security_type_value, 
		SCI_SECURITY_SUBTYPE_VALUE, 
		source_security_type,
		source_security_sub_type,
		status) =
	(SELECT
		SECURITY_ID,
		SECURITY_REF_NOTE,
		CURRENCY,
		LOC_COUNTRY,
		LOC_ORG_CODE,
		CUSTODIAN_TYPE,
		SECURITY_EXPIRY_DATE,
		LEGAL_ENFORCEABILITY,
		LEGAL_ENFORCEABILITY_DATE,
		SECURITY_PERFECTION_DATE,
		cms_security_subtype_id, 
		cms_security_type_id, 
		cms_security_subtype_id,
		SOURCE_SECURITY_TYPE,
		SOURCE_SECURITY_SUB_TYPE,
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co013 t
	  WHERE t.security_id = a.sci_security_dtl_id 
	    AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co013
	  				 WHERE a.sci_security_dtl_id = security_id
	  				   AND is_valid = 'Y')
	  	AND source_id = 'ARBS'
	  	AND security_sub_type_id IN ('DC300','DC301','DC302','DC303','DC304','DC305','DC306','DC307','DC308')
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security, si_temp_arbs_co013
	  							   						   WHERE security_id = sci_security_dtl_id
	  							   						     AND source_id = 'ARBS' AND is_valid = 'Y')
	  							   	 AND transaction_type = 'COL');

	INSERT INTO cms_stage_security (
		cms_collateral_id, 
		SCI_SECURITY_DTL_ID,
		SCI_REFERENCE_NOTE,
		SCI_SECURITY_CURRENCY,
		SCI_ORIG_SECURITY_CURRENCY,
		SECURITY_LOCATION,
		SECURITY_ORGANISATION,
		CUSTODIAN_TYPE,
		SECURITY_MATURITY_DATE,
		IS_LEGAL_ENFORCE,
		IS_LEGAL_ENFORCE_DATE,
		SECURITY_PERFECTION_DATE, 
		security_sub_type_id, 
		sci_security_type_value, 
		SCI_SECURITY_SUBTYPE_VALUE, 
		source_security_type,
		source_security_sub_type,
		status,
		source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
		SECURITY_ID,
		SECURITY_REF_NOTE,
		CURRENCY,
		CURRENCY,
		LOC_COUNTRY,
		LOC_ORG_CODE,
		CUSTODIAN_TYPE,
		SECURITY_EXPIRY_DATE,
		LEGAL_ENFORCEABILITY,
		LEGAL_ENFORCEABILITY_DATE,
		SECURITY_PERFECTION_DATE,
		cms_security_subtype_id, 
		cms_security_type_id, 
		cms_security_subtype_id,
		SOURCE_SECURITY_TYPE,
		SOURCE_SECURITY_SUB_TYPE,
		'ACTIVE',
		'ARBS'
	   FROM si_temp_arbs_co013 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_stage_security t
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS') AND t.is_valid = 'Y');
	  					   
	-------------------------------------
	-- Actual Table
	-- CMS_STAGE_DOCUMENT
	-- 
	-------------------------------------
	 
	INSERT INTO cms_stage_document (cms_collateral_id)
	(SELECT cms_collateral_id
	   FROM cms_stage_security sec, si_temp_arbs_co013 t
	  WHERE sci_security_dtl_id = t.security_id
	    AND is_valid = 'Y'
	    AND source_id = 'ARBS'
	  	AND NOT EXISTS (SELECT 1 FROM cms_stage_document
	  					 WHERE cms_collateral_id = sec.cms_collateral_id));	
								 
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	
	UPDATE cms_stage_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND TYPE_NAME IS NULL;
							
	----------------------------
	-- Begin Update
	-- cms_security_source
	--
	----------------------------
	UPDATE cms_security_source SET(cms_collateral_id, source_security_id, source_id, 
								   last_update_date, security_sub_type_id, 
									 interface_id,
									 status) =
	(SELECT cms_collateral_id, security_id, 'ARBS', current_timestamp, cms_security_subtype_id,
			'CO013',
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM cms_security sec, si_temp_arbs_co013 t 
	  WHERE sec.sci_security_dtl_id = security_id
	    AND sec.sci_security_dtl_id = source_security_id 
	    AND source_id = 'ARBS' 
	    AND is_valid = 'Y')
	 WHERE EXISTS (SELECT 1 FROM si_temp_arbs_co013
	 				WHERE source_security_id = security_id 
	 				  AND is_valid = 'Y')
	   AND source_id = 'ARBS';
		
	----------------------------
	-- Begin Insertion
	-- cms_security_source
	--
	----------------------------
	INSERT INTO cms_security_source (cms_security_source_id, cms_collateral_id, source_security_id, source_id, 
									 status, last_update_date, security_sub_type_id, interface_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
			cms_collateral_id, security_id, 'ARBS', 'ACTIVE', CURRENT_TIMESTAMP, cms_security_subtype_id,
			'CO013'
	   FROM cms_security sec, si_temp_arbs_co013 t
	  WHERE NOT EXISTS (SELECT 1 FROM cms_security_source 
						 WHERE source_security_id = security_id 
						   AND source_id = 'ARBS') 
		AND is_valid = 'Y'
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO013', 'ARBS', 2);
	COMMIT;
	
	------------------------------------------
	-- START Update Collateral Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------	
	FOR cur_col_key AS
		SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
			FROM CMS_SECURITY a
		WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co013 t
							WHERE a.SCI_SECURITY_DTL_ID = t.SECURITY_ID		   	  
									AND t.is_valid = 'Y')
			AND a.SOURCE_ID = 'ARBS'	   
			
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
	END FOR;

	IF(upper(LOAD_TYPE)='FULL') THEN
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO013', 'ARBS', 3);
		COMMIT;
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Actual Table
		-- CMS_SECURITY
		--
		-------------------------------------
		UPDATE cms_security a SET (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
			WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'DC'
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co013
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y');
		
		-------------------------------------
		-- Tag DELETED for non-exist records
		-- Staging Table
		-- CMS_STAGE_SECURITY
		--
		-------------------------------------
		UPDATE cms_stage_security a set (DELETED_DATE, status) =
		(current_timestamp, 'DELETED')
		WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'DC'
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co013
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y')
				AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
											WHERE reference_id IN (SELECT cms_collateral_id 
																		FROM cms_security b
																		WHERE a.SCI_SECURITY_DTL_ID = b.sci_security_dtl_id
																			AND b.source_id = 'ARBS')
												AND transaction_type = 'COL');
	
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO013', 'ARBS', 4);
		commit;
		
		------------------------------------
		-- Tag DELETED for non-exist records
		-- cms_security_source
		--
		------------------------------------
		UPDATE cms_security_source SET(STATUS, last_update_date) =
		('DELETED', current_timestamp)
		WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
			AND security_sub_type_id = 'DC'
			AND NOT EXISTS (SELECT 1 FROM si_temp_arbs_co013
						WHERE source_security_id = security_id 
							AND is_valid = 'Y');
	END IF;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO013', 'ARBS', 0);
	
END@


CREATE PROCEDURE SI_RUN_TEMP_ARBS_CO014(IN LOAD_TYPE VARCHAR(255))
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO014', 'ARBS', 1);
	commit;
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT LOC_ORG_CODE code, LOC_ORG_DESC desc,
			   LOC_ORG_CAT cat, 'ARBS' source_id
		  FROM si_temp_arbs_co014
		 WHERE LENGTH(LOC_ORG_CODE) > 0
		   AND LENGTH(LOC_ORG_DESC) > 0
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;

	--------------------------------------------
	-- Update security type and subtype id first
	-- si_temp_arbs_co014
	-- @refer si_host_col_code_map
	--
	--------------------------------------------

	UPDATE si_temp_arbs_co014 a 
	   SET (cms_security_type_id, cms_security_subtype_id) =
	(SELECT security_type_id, security_sub_type_id
	   FROM si_host_col_code_map
	  WHERE host_col_code = a.source_security_sub_type);
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO014', 'ARBS', 2);
	commit;
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	--
	-------------------------------------
	lock table cms_security in share mode;
	UPDATE cms_security a SET (	
		SCI_SECURITY_DTL_ID,
		SCI_REFERENCE_NOTE,
		SCI_SECURITY_CURRENCY,
		SECURITY_LOCATION,
		SECURITY_ORGANISATION,
		security_sub_type_id, 
		sci_security_type_value, 
		SCI_SECURITY_SUBTYPE_VALUE, 
		source_security_type,
		source_security_sub_type,
		status) =
	(SELECT
		SECURITY_ID,
		SECURITY_REF_NOTE,
		CURRENCY,
		LOC_COUNTRY,
		LOC_ORG_CODE,
		cms_security_subtype_id, 
		cms_security_type_id, 
		cms_security_subtype_id,
		SOURCE_SECURITY_TYPE,
		SOURCE_SECURITY_SUB_TYPE,
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co014 t
	  WHERE t.SECURITY_ID = a.sci_security_dtl_id AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co014 t
	  				 WHERE a.sci_security_dtl_id = t.security_id
	  				   AND source_id = 'ARBS' AND t.is_valid = 'Y')
		AND security_sub_type_id = 'CL001'
	  	AND source_id = 'ARBS';

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO014', 'ARBS', 3);
	commit;
	
	INSERT INTO cms_security (
		cms_collateral_id, 
		SCI_SECURITY_DTL_ID,
		SCI_REFERENCE_NOTE,
		SCI_SECURITY_CURRENCY,
		SCI_ORIG_SECURITY_CURRENCY,
		SECURITY_LOCATION,
		SECURITY_ORGANISATION,
		security_sub_type_id, 
		sci_security_type_value, 
		SCI_SECURITY_SUBTYPE_VALUE, 
		source_security_type,
		source_security_sub_type,
		status,
		source_id,
		is_migrated_ind)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
		SECURITY_ID,
		SECURITY_REF_NOTE,
		CURRENCY,
		CURRENCY,
		LOC_COUNTRY,
		LOC_ORG_CODE,
		cms_security_subtype_id, 
		cms_security_type_id, 
		cms_security_subtype_id,
		SOURCE_SECURITY_TYPE,
		SOURCE_SECURITY_SUB_TYPE,
		'ACTIVE',
		'ARBS',
		'N'
	   FROM si_temp_arbs_co014 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_security t
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS') AND t.is_valid = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO014', 'ARBS', 4);
	commit;
	-------------------------------------
	-- Actual Table
	-- CMS_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	lock table cms_security in share mode;
	UPDATE cms_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND type_name IS NULL;
	 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO014', 'ARBS', 5);
	commit;
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	--
	-------------------------------------
	lock table cms_stage_security in share mode;
	UPDATE cms_stage_security a SET (
		SCI_SECURITY_DTL_ID,
		SCI_REFERENCE_NOTE,
		SCI_SECURITY_CURRENCY,
		SECURITY_LOCATION,
		SECURITY_ORGANISATION,
		security_sub_type_id, 
		sci_security_type_value, 
		SCI_SECURITY_SUBTYPE_VALUE, 
		source_security_type,
		source_security_sub_type,
		status) =
	(SELECT
		SECURITY_ID,
		SECURITY_REF_NOTE,
		CURRENCY,
		LOC_COUNTRY,
		LOC_ORG_CODE,
		cms_security_subtype_id, 
		cms_security_type_id, 
		cms_security_subtype_id,
		SOURCE_SECURITY_TYPE,
		SOURCE_SECURITY_SUB_TYPE,
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM si_temp_arbs_co014 t
	  WHERE t.security_id = a.sci_security_dtl_id AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co014 t
	  				 WHERE a.sci_security_dtl_id = t.security_id
	  				   AND source_id = 'ARBS' AND t.is_valid = 'Y')
	  	AND source_id = 'ARBS'
	  	AND security_sub_type_id = 'CL001'
	  	AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
	  							   WHERE reference_id IN (SELECT cms_collateral_id 
	  							   							FROM cms_security, si_temp_arbs_co014
	  							   						   WHERE security_id = sci_security_dtl_id
	  							   						     AND source_id = 'ARBS' AND is_valid = 'Y')
	  							   	 AND transaction_type = 'COL')
			AND security_sub_type_id = 'CL001';

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO014', 'ARBS', 6);
	commit;
	
	INSERT INTO cms_stage_security (
		cms_collateral_id, 
		SCI_SECURITY_DTL_ID,
		SCI_REFERENCE_NOTE,
		SCI_SECURITY_CURRENCY,
		SCI_ORIG_SECURITY_CURRENCY,
		SECURITY_LOCATION,
		SECURITY_ORGANISATION,
		security_sub_type_id, 
		sci_security_type_value, 
		SCI_SECURITY_SUBTYPE_VALUE, 
		source_security_type,
		source_security_sub_type,
		status,
		source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR collateral_seq), 2)) as BIGINT),
		SECURITY_ID,
		SECURITY_REF_NOTE,
		CURRENCY,
		CURRENCY,
		LOC_COUNTRY,
		LOC_ORG_CODE,
		cms_security_subtype_id, 
		cms_security_type_id, 
		cms_security_subtype_id,
		SOURCE_SECURITY_TYPE,
		SOURCE_SECURITY_SUB_TYPE,
		'ACTIVE',
		'ARBS'
	   FROM si_temp_arbs_co014 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_stage_security t
	  					 WHERE sci_security_dtl_id = t.security_id
	  					   AND source_id = 'ARBS') AND t.is_valid = 'Y');
								 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO014', 'ARBS', 7);
	commit;
	-------------------------------------
	-- Staging Table
	-- CMS_STAGE_SECURITY
	-- Update type_name, subtype_name
	-------------------------------------
	lock table cms_stage_security in share mode;
	UPDATE cms_stage_security a SET (type_name, subtype_name) =
	(SELECT security_type_name, subtype_name 
	   FROM cms_security_sub_type
	  WHERE security_sub_type_id = a.security_sub_type_id)
	 WHERE source_id = 'ARBS'
	   AND TYPE_NAME IS NULL;

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO014', 'ARBS', 8);
	commit;
	----------------------------
	-- Begin Update
	-- cms_security_source
	--
	----------------------------
	lock table cms_security_source in share mode;
	UPDATE cms_security_source SET(cms_collateral_id, source_security_id, source_id, 
								   last_update_date, security_sub_type_id, interface_id,
									 status) =
	(SELECT cms_collateral_id, security_id, 'ARBS', current_timestamp, cms_security_subtype_id,
			'CO014',
		(CASE WHEN t.UPDATE_STAT_IND = 'D' THEN 'DELETED' ELSE 'ACTIVE' END)
	   FROM cms_security sec, si_temp_arbs_co014 t 
	  WHERE sec.sci_security_dtl_id = security_id
	    AND sec.sci_security_dtl_id = source_security_id 
	    AND source_id = 'ARBS' 
	    AND is_valid = 'Y')
	 WHERE EXISTS (SELECT 1 FROM si_temp_arbs_co014
	 				WHERE security_id = source_security_id 
	 				  AND is_valid = 'Y')
	   AND source_id = 'ARBS';
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO014', 'ARBS', 9);
	COMMIT;
	----------------------------
	-- Begin Insertion
	-- cms_security_source
	--
	----------------------------
	INSERT INTO cms_security_source (cms_security_source_id, cms_collateral_id, source_security_id, source_id, 
									 status, last_update_date, security_sub_type_id, interface_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR SHARE_SECURITY_SEQ), 2)) AS BIGINT),
			cms_collateral_id, security_id, 'ARBS', 'ACTIVE', CURRENT_TIMESTAMP, cms_security_subtype_id,
			'CO014'
	   FROM cms_security sec, si_temp_arbs_co014 t
	  WHERE NOT EXISTS (SELECT 1 FROM cms_security_source 
						 WHERE source_security_id = security_id 
						   AND source_id = 'ARBS') 
		AND is_valid = 'Y'
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO014', 'ARBS', 10);
	COMMIT;
	
	------------------------------------------
	-- START Update Collateral Transaction
	-- CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE
	--
	------------------------------------------	
	FOR cur_col_key AS
		SELECT CMS_COLLATERAL_ID trx_ref_id, 'COL' trx_type
			FROM CMS_SECURITY a
		WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co014 t
							WHERE a.SCI_SECURITY_DTL_ID = t.SECURITY_ID		   	  
									AND t.is_valid = 'Y')
			AND a.SOURCE_ID = 'ARBS'	   
			
	DO
		CALL SI_HOST_UPDATE_TRX_BY_REF_AND_TYPE(cur_col_key.trx_ref_id, cur_col_key.trx_type);
	END FOR;

	IF(upper(LOAD_TYPE)='FULL') THEN
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO014', 'ARBS', 11);
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
			WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'CL'
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co014
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO014', 'ARBS', 12);
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
		WHERE source_id = 'ARBS'
				AND status = 'ACTIVE'
				AND security_sub_type_id = 'CL'
				AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co014
							WHERE a.sci_security_dtl_id = security_id
								and is_valid = 'Y')
				AND cms_collateral_id IN (SELECT staging_reference_id FROM transaction
											WHERE reference_id IN (SELECT cms_collateral_id 
																		FROM cms_security b
																		WHERE a.SCI_SECURITY_DTL_ID = b.sci_security_dtl_id
																			AND b.source_id = 'ARBS')
												AND transaction_type = 'COL');
	
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO014', 'ARBS', 13);
		commit;
		
		------------------------------------
		-- Tag DELETED for non-exist records
		-- cms_security_source
		--
		------------------------------------
		lock table cms_security_source in share mode;
		UPDATE cms_security_source SET(STATUS, last_update_date) =
		('DELETED', current_timestamp)
		WHERE source_id = 'ARBS'
			AND status = 'ACTIVE'
			AND security_sub_type_id = 'CL'
			AND NOT EXISTS (SELECT 1 FROM si_temp_arbs_co014
						WHERE source_security_id = security_id 
							AND is_valid = 'Y');
	END IF;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO014', 'ARBS', 0);
	
END@


CREATE PROCEDURE si_run_temp_arbs_co015
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO015', 'ARBS', 1);
	COMMIT;
	
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT valuer_code code, valuer_desc desc,
			   valuer_cat cat, 'ARBS' source_id
		  FROM si_temp_arbs_co015
		 WHERE valuer_code <> ''
		   AND valuer_desc <> ''
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;
	
	---------------------------------------------
	-- Table : SI_TEMP_ARBS_CO015
	-- VAL_TYPES indexing Purpose
	-- 
	---------------------------------------------
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO015', 'ARBS', 2);
	COMMIT;
	
	UPDATE si_temp_arbs_co015 SET val_types = '';
	
	UPDATE si_temp_arbs_co015 SET val_types = 'N'
	 WHERE (cmv > 0 
	 		OR valuation_date IS NOT NULL)
	   AND is_valid = 'Y';
	   
	COMMIT;
	
	UPDATE si_temp_arbs_co015 SET val_types = val_types || 'A'
	 WHERE (appraisal_value > 0 
	 		OR appraisal_value_date IS NOT NULL 
	 		OR appraisal_name <> '')
	   AND is_valid = 'Y';
	   
	COMMIT;
	
	UPDATE si_temp_arbs_co015 SET val_types = val_types || 'B'
	 WHERE (branch_valuation_amt > 0 
	 		OR branch_valuation_date IS NOT NULL)
	   AND is_valid = 'Y';
	 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO015', 'ARBS', 3);
	COMMIT;
	
	---------------------------------------------------
	-- Actual Table
	-- CMS_VALUATION
	-- One Reoord from ARBS generate multiple records
	-- Only check change of valuation date then insert
	--
	---------------------------------------------------
	INSERT INTO cms_valuation (valuation_id, cms_collateral_id, valuer, valuation_date, valuation_currency, cmv, fsv, 
						  	   reserve_price, reserve_price_date, appraisal_name, valuation_type, update_date, 
						  	   source_type, source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR valuation_seq), 2)) as BIGINT),
			cms_collateral_id, valuer_code, valuation_date, valuation_currency, t.cmv, t.fsv, reserve_price,
			reserve_price_date, appraisal_name,
			(CASE 
				WHEN (t.valuation_type is not null) then t.valuation_type
				WHEN (t.valuation_type is null) then
				(CASE assumption_value
				 	WHEN 'Y' THEN 'V'
				 	WHEN 'N' THEN 'F'
				 	ELSE 'F'
				 END) 
			END) val_type, 
			CURRENT_TIMESTAMP, 'S', 'ARBS'
	   FROM si_temp_arbs_co015 t, cms_security sec
	  WHERE NOT EXISTS (SELECT '1' FROM cms_valuation
	  					 WHERE cms_collateral_id = sec.cms_collateral_id
			    		   AND valuation_type IN ('V', 'F')
			    		   and source_type = 'S'
			    		   AND (date(valuation_date) = date(t.valuation_date)
			    		   	or (valuation_date is null and cmv = t.cmv)))
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS'
		AND ((val_types IN ('N', 'NA', 'NB', 'NAB')
		AND t.valuation_type is null) or 
			(t.valuation_type IN ('F', 'V')))
		AND is_valid = 'Y');
		
	COMMIT;
	
	INSERT INTO cms_valuation (valuation_id, cms_collateral_id, valuer, valuation_date, valuation_currency, cmv, fsv, 
						  	   reserve_price, reserve_price_date, appraisal_name, valuation_type, update_date, 
						  	   source_type, source_id)
  	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR valuation_seq), 2)) as BIGINT),
		  	cms_collateral_id, valuer_code, branch_valuation_date, valuation_currency, branch_valuation_amt, 
		  	t.fsv, reserve_price, reserve_price_date, appraisal_name, 'B', CURRENT_TIMESTAMP, 'S', 'ARBS'
	   FROM si_temp_arbs_co015 t, cms_security sec
	  WHERE NOT EXISTS (SELECT '1' FROM cms_valuation
	  					 WHERE cms_collateral_id = sec.cms_collateral_id
			    		   AND valuation_type = 'B'
			    		   and source_type = 'S'
			    		   AND (date(valuation_date) = date(t.branch_valuation_date)
			    		   	or (valuation_date is null and cmv = t.BRANCH_VALUATION_AMT)))
	   AND ((val_types IN ('B', 'AB', 'NB', 'NAB')
			and t.valuation_type is null) or
			(t.valuation_type = 'B'))
	   AND sec.sci_security_dtl_id = t.security_id
	   AND source_id = 'ARBS'
	   AND is_valid = 'Y');
	   
	COMMIT;
	
	INSERT INTO cms_valuation (valuation_id, cms_collateral_id, valuer, valuation_date, valuation_currency, cmv, fsv, 
						  	   reserve_price, reserve_price_date, appraisal_name, valuation_type, update_date,
						  	   source_type, source_id)
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR valuation_seq), 2)) as BIGINT),
			cms_collateral_id, valuer_code, appraisal_value_date, valuation_currency, appraisal_value, t.fsv, 
			reserve_price, reserve_price_date, appraisal_name, 'A', CURRENT_TIMESTAMP, 'S', 'ARBS'
	   FROM si_temp_arbs_co015 t, cms_security sec
	  WHERE NOT EXISTS (SELECT '1' FROM cms_valuation
	  					 WHERE cms_collateral_id = sec.cms_collateral_id
			    		   AND valuation_type = 'A'
			    		   and source_type = 'S'
			    		   AND (date(valuation_date) = date(t.appraisal_value_date)
			    		   	or (valuation_date is null and cmv = t.APPRAISAL_VALUE)))
		AND ((val_types IN ('A', 'AB', 'NA', 'NAB')
			and t.valuation_type is null) or
			(t.valuation_type = 'A'))
		AND t.security_id = sec.sci_security_dtl_id
		AND source_id = 'ARBS'
		AND is_valid = 'Y');
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO015', 'ARBS', 4);
	COMMIT;
			    		   
	---------------------------------------------------
	-- Staging Table
	-- CMS_STAGE_VALUATION
	-- One Reoord from ARBS generate multiple records
	-- Only check change of valuation date then insert
	--
	---------------------------------------------------
	INSERT INTO cms_stage_valuation (valuation_id, cms_collateral_id, valuer, valuation_date, valuation_currency, cmv, fsv, 
						  	   		 reserve_price, reserve_price_date, appraisal_name, valuation_type, update_date,
						  	   		 source_type, source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR valuation_seq), 2)) as BIGINT),
			cms_collateral_id, valuer_code, valuation_date, valuation_currency, t.cmv, t.fsv, reserve_price,
			reserve_price_date, appraisal_name,
			(CASE 
				WHEN (t.valuation_type is not null) then t.valuation_type
				WHEN (t.valuation_type is null) then
					(CASE assumption_value
						WHEN 'V' THEN 'V'
						WHEN 'N' THEN 'F'
						ELSE 'F'
					END) 
				END)val_type, 
			CURRENT_TIMESTAMP, 'S', 'ARBS'
	   FROM si_temp_arbs_co015 t, cms_stage_security sec, transaction trx
	  WHERE NOT EXISTS (SELECT '1' FROM cms_stage_valuation
	  					 WHERE cms_collateral_id = trx.staging_reference_id
			    		   AND valuation_type IN ('V', 'F')
			    		   and source_type = 'S'
			    		   AND (date(valuation_date) = date(t.valuation_date)
			    		   	or (valuation_date is null and cmv = t.cmv)))
		AND ((val_types IN ('N', 'NA', 'NB', 'NAB')
		AND t.valuation_type is null) or 
			(t.valuation_type IN ('F', 'V')))
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS'
		AND cms_collateral_id = trx.reference_id
		AND transaction_type = 'COL'
		AND is_valid = 'Y');
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO015', 'ARBS', 41);
	COMMIT;
	
	INSERT INTO cms_stage_valuation (valuation_id, cms_collateral_id, valuer, valuation_date, valuation_currency, cmv, fsv, 
						  	   		 reserve_price, reserve_price_date, appraisal_name, valuation_type, update_date,
						  	   		 source_type, source_id)
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR valuation_seq), 2)) as BIGINT),
			cms_collateral_id, valuer_code, branch_valuation_date, valuation_currency, branch_valuation_amt, 
			t.fsv, reserve_price, reserve_price_date, appraisal_name, 'B', CURRENT_TIMESTAMP, 'S', 'ARBS'
	   FROM si_temp_arbs_co015 t, cms_stage_security sec, transaction trx
	  WHERE NOT EXISTS (SELECT '1' FROM cms_stage_valuation
	  					 WHERE cms_collateral_id = trx.staging_reference_id
			    		   AND valuation_type = 'B'
			    		   and source_type = 'S'
			    		   AND (date(valuation_date) = date(t.branch_valuation_date)
			    		   	or (valuation_date is null and cmv = t.BRANCH_VALUATION_AMT)))
	    AND ((val_types IN ('B', 'AB', 'NB', 'NAB')
			and t.valuation_type is null) or
			(t.valuation_type = 'B'))
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS'
		AND cms_collateral_id = trx.reference_id
		AND transaction_type = 'COL'
		AND is_valid = 'Y');
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO015', 'ARBS', 42);
	COMMIT;
	
	INSERT INTO cms_stage_valuation (valuation_id, cms_collateral_id, valuer, valuation_date, valuation_currency, cmv, fsv, 
						  	   		 reserve_price, reserve_price_date, appraisal_name, valuation_type, update_date,
						  	   		 source_type, source_id)
    (SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR valuation_seq), 2)) as BIGINT),
			cms_collateral_id, valuer_code, appraisal_value_date, valuation_currency, appraisal_value, t.fsv, 
			reserve_price, reserve_price_date, appraisal_name, 'A', CURRENT_TIMESTAMP, 'S', 'ARBS'
	   FROM si_temp_arbs_co015 t, cms_stage_security sec, transaction trx
	  WHERE NOT EXISTS (SELECT '1' FROM cms_stage_valuation
	  					 WHERE cms_collateral_id = trx.staging_reference_id
			    		   AND valuation_type = 'A'
			    		   and source_type = 'S'
			    		   AND (date(valuation_date) = date(t.appraisal_value_date)
			    		   	or (valuation_date is null and cmv = t.APPRAISAL_VALUE)))
		AND ((val_types IN ('A', 'AB', 'NA', 'NAB')
			and t.valuation_type is null) or
			(t.valuation_type = 'A'))
		AND sec.sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS'
		AND cms_collateral_id = trx.reference_id
		AND transaction_type = 'COL'
		AND is_valid = 'Y');
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO015', 'ARBS', 5);
	COMMIT;
		
	DECLARE GLOBAL TEMPORARY TABLE SESSION.valuation_reserved_price
		(cms_act_col_id BIGINT,
		 cms_stg_col_id BIGINT,
		 cms_max_act_val_id BIGINT,
		 cms_max_stg_val_id BIGINT,
		 security_id VARCHAR(19),
		 valuation_currency VARCHAR(3),
		 reserve_price DECIMAL(15,2),
		 reserve_price_date TIMESTAMP) 
	WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;

	INSERT INTO SESSION.valuation_reserved_price(security_id, valuation_currency, reserve_price, reserve_price_date)
	(SELECT security_id, valuation_currency, reserve_price, reserve_price_date
	   FROM si_temp_arbs_co015
	  WHERE is_valid = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO015', 'ARBS', 51);
	COMMIT;

	UPDATE SESSION.valuation_reserved_price a SET (cms_act_col_id, cms_stg_col_id) =
	(SELECT reference_id , staging_reference_id
	   FROM cms_security sec, transaction trx
	  WHERE sec.cms_collateral_id = reference_id
		AND trx.transaction_type = 'COL'
		AND sec.source_id = 'ARBS'
		AND sec.sci_security_dtl_id = a.security_id);
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO015', 'ARBS', 52);
	COMMIT;
		
	CREATE INDEX SESSION.t_val_col_idx1
    	ON SESSION.valuation_reserved_price(cms_act_col_id ASC) ALLOW REVERSE SCANS;

	CREATE INDEX SESSION.t_val_col_idx2
    	ON SESSION.valuation_reserved_price(cms_stg_col_id ASC) ALLOW REVERSE SCANS;

	UPDATE SESSION.valuation_reserved_price a SET (cms_max_act_val_id) =
	(SELECT valuation_id 
	   FROM cms_valuation
	  WHERE cms_collateral_id = a.cms_act_col_id
	    AND source_type = 'M' order by valuation_id desc
			fetch first row only);
	  
	UPDATE SESSION.valuation_reserved_price a SET (cms_max_stg_val_id) =
	(SELECT valuation_id 
	   FROM cms_stage_valuation
	  WHERE cms_collateral_id = a.cms_stg_col_id
	    AND source_type = 'M' order by valuation_id desc
			fetch first row only);
			
	CREATE INDEX SESSION.t_val_idx1
			ON SESSION.valuation_reserved_price(cms_max_act_val_id ASC) ALLOW REVERSE SCANS;
		
	CREATE INDEX SESSION.t_val_idx2
			ON SESSION.valuation_reserved_price(cms_max_stg_val_id ASC) ALLOW REVERSE SCANS;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO015', 'ARBS', 53);
	COMMIT;
	
	lock table cms_valuation in share mode;
	UPDATE cms_valuation a SET (valuation_currency, reserve_price, reserve_price_date, update_date) =
	(SELECT valuation_currency, reserve_price, reserve_price_date, CURRENT_TIMESTAMP
	   FROM SESSION.valuation_reserved_price
	  WHERE cms_max_act_val_id = a.valuation_id)
	 WHERE EXISTS (SELECT 1 FROM SESSION.valuation_reserved_price
	 				WHERE a.valuation_id = cms_max_act_val_id);
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO015', 'ARBS', 54);
	COMMIT;
	  
	INSERT INTO cms_valuation (valuation_id, cms_collateral_id, valuation_currency, reserve_price, reserve_price_date, 
							   update_date, source_type, source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR valuation_seq), 2)) as BIGINT),
			cms_act_col_id, valuation_currency, reserve_price, reserve_price_date, CURRENT_TIMESTAMP, 'M', 'ARBS'
	   FROM SESSION.valuation_reserved_price
	  WHERE cms_max_act_val_id IS NULL);
	  
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO015', 'ARBS', 6);
	COMMIT;
	
	lock table cms_stage_valuation in share mode;
	UPDATE cms_stage_valuation a SET (valuation_currency, reserve_price, reserve_price_date, update_date) =
	(SELECT valuation_currency, reserve_price, reserve_price_date, CURRENT_TIMESTAMP
	   FROM SESSION.valuation_reserved_price
	  WHERE cms_max_stg_val_id = a.valuation_id)
	 WHERE EXISTS (SELECT 1 FROM SESSION.valuation_reserved_price
	 				WHERE a.valuation_id = cms_max_stg_val_id);

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO015', 'ARBS', 61);
	COMMIT;
	  
	INSERT INTO cms_stage_valuation (valuation_id, cms_collateral_id, valuation_currency, reserve_price, reserve_price_date, 
									 update_date, source_type, source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR valuation_seq), 2)) as BIGINT),
			cms_stg_col_id, valuation_currency, reserve_price, reserve_price_date, CURRENT_TIMESTAMP, 'M', 'ARBS'
	   FROM SESSION.valuation_reserved_price
	  WHERE cms_max_stg_val_id IS NULL);
	  
	DROP TABLE SESSION.valuation_reserved_price;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO015', 'ARBS', 0);

END
@

CREATE PROCEDURE si_run_temp_arbs_co016
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO016', 'ARBS', 1);
	COMMIT;
	
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT insurance_type_code code, insurance_type_desc desc,
			   insurance_type_cat cat, 'ARBS' source_id
		  FROM si_temp_arbs_co016
		 WHERE insurance_type_code <> ''
		   AND insurance_type_desc <> ''
		 UNION
		SELECT DISTINCT insurer_name_code code, insurer_name_desc desc,
			   insurer_name_cat cat, 'ARBS' source_id
		  FROM si_temp_arbs_co016
		 WHERE insurer_name_code <> ''
		   AND insurer_name_desc <> ''
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO016', 'ARBS', 2);
	COMMIT;
	
	---------------------------------------------------
	-- Actual Table
	-- si_temp_arbs_co016
	-- set cms key (collateral)
	---------------------------------------------------	

	UPDATE si_temp_arbs_co016 t SET (cms_act_col_id, cms_stg_col_id) =
	(SELECT reference_id , staging_reference_id
	   FROM cms_security sec, transaction trx
	  WHERE sec.cms_collateral_id = reference_id
		AND trx.transaction_type = 'COL'
		AND sec.source_id = 'ARBS'
		AND sec.sci_security_dtl_id = t.security_id)
	 WHERE is_valid = 'Y';
	 
	COMMIT;
	

	UPDATE si_temp_arbs_co016 t SET (cms_act_insr_id) = 
	(SELECT insurance_policy_id 
	   FROM cms_insurance_policy
	  WHERE cms_collateral_id = t.cms_act_col_id
	    AND policy_seq_no = t.seq_number)
	 WHERE is_valid = 'Y';
	 
	COMMIT;
	

	UPDATE cms_stage_insurance_policy stg SET policy_seq_no = 
	(SELECT policy_seq_no FROM cms_insurance_policy
	  WHERE insurance_policy_id = CAST(stg.insr_id AS BIGINT))
	 WHERE cms_collateral_id IN (SELECT cms_stg_col_id FROM si_temp_arbs_co016)
	   AND policy_seq_no IS NULL;
	 
	COMMIT;
	

	UPDATE si_temp_arbs_co016 t SET (cms_stg_insr_id) = 
	(SELECT stg.insurance_policy_id
	   FROM cms_stage_insurance_policy stg
	  WHERE stg.cms_collateral_id = t.cms_stg_col_id
		AND stg.policy_seq_no = t.seq_number)
	 WHERE is_valid = 'Y';
	 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO016', 'ARBS', 3);
	COMMIT;
	
	---------------------------------------------------
	-- Actual Table
	-- CMS_INSURANCE_POLICY
	--
	---------------------------------------------------
	CALL SI_RUNSTATS('si_temp_arbs_co016');
	COMMIT;
	
	lock table cms_insurance_policy in share mode;
	UPDATE cms_insurance_policy a SET (policy_no, insurer_name, insurance_type, currency_code, insured_amt, effective_date, expiry_date, 
									   address_line_1, address_line_2, address_line_3, address_line_4, bank_cust_arrange_ins_ind, 
									   cash_surrender_value, prop_no_cover_note_number, remarks, gross_premium, stamp_duty, 
									   service_tax_perct, service_amt, global_local_ind, rebate_by_insurance, 
									   rebate_to_borrower, rebate_amt_to_borrower, net_premium_pay_to_insurance_c, 
									   net_premium_pay_by_borrower, commission_earned, status) = 
	(SELECT policy_number, insurer_name_code, insurance_type_code, insurance_policy_currency, insured_amt, effective_date, expiry_date, 
			insured_add_1, insured_add_2, insured_add_3, insured_add_4, bank_cust_arrange_insurance_in, cash_surrender_value, 
			prop_no_cover_note_number, t.remarks, gross_premium, stamp_duty, service_tax_perct, service_amt, global_local_ind, 
			rebate_by_insurance, rebate_to_borrower, rebate_amt_to_borrower, net_premium_pay_to_insurance_c, 
			net_premium_pay_by_borrower, commission_earned, 'ACTIVE'
	   FROM si_temp_arbs_co016 t
	  WHERE t.cms_act_insr_id = a.insurance_policy_id
		AND is_valid = 'Y')
	 WHERE a.source_id = 'ARBS'
	   	AND EXISTS (SELECT '1' 
	   				 FROM si_temp_arbs_co016
	  				WHERE cms_act_insr_id = a.insurance_policy_id
					  AND is_valid = 'Y');
					  
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO016', 'ARBS', 31);
	COMMIT;

	INSERT INTO cms_insurance_policy (insurance_policy_id, cms_collateral_id, policy_no, policy_seq_no, insurer_name, insurance_type,
									  currency_code, insured_amt, effective_date, expiry_date, address_line_1, address_line_2, 
									  address_line_3, address_line_4, bank_cust_arrange_ins_ind, cash_surrender_value, 
									  prop_no_cover_note_number, remarks, gross_premium, stamp_duty, service_tax_perct, service_amt,
									  global_local_ind, rebate_by_insurance, rebate_to_borrower, rebate_amt_to_borrower,
									  net_premium_pay_to_insurance_c, net_premium_pay_by_borrower, commission_earned, 
									  source_security_id, status, source_id, insr_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR insurance_policy_seq), 2)) as BIGINT),
			cms_act_col_id, policy_number, seq_number, insurer_name_code, insurance_type_code, insurance_policy_currency,
			t.insured_amt, t.effective_date, t.expiry_date, insured_add_1, insured_add_2, insured_add_3, insured_add_4, 
			bank_cust_arrange_insurance_in, t.cash_surrender_value, t.prop_no_cover_note_number, t.remarks, t.gross_premium, t.stamp_duty, 
			t.service_tax_perct, t.service_amt, t.global_local_ind, t.rebate_by_insurance, t.rebate_to_borrower, 
			t.rebate_amt_to_borrower, t.net_premium_pay_to_insurance_c, t.net_premium_pay_by_borrower, t.commission_earned, security_id,
			'ACTIVE', 'ARBS',
			rtrim(TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR insurance_policy_seq), 2))
	   FROM si_temp_arbs_co016 t 
	  WHERE cms_act_insr_id IS NULL				   
		AND is_valid = 'Y');

	CALL SI_RUNSTATS('cms_insurance_policy');
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO016', 'ARBS', 4);
	COMMIT;
	
	--------------------------------------------------------------
	-- set actual insurance id for new insurance policy record
	--------------------------------------------------------------
	UPDATE si_temp_arbs_co016 t SET (cms_act_insr_id) = 
	(SELECT insurance_policy_id 
	   FROM cms_insurance_policy
	  WHERE cms_collateral_id = t.cms_act_col_id
	    AND policy_seq_no = t.seq_number)
	 WHERE is_valid = 'Y'
	 and cms_act_insr_id is null;
	 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO016', 'ARBS', 41);	 
	COMMIT;	
	
	---------------------------------------------------
	-- Staging Table
	-- CMS_STAGE_INSURANCE_POLICY
	--
	---------------------------------------------------
	lock table cms_stage_insurance_policy in share mode;
	UPDATE cms_stage_insurance_policy a SET (policy_no, insurer_name, insurance_type, currency_code, insured_amt, 
											 effective_date, expiry_date, address_line_1, address_line_2, address_line_3, 
											 address_line_4, bank_cust_arrange_ins_ind, cash_surrender_value, prop_no_cover_note_number, 
									   		 remarks, gross_premium, stamp_duty, service_tax_perct, service_amt, global_local_ind, 
									   		 rebate_by_insurance, rebate_to_borrower, rebate_amt_to_borrower, 
									   		 net_premium_pay_to_insurance_c,  net_premium_pay_by_borrower, commission_earned, 
									   		 status) = 
	(SELECT policy_number, insurer_name_code, insurance_type_code, insurance_policy_currency, insured_amt, effective_date, 
			expiry_date, insured_add_1, insured_add_2, insured_add_3, insured_add_4, bank_cust_arrange_insurance_in, 
			cash_surrender_value, prop_no_cover_note_number, t.remarks, gross_premium, stamp_duty, service_tax_perct, service_amt, 
			global_local_ind, rebate_by_insurance, rebate_to_borrower, rebate_amt_to_borrower, 
			net_premium_pay_to_insurance_c, net_premium_pay_by_borrower, commission_earned, 'ACTIVE'
	   FROM si_temp_arbs_co016 t
	  WHERE t.cms_stg_insr_id = a.insurance_policy_id
		AND t.is_valid = 'Y')
	 WHERE a.source_id = 'ARBS'
	 		AND EXISTS (SELECT '1' 
	   				 FROM si_temp_arbs_co016
	  				WHERE cms_stg_insr_id = a.insurance_policy_id
					  AND is_valid = 'Y');
					  
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO016', 'ARBS', 5);
	COMMIT;
		   
	INSERT INTO cms_stage_insurance_policy (insurance_policy_id, cms_collateral_id, policy_no, policy_seq_no, insurer_name, 
											insurance_type, currency_code, insured_amt, effective_date, expiry_date, address_line_1, 
											address_line_2, address_line_3, address_line_4, bank_cust_arrange_ins_ind, 
											cash_surrender_value, prop_no_cover_note_number, remarks, gross_premium, stamp_duty, 
											service_tax_perct, service_amt, global_local_ind, rebate_by_insurance, 
											rebate_to_borrower, rebate_amt_to_borrower, net_premium_pay_to_insurance_c, 
											net_premium_pay_by_borrower, commission_earned, source_security_id, status, source_id, insr_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR insurance_policy_seq), 2)) as BIGINT),
			cms_stg_col_id, policy_number, seq_number, insurer_name_code, insurance_type_code, insurance_policy_currency,
			t.insured_amt, t.effective_date, t.expiry_date, insured_add_1, insured_add_2, insured_add_3, insured_add_4, 
			bank_cust_arrange_insurance_in, t.cash_surrender_value, t.prop_no_cover_note_number, t.remarks, t.gross_premium, t.stamp_duty, 
			t.service_tax_perct, t.service_amt, t.global_local_ind, t.rebate_by_insurance, t.rebate_to_borrower, 
			t.rebate_amt_to_borrower, t.net_premium_pay_to_insurance_c, t.net_premium_pay_by_borrower, t.commission_earned, 
			security_id, 'ACTIVE', 'ARBS', RTRIM(CHAR(cms_act_insr_id))
	   FROM si_temp_arbs_co016 t
	  WHERE cms_stg_insr_id IS NULL
		AND is_valid = 'Y');
		
	CALL SI_RUNSTATS('cms_stage_insurance_policy');
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO016', 'ARBS', 6);
	COMMIT;
	
	UPDATE si_temp_arbs_co016 t SET (cms_stg_insr_id) = 
	(SELECT stg.insurance_policy_id
	   FROM cms_stage_insurance_policy stg
	  WHERE stg.cms_collateral_id = t.cms_stg_col_id
		AND stg.policy_seq_no = t.seq_number)
	 WHERE is_valid = 'Y'
	 and cms_stg_insr_id is null;
	 	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO016', 'ARBS', 7);
	COMMIT;
	 
	
	-- remove due to the setting of insr id is done together with insert script
-- 	lock table cms_stage_insurance_policy in exclusive mode;
-- 	UPDATE cms_stage_insurance_policy a SET insr_id = 
-- 	(SELECT RTRIM(CHAR(cms_act_insr_id))
-- 	   FROM si_temp_arbs_co016
-- 	  WHERE cms_stg_col_id = a.cms_collateral_id
-- 	    AND policy_number = a.policy_seq_no
-- 	    and is_valid = 'Y')
-- 	 WHERE a.SOURCE_ID = 'ARBS' 
-- 	 		AND insr_id IS NULL
-- 	   	AND EXISTS (SELECT '1' 
-- 	   				 FROM si_temp_arbs_co016
-- 	  				WHERE a.cms_collateral_id = cms_stg_col_id
-- 					  AND a.policy_seq_no = seq_number
-- 					  AND is_valid = 'Y');

-- 	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO016', 'ARBS', 7);
-- 	COMMIT;

	---------------------------------------------------
	-- Tag DELETED for non-exist records
	-- Actual Table
	-- CMS_INSURANCE_POLICY
	--
	---------------------------------------------------
	
	lock table cms_insurance_policy in share mode;
-- 	UPDATE cms_insurance_policy a SET status = 'DELETED'
-- 	 WHERE a.SOURCE_ID = 'ARBS' 
-- 	 		AND status = 'ACTIVE'
-- 	   	AND NOT EXISTS (SELECT '1' 
-- 	   				 FROM si_temp_arbs_co016
-- 	  				WHERE cms_act_col_id = cms_collateral_id
-- 	    				AND seq_number = policy_seq_no
-- 					  	AND is_valid = 'Y');

	update cms_insurance_policy a 
	set status = 'DELETED'
	WHERE a.source_id = 'ARBS'
	and status = 'ACTIVE'
	AND not exists (select '1'
		from si_temp_arbs_co016
		where cms_act_insr_id = a.insurance_policy_id
		and is_valid = 'Y');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO016', 'ARBS', 71);
	COMMIT;

	lock table cms_stage_insurance_policy in share mode;
-- 	UPDATE cms_stage_insurance_policy a SET status = 'DELETED'
-- 	 WHERE a.SOURCE_ID = 'ARBS'
-- 	 		AND status = 'ACTIVE'
-- 	   	AND NOT EXISTS (SELECT '1'
-- 	   				 FROM si_temp_arbs_co016
-- 	  				WHERE cms_stg_col_id = cms_collateral_id
-- 	    				AND seq_number = policy_seq_no
-- 					  	AND is_valid = 'Y');
					  	
	UPDATE cms_stage_insurance_policy a SET status = 'DELETED'
	 WHERE a.SOURCE_ID = 'ARBS'
	 		AND status = 'ACTIVE'
	   	AND NOT EXISTS (SELECT '1'
	   				 FROM si_temp_arbs_co016
	  				WHERE cms_stg_insr_id = a.insurance_policy_id
	  				and cms_stg_col_id = cms_collateral_id
					  	AND is_valid = 'Y')					 
		and exists (select '1'
			from transaction
			where transaction_type = 'COL'
			and staging_reference_id = cms_collateral_id); 	

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO016', 'ARBS', 0);
	
END
@

CREATE PROCEDURE si_run_temp_arbs_co017
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 1);
	commit;
	
	UPDATE si_temp_arbs_co017 t SET (cms_act_col_id, cms_stg_col_id) =
	(SELECT reference_id , staging_reference_id
	   FROM cms_security sec, transaction trx
	  WHERE sec.cms_collateral_id = reference_id
		AND trx.transaction_type = 'COL'
		AND sec.source_id = 'ARBS'
		AND sec.sci_security_dtl_id = t.security_id)
	 WHERE is_valid = 'Y';
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 2);
	commit;

	lock table si_temp_arbs_co017 in exclusive mode;
	UPDATE si_temp_arbs_co017 t 
		SET (cms_act_lmt_id, 
					cms_stg_lmt_id) = (SELECT reference_id, 
				staging_reference_id 
															FROM sci_lsp_appr_lmts lmt, 
																		transaction trx 
															WHERE lmt.CMS_LSP_APPR_LMTS_ID = reference_id 
																AND trx.transaction_type = 'LIMIT' 
																AND lmt.source_id = 'ARBS' 
																AND lmt.LMT_BCA_REF_NUM = t.APPLICATION_NO 
																AND lmt.LMT_FAC_CODE = t.FACILITY_CODE 
																AND lmt.LMT_FAC_SEQ = t.FACILITY_SEQ) 
	WHERE is_valid = 'Y';
	 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 3);
	commit;

	UPDATE si_temp_arbs_co017 t SET (cms_act_chrg_id) = 
	(SELECT charge_id FROM cms_limit_security_map 
	  WHERE cms_collateral_id = t.cms_act_col_id
		AND cms_lsp_appr_lmts_id = t.cms_act_lmt_id)
	 WHERE is_valid = 'Y';
	 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 4);
	commit;

	UPDATE si_temp_arbs_co017 t SET (cms_stg_chrg_id) = 
	(SELECT charge_id FROM cms_stage_limit_security_map s
	  WHERE cms_collateral_id = t.cms_act_col_id
		AND cms_lsp_appr_lmts_id = t.cms_stg_lmt_id)
	 WHERE is_valid = 'Y';
	 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 5);
	commit;
	
	UPDATE si_temp_arbs_co017 t SET (cms_act_aa_id) = 
	(SELECT cms_lsp_lmt_profile_id
	   FROM sci_lsp_lmt_profile
	  WHERE llp_bca_ref_num = t.application_no
		AND source_id = 'ARBS')
	 WHERE is_valid = 'Y';
	 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 6);
	COMMIT;
	
	CALL SI_RUNSTATS('si_temp_arbs_co017');
	COMMIT;
	
	DELETE FROM si_temp_arbs_co017_chrg;
	
	INSERT INTO si_temp_arbs_co017_chrg (security_id, 
																			cms_act_col_id, 
																			cms_stg_col_id, 
																			ranking_of_security) 
	SELECT DISTINCT security_id, 
				cms_act_col_id, 
				cms_stg_col_id, 
				ranking_of_security 
		FROM si_temp_arbs_co017 
	WHERE NOT EXISTS (SELECT '1' 
					FROM cms_charge_detail 
					WHERE cms_collateral_id = cms_act_col_id 
						AND security_rank = ranking_of_security 
						AND source_id = 'ARBS'
						and status = 'ACTIVE' )
		AND is_valid = 'Y';
		
-- 	SELECT DISTINCT security_id, 
-- 				cms_act_col_id, 
-- 				cms_stg_col_id, 
-- 				ranking_of_security 
-- 		FROM si_temp_arbs_co017 
-- 	WHERE NOT EXISTS (SELECT '1' 
-- 											FROM cms_charge_detail cms_charge_detail, 
-- 														cms_charge_detail cms_charge_detail1 
-- 											WHERE cms_charge_detail.cms_collateral_id = cms_act_col_id 
-- 												AND cms_charge_detail.security_rank = ranking_of_security 
-- 												AND cms_charge_detail.source_id = 'ARBS' 
-- 												AND cms_charge_detail.CHARGE_DETAIL_ID = cms_charge_detail1.CHARGE_DETAIL_ID 
-- 												AND cms_charge_detail1.CHARGE_DETAIL_ID = COALESCE(cms_charge_detail1.CHARGE_DETAIL_ID, cms_charge_detail1.CHARGE_DETAIL_ID)) 
-- 		AND is_valid = 'Y';
		
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 61);
	COMMIT;
	
	--------------------------------------
	-- set actual charge detail id
	--------------------------------------
	update si_temp_arbs_co017
	set cms_act_chrg_dtl_id =
		(select charge_detail_id
		from cms_charge_detail chrg
		where chrg.status = 'ACTIVE'
		and chrg.cms_collateral_id = cms_act_col_id
		and chrg.security_rank = ranking_of_security
		and chrg.source_id = 'ARBS')
	where is_valid = 'Y';
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 62);
	COMMIT;
	
	
	DECLARE GLOBAL TEMPORARY TABLE SESSION.max_charge_info
		(max_legal_charge_date timestamp,
		 max_act_lmt_id bigint,
		 cms_act_col_id bigint,
		 ranking_of_security bigint) 
		WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;	
	
		insert into session.max_charge_info (max_legal_charge_date, max_act_lmt_id, cms_act_col_id, ranking_of_security)
		(SELECT MAX(date_legally_charge), max(cms_act_lmt_id), cms_act_col_id, ranking_of_security
	    	  							 FROM si_temp_arbs_co017
	    	  						    WHERE is_valid = 'Y'
										group by cms_act_col_id, ranking_of_security);
										
		create index session.max_chrg_info_idx on session.max_charge_info(cms_act_col_id asc, ranking_of_security asc) 
		allow reverse scans;
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 701);		
	commit;
										
	lock table si_temp_arbs_co017_chrg in exclusive mode;
	UPDATE si_temp_arbs_co017_chrg a SET (date_legally_charge, presentation_no, presentation_date) =
	(SELECT date_legally_charge, presentation_no, presentation_date
	   FROM si_temp_arbs_co017 chrg
	  WHERE a.cms_act_col_id = cms_act_col_id
	    AND a.ranking_of_security = ranking_of_security
	    AND is_valid = 'Y'
	    AND ((date_legally_charge IS NOT NULL
	    	  AND date_legally_charge = (SELECT max_legal_charge_date
	    	  							 FROM session.max_charge_info
	    	  						    WHERE chrg.cms_act_col_id = cms_act_col_id
	    	  						      AND chrg.ranking_of_security = ranking_of_security))
	    	 OR (date_legally_charge IS NULL
	    	 	 AND cms_act_lmt_id = (SELECT max_act_lmt_id
	    	 	 						 FROM session.max_charge_info
	    	 	 						WHERE chrg.cms_act_col_id = cms_act_col_id
	    	  						      AND chrg.ranking_of_security = ranking_of_security)))
	   ORDER BY cms_act_lmt_id DESC
	   FETCH FIRST ROW ONLY);	

	drop table session.max_charge_info;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 7);
	COMMIT;
	
	-----------------------------
	-- ACTUAL Table
	-- CMS_CHARGE_DETAIL
	--
	-----------------------------
	lock table cms_charge_detail in share mode;
	UPDATE cms_charge_detail a SET (security_rank, legal_charge_date, tooltip_date_legally_charge, 
									presentation_no, presentation_date, status) =
	(SELECT ranking_of_security, date_legally_charge, date_legally_charge, presentation_no, presentation_date,
		'ACTIVE'
	   FROM si_temp_arbs_co017 t
	  WHERE t.cms_act_chrg_dtl_id = a.charge_detail_id
		and is_valid = 'Y' fetch first row only)
	  WHERE SOURCE_ID = 'ARBS'
			AND EXISTS (SELECT '1' FROM si_temp_arbs_co017 t
	  				 WHERE t.cms_act_chrg_dtl_id = a.charge_detail_id
					   and t.is_valid = 'Y');
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 801);
	COMMIT;
 
	INSERT INTO cms_charge_detail (charge_detail_id, sci_las_sec_id, cms_collateral_id, security_rank, 
								   legal_charge_date, tooltip_date_legally_charge, presentation_no, presentation_date, 
								   charge_type, status, source_id, cms_ref_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR col_limit_charge_seq), 2)) as BIGINT),
			security_id, t.cms_act_col_id, ranking_of_security, date_legally_charge, date_legally_charge, 
			presentation_no, presentation_date, 'G', 'ACTIVE', 'ARBS',
			CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR col_limit_charge_seq), 2)) as BIGINT)
	   FROM si_temp_arbs_co017_chrg t);
	-----------------------------
	-- ACTUAL Table
	-- CMS_CHARGE_DETAIL
	-- Sum Up Charge Amount
	--
	-----------------------------
	
	call si_runstats('cms_charge_detail');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 8);
	COMMIT;
	
	
	--------------------------------------
	-- set actual charge detail id
	-- for newly insert charge detail
	--------------------------------------
	lock table si_temp_arbs_co017 in exclusive mode;
	update si_temp_arbs_co017
	set cms_act_chrg_dtl_id =
		(select charge_detail_id
		from cms_charge_detail chrg
		where chrg.status = 'ACTIVE'
		and chrg.cms_collateral_id = cms_act_col_id
		and chrg.security_rank = ranking_of_security
		and chrg.source_id = 'ARBS')
	where is_valid = 'Y'
	and cms_act_chrg_dtl_id is null;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 802);
	COMMIT;	
	
	DECLARE GLOBAL TEMPORARY TABLE SESSION.sum_charge_info
		(sum_charge_amt decimal(20,2),
		 currency_code char(3),
		 cms_collateral_id bigint,
		 ranking_of_security bigint) 
		WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;	
		
	insert into session.sum_charge_info
	(sum_charge_amt, currency_code, cms_collateral_id, ranking_of_security)
	(select sum(charge_amt), s.sci_security_currency, s.cms_collateral_id, ranking_of_security
	from si_temp_arbs_co017, cms_security s
	where s.cms_collateral_id = cms_act_col_id
	and is_valid = 'Y'
	group by s.cms_collateral_id, ranking_of_security, sci_security_currency);
	
	create index session.sum_charge_idx on session.sum_charge_info
	(cms_collateral_id asc, ranking_of_security asc, sum_charge_amt, currency_code) allow reverse scans;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 81);	
	commit;
	
	lock table cms_charge_detail in share mode;
	UPDATE cms_charge_detail A1 
   SET (charge_amount, 
        charge_currency_code) = (SELECT sum_charge_amt, currency_code 
                                   FROM session.sum_charge_info t
                                  WHERE t.cms_collateral_id = A1.cms_collateral_id 
                                    AND t.ranking_of_security = A1.security_rank) 
   WHERE source_id = 'ARBS' 
   and status = 'ACTIVE'
   AND EXISTS (SELECT '1' 
                 FROM session.sum_charge_info t1
                 where t1.cms_collateral_id = A1.cms_collateral_id
                 and t1.ranking_of_security = A1.security_rank);
	   				  
    drop table session.sum_charge_info;
    
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 9);
	COMMIT;
						   
	-----------------------------
	-- ACTUAL Table
	-- CMS_LIMIT_CHARGE_MAP
	--
	-----------------------------
	
	lock table cms_limit_charge_map in share mode;
	INSERT INTO cms_limit_charge_map (limit_charge_map_id, cms_lsp_appr_lmts_id, charge_id, charge_detail_id, cms_collateral_id, 
									  status, customer_category, cms_lsp_lmt_profile_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_charge_map_seq), 2)) as BIGINT),
			cms_act_lmt_id, cms_act_chrg_id, cms_act_chrg_dtl_id, t.cms_act_col_id, 'ACTIVE', 'MB', cms_act_aa_id
	   FROM si_temp_arbs_co017 t
	  WHERE is_valid = 'Y'
	  	AND NOT EXISTS (SELECT '1' FROM cms_limit_charge_map m
	  					 WHERE t.cms_act_chrg_id = m.charge_id
	  					   AND t.cms_act_chrg_dtl_id = m.charge_detail_id));
		
	call si_runstats('cms_limit_security_map');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 91);
	COMMIT;
	
	lock table cms_limit_security_map in share mode;
	UPDATE cms_limit_security_map A1 
		SET charge_amount = (SELECT charge_amt
								FROM si_temp_arbs_co017 
							WHERE is_valid = 'Y' AND cms_act_chrg_id = A1.charge_id) 
	WHERE A1.SOURCE_ID = 'ARBS' 
		and update_status_ind <> 'D'
		AND EXISTS (SELECT '1' 
					FROM si_temp_arbs_co017 
					WHERE is_valid = 'Y' AND cms_act_chrg_id = A1.charge_id);

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 10);
	COMMIT;
	  									    
	-----------------------------
	-- Staging Table
	-- CMS_STAGE_CHARGE_DETAIL
	--
	-----------------------------
	
	----------------------------
	-- set stage charge detail id
	------------------------------
	lock table si_temp_arbs_co017 in exclusive mode;
	update si_temp_arbs_co017
	set cms_stg_chrg_dtl_id = 
		(select charge_detail_id
		from cms_stage_charge_detail chrg
		where chrg.cms_collateral_id = cms_stg_col_id
		and chrg.security_rank = ranking_of_security
		and source_id = 'ARBS'
    order by charge_detail_id desc
    fetch first 1 row only)
	where is_valid = 'Y';
	
	call si_runstats('cms_stage_charge_detail');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 1101);
	COMMIT;
	
	lock table cms_stage_charge_detail in share mode;  
	UPDATE cms_stage_charge_detail a SET (security_rank, legal_charge_date, tooltip_date_legally_charge, 
										  presentation_no, presentation_date, status) =
	(SELECT ranking_of_security, date_legally_charge, date_legally_charge, presentation_no, presentation_date,
		'ACTIVE'
	   FROM si_temp_arbs_co017 t
	  WHERE t.cms_stg_chrg_dtl_id = a.charge_detail_id
	  and is_valid = 'Y' fetch first row only)
	  WHERE source_id = 'ARBS'
			AND EXISTS (SELECT '1' FROM si_temp_arbs_co017
	  				 WHERE cms_stg_chrg_dtl_id = a.charge_detail_id
					   AND is_valid = 'Y');					   
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 1102);
	COMMIT;

	INSERT INTO cms_stage_charge_detail (charge_detail_id, sci_las_sec_id, cms_collateral_id, security_rank, 
								   		 legal_charge_date, presentation_no, presentation_date, charge_type, status, source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR col_limit_charge_seq), 2)) as BIGINT),
			security_id, cms_stg_col_id, ranking_of_security, date_legally_charge, presentation_no, 
			presentation_date, 'G', 'ACTIVE', 'ARBS'
	   FROM si_temp_arbs_co017_chrg);
	   
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 11);
	COMMIT;
		
	--------------------------------------------
	-- set stage charge detail id
	-- for newly added stage charge record
	--------------------------------------------
	lock table si_temp_arbs_co017 in exclusive mode;
	
	update si_temp_arbs_co017
	set cms_stg_chrg_dtl_id = 
		(select charge_detail_id
		from cms_stage_charge_detail chrg
		where chrg.cms_collateral_id = cms_stg_col_id
		and chrg.security_rank = ranking_of_security
		and source_id = 'ARBS')
	where is_valid = 'Y'
	and cms_stg_chrg_dtl_id is null;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 1102);
	COMMIT;
		
	-----------------------------
	-- Staging Table
	-- stage_charge_info
	-- Sum Up Charge Amount
	--
	-----------------------------
	
	DECLARE GLOBAL TEMPORARY TABLE SESSION.stage_charge_info
		(charge_amount DECIMAL(15,2),
		 charge_currency_code VARCHAR(3),
		 cms_ref_id BIGINT,
		 cms_stg_col_id BIGINT,
		 ranking_of_security BIGINT,
		 cms_chrg_dtl_id BIGINT) 
		WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;
				
		
	INSERT INTO SESSION.stage_charge_info(cms_stg_col_id, ranking_of_security, cms_chrg_dtl_id)
	(SELECT DISTINCT cms_stg_col_id, ranking_of_security, cms_stg_chrg_dtl_id
	   FROM si_temp_arbs_co017
	  WHERE is_valid = 'Y');
-- 	  
-- 	UPDATE SESSION.stage_charge_info t SET cms_chrg_dtl_id =
-- 	(SELECT charge_detail_id FROM cms_stage_charge_detail
-- 	  WHERE cms_collateral_id = t.cms_stg_col_id 
-- 	    AND security_rank = t.ranking_of_security);
	
	CREATE INDEX SESSION.t_col_rank_idx
    	ON SESSION.stage_charge_info(cms_stg_col_id ASC, ranking_of_security)
        ALLOW REVERSE SCANS;
        
	CREATE INDEX SESSION.t_chrg_dtl_idx
    	ON SESSION.stage_charge_info(cms_chrg_dtl_id);
    	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 12);
	COMMIT;
  
	UPDATE SESSION.stage_charge_info t SET (charge_amount, charge_currency_code) = 
	(SELECT SUM(charge_amt), sci_security_currency FROM si_temp_arbs_co017, cms_stage_security
	  WHERE t.cms_stg_col_id = cms_stg_col_id
	    AND t.ranking_of_security = ranking_of_security
	    AND t.cms_stg_col_id = cms_collateral_id
			AND source_id = 'ARBS'
			AND is_valid = 'Y'
			group by sci_security_currency);
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 122);
	COMMIT;
	
	UPDATE SESSION.stage_charge_info t SET cms_ref_id = 
	(SELECT charge_detail_id 
	   FROM cms_charge_detail, si_temp_arbs_co017
	  WHERE cms_act_col_id = cms_collateral_id
			AND SOURCE_ID = 'ARBS'
	    AND security_rank = ranking_of_security
	    AND t.ranking_of_security = ranking_of_security
	    AND t.cms_stg_col_id = cms_stg_col_id
		AND is_valid = 'Y'
		FETCH FIRST ROW ONLY);
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 13);
	COMMIT;

	UPDATE cms_stage_charge_detail a SET (charge_amount, charge_currency_code, cms_ref_id) =
	(SELECT charge_amount, charge_currency_code, cms_ref_id
	   FROM SESSION.stage_charge_info
	  WHERE a.charge_detail_id = cms_chrg_dtl_id);
	
	DROP TABLE SESSION.stage_charge_info;
	
	call si_runstats('CMS_STAGE_CHARGE_DETAIL');
	   				  
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 14);
	COMMIT;
						   
	-------------------------------
	-- Staging Table
	-- CMS_STAGE_LIMIT_CHARGE_MAP
	--
	-------------------------------
	lock table cms_stage_limit_charge_map in share mode;
	
-- 	INSERT INTO cms_stage_limit_charge_map (limit_charge_map_id, cms_lsp_appr_lmts_id, charge_id, charge_detail_id, cms_collateral_id, 
-- 									  		status, customer_category, cms_lsp_lmt_profile_id)
-- 	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_charge_map_seq), 2)) as BIGINT),
-- 			cms_act_lmt_id, cms_act_chrg_id, charge_detail_id, cms_collateral_id, 'ACTIVE', 'MB', t.cms_act_aa_id
-- 	   FROM si_temp_arbs_co017 t, cms_stage_charge_detail chrg
-- 	  WHERE t.cms_stg_col_id = chrg.cms_collateral_id
-- 	    AND ranking_of_security = chrg.security_rank
-- 			AND chrg.SOURCE_ID = 'ARBS'
-- 			AND is_valid = 'Y'
-- 	    AND NOT EXISTS (SELECT '1' FROM cms_stage_limit_charge_map m
-- 	  					 WHERE m.cms_lsp_appr_lmts_id=t.cms_act_lmt_id
-- 	  					   AND m.cms_collateral_id=t.cms_stg_col_id
-- 	  					   AND m.charge_id=t.cms_act_chrg_id
-- 	  					   AND m.charge_detail_id=chrg.charge_detail_id));
	  					   
	INSERT INTO cms_stage_limit_charge_map (limit_charge_map_id, cms_lsp_appr_lmts_id, charge_id, charge_detail_id, cms_collateral_id, 
									  		status, customer_category, cms_lsp_lmt_profile_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR limit_charge_map_seq), 2)) as BIGINT),
			cms_act_lmt_id, cms_act_chrg_id, cms_stg_chrg_dtl_id, cms_stg_col_id, 'ACTIVE', 'MB', t.cms_act_aa_id
	   FROM si_temp_arbs_co017 t
	  WHERE is_valid = 'Y'
	    AND NOT EXISTS (SELECT '1' FROM cms_stage_limit_charge_map m
	  					 WHERE m.cms_lsp_appr_lmts_id=t.cms_act_lmt_id
	  					   AND m.cms_collateral_id=t.cms_stg_col_id
	  					   AND m.charge_id=t.cms_act_chrg_id
	  					   AND m.charge_detail_id = t.cms_stg_chrg_dtl_id));	  					   
		
	call si_runstats('cms_stage_limit_security_map');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 15);
	COMMIT;
	
	lock table cms_stage_limit_security_map in share mode;
	UPDATE cms_stage_limit_security_map A1 
		SET charge_amount = (SELECT charge_amt 
									FROM si_temp_arbs_co017 
								WHERE cms_stg_chrg_id = A1.charge_id
								  --AND cms_act_col_id = A1.cms_collateral_id
									--AND cms_stg_lmt_id = A1.cms_lsp_appr_lmts_id
									AND is_valid = 'Y') 
	WHERE A1.SOURCE_ID = 'ARBS' 
		AND EXISTS (SELECT '1' 
					FROM si_temp_arbs_co017 
					WHERE cms_stg_chrg_id = charge_id 
					  	--AND cms_act_col_id = A1.cms_collateral_id
						--AND cms_stg_lmt_id = A1.cms_lsp_appr_lmts_id
						AND is_valid = 'Y');


	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 16);
	COMMIT;
	
	------------------------------------
	-- Tag DELETED for non-exist records
	-- ACTUAL Table
	-- CMS_CHARGE_DETAIL
	--
	-------------------------------------
	
	DECLARE GLOBAL TEMPORARY TABLE SESSION.actual_charge_info
		( cms_chrg_dtl_id BIGINT) 
		WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED;
	
-- 	insert into session.actual_charge_info
-- 	(select distinct charge_detail_id
-- 	from cms_charge_detail chrg, si_temp_arbs_co017
-- 	where chrg.cms_collateral_id = cms_act_col_id
-- 	and ranking_of_security = security_rank
-- 	and chrg.source_id = 'ARBS'
-- 	and chrg.status = 'ACTIVE'
-- 	and is_valid = 'Y');
	
	insert into session.actual_charge_info
	(select distinct cms_act_chrg_dtl_id
	from si_temp_arbs_co017
	where is_valid = 'Y');
		
	create index session.act_chrg_info_idx on session.actual_charge_info (cms_chrg_dtl_id asc) allow reverse scans;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 1701);	
	commit;
	
	lock table cms_charge_detail in share mode;
-- 	UPDATE cms_charge_detail a SET status = 'DELETED'
-- 	  WHERE a.SOURCE_ID = 'ARBS'
-- 			AND status = 'ACTIVE'
-- 			AND NOT EXISTS (SELECT '1' FROM si_temp_arbs_co017
-- 	  				 WHERE a.cms_collateral_id = cms_act_col_id
-- 	    			   AND ranking_of_security = security_rank
-- 					   and is_valid = 'Y');

	UPDATE cms_charge_detail a SET status = 'DELETED'
	  WHERE a.SOURCE_ID = 'ARBS'
			AND status = 'ACTIVE'
			AND NOT EXISTS (SELECT '1' 
					FROM session.actual_charge_info
	  				 WHERE a.charge_detail_id = cms_chrg_dtl_id);

	  				 
	drop table session.actual_charge_info;
	  				 
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 17);
	COMMIT;
	
	------------------------------------
	-- Tag DELETED for non-exist records
	-- ACTUAL Table
	-- CMS_LIMIT_CHARGE_MAP
	--
	------------------------------------
	-- need to handle revived limit charge map
	lock table cms_limit_charge_map in share mode;
	update cms_limit_charge_map a
	set status = 'ACTIVE'
	WHERE status = 'DELETED'
		AND exists (select '1' from cms_charge_detail b
				where a.charge_detail_id = b.CHARGE_DETAIL_ID
				and b.SOURCE_ID = 'ARBS'
				and b.STATUS = 'ACTIVE');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 171);
	COMMIT;
	
	lock table cms_limit_charge_map in share mode;
	update cms_limit_charge_map a
	set status = 'DELETED'
	WHERE status = 'ACTIVE'
		AND exists (select '1' from cms_charge_detail b
				where a.charge_detail_id = b.CHARGE_DETAIL_ID
				and b.SOURCE_ID = 'ARBS'
				and b.STATUS = 'DELETED');
				
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 18);
	COMMIT;
	
	-------------------------------------
	-- Tag DELETED for non-exist records
	-- Staging Table
	-- CMS_STAGE_CHARGE_DETAIL
	--
	-------------------------------------
	lock table cms_stage_charge_detail in share mode;

-- 	UPDATE cms_stage_charge_detail A1 
-- 		SET status = 'DELETED' 
-- 	WHERE A1.SOURCE_ID = 'ARBS' 
-- 		AND status = 'ACTIVE' 
-- 		AND NOT EXISTS (SELECT '1' 
-- 						FROM si_temp_arbs_co017 
-- 						WHERE cms_stg_col_id = A1.cms_collateral_id 
-- 							AND ranking_of_security = A1.security_rank 
-- 							AND is_valid = 'Y')
-- 		and exists (select '1'
-- 					from transaction 
-- 					where transaction_type = 'COL'
-- 					and staging_reference_id = A1.cms_collateral_id); 

	UPDATE cms_stage_charge_detail A1 
		SET status = 'DELETED' 
	WHERE A1.SOURCE_ID = 'ARBS' 
		AND status = 'ACTIVE' 
		AND NOT EXISTS (SELECT '1' 
						FROM si_temp_arbs_co017 
						WHERE cms_stg_chrg_dtl_id = A1.CHARGE_DETAIL_ID
							AND is_valid = 'Y')
		and exists (select '1'
					from transaction 
					where transaction_type = 'COL'
					and staging_reference_id = A1.cms_collateral_id); 
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 19);
	COMMIT;

	------------------------------------
	-- Tag DELETED for non-exist records
	-- Staging Table
	-- CMS_STAGE_LIMIT_CHARGE_MAP
	--
	--------------------------------------	
-- 	UPDATE cms_stage_limit_charge_map a SET status = 'DELETED'
-- 	 	WHERE status = 'ACTIVE'
-- 	 		AND NOT EXISTS (SELECT 1 FROM si_temp_arbs_co017 t, cms_stage_charge_detail chrg
-- 	 				WHERE t.cms_act_col_id = chrg.cms_collateral_id
-- 						AND t.cms_act_chrg_id = a.charge_id
-- 	 				  AND t.cms_act_lmt_id = a.cms_lsp_appr_lmts_id
-- 					  AND t.cms_stg_col_id = a.cms_collateral_id
-- 						AND chrg.charge_detail_id = a.charge_detail_id
-- 						AND chrg.SOURCE_ID='ARBS'
-- 				    AND t.is_valid = 'Y');

	-- need to handle revived stage limit charge map
	lock table cms_stage_limit_charge_map in share mode;
	update cms_stage_limit_charge_map a
	set status = 'ACTIVE'
	WHERE status = 'DELETED'
		AND exists (select '1' from cms_stage_charge_detail b
				where a.charge_detail_id = b.CHARGE_DETAIL_ID
				and b.SOURCE_ID = 'ARBS'
				and b.STATUS = 'ACTIVE');

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 191);
	COMMIT;
	
	lock table cms_stage_limit_charge_map in share mode;
	update cms_stage_limit_charge_map a
	set status = 'DELETED'
	WHERE status = 'ACTIVE'
		AND exists (select '1' from cms_stage_charge_detail b
				where a.charge_detail_id = b.CHARGE_DETAIL_ID
				and b.SOURCE_ID = 'ARBS'
				and b.STATUS = 'DELETED');
				
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO017', 'ARBS', 0);
	
END@

CREATE PROCEDURE si_run_temp_arbs_co018
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO018', 'ARBS', 1);
	COMMIT;
	
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT relationship_with_borrower_cod code, relationship_with_borrower_des desc,
			   relationship_with_borrower_cat cat, 'ARBS' source_id
		  FROM si_temp_arbs_co018
		 WHERE relationship_with_borrower_cod <> ''
		   AND relationship_with_borrower_des <> ''
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO018', 'ARBS', 2);
	COMMIT;
	
	---------------------------------------------------
	-- SI Temp Table
	-- si_temp_arbs_co018
	-- Set CMS Key (Col and Pldgr)
	---------------------------------------------------
	UPDATE si_temp_arbs_co018 t SET cms_pldgr_id = 
	(SELECT cms_pledgor_dtl_id FROM sci_pledgor_dtl
	  WHERE plg_le_id = t.pledgor_cif_id
		AND source_id = 'ARBS')
	 WHERE is_valid = 'Y';
	 
	COMMIT;

	UPDATE si_temp_arbs_co018 t SET cms_act_col_id = 
	(SELECT cms_collateral_id FROM cms_security
	  WHERE sci_security_dtl_id = t.security_id
		AND source_id = 'ARBS')
	 WHERE is_valid = 'Y';
		
	COMMIT;
		
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO018', 'ARBS', 3);
	COMMIT;
	
	------------------------------------
	-- Due to M-M relationship in co018
	--
	------------------------------------

	DELETE FROM si_temp_arbs_co018_plg;
	
	INSERT INTO si_temp_arbs_co018_plg (pledgor_cif_id, pledgor_cif_source, pledgor_legal_name)
	(SELECT DISTINCT pledgor_cif_id, pledgor_cif_source, pledgor_legal_name
	   FROM si_temp_arbs_co018 t
	  WHERE is_valid = 'Y'
	    AND cms_pldgr_id IS NULL);
	    
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO018', 'ARBS', 4);
	COMMIT;

	---------------------------------------------------
	-- Actual Table
	-- sci_pledgot_dtl
	--
	---------------------------------------------------
	UPDATE sci_pledgor_dtl a SET (plg_legal_name, UPDATE_STATUS_IND, LAST_UPDATE_DATE, PLG_INC_NUM_TEXT) =
	(SELECT pledgor_legal_name, UPDATE_STATUS_IND, current_timestamp,
		(select LMP_INC_NUM_TEXT from sci_le_main_profile 
			WHERE lmp_le_id = pledgor_cif_id and SOURCE_ID = 'ARBS')
	  FROM si_temp_arbs_co018
	  WHERE cms_pldgr_id = a.cms_pledgor_dtl_id
		and is_valid = 'Y'
	  FETCH FIRST 1 ROW ONLY)
	 WHERE source_id = 'ARBS'
	   AND EXISTS (SELECT '1' FROM si_temp_arbs_co018
	   				WHERE a.cms_pledgor_dtl_id = cms_pldgr_id
					  AND is_valid = 'Y');

	COMMIT;					  

	INSERT INTO sci_pledgor_dtl (cms_pledgor_dtl_id, plg_le_id, plg_le_id_src_num, plg_le_id_src_value, 
							 	 plg_legal_name, source_id, UPDATE_STATUS_IND, CREATE_DATE, PLG_INC_NUM_TEXT)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 2)) as BIGINT),
	 		pledgor_cif_id, '37', pledgor_cif_source, pledgor_legal_name, 'ARBS', 'I', current_timestamp,
			(select LMP_INC_NUM_TEXT from sci_le_main_profile 
				WHERE pledgor_cif_id = lmp_le_id and SOURCE_ID = 'ARBS')
	   FROM si_temp_arbs_co018_plg);
	   
	CALL SI_RUNSTATS('SCI_PLEDGOR_DTL');
		   
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO018', 'ARBS', 5);
	
	COMMIT;
		
	---------------------------------------------------
	-- SI Temp Table
	-- si_temp_arbs_co018 
	-- Set CMS Key (Pldgr) after insert 
	---------------------------------------------------
	lock table si_temp_arbs_co018 in exclusive mode;
	UPDATE si_temp_arbs_co018 t SET cms_pldgr_id = 
	(SELECT cms_pledgor_dtl_id FROM sci_pledgor_dtl
	  WHERE plg_le_id = t.pledgor_cif_id
		AND source_id = 'ARBS')
	where is_valid = 'Y'
	and cms_pldgr_id is null;

	---------------------------------------------------
	-- Actual Table
	-- sci_sec_pldgr_map
	--
	---------------------------------------------------
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO018', 'ARBS', 6);
	COMMIT;

	lock table sci_sec_pldgr_map in share mode;
	UPDATE sci_sec_pldgr_map a SET (sec_pledgor_relationship_num, sec_pledgor_relationship_value, update_status_ind)=
	(SELECT relationship_with_borrower_cat, relationship_with_borrower_cod, update_stat_ind
	   FROM si_temp_arbs_co018 t
	  WHERE a.cms_collateral_id = cms_act_col_id
		AND a.cms_pledgor_dtl_id = cms_pldgr_id
		and is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_co018
	  				 WHERE a.cms_collateral_id = cms_act_col_id
					   AND a.cms_pledgor_dtl_id = cms_pldgr_id
					   AND is_valid = 'Y');
					   
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO018', 'ARBS', 61);
	COMMIT;

	INSERT INTO sci_sec_pldgr_map (cms_sec_pldgr_map_id, spm_sec_id, cms_pledgor_dtl_id, cms_collateral_id,
								   sec_pledgor_relationship_num, sec_pledgor_relationship_value, update_status_ind, source_id)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR col_pledgor_map_seq), 2)) as BIGINT),
			security_id, cms_pldgr_id, cms_act_col_id, relationship_with_borrower_cat, relationship_with_borrower_cod, 
			update_stat_ind, 'ARBS'
	   FROM si_temp_arbs_co018 t
	  WHERE NOT EXISTS (SELECT '1' FROM sci_sec_pldgr_map
	  					 WHERE cms_collateral_id = cms_act_col_id
						   AND cms_pledgor_dtl_id = cms_pldgr_id)
		AND is_valid = 'Y'
		AND cms_act_col_id IS NOT NULL
		AND cms_pldgr_id IS NOT NULL);
				
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CO018', 'ARBS', 0);
END
@

CREATE PROCEDURE SI_RUN_TEMP_ARBS_PF003
	LANGUAGE SQL
BEGIN
	DECLARE v_feed_grp BIGINT;
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_PF003', 'ARBS', 1);
	commit;
	
	select feed_group_id into v_feed_grp from cms_feed_group where group_type = 'FOREX';
	
	-------------------------------------
	-- Actual Table
	-- sci_currency
	--
	-------------------------------------
	update sci_currency a set(
		cur_crrncy_desc,
		LAST_UPDATE_DATE,
		UPDATE_STATUS_IND
		)=
	(select CURRENCY_DESC, current_timestamp, 'U'
		FROM si_temp_arbs_pf003 t
	  WHERE t.CURRENCY_CODE = a.cur_crrncy_iso_code 
			and TRIM(t.CURRENCY_DESC) <> a.CUR_CRRNCY_DESC FETCH FIRST 1 ROW ONLY)
		where exists (select '1' FROM si_temp_arbs_pf003 t
	  					WHERE t.CURRENCY_CODE = a.cur_crrncy_iso_code 
								and TRIM(t.CURRENCY_DESC) <> a.CUR_CRRNCY_DESC AND t.is_valid = 'Y');

	-------------------------------------
	-- Actual Table
	-- CMS_FOREX
	--
	-------------------------------------
	
	UPDATE cms_forex a SET (	
		--BUY_CURRENCY,
		--SELL_CURRENCY,
		BUY_RATE,
		EFFECTIVE_DATE,
		SELL_RATE,
		feed_group_id
		) =
	(SELECT
		--CURRENCY_CODE,
		--CURRENCY_CODE,
		BUY_RATE,
		CURRENT_TIMESTAMP,
		BUY_RATE,
		v_feed_grp
	   FROM si_temp_arbs_pf003 t
	  WHERE t.CURRENCY_CODE = a.BUY_CURRENCY AND t.is_valid = 'Y' FETCH FIRST 1 ROW ONLY)
	 WHERE EXISTS (SELECT '1' FROM si_temp_arbs_pf003 t
	  				WHERE t.CURRENCY_CODE = a.BUY_CURRENCY AND t.is_valid = 'Y');

	INSERT INTO cms_forex (
		FEED_ID,
		BUY_CURRENCY,
		SELL_CURRENCY,
		BUY_RATE,
		EFFECTIVE_DATE,
		SELL_RATE,
		feed_group_id,
		feed_ref
		)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cms_forex_seq), 2)) as BIGINT),
		CURRENCY_CODE,
		'MYR',
		BUY_RATE,
		CURRENT_TIMESTAMP,
		BUY_RATE,
		v_feed_grp,
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cms_forex_seq), 2)) as BIGINT)
	   FROM si_temp_arbs_pf003 t
	  WHERE NOT EXISTS (SELECT '1' FROM cms_forex
	  					 WHERE t.CURRENCY_CODE = BUY_CURRENCY) AND t.is_valid = 'Y');

	-------------------------------------
	-- Actual Table
	-- CMS_FOREX_HISTORY
	--
	-------------------------------------

	INSERT INTO cms_forex_history (
		HISTORY_ID,
		BUY_CURRENCY,
		SELL_CURRENCY,
		BUY_RATE,
		EFFECTIVE_DATE,
		SELL_RATE,
		feed_group_id,
		feed_ref)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cms_forex_history_seq), 2)) as BIGINT),
		CURRENCY_CODE,
		'MYR',
		BUY_RATE,
		CURRENT_TIMESTAMP,
		BUY_RATE,
		v_feed_grp,
		CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR cms_forex_history_seq), 2)) as BIGINT)
	   FROM si_temp_arbs_pf003 t where t.is_valid = 'Y');
		 
		CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_PF003', 'ARBS', 0);
END@


CREATE PROCEDURE SI_RUN_TEMP_ARBS_CA019
	LANGUAGE SQL
BEGIN

	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA019', 'ARBS', 1);
	commit;
	-------------------------------------
	-- Auto Feed Std Code
	-- COMMON_CODE_CATEGORY_ENTRY
	--
	-------------------------------------

	FOR cur_std_code AS
		SELECT DISTINCT CAR_CODE code, CAR_DESC desc,
			   CAR_CAT cat, 'ARBS' source_id
		  FROM si_temp_arbs_ca019
		 WHERE LENGTH(CAR_CODE) > 0
		   AND LENGTH(CAR_DESC) > 0
	DO
		CALL si_auto_feed_standard_code(cur_std_code.code, cur_std_code.desc, cur_std_code.cat, cur_std_code.source_id);
	END FOR;

	-------------------------------------
	-- Actual Table
	-- cms_npl
	--
	-------------------------------------
	
	UPDATE cms_npl a SET (	
		ACCOUNT_NUMBER,
		NPL_BCA_REF_NUM,
		DELINQUENT,
		ACCOUNT_STATUS,
		PART_PAYMENT_RECEIVED,
		DATE_CURRENT_DOUBTFUL,
		DATE_REGULARISED,
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
		FACILITY_CODE,
		FACILITY_SEQ,
		SPECIFIC_PROVISION,
		CAR_CODE,
		LATE_CHARGE_IN_SUSPENSE,
		CAR_CODE_STAT_DATE,
		AMT_PARTIALLY_WRITTEN_OFF) =
	(SELECT
		ACCT_NUMBER,
		AA_NUMBER,
		DELINQUENT_IND,
		ACCT_STAT,
		PART_PAYMENT,
		LATEST_DATE_DOUBTFUL,
		DATE_REGULARISED,
		INTEREST_IN_SUSPENSE,
		AMT_WRITTEN_OFF,
		JUDGMENT_DATE,
		JUDGMENT_SUM,
		DATE_WRITE_OFF,
		MONTHS_INSTALLMENT_ARREARS,
		MONTHS_INTEREST_ARREARS,
		NPL_STAT,
		NPL_STAT_DATE,
		'ARBS',
		FACILITY_CODE,
		FACILITY_SEQ,
		SPECIFIC_PROV_CHARGED_TO_ACCT,
		CAR_CODE,
		LATE_CHARGE_IN_SUSPENSE,
		CAR_CODE_STAT_DATE,
		AMT_PARTIALLY_WRITTEN_OFF
	   FROM si_temp_arbs_ca019 t
	  WHERE t.AA_NUMBER = a.NPL_BCA_REF_NUM and a.SOURCE_ID = 'ARBS' and a.ACCOUNT_NUMBER=t.ACCT_NUMBER AND t.is_valid = 'Y')
	  WHERE EXISTS (SELECT '1' FROM si_temp_arbs_ca019 t
	  	WHERE t.AA_NUMBER = a.NPL_BCA_REF_NUM and a.SOURCE_ID='ARBS' and a.ACCOUNT_NUMBER=t.ACCT_NUMBER AND t.is_valid = 'Y')
		and a.SOURCE_ID='ARBS';

	insert into cms_npl(
		CMS_NPL_ID,
		ACCOUNT_NUMBER,
		NPL_BCA_REF_NUM,
		DELINQUENT,
		ACCOUNT_STATUS,
		PART_PAYMENT_RECEIVED,
		DATE_CURRENT_DOUBTFUL,
		DATE_REGULARISED,
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
		FACILITY_CODE,
		FACILITY_SEQ,
		SPECIFIC_PROVISION,
		CAR_CODE,
		LATE_CHARGE_IN_SUSPENSE,
		CAR_CODE_STAT_DATE,
		AMT_PARTIALLY_WRITTEN_OFF)
	(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR NPL_SEQ), 2)) as BIGINT),
		ACCT_NUMBER,
		AA_NUMBER,
		DELINQUENT_IND,
		ACCT_STAT,
		PART_PAYMENT,
		LATEST_DATE_DOUBTFUL,
		DATE_REGULARISED,
		INTEREST_IN_SUSPENSE,
		AMT_WRITTEN_OFF,
		JUDGMENT_DATE,
		JUDGMENT_SUM,
		DATE_WRITE_OFF,
		MONTHS_INSTALLMENT_ARREARS,
		MONTHS_INTEREST_ARREARS,
		NPL_STAT,
		NPL_STAT_DATE,
		'ARBS',
		FACILITY_CODE,
		FACILITY_SEQ,
		SPECIFIC_PROV_CHARGED_TO_ACCT,
		CAR_CODE,
		LATE_CHARGE_IN_SUSPENSE,
		CAR_CODE_STAT_DATE,
		AMT_PARTIALLY_WRITTEN_OFF
	   FROM si_temp_arbs_ca019 t
			WHERE NOT EXISTS (SELECT 1 FROM cms_npl WHERE NPL_BCA_REF_NUM=t.AA_NUMBER and ACCOUNT_NUMBER=t.ACCT_NUMBER and source_id = 'ARBS')
				AND EXISTS (SELECT 1 FROM sci_lsp_sys_xref WHERE LSX_BCA_REF_NUM=t.AA_NUMBER 
					and LSX_EXT_SYS_CODE_VALUE = 'ARBS'
					AND LSX_EXT_SYS_ACCT_NUM = t.ACCT_NUMBER)
			AND t.is_valid = 'Y');
	
	
	-------------------------------------
	-- Update SYS REF table from CMS_NPL status
	-- sci_lsp_sys_xref
	--
	-------------------------------------
	update sci_lsp_sys_xref a set ACCT_DELQ_IND = 
	(SELECT NPL_STAT FROM si_temp_arbs_ca019 t 
		WHERE a.LSX_BCA_REF_NUM=t.AA_NUMBER AND a.LSX_EXT_SYS_CODE_VALUE = 'ARBS'
			AND a.LSX_EXT_SYS_ACCT_NUM = t.ACCT_NUMBER
			AND t.NPL_STAT in ('Y', 'N') AND t.is_valid = 'Y')
	 WHERE EXISTS (SELECT '1' FROM si_temp_arbs_ca019 t
			WHERE a.LSX_BCA_REF_NUM=t.AA_NUMBER and a.LSX_EXT_SYS_CODE_VALUE = 'ARBS'
				AND a.LSX_EXT_SYS_ACCT_NUM = t.ACCT_NUMBER
				AND t.NPL_STAT in ('Y', 'N') AND t.is_valid = 'Y');
	
	CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_ARBS_CA019', 'ARBS', 0);
		
END@


CREATE PROCEDURE SI_RUN_ALL_ARBS
	LANGUAGE SQL
BEGIN
	DECLARE v_load_type VARCHAR(50) DEFAULT 'FULL';
	DECLARE v_count INTEGER;
		
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_cu001;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_ARBS_CU001;
		call SI_RUN_TEMP_ARBS_CU001;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_cu001');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_cu002;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_ARBS_CU002;
		call SI_RUN_TEMP_ARBS_CU002;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_cu002');
	END IF;

  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_cu003;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_ARBS_CU003;
		call SI_RUN_TEMP_ARBS_CU003;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_cu003');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_ca001;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_ARBS_CA001;
		call SI_RUN_TEMP_ARBS_CA001;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_ca001');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_ca002;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_ARBS_CA002;
		call SI_RUN_TEMP_ARBS_CA002;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_ca002');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_ca003;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_ARBS_CA003;
		call SI_RUN_TEMP_ARBS_CA003;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_ca003');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_ca004;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_ARBS_CA004;
		call SI_RUN_TEMP_ARBS_CA004;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_ca004');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_ca019;
	IF v_count > 0 THEN
		call SI_VALIDATE_TEMP_ARBS_CA019;
		call SI_RUN_TEMP_ARBS_CA019;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_ca019');
	END IF;

  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_pf003;
	IF v_count > 0 THEN	
		call SI_VALIDATE_TEMP_ARBS_PF003;
		call SI_RUN_TEMP_ARBS_PF003;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_pf003');
	END IF;

  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co001;
	IF v_count > 0 THEN	
		call SI_VALIDATE_TEMP_ARBS_CO001;
		call SI_GET_LOAD_TYPE('SI_RUN_TEMP_ARBS_CO001',v_load_type);
		call SI_RUN_TEMP_ARBS_CO001(v_load_type);
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co001');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co002;
	IF v_count > 0 THEN		
		call SI_VALIDATE_TEMP_ARBS_CO002;
		call SI_GET_LOAD_TYPE('SI_RUN_TEMP_ARBS_CO002',v_load_type);
		call SI_RUN_TEMP_ARBS_CO002(v_load_type);
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co002');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co003;
	IF v_count > 0 THEN		
		call SI_VALIDATE_TEMP_ARBS_CO003;
		call SI_GET_LOAD_TYPE('SI_RUN_TEMP_ARBS_CO003',v_load_type);
		call SI_RUN_TEMP_ARBS_CO003(v_load_type);
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co003');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co004;
	IF v_count > 0 THEN		
		call SI_VALIDATE_TEMP_ARBS_CO004;
		call SI_GET_LOAD_TYPE('SI_RUN_TEMP_ARBS_CO004',v_load_type);
		call SI_RUN_TEMP_ARBS_CO004(v_load_type);
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co004');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co005;
	IF v_count > 0 THEN		
		call SI_VALIDATE_TEMP_ARBS_CO005;
		call SI_GET_LOAD_TYPE('SI_RUN_TEMP_ARBS_CO005',v_load_type);
		call SI_RUN_TEMP_ARBS_CO005(v_load_type);
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co005');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co006;
	IF v_count > 0 THEN		
		call SI_VALIDATE_TEMP_ARBS_CO006;
		call SI_RUN_TEMP_ARBS_CO006;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co006');
	END IF;

  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co007;
	IF v_count > 0 THEN		
		call SI_VALIDATE_TEMP_ARBS_CO007;
		call SI_RUN_TEMP_ARBS_CO007;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co007');
	END IF;

  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co008;
	IF v_count > 0 THEN		
		call SI_VALIDATE_TEMP_ARBS_CO008;
		call SI_RUN_TEMP_ARBS_CO008;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co008');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co009;
	IF v_count > 0 THEN		
		call SI_VALIDATE_TEMP_ARBS_CO009;
		call SI_GET_LOAD_TYPE('SI_RUN_TEMP_ARBS_CO009',v_load_type);
		call SI_RUN_TEMP_ARBS_CO009(v_load_type);
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co009');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co010;
	IF v_count > 0 THEN		
		call SI_VALIDATE_TEMP_ARBS_CO010;
		call SI_GET_LOAD_TYPE('SI_RUN_TEMP_ARBS_CO010',v_load_type);
		call SI_RUN_TEMP_ARBS_CO010(v_load_type);
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co010');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co011;
	IF v_count > 0 THEN		
		call SI_VALIDATE_TEMP_ARBS_CO011;
		call SI_GET_LOAD_TYPE('SI_RUN_TEMP_ARBS_CO011',v_load_type);
		call SI_RUN_TEMP_ARBS_CO011(v_load_type);
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co011');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co012;
	IF v_count > 0 THEN		
		call SI_VALIDATE_TEMP_ARBS_CO012;
		call SI_GET_LOAD_TYPE('SI_RUN_TEMP_ARBS_CO012',v_load_type);
		call SI_RUN_TEMP_ARBS_CO012(v_load_type);
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co012');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co013;
	IF v_count > 0 THEN		
		call SI_VALIDATE_TEMP_ARBS_CO013;
		call SI_GET_LOAD_TYPE('SI_RUN_TEMP_ARBS_CO013',v_load_type);
		call SI_RUN_TEMP_ARBS_CO013(v_load_type);
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co013');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co014;
	IF v_count > 0 THEN		
		call SI_VALIDATE_TEMP_ARBS_CO014;
		call SI_GET_LOAD_TYPE('SI_RUN_TEMP_ARBS_CO014',v_load_type);
		call SI_RUN_TEMP_ARBS_CO014(v_load_type);
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co014');
	END IF;
	
	call SI_AUTO_CREATE_TRANSACTION;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_ca005;
	IF v_count > 0 THEN		
		call SI_VALIDATE_TEMP_ARBS_CA005;
		call SI_RUN_TEMP_ARBS_CA005;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_ca005');
	END IF;
		
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co015;
	IF v_count > 0 THEN		
		call SI_VALIDATE_TEMP_ARBS_CO015;
		call SI_RUN_TEMP_ARBS_CO015;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co015');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co016;
	IF v_count > 0 THEN		
		call SI_VALIDATE_TEMP_ARBS_CO016;
		call SI_RUN_TEMP_ARBS_CO016;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co016');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co017;
	IF v_count > 0 THEN	
		call SI_VALIDATE_TEMP_ARBS_CO017;
		call SI_RUN_TEMP_ARBS_CO017;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co017');
	END IF;
	
  SELECT COUNT(*) INTO v_count FROM si_temp_arbs_co018;
	IF v_count > 0 THEN	
		call SI_VALIDATE_TEMP_ARBS_CO018;
		call SI_RUN_TEMP_ARBS_CO018;
		call UTIL_TRUNCATE_TABLE('si_temp_arbs_co018');
	END IF;
END
@

commit work@
