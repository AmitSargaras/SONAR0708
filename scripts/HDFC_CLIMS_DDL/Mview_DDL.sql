--------------------------------------------------------
--  File created - Monday-March-28-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Materialized View BAHRAIN_UPLOAD_STATUS_MV
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "BAHRAIN_UPLOAD_STATUS_MV" ("STATUS", "FACILITY_SYSTEM_ID", "LINE_NO", "SERIAL_NO", "FACILITY_SYSTEM")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS (SELECT SPRO.STATUS,
    XREF.FACILITY_SYSTEM_ID,
    XREF.LINE_NO,
    XREF.SERIAL_NO,
    XREF.facility_system
  FROM SCI_LSP_APPR_LMTS SCI,
    SCI_LSP_SYS_XREF XREF,
    SCI_LSP_LMTS_XREF_MAP MAPSS,
    SCI_LSP_LMT_PROFILE PF,
    SCI_LE_SUB_PROFILE SPRO
  WHERE SCI.CMS_LIMIT_PROFILE_ID(+) = PF.CMS_LSP_LMT_PROFILE_ID
  AND PF.CMS_CUSTOMER_ID(+)         = Spro.CMS_LE_SUB_PROFILE_ID
    --AND spro.status                   = 'ACTIVE'
  AND SCI.CMS_LSP_APPR_LMTS_ID  = MAPSS.CMS_LSP_APPR_LMTS_ID(+)
  AND MAPSS.CMS_LSP_SYS_XREF_ID = XREF.CMS_LSP_SYS_XREF_ID(+)
  AND XREF.FACILITY_SYSTEM     IN('BAHRAIN')
  );

   COMMENT ON MATERIALIZED VIEW "BAHRAIN_UPLOAD_STATUS_MV"  IS 'snapshot table for snapshot CLIMSHDFCTEST.BAHRAIN_UPLOAD_STATUS_MV';
--------------------------------------------------------
--  DDL for Materialized View BAHRIN_UPLD_CHK_PARTY_MV
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "BAHRIN_UPLD_CHK_PARTY_MV" ("STATUS", "FACILITY_SYSTEM_ID", "LINE_NO", "SERIAL_NO", "FACILITY_SYSTEM", "LSP_LE_ID")
  SEGMENT CREATION DEFERRED
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS (select SPRO.STATUS,XREF.FACILITY_SYSTEM_ID,XREF.LINE_NO,XREF.SERIAL_NO,XREF.facility_system,spro.lsp_le_id
   FROM SCI_LSP_APPR_LMTS SCI,
    SCI_LSP_SYS_XREF XREF,
    SCI_LSP_LMTS_XREF_MAP MAPSS,
    SCI_LSP_LMT_PROFILE PF,
    SCI_LE_SUB_PROFILE SPRO 
    
  WHERE SCI.CMS_LIMIT_PROFILE_ID(+) = PF.CMS_LSP_LMT_PROFILE_ID   
  AND PF.CMS_CUSTOMER_ID(+)         = Spro.CMS_LE_SUB_PROFILE_ID 
  --AND spro.status                   = 'ACTIVE'
  AND SCI.CMS_LSP_APPR_LMTS_ID  = MAPSS.CMS_LSP_APPR_LMTS_ID(+)
  AND MAPSS.CMS_LSP_SYS_XREF_ID = XREF.CMS_LSP_SYS_XREF_ID(+)
  AND XREF.FACILITY_SYSTEM in('BAHRAIN'));

   COMMENT ON MATERIALIZED VIEW "BAHRIN_UPLD_CHK_PARTY_MV"  IS 'snapshot table for snapshot CLIMSHDFCTEST.BAHRIN_UPLD_CHK_PARTY_MV';
--------------------------------------------------------
--  DDL for Materialized View CMS_FAC_SEC_NEW_REPORT
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "CMS_FAC_SEC_NEW_REPORT" ("PARTY_ID", "PARTY_NAME", "SEGMENTNAME", "RMREGION", "RMNAME", "FACILITYNAME", "LINENO", "ISSECURED", "SECTYPE", "SECURITYSUBTYPE", "COLLATERAL_NAME", "STATEMENTTYPE", "STATUS", "DOC_ITEM_ID", "DOCUMENT_CODE", "ENTRY_CODE", "ID", "TRANSACTION_DATE", "PROFILE_ID")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS (
  (SELECT DISTINCT sub_profile.lsp_le_id AS party_id,
    sub_profile.lsp_short_name           AS party_name,
    cc_segment.entry_name                AS segmentName,
    reg.region_name                      AS rmRegion,
    rm.rm_mgr_name                       AS rmname,
    lmts.facility_name                   AS FacilityName,
    xref.line_no                         AS LineNo,
    lmts.is_secured                      AS isSecured,
    secdetail.type_name                  AS secType,
    secdetail.subtype_name               AS SecuritySubType,
    colMaster.new_collateral_description AS collateral_name,
    checklist_item.DOC_DESCRIPTION       AS statementType,
    CASE
      WHEN checklist_item.status IS NULL
      THEN 'Not Maintained'
      WHEN checklist_item.status IS NOT NULL
      THEN 'Maintained'
    END AS status,
    doc_master.doc_item_id,
     doc_master.document_code,
     cc_segment.entry_code, 
    rm.id,
    trx.transaction_date,
    sub_profile.cms_le_sub_profile_id AS profile_id
  FROM CMS_LIMIT_SECURITY_MAP lsm,
    SCI_LSP_APPR_LMTS lmts,
    SCI_LSP_LMT_PROFILE pf,
    SCI_LE_SUB_PROFILE sub_profile,
    (SELECT entry_name,
      entry_code
    FROM common_code_category_entry
    WHERE category_code = 'HDFC_SEGMENT'
    ) cc_segment,
    CMS_SECURITY secDetail,
    cms_relationship_mgr rm ,
    SCI_LE_REG_ADDR addr,
    CMS_REGION reg,
    SCI_LSP_SYS_XREF XREF,
    SCI_LSP_LMTS_XREF_MAP MAPSS,
    cms_collateral_new_master colMaster,
    cms_checklist checklist,
    transaction trx,
    cms_checklist_item checklist_item,
    (SELECT docitem.document_code,
      docitem.doc_item_id,
      mst.masterlist_id,
      mst.security_sub_type_id
    FROM cms_document_masterlist mst,
      cms_document_item docItem
    WHERE mst.category    = 'F'
    AND mst.masterlist_id = docitem.masterlist_id
    ) doc_master
  WHERE sub_profile.cms_le_sub_profile_id = pf.cms_customer_id(+)
  AND pf.cms_lsp_lmt_profile_id           = lmts.CMS_LIMIT_PROFILE_ID(+)
  AND lmts.CMS_LSP_APPR_LMTS_ID           = MAPSS.CMS_LSP_APPR_LMTS_ID(+)
  AND MAPSS.CMS_LSP_SYS_XREF_ID           = XREF.CMS_LSP_SYS_XREF_ID(+)
  AND lmts.cms_limit_status              <> 'DELETED'
  AND lmts.cms_lsp_appr_lmts_id           = lsm.cms_lsp_appr_lmts_id(+)
  AND (lsm.update_status_ind             <> 'D'
  OR lsm.update_status_ind               IS NULL)
  AND LSM.CMS_COLLATERAL_ID               = secdetail.cms_collateral_id (+)
  AND lmts.lmt_fac_code                   = doc_master.security_sub_type_id(+)
  AND lmts.cms_lsp_appr_lmts_id           = checklist.cms_collateral_id(+)
  AND checklist.checklist_id              = checklist_item.checklist_id(+)
  AND checklist.checklist_id              = trx.reference_id(+)
  AND (trx.transaction_type               ='CHECKLIST'
  OR trx.transaction_type                IS NULL)
  AND (checklist.category                 = 'F'
  OR checklist.category                  IS NULL)
  AND (checklist_item.is_deleted         != 'Y'
  OR checklist_item.is_deleted           IS NULL)
  AND colMaster.new_collateral_code(+)    = secDetail.collateral_code
  AND cc_segment.entry_code(+)            = sub_profile.lsp_sgmnt_code_value
  AND sub_profile.cms_le_main_profile_id  = addr.cms_le_main_profile_id(+)
  AND rm.id(+)                            = sub_profile.relation_mgr
  AND reg.id (+)                          = sub_profile.rm_region
  AND addr.lra_type_value                 = 'CORPORATE'
  AND sub_profile.status                 != 'INACTIVE'
  )
UNION ALL
  ( SELECT DISTINCT sub_profile.lsp_le_id AS party_id,
    sub_profile.lsp_short_name            AS party_name,
    cc_segment.entry_name                 AS segmentName,
    reg.region_name                       AS rmRegion,
    rm.rm_mgr_name                        AS rmname,
    lmts.facility_name                    AS FacilityName,
    xref.line_no                          AS LineNo,
    lmts.is_secured                       AS isSecured,
    secdetail.type_name                   AS secType,
    secdetail.subtype_name                AS SecuritySubType,
    colMaster.new_collateral_description  AS collateral_name,
    checklist_item.DOC_DESCRIPTION        AS statementType,
    CASE
      WHEN checklist_item.status IS NULL
      THEN 'Not Maintained'
      WHEN checklist_item.status IS NOT NULL
      THEN 'Maintained'
    END AS status,
    doc_master.doc_item_id,
     doc_master.document_code,    
    cc_segment.entry_code, 
    rm.id,
    trx.transaction_date,
    sub_profile.cms_le_sub_profile_id AS profile_id
  FROM CMS_LIMIT_SECURITY_MAP lsm,
    SCI_LSP_APPR_LMTS lmts,
    SCI_LSP_LMT_PROFILE pf,
    SCI_LE_SUB_PROFILE sub_profile,
    (SELECT entry_name,
      entry_code
    FROM common_code_category_entry
    WHERE category_code = 'HDFC_SEGMENT'
    ) cc_segment,
    CMS_SECURITY secDetail,
    cms_relationship_mgr rm ,
    SCI_LE_REG_ADDR addr,
    CMS_REGION reg,
    SCI_LSP_SYS_XREF XREF,
    SCI_LSP_LMTS_XREF_MAP MAPSS,
    cms_collateral_new_master colMaster,
    cms_checklist checklist,
    transaction trx,
    cms_checklist_item checklist_item,
    (SELECT docitem.document_code,
      docitem.doc_item_id,
      mst.masterlist_id,
      mst.security_sub_type_id
    FROM cms_document_masterlist mst,
      cms_document_item docItem
    WHERE mst.category    = 'S'
    AND mst.masterlist_id = docitem.masterlist_id
    ) doc_master
  WHERE sub_profile.cms_le_sub_profile_id = pf.cms_customer_id(+)
  AND pf.cms_lsp_lmt_profile_id           = lmts.CMS_LIMIT_PROFILE_ID(+)
  AND lmts.CMS_LSP_APPR_LMTS_ID           = MAPSS.CMS_LSP_APPR_LMTS_ID(+)
  AND MAPSS.CMS_LSP_SYS_XREF_ID           = XREF.CMS_LSP_SYS_XREF_ID(+)
  AND lmts.cms_limit_status              <> 'DELETED'
  AND lmts.cms_lsp_appr_lmts_id           = lsm.cms_lsp_appr_lmts_id(+)
  AND (lsm.update_status_ind             <> 'D'
  OR lsm.update_status_ind               IS NULL)
  AND LSM.CMS_COLLATERAL_ID               = secdetail.cms_collateral_id (+)
  AND secDetail.security_sub_type_id      = doc_master.security_sub_type_id(+)
  AND lmts.cms_lsp_appr_lmts_id           = checklist.cms_collateral_id(+)
  AND checklist.checklist_id              = checklist_item.checklist_id(+)
  AND checklist.checklist_id              = trx.reference_id(+)
  AND (trx.transaction_type               ='CHECKLIST'
  OR trx.transaction_type                IS NULL)
  AND (checklist.category                 = 'S'
  OR checklist.category                  IS NULL)
  AND (checklist_item.is_deleted         != 'Y'
  OR checklist_item.is_deleted           IS NULL)
  AND colMaster.new_collateral_code(+)    = secDetail.collateral_code
  AND cc_segment.entry_code(+)            = sub_profile.lsp_sgmnt_code_value
  AND sub_profile.cms_le_main_profile_id  = addr.cms_le_main_profile_id(+)
  AND rm.id(+)                            = sub_profile.relation_mgr
  AND reg.id (+)                          = sub_profile.rm_region
  AND addr.lra_type_value                 = 'CORPORATE'
  AND sub_profile.status                 != 'INACTIVE'
  ) );

   COMMENT ON MATERIALIZED VIEW "CMS_FAC_SEC_NEW_REPORT"  IS 'snapshot table for snapshot CLIMSHDFCTEST.CMS_FAC_SEC_NEW_REPORT';
--------------------------------------------------------
--  DDL for Materialized View CMS_RECUR_NEW_REPORT_OLD
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "CMS_RECUR_NEW_REPORT_OLD" ("PARTY_ID", "PARTY_NAME", "SEGMENTNAME", "RMREGION", "RMNAME", "CAMTYPE", "RAMRATING", "STATEMENTTYPE", "STATUS", "DOCUMENT_CODE", "TRANSACTION_DATE", "PROFILE_ID")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS (
  (SELECT DISTINCT
    ------------------------------------------------------------------
    sub_profile.lsp_le_id      AS party_id,
    sub_profile.lsp_short_name AS party_name,
    cc_segment.entry_name      AS segmentName,
    reg.region_name            AS rmRegion,
    rm.rm_mgr_name             AS rmname,
    pf.cam_type                AS CAMType,
    pf.cms_appr_officer_grade  AS RAMRating,
    chklist.statement_type     AS statementType,
    'Not Maintained'           AS status,
    -------------------------------------------------------------------
    glb.document_code,
    trx.transaction_date,
    sub_profile.cms_le_sub_profile_id AS profile_id
    -------------------------------------------------------------------
  FROM cms_document_globallist glb,
    cms_checklist checklist,
    (SELECT item.document_code,
      item.statement_type,
      chk.checklist_id,
      item.status
    FROM cms_checklist_item item,
      cms_checklist chk
    WHERE item.checklist_id = chk.checklist_id
    AND item.is_deleted     = 'N'
    GROUP BY item.document_code,
      item.statement_type,
      chk.checklist_id,
      item.status
    )chklist,
    SCI_LSP_LMT_PROFILE pf,
    SCI_LE_SUB_PROFILE sub_profile,
    (SELECT entry_name,
      entry_code
    FROM common_code_category_entry
    WHERE category_code = 'HDFC_SEGMENT'
    ) cc_segment,
    cms_relationship_mgr rm ,
    SCI_LE_REG_ADDR addr,
    CMS_REGION reg,
    transaction trx
  WHERE glb.document_code NOT IN
    (SELECT item.document_code
    FROM cms_checklist_item item
    WHERE item.checklist_id = checklist.checklist_id
    AND item.is_deleted     = 'N'
    )
  AND checklist.checklist_id             = chklist.checklist_id
  AND glb.category                       = 'REC'
  AND glb.statement_type                 = chklist.statement_type
  AND glb.deprecated                     = 'N'
  AND sub_profile.cms_le_sub_profile_id  = pf.cms_customer_id(+)
  AND checklist.cms_lsp_lmt_profile_id   = pf.cms_lsp_lmt_profile_id
  AND checklist.checklist_id             = trx.reference_id(+)
  AND (trx.transaction_type              ='CHECKLIST'
  OR trx.transaction_type               IS NULL)
  AND cc_segment.entry_code(+)           = sub_profile.lsp_sgmnt_code_value
  AND sub_profile.cms_le_main_profile_id = addr.cms_le_main_profile_id(+)
  AND rm.id(+)                           = sub_profile.relation_mgr
  AND reg.id (+)                         = sub_profile.rm_region
  AND addr.lra_type_value                = 'CORPORATE'
  AND sub_profile.status                != 'INACTIVE'
  )
UNION ALL
  ( SELECT DISTINCT
    ------------------------------------------------------------------
    sub_profile.lsp_le_id      AS party_id,
    sub_profile.lsp_short_name AS party_name,
    cc_segment.entry_name      AS segmentName,
    reg.region_name            AS rmRegion,
    rm.rm_mgr_name             AS rmname,
    pf.cam_type                AS CAMType,
    pf.cms_appr_officer_grade  AS RAMRating,
    chklist.statement_type     AS statementType,
    chklist.status             AS status,
    -------------------------------------------------------------------
    glb.document_code,
    trx.transaction_date,
    sub_profile.cms_le_sub_profile_id AS profile_id
    -------------------------------------------------------------------
  FROM cms_document_globallist glb,
    cms_checklist checklist,
    (SELECT DISTINCT item.document_code,
      item.statement_type,
      chk.checklist_id,
      item.status
    FROM cms_checklist_item item,
      cms_checklist chk
    WHERE item.checklist_id = chk.checklist_id
    AND chk.checklist_id    = item.checklist_id
    AND item.is_deleted     = 'N'
    GROUP BY item.document_code,
      item.statement_type,
      chk.checklist_id,
      item.status
    )chklist,
    SCI_LSP_LMT_PROFILE pf,
    SCI_LE_SUB_PROFILE sub_profile,
    (SELECT entry_name,
      entry_code
    FROM common_code_category_entry
    WHERE category_code = 'HDFC_SEGMENT'
    ) cc_segment,
    cms_relationship_mgr rm ,
    SCI_LE_REG_ADDR addr,
    CMS_REGION reg,
    transaction trx
  WHERE glb.document_code IN
    (SELECT item.document_code
    FROM cms_checklist_item item
    WHERE item.checklist_id = chklist.checklist_id
    )
  AND checklist.checklist_id             = chklist.checklist_id
  AND glb.category                       = 'REC'
  AND glb.statement_type                 = chklist.statement_type
  AND glb.deprecated                     = 'N'
  AND sub_profile.cms_le_sub_profile_id  = pf.cms_customer_id(+)
  AND checklist.cms_lsp_lmt_profile_id   = pf.cms_lsp_lmt_profile_id
  AND checklist.checklist_id             = trx.reference_id(+)
  AND (trx.transaction_type              ='CHECKLIST'
  OR trx.transaction_type               IS NULL)
  AND cc_segment.entry_code(+)           = sub_profile.lsp_sgmnt_code_value
  AND sub_profile.cms_le_main_profile_id = addr.cms_le_main_profile_id(+)
  AND rm.id(+)                           = sub_profile.relation_mgr
  AND reg.id (+)                         = sub_profile.rm_region
  AND addr.lra_type_value                = 'CORPORATE'
  AND sub_profile.status                != 'INACTIVE'
  AND glb.document_code                  = chklist.document_code
  ) );

   COMMENT ON MATERIALIZED VIEW "CMS_RECUR_NEW_REPORT_OLD"  IS 'snapshot table for snapshot CLIMSHDFCTEST.CMS_RECUR_NEW_REPORT_OLD';
--------------------------------------------------------
--  DDL for Materialized View CUSTOMER_TOTAL_LIMIT_MV
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "CUSTOMER_TOTAL_LIMIT_MV" ("PARTY_NAME", "PARTY_ADDRESS", "CITY", "PINCODE", "TELEPHONE", "EMAIL", "FAX", "SEGMENTNAME", "PARTYID", "RISKGRADE", "INDUSTRYNAME", "RBI_CODE_CATEGOTY_NAME", "ENTITY", "RMNAME", "PARTYGRPNAME", "FACILITYNAME", "FACILITYTYPE", "FACILITYCAT", "FACILITYAMOUNT", "CURRENCY", "REGION", "IS_SECURED", "SECURITYTYPE", "SECURITYSUBTYPE", "COLLATERALNAME", "RELATION_MGR", "CMS_LE_SUB_PROFILE_ID", "LSP_SGMNT_CODE_VALUE", "FAC_BANKING_ARRANGEMENT", "FAC_CLAUSE_AS_PER_POLICY")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS (
SELECT sub_profile.lsp_short_name AS party_name,
				  address.lra_addr_line_1
				  || ' '
				  || address.lra_addr_line_2
				  || ' '
				  || address.lra_addr_line_3 AS party_address,
				-- (select city_name from CMS_CITY where id= address.lra_city_text)  AS city,
        ct.city_name  AS city,
				  address.lra_post_code      AS pincode,
				  address.lra_telephone_text AS telephone,
				  address.lra_email_text     AS email,
				  address.LRA_TELEX_TEXT    AS fax,
				 -- (select entry_name from COMMON_CODE_CATEGORY_ENTRY where ENTRY_CODE = sub_profile.LSP_SGMNT_CODE_VALUE and category_code = 'HDFC_SEGMENT')  AS segmentName,
				seg.entry_name AS segmentName,
          sub_profile. lsp_le_id    AS partyid,
				  pf.CMS_APPR_OFFICER_GRADE AS riskgrade,
				-- (select entry_name from COMMON_CODE_CATEGORY_ENTRY where ENTRY_CODE = SUB_PROFILE.IND_NM and category_code = 'HDFC_INDUSTRY')  AS industryName,
         ind.entry_name AS industryName,
--         		 (select entry_code
--				  ||'-'
--				  ||entry_name from COMMON_CODE_CATEGORY_ENTRY where ENTRY_CODE = sub_profile.rbi_ind_code and category_code = 'HDFC_RBI_CODE')  AS rbi_Code_Categoty_Name,
        		(rbi.entry_code  ||'-'
				  ||rbi.entry_name) AS rbi_Code_Categoty_Name,
            -- (select entry_name from COMMON_CODE_CATEGORY_ENTRY where ENTRY_CODE = sub_profile.entity  and category_code = 'Entity')  AS entity,
          	 	ent.entry_name AS entity,
           --    (select rm_mgr_name from cms_relationship_mgr where id = sub_profile.relation_mgr)  AS rmname,
               rm.rm_mgr_name  AS rmname,
--				  COALESCE(
--				  (SELECT partygr.party_group_name
--				  FROM CMS_PARTY_GROUP PARTYGR
--				  WHERE partygr.id = sub_profile.party_grp_nm
--				  ),'')              AS partyGrpname,
          partygr.party_group_name AS partyGrpname,
				  lmts.facility_name AS facilityName,
				  lmts.facility_type AS facilityType,
--				  (SELECT ENTRY_NAME
--				  FROM common_code_category_entry
--				  WHERE category_code='FACILITY_CATEGORY'
--				  AND entry_code     =lmts.facility_cat
--				  )                                      AS facilityCat,
           fcat.ENTRY_NAME AS facilityCat,
				  COALESCE(lmts.total_released_amount,0) AS facilityamount,
				  lmts.lmt_crrncy_iso_code               AS currency,
          -- (select region_name from CMS_REGION where id = ADDRESS.LRA_REGION)  AS Region,
           reg.region_name AS Region,
				  lmts.is_secured,
				  sec.type_name    AS securityType ,
				  sec.subtype_name AS securitySubtype ,
--				  (SELECT NEW_COLLATERAL_DESCRIPTION
--				  FROM cms_collateral_new_master
--				  WHERE NEW_COLLATERAL_CODE = sec.collateral_code
--				  ) AS collateralName
          cmaster.NEW_COLLATERAL_DESCRIPTION AS collateralName,
          sub_profile.relation_mgr,
          sub_profile.cms_le_sub_profile_id,
          sub_profile.lsp_sgmnt_code_value,
          lmts.BANKING_ARRANGEMENT FAC_BANKING_ARRANGEMENT,
          lmts.clause_as_per_policy FAC_CLAUSE_AS_PER_POLICY
				FROM SCI_LE_SUB_PROFILE SUB_PROFILE ,
				  SCI_LE_REG_ADDR ADDRESS ,
				  SCI_LSP_APPR_LMTS lmts ,
				  SCI_LSP_LMT_PROFILE PF ,
				 -- transaction trans,
				  CMS_LIMIT_SECURITY_MAP lsm,
				  cms_security sec,
          common_code_category_entry fcat,
          common_code_category_entry seg,
          CMS_REGION reg,
          CMS_CITY ct,
          CMS_PARTY_GROUP PARTYGR,
          cms_relationship_mgr rm,
          COMMON_CODE_CATEGORY_ENTRY ind,
          COMMON_CODE_CATEGORY_ENTRY ent,
          COMMON_CODE_CATEGORY_ENTRY rbi,
          cms_collateral_new_master cmaster
			 WHERE 
			sub_profile.cms_le_main_profile_id = address.cms_le_main_profile_id(+)
					AND lmts.CMS_LSP_APPR_LMTS_ID            = lsm.CMS_LSP_APPR_LMTS_ID(+)
					AND sec.CMS_COLLATERAL_ID (+)            = lsm.CMS_COLLATERAL_ID
					AND (lsm.UPDATE_STATUS_IND              != 'D'
					OR lsm.UPDATE_STATUS_IND                IS NULL)
					AND (lsm.CHARGE_ID                       =
					  (SELECT MAX(CHARGE_ID)
					  FROM CMS_LIMIT_SECURITY_MAP MAPS1
					  WHERE MAPS1.CMS_COLLATERAL_ID=sec.CMS_COLLATERAL_ID
                                          and MAPS1.cms_lsp_appr_lmts_id=lmts.CMS_LSP_APPR_LMTS_ID
					  ) OR lsm.CHARGE_ID                IS NULL)
				--	AND trans.reference_id                 = sub_profile.cms_le_sub_profile_id
			--		AND trans.transaction_type             = 'CUSTOMER'
					AND ADDRESS.LRA_TYPE_VALUE             = 'CORPORATE'
					AND pf.cms_lsp_lmt_profile_id          = lmts.CMS_LIMIT_PROFILE_ID
					AND SUB_PROFILE.CMS_LE_SUB_PROFILE_ID  = PF.CMS_CUSTOMER_ID
			--		AND ADDRESS.LRA_TYPE_VALUE             = 'CORPORATE'
					AND sub_profile.status                != 'INACTIVE'
					AND lmts.cms_limit_status             <> 'DELETED'
          and fcat.category_code='FACILITY_CATEGORY'
				  AND fcat.entry_code(+)     =lmts.facility_cat
          and reg.id(+) = ADDRESS.LRA_REGION
          and ct.id(+)= address.lra_city_text
          and seg.ENTRY_CODE(+) = sub_profile.LSP_SGMNT_CODE_VALUE 
          and seg.category_code = 'HDFC_SEGMENT'
          and  partygr.id(+) = sub_profile.party_grp_nm
         and rm.id(+) = sub_profile.relation_mgr
         and ind.ENTRY_CODE(+) = SUB_PROFILE.IND_NM 
         and ind.category_code = 'HDFC_INDUSTRY'
         and ent.ENTRY_CODE(+) = sub_profile.entity  
         and ent.category_code = 'Entity'
         and rbi.ENTRY_CODE(+) = sub_profile.rbi_ind_code 
         and rbi.category_code = 'HDFC_RBI_CODE'
         and cmaster.NEW_COLLATERAL_CODE(+) = sec.collateral_code
         );

   COMMENT ON MATERIALIZED VIEW "CUSTOMER_TOTAL_LIMIT_MV"  IS 'snapshot table for snapshot CLIMSHDFCTEST.CUSTOMER_TOTAL_LIMIT_MV';
--------------------------------------------------------
--  DDL for Materialized View EWS_STOCK_DEFERRAL_MV
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "EWS_STOCK_DEFERRAL_MV" ("PARTYID", "PARTYNAME", "SEGMENTNAME", "RMREGION", "RMNAME", "DUEDATE", "RECEIVEDDATE", "PERIODDESC", "COMPONENT", "header", "FLAG", "COLLATERALSHARE", "GROSSVALUE", "MARGIN", "NETAMOUNT", "DP", "DP_CALCULATE_MANUALLY", "COMPONENT_CATEGORY", "MAKER", "MAKERDATETIME", "APPROVED_BY", "CHECKERDATETIME")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS SELECT DISTINCT sp.lsp_le_id AS partyId,
  sp.lsp_short_name          AS partyname,
  ci.entry_name              AS segmentname,
  rgn.region_name AS rmRegion,
  rm.rm_mgr_name                        AS rmname,
  TO_CHAR(date1.due_date,'DD/MON/YYYY') AS duedate,
  TO_CHAR(date1.LAST_UPDATED_ON,'DD/MON/YYYY') AS receiveddate, 
  doc_globl.document_description AS periodDesc,
  cc.entry_name       AS component,
  stockdet.stock_type AS "header",
  CASE
    WHEN stockdet.stock_type = 'CurrentAsset'
    THEN
      (SELECT has_insurance
      FROM cms_component
      WHERE component_code=cc.entry_code
      AND component_type  = 'Current_Asset'
      )
    WHEN stockdet.stock_type = 'CurrentLiabilities'
    THEN
      (SELECT has_insurance
      FROM cms_component
      WHERE component_code=cc.entry_code
      AND component_type  = 'Current_Liability'
      )
  END                         AS flag,
  date1.fundedshare           AS collateralShare,
  stockdet.COMPONENT_AMOUNT   AS grossValue,
  stockdet.margin             AS margin,
  stockdet.lonable            AS netAmount,
  date1.calculateddp          AS DP,
  CASE
      WHEN date1.DP_CALCULATE_MANUALLY is null
      THEN 'NO'
      WHEN date1.DP_CALCULATE_MANUALLY = 'NO'
      THEN 'NO'
       END  AS DP_CALCULATE_MANUALLY ,
  cms_com.COMPONENT_CATEGORY  AS COMPONENT_CATEGORY,
  CASE
    WHEN trx.from_state = 'PENDING_PERFECTION'
    THEN
      (SELECT hist.login_id
      FROM trans_history hist
      WHERE hist.transaction_id = trx.transaction_id
      AND hist.from_state       = 'PENDING_PERFECTION'
      AND hist.to_state         ='DRAFT'
      )
    WHEN trx.from_state = 'PENDING_CREATE'
    THEN
      (SELECT hist.login_id
      FROM trans_history hist
      WHERE hist.transaction_id = trx.transaction_id
      AND hist.from_state      IN ('ND','DRAFT')
      AND hist.to_state         ='PENDING_CREATE'
      )
    WHEN trx.from_state = 'PENDING_UPDATE'
    THEN
      (SELECT hist.login_id
      FROM trans_history hist
      WHERE hist.TR_HISTORY_ID=
        (SELECT MAX(TR_HISTORY_ID)
        FROM trans_history
        WHERE transaction_id = trx.transaction_id
        AND from_state      IN ('ACTIVE','DRAFT')
        AND to_state         = 'PENDING_UPDATE'
        )
      )
    WHEN trx.from_state = 'PENDING_DELETE'
    THEN
      (SELECT hist.login_id
      FROM trans_history hist
      WHERE hist.TR_HISTORY_ID=
        (SELECT MAX(TR_HISTORY_ID)
        FROM trans_history
        WHERE transaction_id = trx.transaction_id
        AND from_state       ='ACTIVE'
        AND to_state         ='PENDING_DELETE'
        )
      )
    WHEN trx.from_state = 'ACTIVE'
    THEN
      (SELECT hist.login_id
      FROM trans_history hist
      WHERE hist.TR_HISTORY_ID=
        (SELECT MAX(TR_HISTORY_ID)
        FROM trans_history
        WHERE transaction_id = trx.transaction_id
        AND from_state       ='ACTIVE'
        AND to_state        IN ('PENDING_UPDATE','PENDING_DELETE')
        )
      )
    WHEN trx.from_state = 'REJECTED'
    THEN
      (SELECT hist.login_id
      FROM trans_history hist
      WHERE hist.TR_HISTORY_ID=
        (SELECT MAX(TR_HISTORY_ID)
        FROM trans_history
        WHERE transaction_id = trx.transaction_id
        AND from_state       = 'REJECTED'
        AND to_state         ='ACTIVE'
        )
      )
    WHEN trx.from_state = 'DRAFT'
    THEN
      CASE
        WHEN trx.status = 'PENDING_UPDATE'
        THEN
          (SELECT hist.login_id
          FROM trans_history hist
          WHERE hist.TR_HISTORY_ID=
            (SELECT MAX(TR_HISTORY_ID)
            FROM trans_history
            WHERE transaction_id = trx.transaction_id
            AND from_state       = 'DRAFT'
            AND to_state         ='PENDING_UPDATE'
            )
          )
        WHEN trx.status = 'ACTIVE'
        THEN
          (SELECT hist.login_id
          FROM trans_history hist
          WHERE hist.TR_HISTORY_ID=
            (SELECT MAX(TR_HISTORY_ID)
            FROM trans_history
            WHERE transaction_id = trx.transaction_id
            AND from_state       = 'DRAFT'
            AND to_state         ='ACTIVE'
            )
          )
      END
  END AS Maker,
  CASE
    WHEN trx.from_state = 'PENDING_PERFECTION'
    THEN
      (SELECT TO_CHAR(hist.TRANSACTION_DATE ,'DD-Mon-yy HH:MI:SS')
      FROM trans_history hist
      WHERE hist.transaction_id = trx.transaction_id
      AND hist.from_state       = 'PENDING_PERFECTION'
      AND hist.to_state         ='DRAFT'
      )
    WHEN trx.from_state = 'PENDING_CREATE'
    THEN
      (SELECT TO_CHAR(hist.TRANSACTION_DATE ,'DD-Mon-yy HH:MI:SS')
      FROM trans_history hist
      WHERE hist.transaction_id = trx.transaction_id
      AND hist.from_state      IN ('ND','DRAFT')
      AND hist.to_state         ='PENDING_CREATE'
      )
    WHEN trx.from_state = 'PENDING_UPDATE'
    THEN
      (SELECT TO_CHAR(hist.TRANSACTION_DATE ,'DD-Mon-yy HH:MI:SS')
      FROM trans_history hist
      WHERE hist.TR_HISTORY_ID=
        (SELECT MAX(TR_HISTORY_ID)
        FROM trans_history
        WHERE transaction_id = trx.transaction_id
        AND from_state      IN ('ACTIVE','DRAFT')
        AND to_state         = 'PENDING_UPDATE'
        )
      )
    WHEN trx.from_state = 'PENDING_DELETE'
    THEN
      (SELECT TO_CHAR(hist.TRANSACTION_DATE ,'DD-Mon-yy HH:MI:SS')
      FROM trans_history hist
      WHERE hist.TR_HISTORY_ID=
        (SELECT MAX(TR_HISTORY_ID)
        FROM trans_history
        WHERE transaction_id = trx.transaction_id
        AND from_state       ='ACTIVE'
        AND to_state         ='PENDING_DELETE'
        )
      )
    WHEN trx.from_state = 'ACTIVE'
    THEN
      (SELECT TO_CHAR(hist.TRANSACTION_DATE ,'DD-Mon-yy HH:MI:SS')
      FROM trans_history hist
      WHERE hist.TR_HISTORY_ID=
        (SELECT MAX(TR_HISTORY_ID)
        FROM trans_history
        WHERE transaction_id = trx.transaction_id
        AND from_state       ='ACTIVE'
        AND to_state        IN ('PENDING_UPDATE','PENDING_DELETE')
        )
      )
    WHEN trx.from_state = 'REJECTED'
    THEN
      (SELECT TO_CHAR(hist.TRANSACTION_DATE ,'DD-Mon-yy HH:MI:SS')
      FROM trans_history hist
      WHERE hist.TR_HISTORY_ID=
        (SELECT MAX(TR_HISTORY_ID)
        FROM trans_history
        WHERE transaction_id = trx.transaction_id
        AND from_state       = 'REJECTED'
        AND to_state         ='ACTIVE'
        )
      )
    WHEN trx.from_state = 'DRAFT'
    THEN
      CASE
        WHEN trx.status = 'PENDING_UPDATE'
        THEN
          (SELECT TO_CHAR(hist.TRANSACTION_DATE ,'DD-Mon-yy HH:MI:SS')
          FROM trans_history hist
          WHERE hist.TR_HISTORY_ID=
            (SELECT MAX(TR_HISTORY_ID)
            FROM trans_history
            WHERE transaction_id = trx.transaction_id
            AND from_state       = 'DRAFT'
            AND to_state         ='PENDING_UPDATE'
            )
          )
        WHEN trx.status = 'ACTIVE'
        THEN
          (SELECT TO_CHAR(hist.TRANSACTION_DATE ,'DD-Mon-yy HH:MI:SS')
          FROM trans_history hist
          WHERE hist.TR_HISTORY_ID=
            (SELECT MAX(TR_HISTORY_ID)
            FROM trans_history
            WHERE transaction_id = trx.transaction_id
            AND from_state       = 'DRAFT'
            AND to_state         ='ACTIVE'
            )
          )
      END
  END AS MakerDateTime,
  CASE
    WHEN trx.status   = 'PENDING_CREATE'
    OR trx.from_state = 'PENDING_PERFECTION'
    THEN ''
    WHEN trx.status = 'PENDING_UPDATE'
    THEN
      (SELECT hist.login_id
      FROM trans_history hist
      WHERE hist.TR_HISTORY_ID=
        (SELECT MAX(TR_HISTORY_ID)
        FROM trans_history
        WHERE transaction_id = trx.transaction_id
        AND from_state      IN ('PENDING_UPDATE','ACTIVE')
        AND to_state        IN ('PENDING_UPDATE','ACTIVE')
        )
      )
    WHEN ((trx.status  != 'PENDING_CREATE'
    AND trx.from_state != 'PENDING_PERFECTION')
    AND trx.status     != 'PENDING_UPDATE')
    THEN TO_CHAR(trx.login_id)
  END AS Approved_By,
  CASE
    WHEN trx.from_state = 'PENDING_CREATE'
    THEN
      (SELECT TO_CHAR(hist.TRANSACTION_DATE ,'DD-Mon-yy HH:MI:SS')
      FROM trans_history hist
      WHERE hist.transaction_id = trx.transaction_id
      AND hist.from_state       ='PENDING_CREATE'
      AND hist.to_state         ='ACTIVE'
      )
    WHEN trx.from_state = 'PENDING_UPDATE'
    THEN
      (SELECT TO_CHAR(hist.TRANSACTION_DATE ,'DD-Mon-yy HH:MI:SS')
      FROM trans_history hist
      WHERE hist.TR_HISTORY_ID=
        (SELECT MAX(TR_HISTORY_ID)
        FROM trans_history
        WHERE transaction_id = trx.transaction_id
        AND from_state       ='PENDING_UPDATE'
        AND to_state         ='ACTIVE'
        )
      )
    WHEN trx.from_state = 'PENDING_DELETE'
    THEN
      (SELECT TO_CHAR(hist.TRANSACTION_DATE ,'DD-Mon-yy HH:MI:SS')
      FROM trans_history hist
      WHERE hist.TR_HISTORY_ID=
        (SELECT MAX(TR_HISTORY_ID)
        FROM trans_history
        WHERE transaction_id = trx.transaction_id
        AND from_state       ='PENDING_DELETE'
        AND to_state         ='ACTIVE'
        )
      )
    WHEN trx.from_state = 'ACTIVE'
    THEN
      (SELECT TO_CHAR(hist.TRANSACTION_DATE ,'DD-Mon-yy HH:MI:SS')
      FROM trans_history hist
      WHERE hist.TR_HISTORY_ID=
        (SELECT MAX(TR_HISTORY_ID)
        FROM trans_history
        WHERE transaction_id = trx.transaction_id
        AND from_state      IN ('PENDING_UPDATE','ACTIVE')
        AND to_state        IN ('PENDING_UPDATE','ACTIVE')
        )
      )
    WHEN trx.from_state = 'REJECTED'
    THEN
      (SELECT TO_CHAR(hist.TRANSACTION_DATE ,'DD-Mon-yy HH:MI:SS')
      FROM trans_history hist
      WHERE hist.TR_HISTORY_ID=
        (SELECT MAX(TR_HISTORY_ID)
        FROM trans_history
        WHERE transaction_id = trx.transaction_id
        AND from_state       ='REJECTED'
        AND to_state         ='ACTIVE'
        )
      )
    WHEN trx.from_state = 'DRAFT'
    THEN
      (SELECT TO_CHAR(hist.TRANSACTION_DATE ,'DD-Mon-yy HH:MI:SS')
      FROM trans_history hist
      WHERE hist.TR_HISTORY_ID=
        (SELECT MAX(TR_HISTORY_ID)
        FROM trans_history
        WHERE transaction_id = trx.transaction_id
        AND to_state         ='ACTIVE'
        )
      )
  END AS CheckerDateTime
FROM CMS_ASSET_GC_DET date1,
  CMS_ASSET_GC_STOCK_DET stockdet,
  CMS_RELATIONSHIP_MGR rm,
  CMS_LIMIT_SECURITY_MAP lsm,
  SCI_LSP_APPR_LMTS lmts ,
  SCI_LSP_LMT_PROFILE pf,
  SCI_LE_SUB_PROFILE sp,
  --common_code_category_entry ci,
  (select * from common_code_category_entry where category_code ='HDFC_SEGMENT'
   AND active_status ='1')  ci,
  common_code_category_entry cc,
  cms_component cms_com,
  TRANSACTION trx,
  cms_region rgn,
  cms_document_globallist doc_globl
 WHERE
 rgn.id(+) =sp.rm_region and doc_globl.document_code(+) = date1.doc_code AND
 trx.transaction_type ='COL'
  AND trx.reference_id          = lsm.CMS_COLLATERAL_ID
AND lsm.CMS_LSP_APPR_LMTS_ID  = lmts.CMS_LSP_APPR_LMTS_ID
AND (lsm.UPDATE_STATUS_IND   != 'D'
OR lsm.UPDATE_STATUS_IND     IS NULL)
AND lsm.CMS_COLLATERAL_ID     = date1.CMS_COLLATERAL_ID
AND pf.CMS_LSP_LMT_PROFILE_ID = lmts.CMS_LIMIT_PROFILE_ID
AND sp.CMS_LE_SUB_PROFILE_ID  = pf.CMS_CUSTOMER_ID
AND rm.id(+)                  = sp.relation_mgr
AND ci.entry_code(+)          = sp.lsp_sgmnt_code_value
AND lsm.CHARGE_ID IN
  (SELECT MAX(MAPS2.CHARGE_ID)
  FROM cms_limit_security_map maps2
  WHERE maps2.cms_lsp_appr_lmts_id = lmts.cms_lsp_appr_lmts_id
  AND maps2.cms_collateral_id      = date1.cms_collateral_id
  )
AND date1.STATUS                 = 'APPROVED'
--AND ci.category_code             ='HDFC_SEGMENT'
--AND ci.active_status             ='1'
AND sp.status                   != 'INACTIVE'
AND cc.active_status             ='1'
AND stockdet.component           = cc.entry_code
AND cms_com.component_code       =stockdet.component
AND stockdet.gc_det_id           =date1.gc_det_id
AND (DATE1.DP_CALCULATE_MANUALLY !='YES' OR date1.DP_CALCULATE_MANUALLY is null);

   COMMENT ON MATERIALIZED VIEW "EWS_STOCK_DEFERRAL_MV"  IS 'snapshot table for snapshot CLIMSHDFCTEST1304.EWS_STOCK_DEFERRAL_MV';
--------------------------------------------------------
--  DDL for Materialized View FD_UPLOAD_STATUS_MV
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "FD_UPLOAD_STATUS_MV" ("DEPOSIT_REFERENCE_NUMBER", "CMS_REF_ID")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS (SELECT distinct dp.DEPOSIT_REFERENCE_NUMBER DEPOSIT_REFERENCE_NUMBER,
  dp.CMS_REF_ID CMS_REF_ID
FROM CMS_SECURITY SEC,
  CMS_SECURITY_SUB_TYPE SUB,
  SECURITY_TYPE TYP,
  SCI_LSP_APPR_LMTS SCI,
  SCI_LSP_LMT_PROFILE PF,
  SCI_LE_SUB_PROFILE SPRO ,
  SCI_LE_MAIN_PROFILE MAN,
  CMS_LIMIT_SECURITY_MAP MAPS,
  (SELECT * FROM cms_cash_deposit WHERE status = 'ACTIVE' AND ACTIVE = 'active'
  ) dp
WHERE SUB.SECURITY_SUB_TYPE_ID  = 'CS202'
AND SEC.SECURITY_SUB_TYPE_ID    = SUB.SECURITY_SUB_TYPE_ID
AND SUB.SECURITY_TYPE_ID        = TYP.SECURITY_TYPE_ID
AND (MAPS.update_status_ind    <> 'D'
OR MAPS.update_status_ind      IS NULL)
AND SEC.CMS_COLLATERAL_ID       = MAPS.CMS_COLLATERAL_ID
AND MAPS.CMS_LSP_APPR_LMTS_ID   = SCI.CMS_LSP_APPR_LMTS_ID
AND SCI.CMS_LIMIT_PROFILE_ID    = PF.CMS_LSP_LMT_PROFILE_ID
AND PF.CMS_CUSTOMER_ID          = Spro.CMS_LE_SUB_PROFILE_ID
AND SPRO.CMS_LE_MAIN_PROFILE_ID = MAN.CMS_LE_MAIN_PROFILE_ID
AND sec.CMS_COLLATERAL_ID       = dp.cms_collateral_id
AND spro.status                 = 'ACTIVE'
AND SCI.cms_limit_status        = 'ACTIVE'
AND dp.DEPOSIT_REFERENCE_NUMBER IS NOT NULL
AND SEC.CMS_COLLATERAL_ID      IN
  (SELECT CMS_COLLATERAL_ID FROM CMS_CASH_DEPOSIT
  )
AND MAPS.CHARGE_ID IN
  (SELECT MAX(MAPS2.CHARGE_ID)
  FROM cms_limit_security_map maps2
  WHERE maps2.cms_lsp_appr_lmts_id = SCI.cms_lsp_appr_lmts_id
  AND maps2.cms_collateral_id      =sec.cms_collateral_id
  )
);

   COMMENT ON MATERIALIZED VIEW "FD_UPLOAD_STATUS_MV"  IS 'snapshot table for snapshot CLIMSHDFCTEST1304.FD_UPLOAD_STATUS_MV';
--------------------------------------------------------
--  DDL for Materialized View FINCON_RECP_CUST_LEGAL_VIEW
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "FINCON_RECP_CUST_LEGAL_VIEW" ("BUSINESS_DATE", "DATA_SOURCE_ID", "CUSTOMER_BKEY", "VIABILITY_CODE", "VIABILITY_STUDY_UNDERTAKEN_IND", "POTENTIALLY_VIABLE_IND", "UNDER_NURSING_IND", "PRIORITY_SECTOR_CODE", "CUSTOMER_TYPE_CODE", "IRAC_STATUS_CODE", "IRAC_CLASSIFICATION_DATE", "LEGAL_SUIT_STATUS", "OTHER_BANKERS", "COMPANY_DIRECTOR1_NAME", "COMPANY_DIRECTOR2_NAME", "FILED_WITH_LEGAL_IND", "DECIDED_BY_LEGAL_IND", "PENDING_WITH_LEGAL_IND", "FILING_COST_AMT", "LEGAL_ENTITY_IND", "NOTICES_ISSUED_COUNT", "INVOLVED_AMT", "RECOVERED_AMT", "OUTSTANDING_SUIT_AMT", "COMPROMISE_PROPOSAL_AMT", "IS_WILFUL_IND", "COMPANY_DIRECTOR3_NAME", "COMPANY_DIRECTOR4_NAME", "COMPANY_DIRECTOR5_NAME", "COMPANY_DIRECTOR6_NAME", "COMPANY_DIRECTOR7_NAME", "COMPANY_DIRECTOR8_NAME", "COMPANY_DIRECTOR9_NAME", "COMPANY_DIRECTOR10_NAME", "COMPANY_DIRECTOR11_NAME", "COMPANY_DIRECTOR12_NAME", "COMPANY_DIRECTOR13_NAME", "COMPANY_DIRECTOR14_NAME", "COMPANY_DIRECTOR15_NAME", "COMPANY_DIRECTOR16_NAME", "COMPANY_DIRECTOR17_NAME", "COMPANY_DIRECTOR18_NAME", "COMPANY_DIRECTOR19_NAME", "COMPANY_DIRECTOR20_NAME", "CURRENCY_CODE", "ADDRESS_LINE_1", "ADDRESS_LINE_2", "ADDRESS_LINE_3", "ADDRESS_LINE_4", "CITY_CODE", "STATE_CODE", "COMPANY_DIRECTOR1_IDENT_NO", "COMPANY_DIRECTOR2_IDENT_NO", "COMPANY_DIRECTOR3_IDENT_NO", "COMPANY_DIRECTOR4_IDENT_NO", "COMPANY_DIRECTOR5_IDENT_NO", "COMPANY_DIRECTOR6_IDENT_NO", "COMPANY_DIRECTOR7_IDENT_NO", "COMPANY_DIRECTOR8_IDENT_NO", "COMPANY_DIRECTOR9_IDENT_NO", "COMPANY_DIRECTOR10_IDENT_NO", "COMPANY_DIRECTOR11_IDENT_NO", "COMPANY_DIRECTOR12_IDENT_NO", "COMPANY_DIRECTOR13_IDENT_NO", "COMPANY_DIRECTOR14_IDENT_NO", "COMPANY_DIRECTOR15_IDENT_NO", "COMPANY_DIRECTOR16_IDENT_NO", "COMPANY_DIRECTOR17_IDENT_NO", "COMPANY_DIRECTOR18_IDENT_NO", "COMPANY_DIRECTOR19_IDENT_NO", "COMPANY_DIRECTOR20_IDENT_NO", "OTHER_DIRECTOR_NAME", "COUNTRY_CODE", "NO_OF_RECOVERY", "NO_OF_COMPROMISE", "BORROWER_PARTY_ID", "CUSTOMER_SOURCE_SYSTEM", "PARTY_BKEY", "SARFAESI_FLAG", "DRT_FLAG", "LOK_ADALAT_FLAG", "DEFAULTER_NON_SUIT_ABOVE_1_CRO", "PARTY_NAME", "PARTY_SEGMENT", "EXTRACTDATE")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS NOLOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
   CACHE 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS (SELECT CAST( NULL AS CHAR(1 BYTE) )BUSINESS_DATE,
    CAST( NULL AS       CHAR(1 BYTE) )DATA_SOURCE_ID,
    SPRO.LSP_LE_ID AS Customer_Bkey,
    --    (SELECT UDF64
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Viability_Code, --VIABILITY
    UDF1.UDF64 AS Viability_Code, --VIABILITY
    CAST( NULL AS CHAR(1 BYTE) )VIABILITY_STUDY_UNDERTAKEN_IND,
    CAST( NULL AS CHAR(1 BYTE) )POTENTIALLY_VIABLE_IND,
    CAST( NULL AS CHAR(1 BYTE) )UNDER_NURSING_IND,
    CAST( NULL AS CHAR(1 BYTE) )PRIORITY_SECTOR_CODE,
    --    (SELECT UDF50
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Customer_Type_Code, --Type of Non-SSI Unit
    UDF1.UDF50 AS Customer_Type_Code,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'ASSET_ClASSIFICATION'
    --    AND entry_code      = pf.ASSET_CLASSIFICATION
    --    ) AS IRAC_Status_Code,
    ac.ENTRY_NAME AS IRAC_Status_Code,
    --    (SELECT UDF62
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS IRAC_Classification_Date, --NPA Classification Date
    UDF1.UDF62 AS IRAC_Classification_Date,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'SUIT_FILLED_STATUS'
    --    AND entry_code      = spro.SUIT_FILLED_STATUS
    --    ) AS Legal_Suit_Status,
    sf.ENTRY_NAME AS Legal_Suit_Status,
    COALESCE (
    (SELECT OTHER_BANK.BANK_NAME
      ||'-'
      ||OTHERBANKBRANCH.BRANCH_NAME
    FROM CMS_OTHER_BANK_BRANCH OTHERBANKBRANCH,
      CMS_OTHER_BANK OTHER_BANK
    WHERE BANKING.CMS_LE_BANK_ID = OTHERBANKBRANCH.ID
    AND OTHER_BANK.ID            = OTHERBANKBRANCH.OTHER_BANK_CODE
    AND BANKING.CMS_LE_BANK_TYPE = 'O'
    ),
    (SELECT SYSTEMBANKBRANCH.SYSTEM_BANK_NAME
    FROM CMS_SYSTEM_BANK SYSTEMBANKBRANCH
    WHERE BANKING.CMS_LE_BANK_ID = SYSTEMBANKBRANCH.ID
    AND BANKING.CMS_LE_BANK_TYPE = 'S'
    ) ) AS Other_Bankers,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,1,1) FROM dual
    --    ) AS Company_Director1_Name,
    dv.Company_Director1_Name AS Company_Director1_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,2,1) FROM dual
    --    ) AS Company_Director2_Name,
    dv.Company_Director2_Name AS Company_Director2_Name,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'SUIT_FILLED_STATUS'
    --    AND entry_code      = spro.SUIT_FILLED_STATUS
    --    ) AS Filed_With_Legal_Ind,
    sf.ENTRY_NAME AS Filed_With_Legal_Ind,
    CAST( NULL AS CHAR(1 BYTE) )DECIDED_BY_LEGAL_IND,
    CAST( NULL AS CHAR(1 BYTE) )PENDING_WITH_LEGAL_IND,
    --    (SELECT UDF51
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Filing_Cost_Amt, -- Case Filing Cost (Amt. in Mio)
    UDF1.UDF51 AS Filing_Cost_Amt,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'Entity'
    --    AND entry_code      = spro.ENTITY
    --    ) AS Legal_Entity_Ind,
    en.ENTRY_NAME AS Legal_Entity_Ind,
    --    (SELECT UDF52
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Notices_Issued_Count, -- No. of Legal Notices Issued (Count)
    UDF1.UDF52 AS Notices_Issued_Count,
    --    (SELECT UDF53
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Involved_Amt, -- Case Amt. involved (Amt. in Mio)
    UDF1.UDF53 AS Involved_Amt,
    --    (SELECT UDF54
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Recovered_Amt, -- Case Recovered Amt (Amt. in Mio)
    UDF1.UDF54 AS Recovered_Amt,
    --    (SELECT UDF55
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Outstanding_Suit_Amt, -- Outstanding Suit Amt (Amt. in Mio)
    UDF1.UDF55 AS Outstanding_Suit_Amt,
    --    (SELECT UDF56
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Compromise_Proposal_Amt, -- Compromise Proposal Amt (Amt. in Mio)
    UDF1.UDF56 AS Compromise_Proposal_Amt,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'WILLFUL_DEFAULT_STATUS'
    --    AND entry_code      = spro.WILLFUL_DEFAULT_STATUS
    --    ) AS Is_Wilful_Ind,
    wd.ENTRY_NAME AS Is_Wilful_Ind,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,3,1) FROM dual
    --    ) AS Company_Director3_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,4,1) FROM dual
    --    ) AS Company_Director4_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,5,1) FROM dual
    --    ) AS Company_Director5_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,6,1) FROM dual
    --    ) AS Company_Director6_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,7,1) FROM dual
    --    ) AS Company_Director7_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,8,1) FROM dual
    --    ) AS Company_Director8_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,9,1) FROM dual
    --    ) AS Company_Director9_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,10,1) FROM dual
    --    ) AS Company_Director10_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,11,1) FROM dual
    --    ) AS Company_Director11_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,12,1) FROM dual
    --    ) AS Company_Director12_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,13,1) FROM dual
    --    ) AS Company_Director13_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,14,1) FROM dual
    --    ) AS Company_Director14_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,15,1) FROM dual
    --    ) AS Company_Director15_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,16,1) FROM dual
    --    ) AS Company_Director16_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,17,1) FROM dual
    --    ) AS Company_Director17_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,18,1) FROM dual
    --    ) AS Company_Director18_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,19,1) FROM dual
    --    ) AS Company_Director19_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,20,1) FROM dual
    --    ) AS Company_Director20_Name,
    dv.Company_Director3_Name  AS Company_Director3_Name,
    dv.Company_Director4_Name  AS Company_Director4_Name,
    dv.Company_Director5_Name  AS Company_Director5_Name,
    dv.Company_Director6_Name  AS Company_Director6_Name,
    dv.Company_Director7_Name  AS Company_Director7_Name,
    dv.Company_Director8_Name  AS Company_Director8_Name,
    dv.Company_Director9_Name  AS Company_Director9_Name,
    dv.Company_Director10_Name AS Company_Director10_Name,
    dv.Company_Director11_Name AS Company_Director11_Name,
    dv.Company_Director12_Name AS Company_Director12_Name,
    dv.Company_Director13_Name AS Company_Director13_Name,
    dv.Company_Director14_Name AS Company_Director14_Name,
    dv.Company_Director15_Name AS Company_Director15_Name,
    dv.Company_Director16_Name AS Company_Director16_Name,
    dv.Company_Director17_Name AS Company_Director17_Name,
    dv.Company_Director18_Name AS Company_Director18_Name,
    dv.Company_Director19_Name AS Company_Director19_Name,
    dv.Company_Director20_Name AS Company_Director20_Name,
    --    (SELECT UDF68
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Currency_Code, -- SUIT CASE CURRENCY CASE
    UDF1.UDF68 AS Currency_Code,
    CAST( NULL AS CHAR(1 BYTE) )ADDRESS_LINE_1,
    CAST( NULL AS CHAR(1 BYTE) )ADDRESS_LINE_2,
    CAST( NULL AS CHAR(1 BYTE) )ADDRESS_LINE_3,
    CAST( NULL AS CHAR(1 BYTE) )ADDRESS_LINE_4,
    CAST( NULL AS CHAR(1 BYTE) )CITY_CODE,
    --    (SELECT STATE_NAME
    --    FROM cms_state
    --    WHERE status= 'ACTIVE'
    --    AND id      = ra.LRA_STATE
    --    ) AS State_Code,
    st.STATE_NAME AS State_Code,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,1,2) FROM dual
    --    ) AS Company_Director1_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,2,2) FROM dual
    --    ) AS Company_Director2_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,3,2) FROM dual
    --    ) AS Company_Director3_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,4,2) FROM dual
    --    ) AS Company_Director4_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,5,2) FROM dual
    --    ) AS Company_Director5_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,6,2) FROM dual
    --    ) AS Company_Director6_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,7,2) FROM dual
    --    ) AS Company_Director7_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,8,2) FROM dual
    --    ) AS Company_Director8_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,9,2) FROM dual
    --    ) AS Company_Director9_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,10,2) FROM dual
    --    ) AS Company_Director10_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,11,2) FROM dual
    --    ) AS Company_Director11_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,12,2) FROM dual
    --    ) AS Company_Director12_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,13,2) FROM dual
    --    ) AS Company_Director13_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,14,2) FROM dual
    --    ) AS Company_Director14_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,15,2) FROM dual
    --    ) AS Company_Director15_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,16,2) FROM dual
    --    ) AS Company_Director16_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,17,2) FROM dual
    --    ) AS Company_Director17_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,18,2) FROM dual
    --    ) AS Company_Director18_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,19,2) FROM dual
    --    ) AS Company_Director19_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,20,2) FROM dual
    --    ) AS Company_Director20_Ident_No,
    dv.Company_Director1_Ident_No  AS Company_Director1_Ident_No,
    dv.Company_Director2_Ident_No  AS Company_Director2_Ident_No,
    dv.Company_Director3_Ident_No  AS Company_Director3_Ident_No,
    dv.Company_Director4_Ident_No  AS Company_Director4_Ident_No,
    dv.Company_Director5_Ident_No  AS Company_Director5_Ident_No,
    dv.Company_Director6_Ident_No  AS Company_Director6_Ident_No,
    dv.Company_Director7_Ident_No  AS Company_Director7_Ident_No,
    dv.Company_Director8_Ident_No  AS Company_Director8_Ident_No,
    dv.Company_Director9_Ident_No  AS Company_Director9_Ident_No,
    dv.Company_Director10_Ident_No AS Company_Director10_Ident_No,
    dv.Company_Director11_Ident_No AS Company_Director11_Ident_No,
    dv.Company_Director12_Ident_No AS Company_Director12_Ident_No,
    dv.Company_Director13_Ident_No AS Company_Director13_Ident_No,
    dv.Company_Director14_Ident_No AS Company_Director14_Ident_No,
    dv.Company_Director15_Ident_No AS Company_Director15_Ident_No,
    dv.Company_Director16_Ident_No AS Company_Director16_Ident_No,
    dv.Company_Director17_Ident_No AS Company_Director17_Ident_No,
    dv.Company_Director18_Ident_No AS Company_Director18_Ident_No,
    dv.Company_Director19_Ident_No AS Company_Director19_Ident_No,
    dv.Company_Director20_Ident_No AS Company_Director20_Ident_No,
    CAST( NULL AS CHAR(1 BYTE) )OTHER_DIRECTOR_NAME,
    CAST( NULL AS CHAR(1 BYTE) )COUNTRY_CODE,
    --    (SELECT UDF57
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS No_Of_Recovery, -- No. Of Recovery/s (Count)
    UDF1.UDF57 AS No_Of_Recovery,
    --    (SELECT UDF58
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS No_Of_Compromise, -- No. Of Compromise/s (Count)
    UDF1.UDF58 AS No_Of_Compromise,
    CAST( NULL AS CHAR(1 BYTE) )BORROWER_PARTY_ID,
    CAST( NULL AS CHAR(1 BYTE) )CUSTOMER_SOURCE_SYSTEM,
    SPRO.LSP_LE_ID AS party_bkey,
    --    (SELECT UDF59
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS sarfaesi_flag, -- Sarfaesi flag
    UDF1.UDF59 AS sarfaesi_flag,
    --    (SELECT UDF60
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS DRT_flag, -- DRT flag
    UDF1.UDF60 AS DRT_flag,
    --    (SELECT UDF61
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Lok_adalat_flag, --  Lok Adalat flag
    UDF1.UDF61 AS Lok_adalat_flag,
    --    (SELECT UDF69
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    )                   AS Defaulter_Non_Suit_Above_1_Cro, -- Defaulter Non Suit Above 1 Crore
    UDF1.UDF69          AS Defaulter_Non_Suit_Above_1_Cro,
    SPRO.LSP_Short_name AS party_name,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'HDFC_SEGMENT'
    --    AND entry_code      = spro.lsp_sgmnt_code_value
    --    ) AS party_segment ,
    hs.ENTRY_NAME AS party_segment ,
    --    (SELECT to_date (param_value,'dd/mm/yyyy')
    --    FROM CMS_GENERAL_PARAM
    --    WHERE param_code = 'APPLICATION_DATE'
    --    ) AS EXTRACTDATE
    to_date (gp.param_value,'dd/mm/yyyy') AS EXTRACTDATE
    --     (CUSTOMERMAKERDATE(Spro.CMS_LE_SUB_PROFILE_ID)) as maker_date,
    --  (CUSTOMERCHEKERDATE(Spro.CMS_LE_SUB_PROFILE_ID)) as checker_date
  FROM SCI_LSP_LMT_PROFILE PF,
    SCI_LE_SUB_PROFILE SPRO ,
    SCI_LE_MAIN_PROFILE MAN,
    SCI_LE_REG_ADDR ra,
    SCI_LE_BANKING_METHOD BANKING,
    sci_le_udf UDF1,
    DIRECTOR_VIEW dv,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'SUIT_FILLED_STATUS'
    ) sf,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'ASSET_ClASSIFICATION'
    ) ac,
    (SELECT * FROM COMMON_CODE_CATEGORY_ENTRY WHERE category_code = 'Entity'
    ) en,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'WILLFUL_DEFAULT_STATUS'
    ) wd,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'HDFC_SEGMENT'
    ) hs,
    (SELECT * FROM cms_state WHERE status= 'ACTIVE'
    ) st,
    (SELECT * FROM CMS_GENERAL_PARAM WHERE param_code = 'APPLICATION_DATE'
    ) gp
  WHERE PF.CMS_CUSTOMER_ID           = Spro.CMS_LE_SUB_PROFILE_ID
  AND SPRO.CMS_LE_MAIN_PROFILE_ID    = MAN.CMS_LE_MAIN_PROFILE_ID
  AND spro.status                    = 'ACTIVE'
  AND spro.CMS_LE_MAIN_PROFILE_ID    = ra.CMS_LE_MAIN_PROFILE_ID (+)
  AND ra.LRA_TYPE_VALUE              = 'CORPORATE'
  AND BANKING.cms_le_main_profile_id = spro.cms_le_main_profile_id
  AND UDF1.cms_le_main_profile_id    = MAN.CMS_LE_MAIN_PROFILE_ID
  AND sf.entry_code(+)               = spro.SUIT_FILLED_STATUS
  AND ac.entry_code(+)               = pf.ASSET_CLASSIFICATION
  AND en.entry_code(+)               = spro.ENTITY
  AND hs.entry_code(+)               = spro.lsp_sgmnt_code_value
  AND wd.entry_code(+)               = spro.WILLFUL_DEFAULT_STATUS
  AND st.id(+)                       = ra.LRA_STATE
  AND dv.CMS_LE_MAIN_PROFILE_ID(+)   = spro.cms_le_main_profile_id
  );

   COMMENT ON MATERIALIZED VIEW "FINCON_RECP_CUST_LEGAL_VIEW"  IS 'snapshot table for snapshot CLIMSHDFCTEST.FINCON_RECP_CUST_LEGAL_VIEW';
--------------------------------------------------------
--  DDL for Materialized View FINCON_RECP_PARTY_VIEW
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "FINCON_RECP_PARTY_VIEW" ("DATA_SOURCE_ID", "PARTY_BKEY", "PARTY_TYPE_CODE", "PARTY_NAME", "PARTY_NAME_ALT_LANG", "LOAD_EXECUTION_ID", "COUNTRY_CODE", "PARTY_CATEGORY_CODE", "CITY_CODE", "EXP_IMP_IND", "PARTY_LIMIT", "IECD_REFERENCE", "PARTY_STATUS_CODE", "GENDER_CODE", "OPEN_DATE", "CLOSE_DATE", "NATIONALITY_CODE", "CUSTOMER_BKEY", "PARTY_ADDRESS_LINE_1", "PARTY_ADDRESS_LINE_2", "PARTY_ADDRESS_LINE_3", "PARTY_ADDRESS_LINE_4", "PSU_IND", "PARENT_PARTY_BKEY", "PARENT_PARTY_TYPE_CODE", "INDUTRY", "RBI_INDUSTRY", "MPBF", "FUNDED_LIMIT", "NON_FUNDED_LIMIT", "MEMO_EXPOSURE", "FUNDED_SHARE_PERCENT", "NON_FUNDED_SHARE_PERCENT", "BANKING_METHOD", "FUNDED_SHARE_LIMIT", "NON_FUNDED_SHARE_LIMIT", "LEAD_NODAL_BANK", "LEAD_BANK_BRANCH", "RBI_ASSET_CLASSIFICATION", "METAGRID_ID", "TYPE_OF_UNIT", "DSA_CODE", "DSA_NAME", "PARTY_ID", "FORM_RBI_INDUSTRY", "RBI_PARTY_IECD_CODE", "RBI_SECTOR", "EXTRACTDATE")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS NOLOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
   CACHE 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS (
  (SELECT
    --distinct
    CAST( NULL AS CHAR(1 BYTE) ) AS Data_Source_ID,
    SPRO.LSP_LE_ID               AS party_bkey,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'HDFC_SEGMENT'
    --    AND entry_code      = spro.lsp_sgmnt_code_value
    --    )                   AS PARTY_TYPE_CODE,
    hs.ENTRY_NAME                AS PARTY_TYPE_CODE,
    SPRO.LSP_SHORT_NAME          AS PARTY_NAME ,
    CAST( NULL AS CHAR(1 BYTE) ) AS Party_Name_Alt_Lang,
    CAST( NULL AS CHAR(1 BYTE) ) AS Load_Execution_ID,
    'India'                      AS COUNTRY_CODE ,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'Entity'
    --    AND entry_code      = spro.entity
    --    ) AS PARTY_CATEGORY_CODE,
    en.ENTRY_NAME AS PARTY_CATEGORY_CODE,
    --    (SELECT CITY_NAME
    --    FROM cms_city
    --    WHERE status= 'ACTIVE'
    --    AND id     IN
    --      (SELECT ra.lra_city_text
    --      FROM SCI_LE_REG_ADDR ra
    --      WHERE ra.CMS_LE_MAIN_PROFILE_ID = spro.CMS_LE_MAIN_PROFILE_ID
    --      AND ra.LRA_TYPE_VALUE           = 'CORPORATE'
    --      )
    --    )  AS CITY_CODE ,
    city.CITY_NAME               AS CITY_CODE ,
    CAST( NULL AS CHAR(1 BYTE) ) AS Exp_Imp_Ind,
    CAST( NULL AS CHAR(1 BYTE) ) AS Party_Limit,
    CAST( NULL AS CHAR(1 BYTE) ) AS IECD_Reference,
    CAST( NULL AS CHAR(1 BYTE) ) AS Party_Status_Code,
    CAST( NULL AS CHAR(1 BYTE) ) AS Gender_Code,
    CAST( NULL AS CHAR(1 BYTE) ) AS Open_Date,
    CAST( NULL AS CHAR(1 BYTE) ) AS Close_Date,
    CAST( NULL AS CHAR(1 BYTE) ) AS Nationality_Code,
    CAST( NULL AS CHAR(1 BYTE) ) AS Customer_BKey,
    --    (SELECT ra.lra_addr_line_1
    --    FROM SCI_LE_REG_ADDR ra
    --    WHERE ra.CMS_LE_MAIN_PROFILE_ID = spro.CMS_LE_MAIN_PROFILE_ID
    --    AND ra.LRA_TYPE_VALUE           = 'CORPORATE'
    --    ) AS PARTY_ADDRESS_LINE_1,
    ra.lra_addr_line_1 AS PARTY_ADDRESS_LINE_1,
    --    (SELECT ra.lra_addr_line_2
    --    FROM SCI_LE_REG_ADDR ra
    --    WHERE ra.CMS_LE_MAIN_PROFILE_ID = spro.CMS_LE_MAIN_PROFILE_ID
    --    AND ra.LRA_TYPE_VALUE           = 'CORPORATE'
    --    ) AS PARTY_ADDRESS_LINE_2,
    ra.lra_addr_line_2 AS PARTY_ADDRESS_LINE_2,
    --    (SELECT ra.lra_addr_line_3
    --    FROM SCI_LE_REG_ADDR ra
    --    WHERE ra.CMS_LE_MAIN_PROFILE_ID = spro.CMS_LE_MAIN_PROFILE_ID
    --    AND ra.LRA_TYPE_VALUE           = 'CORPORATE'
    --    ) AS PARTY_ADDRESS_LINE_3,
    ra.lra_addr_line_3 AS PARTY_ADDRESS_LINE_3,
    --    (SELECT ra.lra_addr_line_4
    --    FROM SCI_LE_REG_ADDR ra
    --    WHERE ra.CMS_LE_MAIN_PROFILE_ID = spro.CMS_LE_MAIN_PROFILE_ID
    --    AND ra.LRA_TYPE_VALUE           = 'CORPORATE'
    --    )  AS PARTY_ADDRESS_LINE_4,
    ra.lra_addr_line_4           AS PARTY_ADDRESS_LINE_4,
    CAST( NULL AS CHAR(1 BYTE) ) AS PSU_Ind,
    --    (SELECT party_group_name
    --    FROM CMS_PARTY_GROUP
    --    WHERE id   = spro.party_grp_nm
    --    AND status = 'ACTIVE'
    --    )  AS PARENT_PARTY_BKEY ,
    pg.party_group_name          AS PARENT_PARTY_BKEY ,
    CAST( NULL AS CHAR(1 BYTE) ) AS Parent_Party_Type_Code,
    --    (SELECT entry_code
    --      ||'-'
    --      ||ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'HDFC_INDUSTRY'
    --    AND entry_code      = spro.ind_nm
    --    ) AS INDUTRY ,
    hi.entry_code
    ||'-'
    ||hi.ENTRY_NAME AS INDUTRY ,
    --    (SELECT entry_code
    --      ||'-'
    --      ||ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'HDFC_RBI_CODE'
    --    AND entry_code      = spro.rbi_ind_code
    --    )                             AS RBI_INDUSTRY ,
    ri.entry_code
    ||'-'
    ||ri.ENTRY_NAME               AS RBI_INDUSTRY ,
    spro.mpbf                     AS MPBF ,
    spro.total_funded_limit       AS FUNDED_LIMIT,
    spro.total_non_funded_limit   AS NON_FUNDED_LIMIT,
    spro.MEMO_EXPOSURE            AS MEMO_EXPOSURE ,
    spro.FUNDED_SHARE_PERCENT     AS FUNDED_SHARE_PERCENT,
    spro.NON_FUNDED_SHARE_PERCENT AS NON_FUNDED_SHARE_PERCENT,
    spro.banking_method           AS BANKING_METHOD,
    spro.FUNDED_SHARE_LIMIT       AS FUNDED_SHARE_LIMIT,
    spro.NON_FUNDED_SHARE_LIMIT   AS NON_FUNDED_SHARE_LIMIT,
    COALESCE (
    (SELECT OTHER_BANK.BANK_NAME
    FROM CMS_OTHER_BANK_BRANCH OTHERBANKBRANCH,
      CMS_OTHER_BANK OTHER_BANK
    WHERE BANKING.CMS_LE_BANK_ID = OTHERBANKBRANCH.ID
    AND OTHER_BANK.ID            = OTHERBANKBRANCH.OTHER_BANK_CODE
    AND BANKING.CMS_LE_BANK_TYPE = 'O'
    ),
    (SELECT SYSTEMBANKBRANCH.SYSTEM_BANK_NAME
    FROM CMS_SYSTEM_BANK SYSTEMBANKBRANCH
    WHERE BANKING.CMS_LE_BANK_ID = SYSTEMBANKBRANCH.ID
    AND BANKING.CMS_LE_BANK_TYPE = 'S'
    ) ) AS LEAD_NODAL_BANK,
    COALESCE (
    (SELECT OTHER_BANK.BANK_NAME
      ||'-'
      ||OTHERBANKBRANCH.BRANCH_NAME
    FROM CMS_OTHER_BANK_BRANCH OTHERBANKBRANCH,
      CMS_OTHER_BANK OTHER_BANK
    WHERE BANKING.CMS_LE_BANK_ID = OTHERBANKBRANCH.ID
    AND OTHER_BANK.ID            = OTHERBANKBRANCH.OTHER_BANK_CODE
    AND BANKING.CMS_LE_BANK_TYPE = 'O'
    ),
    (SELECT SYSTEMBANKBRANCH.SYSTEM_BANK_NAME
    FROM CMS_SYSTEM_BANK SYSTEMBANKBRANCH
    WHERE BANKING.CMS_LE_BANK_ID = SYSTEMBANKBRANCH.ID
    AND BANKING.CMS_LE_BANK_TYPE = 'S'
    ) )                          AS LEAD_BANK_BRANCH,
    pf.RBI_ASSET_CLASSIFICATION  AS RBI_ASSET_CLASSIFICATION,
    CAST( NULL AS CHAR(1 BYTE) ) AS Metagrid_id,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'MSME_CLASSIC'
    --    AND entry_code      = cri.MSME_CLASSIFICATION
    --    ) AS type_of_unit,
    ms.ENTRY_NAME AS type_of_unit,
    --(select UDFDATA(MAN.CMS_LE_MAIN_PROFILE_ID,((SELECT sequence FROM cms_udf WHERE fieldname LIKE 'DSA CODE' ))) from dual) as dsa_code,
    --(select UDFDATA(MAN.CMS_LE_MAIN_PROFILE_ID,((SELECT sequence FROM cms_udf WHERE fieldname LIKE 'DSA NAME' ))) from dual) as dsa_name,
    --    (
    --    SELECT UDF3
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS dsa_code, --DSA CODE
    UDF1.UDF3 AS dsa_code,
    --    (SELECT UDF4
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    )              AS dsa_name, --DSA NAME
    UDF1.UDF4      AS dsa_name,
    SPRO.LSP_LE_ID AS Party_ID,
    --    (CUSTOMERMAKERDATE(SPRO.CMS_LE_SUB_PROFILE_ID)) as maker_date,
    --  (CUSTOMERCHEKERDATE(SPRO.CMS_LE_SUB_PROFILE_ID)) as checker_date ,
    --  (select UDFDATA(MAN.CMS_LE_MAIN_PROFILE_ID,((SELECT sequence FROM cms_udf WHERE fieldname LIKE 'Form A RBI Industry Code' ))) from dual) as Form_RBI_Industry,
    --    (select UDFDATA(MAN.CMS_LE_MAIN_PROFILE_ID,((SELECT sequence FROM cms_udf WHERE fieldname LIKE 'RBI Party (IECD) Code' ))) from dual) as RBI_Party_IECD_Code,
    --   (select UDFDATA(MAN.CMS_LE_MAIN_PROFILE_ID,((SELECT sequence FROM cms_udf WHERE fieldname LIKE 'RBI Sector' ))) from dual) as RBI_Sector
    --    (
    --    SELECT UDF66
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Form_RBI_Industry, --Form A RBI Industry Code
    UDF1.UDF66 AS Form_RBI_Industry,
    --    (SELECT UDF67
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS RBI_Party_IECD_Code, --RBI Party (IECD) Code
    UDF1.UDF67 AS RBI_Party_IECD_Code,
    --    (SELECT UDF65
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS RBI_Sector, --RBI Sector
    UDF1.UDF65 AS RBI_Sector,
    --    (SELECT to_date (param_value,'dd/mm/yyyy')
    --    FROM CMS_GENERAL_PARAM
    --    WHERE param_code = 'APPLICATION_DATE'
    --    ) AS EXTRACTDATE
    to_date (gp.param_value,'dd/mm/yyyy') AS EXTRACTDATE
  FROM SCI_LSP_LMT_PROFILE PF,
    SCI_LE_SUB_PROFILE SPRO ,
    SCI_LE_MAIN_PROFILE MAN,
    sci_le_cri cri,
    SCI_LE_BANKING_METHOD BANKING,
    sci_le_udf UDF1,
    SCI_LE_REG_ADDR ra,
    (SELECT * FROM cms_city WHERE status= 'ACTIVE'
    ) city,
    (SELECT * FROM CMS_PARTY_GROUP WHERE status= 'ACTIVE'
    ) pg,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'HDFC_SEGMENT'
    ) hs,
    (SELECT * FROM COMMON_CODE_CATEGORY_ENTRY WHERE category_code = 'Entity'
    ) en,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'HDFC_INDUSTRY'
    ) hi,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'HDFC_RBI_CODE'
    ) ri,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'MSME_CLASSIC'
    ) ms,
    (SELECT * FROM CMS_GENERAL_PARAM WHERE param_code = 'APPLICATION_DATE'
    ) gp
  WHERE PF.CMS_CUSTOMER_ID(+)        = Spro.CMS_LE_SUB_PROFILE_ID
  AND SPRO.CMS_LE_MAIN_PROFILE_ID    = MAN.CMS_LE_MAIN_PROFILE_ID
  AND cri.cms_le_main_profile_id (+) = MAN.CMS_LE_MAIN_PROFILE_ID
  AND spro.status                    = 'ACTIVE'
  AND BANKING.cms_le_main_profile_id = spro.cms_le_main_profile_id
  AND spro.banking_method            = 'MULTIPLE'
  AND banking.cms_le_nodal           = 'Y'
  AND UDF1.cms_le_main_profile_id    = MAN.CMS_LE_MAIN_PROFILE_ID
  AND spro.CMS_LE_MAIN_PROFILE_ID    = ra.CMS_LE_MAIN_PROFILE_ID (+)
  AND ra.LRA_TYPE_VALUE              = 'CORPORATE'
  AND hs.entry_code(+)               = spro.lsp_sgmnt_code_value
  AND en.entry_code(+)               = spro.entity
  AND ra.lra_city_text               = city.id(+)
  AND pg.id(+)                       = spro.party_grp_nm
  AND hi.entry_code(+)               = spro.ind_nm
  AND ri.entry_code(+)               = spro.rbi_ind_code
  AND ms.entry_code(+)               = cri.MSME_CLASSIFICATION
  )
UNION
  (SELECT
    --distinct
    CAST( NULL AS CHAR(1 BYTE) ) AS Data_Source_ID,
    SPRO.LSP_LE_ID               AS party_bkey,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'HDFC_SEGMENT'
    --    AND entry_code      = spro.lsp_sgmnt_code_value
    --    )                   AS PARTY_TYPE_CODE,
    hs.ENTRY_NAME                AS PARTY_TYPE_CODE,
    SPRO.LSP_SHORT_NAME          AS PARTY_NAME,
    CAST( NULL AS CHAR(1 BYTE) ) AS Party_Name_Alt_Lang,
    CAST( NULL AS CHAR(1 BYTE) ) AS Load_Execution_ID,
    'India'                      AS COUNTRY_CODE,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'Entity'
    --    AND entry_code      = spro.entity
    --    ) AS PARTY_CATEGORY_CODE,
    en.ENTRY_NAME AS PARTY_CATEGORY_CODE,
    --    (SELECT CITY_NAME
    --    FROM cms_city
    --    WHERE status= 'ACTIVE'
    --    AND id     IN
    --      (SELECT ra.lra_city_text
    --      FROM SCI_LE_REG_ADDR ra
    --      WHERE ra.CMS_LE_MAIN_PROFILE_ID = spro.CMS_LE_MAIN_PROFILE_ID
    --      AND ra.LRA_TYPE_VALUE           = 'CORPORATE'
    --      )
    --    )  AS CITY_CODE ,
    city.CITY_NAME               AS CITY_CODE ,
    CAST( NULL AS CHAR(1 BYTE) ) AS Exp_Imp_Ind,
    CAST( NULL AS CHAR(1 BYTE) ) AS Party_Limit,
    CAST( NULL AS CHAR(1 BYTE) ) AS IECD_Reference,
    CAST( NULL AS CHAR(1 BYTE) ) AS Party_Status_Code,
    CAST( NULL AS CHAR(1 BYTE) ) AS Gender_Code,
    CAST( NULL AS CHAR(1 BYTE) ) AS Open_Date,
    CAST( NULL AS CHAR(1 BYTE) ) AS Close_Date,
    CAST( NULL AS CHAR(1 BYTE) ) AS Nationality_Code,
    CAST( NULL AS CHAR(1 BYTE) ) AS Customer_BKey,
    --    (SELECT ra.lra_addr_line_1
    --    FROM SCI_LE_REG_ADDR ra
    --    WHERE ra.CMS_LE_MAIN_PROFILE_ID = spro.CMS_LE_MAIN_PROFILE_ID
    --    AND ra.LRA_TYPE_VALUE           = 'CORPORATE'
    --    ) AS PARTY_ADDRESS_LINE_1,
    ra.lra_addr_line_1 AS PARTY_ADDRESS_LINE_1,
    --    (SELECT ra.lra_addr_line_2
    --    FROM SCI_LE_REG_ADDR ra
    --    WHERE ra.CMS_LE_MAIN_PROFILE_ID = spro.CMS_LE_MAIN_PROFILE_ID
    --    AND ra.LRA_TYPE_VALUE           = 'CORPORATE'
    --    ) AS PARTY_ADDRESS_LINE_2,
    ra.lra_addr_line_2 AS PARTY_ADDRESS_LINE_2,
    --    (SELECT ra.lra_addr_line_3
    --    FROM SCI_LE_REG_ADDR ra
    --    WHERE ra.CMS_LE_MAIN_PROFILE_ID = spro.CMS_LE_MAIN_PROFILE_ID
    --    AND ra.LRA_TYPE_VALUE           = 'CORPORATE'
    --    ) AS PARTY_ADDRESS_LINE_3,
    ra.lra_addr_line_3 AS PARTY_ADDRESS_LINE_3,
    --    (SELECT ra.lra_addr_line_4
    --    FROM SCI_LE_REG_ADDR ra
    --    WHERE ra.CMS_LE_MAIN_PROFILE_ID = spro.CMS_LE_MAIN_PROFILE_ID
    --    AND ra.LRA_TYPE_VALUE           = 'CORPORATE'
    --    )  AS PARTY_ADDRESS_LINE_4,
    ra.lra_addr_line_4           AS PARTY_ADDRESS_LINE_4,
    CAST( NULL AS CHAR(1 BYTE) ) AS PSU_Ind,
    --    (SELECT party_group_name
    --    FROM CMS_PARTY_GROUP
    --    WHERE id   = spro.party_grp_nm
    --    AND status = 'ACTIVE'
    --    )  AS PARENT_PARTY_BKEY ,
    pg.party_group_name          AS PARENT_PARTY_BKEY ,
    CAST( NULL AS CHAR(1 BYTE) ) AS Parent_Party_Type_Code,
    --    (SELECT entry_code
    --      ||'-'
    --      ||ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'HDFC_INDUSTRY'
    --    AND entry_code      = spro.ind_nm
    --    ) AS INDUTRY ,
    hi.entry_code
    ||'-'
    ||hi.ENTRY_NAME AS INDUTRY ,
    --    (SELECT entry_code
    --      ||'-'
    --      ||ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'HDFC_RBI_CODE'
    --    AND entry_code      = spro.rbi_ind_code
    --    )                             AS RBI_INDUSTRY ,
    ri.entry_code
    ||'-'
    ||ri.ENTRY_NAME               AS RBI_INDUSTRY ,
    spro.mpbf                     AS MPBF ,
    spro.total_funded_limit       AS FUNDED_LIMIT ,
    spro.total_non_funded_limit   AS NON_FUNDED_LIMIT ,
    spro.MEMO_EXPOSURE            AS MEMO_EXPOSURE ,
    spro.FUNDED_SHARE_PERCENT     AS FUNDED_SHARE_PERCENT ,
    spro.NON_FUNDED_SHARE_PERCENT AS NON_FUNDED_SHARE_PERCENT ,
    spro.banking_method           AS BANKING_METHOD ,
    spro.FUNDED_SHARE_LIMIT       AS FUNDED_SHARE_LIMIT,
    spro.NON_FUNDED_SHARE_LIMIT   AS NON_FUNDED_SHARE_LIMIT,
    COALESCE (
    (SELECT OTHER_BANK.BANK_NAME
    FROM CMS_OTHER_BANK_BRANCH OTHERBANKBRANCH,
      CMS_OTHER_BANK OTHER_BANK
    WHERE BANKING.CMS_LE_BANK_ID = OTHERBANKBRANCH.ID
    AND OTHER_BANK.ID            = OTHERBANKBRANCH.OTHER_BANK_CODE
    AND BANKING.CMS_LE_BANK_TYPE = 'O'
    ),
    (SELECT SYSTEMBANKBRANCH.SYSTEM_BANK_NAME
    FROM CMS_SYSTEM_BANK SYSTEMBANKBRANCH
    WHERE BANKING.CMS_LE_BANK_ID = SYSTEMBANKBRANCH.ID
    AND BANKING.CMS_LE_BANK_TYPE = 'S'
    ) ) AS LEAD_NODAL_BANK,
    COALESCE (
    (SELECT OTHER_BANK.BANK_NAME
      ||'-'
      ||OTHERBANKBRANCH.BRANCH_NAME
    FROM CMS_OTHER_BANK_BRANCH OTHERBANKBRANCH,
      CMS_OTHER_BANK OTHER_BANK
    WHERE BANKING.CMS_LE_BANK_ID = OTHERBANKBRANCH.ID
    AND OTHER_BANK.ID            = OTHERBANKBRANCH.OTHER_BANK_CODE
    AND BANKING.CMS_LE_BANK_TYPE = 'O'
    ),
    (SELECT SYSTEMBANKBRANCH.SYSTEM_BANK_NAME
    FROM CMS_SYSTEM_BANK SYSTEMBANKBRANCH
    WHERE BANKING.CMS_LE_BANK_ID = SYSTEMBANKBRANCH.ID
    AND BANKING.CMS_LE_BANK_TYPE = 'S'
    ) )                          AS LEAD_BANK_BRANCH ,
    pf.RBI_ASSET_CLASSIFICATION  AS RBI_ASSET_CLASSIFICATION,
    CAST( NULL AS CHAR(1 BYTE) ) AS Metagrid_id,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'MSME_CLASSIC'
    --    AND entry_code      = cri.MSME_CLASSIFICATION
    --    ) AS type_of_unit,
    ms.ENTRY_NAME AS type_of_unit,
    --(select UDFDATA(MAN.CMS_LE_MAIN_PROFILE_ID,((SELECT sequence FROM cms_udf WHERE fieldname LIKE 'DSA CODE' ))) from dual) as dsa_code,
    --(select UDFDATA(MAN.CMS_LE_MAIN_PROFILE_ID,((SELECT sequence FROM cms_udf WHERE fieldname LIKE 'DSA NAME' ))) from dual) as dsa_name,
    --    (
    --    SELECT UDF3
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS dsa_code, --DSA CODE
    UDF1.UDF3 AS dsa_code,
    --    (SELECT UDF4
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    )              AS dsa_name, --DSA NAME
    UDF1.UDF4      AS dsa_name,
    SPRO.LSP_LE_ID AS Party_ID,
    --    (CUSTOMERMAKERDATE(SPRO.CMS_LE_SUB_PROFILE_ID)) as maker_date,
    --  (CUSTOMERCHEKERDATE(SPRO.CMS_LE_SUB_PROFILE_ID)) as checker_date ,
    --  (select UDFDATA(MAN.CMS_LE_MAIN_PROFILE_ID,((SELECT sequence FROM cms_udf WHERE fieldname LIKE 'Form A RBI Industry Code' ))) from dual) as Form_RBI_Industry,
    --    (select UDFDATA(MAN.CMS_LE_MAIN_PROFILE_ID,((SELECT sequence FROM cms_udf WHERE fieldname LIKE 'RBI Party (IECD) Code' ))) from dual) as RBI_Party_IECD_Code,
    --   (select UDFDATA(MAN.CMS_LE_MAIN_PROFILE_ID,((SELECT sequence FROM cms_udf WHERE fieldname LIKE 'RBI Sector' ))) from dual) as RBI_Sector
    --    (
    --    SELECT UDF66
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Form_RBI_Industry, --Form A RBI Industry Code
    UDF1.UDF66 AS Form_RBI_Industry,
    --    (SELECT UDF67
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS RBI_Party_IECD_Code, --RBI Party (IECD) Code
    UDF1.UDF67 AS RBI_Party_IECD_Code,
    --    (SELECT UDF65
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS RBI_Sector, --RBI Sector
    UDF1.UDF65 AS RBI_Sector,
    --    (SELECT to_date (param_value,'dd/mm/yyyy')
    --    FROM CMS_GENERAL_PARAM
    --    WHERE param_code = 'APPLICATION_DATE'
    --    ) AS EXTRACTDATE
    to_date (gp.param_value,'dd/mm/yyyy') AS EXTRACTDATE
  FROM SCI_LSP_LMT_PROFILE PF,
    SCI_LE_SUB_PROFILE SPRO ,
    SCI_LE_MAIN_PROFILE MAN,
    sci_le_cri cri,
    SCI_LE_BANKING_METHOD BANKING,
    sci_le_udf UDF1,
    SCI_LE_REG_ADDR ra,
    (SELECT * FROM cms_city WHERE status= 'ACTIVE'
    ) city,
    (SELECT * FROM CMS_PARTY_GROUP WHERE status= 'ACTIVE'
    ) pg,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'HDFC_SEGMENT'
    ) hs,
    (SELECT * FROM COMMON_CODE_CATEGORY_ENTRY WHERE category_code = 'Entity'
    ) en,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'HDFC_INDUSTRY'
    ) hi,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'HDFC_RBI_CODE'
    ) ri,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'MSME_CLASSIC'
    ) ms,
    (SELECT * FROM CMS_GENERAL_PARAM WHERE param_code = 'APPLICATION_DATE'
    ) gp
  WHERE PF.CMS_CUSTOMER_ID(+)        = Spro.CMS_LE_SUB_PROFILE_ID
  AND SPRO.CMS_LE_MAIN_PROFILE_ID    = MAN.CMS_LE_MAIN_PROFILE_ID
  AND cri.cms_le_main_profile_id (+) = MAN.CMS_LE_MAIN_PROFILE_ID
  AND spro.status                    = 'ACTIVE'
  AND BANKING.cms_le_main_profile_id = spro.cms_le_main_profile_id
  AND spro.banking_method            = 'CONSORTIUM'
  AND banking.cms_le_lead            = 'Y'
  AND UDF1.cms_le_main_profile_id    = MAN.CMS_LE_MAIN_PROFILE_ID
  AND spro.CMS_LE_MAIN_PROFILE_ID    = ra.CMS_LE_MAIN_PROFILE_ID (+)
  AND ra.LRA_TYPE_VALUE              = 'CORPORATE'
  AND hs.entry_code(+)               = spro.lsp_sgmnt_code_value
  AND en.entry_code(+)               = spro.entity
  AND ra.lra_city_text               = city.id(+)
  AND pg.id(+)                       = spro.party_grp_nm
  AND hi.entry_code(+)               = spro.ind_nm
  AND ri.entry_code(+)               = spro.rbi_ind_code
  AND ms.entry_code(+)               = cri.MSME_CLASSIFICATION
  )
UNION
  (SELECT
    --distinct
    CAST( NULL AS CHAR(1 BYTE) ) AS Data_Source_ID,
    SPRO.LSP_LE_ID               AS party_bkey,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'HDFC_SEGMENT'
    --    AND entry_code      = spro.lsp_sgmnt_code_value
    --    )                   AS PARTY_TYPE_CODE,
    hs.ENTRY_NAME                AS PARTY_TYPE_CODE,
    SPRO.LSP_SHORT_NAME          AS PARTY_NAME ,
    CAST( NULL AS CHAR(1 BYTE) ) AS Party_Name_Alt_Lang,
    CAST( NULL AS CHAR(1 BYTE) ) AS Load_Execution_ID,
    'India'                      AS COUNTRY_CODE ,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'Entity'
    --    AND entry_code      = spro.entity
    --    ) AS PARTY_CATEGORY_CODE,
    en.ENTRY_NAME AS PARTY_CATEGORY_CODE,
    --    (SELECT CITY_NAME
    --    FROM cms_city
    --    WHERE status= 'ACTIVE'
    --    AND id     IN
    --      (SELECT ra.lra_city_text
    --      FROM SCI_LE_REG_ADDR ra
    --      WHERE ra.CMS_LE_MAIN_PROFILE_ID = spro.CMS_LE_MAIN_PROFILE_ID
    --      AND ra.LRA_TYPE_VALUE           = 'CORPORATE'
    --      )
    --    )  AS CITY_CODE ,
    city.CITY_NAME               AS CITY_CODE ,
    CAST( NULL AS CHAR(1 BYTE) ) AS Exp_Imp_Ind,
    CAST( NULL AS CHAR(1 BYTE) ) AS Party_Limit,
    CAST( NULL AS CHAR(1 BYTE) ) AS IECD_Reference,
    CAST( NULL AS CHAR(1 BYTE) ) AS Party_Status_Code,
    CAST( NULL AS CHAR(1 BYTE) ) AS Gender_Code,
    CAST( NULL AS CHAR(1 BYTE) ) AS Open_Date,
    CAST( NULL AS CHAR(1 BYTE) ) AS Close_Date,
    CAST( NULL AS CHAR(1 BYTE) ) AS Nationality_Code,
    CAST( NULL AS CHAR(1 BYTE) ) AS Customer_BKey,
    --    (SELECT ra.lra_addr_line_1
    --    FROM SCI_LE_REG_ADDR ra
    --    WHERE ra.CMS_LE_MAIN_PROFILE_ID = spro.CMS_LE_MAIN_PROFILE_ID
    --    AND ra.LRA_TYPE_VALUE           = 'CORPORATE'
    --    ) AS PARTY_ADDRESS_LINE_1,
    ra.lra_addr_line_1 AS PARTY_ADDRESS_LINE_1,
    --    (SELECT ra.lra_addr_line_2
    --    FROM SCI_LE_REG_ADDR ra
    --    WHERE ra.CMS_LE_MAIN_PROFILE_ID = spro.CMS_LE_MAIN_PROFILE_ID
    --    AND ra.LRA_TYPE_VALUE           = 'CORPORATE'
    --    ) AS PARTY_ADDRESS_LINE_2,
    ra.lra_addr_line_2 AS PARTY_ADDRESS_LINE_2,
    --    (SELECT ra.lra_addr_line_3
    --    FROM SCI_LE_REG_ADDR ra
    --    WHERE ra.CMS_LE_MAIN_PROFILE_ID = spro.CMS_LE_MAIN_PROFILE_ID
    --    AND ra.LRA_TYPE_VALUE           = 'CORPORATE'
    --    ) AS PARTY_ADDRESS_LINE_3,
    ra.lra_addr_line_3 AS PARTY_ADDRESS_LINE_3,
    --    (SELECT ra.lra_addr_line_4
    --    FROM SCI_LE_REG_ADDR ra
    --    WHERE ra.CMS_LE_MAIN_PROFILE_ID = spro.CMS_LE_MAIN_PROFILE_ID
    --    AND ra.LRA_TYPE_VALUE           = 'CORPORATE'
    --    )  AS PARTY_ADDRESS_LINE_4,
    ra.lra_addr_line_4           AS PARTY_ADDRESS_LINE_4,
    CAST( NULL AS CHAR(1 BYTE) ) AS PSU_Ind,
    --    (SELECT party_group_name
    --    FROM CMS_PARTY_GROUP
    --    WHERE id   = spro.party_grp_nm
    --    AND status = 'ACTIVE'
    --    )  AS PARENT_PARTY_BKEY ,
    pg.party_group_name          AS PARENT_PARTY_BKEY ,
    CAST( NULL AS CHAR(1 BYTE) ) AS Parent_Party_Type_Code,
    --    (SELECT entry_code
    --      ||'-'
    --      ||ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'HDFC_INDUSTRY'
    --    AND entry_code      = spro.ind_nm
    --    ) AS INDUTRY ,
    hi.entry_code
    ||'-'
    ||hi.ENTRY_NAME AS INDUTRY ,
    --    (SELECT entry_code
    --      ||'-'
    --      ||ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'HDFC_RBI_CODE'
    --    AND entry_code      = spro.rbi_ind_code
    --    )                             AS RBI_INDUSTRY ,
    ri.entry_code
    ||'-'
    ||ri.ENTRY_NAME               AS RBI_INDUSTRY ,
    spro.mpbf                     AS MPBF ,
    spro.total_funded_limit       AS FUNDED_LIMIT,
    spro.total_non_funded_limit   AS NON_FUNDED_LIMIT,
    spro.MEMO_EXPOSURE            AS MEMO_EXPOSURE ,
    spro.FUNDED_SHARE_PERCENT     AS FUNDED_SHARE_PERCENT,
    spro.NON_FUNDED_SHARE_PERCENT AS NON_FUNDED_SHARE_PERCENT,
    spro.banking_method           AS BANKING_METHOD,
    spro.FUNDED_SHARE_LIMIT       AS FUNDED_SHARE_LIMIT,
    spro.NON_FUNDED_SHARE_LIMIT   AS NON_FUNDED_SHARE_LIMIT,
    CAST( NULL AS CHAR(1 BYTE) )  AS LEAD_NODAL_BANK,
    CAST( NULL AS CHAR(1 BYTE) )  AS LEAD_BANK_BRANCH ,
    pf.RBI_ASSET_CLASSIFICATION   AS RBI_ASSET_CLASSIFICATION,
    CAST( NULL AS CHAR(1 BYTE) )  AS Metagrid_id,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'MSME_CLASSIC'
    --    AND entry_code      = cri.MSME_CLASSIFICATION
    --    ) AS type_of_unit,
    ms.ENTRY_NAME AS type_of_unit,
    --(select UDFDATA(MAN.CMS_LE_MAIN_PROFILE_ID,((SELECT sequence FROM cms_udf WHERE fieldname LIKE 'DSA CODE' ))) from dual) as dsa_code,
    --(select UDFDATA(MAN.CMS_LE_MAIN_PROFILE_ID,((SELECT sequence FROM cms_udf WHERE fieldname LIKE 'DSA NAME' ))) from dual) as dsa_name,
    --    (
    --    SELECT UDF3
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS dsa_code, --DSA CODE
    UDF1.UDF3 AS dsa_code,
    --    (SELECT UDF4
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    )              AS dsa_name, --DSA NAME
    UDF1.UDF4      AS dsa_name,
    SPRO.LSP_LE_ID AS Party_ID,
    --    (CUSTOMERMAKERDATE(SPRO.CMS_LE_SUB_PROFILE_ID)) as maker_date,
    --  (CUSTOMERCHEKERDATE(SPRO.CMS_LE_SUB_PROFILE_ID)) as checker_date ,
    --  (select UDFDATA(MAN.CMS_LE_MAIN_PROFILE_ID,((SELECT sequence FROM cms_udf WHERE fieldname LIKE 'Form A RBI Industry Code' ))) from dual) as Form_RBI_Industry,
    --    (select UDFDATA(MAN.CMS_LE_MAIN_PROFILE_ID,((SELECT sequence FROM cms_udf WHERE fieldname LIKE 'RBI Party (IECD) Code' ))) from dual) as RBI_Party_IECD_Code,
    --   (select UDFDATA(MAN.CMS_LE_MAIN_PROFILE_ID,((SELECT sequence FROM cms_udf WHERE fieldname LIKE 'RBI Sector' ))) from dual) as RBI_Sector
    --    (
    --    SELECT UDF66
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Form_RBI_Industry, --Form A RBI Industry Code
    UDF1.UDF66 AS Form_RBI_Industry,
    --    (SELECT UDF67
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS RBI_Party_IECD_Code, --RBI Party (IECD) Code
    UDF1.UDF67 AS RBI_Party_IECD_Code,
    --    (SELECT UDF65
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS RBI_Sector, --RBI Sector
    UDF1.UDF65 AS RBI_Sector,
    --    (SELECT to_date (param_value,'dd/mm/yyyy')
    --    FROM CMS_GENERAL_PARAM
    --    WHERE param_code = 'APPLICATION_DATE'
    --    ) AS EXTRACTDATE
    to_date (gp.param_value,'dd/mm/yyyy') AS EXTRACTDATE
  FROM SCI_LSP_LMT_PROFILE PF,
    SCI_LE_SUB_PROFILE SPRO ,
    SCI_LE_MAIN_PROFILE MAN,
    sci_le_cri cri,
    -- SCI_LE_BANKING_METHOD BANKING,
    sci_le_udf UDF1,
    SCI_LE_REG_ADDR ra,
    (SELECT * FROM cms_city WHERE status= 'ACTIVE'
    ) city,
    (SELECT * FROM CMS_PARTY_GROUP WHERE status= 'ACTIVE'
    ) pg,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'HDFC_SEGMENT'
    ) hs,
    (SELECT * FROM COMMON_CODE_CATEGORY_ENTRY WHERE category_code = 'Entity'
    ) en,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'HDFC_INDUSTRY'
    ) hi,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'HDFC_RBI_CODE'
    ) ri,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'MSME_CLASSIC'
    ) ms,
    (SELECT * FROM CMS_GENERAL_PARAM WHERE param_code = 'APPLICATION_DATE'
    ) gp
  WHERE PF.CMS_CUSTOMER_ID(+)        = Spro.CMS_LE_SUB_PROFILE_ID
  AND SPRO.CMS_LE_MAIN_PROFILE_ID    = MAN.CMS_LE_MAIN_PROFILE_ID
  AND cri.cms_le_main_profile_id (+) = MAN.CMS_LE_MAIN_PROFILE_ID
  AND spro.status                    = 'ACTIVE'
  AND ( spro.banking_method         IN ('SOLE','OUTSIDECONSORTIUM','OUTSIDEMULTIPLE')
  OR spro.banking_method            IS NULL)
  AND UDF1.cms_le_main_profile_id(+) = MAN.CMS_LE_MAIN_PROFILE_ID
  AND spro.CMS_LE_MAIN_PROFILE_ID    = ra.CMS_LE_MAIN_PROFILE_ID (+)
  AND ra.LRA_TYPE_VALUE              = 'CORPORATE'
  AND hs.entry_code(+)               = spro.lsp_sgmnt_code_value
  AND en.entry_code(+)               = spro.entity
  AND ra.lra_city_text               = city.id(+)
  AND pg.id(+)                       = spro.party_grp_nm
  AND hi.entry_code(+)               = spro.ind_nm
  AND ri.entry_code(+)               = spro.rbi_ind_code
  AND ms.entry_code(+)               = cri.MSME_CLASSIFICATION
  ) );

   COMMENT ON MATERIALIZED VIEW "FINCON_RECP_PARTY_VIEW"  IS 'snapshot table for snapshot CLIMSHDFCTEST.FINCON_RECP_PARTY_VIEW';
--------------------------------------------------------
--  DDL for Materialized View FINWARE_UPLOAD_STATUS_MV
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "FINWARE_UPLOAD_STATUS_MV" ("STATUS", "FACILITY_SYSTEM_ID", "LINE_NO", "SERIAL_NO", "FACILITY_SYSTEM")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS (SELECT SPRO.STATUS,
    XREF.FACILITY_SYSTEM_ID,
    XREF.LINE_NO,
    XREF.SERIAL_NO,
    XREF.facility_system
  FROM SCI_LSP_APPR_LMTS SCI,
    SCI_LSP_SYS_XREF XREF,
    SCI_LSP_LMTS_XREF_MAP MAPSS,
    SCI_LSP_LMT_PROFILE PF,
    SCI_LE_SUB_PROFILE SPRO
  WHERE SCI.CMS_LIMIT_PROFILE_ID(+) = PF.CMS_LSP_LMT_PROFILE_ID
  AND PF.CMS_CUSTOMER_ID(+)         = Spro.CMS_LE_SUB_PROFILE_ID
    --AND spro.status                   = 'ACTIVE'
  AND SCI.CMS_LSP_APPR_LMTS_ID  = MAPSS.CMS_LSP_APPR_LMTS_ID(+)
  AND MAPSS.CMS_LSP_SYS_XREF_ID = XREF.CMS_LSP_SYS_XREF_ID(+)
  AND XREF.FACILITY_SYSTEM     IN ('FW-LIMITS','FCNCB','FWL')
  );

   COMMENT ON MATERIALIZED VIEW "FINWARE_UPLOAD_STATUS_MV"  IS 'snapshot table for snapshot CLIMSHDFCTEST1304.FINWARE_UPLOAD_STATUS_MV';
--------------------------------------------------------
--  DDL for Materialized View HNKG_UPLD_CHK_PARTY_STATUS_MV
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "HNKG_UPLD_CHK_PARTY_STATUS_MV" ("STATUS", "FACILITY_SYSTEM_ID", "LINE_NO", "SERIAL_NO", "FACILITY_SYSTEM", "LSP_LE_ID")
  SEGMENT CREATION DEFERRED
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS (select SPRO.STATUS,XREF.FACILITY_SYSTEM_ID,XREF.LINE_NO,XREF.SERIAL_NO,XREF.facility_system,spro.lsp_le_id
   FROM SCI_LSP_APPR_LMTS SCI,
    SCI_LSP_SYS_XREF XREF,
    SCI_LSP_LMTS_XREF_MAP MAPSS,
    SCI_LSP_LMT_PROFILE PF,
    SCI_LE_SUB_PROFILE SPRO 
    
  WHERE SCI.CMS_LIMIT_PROFILE_ID(+) = PF.CMS_LSP_LMT_PROFILE_ID   
  AND PF.CMS_CUSTOMER_ID(+)         = Spro.CMS_LE_SUB_PROFILE_ID 
  --AND spro.status                   = 'ACTIVE'
  AND SCI.CMS_LSP_APPR_LMTS_ID  = MAPSS.CMS_LSP_APPR_LMTS_ID(+)
  AND MAPSS.CMS_LSP_SYS_XREF_ID = XREF.CMS_LSP_SYS_XREF_ID(+)
  AND XREF.FACILITY_SYSTEM in('HONGKONG'));

   COMMENT ON MATERIALIZED VIEW "HNKG_UPLD_CHK_PARTY_STATUS_MV"  IS 'snapshot table for snapshot CLIMSHDFCTEST.HNKG_UPLD_CHK_PARTY_STATUS_MV';
--------------------------------------------------------
--  DDL for Materialized View HONGKONG_UPLOAD_STATUS_MV
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "HONGKONG_UPLOAD_STATUS_MV" ("STATUS", "FACILITY_SYSTEM_ID", "LINE_NO", "SERIAL_NO", "FACILITY_SYSTEM")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS (SELECT SPRO.STATUS,
    XREF.FACILITY_SYSTEM_ID,
    XREF.LINE_NO,
    XREF.SERIAL_NO,
    XREF.facility_system
  FROM SCI_LSP_APPR_LMTS SCI,
    SCI_LSP_SYS_XREF XREF,
    SCI_LSP_LMTS_XREF_MAP MAPSS,
    SCI_LSP_LMT_PROFILE PF,
    SCI_LE_SUB_PROFILE SPRO
  WHERE SCI.CMS_LIMIT_PROFILE_ID(+) = PF.CMS_LSP_LMT_PROFILE_ID
  AND PF.CMS_CUSTOMER_ID(+)         = Spro.CMS_LE_SUB_PROFILE_ID
    --AND spro.status                   = 'ACTIVE'
  AND SCI.CMS_LSP_APPR_LMTS_ID  = MAPSS.CMS_LSP_APPR_LMTS_ID(+)
  AND MAPSS.CMS_LSP_SYS_XREF_ID = XREF.CMS_LSP_SYS_XREF_ID(+)
  AND XREF.FACILITY_SYSTEM     IN('HONGKONG')
  );

   COMMENT ON MATERIALIZED VIEW "HONGKONG_UPLOAD_STATUS_MV"  IS 'snapshot table for snapshot CLIMSHDFCTEST.HONGKONG_UPLOAD_STATUS_MV';
--------------------------------------------------------
--  DDL for Materialized View MV_BASE_TABLE_TEST
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "MV_BASE_TABLE_TEST" ("PARTY_ID", "PARTY_NAME", "SEGMENTNAME", "RMREGION", "RMNAME", "CAMTYPE", "RAMRATING", "STATEMENTTYPE", "STATUS", "DOCUMENT_CODE", "TRANSACTION_DATE", "PROFILE_ID")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS (
  (SELECT DISTINCT
    ------------------------------------------------------------------
    sub_profile.lsp_le_id      AS party_id,
    sub_profile.lsp_short_name AS party_name,
    cc_segment.entry_name      AS segmentName,
    reg.region_name            AS rmRegion,
    rm.rm_mgr_name             AS rmname,
    pf.cam_type                AS CAMType,
    pf.cms_appr_officer_grade  AS RAMRating,
    chklist.statement_type     AS statementType,
    'Not Maintained'           AS status,
    -------------------------------------------------------------------
    glb.document_code,
    trx.transaction_date,
    sub_profile.cms_le_sub_profile_id AS profile_id
    -------------------------------------------------------------------
  FROM  
    cms_checklist checklist,
    (select * from cms_document_globallist where deprecated = 'N'
   AND category = 'REC')glb,
    (SELECT item.document_code,
      item.statement_type,
      chk.checklist_id,
      item.status
    FROM cms_checklist_item item,
      cms_checklist chk
    WHERE item.checklist_id = chk.checklist_id
    AND item.is_deleted     = 'N'
    GROUP BY item.document_code,
      item.statement_type,
      chk.checklist_id,
      item.status
    )chklist,
    SCI_LSP_LMT_PROFILE pf,
    (select * from  SCI_LE_SUB_PROFILE where  status!= 'INACTIVE') sub_profile,
    (SELECT entry_name,
      entry_code
    FROM common_code_category_entry
    WHERE category_code = 'HDFC_SEGMENT'
    ) cc_segment,
    cms_relationship_mgr rm ,
    (select * from SCI_LE_REG_ADDR where lra_type_value= 'CORPORATE') addr,
    CMS_REGION reg,
   (select * from  transaction where  (transaction_type              ='CHECKLIST'
  OR transaction_type               IS NULL)) trx
  WHERE glb.document_code NOT IN
    (SELECT item.document_code
    FROM cms_checklist_item item
    WHERE item.checklist_id = checklist.checklist_id
    AND item.is_deleted     = 'N'
    )
  AND checklist.checklist_id             = chklist.checklist_id
 -- AND glb.category                       = 'REC'
  AND glb.statement_type                 = chklist.statement_type
 -- AND glb.deprecated                     = 'N'
  AND sub_profile.cms_le_sub_profile_id  = pf.cms_customer_id(+)
  AND checklist.cms_lsp_lmt_profile_id   = pf.cms_lsp_lmt_profile_id
  AND checklist.checklist_id             = trx.reference_id(+)
--  AND (trx.transaction_type              ='CHECKLIST'
--  OR trx.transaction_type               IS NULL)
  AND cc_segment.entry_code(+)           = sub_profile.lsp_sgmnt_code_value
  AND sub_profile.cms_le_main_profile_id = addr.cms_le_main_profile_id(+)
  AND rm.id(+)                           = sub_profile.relation_mgr
  AND reg.id (+)                         = sub_profile.rm_region
  --AND addr.lra_type_value                = 'CORPORATE'
--  AND sub_profile.status                != 'INACTIVE'
  )
UNION ALL
  ( SELECT DISTINCT
    ------------------------------------------------------------------
    sub_profile.lsp_le_id      AS party_id,
    sub_profile.lsp_short_name AS party_name,
    cc_segment.entry_name      AS segmentName,
    reg.region_name            AS rmRegion,
    rm.rm_mgr_name             AS rmname,
    pf.cam_type                AS CAMType,
    pf.cms_appr_officer_grade  AS RAMRating,
    chklist.statement_type     AS statementType,
    chklist.status             AS status,
    -------------------------------------------------------------------
    glb.document_code,
    trx.transaction_date,
    sub_profile.cms_le_sub_profile_id AS profile_id
    -------------------------------------------------------------------
  FROM 
  
   
    cms_checklist checklist,
    (select * from cms_document_globallist where deprecated = 'N'
   AND category = 'REC')glb, 
    (SELECT DISTINCT item.document_code,
      item.statement_type,
      chk.checklist_id,
      item.status
    FROM cms_checklist_item item,
      cms_checklist chk
    WHERE item.checklist_id = chk.checklist_id
    AND chk.checklist_id    = item.checklist_id
    AND item.is_deleted     = 'N'
    GROUP BY item.document_code,
      item.statement_type,
      chk.checklist_id,
      item.status
    )chklist,
    SCI_LSP_LMT_PROFILE pf,
    (select * from  SCI_LE_SUB_PROFILE where  status!= 'INACTIVE') sub_profile,
    (SELECT entry_name,
      entry_code
    FROM common_code_category_entry
    WHERE category_code = 'HDFC_SEGMENT'
    ) cc_segment,
    cms_relationship_mgr rm ,
    (select * from SCI_LE_REG_ADDR where lra_type_value= 'CORPORATE') addr,
    CMS_REGION reg,
    (select * from  transaction where  (transaction_type              ='CHECKLIST'
  OR transaction_type IS NULL)) trx
  WHERE glb.document_code IN
    (SELECT item.document_code
    FROM cms_checklist_item item
    WHERE item.checklist_id = chklist.checklist_id
    )
  AND checklist.checklist_id             = chklist.checklist_id
 -- AND glb.category                       = 'REC'
  AND glb.statement_type                 = chklist.statement_type
  --AND glb.deprecated                     = 'N'
  AND sub_profile.cms_le_sub_profile_id  = pf.cms_customer_id(+)
  AND checklist.cms_lsp_lmt_profile_id   = pf.cms_lsp_lmt_profile_id
  AND checklist.checklist_id             = trx.reference_id(+)
--  AND (trx.transaction_type              ='CHECKLIST'
--  OR trx.transaction_type               IS NULL)
  AND cc_segment.entry_code(+)           = sub_profile.lsp_sgmnt_code_value
  AND sub_profile.cms_le_main_profile_id = addr.cms_le_main_profile_id(+)
  AND rm.id(+)                           = sub_profile.relation_mgr
  AND reg.id (+)                         = sub_profile.rm_region
 -- AND addr.lra_type_value                = 'CORPORATE'
  --AND sub_profile.status                != 'INACTIVE'
  AND glb.document_code                  = chklist.document_code
  ) );

   COMMENT ON MATERIALIZED VIEW "MV_BASE_TABLE_TEST"  IS 'snapshot table for snapshot CLIMSHDFCTEST.MV_BASE_TABLE_TEST';
--------------------------------------------------------
--  DDL for Materialized View MV_RBIFYDATADEC15_6
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "MV_RBIFYDATADEC15_6" ("CMS_LE_SUB_PROFILE_ID", "LSP_ID", "LSP_LE_ID", "LSP_SHORT_NAME", "LSP_DMCL_REG_NUM_TEXT", "LSP_DMCL_CNTRY_ISO_CODE", "LSP_SWIFT_CNTRY_CODE", "LSP_ORGN_TYPE_NUM", "LSP_ORGN_TYPE_VALUE", "LSP_DCL_AGREE_IND", "LSP_DCL_AGREE_DATE", "LSP_LANG_CODE_NUM", "LSP_LANG_CODE_VALUE", "LSP_REL_START_DATE", "LSP_SVC_STD_PRRTY_NUM", "LSP_SVC_STD_PRRTY_VALUE", "LSP_BANK_SCY_ACT_IND", "LSP_TRSRY_APPL_NUM", "LSP_TRSRY_APPL_VALUE", "LSP_OPR_STATUS_2_NUM", "LSP_OPR_STATUS_2_VALUE", "LSP_OPR_STATUS_2_EFF_DATE", "LSP_OFF_ADDR_CHK_IND", "LSP_INSTRC_REF_CHK_IND", "LSP_SYS_XREF_CHK_IND", "LSP_EMP_MAP_CHK_IND", "LSP_LMT_PROFILE_CHK_IND", "LSP_PLCY_EXCEP_CHK_IND", "LSP_APPR_LMTS_CHK_IND", "LSP_CO_BORR0W_LMT_CHK_IND", "LSP_LMTS_XREF_MAP_CHK_IND", "LSP_COBO_XREF_MAP_CHK_IND", "LSP_LMTS_SEC_MAP_CHK_IND", "PROGRESS_STATUS_NUM", "PROGRESS_STATUS_VALUE", "LSP_SUB_PROFILE_CHK_IND", "CREATE_USER_ID", "LAST_UPDATE_USER_ID", "VERIFY_USER_ID", "CREATE_DATE", "LAST_UPDATE_DATE", "VERIFY_DATE", "UPDATE_COUNT", "UPDATE_STATUS_IND", "LOCK_IND", "LOCK_USER_ID", "LOCK_LE_IND", "CHANGE_IND", "MAKER_HUB_LOCTN_NUM", "MAKER_HUB_LOCTN_VALUE", "CMS_LE_MAIN_PROFILE_ID", "CMS_VERSION_TIME", "CMS_CCC_STATUS", "CMS_SUB_ORIG_COUNTRY", "CMS_SUB_ORIG_ORGANISATION", "CMS_NON_BORROWER_IND", "ULSP_SHORT_NAME", "STATUS", "PAN", "RELATION_MGR", "PARTY_GRP_NM", "RM_REGION", "IND_NM", "ENTITY", "CYCLE_NM", "PART_REGION", "RBI_IND_CODE", "SUB_LINE", "BANKING_METHOD", "TOTAL_FUNDED_LIMIT", "TOTAL_NON_FUNDED_LIMIT", "FUNDED_SHARE_PERCENT", "NON_FUNDED_SHARE_PERCENT", "MEMO_EXPOSURE", "TOTAL_SANCTIONED_LIMIT", "MPBF", "FUNDED_SHARE_LIMIT", "NON_FUNDED_SHARE_LIMIT", "BORROWER_DUNS_NO", "CLASS_ACTIVITY_1", "CLASS_ACTIVITY_2", "CLASS_ACTIVITY_3", "WILLFUL_DEFAULT_STATUS", "SUIT_FILLED_STATUS", "DATE_OF_SUIT", "SUIT_AMOUNT", "SUIT_REF_NO", "DATE_WILLFUL_DEFAULT", "REG_OFFICE_DUNS_NO", "CURRENCY1", "PARTY_CONSENT", "MAIN_BRANCH", "COPY_REG_ADDR", "BRANCH_CODE", "LSP_SGMNT_CODE_VALUE", "FUNDED_INCRE_DECRE", "NONFUNDED_INCRE_DECRE", "MEMOEXPOS_INCRE_DECRE", "CMS_LSP_LMT_PROFILE_ID1", "LLP_ID1", "LLP_LE_ID1", "LLP_LSP_ID1", "LLP_NEXT_ANNL_RVW_DATE1", "LLP_NEXT_INTRM_RVW_DATE1", "LLP_CRDT_PLCY_COMPLNCE_IND1", "LLP_UNWRT_STD_CMPLNCE_IND1", "LLP_EXTD_NEXT_RVW_DATE1", "LLP_PRJTD_ECON_PROFIT1", "LLP_EXPECT_LOSS_AMT1", "LLP_PROD_PRG_COMPLNCE_IND1", "LLP_CNTRY_RISK_APPR_REQ_IND1", "LLP_BKG_LOCTN_ID1", "CREATE_USER_ID1", "LAST_UPDATE_USER_ID1", "VERIFY_USER_ID1", "CREATE_DATE1", "LAST_UPDATE_DATE1", "VERIFY_DATE1", "UPDATE_COUNT1", "UPDATE_STATUS_IND1", "CHANGE_IND1", "LLP_2ND_APPR_EMP_ID1", "LLP_1ST_APPR_EMP_ID1", "LLP_BCA_REF_NUM1", "LOS_BCA_REF_NUM1", "LLP_BCA_REF_APPR_DATE1", "CMS_REQ_SEC_COVERAGE1", "CMS_ACT_SEC_COVERAGE1", "CMS_APPR_OFFICER_GRADE1", "CMS_VERSION_TIME1", "CMS_CUSTOMER_ID1", "CMS_BCA_STATUS1", "CMS_BCA_CREATE_DATE1", "CMS_TAT_CREATE_DATE1", "CMS_BFL_REQUIRED_IND1", "CMS_ORIG_COUNTRY1", "CMS_ORIG_ORGANISATION1", "CMS_BCA_RENEWAL_IND1", "CMS_FULL_DOC_REVIEW_IND1", "CMS_BCA_COMPLETE_IND1", "CMS_CCC_COMPLETE_IND1", "CMS_SCC_COMPLETE_IND1", "LLP_1ST_APPR_EMP_NAME1", "LLP_2ND_APPR_EMP_NAME1", "CMS_BCA_LOCAL_IND1", "CMS_BFL_IND_UPDATE_DATE1", "CMS_EXTENDED_BFL_DATE1", "CMS_CB_ACT_SEC_COVERAGE1", "IS_MIGRATED_IND1", "LLP_SEGMENT_CODE_NUM1", "LLP_SEGMENT_CODE_VALUE1", "ISLAMIC_FLAG1", "SOURCE_ID1", "LSP_LMT_PROFILE_SRC_ID_OLD1", "CMS_BCA_JOINT_IND1", "LMT_PROFILE_TYPE1", "APPLICATION_TYPE1", "APPLICATION_LAW_TYPE1", "CMS_CREATE_IND1", "CIF_SOURCE_ID1", "LI_GENERATION_DATE1", "CAM_TYPE1", "CAM_LOGIN_DATE1", "NO_OF_TIMES_EXTENDED1", "TOTAL_SACTIONED_AMOUNT1", "RELATIONSHIP_MANAGER1", "CONTROLLING_BRANCH1", "COMMITTE_APPROVAL1", "ASSET_CLASSIFICATION1", "RBI_ASSET_CLASSIFICATION1", "BOARD_APPROVAL1", "LLP_3RD_APPR_EMP_NAME1", "LLP_4TH_APPR_EMP_NAME1", "LLP_5TH_APPR_EMP_NAME1", "DOC_REMARKS1", "FULLY_CASH_COLLATERAL1", "TOTAL_SANCTIONED_FAC_AMT1", "RATING_TYPE1", "RATING_YEAR1", "CMS_LSP_APPR_LMTS_ID2", "CMS_LIMIT_PROFILE_ID2", "LMT_ID2", "LOS_LMT_ID2", "ACF_NO2", "LMT_BKG_LOCTN_ID2", "LMT_PRD_TYPE_NUM2", "LMT_PRD_TYPE_VALUE2", "LMT_TYPE_NUM2", "LMT_TYPE_VALUE2", "LMT_AMT2", "LMT_SEC_TYPE_NUM2", "LMT_SEC_TYPE_VALUE2", "LMT_CRRNCY_ISO_CODE2", "LMT_OUTER_LMT_ID2", "LMT_EXPRY_DATE2", "LMT_INTRST_BASE_NUM2", "LMT_TENOR2", "LMT_INTRST_BASE_VALUE2", "LMT_INTRST_MARGIN2", "INTEREST_RATE2", "LMT_CMMSN2", "LMT_FEE2", "LMT_CONDTN_TEXT2", "LMT_ADVISE_IND2", "LMT_CMMTD_IND2", "LMT_SHARE_IND2", "CREATE_USER_ID2", "LAST_UPDATE_USER_ID2", "VERIFY_USER_ID2", "CREATE_DATE2", "LAST_UPDATE_DATE2", "VERIFY_DATE2", "UPDATE_COUNT2", "UPDATE_STATUS_IND2", "CHANGE_IND2", "LMT_TENOR_BASIS_NUM2", "LMT_LLP_ID2", "LMT_TENOR_BASIS_VALUE2", "LMT_LE_ID2", "LMT_LSP_ID2", "CMS_ACT_SEC_COVERAGE2", "CMS_REQ_SEC_COVERAGE2", "CMS_VERSION_TIME2", "CMS_LIMIT_STATUS2", "CMS_ACTIVATED_LIMIT2", "CMS_BKG_COUNTRY2", "CMS_BKG_ORGANISATION2", "CMS_IS_LIMIT_EXISTING_IND2", "CMS_ACTIVATED_LIMIT_IND2", "CMS_OUTER_LMT_REF2", "CMDT_OP_LMT2", "CMS_OUTER_LMT_PROF_ID2", "CMS_REF_ID2", "GROUP_ID2", "ZERO_REASON2", "ZERO_DATE2", "ZERO_IND2", "CMS_CR125_DER_ACTVD_LMT_AMT2", "LMT_PRD_GRP_NUM2", "LMT_PRD_GRP_VALUE2", "CMS_DRAWING_LIMIT2", "CMS_OUTSTANDING_AMT2", "LMT_DESC2", "LMT_FAC_TYPE_NUM2", "LMT_FAC_TYPE_VALUE2", "SOURCE_ID2", "LMT_BCA_REF_NUM2", "LOS_BCA_REF_NUM2", "LMT_ID_OLD2", "LMT_OMNIBUS_IND2", "LMT_FAC_CODE2", "LMT_FAC_SEQ2", "ACCOUNT_TYPE2", "AVAILABLE_LMT2", "LOAN_TYPE2", "CMS_ACTUAL_SEC_COVERAGE_AMT2", "CMS_OMV_SEC_COVERAGE_AMT2", "CMS_FSV_SEC_COVERAGE_AMT2", "INNER_LIMIT_ORDERING2", "OMNIBUS_ENVELOPE_ID2", "OMNIBUS_ENVELOPE_NAME2", "DISBURSED_IND2", "LMT_LOAN_SECTOR_NUM2", "LMT_LOAN_SECTOR_VALUE2", "FACILITY_TYPE2", "RELEASABLE_AMOUNT2", "FACILITY_NAME2", "FACILITY_SYSTEM2", "FACILITY_SYSTEM_ID2", "LINE_NO2", "PURPOSE2", "IS_DP2", "RELATIONSHIP_MANAGER2", "IS_RELEASED2", "GRADE2", "IS_SECURED2", "IS_ADHOC2", "FACILITY_CAT2", "GUARANTEE2", "SUB_PARTY_NAME2", "SUB_FACILITY_NAME2", "LIABILITY_ID2", "ADHOC_LMT_AMOUNT2", "IS_ADHOC_TOSUM2", "TOTAL_RELEASED_AMOUNT2", "OTHER_PURPOSE2", "CMS_LSP_SYS_XREF_ID3", "LSX_ID3", "LSX_LE_ID3", "LSX_BKG_LOCTN_ID3", "LSX_LSP_ID3", "LSX_EXT_SYS_CODE_NUM3", "LSX_EXT_SYS_CODE_VALUE3", "LSX_EXT_SYS_CUST_ID3", "LSX_EXT_SYS_CUST_NAME3", "LSX_EXT_SYS_ACCT_NUM3", "LSX_ACCT_STATUS_TEXT3", "CREATE_USER_ID3", "LAST_UPDATE_USER_ID3", "VERIFY_USER_ID3", "CREATE_DATE3", "LAST_UPDATE_DATE3", "VERIFY_DATE3", "UPDATE_COUNT3", "UPDATE_STATUS_IND3", "CHANGE_IND3", "CMS_LE_SUB_PROFILE_ID3", "ACCOUNT_DESC_NUM3", "ACCOUNT_DESC_VALUE3", "LSX_EXT_SYS_ACCT_SEQ3", "LSX_FAC_CODE3", "LSX_FAC_SEQ3", "LSX_EXT_CTY_CODE_VALUE3", "ACCT_DELQ_IND3", "ACCT_EFFECTIVE_DATE3", "ACCT_STATUS3", "LSX_BCA_REF_NUM3", "LSX_LMT_ID3", "LSX_BKG_LOCTN_CTRY3", "LSX_BKG_LOCTN_ORG3", "LSX_EXT_SYS_ACCT_TYPE3", "ACCT_RV3", "ACCT_RV_CCY3", "FIRST_DISBURSEMENT_DATE3", "FINAL_DISBURSEMENT_DATE3", "CMS_SEC_COVERAGE_AMT3", "CMS_OUTSTANDING_AMT3", "LAST_ALLOCATION_DATE3", "OUTSTANDING_AMT_CCY3", "SEC_COVERAGE_AMT_CCY3", "SERIAL_NO3", "INTEREST_RATE_TYPE3", "INT_RATE_FLOATING_TYPE3", "INT_RATE_FLOATING_RANGE3", "INT_RATE_FLOATING_MARGIN_FLAG3", "INT_RATE_FLOATING_MARGIN3", "RELEASED_AMOUNT3", "UTILIZED_AMOUNT3", "RELEASE_DATE3", "DATE_OF_RESET3", "IS_PERMNT_SSI_CERT3", "IS_CAPITAL_MARKET_EXPOSER3", "IS_REALESTATE_EXPOSER3", "ESTATE_TYPE3", "IS_PRIORITY_SECTOR3", "PRIORITY_SECTOR3", "SECURITY13", "SECURITY23", "SECURITY33", "FACILITY_SYSTEM_ID3", "LINE_NO3", "FACILITY_SYSTEM3", "INT_RATE_FIX3", "COMM_REAL_ESTATE_TYPE3", "SECURITY43", "SECURITY53", "SECURITY63", "UPLOAD_STATUS3", "UP_FOREIGN_CUR_CODE3", "UP_FOREIGN_LMT_AMT3", "UP_FOREIGN_UTL_AMT3", "CMS_LE_BANKING_METHOD_ID4", "CMS_LE_MAIN_PROFILE_ID4", "CMS_LE_NODAL4", "CMS_LE_LEAD4", "CMS_LE_BANK_ID4", "CMS_LE_BANK_TYPE4", "SCI_LE_CRI_ID5", "CMS_LE_MAIN_PROFILE_ID5", "CUSTOMER_RAM_ID5", "CUSTOMER_APR_CODE5", "CUSTOMER_EXT_RATING5", "IS_NBFS5", "NBFS_A5", "NBFS_B5", "IS_PRIORITY_SECTOR5", "MSME_CLASSIFICATION5", "IS_PERMENENT_SSI_CERT5", "IS_WEAKER_SECTION5", "WEAKER_SECTION5", "IS_KISAN_CREDIT_CARD5", "IS_MINORITY_COMMUNITY5", "MINORITY_COMMUNITY5", "IS_CAPITAL_MARKET_EXPOS5", "IS_REAL_ESTATE_EXPOS5", "REAL_ESTATE_EXPOS_TYPE5", "REAL_ESTATE_EXPOS_COMM5", "IS_COMMODITIES_EXPOSER5", "IS_SENSITIVE5", "COMMODITIES_NAME5", "GROSS_INVS_IN_PM5", "GROSS_INVS_IN_EQUIP5", "PSU5", "PSU_PERCENTAGE5", "GOVT_UNDER_TAKING5", "IS_PROJECT_FINANCE5", "IS_INFRASTRUCTURE_FINANACE5", "INFRASTRUCTURE_FINANACE_TYPE5", "IS_SEMS_GUIDE_APPLICABLE5", "IS_FAIL_IFC_EXCLU_LIST5", "IS_TUFS5", "IS_RBI_DEFAULTER5", "RBI_DEFAULTER5", "IS_LITIGATION5", "LITIGATION_BY5", "IS_INTEREST_OF_BANK5", "INTEREST_OF_BANK5", "IS_ADVERSE_REMARK5", "ADVERSE_REMARK5", "AUDIT_TYPE5", "AVG_ANNUAL_TURNOVER5", "INDUSTRY_EXPOSER5", "IS_DIREC_OTHER_BANK5", "DIREC_OTHER_BANK5", "IS_PARTNER_OTHER_BANK5", "PARTNER_OTHER_BANK5", "IS_SUBSTANTIAL_OTHER_BANK5", "SUBSTANTIAL_OTHER_BANK5", "IS_HDFC_DIREC_RLTV5", "HDFC_DIREC_RLTV5", "IS_OBK_DIREC_RLTV5", "OBK_DIREC_RLTV5", "IS_PARTNER_DIREC_RLTV5", "PARTNER_DIREC_RLTV5", "IS_SUBSTTIAL_RLTV_HDFC_OTHER5", "SUBSTANTIAL_RLTV_HDFC_OTHER5", "DIREC_HDFC_OTHER5", "IS_BACKED_BY_GOVT5", "GOVT_SCHEME_TYPE5", "FIRST_YEAR5", "SECOND_YEAR5", "THIRD_YEAR5", "SECOND_YEAR_TURNOVER5", "FIRST_YEAR_TURNOVER5", "THIRD_YEAR_TURNOVER5", "FIRST_YEAR_TURNOVER_CURRENCY5", "SECOND_YEAR_TURNOVER_CURRENCY5", "THIRD_YEAR_TURNOVER_CURRENCY5", "CMS_LE_DIRECTOR_ID6", "CMS_LE_MAIN_PROFILE_ID6", "RELATED_TYPE6", "RELATIONSHIP_TYPE6", "DIR_EMAIL6", "DIR_FAX6", "DIR_TEL_NO6", "DIR_COUNTRY6", "DIR_STATE6", "DIR_CITY6", "DIR_REGION6", "DIR_POST_CODE6", "DIR_ADD36", "DIR_ADD26", "DIR_ADD16", "PERCENT_OF_CTRL6", "FULL_NAME6", "NAME_PREFIX6", "BUSSNESS_NAME6", "DIR_PAN6", "RELATED_DUNS_NO6", "DIN_NO6", "DIR_NAME6", "DIR_STD_CODE_TELEX6", "DIR_STD_CODE_TEL6", "CMS_LE_MAIN_PROFILE_ID7", "UDF17", "UDF27", "UDF37", "UDF47", "UDF57", "UDF67", "UDF77", "UDF87", "UDF97", "UDF107", "UDF117", "UDF127", "UDF137", "UDF147", "UDF157", "UDF167", "UDF177", "UDF187", "UDF197", "UDF207", "UDF217", "UDF227", "UDF237", "UDF247", "UDF257", "UDF267", "UDF277", "UDF287", "UDF297", "UDF307", "UDF317", "UDF327", "UDF337", "UDF347", "UDF357", "UDF367", "UDF377", "UDF387", "UDF397", "UDF407", "UDF417", "UDF427", "UDF437", "UDF447", "UDF457", "UDF467", "UDF477", "UDF487", "UDF497", "UDF507", "UDF517", "UDF527", "UDF537", "UDF547", "UDF557", "UDF567", "UDF577", "UDF587", "UDF597", "UDF607", "UDF617", "UDF627", "UDF637", "UDF647", "UDF657", "UDF667", "UDF677", "UDF687", "UDF697", "UDF707", "UDF717", "UDF727", "UDF737", "UDF747", "UDF757", "UDF767", "UDF777", "UDF787", "UDF797", "UDF807", "UDF817", "UDF827", "UDF837", "UDF847", "UDF857", "UDF867", "UDF877", "UDF887", "UDF897", "UDF907", "UDF917", "UDF927", "UDF937", "UDF947", "UDF957", "UDF967", "UDF977", "UDF987", "UDF997", "UDF1007", "SECURITY_ID", "SECURITY_TYPE", "SECURITY_SUB_TYPE", "CURRENCY", "DEPOSITE_RECIPT_NO", "DEPOSITOR_NAME", "DEPOSIT_AMOUNT", "LIEN_AMOUNT", "INTEREST_RATE", "DEPOSIT_DATE", "DEPOSIT_MATURITY_DATE", "GUARANTERS_NAME", "REFERENCE_NUMBER_OF_GUARANTEE", "NETWORTH", "NETWORTH_DATE", "START_DATE_OF_GUARANTEE", "SECURITY_MATURITY_DATE", "GUARANTOR_TYPE", "GUARANTERS_NAME_PREFIX", "GUARANTERS_FULL_NAME", "GUARANTOR_NATURE", "RAMID", "ADDRESS_LINE1", "ADDRESS_LINE2", "ADDRESS_LINE3", "CITY", "STATE", "REGION", "COUNTRY", "PINCODE", "DISCRIPTION_OF_ASSETS", "SECURITY_AMOUNT", "GROSS_AMOUNT", "DUE_DATE", "CURRENT_ASSET", "LONABLE_AMOUNT", "POLICY_NO", "STARE_DATE", "EXPIRY_DATE", "VALUATIOIN_DATE", "VALUATION_AMOUNT", "REVALUATION_FRQUENCY", "NEXT_VALUATION_DATE", "CHARGE_TYPE", "MATURITY_DATE", "START_DATE", "RAM_ID", "CHEQUE_AMOUNT", "CHEQUE_NUMBER", "PHY_INSPECTION_DONE", "PHY_INSPECTION_FREQ", "LAST_PHY_INSPECT_DATE", "NEXT_PHY_INSPECT_DATE", "PROPERTY_TYPE", "MARGAGE_TYPE", "VALUATION_DATE", "MORGAGE_CREATED_BY", "TOTAL_PROPERTY_AMOUNT", "PRIOR_CLAIM", "TYPE_OF_CLAIM", "MORTAGE_REGISTERED_REF", "VALUATOR_COMPANY", "ADVOCATE_LAWYER_NAME", "BUILTUP_AREA", "PROPERTY_ADDRESS", "DESCRIPTION_ASSET", "NO_OF_UNITS", "STOCK_CODE", "BOND_NAME", "UNIT_PRICE", "TOTAL_VALUE")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE USING NO INDEX 
  NEVER REFRESH DISABLE ON QUERY COMPUTATION ENABLE QUERY REWRITE
  AS SELECT DISTINCT spro.CMS_LE_SUB_PROFILE_ID ,
    spro.LSP_ID ,
    spro.LSP_LE_ID ,
    spro.LSP_SHORT_NAME ,
    spro.LSP_DMCL_REG_NUM_TEXT ,
    spro.LSP_DMCL_CNTRY_ISO_CODE ,
    spro.LSP_SWIFT_CNTRY_CODE ,
    spro.LSP_ORGN_TYPE_NUM ,
    spro.LSP_ORGN_TYPE_VALUE ,
    spro.LSP_DCL_AGREE_IND ,
    spro.LSP_DCL_AGREE_DATE ,
    spro.LSP_LANG_CODE_NUM ,
    spro.LSP_LANG_CODE_VALUE ,
    spro.LSP_REL_START_DATE ,
    spro.LSP_SVC_STD_PRRTY_NUM ,
    spro.LSP_SVC_STD_PRRTY_VALUE ,
    spro.LSP_BANK_SCY_ACT_IND ,
    spro.LSP_TRSRY_APPL_NUM ,
    spro.LSP_TRSRY_APPL_VALUE ,
    spro.LSP_OPR_STATUS_2_NUM ,
    spro.LSP_OPR_STATUS_2_VALUE ,
    spro.LSP_OPR_STATUS_2_EFF_DATE ,
    spro.LSP_OFF_ADDR_CHK_IND ,
    spro.LSP_INSTRC_REF_CHK_IND ,
    spro.LSP_SYS_XREF_CHK_IND ,
    spro.LSP_EMP_MAP_CHK_IND ,
    spro.LSP_LMT_PROFILE_CHK_IND ,
    spro.LSP_PLCY_EXCEP_CHK_IND ,
    spro.LSP_APPR_LMTS_CHK_IND ,
    spro.LSP_CO_BORR0W_LMT_CHK_IND ,
    spro.LSP_LMTS_XREF_MAP_CHK_IND ,
    spro.LSP_COBO_XREF_MAP_CHK_IND ,
    spro.LSP_LMTS_SEC_MAP_CHK_IND ,
    spro.PROGRESS_STATUS_NUM ,
    spro.PROGRESS_STATUS_VALUE ,
    spro.LSP_SUB_PROFILE_CHK_IND ,
    spro.CREATE_USER_ID ,
    spro.LAST_UPDATE_USER_ID ,
    spro.VERIFY_USER_ID ,
    spro.CREATE_DATE ,
    spro.LAST_UPDATE_DATE ,
    spro.VERIFY_DATE ,
    spro.UPDATE_COUNT ,
    spro.UPDATE_STATUS_IND ,
    spro.LOCK_IND ,
    spro.LOCK_USER_ID ,
    spro.LOCK_LE_IND ,
    spro.CHANGE_IND ,
    spro.MAKER_HUB_LOCTN_NUM ,
    spro.MAKER_HUB_LOCTN_VALUE ,
    spro.CMS_LE_MAIN_PROFILE_ID ,
    spro.CMS_VERSION_TIME ,
    spro.CMS_CCC_STATUS ,
    spro.CMS_SUB_ORIG_COUNTRY ,
    spro.CMS_SUB_ORIG_ORGANISATION ,
    spro.CMS_NON_BORROWER_IND ,
    spro.ULSP_SHORT_NAME ,
    spro.STATUS ,
    spro.PAN ,
    spro.RELATION_MGR ,
    spro.PARTY_GRP_NM ,
    spro.RM_REGION ,
    spro.IND_NM ,
    spro.ENTITY ,
    spro.CYCLE_NM ,
    spro.REGION AS PART_REGION,
    spro.RBI_IND_CODE ,
    spro.SUB_LINE ,
    spro.BANKING_METHOD ,
    spro.TOTAL_FUNDED_LIMIT ,
    spro.TOTAL_NON_FUNDED_LIMIT ,
    spro.FUNDED_SHARE_PERCENT ,
    spro.NON_FUNDED_SHARE_PERCENT ,
    spro.MEMO_EXPOSURE ,
    spro.TOTAL_SANCTIONED_LIMIT ,
    spro.MPBF ,
    spro.FUNDED_SHARE_LIMIT ,
    spro.NON_FUNDED_SHARE_LIMIT ,
    spro.BORROWER_DUNS_NO ,
    spro.CLASS_ACTIVITY_1 ,
    spro.CLASS_ACTIVITY_2 ,
    spro.CLASS_ACTIVITY_3 ,
    spro.WILLFUL_DEFAULT_STATUS ,
    spro.SUIT_FILLED_STATUS ,
    spro.DATE_OF_SUIT ,
    spro.SUIT_AMOUNT ,
    spro.SUIT_REF_NO ,
    spro.DATE_WILLFUL_DEFAULT ,
    spro.REG_OFFICE_DUNS_NO ,
    spro.CURRENCY AS currency1 ,
    spro.PARTY_CONSENT ,
    spro.MAIN_BRANCH ,
    spro.COPY_REG_ADDR ,
    spro.BRANCH_CODE ,
    spro.LSP_SGMNT_CODE_VALUE ,
    spro.FUNDED_INCRE_DECRE ,
    spro.NONFUNDED_INCRE_DECRE ,
    spro.MEMOEXPOS_INCRE_DECRE ,
    PF.CMS_LSP_LMT_PROFILE_ID          AS CMS_LSP_LMT_PROFILE_ID1 ,
    PF.LLP_ID                          AS LLP_ID1 ,
    PF.LLP_LE_ID                       AS LLP_LE_ID1 ,
    PF.LLP_LSP_ID                      AS LLP_LSP_ID1 ,
    PF.LLP_NEXT_ANNL_RVW_DATE          AS LLP_NEXT_ANNL_RVW_DATE1 ,
    PF.LLP_NEXT_INTRM_RVW_DATE         AS LLP_NEXT_INTRM_RVW_DATE1 ,
    PF.LLP_CRDT_PLCY_COMPLNCE_IND      AS LLP_CRDT_PLCY_COMPLNCE_IND1 ,
    PF.LLP_UNWRT_STD_CMPLNCE_IND       AS LLP_UNWRT_STD_CMPLNCE_IND1 ,
    PF.LLP_EXTD_NEXT_RVW_DATE          AS LLP_EXTD_NEXT_RVW_DATE1 ,
    PF.LLP_PRJTD_ECON_PROFIT           AS LLP_PRJTD_ECON_PROFIT1 ,
    PF.LLP_EXPECT_LOSS_AMT             AS LLP_EXPECT_LOSS_AMT1 ,
    PF.LLP_PROD_PRG_COMPLNCE_IND       AS LLP_PROD_PRG_COMPLNCE_IND1 ,
    PF.LLP_CNTRY_RISK_APPR_REQ_IND     AS LLP_CNTRY_RISK_APPR_REQ_IND1 ,
    PF.LLP_BKG_LOCTN_ID                AS LLP_BKG_LOCTN_ID1 ,
    PF.CREATE_USER_ID                  AS CREATE_USER_ID1 ,
    PF.LAST_UPDATE_USER_ID             AS LAST_UPDATE_USER_ID1 ,
    PF.VERIFY_USER_ID                  AS VERIFY_USER_ID1 ,
    PF.CREATE_DATE                     AS CREATE_DATE1 ,
    PF.LAST_UPDATE_DATE                AS LAST_UPDATE_DATE1 ,
    PF.VERIFY_DATE                     AS VERIFY_DATE1 ,
    PF.UPDATE_COUNT                    AS UPDATE_COUNT1 ,
    PF.UPDATE_STATUS_IND               AS UPDATE_STATUS_IND1 ,
    PF.CHANGE_IND                      AS CHANGE_IND1 ,
    PF.LLP_2ND_APPR_EMP_ID             AS LLP_2ND_APPR_EMP_ID1 ,
    PF.LLP_1ST_APPR_EMP_ID             AS LLP_1ST_APPR_EMP_ID1 ,
    PF.LLP_BCA_REF_NUM                 AS LLP_BCA_REF_NUM1 ,
    PF.LOS_BCA_REF_NUM                 AS LOS_BCA_REF_NUM1 ,
    PF.LLP_BCA_REF_APPR_DATE           AS LLP_BCA_REF_APPR_DATE1 ,
    PF.CMS_REQ_SEC_COVERAGE            AS CMS_REQ_SEC_COVERAGE1 ,
    PF.CMS_ACT_SEC_COVERAGE            AS CMS_ACT_SEC_COVERAGE1 ,
    PF.CMS_APPR_OFFICER_GRADE          AS CMS_APPR_OFFICER_GRADE1 ,
    PF.CMS_VERSION_TIME                AS CMS_VERSION_TIME1 ,
    PF.CMS_CUSTOMER_ID                 AS CMS_CUSTOMER_ID1 ,
    PF.CMS_BCA_STATUS                  AS CMS_BCA_STATUS1 ,
    PF.CMS_BCA_CREATE_DATE             AS CMS_BCA_CREATE_DATE1 ,
    PF.CMS_TAT_CREATE_DATE             AS CMS_TAT_CREATE_DATE1 ,
    PF.CMS_BFL_REQUIRED_IND            AS CMS_BFL_REQUIRED_IND1 ,
    PF.CMS_ORIG_COUNTRY                AS CMS_ORIG_COUNTRY1 ,
    PF.CMS_ORIG_ORGANISATION           AS CMS_ORIG_ORGANISATION1 ,
    PF.CMS_BCA_RENEWAL_IND             AS CMS_BCA_RENEWAL_IND1 ,
    PF.CMS_FULL_DOC_REVIEW_IND         AS CMS_FULL_DOC_REVIEW_IND1 ,
    PF.CMS_BCA_COMPLETE_IND            AS CMS_BCA_COMPLETE_IND1 ,
    PF.CMS_CCC_COMPLETE_IND            AS CMS_CCC_COMPLETE_IND1 ,
    PF.CMS_SCC_COMPLETE_IND            AS CMS_SCC_COMPLETE_IND1 ,
    PF.LLP_1ST_APPR_EMP_NAME           AS LLP_1ST_APPR_EMP_NAME1 ,
    PF.LLP_2ND_APPR_EMP_NAME           AS LLP_2ND_APPR_EMP_NAME1 ,
    PF.CMS_BCA_LOCAL_IND               AS CMS_BCA_LOCAL_IND1 ,
    PF.CMS_BFL_IND_UPDATE_DATE         AS CMS_BFL_IND_UPDATE_DATE1 ,
    PF.CMS_EXTENDED_BFL_DATE           AS CMS_EXTENDED_BFL_DATE1 ,
    PF.CMS_CB_ACT_SEC_COVERAGE         AS CMS_CB_ACT_SEC_COVERAGE1 ,
    PF.IS_MIGRATED_IND                 AS IS_MIGRATED_IND1 ,
    PF.LLP_SEGMENT_CODE_NUM            AS LLP_SEGMENT_CODE_NUM1 ,
    PF.LLP_SEGMENT_CODE_VALUE          AS LLP_SEGMENT_CODE_VALUE1 ,
    PF.ISLAMIC_FLAG                    AS ISLAMIC_FLAG1 ,
    PF.SOURCE_ID                       AS SOURCE_ID1 ,
    PF.LSP_LMT_PROFILE_SRC_ID_OLD      AS LSP_LMT_PROFILE_SRC_ID_OLD1 ,
    PF.CMS_BCA_JOINT_IND               AS CMS_BCA_JOINT_IND1 ,
    PF.LMT_PROFILE_TYPE                AS LMT_PROFILE_TYPE1 ,
    PF.APPLICATION_TYPE                AS APPLICATION_TYPE1 ,
    PF.APPLICATION_LAW_TYPE            AS APPLICATION_LAW_TYPE1 ,
    PF.CMS_CREATE_IND                  AS CMS_CREATE_IND1 ,
    PF.CIF_SOURCE_ID                   AS CIF_SOURCE_ID1 ,
    PF.LI_GENERATION_DATE              AS LI_GENERATION_DATE1 ,
    PF.CAM_TYPE                        AS CAM_TYPE1 ,
    PF.CAM_LOGIN_DATE                  AS CAM_LOGIN_DATE1 ,
    PF.NO_OF_TIMES_EXTENDED            AS NO_OF_TIMES_EXTENDED1 ,
    PF.TOTAL_SACTIONED_AMOUNT          AS TOTAL_SACTIONED_AMOUNT1 ,
    PF.RELATIONSHIP_MANAGER            AS RELATIONSHIP_MANAGER1 ,
    PF.CONTROLLING_BRANCH              AS CONTROLLING_BRANCH1 ,
    PF.COMMITTE_APPROVAL               AS COMMITTE_APPROVAL1 ,
    PF.ASSET_CLASSIFICATION            AS ASSET_CLASSIFICATION1 ,
    PF.RBI_ASSET_CLASSIFICATION        AS RBI_ASSET_CLASSIFICATION1 ,
    PF.BOARD_APPROVAL                  AS BOARD_APPROVAL1 ,
    PF.LLP_3RD_APPR_EMP_NAME           AS LLP_3RD_APPR_EMP_NAME1 ,
    PF.LLP_4TH_APPR_EMP_NAME           AS LLP_4TH_APPR_EMP_NAME1 ,
    PF.LLP_5TH_APPR_EMP_NAME           AS LLP_5TH_APPR_EMP_NAME1 ,
    replace(PF.DOC_REMARKS,'
    ','')                                 AS DOC_REMARKS1 ,
    PF.FULLY_CASH_COLLATERAL           AS FULLY_CASH_COLLATERAL1 ,
    PF.TOTAL_SANCTIONED_FAC_AMT        AS TOTAL_SANCTIONED_FAC_AMT1 ,
    PF.RATING_TYPE                     AS RATING_TYPE1 ,
    PF.RATING_YEAR                     AS RATING_YEAR1 ,
    SCI.CMS_LSP_APPR_LMTS_ID           AS CMS_LSP_APPR_LMTS_ID2 ,
    SCI.CMS_LIMIT_PROFILE_ID           AS CMS_LIMIT_PROFILE_ID2 ,
    SCI.LMT_ID                         AS LMT_ID2 ,
    SCI.LOS_LMT_ID                     AS LOS_LMT_ID2 ,
    SCI.ACF_NO                         AS ACF_NO2 ,
    SCI.LMT_BKG_LOCTN_ID               AS LMT_BKG_LOCTN_ID2 ,
    SCI.LMT_PRD_TYPE_NUM               AS LMT_PRD_TYPE_NUM2 ,
    SCI.LMT_PRD_TYPE_VALUE             AS LMT_PRD_TYPE_VALUE2 ,
    SCI.LMT_TYPE_NUM                   AS LMT_TYPE_NUM2 ,
    SCI.LMT_TYPE_VALUE                 AS LMT_TYPE_VALUE2 ,
    SCI.LMT_AMT                        AS LMT_AMT2 ,
    SCI.LMT_SEC_TYPE_NUM               AS LMT_SEC_TYPE_NUM2 ,
    SCI.LMT_SEC_TYPE_VALUE             AS LMT_SEC_TYPE_VALUE2 ,
    SCI.LMT_CRRNCY_ISO_CODE            AS LMT_CRRNCY_ISO_CODE2 ,
    SCI.LMT_OUTER_LMT_ID               AS LMT_OUTER_LMT_ID2 ,
    SCI.LMT_EXPRY_DATE                 AS LMT_EXPRY_DATE2 ,
    SCI.LMT_INTRST_BASE_NUM            AS LMT_INTRST_BASE_NUM2 ,
    SCI.LMT_TENOR                      AS LMT_TENOR2 ,
    SCI.LMT_INTRST_BASE_VALUE          AS LMT_INTRST_BASE_VALUE2 ,
    SCI.LMT_INTRST_MARGIN              AS LMT_INTRST_MARGIN2 ,
    SCI.INTEREST_RATE                  AS INTEREST_RATE2 ,
    SCI.LMT_CMMSN                      AS LMT_CMMSN2 ,
    SCI.LMT_FEE                        AS LMT_FEE2 ,
    SCI.LMT_CONDTN_TEXT                AS LMT_CONDTN_TEXT2 ,
    SCI.LMT_ADVISE_IND                 AS LMT_ADVISE_IND2 ,
    SCI.LMT_CMMTD_IND                  AS LMT_CMMTD_IND2 ,
    SCI.LMT_SHARE_IND                  AS LMT_SHARE_IND2 ,
    SCI.CREATE_USER_ID                 AS CREATE_USER_ID2 ,
    SCI.LAST_UPDATE_USER_ID            AS LAST_UPDATE_USER_ID2 ,
    SCI.VERIFY_USER_ID                 AS VERIFY_USER_ID2 ,
    SCI.CREATE_DATE                    AS CREATE_DATE2 ,
    SCI.LAST_UPDATE_DATE               AS LAST_UPDATE_DATE2 ,
    SCI.VERIFY_DATE                    AS VERIFY_DATE2 ,
    SCI.UPDATE_COUNT                   AS UPDATE_COUNT2 ,
    SCI.UPDATE_STATUS_IND              AS UPDATE_STATUS_IND2 ,
    SCI.CHANGE_IND                     AS CHANGE_IND2 ,
    SCI.LMT_TENOR_BASIS_NUM            AS LMT_TENOR_BASIS_NUM2 ,
    SCI.LMT_LLP_ID                     AS LMT_LLP_ID2 ,
    SCI.LMT_TENOR_BASIS_VALUE          AS LMT_TENOR_BASIS_VALUE2 ,
    SCI.LMT_LE_ID                      AS LMT_LE_ID2 ,
    SCI.LMT_LSP_ID                     AS LMT_LSP_ID2 ,
    SCI.CMS_ACT_SEC_COVERAGE           AS CMS_ACT_SEC_COVERAGE2 ,
    SCI.CMS_REQ_SEC_COVERAGE           AS CMS_REQ_SEC_COVERAGE2 ,
    SCI.CMS_VERSION_TIME               AS CMS_VERSION_TIME2 ,
    SCI.CMS_LIMIT_STATUS               AS CMS_LIMIT_STATUS2 ,
    SCI.CMS_ACTIVATED_LIMIT            AS CMS_ACTIVATED_LIMIT2 ,
    SCI.CMS_BKG_COUNTRY                AS CMS_BKG_COUNTRY2 ,
    SCI.CMS_BKG_ORGANISATION           AS CMS_BKG_ORGANISATION2 ,
    SCI.CMS_IS_LIMIT_EXISTING_IND      AS CMS_IS_LIMIT_EXISTING_IND2 ,
    SCI.CMS_ACTIVATED_LIMIT_IND        AS CMS_ACTIVATED_LIMIT_IND2 ,
    SCI.CMS_OUTER_LMT_REF              AS CMS_OUTER_LMT_REF2 ,
    SCI.CMDT_OP_LMT                    AS CMDT_OP_LMT2 ,
    SCI.CMS_OUTER_LMT_PROF_ID          AS CMS_OUTER_LMT_PROF_ID2 ,
    SCI.CMS_REF_ID                     AS CMS_REF_ID2 ,
    SCI.GROUP_ID                       AS GROUP_ID2 ,
    SCI.ZERO_REASON                    AS ZERO_REASON2 ,
    SCI.ZERO_DATE                      AS ZERO_DATE2 ,
    SCI.ZERO_IND                       AS ZERO_IND2 ,
    SCI.CMS_CR125_DERIVE_ACTVD_LMT_AMT AS CMS_CR125_DER_ACTVD_LMT_AMT2 ,
    SCI.LMT_PRD_GRP_NUM                AS LMT_PRD_GRP_NUM2 ,
    SCI.LMT_PRD_GRP_VALUE              AS LMT_PRD_GRP_VALUE2 ,
    SCI.CMS_DRAWING_LIMIT              AS CMS_DRAWING_LIMIT2 ,
    SCI.CMS_OUTSTANDING_AMT            AS CMS_OUTSTANDING_AMT2 ,
    SCI.LMT_DESC                       AS LMT_DESC2 ,
    SCI.LMT_FAC_TYPE_NUM               AS LMT_FAC_TYPE_NUM2 ,
    SCI.LMT_FAC_TYPE_VALUE             AS LMT_FAC_TYPE_VALUE2 ,
    SCI.SOURCE_ID                      AS SOURCE_ID2 ,
    SCI.LMT_BCA_REF_NUM                AS LMT_BCA_REF_NUM2 ,
    SCI.LOS_BCA_REF_NUM                AS LOS_BCA_REF_NUM2 ,
    SCI.LMT_ID_OLD                     AS LMT_ID_OLD2 ,
    SCI.LMT_OMNIBUS_IND                AS LMT_OMNIBUS_IND2 ,
    SCI.LMT_FAC_CODE                   AS LMT_FAC_CODE2 ,
    SCI.LMT_FAC_SEQ                    AS LMT_FAC_SEQ2 ,
    SCI.ACCOUNT_TYPE                   AS ACCOUNT_TYPE2 ,
    SCI.AVAILABLE_LMT                  AS AVAILABLE_LMT2 ,
    SCI.LOAN_TYPE                      AS LOAN_TYPE2 ,
    SCI.CMS_ACTUAL_SEC_COVERAGE_AMT    AS CMS_ACTUAL_SEC_COVERAGE_AMT2 ,
    SCI.CMS_OMV_SEC_COVERAGE_AMT       AS CMS_OMV_SEC_COVERAGE_AMT2 ,
    SCI.CMS_FSV_SEC_COVERAGE_AMT       AS CMS_FSV_SEC_COVERAGE_AMT2 ,
    SCI.INNER_LIMIT_ORDERING           AS INNER_LIMIT_ORDERING2 ,
    SCI.OMNIBUS_ENVELOPE_ID            AS OMNIBUS_ENVELOPE_ID2 ,
    SCI.OMNIBUS_ENVELOPE_NAME          AS OMNIBUS_ENVELOPE_NAME2 ,
    SCI.DISBURSED_IND                  AS DISBURSED_IND2 ,
    SCI.LMT_LOAN_SECTOR_NUM            AS LMT_LOAN_SECTOR_NUM2 ,
    SCI.LMT_LOAN_SECTOR_VALUE          AS LMT_LOAN_SECTOR_VALUE2 ,
    SCI.FACILITY_TYPE                  AS FACILITY_TYPE2 ,
    SCI.RELEASABLE_AMOUNT              AS RELEASABLE_AMOUNT2 ,
    SCI.FACILITY_NAME                  AS FACILITY_NAME2 ,
    SCI.FACILITY_SYSTEM                AS FACILITY_SYSTEM2 ,
    SCI.FACILITY_SYSTEM_ID             AS FACILITY_SYSTEM_ID2 ,
    SCI.LINE_NO                        AS LINE_NO2 ,
    SCI.PURPOSE                        AS PURPOSE2 ,
    SCI.IS_DP                          AS IS_DP2 ,
    SCI.RELATIONSHIP_MANAGER           AS RELATIONSHIP_MANAGER2 ,
    SCI.IS_RELEASED                    AS IS_RELEASED2 ,
    SCI.GRADE                          AS GRADE2 ,
    SCI.IS_SECURED                     AS IS_SECURED2 ,
    SCI.IS_ADHOC                       AS IS_ADHOC2 ,
    SCI.FACILITY_CAT                   AS FACILITY_CAT2 ,
    SCI.GUARANTEE                      AS GUARANTEE2 ,
    SCI.SUB_PARTY_NAME                 AS SUB_PARTY_NAME2 ,
    SCI.SUB_FACILITY_NAME              AS SUB_FACILITY_NAME2 ,
    SCI.LIABILITY_ID                   AS LIABILITY_ID2 ,
    SCI.ADHOC_LMT_AMOUNT               AS ADHOC_LMT_AMOUNT2 ,
    SCI.IS_ADHOC_TOSUM                 AS IS_ADHOC_TOSUM2 ,
    SCI.TOTAL_RELEASED_AMOUNT          AS TOTAL_RELEASED_AMOUNT2 ,
    SCI.OTHER_PURPOSE                  AS OTHER_PURPOSE2 ,
    XREF.CMS_LSP_SYS_XREF_ID           AS CMS_LSP_SYS_XREF_ID3 ,
    XREF.LSX_ID                        AS LSX_ID3 ,
    XREF.LSX_LE_ID                     AS LSX_LE_ID3 ,
    XREF.LSX_BKG_LOCTN_ID              AS LSX_BKG_LOCTN_ID3 ,
    XREF.LSX_LSP_ID                    AS LSX_LSP_ID3 ,
    XREF.LSX_EXT_SYS_CODE_NUM          AS LSX_EXT_SYS_CODE_NUM3 ,
    XREF.LSX_EXT_SYS_CODE_VALUE        AS LSX_EXT_SYS_CODE_VALUE3 ,
    XREF.LSX_EXT_SYS_CUST_ID           AS LSX_EXT_SYS_CUST_ID3 ,
    XREF.LSX_EXT_SYS_CUST_NAME         AS LSX_EXT_SYS_CUST_NAME3 ,
    XREF.LSX_EXT_SYS_ACCT_NUM          AS LSX_EXT_SYS_ACCT_NUM3 ,
    XREF.LSX_ACCT_STATUS_TEXT          AS LSX_ACCT_STATUS_TEXT3 ,
    XREF.CREATE_USER_ID                AS CREATE_USER_ID3 ,
    XREF.LAST_UPDATE_USER_ID           AS LAST_UPDATE_USER_ID3 ,
    XREF.VERIFY_USER_ID                AS VERIFY_USER_ID3 ,
    XREF.CREATE_DATE                   AS CREATE_DATE3 ,
    XREF.LAST_UPDATE_DATE              AS LAST_UPDATE_DATE3 ,
    XREF.VERIFY_DATE                   AS VERIFY_DATE3 ,
    XREF.UPDATE_COUNT                  AS UPDATE_COUNT3 ,
    XREF.UPDATE_STATUS_IND             AS UPDATE_STATUS_IND3 ,
    XREF.CHANGE_IND                    AS CHANGE_IND3 ,
    XREF.CMS_LE_SUB_PROFILE_ID         AS CMS_LE_SUB_PROFILE_ID3 ,
    XREF.ACCOUNT_DESC_NUM              AS ACCOUNT_DESC_NUM3 ,
    XREF.ACCOUNT_DESC_VALUE            AS ACCOUNT_DESC_VALUE3 ,
    XREF.LSX_EXT_SYS_ACCT_SEQ          AS LSX_EXT_SYS_ACCT_SEQ3 ,
    XREF.LSX_FAC_CODE                  AS LSX_FAC_CODE3 ,
    XREF.LSX_FAC_SEQ                   AS LSX_FAC_SEQ3 ,
    XREF.LSX_EXT_CTY_CODE_VALUE        AS LSX_EXT_CTY_CODE_VALUE3 ,
    XREF.ACCT_DELQ_IND                 AS ACCT_DELQ_IND3 ,
    XREF.ACCT_EFFECTIVE_DATE           AS ACCT_EFFECTIVE_DATE3 ,
    XREF.ACCT_STATUS                   AS ACCT_STATUS3 ,
    XREF.LSX_BCA_REF_NUM               AS LSX_BCA_REF_NUM3 ,
    XREF.LSX_LMT_ID                    AS LSX_LMT_ID3 ,
    XREF.LSX_BKG_LOCTN_CTRY            AS LSX_BKG_LOCTN_CTRY3 ,
    XREF.LSX_BKG_LOCTN_ORG             AS LSX_BKG_LOCTN_ORG3 ,
    XREF.LSX_EXT_SYS_ACCT_TYPE         AS LSX_EXT_SYS_ACCT_TYPE3 ,
    XREF.ACCT_RV                       AS ACCT_RV3 ,
    XREF.ACCT_RV_CCY                   AS ACCT_RV_CCY3 ,
    XREF.FIRST_DISBURSEMENT_DATE       AS FIRST_DISBURSEMENT_DATE3 ,
    XREF.FINAL_DISBURSEMENT_DATE       AS FINAL_DISBURSEMENT_DATE3 ,
    XREF.CMS_SEC_COVERAGE_AMT          AS CMS_SEC_COVERAGE_AMT3 ,
    XREF.CMS_OUTSTANDING_AMT           AS CMS_OUTSTANDING_AMT3 ,
    XREF.LAST_ALLOCATION_DATE          AS LAST_ALLOCATION_DATE3 ,
    XREF.OUTSTANDING_AMT_CCY           AS OUTSTANDING_AMT_CCY3 ,
    XREF.SEC_COVERAGE_AMT_CCY          AS SEC_COVERAGE_AMT_CCY3 ,
    XREF.SERIAL_NO                     AS SERIAL_NO3 ,
    XREF.INTEREST_RATE_TYPE            AS INTEREST_RATE_TYPE3 ,
    XREF.INT_RATE_FLOATING_TYPE        AS INT_RATE_FLOATING_TYPE3 ,
    XREF.INT_RATE_FLOATING_RANGE       AS INT_RATE_FLOATING_RANGE3 ,
    XREF.INT_RATE_FLOATING_MARGIN_FLAG AS INT_RATE_FLOATING_MARGIN_FLAG3 ,
    XREF.INT_RATE_FLOATING_MARGIN      AS INT_RATE_FLOATING_MARGIN3 ,
    XREF.RELEASED_AMOUNT               AS RELEASED_AMOUNT3 ,
    XREF.UTILIZED_AMOUNT               AS UTILIZED_AMOUNT3 ,
    XREF.RELEASE_DATE                  AS RELEASE_DATE3 ,
    XREF.DATE_OF_RESET                 AS DATE_OF_RESET3 ,
    XREF.IS_PERMNT_SSI_CERT            AS IS_PERMNT_SSI_CERT3 ,
    XREF.IS_CAPITAL_MARKET_EXPOSER     AS IS_CAPITAL_MARKET_EXPOSER3 ,
    XREF.IS_REALESTATE_EXPOSER         AS IS_REALESTATE_EXPOSER3 ,
    XREF.ESTATE_TYPE                   AS ESTATE_TYPE3 ,
    XREF.IS_PRIORITY_SECTOR            AS IS_PRIORITY_SECTOR3 ,
    XREF.PRIORITY_SECTOR               AS PRIORITY_SECTOR3 ,
    XREF.SECURITY1                     AS SECURITY13 ,
    XREF.SECURITY2                     AS SECURITY23 ,
    XREF.SECURITY3                     AS SECURITY33 ,
    XREF.FACILITY_SYSTEM_ID            AS FACILITY_SYSTEM_ID3 ,
    XREF.LINE_NO                       AS LINE_NO3 ,
    XREF.FACILITY_SYSTEM               AS FACILITY_SYSTEM3 ,
    XREF.INT_RATE_FIX                  AS INT_RATE_FIX3 ,
    XREF.COMM_REAL_ESTATE_TYPE         AS COMM_REAL_ESTATE_TYPE3 ,
    XREF.SECURITY4                     AS SECURITY43 ,
    XREF.SECURITY5                     AS SECURITY53 ,
    XREF.SECURITY6                     AS SECURITY63 ,
    XREF.UPLOAD_STATUS                 AS UPLOAD_STATUS3 ,
    XREF.UP_FOREIGN_CUR_CODE           AS UP_FOREIGN_CUR_CODE3 ,
    XREF.UP_FOREIGN_LMT_AMT            AS UP_FOREIGN_LMT_AMT3 ,
    XREF.UP_FOREIGN_UTL_AMT            AS UP_FOREIGN_UTL_AMT3 ,
    bk.CMS_LE_BANKING_METHOD_ID        AS CMS_LE_BANKING_METHOD_ID4 ,
    bk.CMS_LE_MAIN_PROFILE_ID          AS CMS_LE_MAIN_PROFILE_ID4 ,
    bk.CMS_LE_NODAL                    AS CMS_LE_NODAL4 ,
    bk.CMS_LE_LEAD                     AS CMS_LE_LEAD4 ,
    bk.CMS_LE_BANK_ID                  AS CMS_LE_BANK_ID4 ,
    bk.CMS_LE_BANK_TYPE                AS CMS_LE_BANK_TYPE4 ,
    cri.SCI_LE_CRI_ID                  AS SCI_LE_CRI_ID5 ,
    cri.CMS_LE_MAIN_PROFILE_ID         AS CMS_LE_MAIN_PROFILE_ID5 ,
    cri.CUSTOMER_RAM_ID                AS CUSTOMER_RAM_ID5 ,
    cri.CUSTOMER_APR_CODE              AS CUSTOMER_APR_CODE5 ,
    cri.CUSTOMER_EXT_RATING            AS CUSTOMER_EXT_RATING5 ,
    cri.IS_NBFS                        AS IS_NBFS5 ,
    cri.NBFS_A                         AS NBFS_A5 ,
    cri.NBFS_B                         AS NBFS_B5 ,
    cri.IS_PRIORITY_SECTOR             AS IS_PRIORITY_SECTOR5 ,
    cri.MSME_CLASSIFICATION            AS MSME_CLASSIFICATION5 ,
    cri.IS_PERMENENT_SSI_CERT          AS IS_PERMENENT_SSI_CERT5 ,
    cri.IS_WEAKER_SECTION              AS IS_WEAKER_SECTION5 ,
    cri.WEAKER_SECTION                 AS WEAKER_SECTION5 ,
    cri.IS_KISAN_CREDIT_CARD           AS IS_KISAN_CREDIT_CARD5 ,
    cri.IS_MINORITY_COMMUNITY          AS IS_MINORITY_COMMUNITY5 ,
    cri.MINORITY_COMMUNITY             AS MINORITY_COMMUNITY5 ,
    cri.IS_CAPITAL_MARKET_EXPOS        AS IS_CAPITAL_MARKET_EXPOS5 ,
    cri.IS_REAL_ESTATE_EXPOS           AS IS_REAL_ESTATE_EXPOS5 ,
    cri.REAL_ESTATE_EXPOS_TYPE         AS REAL_ESTATE_EXPOS_TYPE5 ,
    cri.REAL_ESTATE_EXPOS_COMM         AS REAL_ESTATE_EXPOS_COMM5 ,
    cri.IS_COMMODITIES_EXPOSER         AS IS_COMMODITIES_EXPOSER5 ,
    cri.IS_SENSITIVE                   AS IS_SENSITIVE5 ,
    cri.COMMODITIES_NAME               AS COMMODITIES_NAME5 ,
    cri.GROSS_INVS_IN_PM               AS GROSS_INVS_IN_PM5 ,
    cri.GROSS_INVS_IN_EQUIP            AS GROSS_INVS_IN_EQUIP5 ,
    cri.PSU                            AS PSU5 ,
    cri.PSU_PERCENTAGE                 AS PSU_PERCENTAGE5 ,
    cri.GOVT_UNDER_TAKING              AS GOVT_UNDER_TAKING5 ,
    cri.IS_PROJECT_FINANCE             AS IS_PROJECT_FINANCE5 ,
    cri.IS_INFRASTRUCTURE_FINANACE     AS IS_INFRASTRUCTURE_FINANACE5 ,
    cri.INFRASTRUCTURE_FINANACE_TYPE   AS INFRASTRUCTURE_FINANACE_TYPE5 ,
    cri.IS_SEMS_GUIDE_APPLICABLE       AS IS_SEMS_GUIDE_APPLICABLE5 ,
    cri.IS_FAIL_IFC_EXCLU_LIST         AS IS_FAIL_IFC_EXCLU_LIST5 ,
    cri.IS_TUFS                        AS IS_TUFS5 ,
    cri.IS_RBI_DEFAULTER               AS IS_RBI_DEFAULTER5 ,
    cri.RBI_DEFAULTER                  AS RBI_DEFAULTER5 ,
    cri.IS_LITIGATION                  AS IS_LITIGATION5 ,
    cri.LITIGATION_BY                  AS LITIGATION_BY5 ,
    cri.IS_INTEREST_OF_BANK            AS IS_INTEREST_OF_BANK5 ,
    cri.INTEREST_OF_BANK               AS INTEREST_OF_BANK5 ,
    cri.IS_ADVERSE_REMARK              AS IS_ADVERSE_REMARK5 ,
    cri.ADVERSE_REMARK                 AS ADVERSE_REMARK5 ,
    cri.AUDIT_TYPE                     AS AUDIT_TYPE5 ,
    cri.AVG_ANNUAL_TURNOVER            AS AVG_ANNUAL_TURNOVER5 ,
    cri.INDUSTRY_EXPOSER               AS INDUSTRY_EXPOSER5 ,
    cri.IS_DIREC_OTHER_BANK            AS IS_DIREC_OTHER_BANK5 ,
    cri.DIREC_OTHER_BANK               AS DIREC_OTHER_BANK5 ,
    cri.IS_PARTNER_OTHER_BANK          AS IS_PARTNER_OTHER_BANK5 ,
    cri.PARTNER_OTHER_BANK             AS PARTNER_OTHER_BANK5 ,
    cri.IS_SUBSTANTIAL_OTHER_BANK      AS IS_SUBSTANTIAL_OTHER_BANK5 ,
    cri.SUBSTANTIAL_OTHER_BANK         AS SUBSTANTIAL_OTHER_BANK5 ,
    cri.IS_HDFC_DIREC_RLTV             AS IS_HDFC_DIREC_RLTV5 ,
    cri.HDFC_DIREC_RLTV                AS HDFC_DIREC_RLTV5 ,
    cri.IS_OBK_DIREC_RLTV              AS IS_OBK_DIREC_RLTV5 ,
    cri.OBK_DIREC_RLTV                 AS OBK_DIREC_RLTV5 ,
    cri.IS_PARTNER_DIREC_RLTV          AS IS_PARTNER_DIREC_RLTV5 ,
    cri.PARTNER_DIREC_RLTV             AS PARTNER_DIREC_RLTV5 ,
    cri.IS_SUBSTANTIAL_RLTV_HDFC_OTHER AS IS_SUBSTTIAL_RLTV_HDFC_OTHER5 ,
    cri.SUBSTANTIAL_RLTV_HDFC_OTHER    AS SUBSTANTIAL_RLTV_HDFC_OTHER5 ,
    cri.DIREC_HDFC_OTHER               AS DIREC_HDFC_OTHER5 ,
    cri.IS_BACKED_BY_GOVT              AS IS_BACKED_BY_GOVT5 ,
    cri.GOVT_SCHEME_TYPE               AS GOVT_SCHEME_TYPE5 ,
    cri.FIRST_YEAR                     AS FIRST_YEAR5 ,
    cri.SECOND_YEAR                    AS SECOND_YEAR5 ,
    cri.THIRD_YEAR                     AS THIRD_YEAR5 ,
    cri.SECOND_YEAR_TURNOVER           AS SECOND_YEAR_TURNOVER5 ,
    cri.FIRST_YEAR_TURNOVER            AS FIRST_YEAR_TURNOVER5 ,
    cri.THIRD_YEAR_TURNOVER            AS THIRD_YEAR_TURNOVER5 ,
    cri.FIRST_YEAR_TURNOVER_CURRENCY   AS FIRST_YEAR_TURNOVER_CURRENCY5 ,
    cri.SECOND_YEAR_TURNOVER_CURRENCY  AS SECOND_YEAR_TURNOVER_CURRENCY5 ,
    cri.THIRD_YEAR_TURNOVER_CURRENCY   AS THIRD_YEAR_TURNOVER_CURRENCY5 ,
    dr.CMS_LE_DIRECTOR_ID              AS CMS_LE_DIRECTOR_ID6 ,
    dr.CMS_LE_MAIN_PROFILE_ID          AS CMS_LE_MAIN_PROFILE_ID6 ,
    dr.RELATED_TYPE                    AS RELATED_TYPE6 ,
    dr.RELATIONSHIP_TYPE               AS RELATIONSHIP_TYPE6 ,
    dr.DIR_EMAIL                       AS DIR_EMAIL6 ,
    dr.DIR_FAX                         AS DIR_FAX6 ,
    dr.DIR_TEL_NO                      AS DIR_TEL_NO6 ,
    dr.DIR_COUNTRY                     AS DIR_COUNTRY6 ,
    dr.DIR_STATE                       AS DIR_STATE6 ,
    dr.DIR_CITY                        AS DIR_CITY6 ,
    dr.DIR_REGION                      AS DIR_REGION6 ,
    dr.DIR_POST_CODE                   AS DIR_POST_CODE6 ,
    dr.DIR_ADD3                        AS DIR_ADD36 ,
    dr.DIR_ADD2                        AS DIR_ADD26 ,
    dr.DIR_ADD1                        AS DIR_ADD16 ,
    dr.PERCENT_OF_CTRL                 AS PERCENT_OF_CTRL6 ,
    dr.FULL_NAME                       AS FULL_NAME6 ,
    dr.NAME_PREFIX                     AS NAME_PREFIX6 ,
    dr.BUSSNESS_NAME                   AS BUSSNESS_NAME6 ,
    dr.DIR_PAN                         AS DIR_PAN6 ,
    dr.RELATED_DUNS_NO                 AS RELATED_DUNS_NO6 ,
    dr.DIN_NO                          AS DIN_NO6 ,
    dr.DIR_NAME                        AS DIR_NAME6 ,
    dr.DIR_STD_CODE_TELEX              AS DIR_STD_CODE_TELEX6 ,
    dr.DIR_STD_CODE_TEL                AS DIR_STD_CODE_TEL6 ,
    udf.CMS_LE_MAIN_PROFILE_ID         AS CMS_LE_MAIN_PROFILE_ID7 ,
    udf.UDF1                           AS UDF17 ,
    udf.UDF2                           AS UDF27 ,
    udf.UDF3                           AS UDF37 ,
    udf.UDF4                           AS UDF47 ,
    udf.UDF5                           AS UDF57 ,
    udf.UDF6                           AS UDF67 ,
    udf.UDF7                           AS UDF77 ,
    udf.UDF8                           AS UDF87 ,
    udf.UDF9                           AS UDF97 ,
    udf.UDF10                          AS UDF107 ,
    udf.UDF11                          AS UDF117 ,
    udf.UDF12                          AS UDF127 ,
    udf.UDF13                          AS UDF137 ,
    udf.UDF14                          AS UDF147 ,
    udf.UDF15                          AS UDF157 ,
    udf.UDF16                          AS UDF167 ,
    udf.UDF17                          AS UDF177 ,
    udf.UDF18                          AS UDF187 ,
    udf.UDF19                          AS UDF197 ,
    udf.UDF20                          AS UDF207 ,
    udf.UDF21                          AS UDF217 ,
    udf.UDF22                          AS UDF227 ,
    udf.UDF23                          AS UDF237 ,
    udf.UDF24                          AS UDF247 ,
    udf.UDF25                          AS UDF257 ,
    udf.UDF26                          AS UDF267 ,
    udf.UDF27                          AS UDF277 ,
    udf.UDF28                          AS UDF287 ,
    udf.UDF29                          AS UDF297 ,
    udf.UDF30                          AS UDF307 ,
    udf.UDF31                          AS UDF317 ,
    udf.UDF32                          AS UDF327 ,
    udf.UDF33                          AS UDF337 ,
    udf.UDF34                          AS UDF347 ,
    udf.UDF35                          AS UDF357 ,
    udf.UDF36                          AS UDF367 ,
    udf.UDF37                          AS UDF377 ,
    udf.UDF38                          AS UDF387 ,
    udf.UDF39                          AS UDF397 ,
    udf.UDF40                          AS UDF407 ,
    udf.UDF41                          AS UDF417 ,
    udf.UDF42                          AS UDF427 ,
    udf.UDF43                          AS UDF437 ,
    udf.UDF44                          AS UDF447 ,
    udf.UDF45                          AS UDF457 ,
    udf.UDF46                          AS UDF467 ,
    udf.UDF47                          AS UDF477 ,
    udf.UDF48                          AS UDF487 ,
    udf.UDF49                          AS UDF497 ,
    udf.UDF50                          AS UDF507 ,
    udf.UDF51                          AS UDF517 ,
    udf.UDF52                          AS UDF527 ,
    udf.UDF53                          AS UDF537 ,
    udf.UDF54                          AS UDF547 ,
    udf.UDF55                          AS UDF557 ,
    udf.UDF56                          AS UDF567 ,
    udf.UDF57                          AS UDF577 ,
    udf.UDF58                          AS UDF587 ,
    udf.UDF59                          AS UDF597 ,
    udf.UDF60                          AS UDF607 ,
    udf.UDF61                          AS UDF617 ,
    udf.UDF62                          AS UDF627 ,
    udf.UDF63                          AS UDF637 ,
    udf.UDF64                          AS UDF647 ,
    udf.UDF65                          AS UDF657 ,
    udf.UDF66                          AS UDF667 ,
    udf.UDF67                          AS UDF677 ,
    udf.UDF68                          AS UDF687 ,
    udf.UDF69                          AS UDF697 ,
    udf.UDF70                          AS UDF707 ,
    udf.UDF71                          AS UDF717 ,
    udf.UDF72                          AS UDF727 ,
    udf.UDF73                          AS UDF737 ,
    udf.UDF74                          AS UDF747 ,
    udf.UDF75                          AS UDF757 ,
    udf.UDF76                          AS UDF767 ,
    udf.UDF77                          AS UDF777 ,
    udf.UDF78                          AS UDF787 ,
    udf.UDF79                          AS UDF797 ,
    udf.UDF80                          AS UDF807 ,
    udf.UDF81                          AS UDF817 ,
    udf.UDF82                          AS UDF827 ,
    udf.UDF83                          AS UDF837 ,
    udf.UDF84                          AS UDF847 ,
    udf.UDF85                          AS UDF857 ,
    udf.UDF86                          AS UDF867 ,
    udf.UDF87                          AS UDF877 ,
    udf.UDF88                          AS UDF887 ,
    udf.UDF89                          AS UDF897 ,
    udf.UDF90                          AS UDF907 ,
    udf.UDF91                          AS UDF917 ,
    udf.UDF92                          AS UDF927 ,
    udf.UDF93                          AS UDF937 ,
    udf.UDF94                          AS UDF947 ,
    udf.UDF95                          AS UDF957 ,
    udf.UDF96                          AS UDF967 ,
    udf.UDF97                          AS UDF977 ,
    udf.UDF98                          AS UDF987 ,
    udf.UDF99                          AS UDF997 ,
    udf.UDF100                         AS UDF1007 ,
    SEC.CMS_COLLATERAL_ID              AS SECURITY_ID,
    Sub.SECURITY_TYPE_NAME             AS SECURITY_TYPE,
    sub.SUBTYPE_NAME                   AS SECURITY_SUB_TYPE,
    sec.sci_security_currency          AS CURRENCY,
    ' '                                 AS DEPOSITE_RECIPT_NO,
    ' '                                 AS DEPOSITOR_NAME,
    ' '                                 AS DEPOSIT_AMOUNT,
    ' '                                 AS LIEN_AMOUNT ,
    ' '                                 AS INTEREST_RATE,
    ' '                                 AS DEPOSIT_DATE,
    ' '                                 AS DEPOSIT_MATURITY_DATE ,
    ' '                                 AS GUARANTERS_NAME,
    ' '                                 AS Reference_Number_of_Guarantee,
    ' '                                 AS Networth,
    ' '                                 AS Networth_Date,
    ' '                                 AS Start_Date_Of_Guarantee,
    ' '                                 AS security_maturity_date,
    ' '                                 AS GUARANTOR_TYPE,
    ' '                                 AS GUARANTERS_NAME_PREFIX,
    ' '                                 AS GUARANTERS_FULL_NAME,
    ' '                                 AS GUARANTOR_NATURE,
    ' '                                 AS RAMID,
    ' '                                 AS ADDRESS_LINE1,
    ' '                                 AS ADDRESS_LINE2,
    ' '                                 AS ADDRESS_LINE3,
    ' '                                 AS CITY,
    ' '                                 AS STATE,
    ' '                                 AS REGION,
    ' '                                 AS COUNTRY,
    ' '                                 AS PINCODE,
    ' '                                 AS discription_of_assets,
    TO_CHAR(sec.cmv)                   AS SECURITY_AMOUNT,
    ' '                                 AS GROSS_AMOUNT,
    ' '                                 AS DUE_DATE,
    ' '                                 AS CURRENT_ASSET,
    ' '                                 AS LONABLE_AMOUNT ,
    ' '                                 AS POLICY_NO,
    ' '                                 AS STARE_DATE,
    ' '                                 AS EXPIRY_DATE,
    ' '                                 AS VALUATIOIN_DATE,
    ' '                                 AS VALUATION_AMOUNT,
    ' '                                 AS REVALUATION_FRQUENCY,
    ' '                                 AS NEXT_VALUATION_DATE,
    ' '                                 AS CHARGE_TYPE,
    TO_CHAR(PDC.MATURITY_DATE)         AS MATURITY_DATE,
    TO_CHAR(PDC.START_DATE)            AS START_DATE,
    TO_CHAR(PDC.RAM_ID)                AS RAM_ID,
    TO_CHAR(PDC.CHEQUE_AMOUNT)         AS CHEQUE_AMOUNT,
    TO_CHAR(PDC.CHEQUE_NUMBER)         AS CHEQUE_NUMBER,
     ' ' AS PHY_INSPECTION_DONE,
    ' ' AS PHY_INSPECTION_FREQ,
    ' ' AS LAST_PHY_INSPECT_DATE,
    ' ' AS NEXT_PHY_INSPECT_DATE,
    ' ' AS PROPERTY_TYPE,
    ' ' AS MARGAGE_TYPE,
    ' ' AS VALUATION_DATE,
    ' ' AS MORGAGE_CREATED_BY,
    ' ' AS TOTAL_PROPERTY_AMOUNT,
    ' ' AS PRIOR_CLAIM,
    ' ' AS TYPE_OF_CLAIM,
    ' ' AS MORTAGE_REGISTERED_REF,
    ' ' AS VALUATOR_COMPANY,
    ' ' AS ADVOCATE_LAWYER_NAME,
    ' ' AS BUILTUP_AREA,
    ' ' AS PROPERTY_ADDRESS,
    ' ' AS description_asset,
    ' ' AS NO_OF_UNITS,
    ' ' AS STOCK_CODE,
    ' ' AS bond_name,
    ' ' AS UNIT_PRICE,
    ' ' AS Total_Value
  FROM CMS_SECURITY SEC,
    CMS_SECURITY_SUB_TYPE SUB,
    SECURITY_TYPE TYP,
    SCI_LSP_APPR_LMTS SCI,
    SCI_LSP_SYS_XREF XREF,
        CMS_LIMIT_SECURITY_MAP MAPS,
    (SELECT *
    FROM SCI_LSP_LMTS_XREF_MAP
    WHERE CMS_LSP_LMTS_XREF_MAP_ID IN
      (SELECT (CMS_LSP_LMTS_XREF_MAP_ID)
      FROM SCI_LSP_LMTS_XREF_MAP
      WHERE CMS_LSP_APPR_LMTS_ID IN
        (SELECT CMS_LSP_APPR_LMTS_ID
        FROM SCI_LSP_LMTS_XREF_MAP
        GROUP BY CMS_LSP_APPR_LMTS_ID,
          CMS_LSP_LMTS_XREF_MAP_ID
        )
      )
    ) MAPSS,
    SCI_LSP_LMT_PROFILE PF,
    SCI_LE_SUB_PROFILE SPRO ,
    SCI_LE_MAIN_PROFILE MAN,
    sci_le_cri cri,
    SCI_LE_BANKING_METHOD bk,
    SCI_LE_DIRECTOR dr,
    SCI_LE_UDF udf,
    CMS_ASSET_PDC PDC ,
    CMS_ASSET AST
  WHERE SEC.SECURITY_SUB_TYPE_ID    = SUB.SECURITY_SUB_TYPE_ID
  AND SUB.SECURITY_TYPE_ID          = TYP.SECURITY_TYPE_ID
  AND SEC.CMS_COLLATERAL_ID         = MAPS.CMS_COLLATERAL_ID
  AND MAPS.CMS_LSP_APPR_LMTS_ID     = SCI.CMS_LSP_APPR_LMTS_ID
  AND SCI.CMS_LIMIT_PROFILE_ID      = PF.CMS_LSP_LMT_PROFILE_ID
  AND PF.CMS_CUSTOMER_ID            = Spro.CMS_LE_SUB_PROFILE_ID
  AND SPRO.CMS_LE_MAIN_PROFILE_ID   = MAN.CMS_LE_MAIN_PROFILE_ID
  AND cri.cms_le_main_profile_id (+)= MAN.CMS_LE_MAIN_PROFILE_ID
  AND SCI.CMS_LSP_APPR_LMTS_ID      = MAPSS.CMS_LSP_APPR_LMTS_ID
  AND MAPSS.CMS_LSP_SYS_XREF_ID     = XREF.CMS_LSP_SYS_XREF_ID
  AND PDC.CMS_COLLATERAL_ID (+)     = SEC.CMS_COLLATERAL_ID
  AND AST.cms_collateral_id(+)      = SEC.CMS_COLLATERAL_ID
  AND spro.status                   = 'ACTIVE'
      AND SUB.SECURITY_SUB_TYPE_ID IN('AB108')
  AND sec.cms_collateral_id    IN
    (SELECT CMS_COLLATERAL_ID FROM CMS_ASSET
    )
  AND (MAPS.update_status_ind      <> 'D'
  OR MAPS.update_status_ind        IS NULL)
  AND( AST.LAST_USED_ID_IDX_STOCK  <> 0
  OR AST.LAST_USED_ID_IDX_FAO      <> 0
  OR AST.LAST_USED_ID_IDX_INSR     <> 0
  OR AST.INTEREST_RATE             <> 0
  OR sec.cmv                       IS NOT NULL )
  AND bk.CMS_LE_MAIN_PROFILE_ID(+)  = MAN.CMS_LE_MAIN_PROFILE_ID
  AND dr.CMS_LE_MAIN_PROFILE_ID(+)  = MAN.CMS_LE_MAIN_PROFILE_ID
  AND udf.CMS_LE_MAIN_PROFILE_ID(+) = MAN.CMS_LE_MAIN_PROFILE_ID;

   COMMENT ON MATERIALIZED VIEW "MV_RBIFYDATADEC15_6"  IS 'snapshot table for snapshot CLIMSHDFCTEST1304.MV_RBIFYDATADEC15_6';
--------------------------------------------------------
--  DDL for Materialized View MV_RBIFYDATADEC15_8
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "MV_RBIFYDATADEC15_8" ("CMS_LE_SUB_PROFILE_ID", "LSP_ID", "LSP_LE_ID", "LSP_SHORT_NAME", "LSP_DMCL_REG_NUM_TEXT", "LSP_DMCL_CNTRY_ISO_CODE", "LSP_SWIFT_CNTRY_CODE", "LSP_ORGN_TYPE_NUM", "LSP_ORGN_TYPE_VALUE", "LSP_DCL_AGREE_IND", "LSP_DCL_AGREE_DATE", "LSP_LANG_CODE_NUM", "LSP_LANG_CODE_VALUE", "LSP_REL_START_DATE", "LSP_SVC_STD_PRRTY_NUM", "LSP_SVC_STD_PRRTY_VALUE", "LSP_BANK_SCY_ACT_IND", "LSP_TRSRY_APPL_NUM", "LSP_TRSRY_APPL_VALUE", "LSP_OPR_STATUS_2_NUM", "LSP_OPR_STATUS_2_VALUE", "LSP_OPR_STATUS_2_EFF_DATE", "LSP_OFF_ADDR_CHK_IND", "LSP_INSTRC_REF_CHK_IND", "LSP_SYS_XREF_CHK_IND", "LSP_EMP_MAP_CHK_IND", "LSP_LMT_PROFILE_CHK_IND", "LSP_PLCY_EXCEP_CHK_IND", "LSP_APPR_LMTS_CHK_IND", "LSP_CO_BORR0W_LMT_CHK_IND", "LSP_LMTS_XREF_MAP_CHK_IND", "LSP_COBO_XREF_MAP_CHK_IND", "LSP_LMTS_SEC_MAP_CHK_IND", "PROGRESS_STATUS_NUM", "PROGRESS_STATUS_VALUE", "LSP_SUB_PROFILE_CHK_IND", "CREATE_USER_ID", "LAST_UPDATE_USER_ID", "VERIFY_USER_ID", "CREATE_DATE", "LAST_UPDATE_DATE", "VERIFY_DATE", "UPDATE_COUNT", "UPDATE_STATUS_IND", "LOCK_IND", "LOCK_USER_ID", "LOCK_LE_IND", "CHANGE_IND", "MAKER_HUB_LOCTN_NUM", "MAKER_HUB_LOCTN_VALUE", "CMS_LE_MAIN_PROFILE_ID", "CMS_VERSION_TIME", "CMS_CCC_STATUS", "CMS_SUB_ORIG_COUNTRY", "CMS_SUB_ORIG_ORGANISATION", "CMS_NON_BORROWER_IND", "ULSP_SHORT_NAME", "STATUS", "PAN", "RELATION_MGR", "PARTY_GRP_NM", "RM_REGION", "IND_NM", "ENTITY", "CYCLE_NM", "PART_REGION", "RBI_IND_CODE", "SUB_LINE", "BANKING_METHOD", "TOTAL_FUNDED_LIMIT", "TOTAL_NON_FUNDED_LIMIT", "FUNDED_SHARE_PERCENT", "NON_FUNDED_SHARE_PERCENT", "MEMO_EXPOSURE", "TOTAL_SANCTIONED_LIMIT", "MPBF", "FUNDED_SHARE_LIMIT", "NON_FUNDED_SHARE_LIMIT", "BORROWER_DUNS_NO", "CLASS_ACTIVITY_1", "CLASS_ACTIVITY_2", "CLASS_ACTIVITY_3", "WILLFUL_DEFAULT_STATUS", "SUIT_FILLED_STATUS", "DATE_OF_SUIT", "SUIT_AMOUNT", "SUIT_REF_NO", "DATE_WILLFUL_DEFAULT", "REG_OFFICE_DUNS_NO", "CURRENCY1", "PARTY_CONSENT", "MAIN_BRANCH", "COPY_REG_ADDR", "BRANCH_CODE", "LSP_SGMNT_CODE_VALUE", "FUNDED_INCRE_DECRE", "NONFUNDED_INCRE_DECRE", "MEMOEXPOS_INCRE_DECRE", "CMS_LSP_LMT_PROFILE_ID1", "LLP_ID1", "LLP_LE_ID1", "LLP_LSP_ID1", "LLP_NEXT_ANNL_RVW_DATE1", "LLP_NEXT_INTRM_RVW_DATE1", "LLP_CRDT_PLCY_COMPLNCE_IND1", "LLP_UNWRT_STD_CMPLNCE_IND1", "LLP_EXTD_NEXT_RVW_DATE1", "LLP_PRJTD_ECON_PROFIT1", "LLP_EXPECT_LOSS_AMT1", "LLP_PROD_PRG_COMPLNCE_IND1", "LLP_CNTRY_RISK_APPR_REQ_IND1", "LLP_BKG_LOCTN_ID1", "CREATE_USER_ID1", "LAST_UPDATE_USER_ID1", "VERIFY_USER_ID1", "CREATE_DATE1", "LAST_UPDATE_DATE1", "VERIFY_DATE1", "UPDATE_COUNT1", "UPDATE_STATUS_IND1", "CHANGE_IND1", "LLP_2ND_APPR_EMP_ID1", "LLP_1ST_APPR_EMP_ID1", "LLP_BCA_REF_NUM1", "LOS_BCA_REF_NUM1", "LLP_BCA_REF_APPR_DATE1", "CMS_REQ_SEC_COVERAGE1", "CMS_ACT_SEC_COVERAGE1", "CMS_APPR_OFFICER_GRADE1", "CMS_VERSION_TIME1", "CMS_CUSTOMER_ID1", "CMS_BCA_STATUS1", "CMS_BCA_CREATE_DATE1", "CMS_TAT_CREATE_DATE1", "CMS_BFL_REQUIRED_IND1", "CMS_ORIG_COUNTRY1", "CMS_ORIG_ORGANISATION1", "CMS_BCA_RENEWAL_IND1", "CMS_FULL_DOC_REVIEW_IND1", "CMS_BCA_COMPLETE_IND1", "CMS_CCC_COMPLETE_IND1", "CMS_SCC_COMPLETE_IND1", "LLP_1ST_APPR_EMP_NAME1", "LLP_2ND_APPR_EMP_NAME1", "CMS_BCA_LOCAL_IND1", "CMS_BFL_IND_UPDATE_DATE1", "CMS_EXTENDED_BFL_DATE1", "CMS_CB_ACT_SEC_COVERAGE1", "IS_MIGRATED_IND1", "LLP_SEGMENT_CODE_NUM1", "LLP_SEGMENT_CODE_VALUE1", "ISLAMIC_FLAG1", "SOURCE_ID1", "LSP_LMT_PROFILE_SRC_ID_OLD1", "CMS_BCA_JOINT_IND1", "LMT_PROFILE_TYPE1", "APPLICATION_TYPE1", "APPLICATION_LAW_TYPE1", "CMS_CREATE_IND1", "CIF_SOURCE_ID1", "LI_GENERATION_DATE1", "CAM_TYPE1", "CAM_LOGIN_DATE1", "NO_OF_TIMES_EXTENDED1", "TOTAL_SACTIONED_AMOUNT1", "RELATIONSHIP_MANAGER1", "CONTROLLING_BRANCH1", "COMMITTE_APPROVAL1", "ASSET_CLASSIFICATION1", "RBI_ASSET_CLASSIFICATION1", "BOARD_APPROVAL1", "LLP_3RD_APPR_EMP_NAME1", "LLP_4TH_APPR_EMP_NAME1", "LLP_5TH_APPR_EMP_NAME1", "DOC_REMARKS1", "FULLY_CASH_COLLATERAL1", "TOTAL_SANCTIONED_FAC_AMT1", "RATING_TYPE1", "RATING_YEAR1", "CMS_LSP_APPR_LMTS_ID2", "CMS_LIMIT_PROFILE_ID2", "LMT_ID2", "LOS_LMT_ID2", "ACF_NO2", "LMT_BKG_LOCTN_ID2", "LMT_PRD_TYPE_NUM2", "LMT_PRD_TYPE_VALUE2", "LMT_TYPE_NUM2", "LMT_TYPE_VALUE2", "LMT_AMT2", "LMT_SEC_TYPE_NUM2", "LMT_SEC_TYPE_VALUE2", "LMT_CRRNCY_ISO_CODE2", "LMT_OUTER_LMT_ID2", "LMT_EXPRY_DATE2", "LMT_INTRST_BASE_NUM2", "LMT_TENOR2", "LMT_INTRST_BASE_VALUE2", "LMT_INTRST_MARGIN2", "INTEREST_RATE2", "LMT_CMMSN2", "LMT_FEE2", "LMT_CONDTN_TEXT2", "LMT_ADVISE_IND2", "LMT_CMMTD_IND2", "LMT_SHARE_IND2", "CREATE_USER_ID2", "LAST_UPDATE_USER_ID2", "VERIFY_USER_ID2", "CREATE_DATE2", "LAST_UPDATE_DATE2", "VERIFY_DATE2", "UPDATE_COUNT2", "UPDATE_STATUS_IND2", "CHANGE_IND2", "LMT_TENOR_BASIS_NUM2", "LMT_LLP_ID2", "LMT_TENOR_BASIS_VALUE2", "LMT_LE_ID2", "LMT_LSP_ID2", "CMS_ACT_SEC_COVERAGE2", "CMS_REQ_SEC_COVERAGE2", "CMS_VERSION_TIME2", "CMS_LIMIT_STATUS2", "CMS_ACTIVATED_LIMIT2", "CMS_BKG_COUNTRY2", "CMS_BKG_ORGANISATION2", "CMS_IS_LIMIT_EXISTING_IND2", "CMS_ACTIVATED_LIMIT_IND2", "CMS_OUTER_LMT_REF2", "CMDT_OP_LMT2", "CMS_OUTER_LMT_PROF_ID2", "CMS_REF_ID2", "GROUP_ID2", "ZERO_REASON2", "ZERO_DATE2", "ZERO_IND2", "CMS_CR125_DER_ACTVD_LMT_AMT2", "LMT_PRD_GRP_NUM2", "LMT_PRD_GRP_VALUE2", "CMS_DRAWING_LIMIT2", "CMS_OUTSTANDING_AMT2", "LMT_DESC2", "LMT_FAC_TYPE_NUM2", "LMT_FAC_TYPE_VALUE2", "SOURCE_ID2", "LMT_BCA_REF_NUM2", "LOS_BCA_REF_NUM2", "LMT_ID_OLD2", "LMT_OMNIBUS_IND2", "LMT_FAC_CODE2", "LMT_FAC_SEQ2", "ACCOUNT_TYPE2", "AVAILABLE_LMT2", "LOAN_TYPE2", "CMS_ACTUAL_SEC_COVERAGE_AMT2", "CMS_OMV_SEC_COVERAGE_AMT2", "CMS_FSV_SEC_COVERAGE_AMT2", "INNER_LIMIT_ORDERING2", "OMNIBUS_ENVELOPE_ID2", "OMNIBUS_ENVELOPE_NAME2", "DISBURSED_IND2", "LMT_LOAN_SECTOR_NUM2", "LMT_LOAN_SECTOR_VALUE2", "FACILITY_TYPE2", "RELEASABLE_AMOUNT2", "FACILITY_NAME2", "FACILITY_SYSTEM2", "FACILITY_SYSTEM_ID2", "LINE_NO2", "PURPOSE2", "IS_DP2", "RELATIONSHIP_MANAGER2", "IS_RELEASED2", "GRADE2", "IS_SECURED2", "IS_ADHOC2", "FACILITY_CAT2", "GUARANTEE2", "SUB_PARTY_NAME2", "SUB_FACILITY_NAME2", "LIABILITY_ID2", "ADHOC_LMT_AMOUNT2", "IS_ADHOC_TOSUM2", "TOTAL_RELEASED_AMOUNT2", "OTHER_PURPOSE2", "CMS_LSP_SYS_XREF_ID3", "LSX_ID3", "LSX_LE_ID3", "LSX_BKG_LOCTN_ID3", "LSX_LSP_ID3", "LSX_EXT_SYS_CODE_NUM3", "LSX_EXT_SYS_CODE_VALUE3", "LSX_EXT_SYS_CUST_ID3", "LSX_EXT_SYS_CUST_NAME3", "LSX_EXT_SYS_ACCT_NUM3", "LSX_ACCT_STATUS_TEXT3", "CREATE_USER_ID3", "LAST_UPDATE_USER_ID3", "VERIFY_USER_ID3", "CREATE_DATE3", "LAST_UPDATE_DATE3", "VERIFY_DATE3", "UPDATE_COUNT3", "UPDATE_STATUS_IND3", "CHANGE_IND3", "CMS_LE_SUB_PROFILE_ID3", "ACCOUNT_DESC_NUM3", "ACCOUNT_DESC_VALUE3", "LSX_EXT_SYS_ACCT_SEQ3", "LSX_FAC_CODE3", "LSX_FAC_SEQ3", "LSX_EXT_CTY_CODE_VALUE3", "ACCT_DELQ_IND3", "ACCT_EFFECTIVE_DATE3", "ACCT_STATUS3", "LSX_BCA_REF_NUM3", "LSX_LMT_ID3", "LSX_BKG_LOCTN_CTRY3", "LSX_BKG_LOCTN_ORG3", "LSX_EXT_SYS_ACCT_TYPE3", "ACCT_RV3", "ACCT_RV_CCY3", "FIRST_DISBURSEMENT_DATE3", "FINAL_DISBURSEMENT_DATE3", "CMS_SEC_COVERAGE_AMT3", "CMS_OUTSTANDING_AMT3", "LAST_ALLOCATION_DATE3", "OUTSTANDING_AMT_CCY3", "SEC_COVERAGE_AMT_CCY3", "SERIAL_NO3", "INTEREST_RATE_TYPE3", "INT_RATE_FLOATING_TYPE3", "INT_RATE_FLOATING_RANGE3", "INT_RATE_FLOATING_MARGIN_FLAG3", "INT_RATE_FLOATING_MARGIN3", "RELEASED_AMOUNT3", "UTILIZED_AMOUNT3", "RELEASE_DATE3", "DATE_OF_RESET3", "IS_PERMNT_SSI_CERT3", "IS_CAPITAL_MARKET_EXPOSER3", "IS_REALESTATE_EXPOSER3", "ESTATE_TYPE3", "IS_PRIORITY_SECTOR3", "PRIORITY_SECTOR3", "SECURITY13", "SECURITY23", "SECURITY33", "FACILITY_SYSTEM_ID3", "LINE_NO3", "FACILITY_SYSTEM3", "INT_RATE_FIX3", "COMM_REAL_ESTATE_TYPE3", "SECURITY43", "SECURITY53", "SECURITY63", "UPLOAD_STATUS3", "UP_FOREIGN_CUR_CODE3", "UP_FOREIGN_LMT_AMT3", "UP_FOREIGN_UTL_AMT3", "CMS_LE_BANKING_METHOD_ID4", "CMS_LE_MAIN_PROFILE_ID4", "CMS_LE_NODAL4", "CMS_LE_LEAD4", "CMS_LE_BANK_ID4", "CMS_LE_BANK_TYPE4", "SCI_LE_CRI_ID5", "CMS_LE_MAIN_PROFILE_ID5", "CUSTOMER_RAM_ID5", "CUSTOMER_APR_CODE5", "CUSTOMER_EXT_RATING5", "IS_NBFS5", "NBFS_A5", "NBFS_B5", "IS_PRIORITY_SECTOR5", "MSME_CLASSIFICATION5", "IS_PERMENENT_SSI_CERT5", "IS_WEAKER_SECTION5", "WEAKER_SECTION5", "IS_KISAN_CREDIT_CARD5", "IS_MINORITY_COMMUNITY5", "MINORITY_COMMUNITY5", "IS_CAPITAL_MARKET_EXPOS5", "IS_REAL_ESTATE_EXPOS5", "REAL_ESTATE_EXPOS_TYPE5", "REAL_ESTATE_EXPOS_COMM5", "IS_COMMODITIES_EXPOSER5", "IS_SENSITIVE5", "COMMODITIES_NAME5", "GROSS_INVS_IN_PM5", "GROSS_INVS_IN_EQUIP5", "PSU5", "PSU_PERCENTAGE5", "GOVT_UNDER_TAKING5", "IS_PROJECT_FINANCE5", "IS_INFRASTRUCTURE_FINANACE5", "INFRASTRUCTURE_FINANACE_TYPE5", "IS_SEMS_GUIDE_APPLICABLE5", "IS_FAIL_IFC_EXCLU_LIST5", "IS_TUFS5", "IS_RBI_DEFAULTER5", "RBI_DEFAULTER5", "IS_LITIGATION5", "LITIGATION_BY5", "IS_INTEREST_OF_BANK5", "INTEREST_OF_BANK5", "IS_ADVERSE_REMARK5", "ADVERSE_REMARK5", "AUDIT_TYPE5", "AVG_ANNUAL_TURNOVER5", "INDUSTRY_EXPOSER5", "IS_DIREC_OTHER_BANK5", "DIREC_OTHER_BANK5", "IS_PARTNER_OTHER_BANK5", "PARTNER_OTHER_BANK5", "IS_SUBSTANTIAL_OTHER_BANK5", "SUBSTANTIAL_OTHER_BANK5", "IS_HDFC_DIREC_RLTV5", "HDFC_DIREC_RLTV5", "IS_OBK_DIREC_RLTV5", "OBK_DIREC_RLTV5", "IS_PARTNER_DIREC_RLTV5", "PARTNER_DIREC_RLTV5", "IS_SUBSTTIAL_RLTV_HDFC_OTHER5", "SUBSTANTIAL_RLTV_HDFC_OTHER5", "DIREC_HDFC_OTHER5", "IS_BACKED_BY_GOVT5", "GOVT_SCHEME_TYPE5", "FIRST_YEAR5", "SECOND_YEAR5", "THIRD_YEAR5", "SECOND_YEAR_TURNOVER5", "FIRST_YEAR_TURNOVER5", "THIRD_YEAR_TURNOVER5", "FIRST_YEAR_TURNOVER_CURRENCY5", "SECOND_YEAR_TURNOVER_CURRENCY5", "THIRD_YEAR_TURNOVER_CURRENCY5", "CMS_LE_DIRECTOR_ID6", "CMS_LE_MAIN_PROFILE_ID6", "RELATED_TYPE6", "RELATIONSHIP_TYPE6", "DIR_EMAIL6", "DIR_FAX6", "DIR_TEL_NO6", "DIR_COUNTRY6", "DIR_STATE6", "DIR_CITY6", "DIR_REGION6", "DIR_POST_CODE6", "DIR_ADD36", "DIR_ADD26", "DIR_ADD16", "PERCENT_OF_CTRL6", "FULL_NAME6", "NAME_PREFIX6", "BUSSNESS_NAME6", "DIR_PAN6", "RELATED_DUNS_NO6", "DIN_NO6", "DIR_NAME6", "DIR_STD_CODE_TELEX6", "DIR_STD_CODE_TEL6", "CMS_LE_MAIN_PROFILE_ID7", "UDF17", "UDF27", "UDF37", "UDF47", "UDF57", "UDF67", "UDF77", "UDF87", "UDF97", "UDF107", "UDF117", "UDF127", "UDF137", "UDF147", "UDF157", "UDF167", "UDF177", "UDF187", "UDF197", "UDF207", "UDF217", "UDF227", "UDF237", "UDF247", "UDF257", "UDF267", "UDF277", "UDF287", "UDF297", "UDF307", "UDF317", "UDF327", "UDF337", "UDF347", "UDF357", "UDF367", "UDF377", "UDF387", "UDF397", "UDF407", "UDF417", "UDF427", "UDF437", "UDF447", "UDF457", "UDF467", "UDF477", "UDF487", "UDF497", "UDF507", "UDF517", "UDF527", "UDF537", "UDF547", "UDF557", "UDF567", "UDF577", "UDF587", "UDF597", "UDF607", "UDF617", "UDF627", "UDF637", "UDF647", "UDF657", "UDF667", "UDF677", "UDF687", "UDF697", "UDF707", "UDF717", "UDF727", "UDF737", "UDF747", "UDF757", "UDF767", "UDF777", "UDF787", "UDF797", "UDF807", "UDF817", "UDF827", "UDF837", "UDF847", "UDF857", "UDF867", "UDF877", "UDF887", "UDF897", "UDF907", "UDF917", "UDF927", "UDF937", "UDF947", "UDF957", "UDF967", "UDF977", "UDF987", "UDF997", "UDF1007", "SECURITY_ID", "SECURITY_TYPE", "SECURITY_SUB_TYPE", "CURRENCY", "DEPOSITE_RECIPT_NO", "DEPOSITOR_NAME", "DEPOSIT_AMOUNT", "LIEN_AMOUNT", "INTEREST_RATE", "DEPOSIT_DATE", "DEPOSIT_MATURITY_DATE", "GUARANTERS_NAME", "REFERENCE_NUMBER_OF_GUARANTEE", "NETWORTH", "NETWORTH_DATE", "START_DATE_OF_GUARANTEE", "SECURITY_MATURITY_DATE", "GUARANTOR_TYPE", "GUARANTERS_NAME_PREFIX", "GUARANTERS_FULL_NAME", "GUARANTOR_NATURE", "RAMID", "ADDRESS_LINE1", "ADDRESS_LINE2", "ADDRESS_LINE3", "CITY", "STATE", "REGION", "COUNTRY", "PINCODE", "DISCRIPTION_OF_ASSETS", "SECURITY_AMOUNT", "GROSS_AMOUNT", "DUE_DATE", "CURRENT_ASSET", "LONABLE_AMOUNT", "POLICY_NO", "STARE_DATE", "EXPIRY_DATE", "VALUATIOIN_DATE", "VALUATION_AMOUNT", "REVALUATION_FRQUENCY", "NEXT_VALUATION_DATE", "CHARGE_TYPE", "MATURITY_DATE", "START_DATE", "RAM_ID", "CHEQUE_AMOUNT", "CHEQUE_NUMBER", "PHY_INSPECTION_DONE", "PHY_INSPECTION_FREQ", "LAST_PHY_INSPECT_DATE", "NEXT_PHY_INSPECT_DATE", "PROPERTY_TYPE", "MARGAGE_TYPE", "VALUATION_DATE", "MORGAGE_CREATED_BY", "TOTAL_PROPERTY_AMOUNT", "PRIOR_CLAIM", "TYPE_OF_CLAIM", "MORTAGE_REGISTERED_REF", "VALUATOR_COMPANY", "ADVOCATE_LAWYER_NAME", "BUILTUP_AREA", "PROPERTY_ADDRESS", "DESCRIPTION_ASSET", "NO_OF_UNITS", "STOCK_CODE", "BOND_NAME", "UNIT_PRICE", "TOTAL_VALUE")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE USING NO INDEX 
  NEVER REFRESH DISABLE ON QUERY COMPUTATION ENABLE QUERY REWRITE
  AS SELECT DISTINCT spro.CMS_LE_SUB_PROFILE_ID ,
    spro.LSP_ID ,
    spro.LSP_LE_ID ,
    spro.LSP_SHORT_NAME ,
    spro.LSP_DMCL_REG_NUM_TEXT ,
    spro.LSP_DMCL_CNTRY_ISO_CODE ,
    spro.LSP_SWIFT_CNTRY_CODE ,
    spro.LSP_ORGN_TYPE_NUM ,
    spro.LSP_ORGN_TYPE_VALUE ,
    spro.LSP_DCL_AGREE_IND ,
    spro.LSP_DCL_AGREE_DATE ,
    spro.LSP_LANG_CODE_NUM ,
    spro.LSP_LANG_CODE_VALUE ,
    spro.LSP_REL_START_DATE ,
    spro.LSP_SVC_STD_PRRTY_NUM ,
    spro.LSP_SVC_STD_PRRTY_VALUE ,
    spro.LSP_BANK_SCY_ACT_IND ,
    spro.LSP_TRSRY_APPL_NUM ,
    spro.LSP_TRSRY_APPL_VALUE ,
    spro.LSP_OPR_STATUS_2_NUM ,
    spro.LSP_OPR_STATUS_2_VALUE ,
    spro.LSP_OPR_STATUS_2_EFF_DATE ,
    spro.LSP_OFF_ADDR_CHK_IND ,
    spro.LSP_INSTRC_REF_CHK_IND ,
    spro.LSP_SYS_XREF_CHK_IND ,
    spro.LSP_EMP_MAP_CHK_IND ,
    spro.LSP_LMT_PROFILE_CHK_IND ,
    spro.LSP_PLCY_EXCEP_CHK_IND ,
    spro.LSP_APPR_LMTS_CHK_IND ,
    spro.LSP_CO_BORR0W_LMT_CHK_IND ,
    spro.LSP_LMTS_XREF_MAP_CHK_IND ,
    spro.LSP_COBO_XREF_MAP_CHK_IND ,
    spro.LSP_LMTS_SEC_MAP_CHK_IND ,
    spro.PROGRESS_STATUS_NUM ,
    spro.PROGRESS_STATUS_VALUE ,
    spro.LSP_SUB_PROFILE_CHK_IND ,
    spro.CREATE_USER_ID ,
    spro.LAST_UPDATE_USER_ID ,
    spro.VERIFY_USER_ID ,
    spro.CREATE_DATE ,
    spro.LAST_UPDATE_DATE ,
    spro.VERIFY_DATE ,
    spro.UPDATE_COUNT ,
    spro.UPDATE_STATUS_IND ,
    spro.LOCK_IND ,
    spro.LOCK_USER_ID ,
    spro.LOCK_LE_IND ,
    spro.CHANGE_IND ,
    spro.MAKER_HUB_LOCTN_NUM ,
    spro.MAKER_HUB_LOCTN_VALUE ,
    spro.CMS_LE_MAIN_PROFILE_ID ,
    spro.CMS_VERSION_TIME ,
    spro.CMS_CCC_STATUS ,
    spro.CMS_SUB_ORIG_COUNTRY ,
    spro.CMS_SUB_ORIG_ORGANISATION ,
    spro.CMS_NON_BORROWER_IND ,
    spro.ULSP_SHORT_NAME ,
    spro.STATUS ,
    spro.PAN ,
    spro.RELATION_MGR ,
    spro.PARTY_GRP_NM ,
    spro.RM_REGION ,
    spro.IND_NM ,
    spro.ENTITY ,
    spro.CYCLE_NM ,
    spro.REGION AS PART_REGION,
    spro.RBI_IND_CODE ,
    spro.SUB_LINE ,
    spro.BANKING_METHOD ,
    spro.TOTAL_FUNDED_LIMIT ,
    spro.TOTAL_NON_FUNDED_LIMIT ,
    spro.FUNDED_SHARE_PERCENT ,
    spro.NON_FUNDED_SHARE_PERCENT ,
    spro.MEMO_EXPOSURE ,
    spro.TOTAL_SANCTIONED_LIMIT ,
    spro.MPBF ,
    spro.FUNDED_SHARE_LIMIT ,
    spro.NON_FUNDED_SHARE_LIMIT ,
    spro.BORROWER_DUNS_NO ,
    spro.CLASS_ACTIVITY_1 ,
    spro.CLASS_ACTIVITY_2 ,
    spro.CLASS_ACTIVITY_3 ,
    spro.WILLFUL_DEFAULT_STATUS ,
    spro.SUIT_FILLED_STATUS ,
    spro.DATE_OF_SUIT ,
    spro.SUIT_AMOUNT ,
    spro.SUIT_REF_NO ,
    spro.DATE_WILLFUL_DEFAULT ,
    spro.REG_OFFICE_DUNS_NO ,
    spro.CURRENCY AS currency1 ,
    spro.PARTY_CONSENT ,
    spro.MAIN_BRANCH ,
    spro.COPY_REG_ADDR ,
    spro.BRANCH_CODE ,
    spro.LSP_SGMNT_CODE_VALUE ,
    spro.FUNDED_INCRE_DECRE ,
    spro.NONFUNDED_INCRE_DECRE ,
    spro.MEMOEXPOS_INCRE_DECRE ,
    PF.CMS_LSP_LMT_PROFILE_ID          AS CMS_LSP_LMT_PROFILE_ID1 ,
    PF.LLP_ID                          AS LLP_ID1 ,
    PF.LLP_LE_ID                       AS LLP_LE_ID1 ,
    PF.LLP_LSP_ID                      AS LLP_LSP_ID1 ,
    PF.LLP_NEXT_ANNL_RVW_DATE          AS LLP_NEXT_ANNL_RVW_DATE1 ,
    PF.LLP_NEXT_INTRM_RVW_DATE         AS LLP_NEXT_INTRM_RVW_DATE1 ,
    PF.LLP_CRDT_PLCY_COMPLNCE_IND      AS LLP_CRDT_PLCY_COMPLNCE_IND1 ,
    PF.LLP_UNWRT_STD_CMPLNCE_IND       AS LLP_UNWRT_STD_CMPLNCE_IND1 ,
    PF.LLP_EXTD_NEXT_RVW_DATE          AS LLP_EXTD_NEXT_RVW_DATE1 ,
    PF.LLP_PRJTD_ECON_PROFIT           AS LLP_PRJTD_ECON_PROFIT1 ,
    PF.LLP_EXPECT_LOSS_AMT             AS LLP_EXPECT_LOSS_AMT1 ,
    PF.LLP_PROD_PRG_COMPLNCE_IND       AS LLP_PROD_PRG_COMPLNCE_IND1 ,
    PF.LLP_CNTRY_RISK_APPR_REQ_IND     AS LLP_CNTRY_RISK_APPR_REQ_IND1 ,
    PF.LLP_BKG_LOCTN_ID                AS LLP_BKG_LOCTN_ID1 ,
    PF.CREATE_USER_ID                  AS CREATE_USER_ID1 ,
    PF.LAST_UPDATE_USER_ID             AS LAST_UPDATE_USER_ID1 ,
    PF.VERIFY_USER_ID                  AS VERIFY_USER_ID1 ,
    PF.CREATE_DATE                     AS CREATE_DATE1 ,
    PF.LAST_UPDATE_DATE                AS LAST_UPDATE_DATE1 ,
    PF.VERIFY_DATE                     AS VERIFY_DATE1 ,
    PF.UPDATE_COUNT                    AS UPDATE_COUNT1 ,
    PF.UPDATE_STATUS_IND               AS UPDATE_STATUS_IND1 ,
    PF.CHANGE_IND                      AS CHANGE_IND1 ,
    PF.LLP_2ND_APPR_EMP_ID             AS LLP_2ND_APPR_EMP_ID1 ,
    PF.LLP_1ST_APPR_EMP_ID             AS LLP_1ST_APPR_EMP_ID1 ,
    PF.LLP_BCA_REF_NUM                 AS LLP_BCA_REF_NUM1 ,
    PF.LOS_BCA_REF_NUM                 AS LOS_BCA_REF_NUM1 ,
    PF.LLP_BCA_REF_APPR_DATE           AS LLP_BCA_REF_APPR_DATE1 ,
    PF.CMS_REQ_SEC_COVERAGE            AS CMS_REQ_SEC_COVERAGE1 ,
    PF.CMS_ACT_SEC_COVERAGE            AS CMS_ACT_SEC_COVERAGE1 ,
    PF.CMS_APPR_OFFICER_GRADE          AS CMS_APPR_OFFICER_GRADE1 ,
    PF.CMS_VERSION_TIME                AS CMS_VERSION_TIME1 ,
    PF.CMS_CUSTOMER_ID                 AS CMS_CUSTOMER_ID1 ,
    PF.CMS_BCA_STATUS                  AS CMS_BCA_STATUS1 ,
    PF.CMS_BCA_CREATE_DATE             AS CMS_BCA_CREATE_DATE1 ,
    PF.CMS_TAT_CREATE_DATE             AS CMS_TAT_CREATE_DATE1 ,
    PF.CMS_BFL_REQUIRED_IND            AS CMS_BFL_REQUIRED_IND1 ,
    PF.CMS_ORIG_COUNTRY                AS CMS_ORIG_COUNTRY1 ,
    PF.CMS_ORIG_ORGANISATION           AS CMS_ORIG_ORGANISATION1 ,
    PF.CMS_BCA_RENEWAL_IND             AS CMS_BCA_RENEWAL_IND1 ,
    PF.CMS_FULL_DOC_REVIEW_IND         AS CMS_FULL_DOC_REVIEW_IND1 ,
    PF.CMS_BCA_COMPLETE_IND            AS CMS_BCA_COMPLETE_IND1 ,
    PF.CMS_CCC_COMPLETE_IND            AS CMS_CCC_COMPLETE_IND1 ,
    PF.CMS_SCC_COMPLETE_IND            AS CMS_SCC_COMPLETE_IND1 ,
    PF.LLP_1ST_APPR_EMP_NAME           AS LLP_1ST_APPR_EMP_NAME1 ,
    PF.LLP_2ND_APPR_EMP_NAME           AS LLP_2ND_APPR_EMP_NAME1 ,
    PF.CMS_BCA_LOCAL_IND               AS CMS_BCA_LOCAL_IND1 ,
    PF.CMS_BFL_IND_UPDATE_DATE         AS CMS_BFL_IND_UPDATE_DATE1 ,
    PF.CMS_EXTENDED_BFL_DATE           AS CMS_EXTENDED_BFL_DATE1 ,
    PF.CMS_CB_ACT_SEC_COVERAGE         AS CMS_CB_ACT_SEC_COVERAGE1 ,
    PF.IS_MIGRATED_IND                 AS IS_MIGRATED_IND1 ,
    PF.LLP_SEGMENT_CODE_NUM            AS LLP_SEGMENT_CODE_NUM1 ,
    PF.LLP_SEGMENT_CODE_VALUE          AS LLP_SEGMENT_CODE_VALUE1 ,
    PF.ISLAMIC_FLAG                    AS ISLAMIC_FLAG1 ,
    PF.SOURCE_ID                       AS SOURCE_ID1 ,
    PF.LSP_LMT_PROFILE_SRC_ID_OLD      AS LSP_LMT_PROFILE_SRC_ID_OLD1 ,
    PF.CMS_BCA_JOINT_IND               AS CMS_BCA_JOINT_IND1 ,
    PF.LMT_PROFILE_TYPE                AS LMT_PROFILE_TYPE1 ,
    PF.APPLICATION_TYPE                AS APPLICATION_TYPE1 ,
    PF.APPLICATION_LAW_TYPE            AS APPLICATION_LAW_TYPE1 ,
    PF.CMS_CREATE_IND                  AS CMS_CREATE_IND1 ,
    PF.CIF_SOURCE_ID                   AS CIF_SOURCE_ID1 ,
    PF.LI_GENERATION_DATE              AS LI_GENERATION_DATE1 ,
    PF.CAM_TYPE                        AS CAM_TYPE1 ,
    PF.CAM_LOGIN_DATE                  AS CAM_LOGIN_DATE1 ,
    PF.NO_OF_TIMES_EXTENDED            AS NO_OF_TIMES_EXTENDED1 ,
    PF.TOTAL_SACTIONED_AMOUNT          AS TOTAL_SACTIONED_AMOUNT1 ,
    PF.RELATIONSHIP_MANAGER            AS RELATIONSHIP_MANAGER1 ,
    PF.CONTROLLING_BRANCH              AS CONTROLLING_BRANCH1 ,
    PF.COMMITTE_APPROVAL               AS COMMITTE_APPROVAL1 ,
    PF.ASSET_CLASSIFICATION            AS ASSET_CLASSIFICATION1 ,
    PF.RBI_ASSET_CLASSIFICATION        AS RBI_ASSET_CLASSIFICATION1 ,
    PF.BOARD_APPROVAL                  AS BOARD_APPROVAL1 ,
    PF.LLP_3RD_APPR_EMP_NAME           AS LLP_3RD_APPR_EMP_NAME1 ,
    PF.LLP_4TH_APPR_EMP_NAME           AS LLP_4TH_APPR_EMP_NAME1 ,
    PF.LLP_5TH_APPR_EMP_NAME           AS LLP_5TH_APPR_EMP_NAME1 ,
    replace(PF.DOC_REMARKS,'
    ','')                                 AS DOC_REMARKS1 ,
    PF.FULLY_CASH_COLLATERAL           AS FULLY_CASH_COLLATERAL1 ,
    PF.TOTAL_SANCTIONED_FAC_AMT        AS TOTAL_SANCTIONED_FAC_AMT1 ,
    PF.RATING_TYPE                     AS RATING_TYPE1 ,
    PF.RATING_YEAR                     AS RATING_YEAR1 ,
    SCI.CMS_LSP_APPR_LMTS_ID           AS CMS_LSP_APPR_LMTS_ID2 ,
    SCI.CMS_LIMIT_PROFILE_ID           AS CMS_LIMIT_PROFILE_ID2 ,
    SCI.LMT_ID                         AS LMT_ID2 ,
    SCI.LOS_LMT_ID                     AS LOS_LMT_ID2 ,
    SCI.ACF_NO                         AS ACF_NO2 ,
    SCI.LMT_BKG_LOCTN_ID               AS LMT_BKG_LOCTN_ID2 ,
    SCI.LMT_PRD_TYPE_NUM               AS LMT_PRD_TYPE_NUM2 ,
    SCI.LMT_PRD_TYPE_VALUE             AS LMT_PRD_TYPE_VALUE2 ,
    SCI.LMT_TYPE_NUM                   AS LMT_TYPE_NUM2 ,
    SCI.LMT_TYPE_VALUE                 AS LMT_TYPE_VALUE2 ,
    SCI.LMT_AMT                        AS LMT_AMT2 ,
    SCI.LMT_SEC_TYPE_NUM               AS LMT_SEC_TYPE_NUM2 ,
    SCI.LMT_SEC_TYPE_VALUE             AS LMT_SEC_TYPE_VALUE2 ,
    SCI.LMT_CRRNCY_ISO_CODE            AS LMT_CRRNCY_ISO_CODE2 ,
    SCI.LMT_OUTER_LMT_ID               AS LMT_OUTER_LMT_ID2 ,
    SCI.LMT_EXPRY_DATE                 AS LMT_EXPRY_DATE2 ,
    SCI.LMT_INTRST_BASE_NUM            AS LMT_INTRST_BASE_NUM2 ,
    SCI.LMT_TENOR                      AS LMT_TENOR2 ,
    SCI.LMT_INTRST_BASE_VALUE          AS LMT_INTRST_BASE_VALUE2 ,
    SCI.LMT_INTRST_MARGIN              AS LMT_INTRST_MARGIN2 ,
    SCI.INTEREST_RATE                  AS INTEREST_RATE2 ,
    SCI.LMT_CMMSN                      AS LMT_CMMSN2 ,
    SCI.LMT_FEE                        AS LMT_FEE2 ,
    SCI.LMT_CONDTN_TEXT                AS LMT_CONDTN_TEXT2 ,
    SCI.LMT_ADVISE_IND                 AS LMT_ADVISE_IND2 ,
    SCI.LMT_CMMTD_IND                  AS LMT_CMMTD_IND2 ,
    SCI.LMT_SHARE_IND                  AS LMT_SHARE_IND2 ,
    SCI.CREATE_USER_ID                 AS CREATE_USER_ID2 ,
    SCI.LAST_UPDATE_USER_ID            AS LAST_UPDATE_USER_ID2 ,
    SCI.VERIFY_USER_ID                 AS VERIFY_USER_ID2 ,
    SCI.CREATE_DATE                    AS CREATE_DATE2 ,
    SCI.LAST_UPDATE_DATE               AS LAST_UPDATE_DATE2 ,
    SCI.VERIFY_DATE                    AS VERIFY_DATE2 ,
    SCI.UPDATE_COUNT                   AS UPDATE_COUNT2 ,
    SCI.UPDATE_STATUS_IND              AS UPDATE_STATUS_IND2 ,
    SCI.CHANGE_IND                     AS CHANGE_IND2 ,
    SCI.LMT_TENOR_BASIS_NUM            AS LMT_TENOR_BASIS_NUM2 ,
    SCI.LMT_LLP_ID                     AS LMT_LLP_ID2 ,
    SCI.LMT_TENOR_BASIS_VALUE          AS LMT_TENOR_BASIS_VALUE2 ,
    SCI.LMT_LE_ID                      AS LMT_LE_ID2 ,
    SCI.LMT_LSP_ID                     AS LMT_LSP_ID2 ,
    SCI.CMS_ACT_SEC_COVERAGE           AS CMS_ACT_SEC_COVERAGE2 ,
    SCI.CMS_REQ_SEC_COVERAGE           AS CMS_REQ_SEC_COVERAGE2 ,
    SCI.CMS_VERSION_TIME               AS CMS_VERSION_TIME2 ,
    SCI.CMS_LIMIT_STATUS               AS CMS_LIMIT_STATUS2 ,
    SCI.CMS_ACTIVATED_LIMIT            AS CMS_ACTIVATED_LIMIT2 ,
    SCI.CMS_BKG_COUNTRY                AS CMS_BKG_COUNTRY2 ,
    SCI.CMS_BKG_ORGANISATION           AS CMS_BKG_ORGANISATION2 ,
    SCI.CMS_IS_LIMIT_EXISTING_IND      AS CMS_IS_LIMIT_EXISTING_IND2 ,
    SCI.CMS_ACTIVATED_LIMIT_IND        AS CMS_ACTIVATED_LIMIT_IND2 ,
    SCI.CMS_OUTER_LMT_REF              AS CMS_OUTER_LMT_REF2 ,
    SCI.CMDT_OP_LMT                    AS CMDT_OP_LMT2 ,
    SCI.CMS_OUTER_LMT_PROF_ID          AS CMS_OUTER_LMT_PROF_ID2 ,
    SCI.CMS_REF_ID                     AS CMS_REF_ID2 ,
    SCI.GROUP_ID                       AS GROUP_ID2 ,
    SCI.ZERO_REASON                    AS ZERO_REASON2 ,
    SCI.ZERO_DATE                      AS ZERO_DATE2 ,
    SCI.ZERO_IND                       AS ZERO_IND2 ,
    SCI.CMS_CR125_DERIVE_ACTVD_LMT_AMT AS CMS_CR125_DER_ACTVD_LMT_AMT2 ,
    SCI.LMT_PRD_GRP_NUM                AS LMT_PRD_GRP_NUM2 ,
    SCI.LMT_PRD_GRP_VALUE              AS LMT_PRD_GRP_VALUE2 ,
    SCI.CMS_DRAWING_LIMIT              AS CMS_DRAWING_LIMIT2 ,
    SCI.CMS_OUTSTANDING_AMT            AS CMS_OUTSTANDING_AMT2 ,
    SCI.LMT_DESC                       AS LMT_DESC2 ,
    SCI.LMT_FAC_TYPE_NUM               AS LMT_FAC_TYPE_NUM2 ,
    SCI.LMT_FAC_TYPE_VALUE             AS LMT_FAC_TYPE_VALUE2 ,
    SCI.SOURCE_ID                      AS SOURCE_ID2 ,
    SCI.LMT_BCA_REF_NUM                AS LMT_BCA_REF_NUM2 ,
    SCI.LOS_BCA_REF_NUM                AS LOS_BCA_REF_NUM2 ,
    SCI.LMT_ID_OLD                     AS LMT_ID_OLD2 ,
    SCI.LMT_OMNIBUS_IND                AS LMT_OMNIBUS_IND2 ,
    SCI.LMT_FAC_CODE                   AS LMT_FAC_CODE2 ,
    SCI.LMT_FAC_SEQ                    AS LMT_FAC_SEQ2 ,
    SCI.ACCOUNT_TYPE                   AS ACCOUNT_TYPE2 ,
    SCI.AVAILABLE_LMT                  AS AVAILABLE_LMT2 ,
    SCI.LOAN_TYPE                      AS LOAN_TYPE2 ,
    SCI.CMS_ACTUAL_SEC_COVERAGE_AMT    AS CMS_ACTUAL_SEC_COVERAGE_AMT2 ,
    SCI.CMS_OMV_SEC_COVERAGE_AMT       AS CMS_OMV_SEC_COVERAGE_AMT2 ,
    SCI.CMS_FSV_SEC_COVERAGE_AMT       AS CMS_FSV_SEC_COVERAGE_AMT2 ,
    SCI.INNER_LIMIT_ORDERING           AS INNER_LIMIT_ORDERING2 ,
    SCI.OMNIBUS_ENVELOPE_ID            AS OMNIBUS_ENVELOPE_ID2 ,
    SCI.OMNIBUS_ENVELOPE_NAME          AS OMNIBUS_ENVELOPE_NAME2 ,
    SCI.DISBURSED_IND                  AS DISBURSED_IND2 ,
    SCI.LMT_LOAN_SECTOR_NUM            AS LMT_LOAN_SECTOR_NUM2 ,
    SCI.LMT_LOAN_SECTOR_VALUE          AS LMT_LOAN_SECTOR_VALUE2 ,
    SCI.FACILITY_TYPE                  AS FACILITY_TYPE2 ,
    SCI.RELEASABLE_AMOUNT              AS RELEASABLE_AMOUNT2 ,
    SCI.FACILITY_NAME                  AS FACILITY_NAME2 ,
    SCI.FACILITY_SYSTEM                AS FACILITY_SYSTEM2 ,
    SCI.FACILITY_SYSTEM_ID             AS FACILITY_SYSTEM_ID2 ,
    SCI.LINE_NO                        AS LINE_NO2 ,
    SCI.PURPOSE                        AS PURPOSE2 ,
    SCI.IS_DP                          AS IS_DP2 ,
    SCI.RELATIONSHIP_MANAGER           AS RELATIONSHIP_MANAGER2 ,
    SCI.IS_RELEASED                    AS IS_RELEASED2 ,
    SCI.GRADE                          AS GRADE2 ,
    SCI.IS_SECURED                     AS IS_SECURED2 ,
    SCI.IS_ADHOC                       AS IS_ADHOC2 ,
    SCI.FACILITY_CAT                   AS FACILITY_CAT2 ,
    SCI.GUARANTEE                      AS GUARANTEE2 ,
    SCI.SUB_PARTY_NAME                 AS SUB_PARTY_NAME2 ,
    SCI.SUB_FACILITY_NAME              AS SUB_FACILITY_NAME2 ,
    SCI.LIABILITY_ID                   AS LIABILITY_ID2 ,
    SCI.ADHOC_LMT_AMOUNT               AS ADHOC_LMT_AMOUNT2 ,
    SCI.IS_ADHOC_TOSUM                 AS IS_ADHOC_TOSUM2 ,
    SCI.TOTAL_RELEASED_AMOUNT          AS TOTAL_RELEASED_AMOUNT2 ,
    SCI.OTHER_PURPOSE                  AS OTHER_PURPOSE2 ,
    XREF.CMS_LSP_SYS_XREF_ID           AS CMS_LSP_SYS_XREF_ID3 ,
    XREF.LSX_ID                        AS LSX_ID3 ,
    XREF.LSX_LE_ID                     AS LSX_LE_ID3 ,
    XREF.LSX_BKG_LOCTN_ID              AS LSX_BKG_LOCTN_ID3 ,
    XREF.LSX_LSP_ID                    AS LSX_LSP_ID3 ,
    XREF.LSX_EXT_SYS_CODE_NUM          AS LSX_EXT_SYS_CODE_NUM3 ,
    XREF.LSX_EXT_SYS_CODE_VALUE        AS LSX_EXT_SYS_CODE_VALUE3 ,
    XREF.LSX_EXT_SYS_CUST_ID           AS LSX_EXT_SYS_CUST_ID3 ,
    XREF.LSX_EXT_SYS_CUST_NAME         AS LSX_EXT_SYS_CUST_NAME3 ,
    XREF.LSX_EXT_SYS_ACCT_NUM          AS LSX_EXT_SYS_ACCT_NUM3 ,
    XREF.LSX_ACCT_STATUS_TEXT          AS LSX_ACCT_STATUS_TEXT3 ,
    XREF.CREATE_USER_ID                AS CREATE_USER_ID3 ,
    XREF.LAST_UPDATE_USER_ID           AS LAST_UPDATE_USER_ID3 ,
    XREF.VERIFY_USER_ID                AS VERIFY_USER_ID3 ,
    XREF.CREATE_DATE                   AS CREATE_DATE3 ,
    XREF.LAST_UPDATE_DATE              AS LAST_UPDATE_DATE3 ,
    XREF.VERIFY_DATE                   AS VERIFY_DATE3 ,
    XREF.UPDATE_COUNT                  AS UPDATE_COUNT3 ,
    XREF.UPDATE_STATUS_IND             AS UPDATE_STATUS_IND3 ,
    XREF.CHANGE_IND                    AS CHANGE_IND3 ,
    XREF.CMS_LE_SUB_PROFILE_ID         AS CMS_LE_SUB_PROFILE_ID3 ,
    XREF.ACCOUNT_DESC_NUM              AS ACCOUNT_DESC_NUM3 ,
    XREF.ACCOUNT_DESC_VALUE            AS ACCOUNT_DESC_VALUE3 ,
    XREF.LSX_EXT_SYS_ACCT_SEQ          AS LSX_EXT_SYS_ACCT_SEQ3 ,
    XREF.LSX_FAC_CODE                  AS LSX_FAC_CODE3 ,
    XREF.LSX_FAC_SEQ                   AS LSX_FAC_SEQ3 ,
    XREF.LSX_EXT_CTY_CODE_VALUE        AS LSX_EXT_CTY_CODE_VALUE3 ,
    XREF.ACCT_DELQ_IND                 AS ACCT_DELQ_IND3 ,
    XREF.ACCT_EFFECTIVE_DATE           AS ACCT_EFFECTIVE_DATE3 ,
    XREF.ACCT_STATUS                   AS ACCT_STATUS3 ,
    XREF.LSX_BCA_REF_NUM               AS LSX_BCA_REF_NUM3 ,
    XREF.LSX_LMT_ID                    AS LSX_LMT_ID3 ,
    XREF.LSX_BKG_LOCTN_CTRY            AS LSX_BKG_LOCTN_CTRY3 ,
    XREF.LSX_BKG_LOCTN_ORG             AS LSX_BKG_LOCTN_ORG3 ,
    XREF.LSX_EXT_SYS_ACCT_TYPE         AS LSX_EXT_SYS_ACCT_TYPE3 ,
    XREF.ACCT_RV                       AS ACCT_RV3 ,
    XREF.ACCT_RV_CCY                   AS ACCT_RV_CCY3 ,
    XREF.FIRST_DISBURSEMENT_DATE       AS FIRST_DISBURSEMENT_DATE3 ,
    XREF.FINAL_DISBURSEMENT_DATE       AS FINAL_DISBURSEMENT_DATE3 ,
    XREF.CMS_SEC_COVERAGE_AMT          AS CMS_SEC_COVERAGE_AMT3 ,
    XREF.CMS_OUTSTANDING_AMT           AS CMS_OUTSTANDING_AMT3 ,
    XREF.LAST_ALLOCATION_DATE          AS LAST_ALLOCATION_DATE3 ,
    XREF.OUTSTANDING_AMT_CCY           AS OUTSTANDING_AMT_CCY3 ,
    XREF.SEC_COVERAGE_AMT_CCY          AS SEC_COVERAGE_AMT_CCY3 ,
    XREF.SERIAL_NO                     AS SERIAL_NO3 ,
    XREF.INTEREST_RATE_TYPE            AS INTEREST_RATE_TYPE3 ,
    XREF.INT_RATE_FLOATING_TYPE        AS INT_RATE_FLOATING_TYPE3 ,
    XREF.INT_RATE_FLOATING_RANGE       AS INT_RATE_FLOATING_RANGE3 ,
    XREF.INT_RATE_FLOATING_MARGIN_FLAG AS INT_RATE_FLOATING_MARGIN_FLAG3 ,
    XREF.INT_RATE_FLOATING_MARGIN      AS INT_RATE_FLOATING_MARGIN3 ,
    XREF.RELEASED_AMOUNT               AS RELEASED_AMOUNT3 ,
    XREF.UTILIZED_AMOUNT               AS UTILIZED_AMOUNT3 ,
    XREF.RELEASE_DATE                  AS RELEASE_DATE3 ,
    XREF.DATE_OF_RESET                 AS DATE_OF_RESET3 ,
    XREF.IS_PERMNT_SSI_CERT            AS IS_PERMNT_SSI_CERT3 ,
    XREF.IS_CAPITAL_MARKET_EXPOSER     AS IS_CAPITAL_MARKET_EXPOSER3 ,
    XREF.IS_REALESTATE_EXPOSER         AS IS_REALESTATE_EXPOSER3 ,
    XREF.ESTATE_TYPE                   AS ESTATE_TYPE3 ,
    XREF.IS_PRIORITY_SECTOR            AS IS_PRIORITY_SECTOR3 ,
    XREF.PRIORITY_SECTOR               AS PRIORITY_SECTOR3 ,
    XREF.SECURITY1                     AS SECURITY13 ,
    XREF.SECURITY2                     AS SECURITY23 ,
    XREF.SECURITY3                     AS SECURITY33 ,
    XREF.FACILITY_SYSTEM_ID            AS FACILITY_SYSTEM_ID3 ,
    XREF.LINE_NO                       AS LINE_NO3 ,
    XREF.FACILITY_SYSTEM               AS FACILITY_SYSTEM3 ,
    XREF.INT_RATE_FIX                  AS INT_RATE_FIX3 ,
    XREF.COMM_REAL_ESTATE_TYPE         AS COMM_REAL_ESTATE_TYPE3 ,
    XREF.SECURITY4                     AS SECURITY43 ,
    XREF.SECURITY5                     AS SECURITY53 ,
    XREF.SECURITY6                     AS SECURITY63 ,
    XREF.UPLOAD_STATUS                 AS UPLOAD_STATUS3 ,
    XREF.UP_FOREIGN_CUR_CODE           AS UP_FOREIGN_CUR_CODE3 ,
    XREF.UP_FOREIGN_LMT_AMT            AS UP_FOREIGN_LMT_AMT3 ,
    XREF.UP_FOREIGN_UTL_AMT            AS UP_FOREIGN_UTL_AMT3 ,
    bk.CMS_LE_BANKING_METHOD_ID        AS CMS_LE_BANKING_METHOD_ID4 ,
    bk.CMS_LE_MAIN_PROFILE_ID          AS CMS_LE_MAIN_PROFILE_ID4 ,
    bk.CMS_LE_NODAL                    AS CMS_LE_NODAL4 ,
    bk.CMS_LE_LEAD                     AS CMS_LE_LEAD4 ,
    bk.CMS_LE_BANK_ID                  AS CMS_LE_BANK_ID4 ,
    bk.CMS_LE_BANK_TYPE                AS CMS_LE_BANK_TYPE4 ,
    cri.SCI_LE_CRI_ID                  AS SCI_LE_CRI_ID5 ,
    cri.CMS_LE_MAIN_PROFILE_ID         AS CMS_LE_MAIN_PROFILE_ID5 ,
    cri.CUSTOMER_RAM_ID                AS CUSTOMER_RAM_ID5 ,
    cri.CUSTOMER_APR_CODE              AS CUSTOMER_APR_CODE5 ,
    cri.CUSTOMER_EXT_RATING            AS CUSTOMER_EXT_RATING5 ,
    cri.IS_NBFS                        AS IS_NBFS5 ,
    cri.NBFS_A                         AS NBFS_A5 ,
    cri.NBFS_B                         AS NBFS_B5 ,
    cri.IS_PRIORITY_SECTOR             AS IS_PRIORITY_SECTOR5 ,
    cri.MSME_CLASSIFICATION            AS MSME_CLASSIFICATION5 ,
    cri.IS_PERMENENT_SSI_CERT          AS IS_PERMENENT_SSI_CERT5 ,
    cri.IS_WEAKER_SECTION              AS IS_WEAKER_SECTION5 ,
    cri.WEAKER_SECTION                 AS WEAKER_SECTION5 ,
    cri.IS_KISAN_CREDIT_CARD           AS IS_KISAN_CREDIT_CARD5 ,
    cri.IS_MINORITY_COMMUNITY          AS IS_MINORITY_COMMUNITY5 ,
    cri.MINORITY_COMMUNITY             AS MINORITY_COMMUNITY5 ,
    cri.IS_CAPITAL_MARKET_EXPOS        AS IS_CAPITAL_MARKET_EXPOS5 ,
    cri.IS_REAL_ESTATE_EXPOS           AS IS_REAL_ESTATE_EXPOS5 ,
    cri.REAL_ESTATE_EXPOS_TYPE         AS REAL_ESTATE_EXPOS_TYPE5 ,
    cri.REAL_ESTATE_EXPOS_COMM         AS REAL_ESTATE_EXPOS_COMM5 ,
    cri.IS_COMMODITIES_EXPOSER         AS IS_COMMODITIES_EXPOSER5 ,
    cri.IS_SENSITIVE                   AS IS_SENSITIVE5 ,
    cri.COMMODITIES_NAME               AS COMMODITIES_NAME5 ,
    cri.GROSS_INVS_IN_PM               AS GROSS_INVS_IN_PM5 ,
    cri.GROSS_INVS_IN_EQUIP            AS GROSS_INVS_IN_EQUIP5 ,
    cri.PSU                            AS PSU5 ,
    cri.PSU_PERCENTAGE                 AS PSU_PERCENTAGE5 ,
    cri.GOVT_UNDER_TAKING              AS GOVT_UNDER_TAKING5 ,
    cri.IS_PROJECT_FINANCE             AS IS_PROJECT_FINANCE5 ,
    cri.IS_INFRASTRUCTURE_FINANACE     AS IS_INFRASTRUCTURE_FINANACE5 ,
    cri.INFRASTRUCTURE_FINANACE_TYPE   AS INFRASTRUCTURE_FINANACE_TYPE5 ,
    cri.IS_SEMS_GUIDE_APPLICABLE       AS IS_SEMS_GUIDE_APPLICABLE5 ,
    cri.IS_FAIL_IFC_EXCLU_LIST         AS IS_FAIL_IFC_EXCLU_LIST5 ,
    cri.IS_TUFS                        AS IS_TUFS5 ,
    cri.IS_RBI_DEFAULTER               AS IS_RBI_DEFAULTER5 ,
    cri.RBI_DEFAULTER                  AS RBI_DEFAULTER5 ,
    cri.IS_LITIGATION                  AS IS_LITIGATION5 ,
    cri.LITIGATION_BY                  AS LITIGATION_BY5 ,
    cri.IS_INTEREST_OF_BANK            AS IS_INTEREST_OF_BANK5 ,
    cri.INTEREST_OF_BANK               AS INTEREST_OF_BANK5 ,
    cri.IS_ADVERSE_REMARK              AS IS_ADVERSE_REMARK5 ,
    cri.ADVERSE_REMARK                 AS ADVERSE_REMARK5 ,
    cri.AUDIT_TYPE                     AS AUDIT_TYPE5 ,
    cri.AVG_ANNUAL_TURNOVER            AS AVG_ANNUAL_TURNOVER5 ,
    cri.INDUSTRY_EXPOSER               AS INDUSTRY_EXPOSER5 ,
    cri.IS_DIREC_OTHER_BANK            AS IS_DIREC_OTHER_BANK5 ,
    cri.DIREC_OTHER_BANK               AS DIREC_OTHER_BANK5 ,
    cri.IS_PARTNER_OTHER_BANK          AS IS_PARTNER_OTHER_BANK5 ,
    cri.PARTNER_OTHER_BANK             AS PARTNER_OTHER_BANK5 ,
    cri.IS_SUBSTANTIAL_OTHER_BANK      AS IS_SUBSTANTIAL_OTHER_BANK5 ,
    cri.SUBSTANTIAL_OTHER_BANK         AS SUBSTANTIAL_OTHER_BANK5 ,
    cri.IS_HDFC_DIREC_RLTV             AS IS_HDFC_DIREC_RLTV5 ,
    cri.HDFC_DIREC_RLTV                AS HDFC_DIREC_RLTV5 ,
    cri.IS_OBK_DIREC_RLTV              AS IS_OBK_DIREC_RLTV5 ,
    cri.OBK_DIREC_RLTV                 AS OBK_DIREC_RLTV5 ,
    cri.IS_PARTNER_DIREC_RLTV          AS IS_PARTNER_DIREC_RLTV5 ,
    cri.PARTNER_DIREC_RLTV             AS PARTNER_DIREC_RLTV5 ,
    cri.IS_SUBSTANTIAL_RLTV_HDFC_OTHER AS IS_SUBSTTIAL_RLTV_HDFC_OTHER5 ,
    cri.SUBSTANTIAL_RLTV_HDFC_OTHER    AS SUBSTANTIAL_RLTV_HDFC_OTHER5 ,
    cri.DIREC_HDFC_OTHER               AS DIREC_HDFC_OTHER5 ,
    cri.IS_BACKED_BY_GOVT              AS IS_BACKED_BY_GOVT5 ,
    cri.GOVT_SCHEME_TYPE               AS GOVT_SCHEME_TYPE5 ,
    cri.FIRST_YEAR                     AS FIRST_YEAR5 ,
    cri.SECOND_YEAR                    AS SECOND_YEAR5 ,
    cri.THIRD_YEAR                     AS THIRD_YEAR5 ,
    cri.SECOND_YEAR_TURNOVER           AS SECOND_YEAR_TURNOVER5 ,
    cri.FIRST_YEAR_TURNOVER            AS FIRST_YEAR_TURNOVER5 ,
    cri.THIRD_YEAR_TURNOVER            AS THIRD_YEAR_TURNOVER5 ,
    cri.FIRST_YEAR_TURNOVER_CURRENCY   AS FIRST_YEAR_TURNOVER_CURRENCY5 ,
    cri.SECOND_YEAR_TURNOVER_CURRENCY  AS SECOND_YEAR_TURNOVER_CURRENCY5 ,
    cri.THIRD_YEAR_TURNOVER_CURRENCY   AS THIRD_YEAR_TURNOVER_CURRENCY5 ,
    dr.CMS_LE_DIRECTOR_ID              AS CMS_LE_DIRECTOR_ID6 ,
    dr.CMS_LE_MAIN_PROFILE_ID          AS CMS_LE_MAIN_PROFILE_ID6 ,
    dr.RELATED_TYPE                    AS RELATED_TYPE6 ,
    dr.RELATIONSHIP_TYPE               AS RELATIONSHIP_TYPE6 ,
    dr.DIR_EMAIL                       AS DIR_EMAIL6 ,
    dr.DIR_FAX                         AS DIR_FAX6 ,
    dr.DIR_TEL_NO                      AS DIR_TEL_NO6 ,
    dr.DIR_COUNTRY                     AS DIR_COUNTRY6 ,
    dr.DIR_STATE                       AS DIR_STATE6 ,
    dr.DIR_CITY                        AS DIR_CITY6 ,
    dr.DIR_REGION                      AS DIR_REGION6 ,
    dr.DIR_POST_CODE                   AS DIR_POST_CODE6 ,
    dr.DIR_ADD3                        AS DIR_ADD36 ,
    dr.DIR_ADD2                        AS DIR_ADD26 ,
    dr.DIR_ADD1                        AS DIR_ADD16 ,
    dr.PERCENT_OF_CTRL                 AS PERCENT_OF_CTRL6 ,
    dr.FULL_NAME                       AS FULL_NAME6 ,
    dr.NAME_PREFIX                     AS NAME_PREFIX6 ,
    dr.BUSSNESS_NAME                   AS BUSSNESS_NAME6 ,
    dr.DIR_PAN                         AS DIR_PAN6 ,
    dr.RELATED_DUNS_NO                 AS RELATED_DUNS_NO6 ,
    dr.DIN_NO                          AS DIN_NO6 ,
    dr.DIR_NAME                        AS DIR_NAME6 ,
    dr.DIR_STD_CODE_TELEX              AS DIR_STD_CODE_TELEX6 ,
    dr.DIR_STD_CODE_TEL                AS DIR_STD_CODE_TEL6 ,
    udf.CMS_LE_MAIN_PROFILE_ID         AS CMS_LE_MAIN_PROFILE_ID7 ,
    udf.UDF1                           AS UDF17 ,
    udf.UDF2                           AS UDF27 ,
    udf.UDF3                           AS UDF37 ,
    udf.UDF4                           AS UDF47 ,
    udf.UDF5                           AS UDF57 ,
    udf.UDF6                           AS UDF67 ,
    udf.UDF7                           AS UDF77 ,
    udf.UDF8                           AS UDF87 ,
    udf.UDF9                           AS UDF97 ,
    udf.UDF10                          AS UDF107 ,
    udf.UDF11                          AS UDF117 ,
    udf.UDF12                          AS UDF127 ,
    udf.UDF13                          AS UDF137 ,
    udf.UDF14                          AS UDF147 ,
    udf.UDF15                          AS UDF157 ,
    udf.UDF16                          AS UDF167 ,
    udf.UDF17                          AS UDF177 ,
    udf.UDF18                          AS UDF187 ,
    udf.UDF19                          AS UDF197 ,
    udf.UDF20                          AS UDF207 ,
    udf.UDF21                          AS UDF217 ,
    udf.UDF22                          AS UDF227 ,
    udf.UDF23                          AS UDF237 ,
    udf.UDF24                          AS UDF247 ,
    udf.UDF25                          AS UDF257 ,
    udf.UDF26                          AS UDF267 ,
    udf.UDF27                          AS UDF277 ,
    udf.UDF28                          AS UDF287 ,
    udf.UDF29                          AS UDF297 ,
    udf.UDF30                          AS UDF307 ,
    udf.UDF31                          AS UDF317 ,
    udf.UDF32                          AS UDF327 ,
    udf.UDF33                          AS UDF337 ,
    udf.UDF34                          AS UDF347 ,
    udf.UDF35                          AS UDF357 ,
    udf.UDF36                          AS UDF367 ,
    udf.UDF37                          AS UDF377 ,
    udf.UDF38                          AS UDF387 ,
    udf.UDF39                          AS UDF397 ,
    udf.UDF40                          AS UDF407 ,
    udf.UDF41                          AS UDF417 ,
    udf.UDF42                          AS UDF427 ,
    udf.UDF43                          AS UDF437 ,
    udf.UDF44                          AS UDF447 ,
    udf.UDF45                          AS UDF457 ,
    udf.UDF46                          AS UDF467 ,
    udf.UDF47                          AS UDF477 ,
    udf.UDF48                          AS UDF487 ,
    udf.UDF49                          AS UDF497 ,
    udf.UDF50                          AS UDF507 ,
    udf.UDF51                          AS UDF517 ,
    udf.UDF52                          AS UDF527 ,
    udf.UDF53                          AS UDF537 ,
    udf.UDF54                          AS UDF547 ,
    udf.UDF55                          AS UDF557 ,
    udf.UDF56                          AS UDF567 ,
    udf.UDF57                          AS UDF577 ,
    udf.UDF58                          AS UDF587 ,
    udf.UDF59                          AS UDF597 ,
    udf.UDF60                          AS UDF607 ,
    udf.UDF61                          AS UDF617 ,
    udf.UDF62                          AS UDF627 ,
    udf.UDF63                          AS UDF637 ,
    udf.UDF64                          AS UDF647 ,
    udf.UDF65                          AS UDF657 ,
    udf.UDF66                          AS UDF667 ,
    udf.UDF67                          AS UDF677 ,
    udf.UDF68                          AS UDF687 ,
    udf.UDF69                          AS UDF697 ,
    udf.UDF70                          AS UDF707 ,
    udf.UDF71                          AS UDF717 ,
    udf.UDF72                          AS UDF727 ,
    udf.UDF73                          AS UDF737 ,
    udf.UDF74                          AS UDF747 ,
    udf.UDF75                          AS UDF757 ,
    udf.UDF76                          AS UDF767 ,
    udf.UDF77                          AS UDF777 ,
    udf.UDF78                          AS UDF787 ,
    udf.UDF79                          AS UDF797 ,
    udf.UDF80                          AS UDF807 ,
    udf.UDF81                          AS UDF817 ,
    udf.UDF82                          AS UDF827 ,
    udf.UDF83                          AS UDF837 ,
    udf.UDF84                          AS UDF847 ,
    udf.UDF85                          AS UDF857 ,
    udf.UDF86                          AS UDF867 ,
    udf.UDF87                          AS UDF877 ,
    udf.UDF88                          AS UDF887 ,
    udf.UDF89                          AS UDF897 ,
    udf.UDF90                          AS UDF907 ,
    udf.UDF91                          AS UDF917 ,
    udf.UDF92                          AS UDF927 ,
    udf.UDF93                          AS UDF937 ,
    udf.UDF94                          AS UDF947 ,
    udf.UDF95                          AS UDF957 ,
    udf.UDF96                          AS UDF967 ,
    udf.UDF97                          AS UDF977 ,
    udf.UDF98                          AS UDF987 ,
    udf.UDF99                          AS UDF997 ,
    udf.UDF100                         AS UDF1007 ,
    SEC.CMS_COLLATERAL_ID              AS SECURITY_ID,
    Sub.SECURITY_TYPE_NAME             AS SECURITY_TYPE,
    sub.SUBTYPE_NAME                   AS SECURITY_SUB_TYPE,
    sec.sci_security_currency          AS CURRENCY,
    ' '                                 AS DEPOSITE_RECIPT_NO,
    ' '                                 AS DEPOSITOR_NAME,
    ' '                                 AS DEPOSIT_AMOUNT,
    ' '                                 AS LIEN_AMOUNT ,
    ' '                                 AS INTEREST_RATE,
    ' '                                 AS DEPOSIT_DATE,
    ' '                                 AS DEPOSIT_MATURITY_DATE ,
    ' '                                 AS GUARANTERS_NAME,
    ' '                                 AS Reference_Number_of_Guarantee,
    ' '                                 AS Networth,
    ' '                                 AS Networth_Date,
    ' '                                 AS Start_Date_Of_Guarantee,
    ' '                                 AS security_maturity_date,
    ' '                                 AS GUARANTOR_TYPE,
    ' '                                 AS GUARANTERS_NAME_PREFIX,
    ' '                                 AS GUARANTERS_FULL_NAME,
    ' '                                 AS GUARANTOR_NATURE,
    ' '                                 AS RAMID,
    ' '                                 AS ADDRESS_LINE1,
    ' '                                 AS ADDRESS_LINE2,
    ' '                                 AS ADDRESS_LINE3,
    prty.OTHER_CITY                    AS CITY,
       
     cms_state.STATE_NAME     AS STATE,
     cms_REGION.REGION_NAME  AS REGION,
    cms_country.country_NAME   AS COUNTRY,
    ' '                                        AS PINCODE,
    ' '                                        AS discription_of_assets,
    TO_CHAR(SEC.CMV)                          AS SECURITY_AMOUNT,
    ' '                                        AS GROSS_AMOUNT,
    ' '                                        AS DUE_DATE,
    ' '                                        AS CURRENT_ASSET,
    ' '                                        AS LONABLE_AMOUNT ,
    ' '                                        AS POLICY_NO,
    ' '                                        AS STARE_DATE,
    ' '                                        AS EXPIRY_DATE,
    ' '                                        AS VALUATIOIN_DATE,
    ' '                                        AS VALUATION_AMOUNT,
    TO_CHAR(SEC.REVAL_FREQ)                   AS REVALUATION_FRQUENCY,
    TO_CHAR(SEC.NEXT_VALUATION_DATE)          AS NEXT_VALUATION_DATE,
    TO_CHAR(SEC.CHANGE_TYPE)                  AS CHARGE_TYPE,
    ' '                                        AS MATURITY_DATE,
    ' '                                        AS START_DATE,
    ' '                                        AS RAM_ID,
    ' '                                        AS CHEQUE_AMOUNT,
    ' '                                        AS CHEQUE_NUMBER,
    ' '                                        AS PHY_INSPECTION_DONE,
    ' '                                        AS PHY_INSPECTION_FREQ,
    ' '                                        AS LAST_PHY_INSPECT_DATE,
    ' '                                        AS NEXT_PHY_INSPECT_DATE,
    TO_CHAR(prty.PROPERTY_TYPE)               AS PROPERTY_TYPE,
    TO_CHAR(prty.MARGAGE_TYPE)                AS MARGAGE_TYPE,
    TO_CHAR(prty.VALUATION_DATE,'DD-Mon-YYYY')AS VALUATION_DATE,
    TO_CHAR(prty.MORGAGE_CREATED_BY)          AS MORGAGE_CREATED_BY,
    TO_CHAR(prty.TOTAL_PROPERTY_AMOUNT)       AS TOTAL_PROPERTY_AMOUNT,
    TO_CHAR(prty.CLAIM)                       AS PRIOR_CLAIM,
    TO_CHAR(prty.CLAIM_TYPE)                  AS TYPE_OF_CLAIM,
    TO_CHAR(prty.MORTAGE_REGISTERED_REF)      AS MORTAGE_REGISTERED_REF,
    TO_CHAR(prty.VALUATOR_COMPANY)            AS VALUATOR_COMPANY,
    TO_CHAR(prty.ADVOCATE_LAWYER_NAME)        AS ADVOCATE_LAWYER_NAME,
    TO_CHAR(prty.BUILTUP_AREA)                AS BUILTUP_AREA,
    TO_CHAR(prty.PROPERTY_ADDRESS)            AS PROPERTY_ADDRESS,
    TO_CHAR(replace(prty.DESCRIPTION_ASSET,'
',' '))           AS description_asset,
        ' ' AS NO_OF_UNITS,
    ' ' AS STOCK_CODE,
    ' ' AS bond_name,
    ' ' AS UNIT_PRICE,
    ' ' AS Total_Value
  FROM CMS_SECURITY SEC,
    CMS_SECURITY_SUB_TYPE SUB,
    SECURITY_TYPE TYP,
    SCI_LSP_APPR_LMTS SCI,
    SCI_LSP_SYS_XREF XREF,
        CMS_LIMIT_SECURITY_MAP MAPS,
    (SELECT *
    FROM SCI_LSP_LMTS_XREF_MAP
    WHERE CMS_LSP_LMTS_XREF_MAP_ID IN
      (SELECT (CMS_LSP_LMTS_XREF_MAP_ID)
      FROM SCI_LSP_LMTS_XREF_MAP
      WHERE CMS_LSP_APPR_LMTS_ID IN
        (SELECT CMS_LSP_APPR_LMTS_ID
        FROM SCI_LSP_LMTS_XREF_MAP
        GROUP BY CMS_LSP_APPR_LMTS_ID,
          CMS_LSP_LMTS_XREF_MAP_ID
        )
      )
    ) MAPSS,
    SCI_LSP_LMT_PROFILE PF,
    SCI_LE_SUB_PROFILE SPRO ,
    SCI_LE_MAIN_PROFILE MAN,
    sci_le_cri cri,
    SCI_LE_BANKING_METHOD bk,
    SCI_LE_DIRECTOR dr,
    SCI_LE_UDF udf,
    cms_property prty,
   cms_state,
    cms_REGION,
    cms_country
  WHERE SEC.SECURITY_SUB_TYPE_ID    = SUB.SECURITY_SUB_TYPE_ID
   and cms_state.id(+)  = prty.STATE
    AND cms_state.status(+)= 'ACTIVE'
    and cms_REGION.id(+)  = prty.REGION
    AND cms_REGION.status(+)= 'ACTIVE'
    
     and cms_country.id(+)  = prty.COUNTRY
    AND cms_country.status(+)= 'ACTIVE'
    
  AND SUB.SECURITY_TYPE_ID          = TYP.SECURITY_TYPE_ID
  AND SEC.CMS_COLLATERAL_ID         = MAPS.CMS_COLLATERAL_ID
  AND MAPS.CMS_LSP_APPR_LMTS_ID     = SCI.CMS_LSP_APPR_LMTS_ID
  AND SCI.CMS_LIMIT_PROFILE_ID      = PF.CMS_LSP_LMT_PROFILE_ID
  AND PF.CMS_CUSTOMER_ID            = Spro.CMS_LE_SUB_PROFILE_ID
  AND SPRO.CMS_LE_MAIN_PROFILE_ID   = MAN.CMS_LE_MAIN_PROFILE_ID
  AND cri.cms_le_main_profile_id(+) = MAN.CMS_LE_MAIN_PROFILE_ID
  AND SCI.CMS_LSP_APPR_LMTS_ID      = MAPSS.CMS_LSP_APPR_LMTS_ID
  AND MAPSS.CMS_LSP_SYS_XREF_ID     = XREF.CMS_LSP_SYS_XREF_ID
  AND prty.cms_collateral_id(+)     = sec.cms_collateral_id
  AND spro.status                   = 'ACTIVE'
      AND SUB.SECURITY_SUB_TYPE_ID = 'PT701'
  AND sec.cms_collateral_id   IN
    (SELECT CMS_COLLATERAL_ID FROM CMS_PROPERTY
    )
  AND (MAPS.update_status_ind      <> 'D'
  OR MAPS.update_status_ind        IS NULL)
  AND ( prty.IS_PHY_INSPECT        <>'N'
  OR prty.PHY_INSPECT_FREQ         <> 0
  OR prty.LAND_AREA                <> 0
  OR prty.TENURE                   <> 0
  OR prty.REMAINING_TENURE         <> 0
  OR prty.QUIT_RENT_PAID           <> '-1'
  OR prty.BUILTUP_AREA             <> 0
  OR prty.SALE_PURCHASE_VALUE      <> '-1'
  OR prty.STD_QUIT_RENT            <> 'N'
  OR prty.NON_STD_QUIT_RENT        <> 'N'
  OR prty.QUIT_RENT_RECEIPT        <> 'N'
  OR prty.ASSESSMENT               <> 'N'
  OR prty.COMBINED_VALUE_AMT       <> 0
  OR prty.VALUE_NUMBER             <> 0
  OR PRTY.ASSESSMENT_PERIOD        <>0
  OR PRTY.ASSUMPTION               <> 'N'
  OR PRTY.PROPERTY_TYPE            IS NOT NULL
  OR PRTY.MARGAGE_TYPE             IS NOT NULL )
  AND bk.CMS_LE_MAIN_PROFILE_ID(+)  = MAN.CMS_LE_MAIN_PROFILE_ID
  AND dr.CMS_LE_MAIN_PROFILE_ID(+)  = MAN.CMS_LE_MAIN_PROFILE_ID
  AND udf.CMS_LE_MAIN_PROFILE_ID(+) = MAN.CMS_LE_MAIN_PROFILE_ID;

   COMMENT ON MATERIALIZED VIEW "MV_RBIFYDATADEC15_8"  IS 'snapshot table for snapshot CLIMSHDFCTEST1304.MV_RBIFYDATADEC15_8';
--------------------------------------------------------
--  DDL for Materialized View PARTY_CAM_UPLOAD_MV
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "PARTY_CAM_UPLOAD_MV" ("LSP_LE_ID")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS ((SELECT sub.lsp_le_id
FROM transaction tr,
  sci_le_sub_profile sub
WHERE tr.reference_id  =sub.cms_le_sub_profile_id
AND sub.status         ='ACTIVE'
AND tr.transaction_type='CUSTOMER'
AND tr.status          ='ACTIVE'
)
intersect
  (SELECT cam.llp_le_id
  FROM transaction tr,
    sci_lsp_lmt_profile cam
  WHERE tr.status               ='ACTIVE'
  AND CAM.CMS_LSP_LMT_PROFILE_ID=TR.REFERENCE_ID
  AND cam.cms_bca_status        !='DELETED'
  AND tr.transaction_type       ='LIMITPROFILE'
  ));

   COMMENT ON MATERIALIZED VIEW "PARTY_CAM_UPLOAD_MV"  IS 'snapshot table for snapshot CLIMSHDFCTEST1304.PARTY_CAM_UPLOAD_MV';
--------------------------------------------------------
--  DDL for Materialized View RECP_CUSTOMER_LEGAL_VIEW
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "RECP_CUSTOMER_LEGAL_VIEW" ("BUSINESS_DATE", "DATA_SOURCE_ID", "CUSTOMER_BKEY", "VIABILITY_CODE", "VIABILITY_STUDY_UNDERTAKEN_IND", "POTENTIALLY_VIABLE_IND", "UNDER_NURSING_IND", "PRIORITY_SECTOR_CODE", "CUSTOMER_TYPE_CODE", "IRAC_STATUS_CODE", "IRAC_CLASSIFICATION_DATE", "LEGAL_SUIT_STATUS", "OTHER_BANKERS", "COMPANY_DIRECTOR1_NAME", "COMPANY_DIRECTOR2_NAME", "FILED_WITH_LEGAL_IND", "DECIDED_BY_LEGAL_IND", "PENDING_WITH_LEGAL_IND", "FILING_COST_AMT", "LEGAL_ENTITY_IND", "NOTICES_ISSUED_COUNT", "INVOLVED_AMT", "RECOVERED_AMT", "OUTSTANDING_SUIT_AMT", "COMPROMISE_PROPOSAL_AMT", "IS_WILFUL_IND", "COMPANY_DIRECTOR3_NAME", "COMPANY_DIRECTOR4_NAME", "COMPANY_DIRECTOR5_NAME", "COMPANY_DIRECTOR6_NAME", "COMPANY_DIRECTOR7_NAME", "COMPANY_DIRECTOR8_NAME", "COMPANY_DIRECTOR9_NAME", "COMPANY_DIRECTOR10_NAME", "COMPANY_DIRECTOR11_NAME", "COMPANY_DIRECTOR12_NAME", "COMPANY_DIRECTOR13_NAME", "COMPANY_DIRECTOR14_NAME", "COMPANY_DIRECTOR15_NAME", "COMPANY_DIRECTOR16_NAME", "COMPANY_DIRECTOR17_NAME", "COMPANY_DIRECTOR18_NAME", "COMPANY_DIRECTOR19_NAME", "COMPANY_DIRECTOR20_NAME", "CURRENCY_CODE", "ADDRESS_LINE_1", "ADDRESS_LINE_2", "ADDRESS_LINE_3", "ADDRESS_LINE_4", "CITY_CODE", "STATE_CODE", "COMPANY_DIRECTOR1_IDENT_NO", "COMPANY_DIRECTOR2_IDENT_NO", "COMPANY_DIRECTOR3_IDENT_NO", "COMPANY_DIRECTOR4_IDENT_NO", "COMPANY_DIRECTOR5_IDENT_NO", "COMPANY_DIRECTOR6_IDENT_NO", "COMPANY_DIRECTOR7_IDENT_NO", "COMPANY_DIRECTOR8_IDENT_NO", "COMPANY_DIRECTOR9_IDENT_NO", "COMPANY_DIRECTOR10_IDENT_NO", "COMPANY_DIRECTOR11_IDENT_NO", "COMPANY_DIRECTOR12_IDENT_NO", "COMPANY_DIRECTOR13_IDENT_NO", "COMPANY_DIRECTOR14_IDENT_NO", "COMPANY_DIRECTOR15_IDENT_NO", "COMPANY_DIRECTOR16_IDENT_NO", "COMPANY_DIRECTOR17_IDENT_NO", "COMPANY_DIRECTOR18_IDENT_NO", "COMPANY_DIRECTOR19_IDENT_NO", "COMPANY_DIRECTOR20_IDENT_NO", "OTHER_DIRECTOR_NAME", "COUNTRY_CODE", "NO_OF_RECOVERY", "NO_OF_COMPROMISE", "BORROWER_PARTY_ID", "CUSTOMER_SOURCE_SYSTEM", "PARTY_BKEY", "SARFAESI_FLAG", "DRT_FLAG", "LOK_ADALAT_FLAG", "DEFAULTER_NON_SUIT_ABOVE_1_CRO", "PARTY_NAME", "PARTY_SEGMENT", "EXTRACTDATE")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS (SELECT CAST( NULL AS CHAR(1 BYTE) )BUSINESS_DATE,
    CAST( NULL AS       CHAR(1 BYTE) )DATA_SOURCE_ID,
    SPRO.LSP_LE_ID AS Customer_Bkey,
    --    (SELECT UDF64
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Viability_Code, --VIABILITY
    UDF1.UDF64 AS Viability_Code, --VIABILITY
    CAST( NULL AS CHAR(1 BYTE) )VIABILITY_STUDY_UNDERTAKEN_IND,
    CAST( NULL AS CHAR(1 BYTE) )POTENTIALLY_VIABLE_IND,
    CAST( NULL AS CHAR(1 BYTE) )UNDER_NURSING_IND,
    CAST( NULL AS CHAR(1 BYTE) )PRIORITY_SECTOR_CODE,
    --    (SELECT UDF50
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Customer_Type_Code, --Type of Non-SSI Unit
    UDF1.UDF50 AS Customer_Type_Code,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'ASSET_ClASSIFICATION'
    --    AND entry_code      = pf.ASSET_CLASSIFICATION
    --    ) AS IRAC_Status_Code,
    ac.ENTRY_NAME AS IRAC_Status_Code,
    --    (SELECT UDF62
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS IRAC_Classification_Date, --NPA Classification Date
    UDF1.UDF62 AS IRAC_Classification_Date,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'SUIT_FILLED_STATUS'
    --    AND entry_code      = spro.SUIT_FILLED_STATUS
    --    ) AS Legal_Suit_Status,
    sf.ENTRY_NAME AS Legal_Suit_Status,
    COALESCE (
    (SELECT OTHER_BANK.BANK_NAME
      ||'-'
      ||OTHERBANKBRANCH.BRANCH_NAME
    FROM CMS_OTHER_BANK_BRANCH OTHERBANKBRANCH,
      CMS_OTHER_BANK OTHER_BANK
    WHERE BANKING.CMS_LE_BANK_ID = OTHERBANKBRANCH.ID
    AND OTHER_BANK.ID            = OTHERBANKBRANCH.OTHER_BANK_CODE
    AND BANKING.CMS_LE_BANK_TYPE = 'O'
    ),
    (SELECT SYSTEMBANKBRANCH.SYSTEM_BANK_NAME
    FROM CMS_SYSTEM_BANK SYSTEMBANKBRANCH
    WHERE BANKING.CMS_LE_BANK_ID = SYSTEMBANKBRANCH.ID
    AND BANKING.CMS_LE_BANK_TYPE = 'S'
    ) ) AS Other_Bankers,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,1,1) FROM dual
    --    ) AS Company_Director1_Name,
    dv.Company_Director1_Name AS Company_Director1_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,2,1) FROM dual
    --    ) AS Company_Director2_Name,
    dv.Company_Director2_Name AS Company_Director2_Name,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'SUIT_FILLED_STATUS'
    --    AND entry_code      = spro.SUIT_FILLED_STATUS
    --    ) AS Filed_With_Legal_Ind,
    sf.ENTRY_NAME AS Filed_With_Legal_Ind,
    CAST( NULL AS CHAR(1 BYTE) )DECIDED_BY_LEGAL_IND,
    CAST( NULL AS CHAR(1 BYTE) )PENDING_WITH_LEGAL_IND,
    --    (SELECT UDF51
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Filing_Cost_Amt, -- Case Filing Cost (Amt. in Mio)
    UDF1.UDF51 AS Filing_Cost_Amt,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'Entity'
    --    AND entry_code      = spro.ENTITY
    --    ) AS Legal_Entity_Ind,
    en.ENTRY_NAME AS Legal_Entity_Ind,
    --    (SELECT UDF52
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Notices_Issued_Count, -- No. of Legal Notices Issued (Count)
    UDF1.UDF52 AS Notices_Issued_Count,
    --    (SELECT UDF53
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Involved_Amt, -- Case Amt. involved (Amt. in Mio)
    UDF1.UDF53 AS Involved_Amt,
    --    (SELECT UDF54
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Recovered_Amt, -- Case Recovered Amt (Amt. in Mio)
    UDF1.UDF54 AS Recovered_Amt,
    --    (SELECT UDF55
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Outstanding_Suit_Amt, -- Outstanding Suit Amt (Amt. in Mio)
    UDF1.UDF55 AS Outstanding_Suit_Amt,
    --    (SELECT UDF56
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Compromise_Proposal_Amt, -- Compromise Proposal Amt (Amt. in Mio)
    UDF1.UDF56 AS Compromise_Proposal_Amt,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'WILLFUL_DEFAULT_STATUS'
    --    AND entry_code      = spro.WILLFUL_DEFAULT_STATUS
    --    ) AS Is_Wilful_Ind,
    wd.ENTRY_NAME AS Is_Wilful_Ind,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,3,1) FROM dual
    --    ) AS Company_Director3_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,4,1) FROM dual
    --    ) AS Company_Director4_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,5,1) FROM dual
    --    ) AS Company_Director5_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,6,1) FROM dual
    --    ) AS Company_Director6_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,7,1) FROM dual
    --    ) AS Company_Director7_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,8,1) FROM dual
    --    ) AS Company_Director8_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,9,1) FROM dual
    --    ) AS Company_Director9_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,10,1) FROM dual
    --    ) AS Company_Director10_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,11,1) FROM dual
    --    ) AS Company_Director11_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,12,1) FROM dual
    --    ) AS Company_Director12_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,13,1) FROM dual
    --    ) AS Company_Director13_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,14,1) FROM dual
    --    ) AS Company_Director14_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,15,1) FROM dual
    --    ) AS Company_Director15_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,16,1) FROM dual
    --    ) AS Company_Director16_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,17,1) FROM dual
    --    ) AS Company_Director17_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,18,1) FROM dual
    --    ) AS Company_Director18_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,19,1) FROM dual
    --    ) AS Company_Director19_Name,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,20,1) FROM dual
    --    ) AS Company_Director20_Name,
    dv.Company_Director3_Name  AS Company_Director3_Name,
    dv.Company_Director4_Name  AS Company_Director4_Name,
    dv.Company_Director5_Name  AS Company_Director5_Name,
    dv.Company_Director6_Name  AS Company_Director6_Name,
    dv.Company_Director7_Name  AS Company_Director7_Name,
    dv.Company_Director8_Name  AS Company_Director8_Name,
    dv.Company_Director9_Name  AS Company_Director9_Name,
    dv.Company_Director10_Name AS Company_Director10_Name,
    dv.Company_Director11_Name AS Company_Director11_Name,
    dv.Company_Director12_Name AS Company_Director12_Name,
    dv.Company_Director13_Name AS Company_Director13_Name,
    dv.Company_Director14_Name AS Company_Director14_Name,
    dv.Company_Director15_Name AS Company_Director15_Name,
    dv.Company_Director16_Name AS Company_Director16_Name,
    dv.Company_Director17_Name AS Company_Director17_Name,
    dv.Company_Director18_Name AS Company_Director18_Name,
    dv.Company_Director19_Name AS Company_Director19_Name,
    dv.Company_Director20_Name AS Company_Director20_Name,
    --    (SELECT UDF68
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Currency_Code, -- SUIT CASE CURRENCY CASE
    UDF1.UDF68 AS Currency_Code,
    CAST( NULL AS CHAR(1 BYTE) )ADDRESS_LINE_1,
    CAST( NULL AS CHAR(1 BYTE) )ADDRESS_LINE_2,
    CAST( NULL AS CHAR(1 BYTE) )ADDRESS_LINE_3,
    CAST( NULL AS CHAR(1 BYTE) )ADDRESS_LINE_4,
    CAST( NULL AS CHAR(1 BYTE) )CITY_CODE,
    --    (SELECT STATE_NAME
    --    FROM cms_state
    --    WHERE status= 'ACTIVE'
    --    AND id      = ra.LRA_STATE
    --    ) AS State_Code,
    st.STATE_NAME AS State_Code,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,1,2) FROM dual
    --    ) AS Company_Director1_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,2,2) FROM dual
    --    ) AS Company_Director2_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,3,2) FROM dual
    --    ) AS Company_Director3_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,4,2) FROM dual
    --    ) AS Company_Director4_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,5,2) FROM dual
    --    ) AS Company_Director5_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,6,2) FROM dual
    --    ) AS Company_Director6_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,7,2) FROM dual
    --    ) AS Company_Director7_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,8,2) FROM dual
    --    ) AS Company_Director8_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,9,2) FROM dual
    --    ) AS Company_Director9_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,10,2) FROM dual
    --    ) AS Company_Director10_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,11,2) FROM dual
    --    ) AS Company_Director11_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,12,2) FROM dual
    --    ) AS Company_Director12_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,13,2) FROM dual
    --    ) AS Company_Director13_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,14,2) FROM dual
    --    ) AS Company_Director14_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,15,2) FROM dual
    --    ) AS Company_Director15_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,16,2) FROM dual
    --    ) AS Company_Director16_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,17,2) FROM dual
    --    ) AS Company_Director17_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,18,2) FROM dual
    --    ) AS Company_Director18_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,19,2) FROM dual
    --    ) AS Company_Director19_Ident_No,
    --    (SELECT DIR_NAME_NO(MAN.CMS_LE_MAIN_PROFILE_ID,20,2) FROM dual
    --    ) AS Company_Director20_Ident_No,
    dv.Company_Director1_Ident_No  AS Company_Director1_Ident_No,
    dv.Company_Director2_Ident_No  AS Company_Director2_Ident_No,
    dv.Company_Director3_Ident_No  AS Company_Director3_Ident_No,
    dv.Company_Director4_Ident_No  AS Company_Director4_Ident_No,
    dv.Company_Director5_Ident_No  AS Company_Director5_Ident_No,
    dv.Company_Director6_Ident_No  AS Company_Director6_Ident_No,
    dv.Company_Director7_Ident_No  AS Company_Director7_Ident_No,
    dv.Company_Director8_Ident_No  AS Company_Director8_Ident_No,
    dv.Company_Director9_Ident_No  AS Company_Director9_Ident_No,
    dv.Company_Director10_Ident_No AS Company_Director10_Ident_No,
    dv.Company_Director11_Ident_No AS Company_Director11_Ident_No,
    dv.Company_Director12_Ident_No AS Company_Director12_Ident_No,
    dv.Company_Director13_Ident_No AS Company_Director13_Ident_No,
    dv.Company_Director14_Ident_No AS Company_Director14_Ident_No,
    dv.Company_Director15_Ident_No AS Company_Director15_Ident_No,
    dv.Company_Director16_Ident_No AS Company_Director16_Ident_No,
    dv.Company_Director17_Ident_No AS Company_Director17_Ident_No,
    dv.Company_Director18_Ident_No AS Company_Director18_Ident_No,
    dv.Company_Director19_Ident_No AS Company_Director19_Ident_No,
    dv.Company_Director20_Ident_No AS Company_Director20_Ident_No,
    CAST( NULL AS CHAR(1 BYTE) )OTHER_DIRECTOR_NAME,
    CAST( NULL AS CHAR(1 BYTE) )COUNTRY_CODE,
    --    (SELECT UDF57
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS No_Of_Recovery, -- No. Of Recovery/s (Count)
    UDF1.UDF57 AS No_Of_Recovery,
    --    (SELECT UDF58
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS No_Of_Compromise, -- No. Of Compromise/s (Count)
    UDF1.UDF58 AS No_Of_Compromise,
    CAST( NULL AS CHAR(1 BYTE) )BORROWER_PARTY_ID,
    CAST( NULL AS CHAR(1 BYTE) )CUSTOMER_SOURCE_SYSTEM,
    SPRO.LSP_LE_ID AS party_bkey,
    --    (SELECT UDF59
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS sarfaesi_flag, -- Sarfaesi flag
    UDF1.UDF59 AS sarfaesi_flag,
    --    (SELECT UDF60
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS DRT_flag, -- DRT flag
    UDF1.UDF60 AS DRT_flag,
    --    (SELECT UDF61
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    ) AS Lok_adalat_flag, --  Lok Adalat flag
    UDF1.UDF61 AS Lok_adalat_flag,
    --    (SELECT UDF69
    --    FROM sci_le_udf UDF
    --    WHERE UDF.cms_le_main_profile_id = MAN.CMS_LE_MAIN_PROFILE_ID
    --    )                   AS Defaulter_Non_Suit_Above_1_Cro, -- Defaulter Non Suit Above 1 Crore
    UDF1.UDF69          AS Defaulter_Non_Suit_Above_1_Cro,
    SPRO.LSP_Short_name AS party_name,
    --    (SELECT ENTRY_NAME
    --    FROM COMMON_CODE_CATEGORY_ENTRY
    --    WHERE category_code = 'HDFC_SEGMENT'
    --    AND entry_code      = spro.lsp_sgmnt_code_value
    --    ) AS party_segment ,
    hs.ENTRY_NAME AS party_segment ,
    --    (SELECT to_date (param_value,'dd/mm/yyyy')
    --    FROM CMS_GENERAL_PARAM
    --    WHERE param_code = 'APPLICATION_DATE'
    --    ) AS EXTRACTDATE
    to_date (gp.param_value,'dd/mm/yyyy') AS EXTRACTDATE
    --     (CUSTOMERMAKERDATE(Spro.CMS_LE_SUB_PROFILE_ID)) as maker_date,
    --  (CUSTOMERCHEKERDATE(Spro.CMS_LE_SUB_PROFILE_ID)) as checker_date
  FROM SCI_LSP_LMT_PROFILE PF,
    SCI_LE_SUB_PROFILE SPRO ,
    SCI_LE_MAIN_PROFILE MAN,
    SCI_LE_REG_ADDR ra,
    SCI_LE_BANKING_METHOD BANKING,
    sci_le_udf UDF1,
    DIRECTOR_VIEW dv,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'SUIT_FILLED_STATUS'
    ) sf,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'ASSET_ClASSIFICATION'
    ) ac,
    (SELECT * FROM COMMON_CODE_CATEGORY_ENTRY WHERE category_code = 'Entity'
    ) en,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'WILLFUL_DEFAULT_STATUS'
    ) wd,
    (SELECT *
    FROM COMMON_CODE_CATEGORY_ENTRY
    WHERE category_code = 'HDFC_SEGMENT'
    ) hs,
    (SELECT * FROM cms_state WHERE status= 'ACTIVE'
    ) st,
    (SELECT * FROM CMS_GENERAL_PARAM WHERE param_code = 'APPLICATION_DATE'
    ) gp
  WHERE PF.CMS_CUSTOMER_ID           = Spro.CMS_LE_SUB_PROFILE_ID
  AND SPRO.CMS_LE_MAIN_PROFILE_ID    = MAN.CMS_LE_MAIN_PROFILE_ID
  AND spro.status                    = 'ACTIVE'
  AND spro.CMS_LE_MAIN_PROFILE_ID    = ra.CMS_LE_MAIN_PROFILE_ID (+)
  AND ra.LRA_TYPE_VALUE              = 'CORPORATE'
  AND BANKING.cms_le_main_profile_id = spro.cms_le_main_profile_id
  AND UDF1.cms_le_main_profile_id    = MAN.CMS_LE_MAIN_PROFILE_ID
  AND sf.entry_code(+)               = spro.SUIT_FILLED_STATUS
  AND ac.entry_code(+)               = pf.ASSET_CLASSIFICATION
  AND en.entry_code(+)               = spro.ENTITY
  AND hs.entry_code(+)               = spro.lsp_sgmnt_code_value
  AND wd.entry_code(+)               = spro.WILLFUL_DEFAULT_STATUS
  AND st.id(+)                       = ra.LRA_STATE
  AND dv.CMS_LE_MAIN_PROFILE_ID(+)   = spro.cms_le_main_profile_id
  );

   COMMENT ON MATERIALIZED VIEW "RECP_CUSTOMER_LEGAL_VIEW"  IS 'snapshot table for snapshot CLIMSHDFCTEST.RECP_CUSTOMER_LEGAL_VIEW';
--------------------------------------------------------
--  DDL for Materialized View TRANSACTION_USER
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "TRANSACTION_USER" ("TRANSACTION_ID", "FROM_STATE", "USER_ID", "LOGIN_ID", "TRANSACTION_TYPE", "CREATION_DATE", "TRANSACTION_DATE", "REFERENCE_ID", "STATUS", "STAGING_REFERENCE_ID", "TEAM_ID", "VERSION", "REMARKS", "TRX_REFERENCE_ID", "OPSDESC", "LEGAL_NAME", "LEGAL_ID", "CUSTOMER_NAME", "CUSTOMER_ID", "TRX_ORIGIN_COUNTRY", "TRX_ORIGIN_ORGANISATION", "LIMIT_PROFILE_ID", "LIMIT_PROFILE_REF_NUM", "TRX_SEGMENT", "USER_INFO", "CUR_TRX_HISTORY_ID", "TEAM_TYPE_ID", "TRANSACTION_SUBTYPE", "TO_GROUP_TYPE_ID", "TO_GROUP_ID", "TO_USER_ID", "DEAL_NO", "TEAM_MEMBERSHIP_ID", "SYSTEM_DATE", "MIN_EMPLOYEE_GRADE")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
 LOB ("REMARKS") STORE AS BASICFILE (
  TABLESPACE "TS_CLIMSHDFCTEST1304" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS select * from transaction where transaction_type='USER';

   COMMENT ON MATERIALIZED VIEW "TRANSACTION_USER"  IS 'snapshot table for snapshot TRANSACTION_USER';
--------------------------------------------------------
--  DDL for Materialized View TRANS_HISTORY_USER
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "TRANS_HISTORY_USER" ("TR_HISTORY_ID", "TRANSACTION_ID", "FROM_STATE", "TO_STATE", "USER_ID", "LOGIN_ID", "TRANSACTION_TYPE", "TRANSACTION_SUBTYPE", "CREATION_DATE", "TRANSACTION_DATE", "REFERENCE_ID", "STATUS", "STAGING_REFERENCE_ID", "TEAM_ID", "VERSION", "REMARKS", "OPSDESC", "CURCYCLE", "TO_USER_ID", "TO_GROUP_ID", "TRX_REFERENCE_ID", "LEGAL_NAME", "LEGAL_ID", "CUSTOMER_NAME", "CUSTOMER_ID", "TRX_ORIGIN_COUNTRY", "TRX_ORIGIN_ORGANISATION", "LIMIT_PROFILE_ID", "LIMIT_PROFILE_REF_NUM", "TRX_SEGMENT", "TEAM_TYPE_ID", "TO_GROUP_TYPE_ID", "DEAL_NO", "TEAM_MEMBERSHIP_ID", "IP_ADDRESS")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  WITH PRIMARY KEY USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS SELECT "TRANS_HISTORY"."TR_HISTORY_ID" "TR_HISTORY_ID","TRANS_HISTORY"."TRANSACTION_ID" "TRANSACTION_ID","TRANS_HISTORY"."FROM_STATE" "FROM_STATE","TRANS_HISTORY"."TO_STATE" "TO_STATE","TRANS_HISTORY"."USER_ID" "USER_ID","TRANS_HISTORY"."LOGIN_ID" "LOGIN_ID","TRANS_HISTORY"."TRANSACTION_TYPE" "TRANSACTION_TYPE","TRANS_HISTORY"."TRANSACTION_SUBTYPE" "TRANSACTION_SUBTYPE","TRANS_HISTORY"."CREATION_DATE" "CREATION_DATE","TRANS_HISTORY"."TRANSACTION_DATE" "TRANSACTION_DATE","TRANS_HISTORY"."REFERENCE_ID" "REFERENCE_ID","TRANS_HISTORY"."STATUS" "STATUS","TRANS_HISTORY"."STAGING_REFERENCE_ID" "STAGING_REFERENCE_ID","TRANS_HISTORY"."TEAM_ID" "TEAM_ID","TRANS_HISTORY"."VERSION" "VERSION","TRANS_HISTORY"."REMARKS" "REMARKS","TRANS_HISTORY"."OPSDESC" "OPSDESC","TRANS_HISTORY"."CURCYCLE" "CURCYCLE","TRANS_HISTORY"."TO_USER_ID" "TO_USER_ID","TRANS_HISTORY"."TO_GROUP_ID" "TO_GROUP_ID","TRANS_HISTORY"."TRX_REFERENCE_ID" "TRX_REFERENCE_ID","TRANS_HISTORY"."LEGAL_NAME" "LEGAL_NAME","TRANS_HISTORY"."LEGAL_ID" "LEGAL_ID","TRANS_HISTORY"."CUSTOMER_NAME" "CUSTOMER_NAME","TRANS_HISTORY"."CUSTOMER_ID" "CUSTOMER_ID","TRANS_HISTORY"."TRX_ORIGIN_COUNTRY" "TRX_ORIGIN_COUNTRY","TRANS_HISTORY"."TRX_ORIGIN_ORGANISATION" "TRX_ORIGIN_ORGANISATION","TRANS_HISTORY"."LIMIT_PROFILE_ID" "LIMIT_PROFILE_ID","TRANS_HISTORY"."LIMIT_PROFILE_REF_NUM" "LIMIT_PROFILE_REF_NUM","TRANS_HISTORY"."TRX_SEGMENT" "TRX_SEGMENT","TRANS_HISTORY"."TEAM_TYPE_ID" "TEAM_TYPE_ID","TRANS_HISTORY"."TO_GROUP_TYPE_ID" "TO_GROUP_TYPE_ID","TRANS_HISTORY"."DEAL_NO" "DEAL_NO","TRANS_HISTORY"."TEAM_MEMBERSHIP_ID" "TEAM_MEMBERSHIP_ID","TRANS_HISTORY"."IP_ADDRESS" "IP_ADDRESS" FROM "TRANS_HISTORY" "TRANS_HISTORY" WHERE "TRANS_HISTORY"."TRANSACTION_TYPE"='USER';

   COMMENT ON MATERIALIZED VIEW "TRANS_HISTORY_USER"  IS 'snapshot table for snapshot CLIMSHDFCTEST1304.TRANS_HISTORY_USER';
--------------------------------------------------------
--  DDL for Materialized View UBS_UPLOAD_CHK_PARTY_STATUS_MV
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "UBS_UPLOAD_CHK_PARTY_STATUS_MV" ("STATUS", "FACILITY_SYSTEM_ID", "LINE_NO", "SERIAL_NO", "FACILITY_SYSTEM", "LSP_LE_ID")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS (select SPRO.STATUS,XREF.FACILITY_SYSTEM_ID,XREF.LINE_NO,XREF.SERIAL_NO,XREF.facility_system,spro.lsp_le_id
   FROM SCI_LSP_APPR_LMTS SCI,
    SCI_LSP_SYS_XREF XREF,
    SCI_LSP_LMTS_XREF_MAP MAPSS,
    SCI_LSP_LMT_PROFILE PF,
    SCI_LE_SUB_PROFILE SPRO 
    
  WHERE SCI.CMS_LIMIT_PROFILE_ID(+) = PF.CMS_LSP_LMT_PROFILE_ID   
  AND PF.CMS_CUSTOMER_ID(+)         = Spro.CMS_LE_SUB_PROFILE_ID 
  --AND spro.status                   = 'ACTIVE'
  AND SCI.CMS_LSP_APPR_LMTS_ID  = MAPSS.CMS_LSP_APPR_LMTS_ID(+)
  AND MAPSS.CMS_LSP_SYS_XREF_ID = XREF.CMS_LSP_SYS_XREF_ID(+)
  AND XREF.FACILITY_SYSTEM in('UBS-LIMITS'));

   COMMENT ON MATERIALIZED VIEW "UBS_UPLOAD_CHK_PARTY_STATUS_MV"  IS 'snapshot table for snapshot CLIMSHDFCTEST.UBS_UPLOAD_CHK_PARTY_STATUS_MV';
--------------------------------------------------------
--  DDL for Materialized View UBS_UPLOAD_STATUS_MV
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "UBS_UPLOAD_STATUS_MV" ("STATUS", "FACILITY_SYSTEM_ID", "LINE_NO", "SERIAL_NO", "FACILITY_SYSTEM")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS (SELECT SPRO.STATUS,
    XREF.FACILITY_SYSTEM_ID,
    XREF.LINE_NO,
    XREF.SERIAL_NO,
    XREF.facility_system
  FROM SCI_LSP_APPR_LMTS SCI,
    SCI_LSP_SYS_XREF XREF,
    SCI_LSP_LMTS_XREF_MAP MAPSS,
    SCI_LSP_LMT_PROFILE PF,
    SCI_LE_SUB_PROFILE SPRO
  WHERE SCI.CMS_LIMIT_PROFILE_ID(+) = PF.CMS_LSP_LMT_PROFILE_ID
  AND PF.CMS_CUSTOMER_ID(+)         = Spro.CMS_LE_SUB_PROFILE_ID
    --AND spro.status                   = 'ACTIVE'
  AND SCI.CMS_LSP_APPR_LMTS_ID  = MAPSS.CMS_LSP_APPR_LMTS_ID(+)
  AND MAPSS.CMS_LSP_SYS_XREF_ID = XREF.CMS_LSP_SYS_XREF_ID(+)
  AND XREF.FACILITY_SYSTEM     IN ('UBS-LIMITS')
  );

   COMMENT ON MATERIALIZED VIEW "UBS_UPLOAD_STATUS_MV"  IS 'snapshot table for snapshot CLIMSHDFCTEST.UBS_UPLOAD_STATUS_MV';
--------------------------------------------------------
--  DDL for Materialized View UPD_LINE_FAC_MV
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "UPD_LINE_FAC_MV" ("CMS_LSP_SYS_XREF_ID", "LMT_CRRNCY_ISO_CODE", "CMS_LSP_APPR_LMTS_ID", "LINE_NO", "SERIAL_NO", "FACILITY_SYSTEM", "FACILITY_SYSTEM_ID")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_CLIMSHDFCTEST1304" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS (SELECT stg_xref.cms_lsp_sys_xref_id AS cms_lsp_sys_xref_id,
  stg_lmt.lmt_crrncy_iso_code,
  stg_lmt.cms_lsp_appr_lmts_id,
  stg_xref.LINE_NO,
  stg_xref.SERIAL_NO,
  stg_xref.FACILITY_SYSTEM,
  stg_xref.FACILITY_SYSTEM_ID
  
FROM (select cms_lsp_sys_xref_id,FACILITY_SYSTEM,SERIAL_NO,LINE_NO,FACILITY_SYSTEM_ID from CMS_STAGE_LSP_SYS_XREF) stg_xref,
  (select cms_lsp_sys_xref_id,cms_lsp_appr_lmts_id from stage_limit_xref) stg_xref_map,
  (select cms_lsp_appr_lmts_id ,cms_limit_status,lmt_crrncy_iso_code from stage_limit) stg_lmt ,
  (select transaction_type,staging_reference_id,status from transaction) t
WHERE
t.transaction_type            = 'LIMIT'
AND stg_xref.cms_lsp_sys_xref_id  = stg_xref_map.cms_lsp_sys_xref_id
AND stg_lmt.cms_lsp_appr_lmts_id  = stg_xref_map.cms_lsp_appr_lmts_id
AND stg_lmt.cms_lsp_appr_lmts_id  = t.staging_reference_id
AND stg_lmt.cms_limit_status      = 'ACTIVE'
AND t.status                      = 'ACTIVE');

   COMMENT ON MATERIALIZED VIEW "UPD_LINE_FAC_MV"  IS 'snapshot table for snapshot CLIMSHDFCTEST.UPD_LINE_FAC_MV';
