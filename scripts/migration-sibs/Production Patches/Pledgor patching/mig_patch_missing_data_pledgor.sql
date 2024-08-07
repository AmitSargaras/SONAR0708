ALTER TABLE MIG_CO018_PG
ADD COLUMN IS_VALID_2 CHAR(1);

CALL ADMIN_CMD('REORG TABLE MIG_CO018_PG');

UPDATE MIG_CO018_PG set IS_VALID_2 = 'N';

UPDATE MIG_CO018_PG pg set IS_VALID_2 = 'Y'
WHERE EXISTS(select 1 from MIG_ERROR_LOG err where err.KEY1_VALUE = pg.SECURITY_ID and INTERFACE_ID = 'CO018' and ERROR_CODE = 'SNF001');

UPDATE MIG_CO018_PG
SET IS_VALID_2 = 'N'
WHERE SECURITY_ID IS NOT NULL
AND NOT EXISTS
	(select 1 from CMS_SECURITY s
	where s.sci_security_dtl_id = SECURITY_ID
    AND IS_MIGRATED_IND = 'Y')
AND IS_VALID_2 = 'Y';

UPDATE MIG_CO018_PG t SET cms_pldgr_id = 
(SELECT cms_pledgor_dtl_id FROM sci_pledgor_dtl
  WHERE plg_le_id = t.pledgor_cif_id
	AND source_id = 'SIBS')
 WHERE IS_VALID_2 = 'Y';

UPDATE MIG_CO018_PG t SET (cms_act_col_id, cms_stg_col_id) =
	(select reference_id , staging_reference_id
	from cms_security sec, transaction trx
	where sec.cms_collateral_id = reference_id
	and trx.transaction_type = 'COL'
	and sec.sci_security_dtl_id = t.security_id)
WHERE IS_VALID_2 = 'Y';	 

UPDATE MIG_CO018_PG t SET cms_stg_pldgr_id = 
(SELECT cms_pledgor_dtl_id FROM stage_pledgor_dtl
  WHERE plg_le_id = t.pledgor_cif_id
	AND source_id = 'SIBS')
 WHERE IS_VALID_2 = 'Y';

UPDATE MIG_CO018_PG t
set (pledgor_country, pledgor_org_code, pledgor_id_num) = 
	(select cms_sub_orig_country, cms_sub_orig_organisation, lmp_inc_num_text
	from sci_le_sub_profile sp, sci_le_main_profile mp
	where mp.lmp_le_id = pledgor_cif_id
	and mp.source_id = 'SIBS'
	and mp.cms_le_main_profile_id = sp.cms_le_main_profile_id)
where IS_VALID_2 = 'Y'
AND cms_pldgr_id is null;

INSERT INTO SCI_PLEDGOR_DTL (CMS_PLEDGOR_DTL_ID, PLG_LE_ID, PLG_LEGAL_NAME, PLG_REL_TYPE_NUM, PLG_REL_TYPE_VALUE, SOURCE_ID, 
	CREATE_DATE, PLG_INC_NUM_TEXT, PLG_LE_ID_SRC_VALUE, CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 2)) as BIGINT),
 		 pledgor_cif_id, pledgor_legal_name, REL_WITH_BORROWER_CAT, rel_with_borrower_code, 'SIBS', current_timestamp,
		PLEDGOR_ID_NUM, 'SIBS', PLEDGOR_COUNTRY, PLEDGOR_ORG_CODE
	from (select row_number()over(partition by pledgor_cif_id) rownum,
		pledgor_cif_id, pledgor_legal_name, REL_WITH_BORROWER_CAT, rel_with_borrower_code, 
		PLEDGOR_ID_NUM, PLEDGOR_COUNTRY, PLEDGOR_ORG_CODE
   FROM MIG_CO018_PG
   WHERE IS_VALID_2 = 'Y'
   and cms_pldgr_id is null) as t
   where rownum = 1);

INSERT INTO STAGE_PLEDGOR_DTL (CMS_PLEDGOR_DTL_ID, PLG_LE_ID, PLG_LEGAL_NAME, PLG_REL_TYPE_NUM, PLG_REL_TYPE_VALUE, SOURCE_ID, CREATE_DATE, 
	PLG_INC_NUM_TEXT, PLG_LE_ID_SRC_VALUE, CMS_ORIG_COUNTRY, CMS_ORIG_ORGANISATION)
		(SELECT (CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR pledgor_seq), 2)) as BIGINT)),
 		 pledgor_cif_id, pledgor_legal_name, REL_WITH_BORROWER_CAT, rel_with_borrower_code, 'SIBS', current_timestamp,
		PLEDGOR_ID_NUM, 'SIBS', PLEDGOR_COUNTRY, PLEDGOR_ORG_CODE
	from (select row_number()over(partition by pledgor_cif_id) rownum,
		pledgor_cif_id, pledgor_legal_name, REL_WITH_BORROWER_CAT, rel_with_borrower_code,
		PLEDGOR_ID_NUM, PLEDGOR_COUNTRY, PLEDGOR_ORG_CODE	
   FROM MIG_CO018_PG
   WHERE IS_VALID_2 = 'Y'
   and cms_stg_pldgr_id is null) as t
   where rownum = 1);

UPDATE MIG_CO018_PG t SET cms_pldgr_id = 
(SELECT cms_pledgor_dtl_id FROM sci_pledgor_dtl
  WHERE plg_le_id = t.pledgor_cif_id
	AND source_id = 'SIBS')
where IS_VALID_2 = 'Y'
and cms_pldgr_id is null;

UPDATE MIG_CO018_PG t SET cms_stg_pldgr_id = 
(SELECT cms_pledgor_dtl_id FROM stage_pledgor_dtl
  WHERE plg_le_id = t.pledgor_cif_id
	AND source_id = 'SIBS')
where IS_VALID_2 = 'Y'
and cms_stg_pldgr_id is null;	

INSERT INTO SCI_SEC_PLDGR_MAP (CMS_SEC_PLDGR_MAP_ID, SPM_SEC_ID, CMS_PLEDGOR_DTL_ID, CMS_COLLATERAL_ID,
							   SEC_PLEDGOR_RELATIONSHIP_NUM, SEC_PLEDGOR_RELATIONSHIP_VALUE, SOURCE_ID)
(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR PLEDGOR_SEQ), 2)) as BIGINT),
		security_id, cms_pldgr_id, cms_act_col_id,
		rel_with_borrower_cat, rel_with_borrower_code, 'SIBS'
  FROM MIG_CO018_PG t
  WHERE NOT EXISTS (SELECT 1 FROM sci_sec_pldgr_map
                    WHERE cms_collateral_id = cms_act_col_id
                    AND cms_pledgor_dtl_id = cms_pldgr_id )
  AND IS_VALID_2 = 'Y'
  AND cms_act_col_id IS NOT NULL
  AND cms_pldgr_id IS NOT NULL);

UPDATE SCI_SEC_PLDGR_MAP SET SPM_ID = CMS_SEC_PLDGR_MAP_ID
where SPM_ID is null;

UPDATE MIG_CO018_PG t SET cms_act_spm_id = 
(SELECT CMS_SEC_PLDGR_MAP_ID FROM SCI_SEC_PLDGR_MAP
	WHERE CMS_PLEDGOR_DTL_ID = t.cms_pldgr_id
	AND CMS_COLLATERAL_ID = t.cms_act_col_id
	AND source_id = 'SIBS')
where IS_VALID_2 = 'Y'
and cms_act_spm_id is null;

INSERT INTO STAGE_SEC_PLDGR_MAP (CMS_SEC_PLDGR_MAP_ID, SPM_ID, SPM_SEC_ID, CMS_PLEDGOR_DTL_ID, CMS_COLLATERAL_ID,
							   SEC_PLEDGOR_RELATIONSHIP_NUM, SEC_PLEDGOR_RELATIONSHIP_VALUE, SOURCE_ID)
(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR PLEDGOR_SEQ), 2)) as BIGINT),
		cms_act_spm_id, security_id, cms_stg_pldgr_id, cms_stg_col_id,
		rel_with_borrower_cat, rel_with_borrower_code, 'SIBS'
 FROM MIG_CO018_PG t
 WHERE NOT EXISTS (SELECT 1 FROM stage_sec_pldgr_map
  					 WHERE cms_collateral_id = cms_stg_col_id
					 AND cms_pledgor_dtl_id = cms_stg_pldgr_id )
  AND IS_VALID_2 = 'Y'
  AND cms_stg_col_id IS NOT NULL
  AND cms_stg_pldgr_id IS NOT NULL);		
