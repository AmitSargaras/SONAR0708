/* Patch pledgor/chargor into stp trans. This is because we're firing stp update */

----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 404340
SELECT count(*)
		from session.sec_trx_info s
		where exists (select 1 FROM SCI_SEC_PLDGR_MAP spm, SCI_PLEDGOR_DTL ple
						where s.cms_collateral_id = spm.cms_collateral_id
						and spm.cms_pledgor_dtl_id = ple.cms_pledgor_dtl_id
						and char(ple.CMS_PLEDGOR_DTL_ID) like '200908091%')
		and not exists (select 1 from stp_trans strans
						where strans.master_trx_id = stp_master_trx_id
						and strans.trx_type = '126' fetch first row only);
						
-- 127 record
-- Update  all status = 'FAILED' to 'SUCCESS' where security is migrated for trx id = 126 (chargor).
select strans.REFERENCE_ID, spm.cms_collateral_id, strans.CREATION_DATE, strans.STATUS
FROM SCI_SEC_PLDGR_MAP spm, SCI_PLEDGOR_DTL ple, session.sec_trx_info s, STP_TRANS strans
						where s.cms_collateral_id = spm.cms_collateral_id
						and spm.cms_pledgor_dtl_id = ple.cms_pledgor_dtl_id
                        and strans.REFERENCE_ID = spm.CMS_COLLATERAL_ID
and strans.STATUS = 'FAILED'
and strans.trx_type = '126';						
						
----------------------------------------------------------------------------------------------------------------------------------------------------------

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

-- Migration patches	
INSERT INTO STP_TRANS (TRX_ID, MASTER_TRX_ID, TRX_TYPE, CREATION_DATE, LAST_UPDATE_DATE, STATUS, 
				CUR_TRX_HISTORY_ID, MSG_COUNT, RESPONSE_CODE, REFERENCE_ID, OPS_DESC, TRX_UID)
	(
		SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_SEQ), 2)) AS BIGINT), 
			   STP_MASTER_TRX_ID, '126', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'SUCCESS', 
			   CUR_TRX_HISTORY_ID, 1, 'AA', CMS_COLLATERAL_ID, 'CREATE',
			   CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR STP_TRANS_UID_SEQ), 2)) AS BIGINT)
		from session.sec_trx_info s
		where exists (select 1 FROM CMS_SECURITY sec, SCI_SEC_PLDGR_MAP spm, SCI_PLEDGOR_DTL ple
						where s.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID	
						and sec.CMS_COLLATERAL_ID = spm.CMS_COLLATERAL_ID	
						and spm.CMS_PLEDGOR_DTL_ID = ple.CMS_PLEDGOR_DTL_ID
						and sec.IS_MIGRATED_IND = 'Y')
		and not exists (select 1 from stp_trans strans
						where strans.master_trx_id = stp_master_trx_id
						and strans.trx_type = '126' fetch first row only)
	);

-- Update status = 'SUCCESS' for those case where user had fired stp
update STP_TRANS strans
set STATUS = 'SUCCESS'
where exists (select 1 FROM SCI_SEC_PLDGR_MAP spm, SCI_PLEDGOR_DTL ple, session.sec_trx_info s
						where s.cms_collateral_id = spm.cms_collateral_id
						and spm.cms_pledgor_dtl_id = ple.cms_pledgor_dtl_id
						and strans.REFERENCE_ID = spm.CMS_COLLATERAL_ID) 
and strans.STATUS = 'FAILED'
and strans.trx_type = '126';


update STP_TRANS strans
set RESPONSE_CODE = 'AA'
where exists (select 1 FROM SCI_SEC_PLDGR_MAP spm, SCI_PLEDGOR_DTL ple, session.sec_trx_info s
						where s.cms_collateral_id = spm.cms_collateral_id
						and spm.cms_pledgor_dtl_id = ple.cms_pledgor_dtl_id
						and strans.REFERENCE_ID = spm.CMS_COLLATERAL_ID) 
and strans.RESPONSE_CODE = 'AB'
and strans.trx_type = '126';

