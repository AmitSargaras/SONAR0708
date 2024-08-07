-- Patching for pledgor and charge since it was required for stp

drop table SCI_PLEDGOR_DTL_TEMP;
drop table STAGE_PLEDGOR_DTL_TEMP;
drop table SCI_SEC_PLDGR_MAP_TEMP;
drop table STAGE_SEC_PLDGR_MAP_TEMP;

drop table CMS_CHARGE_DETAIL_TEMP;
drop table CMS_STAGE_CHARGE_DETAIL_TEMP;
drop table CMS_LIMIT_CHARGE_MAP_TEMP;
drop table CMS_STAGE_LIMIT_CHARGE_MAP_TEMP;

---------------------------------------------------------------------------------------------------------------------------------------------
-- Patching charge detail

create table CMS_CHARGE_DETAIL_TEMP like CMS_CHARGE_DETAIL;
create table CMS_STAGE_CHARGE_DETAIL_TEMP like CMS_STAGE_CHARGE_DETAIL;
create table CMS_LIMIT_CHARGE_MAP_TEMP like CMS_LIMIT_CHARGE_MAP;
create table CMS_STAGE_LIMIT_CHARGE_MAP_TEMP like CMS_STAGE_LIMIT_CHARGE_MAP;

alter table CMS_CHARGE_DETAIL_TEMP
add column CMS_LSP_APPR_LMTS_ID BIGINT
add column CMS_LSP_LMT_PROFILE_ID BIGINT
add column CHARGE_ID BIGINT;

alter table CMS_STAGE_CHARGE_DETAIL_TEMP
add column CMS_LSP_APPR_LMTS_ID BIGINT
add column CMS_LSP_LMT_PROFILE_ID BIGINT
add column CHARGE_ID BIGINT;

CREATE UNIQUE INDEX MIG_TEMP_IDX01 ON CMS_FAC_GENERAL
("CMS_FAC_MASTER_ID" ASC) 
INCLUDE ( "APPROVED_DATE") 
ALLOW REVERSE SCANS; 

CREATE INDEX MIG_TEMP_IDX02 ON CMS_LIMIT_CHARGE_MAP
("CMS_COLLATERAL_ID" ASC) 
ALLOW REVERSE SCANS; 

CREATE UNIQUE INDEX MIG_TEMP_IDX03 ON CMS_SECURITY
("CMS_COLLATERAL_ID" ASC) 
INCLUDE ( "SECURITY_SUB_TYPE_ID", "SCI_SECURITY_DTL_ID") 
ALLOW REVERSE SCANS; 

CREATE INDEX MIG_TEMP_IDX04 ON SCI_LSP_APPR_LMTS
("LMT_AMT" ASC, "LMT_CRRNCY_ISO_CODE" ASC, "CMS_LIMIT_PROFILE_ID" ASC, "CMS_LSP_APPR_LMTS_ID" ASC) 
ALLOW REVERSE SCANS; 

CREATE INDEX MIG_TEMP_IDX05 ON CMS_STAGE_LIMIT_CHARGE_MAP
("CMS_COLLATERAL_ID" ASC) 
ALLOW REVERSE SCANS; 

CREATE INDEX MIG_TEMP_IDX06 ON CMS_STAGE_LIMIT_SECURITY_MAP
("CMS_COLLATERAL_ID" ASC) 
ALLOW REVERSE SCANS; 

CREATE INDEX MIG_TEMP_IDX07 ON CMS_STAGE_SECURITY
("SCI_SECURITY_DTL_ID" ASC, "SECURITY_SUB_TYPE_ID" ASC, "CMS_COLLATERAL_ID" ASC) 
ALLOW REVERSE SCANS; 

-- Copy to temp table
INSERT INTO CMS_CHARGE_DETAIL_TEMP (charge_detail_id, cms_collateral_id, security_rank, 
    charge_type, status, source_id, cms_ref_id, CHARGE_CURRENCY_CODE, CHARGE_AMOUNT, LEGAL_CHARGE_DATE, CHARGE_NATURE,
	CMS_LSP_APPR_LMTS_ID, CMS_LSP_LMT_PROFILE_ID, CHARGE_ID)
	(SELECT CAST(('200908091' || SUBSTR(DIGITS(NEXT VALUE FOR col_limit_charge_seq), 3)) as BIGINT), sec.CMS_COLLATERAL_ID, 1,
    'S', 'ACTIVE', 'SIBS', CAST(('200908091' || SUBSTR(DIGITS(NEXT VALUE FOR col_limit_charge_seq), 3)) as BIGINT),
			lmt.LMT_CRRNCY_ISO_CODE, lmt.LMT_AMT, facgen.APPROVED_DATE, 
            (CASE WHEN sec.SECURITY_SUB_TYPE_ID = 'AB101' THEN 'NOC_PLT13' 
					                WHEN sec.SECURITY_SUB_TYPE_ID = 'AB102' THEN 'NOV_VEH11' 
					                WHEN sec.SECURITY_SUB_TYPE_ID = 'CS202' THEN 'NOC_CASH12' 
					                WHEN sec.SECURITY_SUB_TYPE_ID = 'IN500' THEN 'NOC_INS02' 
					                WHEN sec.SECURITY_SUB_TYPE_ID like 'MS60%' THEN 'NOC_MS15' 
					                WHEN sec.SECURITY_SUB_TYPE_ID like 'PT70%' THEN 'NOC_PROP08' 
			            ELSE '' END),
			lmt.CMS_LSP_APPR_LMTS_ID, aa.CMS_LSP_LMT_PROFILE_ID, lsm.CHARGE_ID
	FROM CMS_SECURITY sec, CMS_LIMIT_SECURITY_MAP lsm, SCI_LSP_APPR_LMTS lmt, SCI_LSP_LMT_PROFILE aa, CMS_FACILITY_MASTER facmas, CMS_FAC_GENERAL facgen
	WHERE NOT EXISTS (SELECT 1 FROM CMS_LIMIT_CHARGE_MAP lcm
					WHERE sec.CMS_COLLATERAL_ID = lcm.CMS_COLLATERAL_ID)
 	AND EXISTS (SELECT 1 FROM VW_MIG_SEC vsec
				WHERE vsec.SECURITY_ID = sec.sci_security_dtl_id) 
/*      AND EXISTS (SELECT 1 FROM VW_MIG_SEC_TEMP vsectemp
				WHERE vsectemp.SECURITY_ID = sec.sci_security_dtl_id)  */
	AND EXISTS (SELECT 1 from CMS_LIMIT_SECURITY_MAP lsm
				WHERE lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID)
	and lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
	and lsm.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID
	and lmt.CMS_LIMIT_PROFILE_ID = aa.CMS_LSP_LMT_PROFILE_ID
    and lmt.CMS_LSP_APPR_LMTS_ID = facmas.CMS_LSP_APPR_LMTS_ID
    and facmas.ID = facgen.CMS_FAC_MASTER_ID
    and sec.SECURITY_SUB_TYPE_ID not in ('CL001', 'GT408'));						

INSERT INTO CMS_STAGE_CHARGE_DETAIL_TEMP (charge_detail_id, cms_collateral_id, security_rank, 
    charge_type, status, source_id, cms_ref_id, CHARGE_CURRENCY_CODE, CHARGE_AMOUNT, LEGAL_CHARGE_DATE, CHARGE_NATURE,
	CMS_LSP_APPR_LMTS_ID, CMS_LSP_LMT_PROFILE_ID, CHARGE_ID)
	(SELECT CAST(('200908091' || SUBSTR(DIGITS(NEXT VALUE FOR col_limit_charge_seq), 3)) as BIGINT), sec.CMS_COLLATERAL_ID, 1,
    'S', 'ACTIVE', 'SIBS', CAST(('200908091' || SUBSTR(DIGITS(NEXT VALUE FOR col_limit_charge_seq), 3)) as BIGINT),
			lmt.LMT_CRRNCY_ISO_CODE, lmt.LMT_AMT, facgen.APPROVED_DATE, 
			(CASE WHEN sec.SECURITY_SUB_TYPE_ID = 'AB101' THEN 'NOC_PLT13' 
					                WHEN sec.SECURITY_SUB_TYPE_ID = 'AB102' THEN 'NOV_VEH11' 
					                WHEN sec.SECURITY_SUB_TYPE_ID = 'CS202' THEN 'NOC_CASH12' 
					                WHEN sec.SECURITY_SUB_TYPE_ID = 'IN500' THEN 'NOC_INS02' 
					                WHEN sec.SECURITY_SUB_TYPE_ID like 'MS60%' THEN 'NOC_MS15' 
					                WHEN sec.SECURITY_SUB_TYPE_ID like 'PT70%' THEN 'NOC_PROP08' 
			            ELSE '' END),
			lmt.CMS_LSP_APPR_LMTS_ID, aa.CMS_LSP_LMT_PROFILE_ID, lsm.CHARGE_ID
	FROM CMS_STAGE_SECURITY sec, CMS_STAGE_LIMIT_SECURITY_MAP lsm, SCI_LSP_APPR_LMTS lmt, SCI_LSP_LMT_PROFILE aa, CMS_FACILITY_MASTER facmas, CMS_FAC_GENERAL facgen
	WHERE NOT EXISTS (SELECT 1 FROM CMS_STAGE_LIMIT_CHARGE_MAP lcm
					WHERE sec.CMS_COLLATERAL_ID = lcm.CMS_COLLATERAL_ID)
	AND EXISTS (SELECT 1 FROM VW_MIG_SEC vsec
				WHERE vsec.SECURITY_ID = sec.sci_security_dtl_id)
/*      AND EXISTS (SELECT 1 FROM VW_MIG_SEC_TEMP vsectemp
				WHERE vsectemp.SECURITY_ID = sec.sci_security_dtl_id)  */				
	AND EXISTS (SELECT 1 from CMS_STAGE_LIMIT_SECURITY_MAP lsm
				WHERE lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID)
	and lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
	and lsm.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID
	and lmt.CMS_LIMIT_PROFILE_ID = aa.CMS_LSP_LMT_PROFILE_ID
    and lmt.CMS_LSP_APPR_LMTS_ID = facmas.CMS_LSP_APPR_LMTS_ID
    and facmas.ID = facgen.CMS_FAC_MASTER_ID
    and sec.SECURITY_SUB_TYPE_ID not in ('CL001', 'GT408'));

INSERT INTO CMS_LIMIT_CHARGE_MAP_TEMP (limit_charge_map_id, cms_lsp_appr_lmts_id, charge_id, charge_detail_id, cms_collateral_id, 
									  status, customer_category, cms_lsp_lmt_profile_id)
	(SELECT CAST(('200908091' || SUBSTR(DIGITS(NEXT VALUE FOR col_limit_charge_seq), 3)) as BIGINT), cms_lsp_appr_lmts_id, CHARGE_ID, 
			charge_detail_id, CMS_COLLATERAL_ID, 'ACTIVE', 'MB', CMS_LSP_LMT_PROFILE_ID
	   FROM CMS_CHARGE_DETAIL_TEMP);	
	
INSERT INTO CMS_STAGE_LIMIT_CHARGE_MAP_TEMP (limit_charge_map_id, cms_lsp_appr_lmts_id, charge_id, charge_detail_id, cms_collateral_id, 
									  status, customer_category, cms_lsp_lmt_profile_id)
	(SELECT CAST(('200908091' || SUBSTR(DIGITS(NEXT VALUE FOR col_limit_charge_seq), 3)) as BIGINT), cms_lsp_appr_lmts_id, CHARGE_ID, 
			charge_detail_id, CMS_COLLATERAL_ID, 'ACTIVE', 'MB', CMS_LSP_LMT_PROFILE_ID
	   FROM CMS_STAGE_CHARGE_DETAIL_TEMP);		
	   
-- insert back into  actual  and staging table   
INSERT INTO CMS_CHARGE_DETAIL (charge_detail_id, cms_collateral_id, security_rank, 
		charge_type, status, source_id, cms_ref_id, CHARGE_NATURE, CHARGE_CURRENCY_CODE, CHARGE_AMOUNT, LEGAL_CHARGE_DATE) 
	(SELECT charge_detail_id, cms_collateral_id, security_rank, 
		charge_type, status, source_id, cms_ref_id, CHARGE_NATURE, CHARGE_CURRENCY_CODE, CHARGE_AMOUNT, LEGAL_CHARGE_DATE
	FROM CMS_CHARGE_DETAIL_TEMP);
	
INSERT INTO CMS_STAGE_CHARGE_DETAIL (charge_detail_id, cms_collateral_id, security_rank, 
		charge_type, status, source_id, cms_ref_id, CHARGE_NATURE, CHARGE_CURRENCY_CODE, CHARGE_AMOUNT, LEGAL_CHARGE_DATE) 
	(SELECT charge_detail_id, cms_collateral_id, security_rank, 
		charge_type, status, source_id, cms_ref_id, CHARGE_NATURE, CHARGE_CURRENCY_CODE, CHARGE_AMOUNT, LEGAL_CHARGE_DATE
	FROM CMS_STAGE_CHARGE_DETAIL_TEMP);

INSERT INTO CMS_LIMIT_CHARGE_MAP (limit_charge_map_id, cms_lsp_appr_lmts_id, charge_id, charge_detail_id, cms_collateral_id, 
									  status, customer_category, cms_lsp_lmt_profile_id) 
	(SELECT limit_charge_map_id, cms_lsp_appr_lmts_id, charge_id, charge_detail_id, cms_collateral_id, 
									  status, customer_category, cms_lsp_lmt_profile_id
	FROM CMS_LIMIT_CHARGE_MAP_TEMP);
	
INSERT INTO CMS_STAGE_LIMIT_CHARGE_MAP (limit_charge_map_id, cms_lsp_appr_lmts_id, charge_id, charge_detail_id, cms_collateral_id, 
									  status, customer_category, cms_lsp_lmt_profile_id) 
	(SELECT limit_charge_map_id, cms_lsp_appr_lmts_id, charge_id, charge_detail_id, cms_collateral_id, 
									  status, customer_category, cms_lsp_lmt_profile_id
	FROM CMS_STAGE_LIMIT_CHARGE_MAP_TEMP);

---------------------------------------------------------------------------------------------------------------------------------------------	
-- Patch pledgor detail
	
create table SCI_PLEDGOR_DTL_TEMP like SCI_PLEDGOR_DTL;
create table STAGE_PLEDGOR_DTL_TEMP like STAGE_PLEDGOR_DTL;
create table SCI_SEC_PLDGR_MAP_TEMP like SCI_SEC_PLDGR_MAP;
create table STAGE_SEC_PLDGR_MAP_TEMP like STAGE_SEC_PLDGR_MAP;

alter table SCI_PLEDGOR_DTL_TEMP
add column CMS_COLLATERAL_ID BIGINT
add column SCI_SECURITY_DTL_ID VARCHAR(50);

alter table STAGE_PLEDGOR_DTL_TEMP
add column CMS_COLLATERAL_ID BIGINT
add column SCI_SECURITY_DTL_ID VARCHAR(50);

-- Copy to temp table
INSERT INTO SCI_PLEDGOR_DTL_TEMP (CMS_PLEDGOR_DTL_ID, PLG_LE_ID, PLG_LEGAL_NAME, PLG_REL_TYPE_NUM, PLG_REL_TYPE_VALUE, SOURCE_ID, 
	CREATE_DATE, PLG_INC_NUM_TEXT, PLG_LE_ID_SRC_VALUE, CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION, CMS_COLLATERAL_ID, SCI_SECURITY_DTL_ID)
	(SELECT CAST(('200908091' || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 3)) as BIGINT), cus.LMP_LE_ID, cus.LMP_LONG_NAME,
		'RELATIONSHIP', 'P', 'SIBS', current_timestamp, cus.LMP_ID_NUMBER, 'SIBS', 
		subcus.CMS_SUB_ORIG_COUNTRY, subcus.CMS_SUB_ORIG_ORGANISATION, sec.CMS_COLLATERAL_ID, sec.SCI_SECURITY_DTL_ID
	FROM CMS_SECURITY sec, CMS_LIMIT_SECURITY_MAP lsm, SCI_LSP_APPR_LMTS lmt, SCI_LSP_LMT_PROFILE aa, SCI_LE_SUB_PROFILE subcus, SCI_LE_MAIN_PROFILE cus
	WHERE NOT EXISTS (SELECT 1 FROM SCI_SEC_PLDGR_MAP SPM 
					WHERE sec.CMS_COLLATERAL_ID = SPM.CMS_COLLATERAL_ID)
	AND EXISTS (SELECT 1 FROM VW_MIG_SEC vsec
				WHERE vsec.SECURITY_ID = sec.sci_security_dtl_id)
/*      AND EXISTS (SELECT 1 FROM VW_MIG_SEC_TEMP vsectemp
				WHERE vsectemp.SECURITY_ID = sec.sci_security_dtl_id)  */				
	AND EXISTS (SELECT 1 from CMS_LIMIT_SECURITY_MAP lsm
				WHERE lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID)
	and lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
	and lsm.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID
	and lmt.CMS_LIMIT_PROFILE_ID = aa.CMS_LSP_LMT_PROFILE_ID
	and aa.LLP_LE_ID = subcus.LSP_LE_ID
	and subcus.LSP_LE_ID = cus.LMP_LE_ID);
	
INSERT INTO STAGE_PLEDGOR_DTL_TEMP (CMS_PLEDGOR_DTL_ID, PLG_LE_ID, PLG_LEGAL_NAME, PLG_REL_TYPE_NUM, PLG_REL_TYPE_VALUE, SOURCE_ID, 
	CREATE_DATE, PLG_INC_NUM_TEXT, PLG_LE_ID_SRC_VALUE, CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION, CMS_COLLATERAL_ID, SCI_SECURITY_DTL_ID)
	(SELECT CAST(('200908091' || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 3)) as BIGINT), cus.LMP_LE_ID, cus.LMP_LONG_NAME,
		'RELATIONSHIP', 'P', 'SIBS', current_timestamp, cus.LMP_ID_NUMBER, 'SIBS', 
		subcus.CMS_SUB_ORIG_COUNTRY, subcus.CMS_SUB_ORIG_ORGANISATION, sec.CMS_COLLATERAL_ID, sec.SCI_SECURITY_DTL_ID
	FROM CMS_STAGE_SECURITY sec, CMS_STAGE_LIMIT_SECURITY_MAP lsm, SCI_LSP_APPR_LMTS lmt, SCI_LSP_LMT_PROFILE aa, SCI_LE_SUB_PROFILE subcus, SCI_LE_MAIN_PROFILE cus
	WHERE NOT EXISTS (SELECT 1 FROM STAGE_SEC_PLDGR_MAP SPM 
                        WHERE sec.CMS_COLLATERAL_ID = SPM.CMS_COLLATERAL_ID)
	AND EXISTS (SELECT 1 FROM VW_MIG_SEC vsec
				WHERE vsec.SECURITY_ID = sec.sci_security_dtl_id)
/*      AND EXISTS (SELECT 1 FROM VW_MIG_SEC_TEMP vsectemp
				WHERE vsectemp.SECURITY_ID = sec.sci_security_dtl_id)  */				
	AND EXISTS (SELECT 1 from CMS_STAGE_LIMIT_SECURITY_MAP lsm
				WHERE lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID)
	and lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
	and lsm.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID
	and lmt.CMS_LIMIT_PROFILE_ID = aa.CMS_LSP_LMT_PROFILE_ID
	and aa.LLP_LE_ID = subcus.LSP_LE_ID
	and subcus.LSP_LE_ID = cus.LMP_LE_ID);
	
INSERT INTO SCI_SEC_PLDGR_MAP_TEMP (CMS_SEC_PLDGR_MAP_ID, SPM_SEC_ID, CMS_PLEDGOR_DTL_ID, CMS_COLLATERAL_ID,
								   SEC_PLEDGOR_RELATIONSHIP_NUM, SEC_PLEDGOR_RELATIONSHIP_VALUE, SOURCE_ID)
	(SELECT CAST(('200908091' || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 3)) as BIGINT),
			SCI_SECURITY_DTL_ID, CMS_PLEDGOR_DTL_ID, CMS_COLLATERAL_ID, 'RELATIONSHIP', 'P', 'SIBS'
	   FROM SCI_PLEDGOR_DTL_TEMP);	
	   
INSERT INTO STAGE_SEC_PLDGR_MAP_TEMP (CMS_SEC_PLDGR_MAP_ID, SPM_SEC_ID, CMS_PLEDGOR_DTL_ID, CMS_COLLATERAL_ID,
								   SEC_PLEDGOR_RELATIONSHIP_NUM, SEC_PLEDGOR_RELATIONSHIP_VALUE, SOURCE_ID)
	(SELECT CAST(('200908091' || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 3)) as BIGINT),
			SCI_SECURITY_DTL_ID, CMS_PLEDGOR_DTL_ID, CMS_COLLATERAL_ID, 'RELATIONSHIP', 'P', 'SIBS'
	   FROM STAGE_PLEDGOR_DTL_TEMP);	   
	
-- insert back into  actual  and staging table   	
INSERT INTO SCI_PLEDGOR_DTL (CMS_PLEDGOR_DTL_ID, PLG_LE_ID, PLG_LEGAL_NAME, PLG_REL_TYPE_NUM, PLG_REL_TYPE_VALUE, SOURCE_ID, 
		CREATE_DATE, PLG_INC_NUM_TEXT, PLG_LE_ID_SRC_VALUE, CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION) 	
	(SELECT CMS_PLEDGOR_DTL_ID, PLG_LE_ID, PLG_LEGAL_NAME, PLG_REL_TYPE_NUM, PLG_REL_TYPE_VALUE, SOURCE_ID, 
		CREATE_DATE, PLG_INC_NUM_TEXT, PLG_LE_ID_SRC_VALUE, CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION 
	FROM SCI_PLEDGOR_DTL_TEMP);
	
INSERT INTO STAGE_PLEDGOR_DTL (CMS_PLEDGOR_DTL_ID, PLG_LE_ID, PLG_LEGAL_NAME, PLG_REL_TYPE_NUM, PLG_REL_TYPE_VALUE, SOURCE_ID, 
		CREATE_DATE, PLG_INC_NUM_TEXT, PLG_LE_ID_SRC_VALUE, CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION) 	
	(SELECT CMS_PLEDGOR_DTL_ID, PLG_LE_ID, PLG_LEGAL_NAME, PLG_REL_TYPE_NUM, PLG_REL_TYPE_VALUE, SOURCE_ID, 
		CREATE_DATE, PLG_INC_NUM_TEXT, PLG_LE_ID_SRC_VALUE, CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION 
	FROM STAGE_PLEDGOR_DTL_TEMP);	
	
INSERT INTO SCI_SEC_PLDGR_MAP (CMS_SEC_PLDGR_MAP_ID, SPM_SEC_ID, CMS_PLEDGOR_DTL_ID, CMS_COLLATERAL_ID,
								   SEC_PLEDGOR_RELATIONSHIP_NUM, SEC_PLEDGOR_RELATIONSHIP_VALUE, SOURCE_ID)
		(SELECT CMS_SEC_PLDGR_MAP_ID, SPM_SEC_ID, CMS_PLEDGOR_DTL_ID, CMS_COLLATERAL_ID,
								   SEC_PLEDGOR_RELATIONSHIP_NUM, SEC_PLEDGOR_RELATIONSHIP_VALUE, SOURCE_ID 
	   FROM SCI_SEC_PLDGR_MAP_TEMP);

INSERT INTO STAGE_SEC_PLDGR_MAP (CMS_SEC_PLDGR_MAP_ID, SPM_SEC_ID, CMS_PLEDGOR_DTL_ID, CMS_COLLATERAL_ID,
								   SEC_PLEDGOR_RELATIONSHIP_NUM, SEC_PLEDGOR_RELATIONSHIP_VALUE, SOURCE_ID)
		(SELECT CMS_SEC_PLDGR_MAP_ID, SPM_SEC_ID, CMS_PLEDGOR_DTL_ID, CMS_COLLATERAL_ID,
								   SEC_PLEDGOR_RELATIONSHIP_NUM, SEC_PLEDGOR_RELATIONSHIP_VALUE, SOURCE_ID 
	   FROM STAGE_SEC_PLDGR_MAP_TEMP);
								   
DROP INDEX MIG_TEMP_IDX01;
DROP INDEX MIG_TEMP_IDX02;
DROP INDEX MIG_TEMP_IDX03;
DROP INDEX MIG_TEMP_IDX04;
DROP INDEX MIG_TEMP_IDX05;
DROP INDEX MIG_TEMP_IDX06;
DROP INDEX MIG_TEMP_IDX07;

---------------------------------------------------------------------------------------------------------------------------------------------	
drop table tmp_pledgor_checklist;
create table tmp_pledgor_checklist (
	cms_pledgor_dtl_id	bigint,
	cms_lsp_lmt_profile_id	bigint,		
	pledgor_customer_id	bigint,
	cms_customer_id		bigint,
	pledgor_cif_id			varchar(19),
	is_borrower	char(1) default 'N',
	cms_act_checklist_id	bigint ,
	cms_stg_checklist_id	bigint,
	doc_orig_country	varchar(2),
	doc_orig_organisation	varchar(40),
	application_type	varchar(40),
	trx_reference_id	bigint		
) in CMS_MIG index in CMS_MIG_INDEX;

-- Insert into temporary checklist								   
insert into tmp_pledgor_checklist 
(cms_pledgor_dtl_id, cms_lsp_lmt_profile_id, doc_orig_country, doc_orig_organisation, 
	cms_customer_id, pledgor_cif_id, application_type, trx_reference_id)
(select distinct pg.CMS_PLEDGOR_DTL_ID, aa.cms_lsp_lmt_profile_id, pg.CMS_ORIG_COUNTRY, pg.CMS_ORIG_ORGANISATION,
	aa.cms_customer_id, pg.PLG_LE_ID, application_type, cast(aa.transaction_id as bigint)
from SCI_PLEDGOR_DTL_TEMP pg, cms_limit_security_map lsm, mig_tmp_aa aa
where pg.CMS_COLLATERAL_ID = lsm.cms_collateral_id
and lsm.cms_lsp_lmt_profile_id = aa.cms_lsp_lmt_profile_id);				

update tmp_pledgor_checklist
set pledgor_customer_id = 
	(select cms_le_sub_profile_id
	from sci_le_sub_profile sp, sci_le_main_profile mp
	where sp.cms_le_main_profile_id = mp.cms_le_main_profile_id
	and mp.lmp_le_id = pledgor_cif_id
	and mp.source_id = 'SIBS');
	
create index tmp_pledgor_chklist_idx1 on tmp_pledgor_checklist
	(pledgor_customer_id, cms_customer_id)
	allow reverse scans
	collect statistics;	
	
update tmp_pledgor_checklist
	set is_borrower = 'Y'
where pledgor_customer_id = cms_customer_id;

drop index tmp_pledgor_chklist_idx1;	
	
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
	
create index tmp_pledgor_chklist_idx1 on tmp_pledgor_checklist
	(is_borrower, cms_lsp_lmt_profile_id, cms_pledgor_dtl_id)
	allow reverse scans
	collect statistics;		
	
create index temp_index_2 on cms_checklist
	(category, sub_category, cms_lsp_lmt_profile_id, cms_pledgor_dtl_id, checklist_id)
	allow reverse scans
	COLLECT STATISTICS;		
	
-- Insert into actual checklist	
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
and not exists (select 1 from cms_checklist chk
				where chk.category = 'CC'
				and chk.sub_category = 'PLEDGOR'
				and chk.cms_lsp_lmt_profile_id = p.cms_lsp_lmt_profile_id
				and chk.cms_pledgor_dtl_id = p.cms_pledgor_dtl_id);	
	
create index temp_index_3 on stage_checklist
	(category, sub_category, cms_lsp_lmt_profile_id, cms_pledgor_dtl_id, checklist_id)
	allow reverse scans
	COLLECT STATISTICS;		
	
-- Insert into staging checklist	
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
and not exists (select 1 from stage_checklist chk
				where chk.category = 'CC'
				and chk.sub_category = 'PLEDGOR'
				and chk.cms_lsp_lmt_profile_id = p.cms_lsp_lmt_profile_id
				and chk.cms_pledgor_dtl_id = p.cms_pledgor_dtl_id);    	
	
update tmp_pledgor_checklist p
set cms_act_checklist_id = (select checklist_id from cms_checklist chk
							where chk.category = 'CC'
							and chk.sub_category = 'PLEDGOR'
							and chk.cms_lsp_lmt_profile_id = p.cms_lsp_lmt_profile_id
							and chk.cms_pledgor_dtl_id = p.cms_pledgor_dtl_id)
where is_borrower = 'N';	
	
update tmp_pledgor_checklist p
set cms_stg_checklist_id = (select checklist_id	from stage_checklist chk
							where chk.category = 'CC'
							and chk.sub_category = 'PLEDGOR'
							and chk.cms_lsp_lmt_profile_id = p.cms_lsp_lmt_profile_id
							and chk.cms_pledgor_dtl_id = p.cms_pledgor_dtl_id)
where is_borrower = 'N';	

drop index temp_index_2;
drop index temp_index_3;
drop index tmp_pledgor_chklist_idx1;

CREATE INDEX tmp_pledgor_chklist_idx1 ON tmp_pledgor_checklist
	(is_borrower, cms_act_checklist_id)
	allow reverse scans
	collect statistics;
	
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
					   