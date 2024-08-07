-- SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM, EONCMS_LOCAL@
-- DROP PROCEDURE SI_RUN_CUSTOMER_FUSION@

CREATE PROCEDURE SI_RUN_CUSTOMER_FUSION
		LANGUAGE SQL
	BEGIN
	
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 1);
		commit;	
		
		-- soft delete when normalized CIF found in same facility 
		update CMS_FAC_RELATIONSHIP a set a.status = 'D' where 
		exists (select 1 from CMS_BATCH_CIF_FUSION b where a.CIF_NUMBER = b.OLD_LE_ID and b.PROCESSED_IND = 'N' 
			and exists (select 1 from CMS_FAC_RELATIONSHIP c where a.CMS_FAC_MASTER_ID = c.CMS_FAC_MASTER_ID 
			and c.CIF_NUMBER = b.NEW_LE_ID
			and (c.status <> 'D' or c.status is null)))
		and (a.status is null or a.status <> 'D');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 2);
		commit;
		
		-- stg: soft delete when normalized CIF found in same facility 
		update CMS_STG_FAC_RELATIONSHIP a set a.status = 'D' 
		where exists (select 1 from CMS_BATCH_CIF_FUSION b where a.CIF_NUMBER = b.OLD_LE_ID and b.PROCESSED_IND = 'N' 
			and exists (select 1 from CMS_STG_FAC_RELATIONSHIP c where a.CMS_FAC_MASTER_ID = c.CMS_FAC_MASTER_ID 
			and c.CIF_NUMBER = b.NEW_LE_ID
			and (c.status <> 'D' or c.status is null)))
		and (a.status is null or a.status <> 'D')		
		and exists(select 1 from transaction where STAGING_REFERENCE_ID = a.CMS_FAC_MASTER_ID and transaction_type = 'FACILITY');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 3);
		commit;
		
		-- normalize with new CIF when new CIF not exists in same facility relationship
		update CMS_FAC_RELATIONSHIP a set a.CIF_NUMBER = (select NEW_LE_ID from CMS_BATCH_CIF_FUSION b where a.CIF_NUMBER = b.OLD_LE_ID and b.PROCESSED_IND = 'N') 
		where exists (select 1 from CMS_BATCH_CIF_FUSION b where a.CIF_NUMBER = b.OLD_LE_ID and b.PROCESSED_IND = 'N')
		and (a.status is null or a.status <> 'D');		

		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 4);
		commit;
		
		-- stg: normalize with new CIF when new CIF not exists in same facility relationship
		update CMS_STG_FAC_RELATIONSHIP a set a.CIF_NUMBER = (select NEW_LE_ID from CMS_BATCH_CIF_FUSION b where a.CIF_NUMBER = b.OLD_LE_ID and b.PROCESSED_IND = 'N') 
		where exists (select 1 from CMS_BATCH_CIF_FUSION b where a.CIF_NUMBER = b.OLD_LE_ID and b.PROCESSED_IND = 'N')
		and (a.status is null or a.status <> 'D')
		and exists(select 1 from transaction where STAGING_REFERENCE_ID = a.CMS_FAC_MASTER_ID and transaction_type = 'FACILITY');

		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 5);
		commit;	
		
		-- update stp trans for delete fac relationship to complete if exists
		update STP_TRANS set (status, RESPONSE_CODE, LAST_UPDATE_DATE) = ('SUCCESS', 'AA', CURRENT_TIMESTAMP)
		where TRX_TYPE = '342' and exists (select 1 from CMS_FAC_RELATIONSHIP a where a.status = 'D' and a.ID = REFERENCE_ID 
			and exists (select 1 from CMS_BATCH_CIF_FUSION b where a.CIF_NUMBER = b.OLD_LE_ID and b.PROCESSED_IND = 'N')
			and exists (select 1 from CMS_FAC_RELATIONSHIP c where a.CMS_FAC_MASTER_ID = c.CMS_FAC_MASTER_ID 
				and exists (select 1 from CMS_BATCH_CIF_FUSION d where d.NEW_LE_ID = c.CIF_NUMBER and d.PROCESSED_IND = 'N')));

		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 6);
		commit;	
		
		INSERT into STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
		(SELECT CAST(TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2) AS BIGINT), 
						MASTER_TRX_ID, '342', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS', 1, 'AA', a.ID, 'DELETE',
						CAST(TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2) AS BIGINT)
				from CMS_FAC_RELATIONSHIP a, STP_TRANS b where a.status = 'D' and a.ID = b.REFERENCE_ID and b.TRX_TYPE = '322'
			and exists (select 1 from CMS_BATCH_CIF_FUSION b where a.CIF_NUMBER = b.OLD_LE_ID and b.PROCESSED_IND = 'N')
			and exists (select 1 from CMS_FAC_RELATIONSHIP c where a.CMS_FAC_MASTER_ID = c.CMS_FAC_MASTER_ID 
				and exists (select 1 from CMS_BATCH_CIF_FUSION d where d.NEW_LE_ID = c.CIF_NUMBER and d.PROCESSED_IND = 'N')));
					
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 7);
		commit;		

		update SCI_LE_MAIN_PROFILE a SET a.UPDATE_STATUS_IND = 'D' where a.UPDATE_STATUS_IND <> 'D' and a.SOURCE_ID = 'SIBS' 
		and exists (select 1 from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LMP_LE_ID and b.PROCESSED_IND = 'N'
			and exists (select 1 from SCI_LE_MAIN_PROFILE c where c.LMP_LE_ID = b.NEW_LE_ID and c.SOURCE_ID = 'SIBS'));

		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 8);
		commit;			
		
		update SCI_LE_SUB_PROFILE a SET a.UPDATE_STATUS_IND = 'D' where a.UPDATE_STATUS_IND <> 'D'
		and exists (select 1 from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LSP_LE_ID and b.PROCESSED_IND = 'N'
			and exists (select 1 from SCI_LE_SUB_PROFILE c where c.LSP_LE_ID = b.NEW_LE_ID));		

		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 9);
		commit;		
		
		-- normalize sub profile LE ID with new CIF with condition new sub profile dont exists
		update SCI_LE_SUB_PROFILE a set a.LSP_LE_ID = (select NEW_LE_ID from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LSP_LE_ID and b.PROCESSED_IND = 'N')
		where a.UPDATE_STATUS_IND <> 'D'
		and exists (select 1 from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LSP_LE_ID and b.PROCESSED_IND = 'N');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 10);
		commit;				
		
		update SCI_LE_CREDIT_GRADE a SET a.UPDATE_STATUS_IND = 'D' where a.UPDATE_STATUS_IND <> 'D'
		and exists (select 1 from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LCG_LE_ID and b.PROCESSED_IND = 'N'
			and exists (select 1 from SCI_LE_CREDIT_GRADE c where c.LCG_LE_ID = b.NEW_LE_ID));		

		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 11);
		commit;		

		update SCI_LE_ISIC_DTL a SET a.UPDATE_STATUS_IND = 'D' where a.UPDATE_STATUS_IND <> 'D'
		and exists (select 1 from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LID_LE_ID and b.PROCESSED_IND = 'N'
			and exists (select 1 from SCI_LE_ISIC_DTL c where c.LID_LE_ID = b.NEW_LE_ID));		

		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 12);
		commit;		
		
		update SCI_LE_REG_ADDR a SET a.UPDATE_STATUS_IND = 'D' where a.UPDATE_STATUS_IND <> 'D'
		and exists (select 1 from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LRA_LE_ID and b.PROCESSED_IND = 'N'
			and exists (select 1 from SCI_LE_REG_ADDR c where c.LRA_LE_ID = b.NEW_LE_ID));		

		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 13);
		commit;	
		
		-- set cms_customer_id to new sub profile id when new CIF exists in sub profile table
		update SCI_LSP_LMT_PROFILE a SET (a.CMS_CUSTOMER_ID, a.LLP_LE_ID) = (select b.CMS_LE_SUB_PROFILE_ID, b.LSP_LE_ID from SCI_LE_SUB_PROFILE b, CMS_BATCH_CIF_FUSION c where b.LSP_LE_ID = c.NEW_LE_ID and c.OLD_LE_ID = a.LLP_LE_ID  )
		where exists (select 1 from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LLP_LE_ID and b.PROCESSED_IND = 'N')
		and a.CIF_SOURCE_ID = 'ARBS'; 
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 14);
		commit;	

		-- stg: set cms_customer_id to new sub profile id when new CIF exists in sub profile table
		update STAGE_LIMIT_PROFILE a SET (a.CMS_CUSTOMER_ID, a.LLP_LE_ID) = (select b.CMS_LE_SUB_PROFILE_ID, b.LSP_LE_ID from SCI_LE_SUB_PROFILE b, CMS_BATCH_CIF_FUSION c where b.LSP_LE_ID = c.NEW_LE_ID and c.OLD_LE_ID = a.LLP_LE_ID  )
		where exists (select 1 from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LLP_LE_ID and b.PROCESSED_IND = 'N')
		and a.CIF_SOURCE_ID = 'ARBS'
		and exists(select 1 from transaction where STAGING_REFERENCE_ID = a.CMS_LSP_LMT_PROFILE_ID and transaction_type = 'LIMITPROFILE');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 15);
		commit;
		
		-- update non borrower indicator to N when joint borrower or pledgor becomes main borrower 
		update SCI_LE_SUB_PROFILE a set a.CMS_NON_BORROWER_IND = 'N'
		where a.UPDATE_STATUS_IND <> 'D' and a.CMS_NON_BORROWER_IND = 'Y'
		and exists (select 1 from CMS_BATCH_CIF_FUSION b, SCI_LSP_LMT_PROFILE c where b.NEW_LE_ID = a.LSP_LE_ID 
			and b.NEW_LE_ID = c.LLP_LE_ID and c.CMS_CUSTOMER_ID = a.CMS_LE_SUB_PROFILE_ID and b.PROCESSED_IND = 'N');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 16);
		commit;
		
		-- set cms_lmp_sub_profile_id to new sub profile id when new CIF exists in sub profile table, apply for main, joint borrower and pledgor
		update CMS_CHECKLIST a SET a.CMS_LMP_SUB_PROFILE_ID = (select b.CMS_LE_SUB_PROFILE_ID from SCI_LE_SUB_PROFILE b, CMS_BATCH_CIF_FUSION c where b.LSP_LE_ID = c.NEW_LE_ID 
			and exists (select 1 from SCI_LE_SUB_PROFILE d where d.LSP_LE_ID = c.OLD_LE_ID and d.UPDATE_STATUS_IND = 'D' and d.CMS_LE_SUB_PROFILE_ID = a.CMS_LMP_SUB_PROFILE_ID) and b.UPDATE_STATUS_IND <> 'D')
		where exists (select 1 from SCI_LE_SUB_PROFILE b, CMS_BATCH_CIF_FUSION c where b.LSP_LE_ID = c.NEW_LE_ID 
			and exists (select 1 from SCI_LE_SUB_PROFILE d where d.LSP_LE_ID = c.OLD_LE_ID and d.UPDATE_STATUS_IND = 'D' and d.CMS_LE_SUB_PROFILE_ID = a.CMS_LMP_SUB_PROFILE_ID) and b.UPDATE_STATUS_IND <> 'D'); 
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 17);
		commit;	

		-- stg: set cms_lmp_sub_profile_id to new sub profile id when new CIF exists in sub profile table, apply for main, joint borrower and pledgor
		update STAGE_CHECKLIST a SET a.CMS_LMP_SUB_PROFILE_ID = (select b.CMS_LE_SUB_PROFILE_ID from SCI_LE_SUB_PROFILE b, CMS_BATCH_CIF_FUSION c where b.LSP_LE_ID = c.NEW_LE_ID 
			and exists (select 1 from SCI_LE_SUB_PROFILE d where d.LSP_LE_ID = c.OLD_LE_ID and d.UPDATE_STATUS_IND = 'D' and d.CMS_LE_SUB_PROFILE_ID = a.CMS_LMP_SUB_PROFILE_ID) and b.UPDATE_STATUS_IND <> 'D')
		where exists (select 1 from SCI_LE_SUB_PROFILE b, CMS_BATCH_CIF_FUSION c where b.LSP_LE_ID = c.NEW_LE_ID 
			and exists (select 1 from SCI_LE_SUB_PROFILE d where d.LSP_LE_ID = c.OLD_LE_ID and d.UPDATE_STATUS_IND = 'D' and d.CMS_LE_SUB_PROFILE_ID = a.CMS_LMP_SUB_PROFILE_ID) and b.UPDATE_STATUS_IND <> 'D')
		and exists(select 1 from transaction where STAGING_REFERENCE_ID = a.CHECKLIST_ID and transaction_type = 'CHECKLIST'); 
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 18);
		commit;			
		
		-- soft delete joint borrower when normalized CIF is main borrower or new CIF exists under same AA
		update SCI_LSP_JOINT_BORROWER a set a.UPDATE_STATUS_IND = 'D' where a.UPDATE_STATUS_IND <> 'D' 
		and exists (select 1 from SCI_LSP_LMT_PROFILE b, CMS_BATCH_CIF_FUSION c 
			where b.LLP_LE_ID = c.NEW_LE_ID and b.CMS_LSP_LMT_PROFILE_ID = a.CMS_LMP_LIMIT_PROFILE_ID 
				and c.OLD_LE_ID = a.LJB_LE_ID and c.PROCESSED_IND = 'N');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 19);
		commit;
		
		update SCI_LSP_JOINT_BORROWER a set a.UPDATE_STATUS_IND = 'D' where a.UPDATE_STATUS_IND <> 'D' 
			and exists (select 1 from SCI_LSP_JOINT_BORROWER d where d.CMS_LMP_LIMIT_PROFILE_ID = a.CMS_LMP_LIMIT_PROFILE_ID
				and exists (select 1 from CMS_BATCH_CIF_FUSION c where c.NEW_LE_ID = d.LJB_LE_ID 
					and c.OLD_LE_ID = a.LJB_LE_ID and c.PROCESSED_IND = 'N'));

		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 20);
		commit;
		
		-- soft delete joint borrower checklist when normalized CIF is main borrower
		update CMS_CHECKLIST a SET a.STATUS = 'DELETED' where a.SUB_CATEGORY = 'JOINT_BORROWER'
		and exists (select 1 from SCI_LSP_JOINT_BORROWER b where b.CMS_LE_SUB_PROFILE_ID = a.CMS_LMP_SUB_PROFILE_ID and b.UPDATE_STATUS_IND = 'D' 
			and exists (select 1 from CMS_BATCH_CIF_FUSION c where c.OLD_LE_ID = b.LJB_LE_ID and c.PROCESSED_IND = 'N')); 
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 21);
		commit;	

		-- stg: soft delete joint borrower checklist when normalized CIF is main borrower
		update STAGE_CHECKLIST a SET a.STATUS = 'DELETED' where a.SUB_CATEGORY = 'JOINT_BORROWER'
		and exists (select 1 from SCI_LSP_JOINT_BORROWER b where b.CMS_LE_SUB_PROFILE_ID = a.CMS_LMP_SUB_PROFILE_ID and b.UPDATE_STATUS_IND = 'D' 
			and exists (select 1 from CMS_BATCH_CIF_FUSION c where c.OLD_LE_ID = b.LJB_LE_ID and c.PROCESSED_IND = 'N'))
		and exists(select 1 from transaction where STAGING_REFERENCE_ID = a.CHECKLIST_ID and transaction_type = 'CHECKLIST'); 
			
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 22);
		commit;						
					
		-- normalize limit table with new CIF
		update SCI_LSP_APPR_LMTS set LMT_LE_ID = (select NEW_LE_ID from CMS_BATCH_CIF_FUSION where OLD_LE_ID = LMT_LE_ID)
		where CMS_LIMIT_STATUS = 'ACTIVE' and exists (select 1 from CMS_BATCH_CIF_FUSION where OLD_LE_ID = LMT_LE_ID and PROCESSED_IND = 'N');

		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 23);
		commit;			
		
		-- stg: normalize limit table with new CIF
		update STAGE_LIMIT a set LMT_LE_ID = (select NEW_LE_ID from CMS_BATCH_CIF_FUSION where OLD_LE_ID = LMT_LE_ID)
		where CMS_LIMIT_STATUS = 'ACTIVE' and exists (select 1 from CMS_BATCH_CIF_FUSION where OLD_LE_ID = LMT_LE_ID and PROCESSED_IND = 'N')
			and exists(select 1 from transaction where STAGING_REFERENCE_ID = a.CMS_LSP_APPR_LMTS_ID and transaction_type = 'LIMIT');

		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 24);
		commit;	
		
		-- normalize limit security map table with new CIF
		update CMS_LIMIT_SECURITY_MAP set SCI_LAS_LE_ID = (select NEW_LE_ID from CMS_BATCH_CIF_FUSION where OLD_LE_ID = SCI_LAS_LE_ID)
		where UPDATE_STATUS_IND <> 'D' and exists (select 1 from CMS_BATCH_CIF_FUSION where OLD_LE_ID = SCI_LAS_LE_ID and PROCESSED_IND = 'N');

		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 25);
		commit;			
		
		-- stg: normalize limit security map table with new CIF
		update CMS_STAGE_LIMIT_SECURITY_MAP a set SCI_LAS_LE_ID = (select NEW_LE_ID from CMS_BATCH_CIF_FUSION where OLD_LE_ID = SCI_LAS_LE_ID)
		where UPDATE_STATUS_IND <> 'D' and exists (select 1 from CMS_BATCH_CIF_FUSION where OLD_LE_ID = SCI_LAS_LE_ID and PROCESSED_IND = 'N')
			and exists(select 1 from transaction where STAGING_REFERENCE_ID = a.CMS_COLLATERAL_ID and transaction_type = 'COL');

		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 26);
		commit;			
		
		-- set cms_le_sub_profile_id to new sub profile id
		update SCI_LSP_JOINT_BORROWER a SET (a.CMS_LE_SUB_PROFILE_ID, a.LJB_LE_ID) = (select b.CMS_LE_SUB_PROFILE_ID, b.LSP_LE_ID from SCI_LE_SUB_PROFILE b, CMS_BATCH_CIF_FUSION c where b.LSP_LE_ID = c.NEW_LE_ID and c.OLD_LE_ID = a.LJB_LE_ID  )
		where exists (select 1 from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LJB_LE_ID and b.PROCESSED_IND = 'N')
		and a.SOURCE_ID = 'ARBS'; 		
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 27);
		commit;			

		-- normalize pledgor detail with new CIF when no pledgor with new CIF exists
		update SCI_PLEDGOR_DTL a set PLG_LE_ID = (select NEW_LE_ID from CMS_BATCH_CIF_FUSION where PROCESSED_IND = 'N' and OLD_LE_ID = PLG_LE_ID)
		where PLG_LE_ID_SRC_VALUE = 'ARBS' and UPDATE_STATUS_IND <> 'D'
		and not exists (select 1 from SCI_PLEDGOR_DTL b, CMS_BATCH_CIF_FUSION c where b.PLG_LE_ID = c.NEW_LE_ID and b.PLG_LE_ID_SRC_VALUE = 'ARBS' and c.OLD_LE_ID = a.PLG_LE_ID and c.PROCESSED_IND = 'N' and b.UPDATE_STATUS_IND <> 'D')
		and exists (select 1 from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.PLG_LE_ID and b.PROCESSED_IND = 'N');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 28);
		commit;	

		-- stg: normalize pledgor detail with new CIF when no pledgor with new CIF exists
		update STAGE_PLEDGOR_DTL a set PLG_LE_ID = (select NEW_LE_ID from CMS_BATCH_CIF_FUSION where PROCESSED_IND = 'N' and OLD_LE_ID = PLG_LE_ID)
		where PLG_LE_ID_SRC_VALUE = 'ARBS' and UPDATE_STATUS_IND <> 'D'
			and not exists (select 1 from STAGE_PLEDGOR_DTL b, CMS_BATCH_CIF_FUSION c where b.PLG_LE_ID = c.NEW_LE_ID and b.PLG_LE_ID_SRC_VALUE = 'ARBS' and c.OLD_LE_ID = a.PLG_LE_ID and c.PROCESSED_IND = 'N'  and b.UPDATE_STATUS_IND <> 'D')
			and exists (select 1 from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.PLG_LE_ID and b.PROCESSED_IND = 'N')
			and exists(select 1 from transaction, STAGE_SEC_PLDGR_MAP b where b.CMS_PLEDGOR_DTL_ID = a.CMS_PLEDGOR_DTL_ID and STAGING_REFERENCE_ID = b.CMS_COLLATERAL_ID and transaction_type = 'COL');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 29);
		commit;	

		-- soft delete pledgor detail with old CIF when pledgor with new CIF exists
		update SCI_PLEDGOR_DTL a set a.UPDATE_STATUS_IND = 'D'
		where PLG_LE_ID_SRC_VALUE = 'ARBS' and UPDATE_STATUS_IND <> 'D'
			and exists (select 1 from SCI_PLEDGOR_DTL b, CMS_BATCH_CIF_FUSION c 
			where b.PLG_LE_ID = c.NEW_LE_ID and b.PLG_LE_ID_SRC_VALUE = 'ARBS' and c.OLD_LE_ID = a.PLG_LE_ID 
				and c.PROCESSED_IND = 'N' and b.UPDATE_STATUS_IND <> 'D');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 30);
		commit;	

		-- stg: soft delete pledgor detail with old CIF when pledgor with new CIF exists
		update STAGE_PLEDGOR_DTL a set a.UPDATE_STATUS_IND = 'D'
		where PLG_LE_ID_SRC_VALUE = 'ARBS' and UPDATE_STATUS_IND <> 'D'
		and exists (select 1 from STAGE_PLEDGOR_DTL b, CMS_BATCH_CIF_FUSION c 
			where b.PLG_LE_ID = c.NEW_LE_ID and b.PLG_LE_ID_SRC_VALUE = 'ARBS' and c.OLD_LE_ID = a.PLG_LE_ID 
			and c.PROCESSED_IND = 'N' and b.UPDATE_STATUS_IND <> 'D')
		and exists(select 1 from transaction, STAGE_SEC_PLDGR_MAP b where b.CMS_PLEDGOR_DTL_ID = a.CMS_PLEDGOR_DTL_ID and STAGING_REFERENCE_ID = b.CMS_COLLATERAL_ID and transaction_type = 'COL');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 31);
		commit;			
			
		-- normalize security pledgor map when new CIF pledgor detail exists
		update SCI_SEC_PLDGR_MAP a set a.CMS_PLEDGOR_DTL_ID = (select b.CMS_PLEDGOR_DTL_ID from SCI_PLEDGOR_DTL b, CMS_BATCH_CIF_FUSION c 
			where b.PLG_LE_ID = c.NEW_LE_ID and b.PLG_LE_ID_SRC_VALUE = 'ARBS' and c.PROCESSED_IND = 'N' and b.UPDATE_STATUS_IND <> 'D'
				and exists (select 1 from SCI_PLEDGOR_DTL d where d.CMS_PLEDGOR_DTL_ID = a.CMS_PLEDGOR_DTL_ID and d.PLG_LE_ID = c.OLD_LE_ID and d.PLG_LE_ID_SRC_VALUE = 'ARBS') order by CMS_PLEDGOR_DTL_ID desc fetch first row only)
		where UPDATE_STATUS_IND <> 'D'
		and not exists (select 1 from SCI_PLEDGOR_DTL b, CMS_BATCH_CIF_FUSION c, SCI_SEC_PLDGR_MAP d 
			where b.PLG_LE_ID = c.NEW_LE_ID and b.PLG_LE_ID_SRC_VALUE = 'ARBS' and c.PROCESSED_IND = 'N' and b.UPDATE_STATUS_IND <> 'D'
				and d.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and d.CMS_PLEDGOR_DTL_ID = b.CMS_PLEDGOR_DTL_ID)
		and exists (select 1 from SCI_PLEDGOR_DTL b, CMS_BATCH_CIF_FUSION c 
			where b.PLG_LE_ID = c.NEW_LE_ID and b.PLG_LE_ID_SRC_VALUE = 'ARBS' and c.PROCESSED_IND = 'N' and b.UPDATE_STATUS_IND <> 'D'
				and exists (select 1 from SCI_PLEDGOR_DTL d where d.CMS_PLEDGOR_DTL_ID = a.CMS_PLEDGOR_DTL_ID and d.PLG_LE_ID = c.OLD_LE_ID and d.PLG_LE_ID_SRC_VALUE = 'ARBS'));
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 32);
		commit;	

		-- stg: normalize security pledgor map when new CIF pledgor detail exists
		update STAGE_SEC_PLDGR_MAP a set a.CMS_PLEDGOR_DTL_ID = (select b.CMS_PLEDGOR_DTL_ID from STAGE_PLEDGOR_DTL b, CMS_BATCH_CIF_FUSION c 
			where b.PLG_LE_ID = c.NEW_LE_ID and b.PLG_LE_ID_SRC_VALUE = 'ARBS' and c.PROCESSED_IND = 'N' and b.UPDATE_STATUS_IND <> 'D'
				and exists (select 1 from STAGE_PLEDGOR_DTL d where d.CMS_PLEDGOR_DTL_ID = a.CMS_PLEDGOR_DTL_ID and d.PLG_LE_ID = c.OLD_LE_ID and d.PLG_LE_ID_SRC_VALUE = 'ARBS') order by CMS_PLEDGOR_DTL_ID desc fetch first row only)
		where UPDATE_STATUS_IND <> 'D'
		and not exists (select 1 from STAGE_PLEDGOR_DTL b, CMS_BATCH_CIF_FUSION c, STAGE_SEC_PLDGR_MAP d 
			where b.PLG_LE_ID = c.NEW_LE_ID and b.PLG_LE_ID_SRC_VALUE = 'ARBS' and c.PROCESSED_IND = 'N' and b.UPDATE_STATUS_IND <> 'D'
				and d.CMS_COLLATERAL_ID = a.CMS_COLLATERAL_ID and d.CMS_PLEDGOR_DTL_ID = b.CMS_PLEDGOR_DTL_ID)
		and exists (select 1 from STAGE_PLEDGOR_DTL b, CMS_BATCH_CIF_FUSION c 
			where b.PLG_LE_ID = c.NEW_LE_ID and b.PLG_LE_ID_SRC_VALUE = 'ARBS' and c.PROCESSED_IND = 'N' and b.UPDATE_STATUS_IND <> 'D'
				and exists (select 1 from STAGE_PLEDGOR_DTL d where d.CMS_PLEDGOR_DTL_ID = a.CMS_PLEDGOR_DTL_ID and d.PLG_LE_ID = c.OLD_LE_ID and d.PLG_LE_ID_SRC_VALUE = 'ARBS'))
		and exists(select 1 from transaction where STAGING_REFERENCE_ID = a.CMS_COLLATERAL_ID and transaction_type = 'COL');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 33);
		commit;	
		
		-- soft delete security pledgor map when security pledgor map with new CIF exists
		update SCI_SEC_PLDGR_MAP a set a.UPDATE_STATUS_IND = 'D'
		where UPDATE_STATUS_IND <> 'D'
		and exists (select 1 from SCI_PLEDGOR_DTL b, CMS_BATCH_CIF_FUSION c 
			where b.PLG_LE_ID = c.OLD_LE_ID and b.PLG_LE_ID_SRC_VALUE = 'ARBS' and c.PROCESSED_IND = 'N' and b.UPDATE_STATUS_IND = 'D'
				and b.CMS_PLEDGOR_DTL_ID = a.CMS_PLEDGOR_DTL_ID);
				
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 34);
		commit;	

		-- stg: soft delete security pledgor map when security pledgor map with new CIF exists
		update STAGE_SEC_PLDGR_MAP a set a.UPDATE_STATUS_IND = 'D'
		where UPDATE_STATUS_IND <> 'D'
		and exists (select 1 from STAGE_PLEDGOR_DTL b, CMS_BATCH_CIF_FUSION c 
			where b.PLG_LE_ID = c.OLD_LE_ID and b.PLG_LE_ID_SRC_VALUE = 'ARBS' and c.PROCESSED_IND = 'N' and b.UPDATE_STATUS_IND = 'D'
				and b.CMS_PLEDGOR_DTL_ID = a.CMS_PLEDGOR_DTL_ID)
		and exists(select 1 from transaction where STAGING_REFERENCE_ID = a.CMS_COLLATERAL_ID and transaction_type = 'COL');
				
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 35);
		commit;			
					
		-- soft delete pledgor checklist when normalized CIF is joint borrower
		update CMS_CHECKLIST a SET a.STATUS = 'DELETED' where a.SUB_CATEGORY = 'PLEDGOR' and a.STATUS <> 'DELETED'
		and exists (select 1 from CMS_BATCH_CIF_FUSION c, SCI_PLEDGOR_DTL d where c.OLD_LE_ID = d.PLG_LE_ID and d.CMS_PLEDGOR_DTL_ID = a.CMS_PLEDGOR_DTL_ID and c.PROCESSED_IND = 'N'
			and d.PLG_LE_ID_SRC_VALUE = 'ARBS'
			and exists (select 1 from SCI_LSP_JOINT_BORROWER e where e.LJB_LE_ID = c.NEW_LE_ID and e.CMS_LMP_LIMIT_PROFILE_ID = a.CMS_LSP_LMT_PROFILE_ID and e.UPDATE_STATUS_IND <> 'D')); 

		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 36);
		commit;	
		
		-- soft delete pledgor checklist when normalized CIF is main borrower
		update CMS_CHECKLIST a SET a.STATUS = 'DELETED' where a.SUB_CATEGORY = 'PLEDGOR' and a.STATUS <> 'DELETED'
		and exists (select 1 from CMS_BATCH_CIF_FUSION c, SCI_PLEDGOR_DTL d where c.OLD_LE_ID = d.PLG_LE_ID and d.CMS_PLEDGOR_DTL_ID = a.CMS_PLEDGOR_DTL_ID and c.PROCESSED_IND = 'N'
			and d.PLG_LE_ID_SRC_VALUE = 'ARBS'
			and exists (select 1 from SCI_LSP_LMT_PROFILE f where f.CIF_SOURCE_ID = 'ARBS' and f.LLP_LE_ID = c.NEW_LE_ID and f.CMS_LSP_LMT_PROFILE_ID = a.CMS_LSP_LMT_PROFILE_ID)); 
				
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 37);
		commit;	

		-- stg: soft delete pledgor checklist when normalized CIF is joint borrower
		update STAGE_CHECKLIST a SET a.STATUS = 'DELETED' where a.SUB_CATEGORY = 'PLEDGOR' and a.STATUS <> 'DELETED'
		and exists (select 1 from CMS_BATCH_CIF_FUSION c, STAGE_PLEDGOR_DTL d where c.OLD_LE_ID = d.PLG_LE_ID and d.CMS_PLEDGOR_DTL_ID = a.CMS_PLEDGOR_DTL_ID and c.PROCESSED_IND = 'N'
			and d.PLG_LE_ID_SRC_VALUE = 'ARBS'
			and exists (select 1 from SCI_LSP_JOINT_BORROWER e where e.LJB_LE_ID = c.NEW_LE_ID and e.CMS_LMP_LIMIT_PROFILE_ID = a.CMS_LSP_LMT_PROFILE_ID and e.UPDATE_STATUS_IND <> 'D'))
		and exists(select 1 from transaction where STAGING_REFERENCE_ID = a.CHECKLIST_ID and transaction_type = 'CHECKLIST'); 

		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 38);
		commit;		
		
		-- stg: soft delete pledgor checklist when normalized CIF is main borrower
		update STAGE_CHECKLIST a SET a.STATUS = 'DELETED' where a.SUB_CATEGORY = 'PLEDGOR' and a.STATUS <> 'DELETED'
		and exists (select 1 from CMS_BATCH_CIF_FUSION c, STAGE_PLEDGOR_DTL d where c.OLD_LE_ID = d.PLG_LE_ID and d.CMS_PLEDGOR_DTL_ID = a.CMS_PLEDGOR_DTL_ID and c.PROCESSED_IND = 'N'
			and d.PLG_LE_ID_SRC_VALUE = 'ARBS'
			and exists (select 1 from SCI_LSP_LMT_PROFILE f where f.CIF_SOURCE_ID = 'ARBS' and f.LLP_LE_ID = c.NEW_LE_ID and f.CMS_LSP_LMT_PROFILE_ID = a.CMS_LSP_LMT_PROFILE_ID))
		and exists(select 1 from transaction where STAGING_REFERENCE_ID = a.CHECKLIST_ID and transaction_type = 'CHECKLIST'); 
				
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 39);
		commit;		
		
		-- update pledgor checklist pledgor dtl id when pledgor detail normalized
		update CMS_CHECKLIST a SET a.CMS_PLEDGOR_DTL_ID = (select d.CMS_PLEDGOR_DTL_ID from SCI_SEC_PLDGR_MAP b, CMS_BATCH_CIF_FUSION c, SCI_PLEDGOR_DTL d 
			where b.CMS_PLEDGOR_DTL_ID = d.CMS_PLEDGOR_DTL_ID and b.CMS_COLLATERAL_ID in (select CMS_COLLATERAL_ID from CMS_LIMIT_SECURITY_MAP f where f.CMS_LSP_LMT_PROFILE_ID = a.CMS_LSP_LMT_PROFILE_ID) 
				and c.NEW_LE_ID = d.PLG_LE_ID and c.PROCESSED_IND = 'N' and d.PLG_LE_ID_SRC_VALUE = 'ARBS'
				and exists (select 1 from SCI_PLEDGOR_DTL e where e.CMS_PLEDGOR_DTL_ID = a.CMS_PLEDGOR_DTL_ID and e.PLG_LE_ID = c.OLD_LE_ID and e.PLG_LE_ID_SRC_VALUE = 'ARBS') order by CMS_PLEDGOR_DTL_ID desc fetch first row only) 
		where a.SUB_CATEGORY = 'PLEDGOR' and a.STATUS <> 'DELETED' 
			and exists (select 1 from SCI_PLEDGOR_DTL b, CMS_BATCH_CIF_FUSION c where b.CMS_PLEDGOR_DTL_ID = a.CMS_PLEDGOR_DTL_ID and b.PLG_LE_ID = c.OLD_LE_ID and b.PLG_LE_ID_SRC_VALUE = 'ARBS' and c.PROCESSED_IND = 'N'); 
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 40);
		commit;	

		-- stg: update pledgor checklist pledgor dtl id when pledgor detail normalized
		update STAGE_CHECKLIST a SET a.CMS_PLEDGOR_DTL_ID = (select d.CMS_PLEDGOR_DTL_ID from STAGE_SEC_PLDGR_MAP b, CMS_BATCH_CIF_FUSION c, STAGE_PLEDGOR_DTL d 
			where b.CMS_PLEDGOR_DTL_ID = d.CMS_PLEDGOR_DTL_ID and b.CMS_COLLATERAL_ID in (select CMS_COLLATERAL_ID from CMS_STAGE_LIMIT_SECURITY_MAP f where f.CMS_LSP_LMT_PROFILE_ID = a.CMS_LSP_LMT_PROFILE_ID) 
				and c.NEW_LE_ID = d.PLG_LE_ID and c.PROCESSED_IND = 'N' and d.PLG_LE_ID_SRC_VALUE = 'ARBS'
				and exists (select 1 from STAGE_PLEDGOR_DTL e where e.CMS_PLEDGOR_DTL_ID = a.CMS_PLEDGOR_DTL_ID and e.PLG_LE_ID = c.OLD_LE_ID and e.PLG_LE_ID_SRC_VALUE = 'ARBS') order by CMS_PLEDGOR_DTL_ID desc fetch first row only) 
		where a.SUB_CATEGORY = 'PLEDGOR' and a.STATUS <> 'DELETED' 
			and exists (select 1 from STAGE_PLEDGOR_DTL b, CMS_BATCH_CIF_FUSION c where b.CMS_PLEDGOR_DTL_ID = a.CMS_PLEDGOR_DTL_ID and b.PLG_LE_ID = c.OLD_LE_ID and b.PLG_LE_ID_SRC_VALUE = 'ARBS' and c.PROCESSED_IND = 'N')
		and exists(select 1 from transaction where STAGING_REFERENCE_ID = a.CHECKLIST_ID and transaction_type = 'CHECKLIST'); 
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 41);
		commit;		
		
		-- normalize main profile LE ID with new CIF with condition new main profile dont exists
		update SCI_LE_MAIN_PROFILE a set a.LMP_LE_ID = (select NEW_LE_ID from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LMP_LE_ID and b.PROCESSED_IND = 'N')
		where a.UPDATE_STATUS_IND <> 'D' and a.SOURCE_ID = 'ARBS' 
		and exists (select 1 from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LMP_LE_ID and b.PROCESSED_IND = 'N');
			
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 42);
		commit;			
		
		-- normalize credit grade LE ID with new CIF with condition new credit grade dont exists
		update SCI_LE_CREDIT_GRADE a set a.LCG_LE_ID = (select NEW_LE_ID from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LCG_LE_ID and b.PROCESSED_IND = 'N')
		where a.UPDATE_STATUS_IND <> 'D'
		and exists (select 1 from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LCG_LE_ID and b.PROCESSED_IND = 'N');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 43);
		commit;				

		-- normalize isic LE ID with new CIF with condition new isic dont exists
		update SCI_LE_ISIC_DTL a set a.LID_LE_ID = (select NEW_LE_ID from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LID_LE_ID and b.PROCESSED_IND = 'N')
		where a.UPDATE_STATUS_IND <> 'D'
		and exists (select 1 from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LID_LE_ID and b.PROCESSED_IND = 'N');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 44);
		commit;	

		-- normalize address LE ID with new CIF with condition new address dont exists
		update SCI_LE_REG_ADDR a set a.LRA_LE_ID = (select NEW_LE_ID from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LRA_LE_ID and b.PROCESSED_IND = 'N')
		where a.UPDATE_STATUS_IND <> 'D'
		and exists (select 1 from CMS_BATCH_CIF_FUSION b where b.OLD_LE_ID = a.LRA_LE_ID and b.PROCESSED_IND = 'N');
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 45);
		commit;		
		
		-- CMS_RECURRENT_DOC: set cms_customer_id to new sub profile id when new CIF exists in sub profile table
		update CMS_RECURRENT_DOC a SET a.CMS_LMP_SUB_PROFILE_ID = (select b.CMS_LE_SUB_PROFILE_ID from SCI_LE_SUB_PROFILE b, CMS_BATCH_CIF_FUSION c where b.LSP_LE_ID = c.NEW_LE_ID 
			and exists (select 1 from SCI_LE_SUB_PROFILE d where d.LSP_LE_ID = c.OLD_LE_ID and d.CMS_LE_SUB_PROFILE_ID = a.CMS_LMP_SUB_PROFILE_ID))
		where exists (select 1 from SCI_LE_SUB_PROFILE b, CMS_BATCH_CIF_FUSION c where b.LSP_LE_ID = c.NEW_LE_ID 
			and exists (select 1 from SCI_LE_SUB_PROFILE d where d.LSP_LE_ID = c.OLD_LE_ID and d.CMS_LE_SUB_PROFILE_ID = a.CMS_LMP_SUB_PROFILE_ID)); 
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 46);
		commit;	

		-- STAGE_RECURRENT_DOC: set cms_customer_id to new sub profile id when new CIF exists in sub profile table
		update STAGE_RECURRENT_DOC a SET a.CMS_LMP_SUB_PROFILE_ID = (select b.CMS_LE_SUB_PROFILE_ID from SCI_LE_SUB_PROFILE b, CMS_BATCH_CIF_FUSION c where b.LSP_LE_ID = c.NEW_LE_ID 
			and exists (select 1 from SCI_LE_SUB_PROFILE d where d.LSP_LE_ID = c.OLD_LE_ID and d.CMS_LE_SUB_PROFILE_ID = a.CMS_LMP_SUB_PROFILE_ID))
		where exists (select 1 from SCI_LE_SUB_PROFILE b, CMS_BATCH_CIF_FUSION c where b.LSP_LE_ID = c.NEW_LE_ID 
			and exists (select 1 from SCI_LE_SUB_PROFILE d where d.LSP_LE_ID = c.OLD_LE_ID and d.CMS_LE_SUB_PROFILE_ID = a.CMS_LMP_SUB_PROFILE_ID))
			and exists (select 1 from transaction where STAGING_REFERENCE_ID = a.RECURRENT_DOC_ID and transaction_type = 'RECURRENT_CHECKLIST'); 
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 47);
		commit;		

		-- TRANSACTION: set cms_customer_id to new sub profile id when new CIF exists in sub profile table
		update TRANSACTION a SET a.CUSTOMER_ID = (select b.CMS_LE_SUB_PROFILE_ID from SCI_LE_SUB_PROFILE b, CMS_BATCH_CIF_FUSION c where b.LSP_LE_ID = c.NEW_LE_ID 
			and exists (select 1 from SCI_LE_SUB_PROFILE d where d.LSP_LE_ID = c.OLD_LE_ID and d.CMS_LE_SUB_PROFILE_ID = a.CUSTOMER_ID))
		where exists (select 1 from SCI_LE_SUB_PROFILE b, CMS_BATCH_CIF_FUSION c where b.LSP_LE_ID = c.NEW_LE_ID 
			and exists (select 1 from SCI_LE_SUB_PROFILE d where d.LSP_LE_ID = c.OLD_LE_ID and d.CMS_LE_SUB_PROFILE_ID = a.CUSTOMER_ID))
			and a.TRANSACTION_TYPE in ('CUSTOMER', 'LIMITPROFILE', 'LIMIT', 'FACILITY', 'COL', 'CHECKLIST', 'RECURRENT_CHECKLIST', 'TAT_DOC'); 
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 48);
		commit;				
		
		-- tag is process flag for normalized CIF
		update CMS_BATCH_CIF_FUSION a set (a.PROCESSED_IND, a.TIME_PROCESSED) = ('Y', CURRENT_TIMESTAMP) where a.PROCESSED_IND = 'N'
		and (exists (select 1 from SCI_LE_MAIN_PROFILE b where a.NEW_LE_ID = b.LMP_LE_ID and b.SOURCE_ID = 'SIBS')
		or exists (select 1 from CMS_FAC_RELATIONSHIP c where a.NEW_LE_ID = c.CIF_NUMBER));
		
		CALL "SI_LOG_PROC_TIME"('SI_RUN_CUSTOMER_FUSION', 'ARBS', 0);
		commit;
END@

commit work@