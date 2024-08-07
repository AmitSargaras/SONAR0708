--------------------------------------------------------
--  File created - Monday-March-28-2022   
--------------------------------------------------------
--------------------------------------------------------
--  Constraints for Table ABC_TEST
--------------------------------------------------------

  ALTER TABLE "ABC_TEST" MODIFY ("PARAM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ABC_TEST_01
--------------------------------------------------------

  ALTER TABLE "ABC_TEST_01" MODIFY ("PARAM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table APPLICATIONS
--------------------------------------------------------

  ALTER TABLE "APPLICATIONS" MODIFY ("APPLICATION_NAME" NOT NULL ENABLE);
  ALTER TABLE "APPLICATIONS" MODIFY ("APPLICATION_ID" NOT NULL ENABLE);
  ALTER TABLE "APPLICATIONS" ADD CONSTRAINT "SQL110323174059020" PRIMARY KEY ("APPLICATION_NAME")
  USING INDEX "SQL110323174059020"  ENABLE;
--------------------------------------------------------
--  Constraints for Table AUDIT_CMS_BASEL_DAILY
--------------------------------------------------------

  ALTER TABLE "AUDIT_CMS_BASEL_DAILY" MODIFY ("N_LINE_SERIAL" NOT NULL ENABLE);
  ALTER TABLE "AUDIT_CMS_BASEL_DAILY" MODIFY ("SEC_NAME" NOT NULL ENABLE);
  ALTER TABLE "AUDIT_CMS_BASEL_DAILY" MODIFY ("V_MITIGANT_CODE" NOT NULL ENABLE);
  ALTER TABLE "AUDIT_CMS_BASEL_DAILY" MODIFY ("FIC_MIS_DATE" NOT NULL ENABLE);
  ALTER TABLE "AUDIT_CMS_BASEL_DAILY" MODIFY ("V_F_MITIGANT_SOURCE_SYS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table AUDIT_CMS_BASEL_MONTHLY
--------------------------------------------------------

  ALTER TABLE "AUDIT_CMS_BASEL_MONTHLY" MODIFY ("FIC_MIS_DATE" NOT NULL ENABLE);
  ALTER TABLE "AUDIT_CMS_BASEL_MONTHLY" MODIFY ("V_F_MITIGANT_SOURCE_SYS" NOT NULL ENABLE);
  ALTER TABLE "AUDIT_CMS_BASEL_MONTHLY" MODIFY ("N_F_LINE_SERIAL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table AUDIT_CMS_BASEL_MONTHLY_P2
--------------------------------------------------------

  ALTER TABLE "AUDIT_CMS_BASEL_MONTHLY_P2" MODIFY ("FIC_MIS_DATE" NOT NULL ENABLE);
  ALTER TABLE "AUDIT_CMS_BASEL_MONTHLY_P2" MODIFY ("V_F_MITIGANT_SOURCE_SYS" NOT NULL ENABLE);
  ALTER TABLE "AUDIT_CMS_BASEL_MONTHLY_P2" MODIFY ("N_F_LINE_SERIAL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table AUDIT_RECP_COLLATERAL
--------------------------------------------------------

  ALTER TABLE "AUDIT_RECP_COLLATERAL" MODIFY ("DATA_SOURCE_ID" NOT NULL ENABLE);
  ALTER TABLE "AUDIT_RECP_COLLATERAL" MODIFY ("COLLATERAL_BKEY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BUS_PARAM
--------------------------------------------------------

  ALTER TABLE "BUS_PARAM" MODIFY ("PARAMETER_PK" NOT NULL ENABLE);
  ALTER TABLE "BUS_PARAM" MODIFY ("PARAMETER_CODE" NOT NULL ENABLE);
  ALTER TABLE "BUS_PARAM" MODIFY ("ENTITY_ID" NOT NULL ENABLE);
  ALTER TABLE "BUS_PARAM" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "BUS_PARAM" ADD CONSTRAINT "CC1169518086845" PRIMARY KEY ("PARAMETER_PK")
  USING INDEX "CC1169518086845"  ENABLE;
  ALTER TABLE "BUS_PARAM" ADD CONSTRAINT "UNI_BUS_PARAM" UNIQUE ("PARAMETER_CODE", "PARAMETER_PK")
  USING INDEX "UNI_BUS_PARAM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BUS_PARAM_GRP
--------------------------------------------------------

  ALTER TABLE "BUS_PARAM_GRP" MODIFY ("GROUP_CODE" NOT NULL ENABLE);
  ALTER TABLE "BUS_PARAM_GRP" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "BUS_PARAM_GRP" ADD CONSTRAINT "CC1169518725764" PRIMARY KEY ("GROUP_CODE")
  USING INDEX "CC1169518725764"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CHECKLIST_2012_T
--------------------------------------------------------

  ALTER TABLE "CHECKLIST_2012_T" MODIFY ("CHECKLIST_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CHECKLIST_2013_T
--------------------------------------------------------

  ALTER TABLE "CHECKLIST_2013_T" MODIFY ("CHECKLIST_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CHECKLIST_BKP_23052014
--------------------------------------------------------

  ALTER TABLE "CHECKLIST_BKP_23052014" MODIFY ("CHECKLIST_ID" NOT NULL ENABLE);
  ALTER TABLE "CHECKLIST_BKP_23052014" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CHECKLIST_BKP_23052014" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CHECKLIST_DUPLICATE
--------------------------------------------------------

  ALTER TABLE "CHECKLIST_DUPLICATE" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CHECKLIST_DUPLICATE" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CHECKLIST_ITEM_BKP_23052014
--------------------------------------------------------

  ALTER TABLE "CHECKLIST_ITEM_BKP_23052014" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CHECKLIST_ITEM_BKP_23052014" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CHECKLIST_ITEM_EXPIRY
--------------------------------------------------------

  ALTER TABLE "CHECKLIST_ITEM_EXPIRY" MODIFY ("DOCUMENT_DESCRIPTION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CHECK_ITEM_BKP_23052014
--------------------------------------------------------

  ALTER TABLE "CHECK_ITEM_BKP_23052014" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CHECK_ITEM_BKP_23052014" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_AA_PENDING_PERFECTION
--------------------------------------------------------

  ALTER TABLE "CMS_AA_PENDING_PERFECTION" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_ABCD
--------------------------------------------------------

  ALTER TABLE "CMS_ABCD" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ABCD" MODIFY ("CHECKLISTITEMID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ABCD" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_ADD_DOC_FAC_DET
--------------------------------------------------------

  ALTER TABLE "CMS_ADD_DOC_FAC_DET" MODIFY ("ADD_DOC_FAC_DET_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ADD_DOC_FAC_DET" ADD PRIMARY KEY ("ADD_DOC_FAC_DET_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ADF_RBI_STATUS
--------------------------------------------------------

  ALTER TABLE "CMS_ADF_RBI_STATUS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_AGGR_EXP_BW_BE
--------------------------------------------------------

  ALTER TABLE "CMS_AGGR_EXP_BW_BE" MODIFY ("CMS_AGGR_EXP_BW_BE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_AGGR_EXP_BW_BE_CUST
--------------------------------------------------------

  ALTER TABLE "CMS_AGGR_EXP_BW_BE_CUST" MODIFY ("CMS_AGGR_EXP_BW_BE_CUST_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_AGGR_EXP_CTR
--------------------------------------------------------

  ALTER TABLE "CMS_AGGR_EXP_CTR" MODIFY ("CMS_AGGR_EXP_CTR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_AGGR_EXP_ENTITY
--------------------------------------------------------

  ALTER TABLE "CMS_AGGR_EXP_ENTITY" MODIFY ("CMS_AGGR_EXP_ENTITY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_AGGR_EXP_GRP
--------------------------------------------------------

  ALTER TABLE "CMS_AGGR_EXP_GRP" MODIFY ("CMS_AGGR_EXP_GRP_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_AGGR_EXP_POL
--------------------------------------------------------

  ALTER TABLE "CMS_AGGR_EXP_POL" MODIFY ("CMS_AGGR_EXP_POL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_AGGR_EXP_PROD_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_AGGR_EXP_PROD_TYPE" MODIFY ("CMS_AGGR_EXP_PROD_TYPE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_APPROVAL_MATRIX
--------------------------------------------------------

  ALTER TABLE "CMS_APPROVAL_MATRIX" MODIFY ("APPROVAL_MATRIX_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_APPROVAL_MATRIX" MODIFY ("RISK_GRADE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_ASSET
--------------------------------------------------------

  ALTER TABLE "CMS_ASSET" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASSET" ADD CONSTRAINT "CC1169518763548" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CMS_ASSET_IDX1"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ASSET_AIRCRAFT
--------------------------------------------------------

  ALTER TABLE "CMS_ASSET_AIRCRAFT" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASSET_AIRCRAFT" ADD CONSTRAINT "ASSET_AIRCRAFT_PK" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "ASSET_AIRCRAFT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ASSET_GC_DET
--------------------------------------------------------

  ALTER TABLE "CMS_ASSET_GC_DET" MODIFY ("GC_DET_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASSET_GC_DET" ADD CONSTRAINT "CMS_ASSET_GENERAL_CHRG_DE_PK" PRIMARY KEY ("GC_DET_ID")
  USING INDEX "CMS_ASSET_GENERAL_CHRG_DE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ASSET_GC_DET_2906
--------------------------------------------------------

  ALTER TABLE "CMS_ASSET_GC_DET_2906" MODIFY ("GC_DET_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_ASSET_GC_DET_290601
--------------------------------------------------------

  ALTER TABLE "CMS_ASSET_GC_DET_290601" MODIFY ("GC_DET_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_ASSET_GC_STOCK_DET
--------------------------------------------------------

  ALTER TABLE "CMS_ASSET_GC_STOCK_DET" MODIFY ("GC_STOCK_DET_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASSET_GC_STOCK_DET" ADD CONSTRAINT "CMS_ASSET_GC_STOCK_DET_PK" PRIMARY KEY ("GC_STOCK_DET_ID")
  USING INDEX "CMS_ASSET_GC_STOCK_DET_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ASSET_GOLD
--------------------------------------------------------

  ALTER TABLE "CMS_ASSET_GOLD" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASSET_GOLD" ADD CONSTRAINT "ASSET_GOLD_PK" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "ASSET_GOLD_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ASSET_PDC
--------------------------------------------------------

  ALTER TABLE "CMS_ASSET_PDC" MODIFY ("ASSET_PDC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASSET_PDC" ADD CONSTRAINT "CC1169518793221" PRIMARY KEY ("ASSET_PDC_ID")
  USING INDEX "CC1169518793221"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ASSET_PLANT_EQUIP
--------------------------------------------------------

  ALTER TABLE "CMS_ASSET_PLANT_EQUIP" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASSET_PLANT_EQUIP" ADD CONSTRAINT "ASSET_PLANT_PK" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "ASSET_PLANT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ASSET_TRADE_IN
--------------------------------------------------------

  ALTER TABLE "CMS_ASSET_TRADE_IN" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASSET_TRADE_IN" ADD CONSTRAINT "CC1169518763547" PRIMARY KEY ("ID")
  USING INDEX "CC1169518763547"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ASSET_VEHICLE
--------------------------------------------------------

  ALTER TABLE "CMS_ASSET_VEHICLE" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASSET_VEHICLE" ADD CONSTRAINT "CMS_ASSET_VEH_PK" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CMS_ASSET_VEH_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ASSET_VESSEL
--------------------------------------------------------

  ALTER TABLE "CMS_ASSET_VESSEL" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASSET_VESSEL" ADD CONSTRAINT "CMS_ASST_VESSEL_PK" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CMS_ASST_VESSEL_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ASST_GC_DEBTOR
--------------------------------------------------------

  ALTER TABLE "CMS_ASST_GC_DEBTOR" MODIFY ("CMS_ASST_GC_DEBTOR_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASST_GC_DEBTOR" ADD CONSTRAINT "CC1169518832477" PRIMARY KEY ("CMS_ASST_GC_DEBTOR_ID")
  USING INDEX "CC1169518832477"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ASST_GC_FXASST_OTHR
--------------------------------------------------------

  ALTER TABLE "CMS_ASST_GC_FXASST_OTHR" MODIFY ("CMS_ASST_GC_FAO_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASST_GC_FXASST_OTHR" ADD CONSTRAINT "CC1169518861569" PRIMARY KEY ("CMS_ASST_GC_FAO_ID")
  USING INDEX "CC1169518861569"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ASST_GC_INSR_FAO_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_ASST_GC_INSR_FAO_MAP" MODIFY ("CMS_ASST_GC_INSR_FAO_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASST_GC_INSR_FAO_MAP" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASST_GC_INSR_FAO_MAP" ADD CONSTRAINT "CC1169518981111" PRIMARY KEY ("CMS_ASST_GC_INSR_FAO_MAP_ID")
  USING INDEX "CC1169518981111"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ASST_GC_INSR_STK_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_ASST_GC_INSR_STK_MAP" MODIFY ("CMS_ASST_GC_INSR_STK_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASST_GC_INSR_STK_MAP" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASST_GC_INSR_STK_MAP" ADD CONSTRAINT "CC1169519020267" PRIMARY KEY ("CMS_ASST_GC_INSR_STK_MAP_ID")
  USING INDEX "CC1169519020267"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ASST_GC_STOCK
--------------------------------------------------------

  ALTER TABLE "CMS_ASST_GC_STOCK" MODIFY ("CMS_ASST_GC_STOCK_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASST_GC_STOCK" MODIFY ("STOCK_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ASST_GC_STOCK" ADD CONSTRAINT "CC1169519151916" PRIMARY KEY ("CMS_ASST_GC_STOCK_ID")
  USING INDEX "CC1169519151916"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_AUTHENTICATION
--------------------------------------------------------

  ALTER TABLE "CMS_AUTHENTICATION" MODIFY ("LOGIN_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_AUTHENTICATION" MODIFY ("ROLE" NOT NULL ENABLE);
  ALTER TABLE "CMS_AUTHENTICATION" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "CMS_AUTHENTICATION" MODIFY ("PWD_SET_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_AUTHENTICATION" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_AUTHENTICATION" MODIFY ("PASSWORD_POLICY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_AUTHENTICATION" MODIFY ("CREDENTIALS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_AUTHENTICATION" ADD CONSTRAINT "CC1169519191203" PRIMARY KEY ("LOGIN_ID", "ROLE")
  USING INDEX "CC1169519191203"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BANKING_ARR_FAC_EXC
--------------------------------------------------------

  ALTER TABLE "CMS_BANKING_ARR_FAC_EXC" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BANKING_ARR_FAC_EXC" MODIFY ("SYSTEM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_BANK_ENTITY_PARAM
--------------------------------------------------------

  ALTER TABLE "CMS_BANK_ENTITY_PARAM" MODIFY ("BANK_ENTITY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BANK_ENTITY_PARAM" ADD CONSTRAINT "SQL110121194743050" PRIMARY KEY ("BANK_ENTITY_ID")
  USING INDEX "SQL110121194743050"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BASEL_MONTHLY
--------------------------------------------------------

  ALTER TABLE "CMS_BASEL_MONTHLY" MODIFY ("FIC_MIS_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_BASEL_MONTHLY" MODIFY ("V_F_MITIGANT_SOURCE_SYS" NOT NULL ENABLE);
  ALTER TABLE "CMS_BASEL_MONTHLY" MODIFY ("N_F_LINE_SERIAL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_BASEL_MONTHLY_P2
--------------------------------------------------------

  ALTER TABLE "CMS_BASEL_MONTHLY_P2" MODIFY ("FIC_MIS_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_BASEL_MONTHLY_P2" MODIFY ("V_F_MITIGANT_SOURCE_SYS" NOT NULL ENABLE);
  ALTER TABLE "CMS_BASEL_MONTHLY_P2" MODIFY ("N_F_LINE_SERIAL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_BASEL_MONTHLY_P2_BKP
--------------------------------------------------------

  ALTER TABLE "CMS_BASEL_MONTHLY_P2_BKP" MODIFY ("FIC_MIS_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_BASEL_MONTHLY_P2_BKP" MODIFY ("V_F_MITIGANT_SOURCE_SYS" NOT NULL ENABLE);
  ALTER TABLE "CMS_BASEL_MONTHLY_P2_BKP" MODIFY ("N_F_LINE_SERIAL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_BATCH_CIF_FUSION
--------------------------------------------------------

  ALTER TABLE "CMS_BATCH_CIF_FUSION" MODIFY ("CMS_BATCH_CIF_FUSION_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BATCH_CIF_FUSION" MODIFY ("OLD_LE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BATCH_CIF_FUSION" MODIFY ("NEW_LE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_BATCH_CIF_UPDATE
--------------------------------------------------------

  ALTER TABLE "CMS_BATCH_CIF_UPDATE" MODIFY ("CMS_BATCH_CIF_UPDATE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BATCH_CIF_UPDATE" MODIFY ("LE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_BATCH_DDN_DOC
--------------------------------------------------------

  ALTER TABLE "CMS_BATCH_DDN_DOC" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BATCH_DDN_DOC" ADD CONSTRAINT "CC1169519257048" PRIMARY KEY ("CMS_LSP_LMT_PROFILE_ID")
  USING INDEX "CC1169519257048"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BATCH_JOB
--------------------------------------------------------

  ALTER TABLE "CMS_BATCH_JOB" MODIFY ("BATCH_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BATCH_JOB" ADD CONSTRAINT "SQL110121194600470" PRIMARY KEY ("BATCH_ID")
  USING INDEX "SQL110121194600470"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BCA_COBORROWER_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_BCA_COBORROWER_MAP" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BCA_COBORROWER_MAP" MODIFY ("CMS_CUSTOMER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BCA_COBORROWER_MAP" ADD CONSTRAINT "CC1169519325856" PRIMARY KEY ("CMS_LSP_LMT_PROFILE_ID", "CMS_CUSTOMER_ID")
  USING INDEX "CC1169519325856"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BCA_PLEDGOR_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_BCA_PLEDGOR_MAP" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BCA_PLEDGOR_MAP" MODIFY ("CMS_PLEDGOR_DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BCA_PLEDGOR_MAP" ADD CONSTRAINT "CC1169519364312" PRIMARY KEY ("CMS_LSP_LMT_PROFILE_ID", "CMS_PLEDGOR_DTL_ID")
  USING INDEX "CC1169519364312"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BCA_SEC_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_BCA_SEC_MAP" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BCA_SEC_MAP" MODIFY ("CMS_CUSTOMER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BCA_SEC_MAP" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BCA_SEC_MAP" MODIFY ("SCI_SECURITY_DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BCA_SEC_MAP" MODIFY ("LE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BCA_SEC_MAP" MODIFY ("CMS_ORIG_COUNTRY" NOT NULL ENABLE);
  ALTER TABLE "CMS_BCA_SEC_MAP" MODIFY ("CMS_ORIG_ORGANISATION" NOT NULL ENABLE);
  ALTER TABLE "CMS_BCA_SEC_MAP" MODIFY ("SECURITY_LOCATION" NOT NULL ENABLE);
  ALTER TABLE "CMS_BCA_SEC_MAP" MODIFY ("CB_CUSTOMER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BCA_SEC_MAP" MODIFY ("CUSTOMER_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CMS_BCA_SEC_MAP" ADD CONSTRAINT "PK_CMS_BCA_SEC_LI1" PRIMARY KEY ("CUSTOMER_CATEGORY", "CMS_LSP_LMT_PROFILE_ID", "CMS_CUSTOMER_ID", "CMS_COLLATERAL_ID", "SCI_SECURITY_DTL_ID", "LE_ID", "CMS_ORIG_COUNTRY", "CMS_ORIG_ORGANISATION", "SECURITY_LOCATION", "CB_CUSTOMER_ID")
  USING INDEX "PK_CMS_BCA_SEC_LI1"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BCP_IMAGES
--------------------------------------------------------

  ALTER TABLE "CMS_BCP_IMAGES" MODIFY ("IMG_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BCP_IMAGES" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_BFL_TAT_PARAM
--------------------------------------------------------

  ALTER TABLE "CMS_BFL_TAT_PARAM" MODIFY ("BFL_TAT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BFL_TAT_PARAM" ADD CONSTRAINT "CC1169519421834" PRIMARY KEY ("BFL_TAT_ID")
  USING INDEX "CC1169519421834"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BHAVCOPY
--------------------------------------------------------

  ALTER TABLE "CMS_BHAVCOPY" MODIFY ("SC_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_BHAVCOPY" MODIFY ("SC_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_BHAVCOPY" MODIFY ("SC_GROUP" NOT NULL ENABLE);
  ALTER TABLE "CMS_BHAVCOPY" MODIFY ("OPEN_VALUE" NOT NULL ENABLE);
  ALTER TABLE "CMS_BHAVCOPY" MODIFY ("CLOSE_VALUE" NOT NULL ENABLE);
  ALTER TABLE "CMS_BHAVCOPY" MODIFY ("LAST_VALUE" NOT NULL ENABLE);
  ALTER TABLE "CMS_BHAVCOPY" ADD CONSTRAINT "CC1298876442489" PRIMARY KEY ("SC_CODE")
  USING INDEX "CC1298876442489"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BL_BUILDUP
--------------------------------------------------------

  ALTER TABLE "CMS_BL_BUILDUP" MODIFY ("BUILDUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BL_BUILDUP" ADD CONSTRAINT "BL_BUL_ID_PK" PRIMARY KEY ("BUILDUP_ID")
  USING INDEX "BL_BUL_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BL_DEVELOPMENT_DOCUMENT
--------------------------------------------------------

  ALTER TABLE "CMS_BL_DEVELOPMENT_DOCUMENT" MODIFY ("DEV_DOC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BL_DEVELOPMENT_DOCUMENT" ADD CONSTRAINT "BL_DEV_ID_PK" PRIMARY KEY ("DEV_DOC_ID")
  USING INDEX "BL_DEV_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BL_DISBURSEMENT
--------------------------------------------------------

  ALTER TABLE "CMS_BL_DISBURSEMENT" MODIFY ("DISBURSEMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BL_DISBURSEMENT" ADD CONSTRAINT "BL_DISB_ID_PK" PRIMARY KEY ("DISBURSEMENT_ID")
  USING INDEX "BL_DISB_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BL_DISBURSEMENT_DETAIL
--------------------------------------------------------

  ALTER TABLE "CMS_BL_DISBURSEMENT_DETAIL" MODIFY ("DISBURSE_DETAIL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BL_DISBURSEMENT_DETAIL" ADD CONSTRAINT "BL_DIS_DTL_ID_PK" PRIMARY KEY ("DISBURSE_DETAIL_ID")
  USING INDEX "BL_DIS_DTL_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BL_FDR
--------------------------------------------------------

  ALTER TABLE "CMS_BL_FDR" MODIFY ("FDR_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BL_FDR" ADD CONSTRAINT "BL_FDR_ID_PK" PRIMARY KEY ("FDR_ID")
  USING INDEX "BL_FDR_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BL_PROJECT_SCHEDULE
--------------------------------------------------------

  ALTER TABLE "CMS_BL_PROJECT_SCHEDULE" MODIFY ("SCHEDULE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BL_PROJECT_SCHEDULE" ADD CONSTRAINT "BL_SCHD_ID_PK" PRIMARY KEY ("SCHEDULE_ID")
  USING INDEX "BL_SCHD_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BL_PROPERTY_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_BL_PROPERTY_TYPE" MODIFY ("PROPERTY_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BL_PROPERTY_TYPE" ADD CONSTRAINT "BL_PROP_ID_PK" PRIMARY KEY ("PROPERTY_TYPE_ID")
  USING INDEX "BL_PROP_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BL_SALES_PROCEEDS
--------------------------------------------------------

  ALTER TABLE "CMS_BL_SALES_PROCEEDS" MODIFY ("PROCEEDS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BL_SALES_PROCEEDS" ADD CONSTRAINT "BL_SALE_ID_PK" PRIMARY KEY ("PROCEEDS_ID")
  USING INDEX "BL_SALE_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BL_SETTLEMENT
--------------------------------------------------------

  ALTER TABLE "CMS_BL_SETTLEMENT" MODIFY ("SETTLEMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BL_SETTLEMENT" ADD CONSTRAINT "BL_SETT_ID_PK" PRIMARY KEY ("SETTLEMENT_ID")
  USING INDEX "BL_SETT_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_BRANCH_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_BRANCH_MAP" MODIFY ("BRANCH_MAP_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_BRIDGING_LOAN
--------------------------------------------------------

  ALTER TABLE "CMS_BRIDGING_LOAN" MODIFY ("PROJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_BRIDGING_LOAN" ADD CONSTRAINT "BL_PROJ_ID_PK" PRIMARY KEY ("PROJECT_ID")
  USING INDEX "BL_PROJ_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CASEBRANCH
--------------------------------------------------------

  ALTER TABLE "CMS_CASEBRANCH" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CASECREATIONUPDATE
--------------------------------------------------------

  ALTER TABLE "CMS_CASECREATIONUPDATE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CASECREATION_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_CASECREATION_ITEM" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CASECREATION_ITEM" MODIFY ("CHECKLISTITEMID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CASECREATION_ITEM" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CASH
--------------------------------------------------------

  ALTER TABLE "CMS_CASH" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CASH" ADD CONSTRAINT "CC1169519529319" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CC1169519529319"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CASH_DEPOSIT
--------------------------------------------------------

  ALTER TABLE "CMS_CASH_DEPOSIT" MODIFY ("CASH_DEPOSIT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CASH_DEPOSIT_1406
--------------------------------------------------------

  ALTER TABLE "CMS_CASH_DEPOSIT_1406" MODIFY ("CASH_DEPOSIT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CASH_DEPOSIT_DEL_BACKUP
--------------------------------------------------------

  ALTER TABLE "CMS_CASH_DEPOSIT_DEL_BACKUP" MODIFY ("CASH_DEPOSIT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CASH_DEPOSIT_PM_2106D
--------------------------------------------------------

  ALTER TABLE "CMS_CASH_DEPOSIT_PM_2106D" MODIFY ("CASH_DEPOSIT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CASH_MARGIN
--------------------------------------------------------

  ALTER TABLE "CMS_CASH_MARGIN" MODIFY ("CASH_MARGIN_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CASH_MARGIN" MODIFY ("AGREEMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CASH_MARGIN" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CASH_MARGIN" ADD CONSTRAINT "CASH_MARGIN_PK" PRIMARY KEY ("CASH_MARGIN_ID")
  USING INDEX "CASH_MARGIN_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CCC_GENERATED
--------------------------------------------------------

  ALTER TABLE "CMS_CCC_GENERATED" MODIFY ("CCC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CCC_GENERATED" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CCC_GENERATED" MODIFY ("SUB_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CMS_CCC_GENERATED" ADD CONSTRAINT "CC1169520156401" PRIMARY KEY ("CCC_ID")
  USING INDEX "CC1169520156401"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CCC_GENERATED_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_CCC_GENERATED_ITEM" MODIFY ("CCC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CCC_GENERATED_ITEM" MODIFY ("CMS_LSP_APPR_LMTS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CCC_GENERATED_ITEM" MODIFY ("ACTIVATED_LIMIT" NOT NULL ENABLE);
  ALTER TABLE "CMS_CCC_GENERATED_ITEM" ADD CONSTRAINT "CC1169520268552" PRIMARY KEY ("CCC_ITEM_ID")
  USING INDEX "CC1169520268552"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CCI_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_CCI_MAP" MODIFY ("CCI_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CCI_MAP" MODIFY ("CMS_CCI_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CC_DOC_LOC
--------------------------------------------------------

  ALTER TABLE "CMS_CC_DOC_LOC" MODIFY ("DOC_LOC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CC_DOC_LOC" MODIFY ("SUB_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CMS_CC_DOC_LOC" ADD CONSTRAINT "CC1169519976572" PRIMARY KEY ("DOC_LOC_ID")
  USING INDEX "CC1169519976572"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CC_TASK
--------------------------------------------------------

  ALTER TABLE "CMS_CC_TASK" MODIFY ("TASK_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CC_TASK" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CC_TASK" ADD CONSTRAINT "CC1169520029338" PRIMARY KEY ("TASK_ID")
  USING INDEX "CC1169520029338"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CERSAI_MAPPING
--------------------------------------------------------

  ALTER TABLE "CMS_CERSAI_MAPPING" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CERSAI_MAPPING" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CF_ADVANCE
--------------------------------------------------------

  ALTER TABLE "CMS_CF_ADVANCE" MODIFY ("ADVANCE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CF_ADVANCE" ADD CONSTRAINT "CF_ADV_ID_PK" PRIMARY KEY ("ADVANCE_ID")
  USING INDEX "CF_ADV_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CF_FACILITY_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_CF_FACILITY_TYPE" MODIFY ("FACILITY_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CF_FACILITY_TYPE" ADD CONSTRAINT "CF_FAC_ID_PK" PRIMARY KEY ("FACILITY_TYPE_ID")
  USING INDEX "CF_FAC_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CF_FDR
--------------------------------------------------------

  ALTER TABLE "CMS_CF_FDR" MODIFY ("FDR_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CF_FDR" ADD CONSTRAINT "CF_FDR_ID_PK" PRIMARY KEY ("FDR_ID")
  USING INDEX "CF_FDR_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CF_PAYMENT
--------------------------------------------------------

  ALTER TABLE "CMS_CF_PAYMENT" MODIFY ("PAYMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CF_PAYMENT" ADD CONSTRAINT "CF_PAY_ID_PK" PRIMARY KEY ("PAYMENT_ID")
  USING INDEX "CF_PAY_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CF_TERMS_CONDITIONS
--------------------------------------------------------

  ALTER TABLE "CMS_CF_TERMS_CONDITIONS" MODIFY ("TNC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CF_TERMS_CONDITIONS" ADD CONSTRAINT "CF_TNC_ID_PK" PRIMARY KEY ("TNC_ID")
  USING INDEX "CF_TNC_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CHARGE_DETAIL
--------------------------------------------------------

  ALTER TABLE "CMS_CHARGE_DETAIL" MODIFY ("CHARGE_DETAIL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHARGE_DETAIL" ADD CONSTRAINT "CC1170231451131" PRIMARY KEY ("CHARGE_DETAIL_ID")
  USING INDEX "CHG_DTL_I4"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CHECKLIST
--------------------------------------------------------

  ALTER TABLE "CMS_CHECKLIST" MODIFY ("CHECKLIST_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST" ADD CONSTRAINT "CC1169520355417" PRIMARY KEY ("CHECKLIST_ID")
  USING INDEX "CC1169520355417"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CHECKLIST_19122013
--------------------------------------------------------

  ALTER TABLE "CMS_CHECKLIST_19122013" MODIFY ("CHECKLIST_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST_19122013" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST_19122013" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CHECKLIST_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_CHECKLIST_ITEM" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST_ITEM" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST_ITEM" ADD CONSTRAINT "CC1169520399821" PRIMARY KEY ("DOC_ITEM_ID")
  USING INDEX "CC1169520399821"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CHECKLIST_ITEM_11012013
--------------------------------------------------------

  ALTER TABLE "CMS_CHECKLIST_ITEM_11012013" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST_ITEM_11012013" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CHECKLIST_ITEM_19122013
--------------------------------------------------------

  ALTER TABLE "CMS_CHECKLIST_ITEM_19122013" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST_ITEM_19122013" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CHECKLIST_ITEM_20092012
--------------------------------------------------------

  ALTER TABLE "CMS_CHECKLIST_ITEM_20092012" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST_ITEM_20092012" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CHECKLIST_ITEM_2013
--------------------------------------------------------

  ALTER TABLE "CMS_CHECKLIST_ITEM_2013" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST_ITEM_2013" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CHECKLIST_ITEM_21062012
--------------------------------------------------------

  ALTER TABLE "CMS_CHECKLIST_ITEM_21062012" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST_ITEM_21062012" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CHECKLIST_ITEM_25112014
--------------------------------------------------------

  ALTER TABLE "CMS_CHECKLIST_ITEM_25112014" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CHECKLIST_ITEM_2906
--------------------------------------------------------

  ALTER TABLE "CMS_CHECKLIST_ITEM_2906" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST_ITEM_2906" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CHECKLIST_ITEM_8AUG
--------------------------------------------------------

  ALTER TABLE "CMS_CHECKLIST_ITEM_8AUG" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST_ITEM_8AUG" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CHECKLIST_ITEM_BKP
--------------------------------------------------------

  ALTER TABLE "CMS_CHECKLIST_ITEM_BKP" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST_ITEM_BKP" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CHECKLIST_ITEM_CUR01
--------------------------------------------------------

  ALTER TABLE "CMS_CHECKLIST_ITEM_CUR01" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST_ITEM_CUR01" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CHECKLIST_ITEM_IMAGE
--------------------------------------------------------

  ALTER TABLE "CMS_CHECKLIST_ITEM_IMAGE" MODIFY ("CHK_ITEM_IMAGE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CHECKLIST_ITEM_SHARE
--------------------------------------------------------

  ALTER TABLE "CMS_CHECKLIST_ITEM_SHARE" MODIFY ("CHECKLIST_ITEM_SHARE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CHECKLIST_ITEM_SHARE" ADD CONSTRAINT "CC1169520425798" PRIMARY KEY ("CHECKLIST_ITEM_SHARE_ID")
  USING INDEX "CC1169520425798"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CHECKLIST_ITEM_SHARE_BKUP
--------------------------------------------------------

  ALTER TABLE "CMS_CHECKLIST_ITEM_SHARE_BKUP" MODIFY ("CHECKLIST_ITEM_SHARE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CITY
--------------------------------------------------------

  ALTER TABLE "CMS_CITY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CITY" MODIFY ("CITY_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_CITY" MODIFY ("CITY_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_CITY" MODIFY ("STATE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CITY" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_CITY" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_CITY" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_CITY" ADD CONSTRAINT "SQL110416160950130" PRIMARY KEY ("ID")
  USING INDEX "SQL110416160950130"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CMDT_APPV
--------------------------------------------------------

  ALTER TABLE "CMS_CMDT_APPV" MODIFY ("APPV_COMMODITY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_APPV" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_APPV" ADD CONSTRAINT "CC1169520620869" PRIMARY KEY ("APPV_COMMODITY_ID")
  USING INDEX "CC1169520620869"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CMDT_BUYER
--------------------------------------------------------

  ALTER TABLE "CMS_CMDT_BUYER" MODIFY ("BUYER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_BUYER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_BUYER" ADD CONSTRAINT "CC1169520665913" PRIMARY KEY ("BUYER_ID")
  USING INDEX "CC1169520665913"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CMDT_CNTR
--------------------------------------------------------

  ALTER TABLE "CMS_CMDT_CNTR" MODIFY ("CONTRACT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_CNTR" MODIFY ("CONTRACT_NO" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_CNTR" MODIFY ("CONTRACT_CCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_CNTR" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_CNTR" ADD CONSTRAINT "CC1169520685892" PRIMARY KEY ("CONTRACT_ID")
  USING INDEX "CC1169520685892"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CMDT_DEAL
--------------------------------------------------------

  ALTER TABLE "CMS_CMDT_DEAL" MODIFY ("DEAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_DEAL" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_DEAL" MODIFY ("DEAL_NO" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_DEAL" MODIFY ("DEAL_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_DEAL" MODIFY ("TRX_REF_NO" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_DEAL" MODIFY ("MATURITY_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_DEAL" MODIFY ("ORIG_FACE_AMT_CCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_DEAL" MODIFY ("FINANCE_PCT" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_DEAL" MODIFY ("IS_PRE_SOLD" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_DEAL" MODIFY ("IS_ATTAIN_ENFORCE" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_DEAL" ADD CONSTRAINT "CC1169520729515" PRIMARY KEY ("DEAL_ID")
  USING INDEX "CC1169520729515"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CMDT_LOAN
--------------------------------------------------------

  ALTER TABLE "CMS_CMDT_LOAN" MODIFY ("LOAN_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_LOAN" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_LOAN" ADD CONSTRAINT "CC1169520758587" PRIMARY KEY ("LOAN_ID")
  USING INDEX "CC1169520758587"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CMDT_PRICE
--------------------------------------------------------

  ALTER TABLE "CMS_CMDT_PRICE" MODIFY ("COMMODITY_PRICE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_PRICE" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_PRICE" ADD CONSTRAINT "CC1169520792305" PRIMARY KEY ("COMMODITY_PRICE_ID")
  USING INDEX "CC1169520792305"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CMDT_PROFILE
--------------------------------------------------------

  ALTER TABLE "CMS_CMDT_PROFILE" MODIFY ("PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_PROFILE" MODIFY ("CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_PROFILE" MODIFY ("PRODUCT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_PROFILE" MODIFY ("PRODUCT_SUB_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_PROFILE" MODIFY ("RIC" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_PROFILE" MODIFY ("PRICE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_PROFILE" MODIFY ("RIC_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_PROFILE" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_PROFILE" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_PROFILE" ADD CONSTRAINT "CC1169520814397" PRIMARY KEY ("PROFILE_ID")
  USING INDEX "CC1169520814397"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CMDT_SUB_LMT
--------------------------------------------------------

  ALTER TABLE "CMS_CMDT_SUB_LMT" MODIFY ("SUB_LMT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_SUB_LMT" ADD CONSTRAINT "CC1169520849587" PRIMARY KEY ("SUB_LMT_ID")
  USING INDEX "CC1169520849587"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CMDT_SUB_LMT_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_CMDT_SUB_LMT_TYPE" MODIFY ("SUB_LMT_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_SUB_LMT_TYPE" ADD CONSTRAINT "CC1169520870778" PRIMARY KEY ("SUB_LMT_TYPE_ID")
  USING INDEX "CC1169520870778"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CMDT_SUPPLIER
--------------------------------------------------------

  ALTER TABLE "CMS_CMDT_SUPPLIER" MODIFY ("SUPPLIER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_SUPPLIER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_SUPPLIER" ADD CONSTRAINT "CC1169520902313" PRIMARY KEY ("SUPPLIER_ID")
  USING INDEX "CC1169520902313"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CMDT_UOM
--------------------------------------------------------

  ALTER TABLE "CMS_CMDT_UOM" MODIFY ("COMMODITY_UOM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_UOM" MODIFY ("PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_UOM" MODIFY ("UOM_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_UOM" MODIFY ("MKT_UOM" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_UOM" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_UOM" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_UOM" ADD CONSTRAINT "CC1169520979404" PRIMARY KEY ("COMMODITY_UOM_ID")
  USING INDEX "CC1169520979404"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CMDT_WRHSE
--------------------------------------------------------

  ALTER TABLE "CMS_CMDT_WRHSE" MODIFY ("WAREHOUSE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_WRHSE" MODIFY ("COUNTRY_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_WRHSE" MODIFY ("WAREHOUSE_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_WRHSE" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_WRHSE" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CMDT_WRHSE" ADD CONSTRAINT "CC1169521002077" PRIMARY KEY ("WAREHOUSE_ID")
  USING INDEX "CC1169521002077"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_COLLATERAL_NEW_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_COLLATERAL_NEW_MASTER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_COLLATERAL_NEW_MASTER" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_COLLATERAL_ROC_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_COLLATERAL_ROC_MAP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_COLLATERAL_ROC_MAP" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_COLLATERAL_ROC_MAP" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_COLLATERAL_ROC_MAP" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_COLLATERAL_ROC_MAP" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_COLLATERAL_ROC_MAP" MODIFY ("COLLATERAL_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CMS_COLLATERAL_ROC_MAP" MODIFY ("COLLATERAL_ROC_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_COLLATERAL_ROC_MAP" MODIFY ("COLLATERAL_ROC_DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "CMS_COLLATERAL_ROC_MAP" MODIFY ("IRB_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CMS_COLLATERAL_ROC_MAP" MODIFY ("INSURANCE_APPLICABLE" NOT NULL ENABLE);
  ALTER TABLE "CMS_COLLATERAL_ROC_MAP" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_COLLATERAL_TASK
--------------------------------------------------------

  ALTER TABLE "CMS_COLLATERAL_TASK" MODIFY ("TASK_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_COLLATERAL_TASK" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_COLLATERAL_TASK" ADD CONSTRAINT "CC1169521024179" PRIMARY KEY ("TASK_ID")
  USING INDEX "CC1169521024179"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_COL_GRP_AGGR
--------------------------------------------------------

  ALTER TABLE "CMS_COL_GRP_AGGR" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_COL_SHAREPERCENT_LINK
--------------------------------------------------------

  ALTER TABLE "CMS_COL_SHAREPERCENT_LINK" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_COL_SHAREPERCENT_LINK" MODIFY ("GC_DET_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_COMMODITY
--------------------------------------------------------

  ALTER TABLE "CMS_COMMODITY" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_COMMODITY" ADD CONSTRAINT "CC1169521049034" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CC1169521049034"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_COMPONENT
--------------------------------------------------------

  ALTER TABLE "CMS_COMPONENT" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_COMPONENT" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_COMPONENT" MODIFY ("COMPONENT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_COMPONENT" MODIFY ("COMPONENT_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_COMPONENT" MODIFY ("COMPONENT_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_COMPONENT" MODIFY ("HAS_INSURANCE" NOT NULL ENABLE);
  ALTER TABLE "CMS_COMPONENT" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_COMPONENT" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_COMPONENT123
--------------------------------------------------------

  ALTER TABLE "CMS_COMPONENT123" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_COMPONENT123" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_COMPONENT123" MODIFY ("COMPONENT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_COMPONENT123" MODIFY ("COMPONENT_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_COMPONENT123" MODIFY ("COMPONENT_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_COMPONENT123" MODIFY ("HAS_INSURANCE" NOT NULL ENABLE);
  ALTER TABLE "CMS_COMPONENT123" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_COMPONENT123" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CONTRACT_FINANCING
--------------------------------------------------------

  ALTER TABLE "CMS_CONTRACT_FINANCING" MODIFY ("CONTRACT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CONTRACT_FINANCING" ADD CONSTRAINT "CF_CONT_ID_PK" PRIMARY KEY ("CONTRACT_ID")
  USING INDEX "CF_CONT_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CONVENANT
--------------------------------------------------------

  ALTER TABLE "CMS_CONVENANT" MODIFY ("CONVENANT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CONVENANT" MODIFY ("CONVENANT_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CONVENANT" ADD CONSTRAINT "CC1169521077916" PRIMARY KEY ("CONVENANT_ID")
  USING INDEX "CC1169521077916"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CONVENANT_SUB_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_CONVENANT_SUB_ITEM" MODIFY ("SUB_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CONVENANT_SUB_ITEM" MODIFY ("SUB_ITEM_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CONVENANT_SUB_ITEM" ADD CONSTRAINT "CC1169521102551" PRIMARY KEY ("SUB_ITEM_ID")
  USING INDEX "CC1169521102551"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_COUNTRY
--------------------------------------------------------

  ALTER TABLE "CMS_COUNTRY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_COUNTRY" MODIFY ("COUNTRY_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_COUNTRY" MODIFY ("COUNTRY_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_COUNTRY" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_COUNTRY" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_COUNTRY" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_COUNTRY" ADD CONSTRAINT "SQL110412105837350" PRIMARY KEY ("ID")
  USING INDEX "SQL110412105837350"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_COUNTRY_LIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_COUNTRY_LIMIT" MODIFY ("COUNTRY_LIMIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_COUNTRY_LIMIT" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_COUNTRY_LIMIT" ADD CONSTRAINT "CTRY_LIMIT_PK" PRIMARY KEY ("COUNTRY_LIMIT_ID")
  USING INDEX "CTRY_LIMIT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_COUNTRY_RATING
--------------------------------------------------------

  ALTER TABLE "CMS_COUNTRY_RATING" MODIFY ("COUNTRY_RATING_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_COUNTRY_RATING" MODIFY ("COUNTRY_RATING_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_COUNTRY_RATING" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_COUNTRY_RATING" ADD CONSTRAINT "CTRY_RATING_PK" PRIMARY KEY ("COUNTRY_RATING_ID")
  USING INDEX "CTRY_RATING_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CREDIT_APPROVAL
--------------------------------------------------------

  ALTER TABLE "CMS_CREDIT_APPROVAL" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CREDIT_APPROVAL" MODIFY ("APPROVAL_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_CREDIT_APPROVAL" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_CREDIT_APPROVAL" ADD CONSTRAINT "PK_CREDIT_APPROVAL" PRIMARY KEY ("ID")
  USING INDEX "PK_CREDIT_APPROVAL"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CREDIT_RISK_PARAM
--------------------------------------------------------

  ALTER TABLE "CMS_CREDIT_RISK_PARAM" MODIFY ("PARAM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CREDIT_RISK_PARAM" MODIFY ("FEED_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CREDIT_RISK_PARAM" MODIFY ("PARAM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_CUSTODIAN_AUTHORIZER
--------------------------------------------------------

  ALTER TABLE "CMS_CUSTODIAN_AUTHORIZER" MODIFY ("CUSTODIAN_AUTHZ_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUSTODIAN_AUTHORIZER" MODIFY ("AUTHZ_ROLE" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUSTODIAN_AUTHORIZER" MODIFY ("AUTHZ_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUSTODIAN_AUTHORIZER" MODIFY ("SIGNATORY_NO" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUSTODIAN_AUTHORIZER" MODIFY ("AUTHZ_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUSTODIAN_AUTHORIZER" MODIFY ("OPERATION" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUSTODIAN_AUTHORIZER" MODIFY ("CHECKLIST_ITEM_REF" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUSTODIAN_AUTHORIZER" ADD CONSTRAINT "CC1169521159103" PRIMARY KEY ("CUSTODIAN_AUTHZ_ID")
  USING INDEX "CC1169521159103"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CUSTODIAN_DOC
--------------------------------------------------------

  ALTER TABLE "CMS_CUSTODIAN_DOC" MODIFY ("CUSTODIAN_DOC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUSTODIAN_DOC" MODIFY ("CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUSTODIAN_DOC" MODIFY ("SUB_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUSTODIAN_DOC" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUSTODIAN_DOC" ADD CONSTRAINT "CC1169521186492" PRIMARY KEY ("CUSTODIAN_DOC_ID")
  USING INDEX "CC1169521186492"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CUSTOMER_DETAILS
--------------------------------------------------------

  ALTER TABLE "CMS_CUSTOMER_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUSTOMER_DETAILS" ADD CONSTRAINT "CC1303213289630" PRIMARY KEY ("ID")
  USING INDEX "CC1303213289630"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CUST_DOC
--------------------------------------------------------

  ALTER TABLE "CMS_CUST_DOC" MODIFY ("CUSTODIAN_DOC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUST_DOC" MODIFY ("CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUST_DOC" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUST_DOC" ADD CONSTRAINT "CC1169521131082" PRIMARY KEY ("CUSTODIAN_DOC_ID")
  USING INDEX "CC1169521131082"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CUST_DOC_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_CUST_DOC_ITEM" MODIFY ("CUSTODIAN_DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUST_DOC_ITEM" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUST_DOC_ITEM" MODIFY ("CHECKLIST_ITEM_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUST_DOC_ITEM" ADD CONSTRAINT "CMS_CDI_PK_II" PRIMARY KEY ("CUSTODIAN_DOC_ITEM_ID")
  USING INDEX "CMS_CDI_PK_II"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_CUST_GRP
--------------------------------------------------------

  ALTER TABLE "CMS_CUST_GRP" MODIFY ("GRP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_CUST_GRP" ADD CONSTRAINT "PK_GRP_ID" PRIMARY KEY ("GRP_ID")
  USING INDEX "PK_GRP_ID"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DAP_COUNTRY
--------------------------------------------------------

  ALTER TABLE "CMS_DAP_COUNTRY" MODIFY ("DAP_COUNTRY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DAP_COUNTRY" MODIFY ("DATA_ACCESS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DAP_COUNTRY" ADD CONSTRAINT "CC1169521229103" PRIMARY KEY ("DAP_COUNTRY_ID")
  USING INDEX "CC1169521229103"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DATA_ACCESS
--------------------------------------------------------

  ALTER TABLE "CMS_DATA_ACCESS" MODIFY ("DATA_ACCESS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DATA_ACCESS" ADD CONSTRAINT "CC1169521250174" PRIMARY KEY ("DATA_ACCESS_ID")
  USING INDEX "CC1169521250174"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DDN_GENERATED
--------------------------------------------------------

  ALTER TABLE "CMS_DDN_GENERATED" MODIFY ("DDN_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DDN_GENERATED" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DDN_GENERATED" ADD CONSTRAINT "CC1169521274839" PRIMARY KEY ("DDN_ID")
  USING INDEX "CC1169521274839"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DDN_GENERATED_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_DDN_GENERATED_ITEM" MODIFY ("DDN_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DDN_GENERATED_ITEM" MODIFY ("CMS_LSP_APPR_LMTS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DDN_GENERATED_ITEM" MODIFY ("HAS_ISSUED" NOT NULL ENABLE);
  ALTER TABLE "CMS_DDN_GENERATED_ITEM" ADD CONSTRAINT "CC1169521296130" PRIMARY KEY ("DDN_ITEM_ID")
  USING INDEX "CC1169521296130"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DEAL_CASH
--------------------------------------------------------

  ALTER TABLE "CMS_DEAL_CASH" MODIFY ("CASH_DEPOSIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DEAL_CASH" MODIFY ("DEPOSIT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_DEAL_CASH" MODIFY ("DEPOSIT_REF_NO" NOT NULL ENABLE);
  ALTER TABLE "CMS_DEAL_CASH" MODIFY ("DEPOSIT_CCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_DEAL_CASH" MODIFY ("LOC_CTRY" NOT NULL ENABLE);
  ALTER TABLE "CMS_DEAL_CASH" MODIFY ("MATURITY_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_DEAL_CASH" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DEAL_CASH" ADD CONSTRAINT "CC1169521334375" PRIMARY KEY ("CASH_DEPOSIT_ID")
  USING INDEX "CC1169521334375"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DEFERRAL_GENERATED
--------------------------------------------------------

  ALTER TABLE "CMS_DEFERRAL_GENERATED" MODIFY ("DEFERRAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DEFERRAL_GENERATED" ADD CONSTRAINT "CC1169521361554" PRIMARY KEY ("DEFERRAL_ID")
  USING INDEX "CC1169521361554"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DEFERRAL_GENERATED_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_DEFERRAL_GENERATED_ITEM" MODIFY ("DEFERRAL_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DEFERRAL_GENERATED_ITEM" ADD CONSTRAINT "CC1169521386319" PRIMARY KEY ("DEFERRAL_ITEM_ID")
  USING INDEX "CC1169521386319"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DEFERRAL_UPLOAD
--------------------------------------------------------

  ALTER TABLE "CMS_DEFERRAL_UPLOAD" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DEFERRAL_UPLOAD" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DEMO
--------------------------------------------------------

  ALTER TABLE "CMS_DEMO" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DEMO" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_DEMO" ADD CONSTRAINT "CMS_DEMO_PK" PRIMARY KEY ("ID")
  USING INDEX "CMS_DEMO_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DIARY_EMAIL_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_DIARY_EMAIL_MAP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DIARY_EMAIL_MAP" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DIARY_EMAIL_SEG_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_DIARY_EMAIL_SEG_MAP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DIARY_EMAIL_SEG_MAP" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DIARY_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_DIARY_ITEM" MODIFY ("ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DIARY_ITEM" MODIFY ("LE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DIARY_ITEM" MODIFY ("CUSTOMER_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_DIARY_ITEM" MODIFY ("TEAM_TYPE_MEMBERSHIP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DIARY_ITEM" ADD CONSTRAINT "CC1169521409142" PRIMARY KEY ("ITEM_ID")
  USING INDEX "CC1169521409142"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DIRECTOR_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_DIRECTOR_MASTER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DIRECTOR_MASTER" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_DIRECTOR_MASTER" ADD CONSTRAINT "PK_DIRECTOR_MASTER" PRIMARY KEY ("ID")
  USING INDEX "PK_DIRECTOR_MASTER"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DISCREPENCY
--------------------------------------------------------

  ALTER TABLE "CMS_DISCREPENCY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DISCREPENCY" MODIFY ("CUSTOMER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DISCREPENCY" MODIFY ("DISCREPENCY_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_DISCREPENCY" MODIFY ("CRITICAL" NOT NULL ENABLE);
  ALTER TABLE "CMS_DISCREPENCY" MODIFY ("DISCREPENCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_DISCREPENCY" MODIFY ("DISCREPENCY_COUNTER" NOT NULL ENABLE);
  ALTER TABLE "CMS_DISCREPENCY" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_DISCREPENCY" MODIFY ("DEFERED_COUNTER" NOT NULL ENABLE);
  ALTER TABLE "CMS_DISCREPENCY" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DISC_FACILITY_LIST
--------------------------------------------------------

  ALTER TABLE "CMS_DISC_FACILITY_LIST" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DISC_FACILITY_LIST" MODIFY ("FACILITY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DISC_FACILITY_LIST" MODIFY ("FACILITY_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_DISC_FACILITY_LIST" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DOCUMENT
--------------------------------------------------------

  ALTER TABLE "CMS_DOCUMENT" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DOCUMENT" ADD CONSTRAINT "CC1169521431454" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CC1169521431454"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DOCUMENT_GLOBALLIST
--------------------------------------------------------

  ALTER TABLE "CMS_DOCUMENT_GLOBALLIST" MODIFY ("DOCUMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DOCUMENT_GLOBALLIST" MODIFY ("DOCUMENT_DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "CMS_DOCUMENT_GLOBALLIST" MODIFY ("CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CMS_DOCUMENT_GLOBALLIST" ADD CONSTRAINT "CC1169521454217" PRIMARY KEY ("DOCUMENT_ID")
  USING INDEX "DOC_GLOBAL_IDX1"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DOCUMENT_GLOBALLIST_1912
--------------------------------------------------------

  ALTER TABLE "CMS_DOCUMENT_GLOBALLIST_1912" MODIFY ("DOCUMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DOCUMENT_GLOBALLIST_1912" MODIFY ("DOCUMENT_DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "CMS_DOCUMENT_GLOBALLIST_1912" MODIFY ("CATEGORY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_DOCUMENT_GLOBALLIST_2
--------------------------------------------------------

  ALTER TABLE "CMS_DOCUMENT_GLOBALLIST_2" MODIFY ("DOCUMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DOCUMENT_GLOBALLIST_2" MODIFY ("DOCUMENT_DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "CMS_DOCUMENT_GLOBALLIST_2" MODIFY ("CATEGORY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_DOCUMENT_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_DOCUMENT_ITEM" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DOCUMENT_ITEM" ADD CONSTRAINT "CC1169521481606" PRIMARY KEY ("DOC_ITEM_ID")
  USING INDEX "CC1169521481606"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DOCUMENT_ITEM_19122013
--------------------------------------------------------

  ALTER TABLE "CMS_DOCUMENT_ITEM_19122013" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_DOCUMENT_ITEM_ARCHIVE
--------------------------------------------------------

  ALTER TABLE "CMS_DOCUMENT_ITEM_ARCHIVE" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_DOCUMENT_MASTERLIST
--------------------------------------------------------

  ALTER TABLE "CMS_DOCUMENT_MASTERLIST" MODIFY ("MASTERLIST_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DOCUMENT_MASTERLIST" ADD CONSTRAINT "CC1169521509476" PRIMARY KEY ("MASTERLIST_ID")
  USING INDEX "CC1169521509476"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DOCUMENT_MASTERLIST_1912
--------------------------------------------------------

  ALTER TABLE "CMS_DOCUMENT_MASTERLIST_1912" MODIFY ("MASTERLIST_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_DOCUMENT_PROPERTY
--------------------------------------------------------

  ALTER TABLE "CMS_DOCUMENT_PROPERTY" MODIFY ("PROPERTY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DOCUMENT_PROPERTY" ADD CONSTRAINT "PK_DYN_PROP" PRIMARY KEY ("PROPERTY_ID")
  USING INDEX "PK_DYN_PROP"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_DOC_DYNAMIC_PROPERTY_SETUP
--------------------------------------------------------

  ALTER TABLE "CMS_DOC_DYNAMIC_PROPERTY_SETUP" MODIFY ("SETUP_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_DOC_LOAN_APP_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_DOC_LOAN_APP_TYPE" MODIFY ("DOC_LOAN_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_DOC_LOAN_APP_TYPE" ADD CONSTRAINT "SQL110121194526800" PRIMARY KEY ("DOC_LOAN_ID")
  USING INDEX "SQL110121194526800"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_EAI_AA_RESPONSE_LOG
--------------------------------------------------------

  ALTER TABLE "CMS_EAI_AA_RESPONSE_LOG" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_EAI_MESSAGE_LOG
--------------------------------------------------------

  ALTER TABLE "CMS_EAI_MESSAGE_LOG" MODIFY ("LOG_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_EARMARK
--------------------------------------------------------

  ALTER TABLE "CMS_EARMARK" MODIFY ("EARMARK_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_EARMARK" MODIFY ("EARMARK_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_EARMARK" ADD CONSTRAINT "PK_EARMARK" PRIMARY KEY ("EARMARK_ID")
  USING INDEX "PK_EARMARK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_EARMARK_GROUP
--------------------------------------------------------

  ALTER TABLE "CMS_EARMARK_GROUP" MODIFY ("EARMARK_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_EARMARK_GROUP" MODIFY ("FEED_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_EARMARK_GROUP" ADD CONSTRAINT "PK_EARMARK_GROUP" PRIMARY KEY ("EARMARK_GROUP_ID")
  USING INDEX "PK_EARMARK_GROUP"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ECBF_CUST_INTERFACE_LOG
--------------------------------------------------------

  ALTER TABLE "CMS_ECBF_CUST_INTERFACE_LOG" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_ECBF_LMT_INTERFACE_LOG
--------------------------------------------------------

  ALTER TABLE "CMS_ECBF_LMT_INTERFACE_LOG" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_ECO_SECTOR_LIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_ECO_SECTOR_LIMIT" MODIFY ("ECO_SECTOR_LIMIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ECO_SECTOR_LIMIT" ADD CONSTRAINT "ECO_SECTOR_LIMIT" PRIMARY KEY ("ECO_SECTOR_LIMIT_ID")
  USING INDEX "ECO_SECTOR_LIMIT"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ENTITY_LIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_ENTITY_LIMIT" MODIFY ("ENTITY_LIMIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ENTITY_LIMIT" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ENTITY_LIMIT" ADD CONSTRAINT "ENT_LMT_PK" PRIMARY KEY ("ENTITY_LIMIT_ID")
  USING INDEX "ENT_LMT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_EODSYNC_STATUS
--------------------------------------------------------

  ALTER TABLE "CMS_EODSYNC_STATUS" ADD CONSTRAINT "CMS_EODSYNC_STATUS_PK" PRIMARY KEY ("ID")
  USING INDEX "CMS_EODSYNC_STATUS_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_EODSYNC_STATUS_LOG
--------------------------------------------------------

  ALTER TABLE "CMS_EODSYNC_STATUS_LOG" ADD CONSTRAINT "CMS_EODSYNC_STATUS_LOG_PK" PRIMARY KEY ("ID")
  USING INDEX "CMS_EODSYNC_STATUS_LOG_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_EOD_STATUS
--------------------------------------------------------

  ALTER TABLE "CMS_EOD_STATUS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_EOD_STATUS" ADD CONSTRAINT "CMS_EOD_STATUS_PK" PRIMARY KEY ("ID")
  USING INDEX "CMS_EOD_STATUS_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_EXCHANGE_OF_INFORMATION
--------------------------------------------------------

  ALTER TABLE "CMS_EXCHANGE_OF_INFORMATION" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_OF_INFORMATION" MODIFY ("CUSTOMER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_OF_INFORMATION" MODIFY ("ANNEXURE" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_OF_INFORMATION" MODIFY ("ACTIVITY_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_OF_INFORMATION" MODIFY ("DUE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_OF_INFORMATION" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_OF_INFORMATION" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_EXCHANGE_RATE
--------------------------------------------------------

  ALTER TABLE "CMS_EXCHANGE_RATE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE" MODIFY ("EXCHANGE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE" MODIFY ("EXCHANGE_RATE_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE" MODIFY ("CURRENCY_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE" MODIFY ("EXCHANGE_RATE_STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE" ADD CONSTRAINT "PK_EXCHANGE_RATE" PRIMARY KEY ("ID")
  USING INDEX "PK_EXCHANGE_RATE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_EXCHANGE_RATE_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_EXCHANGE_RATE_ITEM" MODIFY ("EXCHANGE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE_ITEM" MODIFY ("EXCHANGE_RATE_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE_ITEM" MODIFY ("VALUE" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE_ITEM" MODIFY ("VALID_FROM" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE_ITEM" MODIFY ("VALID_TILL" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE_ITEM" MODIFY ("CURRENCY_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE_ITEM" MODIFY ("EXCHANGE_RATE_STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE_ITEM" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE_ITEM" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE_ITEM" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE_ITEM" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE_ITEM" MODIFY ("MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE_ITEM" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE_ITEM" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCHANGE_RATE_ITEM" ADD CONSTRAINT "CC1300527269558" PRIMARY KEY ("ID")
  USING INDEX "CC1300527269558"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_EXCHANGE_RATE_REPORT
--------------------------------------------------------

  ALTER TABLE "CMS_EXCHANGE_RATE_REPORT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_EXCLUDED_FACILITY
--------------------------------------------------------

  ALTER TABLE "CMS_EXCLUDED_FACILITY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCLUDED_FACILITY" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCLUDED_FACILITY" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCLUDED_FACILITY" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCLUDED_FACILITY" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCLUDED_FACILITY" MODIFY ("EXCLUDED_FACILITY_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXCLUDED_FACILITY" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_EXC_LINE_FR_STP_SRM
--------------------------------------------------------

  ALTER TABLE "CMS_EXC_LINE_FR_STP_SRM" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXC_LINE_FR_STP_SRM" MODIFY ("LINE_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_EXEMPTED_INST_GP5
--------------------------------------------------------

  ALTER TABLE "CMS_EXEMPTED_INST_GP5" MODIFY ("EXEMPTED_INST_GP5_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXEMPTED_INST_GP5" ADD CONSTRAINT "EI_GP5_ID_PK" PRIMARY KEY ("EXEMPTED_INST_GP5_ID")
  USING INDEX "EI_GP5_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_EXEMPT_FACILITY
--------------------------------------------------------

  ALTER TABLE "CMS_EXEMPT_FACILITY" MODIFY ("EXEMPT_FACILITY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_EXEMPT_FACILITY" ADD CONSTRAINT "EXM_FAC_ID_PK" PRIMARY KEY ("EXEMPT_FACILITY_ID")
  USING INDEX "EXM_FAC_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FACILITY_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_FACILITY_MASTER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FACILITY_MASTER" ADD CONSTRAINT "SQL110121194558290" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194558290"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FACILITY_NEW_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_FACILITY_NEW_MASTER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FACILITY_NEW_MASTER" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_FAC_BBA_VARI_PACKAGE
--------------------------------------------------------

  ALTER TABLE "CMS_FAC_BBA_VARI_PACKAGE" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FAC_BBA_VARI_PACKAGE" ADD CONSTRAINT "SQL110121194559620" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194559620"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FAC_BNM_CODES
--------------------------------------------------------

  ALTER TABLE "CMS_FAC_BNM_CODES" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FAC_BNM_CODES" ADD CONSTRAINT "SQL110121194558350" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194558350"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FAC_FEE_CHARGE
--------------------------------------------------------

  ALTER TABLE "CMS_FAC_FEE_CHARGE" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FAC_FEE_CHARGE" ADD CONSTRAINT "SQL110121194558400" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194558400"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FAC_GENERAL
--------------------------------------------------------

  ALTER TABLE "CMS_FAC_GENERAL" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FAC_GENERAL" ADD CONSTRAINT "SQL110121194558440" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194558440"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FAC_INCREMENTAL
--------------------------------------------------------

  ALTER TABLE "CMS_FAC_INCREMENTAL" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FAC_INCREMENTAL" ADD CONSTRAINT "SQL110121194600050" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194600050"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FAC_INSURANCE
--------------------------------------------------------

  ALTER TABLE "CMS_FAC_INSURANCE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FAC_INSURANCE" ADD CONSTRAINT "SQL110121194558510" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194558510"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FAC_INTEREST
--------------------------------------------------------

  ALTER TABLE "CMS_FAC_INTEREST" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FAC_INTEREST" ADD CONSTRAINT "SQL110121194558710" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194558710"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FAC_ISLAMIC_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_FAC_ISLAMIC_MASTER" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FAC_ISLAMIC_MASTER" ADD CONSTRAINT "SQL110121194559370" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194559370"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FAC_MESSAGE
--------------------------------------------------------

  ALTER TABLE "CMS_FAC_MESSAGE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FAC_MESSAGE" ADD CONSTRAINT "SQL110121194559710" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194559710"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FAC_MULTI_TIER_FINANCING
--------------------------------------------------------

  ALTER TABLE "CMS_FAC_MULTI_TIER_FINANCING" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FAC_MULTI_TIER_FINANCING" ADD CONSTRAINT "SQL110121194559460" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194559460"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FAC_OFFICER
--------------------------------------------------------

  ALTER TABLE "CMS_FAC_OFFICER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FAC_OFFICER" ADD CONSTRAINT "SQL110121194558570" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194558570"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FAC_PAYMENT
--------------------------------------------------------

  ALTER TABLE "CMS_FAC_PAYMENT" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FAC_PAYMENT" ADD CONSTRAINT "SQL110121194558760" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194558760"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FAC_REDUCTION
--------------------------------------------------------

  ALTER TABLE "CMS_FAC_REDUCTION" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FAC_REDUCTION" ADD CONSTRAINT "SQL110121194600150" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194600150"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FAC_RELATIONSHIP
--------------------------------------------------------

  ALTER TABLE "CMS_FAC_RELATIONSHIP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FAC_RELATIONSHIP" ADD CONSTRAINT "SQL110121194558630" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194558630"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FAC_RENTAL_RENEWAL
--------------------------------------------------------

  ALTER TABLE "CMS_FAC_RENTAL_RENEWAL" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FAC_RENTAL_RENEWAL" ADD CONSTRAINT "SQL110121194559760" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194559760"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FAC_SECURITY_DEPOSIT
--------------------------------------------------------

  ALTER TABLE "CMS_FAC_SECURITY_DEPOSIT" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FAC_SECURITY_DEPOSIT" ADD CONSTRAINT "SQL110121194559820" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194559820"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FCCBRANCH_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_FCCBRANCH_MASTER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FCCBRANCH_MASTER" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_FCCBRANCH_MASTER" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_FCCBRANCH_MASTER" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_FCCBRANCH_MASTER" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_FCCBRANCH_MASTER" MODIFY ("BRANCHCODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_FCCBRANCH_MASTER" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FCUBSDATA_LOG
--------------------------------------------------------

  ALTER TABLE "CMS_FCUBSDATA_LOG" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FCUBSDATA_LOG" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FCUBSDATA_LOG_BKP
--------------------------------------------------------

  ALTER TABLE "CMS_FCUBSDATA_LOG_BKP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FCUBSDATA_LOG_BKP" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FCUBSDATA_LOG_STOCK_ISSUE_13
--------------------------------------------------------

  ALTER TABLE "CMS_FCUBSDATA_LOG_STOCK_ISSUE_13" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_FEED_EXCEPTION
--------------------------------------------------------

  ALTER TABLE "CMS_FEED_EXCEPTION" MODIFY ("EXCEPTION_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FEED_EXCEPTION" ADD CONSTRAINT "CC1169521531969" PRIMARY KEY ("EXCEPTION_ID")
  USING INDEX "CC1169521531969"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FEED_GROUP
--------------------------------------------------------

  ALTER TABLE "CMS_FEED_GROUP" MODIFY ("FEED_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FEED_GROUP" ADD CONSTRAINT "CC1169521555663" PRIMARY KEY ("FEED_GROUP_ID")
  USING INDEX "FEED_GRP_I1"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FEE_DETAILS
--------------------------------------------------------

  ALTER TABLE "CMS_FEE_DETAILS" MODIFY ("FEE_DETAILS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FEE_DETAILS" ADD CONSTRAINT "SQL080609120106210" PRIMARY KEY ("FEE_DETAILS_ID")
  USING INDEX "SQL080609120106210"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FINANCE_DOC
--------------------------------------------------------

  ALTER TABLE "CMS_FINANCE_DOC" MODIFY ("DOC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FINANCE_DOC" MODIFY ("DOC_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_FINANCE_DOC" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FINANCE_DOC" ADD CONSTRAINT "CC1169521576973" PRIMARY KEY ("DOC_ID")
  USING INDEX "CC1169521576973"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FOREX
--------------------------------------------------------

  ALTER TABLE "CMS_FOREX" MODIFY ("FEED_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FOREX" MODIFY ("BUY_CURRENCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_FOREX" MODIFY ("SELL_CURRENCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_FOREX" MODIFY ("BUY_UNIT" NOT NULL ENABLE);
  ALTER TABLE "CMS_FOREX" MODIFY ("EFFECTIVE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_FOREX" MODIFY ("SELL_UNIT" NOT NULL ENABLE);
  ALTER TABLE "CMS_FOREX" MODIFY ("CMS_VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_FOREX" MODIFY ("FEED_REF" NOT NULL ENABLE);
  ALTER TABLE "CMS_FOREX" ADD CONSTRAINT "CC1169521596962" PRIMARY KEY ("FEED_ID")
  USING INDEX "CC1169521596962"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FOREX_HISTORY
--------------------------------------------------------

  ALTER TABLE "CMS_FOREX_HISTORY" MODIFY ("HISTORY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FOREX_HISTORY" MODIFY ("BUY_CURRENCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_FOREX_HISTORY" MODIFY ("SELL_CURRENCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_FOREX_HISTORY" MODIFY ("BUY_UNIT" NOT NULL ENABLE);
  ALTER TABLE "CMS_FOREX_HISTORY" MODIFY ("EFFECTIVE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_FOREX_HISTORY" MODIFY ("SELL_UNIT" NOT NULL ENABLE);
  ALTER TABLE "CMS_FOREX_HISTORY" MODIFY ("CMS_VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_FOREX_HISTORY" MODIFY ("FEED_REF" NOT NULL ENABLE);
  ALTER TABLE "CMS_FOREX_HISTORY" ADD CONSTRAINT "CC1169521625443" PRIMARY KEY ("HISTORY_ID")
  USING INDEX "CC1169521625443"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FUNCTION_ACCESS
--------------------------------------------------------

  ALTER TABLE "CMS_FUNCTION_ACCESS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FUNCTION_ACCESS" MODIFY ("ACTION" NOT NULL ENABLE);
  ALTER TABLE "CMS_FUNCTION_ACCESS" MODIFY ("EVENT" NOT NULL ENABLE);
  ALTER TABLE "CMS_FUNCTION_ACCESS" MODIFY ("ROLE_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_FUNCTION_ACCESS_0305
--------------------------------------------------------

  ALTER TABLE "CMS_FUNCTION_ACCESS_0305" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FUNCTION_ACCESS_0305" MODIFY ("ACTION" NOT NULL ENABLE);
  ALTER TABLE "CMS_FUNCTION_ACCESS_0305" MODIFY ("EVENT" NOT NULL ENABLE);
  ALTER TABLE "CMS_FUNCTION_ACCESS_0305" MODIFY ("ROLE_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_FUNCTION_ACCESS_030714
--------------------------------------------------------

  ALTER TABLE "CMS_FUNCTION_ACCESS_030714" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FUNCTION_ACCESS_030714" MODIFY ("ACTION" NOT NULL ENABLE);
  ALTER TABLE "CMS_FUNCTION_ACCESS_030714" MODIFY ("EVENT" NOT NULL ENABLE);
  ALTER TABLE "CMS_FUNCTION_ACCESS_030714" MODIFY ("ROLE_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_FUNCTION_ACCESS_1707
--------------------------------------------------------

  ALTER TABLE "CMS_FUNCTION_ACCESS_1707" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FUNCTION_ACCESS_1707" MODIFY ("ACTION" NOT NULL ENABLE);
  ALTER TABLE "CMS_FUNCTION_ACCESS_1707" MODIFY ("EVENT" NOT NULL ENABLE);
  ALTER TABLE "CMS_FUNCTION_ACCESS_1707" MODIFY ("ROLE_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_FUNCTION_ACCESS_1712
--------------------------------------------------------

  ALTER TABLE "CMS_FUNCTION_ACCESS_1712" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FUNCTION_ACCESS_1712" MODIFY ("ACTION" NOT NULL ENABLE);
  ALTER TABLE "CMS_FUNCTION_ACCESS_1712" MODIFY ("EVENT" NOT NULL ENABLE);
  ALTER TABLE "CMS_FUNCTION_ACCESS_1712" MODIFY ("ROLE_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_FUNCTION_GROUP
--------------------------------------------------------

  ALTER TABLE "CMS_FUNCTION_GROUP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_FUNCTION_GROUP" ADD CONSTRAINT "SQL110121194554900" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194554900"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_FX14_INTERFACE
--------------------------------------------------------

  ALTER TABLE "CMS_FX14_INTERFACE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_FX14_INTERFACE_LOG
--------------------------------------------------------

  ALTER TABLE "CMS_FX14_INTERFACE_LOG" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_GC_COMPONENT_ERROR
--------------------------------------------------------

  ALTER TABLE "CMS_GC_COMPONENT_ERROR" MODIFY ("COUNT_BEFORE" NOT NULL ENABLE);
  ALTER TABLE "CMS_GC_COMPONENT_ERROR" MODIFY ("COUNT_OF_ACTUALE" NOT NULL ENABLE);
  ALTER TABLE "CMS_GC_COMPONENT_ERROR" MODIFY ("COUNT_OF_STAGE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_GC_INSURANCE
--------------------------------------------------------

  ALTER TABLE "CMS_GC_INSURANCE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_GC_INSURANCE_001
--------------------------------------------------------

  ALTER TABLE "CMS_GC_INSURANCE_001" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_GC_INSURANCE_BK
--------------------------------------------------------

  ALTER TABLE "CMS_GC_INSURANCE_BK" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_GC_INSURANCE_BK" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_GC_INSURANCE_BK" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_GC_INSURANCE_BK" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_GC_INSURANCE_BK" MODIFY ("INSURANCE_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_GC_INSURANCE_BK" MODIFY ("INSURANCE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_GC_INSURANCE_BK" MODIFY ("IS_PROCESSED" NOT NULL ENABLE);
  ALTER TABLE "CMS_GC_INSURANCE_BK" MODIFY ("DEPRECATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_GC_INSURANCE_BK1
--------------------------------------------------------

  ALTER TABLE "CMS_GC_INSURANCE_BK1" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_GC_INSURANCE_ERROR
--------------------------------------------------------

  ALTER TABLE "CMS_GC_INSURANCE_ERROR" MODIFY ("COUNT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_GENERAL_PARAM
--------------------------------------------------------

  ALTER TABLE "CMS_GENERAL_PARAM" MODIFY ("PARAM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_GENERAL_PARAM" ADD PRIMARY KEY ("PARAM_CODE", "PARAM_NAME", "PARAM_VALUE", "UI_VIEW")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_GENERAL_PARAM_1708
--------------------------------------------------------

  ALTER TABLE "CMS_GENERAL_PARAM_1708" MODIFY ("PARAM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_GENERAL_PARAM_290615
--------------------------------------------------------

  ALTER TABLE "CMS_GENERAL_PARAM_290615" MODIFY ("PARAM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_GENERAL_PARAM_GROUP
--------------------------------------------------------

  ALTER TABLE "CMS_GENERAL_PARAM_GROUP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_GENERAL_PARAM_GROUP" ADD CONSTRAINT "C24082010001" PRIMARY KEY ("ID")
  USING INDEX "C24082010001"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_GEOGRAPHY
--------------------------------------------------------

  ALTER TABLE "CMS_GEOGRAPHY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_GEOGRAPHY" MODIFY ("CODE_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_GEOGRAPHY" MODIFY ("CODE_DESC" NOT NULL ENABLE);
  ALTER TABLE "CMS_GEOGRAPHY" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_GEOGRAPHY" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_GEOGRAPHY" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_GEOGRAPHY" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_GEOGRAPHY" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_GEOGRAPHY" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_GEOGRAPHY" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_GEOGRAPHY" ADD CONSTRAINT "CC1295352657681" PRIMARY KEY ("ID")
  USING INDEX "CC1295352657681"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_GLOBAL
--------------------------------------------------------

  ALTER TABLE "CMS_GLOBAL" MODIFY ("DOCUMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_GLOBAL" MODIFY ("DOCUMENT_DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "CMS_GLOBAL" MODIFY ("CATEGORY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_GOLD_FEED
--------------------------------------------------------

  ALTER TABLE "CMS_GOLD_FEED" MODIFY ("GOLD_FEED_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_GOLD_FEED" MODIFY ("FEED_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_GOLD_FEED" ADD CONSTRAINT "GOLD_FEED_PK" PRIMARY KEY ("GOLD_FEED_ID")
  USING INDEX "GOLD_FEED_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_GOODS_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_GOODS_MASTER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_GOODS_MASTER" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_GOODS_MASTER" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_GOODS_MASTER" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_GOODS_MASTER" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_GOODS_MASTER" MODIFY ("GOODS_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_GOODS_MASTER" MODIFY ("GOODS_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_GOODS_MASTER" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_GROUP_CUSTOMER_TEMP
--------------------------------------------------------

  ALTER TABLE "CMS_GROUP_CUSTOMER_TEMP" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_GROUP_MEMBER
--------------------------------------------------------

  ALTER TABLE "CMS_GROUP_MEMBER" MODIFY ("GRP_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_GROUP_MEMBER" ADD CONSTRAINT "SQL110121194742740" PRIMARY KEY ("GRP_MEMBER_ID")
  USING INDEX "SQL110121194742740"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_GROUP_OTRLIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_GROUP_OTRLIMIT" MODIFY ("GRP_OTRLIMIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_GROUP_OTRLIMIT" ADD CONSTRAINT "SQL110121194742630" PRIMARY KEY ("GRP_OTRLIMIT_ID")
  USING INDEX "SQL110121194742630"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_GROUP_SUBLIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_GROUP_SUBLIMIT" MODIFY ("GRP_SUBLIMIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_GROUP_SUBLIMIT" ADD CONSTRAINT "SQL110121194742520" PRIMARY KEY ("GRP_SUBLIMIT_ID")
  USING INDEX "SQL110121194742520"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_GRP_CREDIT_GRADE
--------------------------------------------------------

  ALTER TABLE "CMS_GRP_CREDIT_GRADE" MODIFY ("GRP_CREDIT_GRADE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_GRP_CREDIT_GRADE" ADD CONSTRAINT "SQL110121194742430" PRIMARY KEY ("GRP_CREDIT_GRADE_ID")
  USING INDEX "SQL110121194742430"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_GUARANTEE
--------------------------------------------------------

  ALTER TABLE "CMS_GUARANTEE" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_GUARANTEE" ADD CONSTRAINT "CC1169521668926" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CC1169521668926"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_HEDGE_CNTR
--------------------------------------------------------

  ALTER TABLE "CMS_HEDGE_CNTR" MODIFY ("HEDGECONTRACT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_HEDGE_CNTR" MODIFY ("TREASURY_REF_NO" NOT NULL ENABLE);
  ALTER TABLE "CMS_HEDGE_CNTR" MODIFY ("AGREEMT_REF_NO" NOT NULL ENABLE);
  ALTER TABLE "CMS_HEDGE_CNTR" MODIFY ("MARGIN_PCT" NOT NULL ENABLE);
  ALTER TABLE "CMS_HEDGE_CNTR" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_HEDGE_CNTR" MODIFY ("DEAL_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_HEDGE_CNTR" ADD CONSTRAINT "CC1169521692179" PRIMARY KEY ("HEDGECONTRACT_ID")
  USING INDEX "CC1169521692179"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_HEDGE_EXT
--------------------------------------------------------

  ALTER TABLE "CMS_HEDGE_EXT" MODIFY ("HEDGE_EXT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_HEDGE_EXT" MODIFY ("START_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_HEDGE_EXT" MODIFY ("END_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_HEDGE_EXT" MODIFY ("PERIOD_UNIT_QTY" NOT NULL ENABLE);
  ALTER TABLE "CMS_HEDGE_EXT" MODIFY ("PERIOD_UNIT" NOT NULL ENABLE);
  ALTER TABLE "CMS_HEDGE_EXT" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_HEDGE_EXT" ADD CONSTRAINT "CC1169521709434" PRIMARY KEY ("HEDGE_EXT_ID")
  USING INDEX "CC1169521709434"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_HOLIDAY
--------------------------------------------------------

  ALTER TABLE "CMS_HOLIDAY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY" MODIFY ("START_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY" MODIFY ("END_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_HOLIDAY_19122013
--------------------------------------------------------

  ALTER TABLE "CMS_HOLIDAY_19122013" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY_19122013" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY_19122013" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY_19122013" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY_19122013" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY_19122013" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY_19122013" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY_19122013" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY_19122013" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY_19122013" MODIFY ("START_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY_19122013" MODIFY ("END_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_HOLIDAY_19122013" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_HRMS_DATA
--------------------------------------------------------

  ALTER TABLE "CMS_HRMS_DATA" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_HRMS_DATA" MODIFY ("EMPLOYEE_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_HRMS_DATA" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_HRMS_DATA" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_HRMS_DATA" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_HRMS_DATA" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_HRMS_DATA" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_HRMS_DATA" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_HRMS_DATA" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_IFSC_CODE
--------------------------------------------------------

  ALTER TABLE "CMS_IFSC_CODE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_IFSC_CODE" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_IMAGE_TAG_DETAILS
--------------------------------------------------------

  ALTER TABLE "CMS_IMAGE_TAG_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_IMAGE_TAG_DETAILS" ADD CONSTRAINT "ID_PK" PRIMARY KEY ("ID")
  USING INDEX "ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_IMAGE_UPLOAD
--------------------------------------------------------

  ALTER TABLE "CMS_IMAGE_UPLOAD" MODIFY ("IMG_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_IMAGE_UPLOAD_DETAILS
--------------------------------------------------------

  ALTER TABLE "CMS_IMAGE_UPLOAD_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_IMAGE_UPLOAD_DETAILS" ADD CONSTRAINT "ID_PK_3" PRIMARY KEY ("ID")
  USING INDEX "ID_PK_3"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_INDUSTRY_NAME
--------------------------------------------------------

  ALTER TABLE "CMS_INDUSTRY_NAME" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_INDUSTRY_NAME" ADD CONSTRAINT "PK_INDUSTRY_NAME" PRIMARY KEY ("ID")
  USING INDEX "PK_INDUSTRY_NAME"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_INDUSTRY_NAME_090212
--------------------------------------------------------

  ALTER TABLE "CMS_INDUSTRY_NAME_090212" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_INSURANCE
--------------------------------------------------------

  ALTER TABLE "CMS_INSURANCE" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE" ADD CONSTRAINT "CC1169521731115" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CC1169521731115"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_INSURANCE_CDS
--------------------------------------------------------

  ALTER TABLE "CMS_INSURANCE_CDS" MODIFY ("CDS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_CDS" ADD CONSTRAINT "CC1169521760547" PRIMARY KEY ("CDS_ID")
  USING INDEX "CC1169521760547"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_INSURANCE_COVERAGE
--------------------------------------------------------

  ALTER TABLE "CMS_INSURANCE_COVERAGE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE" MODIFY ("INSURANCE_COVERAGE_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE" MODIFY ("COMPANY_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE" ADD CONSTRAINT "PK_INSURANCE_COVERAGE" PRIMARY KEY ("ID")
  USING INDEX "PK_INSURANCE_COVERAGE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_INSURANCE_COVERAGE_DTLS
--------------------------------------------------------

  ALTER TABLE "CMS_INSURANCE_COVERAGE_DTLS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE_DTLS" MODIFY ("INSURANCE_COVERAGE_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE_DTLS" MODIFY ("INSURANCE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE_DTLS" MODIFY ("CATEGORY_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE_DTLS" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE_DTLS" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE_DTLS" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE_DTLS" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE_DTLS" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE_DTLS" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE_DTLS" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_COVERAGE_DTLS" ADD CONSTRAINT "PK_INSURANCE_COVERAGE_DTLS" PRIMARY KEY ("ID")
  USING INDEX "PK_INSURANCE_COVERAGE_DTLS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_INSURANCE_POLICY
--------------------------------------------------------

  ALTER TABLE "CMS_INSURANCE_POLICY" MODIFY ("INSURANCE_POLICY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_INSURANCE_POLICY" ADD CONSTRAINT "CC1169521793064" PRIMARY KEY ("INSURANCE_POLICY_ID")
  USING INDEX "CC1169521793064"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_INTEREST_RATE
--------------------------------------------------------

  ALTER TABLE "CMS_INTEREST_RATE" MODIFY ("INT_RATE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_INTEREST_RATE" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_INTEREST_RATE" ADD CONSTRAINT "IR_INTRATE_ID_PK" PRIMARY KEY ("INT_RATE_ID")
  USING INDEX "IR_INTRATE_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_INTERFACE_LOG
--------------------------------------------------------

  ALTER TABLE "CMS_INTERFACE_LOG" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_INTERFACE_LOG" MODIFY ("INTERFACENAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_INTERFACE_LOG_BKP
--------------------------------------------------------

  ALTER TABLE "CMS_INTERFACE_LOG_BKP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_INTERFACE_LOG_BKP" MODIFY ("INTERFACENAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_INTERNAL_CREDIT_RATING
--------------------------------------------------------

  ALTER TABLE "CMS_INTERNAL_CREDIT_RATING" MODIFY ("INT_CR_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_INTERNAL_CREDIT_RATING" ADD CONSTRAINT "SQL110121194743850" PRIMARY KEY ("INT_CR_ID")
  USING INDEX "SQL110121194743850"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_INTERNAL_LIMIT_PARAMETER
--------------------------------------------------------

  ALTER TABLE "CMS_INTERNAL_LIMIT_PARAMETER" MODIFY ("INT_LIMIT_PARAM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_INTERNAL_LIMIT_PARAMETER" ADD CONSTRAINT "SQL110121194741990" PRIMARY KEY ("INT_LIMIT_PARAM_ID")
  USING INDEX "SQL110121194741990"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_JS_INTERFACE_LOG
--------------------------------------------------------

  ALTER TABLE "CMS_JS_INTERFACE_LOG" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_JS_INTERFACE_LOG_ROLLBACK_SCM
--------------------------------------------------------

  ALTER TABLE "CMS_JS_INTERFACE_LOG_ROLLBACK_SCM" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_LAD_DETAIL
--------------------------------------------------------

  ALTER TABLE "CMS_LAD_DETAIL" ADD CONSTRAINT "ID" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_LAD_FILTER
--------------------------------------------------------

  ALTER TABLE "CMS_LAD_FILTER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LAD_FILTER" ADD CONSTRAINT "CMS_LAD_FILTER_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_LEAD_NODAL_BANK_STOCK
--------------------------------------------------------

  ALTER TABLE "CMS_LEAD_NODAL_BANK_STOCK" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LEAD_NODAL_BANK_STOCK" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_LEAD_NODAL_BANK_STOCK" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_LEAD_NODAL_BANK_STOCK" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_LEAD_NODAL_BANK_STOCK" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_LEAD_NODAL_BANK_STOCK" ADD CONSTRAINT "pk_cms_lead_nodal_bank_stock" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_LEI_DATE_VALIDATION
--------------------------------------------------------

  ALTER TABLE "CMS_LEI_DATE_VALIDATION" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_LIMIT_CHARGE_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_LIMIT_CHARGE_MAP" MODIFY ("LIMIT_CHARGE_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LIMIT_CHARGE_MAP" MODIFY ("CHARGE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LIMIT_CHARGE_MAP" ADD CONSTRAINT "CC1169521817670" PRIMARY KEY ("LIMIT_CHARGE_MAP_ID")
  USING INDEX "CC1169521817670"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_LIMIT_EXPOSURE
--------------------------------------------------------

  ALTER TABLE "CMS_LIMIT_EXPOSURE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_LIMIT_GRP_AGGR
--------------------------------------------------------

  ALTER TABLE "CMS_LIMIT_GRP_AGGR" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_LIMIT_SECURITY_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_LIMIT_SECURITY_MAP" MODIFY ("CHARGE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LIMIT_SECURITY_MAP" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LIMIT_SECURITY_MAP" ADD CONSTRAINT "CC1169521847312" PRIMARY KEY ("CHARGE_ID")
  USING INDEX "LMT_SEC_I7"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_LINE_DETAIL
--------------------------------------------------------

  ALTER TABLE "CMS_LINE_DETAIL" MODIFY ("LINE_DETAIL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_LINE_DETAIL_TEMP
--------------------------------------------------------

  ALTER TABLE "CMS_LINE_DETAIL_TEMP" MODIFY ("LINE_DETAIL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_LINE_DETAIL_TEMP_STG
--------------------------------------------------------

  ALTER TABLE "CMS_LINE_DETAIL_TEMP_STG" MODIFY ("LINE_DETAIL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_LI_DOC
--------------------------------------------------------

  ALTER TABLE "CMS_LI_DOC" MODIFY ("LI_TEMPLATE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LI_DOC" ADD CONSTRAINT "LI_TEMPLATE_PK" PRIMARY KEY ("LI_TEMPLATE_ID")
  USING INDEX "LI_TEMPLATE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_LMT_BOOK
--------------------------------------------------------

  ALTER TABLE "CMS_LMT_BOOK" MODIFY ("LMT_BK_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LMT_BOOK" ADD CONSTRAINT "PK_CMS_LMT_BK" PRIMARY KEY ("LMT_BK_ID")
  USING INDEX "PK_CMS_LMT_BK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_LMT_BOOK_DTL
--------------------------------------------------------

  ALTER TABLE "CMS_LMT_BOOK_DTL" MODIFY ("LMT_BK_DETAIL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LMT_BOOK_DTL" MODIFY ("LMT_BK_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LMT_BOOK_DTL" ADD CONSTRAINT "PK_CMS_LMT_BK_DTL" PRIMARY KEY ("LMT_BK_DETAIL_ID")
  USING INDEX "PK_CMS_LMT_BK_DTL"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_LOAN_GUARANTOR
--------------------------------------------------------

  ALTER TABLE "CMS_LOAN_GUARANTOR" MODIFY ("GUARANTOR_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_GUARANTOR" MODIFY ("GUARANTOR_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_GUARANTOR" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_GUARANTOR" ADD CONSTRAINT "CC1169521872979" PRIMARY KEY ("GUARANTOR_ID")
  USING INDEX "CC1169521872979"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_LOAN_LMT
--------------------------------------------------------

  ALTER TABLE "CMS_LOAN_LMT" MODIFY ("LOAN_LMT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_LMT" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_LMT" ADD CONSTRAINT "CC1169521909462" PRIMARY KEY ("LOAN_LMT_ID")
  USING INDEX "CC1169521909462"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_LOAN_OBLIGOR
--------------------------------------------------------

  ALTER TABLE "CMS_LOAN_OBLIGOR" MODIFY ("OBLIGOR_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_OBLIGOR" MODIFY ("OBLIGOR_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_OBLIGOR" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_OBLIGOR" ADD CONSTRAINT "CC1169522271182" PRIMARY KEY ("OBLIGOR_ID")
  USING INDEX "CC1169522271182"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_LOAN_PARTICIPANT
--------------------------------------------------------

  ALTER TABLE "CMS_LOAN_PARTICIPANT" MODIFY ("PARTICIPANT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_PARTICIPANT" MODIFY ("PARTICIPANT_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_PARTICIPANT" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_PARTICIPANT" ADD CONSTRAINT "CC1169522773995" PRIMARY KEY ("PARTICIPANT_ID")
  USING INDEX "CC1169522773995"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_LOAN_PAYMT
--------------------------------------------------------

  ALTER TABLE "CMS_LOAN_PAYMT" MODIFY ("EXP_PAYMT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_PAYMT" MODIFY ("EXP_PAYMT_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_PAYMT" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_PAYMT" ADD CONSTRAINT "CC1169522809015" PRIMARY KEY ("EXP_PAYMT_ID")
  USING INDEX "CC1169522809015"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_LOAN_SUB_LMT
--------------------------------------------------------

  ALTER TABLE "CMS_LOAN_SUB_LMT" MODIFY ("SUB_LMT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_SUB_LMT" MODIFY ("SUB_LMT_AMT_CCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_SUB_LMT" MODIFY ("LOAN_FACILITY_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_SUB_LMT" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOAN_SUB_LMT" ADD CONSTRAINT "CC1169522850024" PRIMARY KEY ("SUB_LMT_ID")
  USING INDEX "CC1169522850024"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_LOA_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_LOA_MASTER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOA_MASTER" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOA_MASTER" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOA_MASTER" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOA_MASTER" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_LOA_MASTER_TRX_LOG
--------------------------------------------------------

  ALTER TABLE "CMS_LOA_MASTER_TRX_LOG" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_LOCAL_CAD
--------------------------------------------------------

  ALTER TABLE "CMS_LOCAL_CAD" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOCAL_CAD" MODIFY ("CAD_EMPLOYEE_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOCAL_CAD" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOCAL_CAD" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOCAL_CAD" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOCAL_CAD" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOCAL_CAD" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOCAL_CAD" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOCAL_CAD" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_LOGIN_AUDIT
--------------------------------------------------------

  ALTER TABLE "CMS_LOGIN_AUDIT" MODIFY ("LOGIN_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOGIN_AUDIT" MODIFY ("LOGIN_STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_LOGIN_AUDIT_BKUP_1612
--------------------------------------------------------

  ALTER TABLE "CMS_LOGIN_AUDIT_BKUP_1612" MODIFY ("LOGIN_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOGIN_AUDIT_BKUP_1612" MODIFY ("LOGIN_STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_LOGIN_TEMP
--------------------------------------------------------

  ALTER TABLE "CMS_LOGIN_TEMP" MODIFY ("LOGIN_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOGIN_TEMP" MODIFY ("OLD_LOGIN_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_LOGIN_TEMP" MODIFY ("LOGIN_STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_MAIN_SECTOR_LIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_MAIN_SECTOR_LIMIT" MODIFY ("MAIN_SECTOR_LIMIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_MAIN_SECTOR_LIMIT" ADD CONSTRAINT "MAIN_SECTOR_LIMIT" PRIMARY KEY ("MAIN_SECTOR_LIMIT_ID")
  USING INDEX "MAIN_SECTOR_LIMIT"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_MARKETABLE_SEC
--------------------------------------------------------

  ALTER TABLE "CMS_MARKETABLE_SEC" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_MARKETABLE_SEC" ADD CONSTRAINT "CC1169522884413" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CC1169522884413"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_MEMBERSHIP_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_MEMBERSHIP_TYPE" MODIFY ("MEMBERSHIP_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_MEMBERSHIP_TYPE" ADD CONSTRAINT "CC1169522912494" PRIMARY KEY ("MEMBERSHIP_TYPE_ID")
  USING INDEX "CC1169522912494"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_MF_CHECKLIST
--------------------------------------------------------

  ALTER TABLE "CMS_MF_CHECKLIST" MODIFY ("MF_CHECKLIST_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_MF_CHECKLIST" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_MF_CHECKLIST" MODIFY ("MF_TEMPLATE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_MF_CHECKLIST" ADD CONSTRAINT "MF_CHECKLIST_PK" PRIMARY KEY ("MF_CHECKLIST_ID")
  USING INDEX "MF_CHECKLIST_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_MF_CHECKLIST_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_MF_CHECKLIST_ITEM" MODIFY ("MF_CHECKLIST_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_MF_CHECKLIST_ITEM" ADD CONSTRAINT "MFCHKLSTITEM_PK" PRIMARY KEY ("MF_CHECKLIST_ITEM_ID")
  USING INDEX "MFCHKLSTITEM_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_MF_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_MF_ITEM" MODIFY ("MF_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_MF_ITEM" ADD CONSTRAINT "MF_ITEM_PK" PRIMARY KEY ("MF_ITEM_ID")
  USING INDEX "MF_ITEM_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_MF_TEMPLATE
--------------------------------------------------------

  ALTER TABLE "CMS_MF_TEMPLATE" MODIFY ("MF_TEMPLATE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_MF_TEMPLATE" ADD CONSTRAINT "MF_TEMPLATE_PK" PRIMARY KEY ("MF_TEMPLATE_ID")
  USING INDEX "MF_TEMPLATE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_MF_TEMPLATE_SEC_SUBTYPE
--------------------------------------------------------

  ALTER TABLE "CMS_MF_TEMPLATE_SEC_SUBTYPE" MODIFY ("TEMPLATE_SUBTYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_MF_TEMPLATE_SEC_SUBTYPE" MODIFY ("MF_TEMPLATE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_MF_TEMPLATE_SEC_SUBTYPE" MODIFY ("SECURITY_SUB_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_MF_TEMPLATE_SEC_SUBTYPE" ADD CONSTRAINT "MF_SEC_SUBTYPE_PK" PRIMARY KEY ("TEMPLATE_SUBTYPE_ID")
  USING INDEX "MF_SEC_SUBTYPE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_MODULE_ACCESS
--------------------------------------------------------

  ALTER TABLE "CMS_MODULE_ACCESS" MODIFY ("ACCESS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_MODULE_ACCESS" MODIFY ("ROLE" NOT NULL ENABLE);
  ALTER TABLE "CMS_MODULE_ACCESS" MODIFY ("MODULE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_MONITOR_DOC_CODE
--------------------------------------------------------

  ALTER TABLE "CMS_MONITOR_DOC_CODE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_MONITOR_DOC_CODE" ADD CONSTRAINT "CC1169522966522" PRIMARY KEY ("ID")
  USING INDEX "CC1169522966522"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_MQ_MESSAGE_LOG
--------------------------------------------------------

  ALTER TABLE "CMS_MQ_MESSAGE_LOG" MODIFY ("LOG_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_MUTUAL_FUNDS_FEED
--------------------------------------------------------

  ALTER TABLE "CMS_MUTUAL_FUNDS_FEED" MODIFY ("FEED_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_MUTUAL_FUNDS_FEED" MODIFY ("SCHEME_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_MUTUAL_FUNDS_FEED" MODIFY ("SCHEME_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_MUTUAL_FUNDS_FEED" MODIFY ("SCHEME_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_MUTUAL_FUNDS_FEED" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_MUTUAL_FUNDS_FEED" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_MUTUAL_FUNDS_FEED" ADD CONSTRAINT "CMS_MUTUAL_FUNDS_FEED_PK" PRIMARY KEY ("FEED_ID")
  USING INDEX "CMS_MUTUAL_FUNDS_FEED_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_MY_DEMO
--------------------------------------------------------

  ALTER TABLE "CMS_MY_DEMO" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_MY_DEMO" MODIFY ("CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_MY_DEMO" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_MY_DEMO" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "CMS_MY_DEMO" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "CMS_MY_DEMO" MODIFY ("CONTACT" NOT NULL ENABLE);
  ALTER TABLE "CMS_MY_DEMO" MODIFY ("DEPRECATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_NEW_PROD_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_NEW_PROD_TYPE" MODIFY ("CMS_NEW_PROD_TYPE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_NEW_TAT
--------------------------------------------------------

  ALTER TABLE "CMS_NEW_TAT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_NEW_TAT_REPORT_CASEBASE
--------------------------------------------------------

  ALTER TABLE "CMS_NEW_TAT_REPORT_CASEBASE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_NOMINEES
--------------------------------------------------------

  ALTER TABLE "CMS_NOMINEES" MODIFY ("CMS_NOMINEES_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_NOMINEES" ADD CONSTRAINT "SQL080609120113030" PRIMARY KEY ("CMS_NOMINEES_ID")
  USING INDEX "SQL080609120113030"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_NOMINEES_CUSTOMER_TEMP
--------------------------------------------------------

  ALTER TABLE "CMS_NOMINEES_CUSTOMER_TEMP" MODIFY ("CMS_NOMINEES_CUSTOMER_TEMP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_NOMINEES_CUSTOMER_TEMP" ADD CONSTRAINT "SQL080609120122000" PRIMARY KEY ("CMS_NOMINEES_CUSTOMER_TEMP_ID")
  USING INDEX "SQL080609120122000"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_NPADATA_LOG
--------------------------------------------------------

  ALTER TABLE "CMS_NPADATA_LOG" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_NPADATA_LOG" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_NPA_TRAQ_CODE_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_NPA_TRAQ_CODE_MASTER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_NPA_TRAQ_CODE_MASTER" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_NPA_TRAQ_CODE_MASTER" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_NPA_TRAQ_CODE_MASTER" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_NPA_TRAQ_CODE_MASTER" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_NPA_TRAQ_CODE_MASTER" MODIFY ("NPA_TRAQ_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_NPA_TRAQ_CODE_MASTER" MODIFY ("SECURITY_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_NPA_TRAQ_CODE_MASTER" MODIFY ("SECURITY_SUB_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_NPA_TRAQ_CODE_MASTER" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_NPL
--------------------------------------------------------

  ALTER TABLE "CMS_NPL" MODIFY ("CMS_NPL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_NPL" ADD CONSTRAINT "PK_CMS_NPL" PRIMARY KEY ("CMS_NPL_ID")
  USING INDEX "PK_CMS_NPL"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_OTHERS
--------------------------------------------------------

  ALTER TABLE "CMS_OTHERS" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHERS" ADD CONSTRAINT "CC1169523006309" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CC1169523006309"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_OTHER_BANK
--------------------------------------------------------

  ALTER TABLE "CMS_OTHER_BANK" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK" MODIFY ("BANK_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK" MODIFY ("BANK_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_OTHER_BANK_BRANCH
--------------------------------------------------------

  ALTER TABLE "CMS_OTHER_BANK_BRANCH" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK_BRANCH" MODIFY ("BRANCH_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK_BRANCH" MODIFY ("OTHER_BANK_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK_BRANCH" MODIFY ("BRANCH_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK_BRANCH" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK_BRANCH" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK_BRANCH" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK_BRANCH" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK_BRANCH" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK_BRANCH" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK_BRANCH" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_OTHER_BANK_BRANCH" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_PARTY_GROUP
--------------------------------------------------------

  ALTER TABLE "CMS_PARTY_GROUP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PARTY_GROUP" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_PARTY_GROUP" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_PARTY_GROUP" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_PARTY_GROUP" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_PARTY_GROUP" MODIFY ("PARTY_GROUP_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_PARTY_GROUP" MODIFY ("PARTY_GROUP_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_PARTY_GROUP" MODIFY ("CURRENCY_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_PARTY_GROUP" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_PARTY_GROUP" ADD CONSTRAINT "PK_CMS_PARTY_GROUP_ID" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PASSWORD_HISTORY
--------------------------------------------------------

  ALTER TABLE "CMS_PASSWORD_HISTORY" MODIFY ("PWD_HISTORY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PASSWORD_HISTORY" MODIFY ("CREDENTIALS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PASSWORD_HISTORY" MODIFY ("PWD_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_PASSWORD_HISTORY" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "CMS_PASSWORD_HISTORY" MODIFY ("PWD_SET_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_PASSWORD_HISTORY" MODIFY ("PWD_EXPIRY_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_PASSWORD_HISTORY" ADD CONSTRAINT "CC1169523043692" PRIMARY KEY ("PWD_HISTORY_ID")
  USING INDEX "CC1169523043692"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PASSWORD_MAILER
--------------------------------------------------------

  ALTER TABLE "CMS_PASSWORD_MAILER" MODIFY ("PWD_MAILER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PASSWORD_MAILER" MODIFY ("REFERENCE_NO" NOT NULL ENABLE);
  ALTER TABLE "CMS_PASSWORD_MAILER" MODIFY ("OWNER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PASSWORD_MAILER" MODIFY ("REQUESTED_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_PASSWORD_MAILER" MODIFY ("AUTHENTICATION_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PASSWORD_MAILER" ADD CONSTRAINT "CC1169523065484" PRIMARY KEY ("PWD_MAILER_ID")
  USING INDEX "CC1169523065484"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PASSWORD_POLICY
--------------------------------------------------------

  ALTER TABLE "CMS_PASSWORD_POLICY" MODIFY ("POLICY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PASSWORD_POLICY" ADD CONSTRAINT "CC1169523090219" PRIMARY KEY ("POLICY_ID")
  USING INDEX "CC1169523090219"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PCH_SALE
--------------------------------------------------------

  ALTER TABLE "CMS_PCH_SALE" MODIFY ("PURCHASE_SALES_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PCH_SALE" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PCH_SALE" ADD CONSTRAINT "CC1169525464784" PRIMARY KEY ("PURCHASE_SALES_ID")
  USING INDEX "CC1169525464784"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_POLICY_CAP
--------------------------------------------------------

  ALTER TABLE "CMS_POLICY_CAP" MODIFY ("POLICY_CAP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_POLICY_CAP" ADD CONSTRAINT "CRP_PC_ID_PK" PRIMARY KEY ("POLICY_CAP_ID")
  USING INDEX "CRP_PC_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_POLICY_CAP_GROUP
--------------------------------------------------------

  ALTER TABLE "CMS_POLICY_CAP_GROUP" MODIFY ("POLICY_CAP_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_POLICY_CAP_GROUP" ADD CONSTRAINT "PCG_PK" PRIMARY KEY ("POLICY_CAP_GROUP_ID")
  USING INDEX "PCG_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PORTFOLIO_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_PORTFOLIO_ITEM" MODIFY ("ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PORTFOLIO_ITEM" ADD CONSTRAINT "CC1169525537398" PRIMARY KEY ("ITEM_ID")
  USING INDEX "CC1169525537398"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PORTFOLIO_ITEM_DTL
--------------------------------------------------------

  ALTER TABLE "CMS_PORTFOLIO_ITEM_DTL" MODIFY ("ITEM_DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PORTFOLIO_ITEM_DTL" MODIFY ("ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PORTFOLIO_ITEM_DTL" ADD CONSTRAINT "ITEM_ID_PK" PRIMARY KEY ("ITEM_DTL_ID")
  USING INDEX "ITEM_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PORTFOLIO_ITEM__21032016
--------------------------------------------------------

  ALTER TABLE "CMS_PORTFOLIO_ITEM__21032016" MODIFY ("ITEM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_PRECOND
--------------------------------------------------------

  ALTER TABLE "CMS_PRECOND" MODIFY ("PRECOND_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PRECOND" ADD CONSTRAINT "CC1169525574131" PRIMARY KEY ("PRECOND_ID")
  USING INDEX "CC1169525574131"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PRICE_FEED
--------------------------------------------------------

  ALTER TABLE "CMS_PRICE_FEED" MODIFY ("FEED_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PRICE_FEED" MODIFY ("CMS_VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_PRICE_FEED" MODIFY ("FEED_REF" NOT NULL ENABLE);
  ALTER TABLE "CMS_PRICE_FEED" ADD CONSTRAINT "CC1169525802209" PRIMARY KEY ("FEED_ID")
  USING INDEX "PRI_FEED_I2"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PRICE_FEED_HISTORY
--------------------------------------------------------

  ALTER TABLE "CMS_PRICE_FEED_HISTORY" MODIFY ("HISTORY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PRICE_FEED_HISTORY" MODIFY ("CMS_VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_PRICE_FEED_HISTORY" MODIFY ("FEED_REF" NOT NULL ENABLE);
  ALTER TABLE "CMS_PRICE_FEED_HISTORY" ADD CONSTRAINT "CC1169525830910" PRIMARY KEY ("HISTORY_ID")
  USING INDEX "CC1169525830910"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PRODUCT_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_PRODUCT_MASTER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PRODUCT_MASTER" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_PRODUCT_MASTER" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_PRODUCT_MASTER" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_PRODUCT_MASTER" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_PRODUCT_MASTER" MODIFY ("PRODUCT_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_PRODUCT_MASTER" MODIFY ("PRODUCT_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_PRODUCT_MASTER" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PRODUCT_PROGRAM
--------------------------------------------------------

  ALTER TABLE "CMS_PRODUCT_PROGRAM" MODIFY ("PRODUCT_PROGRAM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PRODUCT_PROGRAM" ADD CONSTRAINT "SQL110121194747380" PRIMARY KEY ("PRODUCT_PROGRAM_ID")
  USING INDEX "SQL110121194747380"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PRODUCT_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_PRODUCT_TYPE" MODIFY ("PRODUCT_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PRODUCT_TYPE" ADD CONSTRAINT "SQL110121194747430" PRIMARY KEY ("PRODUCT_TYPE_ID")
  USING INDEX "SQL110121194747430"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PROPERTY
--------------------------------------------------------

  ALTER TABLE "CMS_PROPERTY" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PROPERTY" ADD CONSTRAINT "CC1169525857048" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CMS_PROPERTY_IDX1"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PROPERTY_IDX
--------------------------------------------------------

  ALTER TABLE "CMS_PROPERTY_IDX" MODIFY ("PROPERTY_IDX_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PROPERTY_IDX" ADD CONSTRAINT "SQL110121194555150" PRIMARY KEY ("PROPERTY_IDX_ID")
  USING INDEX "SQL110121194555150"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PROPERTY_IDX_DISTRICT_CODE
--------------------------------------------------------

  ALTER TABLE "CMS_PROPERTY_IDX_DISTRICT_CODE" MODIFY ("PROPERTY_IDX_DISTRICT_CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PROPERTY_IDX_DISTRICT_CODE" ADD CONSTRAINT "SQL110121194555550" PRIMARY KEY ("PROPERTY_IDX_DISTRICT_CODE_ID")
  USING INDEX "SQL110121194555550"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PROPERTY_IDX_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_PROPERTY_IDX_ITEM" MODIFY ("PROPERTY_IDX_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PROPERTY_IDX_ITEM" ADD CONSTRAINT "SQL110121194555260" PRIMARY KEY ("PROPERTY_IDX_ITEM_ID")
  USING INDEX "SQL110121194555260"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PROPERTY_IDX_MUKIM_CODE
--------------------------------------------------------

  ALTER TABLE "CMS_PROPERTY_IDX_MUKIM_CODE" MODIFY ("PROPERTY_IDX_MUKIM_CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PROPERTY_IDX_MUKIM_CODE" ADD CONSTRAINT "SQL110121194555720" PRIMARY KEY ("PROPERTY_IDX_MUKIM_CODE_ID")
  USING INDEX "SQL110121194555720"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PROPERTY_IDX_PROPERTY_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_PROPERTY_IDX_PROPERTY_TYPE" MODIFY ("PROPERTY_IDX_PROPERTY_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PROPERTY_IDX_PROPERTY_TYPE" ADD CONSTRAINT "SQL110121194555940" PRIMARY KEY ("PROPERTY_IDX_PROPERTY_TYPE_ID")
  USING INDEX "SQL110121194555940"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PROPERTY_IDX_SEC_SUBTYPE
--------------------------------------------------------

  ALTER TABLE "CMS_PROPERTY_IDX_SEC_SUBTYPE" MODIFY ("PROPERTY_IDX_SEC_SUBTYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PROPERTY_IDX_SEC_SUBTYPE" ADD CONSTRAINT "SQL110121194555380" PRIMARY KEY ("PROPERTY_IDX_SEC_SUBTYPE_ID")
  USING INDEX "SQL110121194555380"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PROPERTY_PARAMETERS
--------------------------------------------------------

  ALTER TABLE "CMS_PROPERTY_PARAMETERS" MODIFY ("PARAMETER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PROPERTY_PARAMETERS" ADD CONSTRAINT "SQL080609120049030" PRIMARY KEY ("PARAMETER_ID")
  USING INDEX "SQL080609120049030"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PSCC_GENERATED
--------------------------------------------------------

  ALTER TABLE "CMS_PSCC_GENERATED" MODIFY ("PSCC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PSCC_GENERATED" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PSCC_GENERATED" ADD CONSTRAINT "CC1169526007144" PRIMARY KEY ("PSCC_ID")
  USING INDEX "CC1169526007144"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PSCC_GENERATED_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_PSCC_GENERATED_ITEM" MODIFY ("PSCC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PSCC_GENERATED_ITEM" MODIFY ("CMS_LSP_APPR_LMTS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PSCC_GENERATED_ITEM" MODIFY ("ACTIVATED_LIMIT" NOT NULL ENABLE);
  ALTER TABLE "CMS_PSCC_GENERATED_ITEM" ADD CONSTRAINT "CC1169526034864" PRIMARY KEY ("PSCC_ITEM_ID")
  USING INDEX "CC1169526034864"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PSRDATA_LOG
--------------------------------------------------------

  ALTER TABLE "CMS_PSRDATA_LOG" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PSRDATA_LOG" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PSRDATA_LOG_BKP
--------------------------------------------------------

  ALTER TABLE "CMS_PSRDATA_LOG_BKP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_PSRDATA_LOG_BKP" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_PUBLIC_HOLIDAY
--------------------------------------------------------

  ALTER TABLE "CMS_PUBLIC_HOLIDAY" MODIFY ("HOLIDAY_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_PUBLIC_HOLIDAY" MODIFY ("COUNTRY_ISO_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_RBI_CATEGORY
--------------------------------------------------------

  ALTER TABLE "CMS_RBI_CATEGORY" MODIFY ("RBI_CATEGORY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_RBI_CATEGORY" MODIFY ("INDUSTRY_NAME_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_RBI_CATEGORY" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_RBI_CATEGORY" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_RBI_CATEGORY" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_RBI_CATEGORY" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_RBI_CATEGORY" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_RBI_CATEGORY" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_RBI_CATEGORY" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_RBI_CATEGORY" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_RBI_CATEGORY" ADD CONSTRAINT "PK_CMS_RBI_CATEGORY" PRIMARY KEY ("RBI_CATEGORY_ID")
  USING INDEX "PK_CMS_RBI_CATEGORY"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_RCPT_RELEASE
--------------------------------------------------------

  ALTER TABLE "CMS_RCPT_RELEASE" MODIFY ("RELEASE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_RCPT_RELEASE" MODIFY ("RELEASE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_RCPT_RELEASE" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_RCPT_RELEASE" ADD CONSTRAINT "CC1169526105155" PRIMARY KEY ("RELEASE_ID")
  USING INDEX "CC1169526105155"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_RECURRENT_DOC
--------------------------------------------------------

  ALTER TABLE "CMS_RECURRENT_DOC" MODIFY ("RECURRENT_DOC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_RECURRENT_DOC" ADD CONSTRAINT "CC1169526127737" PRIMARY KEY ("RECURRENT_DOC_ID")
  USING INDEX "CC1169526127737"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_RECURRENT_DOC_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_RECURRENT_DOC_ITEM" MODIFY ("RECURRENT_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_RECURRENT_DOC_ITEM" MODIFY ("RECURRENT_ITEM_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_RECURRENT_DOC_ITEM" ADD CONSTRAINT "CC1169526151571" PRIMARY KEY ("RECURRENT_ITEM_ID")
  USING INDEX "CC1169526151571"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_RECURRENT_DOC_SUB_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_RECURRENT_DOC_SUB_ITEM" MODIFY ("SUB_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_RECURRENT_DOC_SUB_ITEM" MODIFY ("SUB_ITEM_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_RECURRENT_DOC_SUB_ITEM" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_RECURRENT_DOC_SUB_ITEM" ADD CONSTRAINT "CC1169526174274" PRIMARY KEY ("SUB_ITEM_ID")
  USING INDEX "CC1169526174274"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_REGION
--------------------------------------------------------

  ALTER TABLE "CMS_REGION" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_REGION" MODIFY ("REGION_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_REGION" MODIFY ("REGION_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_REGION" MODIFY ("COUNTRY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_REGION" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_REGION" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_REGION" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_REGION" ADD CONSTRAINT "SQL110414163848110" PRIMARY KEY ("ID")
  USING INDEX "SQL110414163848110"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_RELATIONSHIP_MGR
--------------------------------------------------------

  ALTER TABLE "CMS_RELATIONSHIP_MGR" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_RELATIONSHIP_MGR" MODIFY ("RM_MGR_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_RELATIONSHIP_MGR" MODIFY ("RM_MGR_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_RELATIONSHIP_MGR" MODIFY ("RM_MGR_MAIL" NOT NULL ENABLE);
  ALTER TABLE "CMS_RELATIONSHIP_MGR" MODIFY ("REGION" NOT NULL ENABLE);
  ALTER TABLE "CMS_RELATIONSHIP_MGR" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_RELATIONSHIP_MGR" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_RELATIONSHIP_MGR" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_RELATIONSHIP_MGR" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_RELATIONSHIP_MGR" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_RELATIONSHIP_MGR" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_RELATIONSHIP_MGR" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_RELATIONSHIP_MGR" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_RELATIONSHIP_MGR" ADD CONSTRAINT "PK_RELATIONSHIP_MGR_3" PRIMARY KEY ("ID")
  USING INDEX "PK_RELATIONSHIP_MGR_3"  ENABLE;
  ALTER TABLE "CMS_RELATIONSHIP_MGR" ADD CONSTRAINT "SQL110406120710080" UNIQUE ("RM_MGR_CODE")
  USING INDEX "SQL110406120710080"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_REPORT
--------------------------------------------------------

  ALTER TABLE "CMS_REPORT" MODIFY ("REPORT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_REPORT" ADD CONSTRAINT "PK_REPORT_ID" PRIMARY KEY ("REPORT_ID")
  USING INDEX "PK_REPORT_ID"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_REPORT_COUNTRY_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_REPORT_COUNTRY_MAP" MODIFY ("REPORT_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_REPORT_COUNTRY_MAP" MODIFY ("COUNTRY_ISO_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_REPORT_COUNTRY_MAP" ADD CONSTRAINT "CC1169526208513" PRIMARY KEY ("REPORT_MASTER_ID", "COUNTRY_ISO_CODE")
  USING INDEX "CC1169526208513"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_REPORT_DUEDATE_PARAM
--------------------------------------------------------

  ALTER TABLE "CMS_REPORT_DUEDATE_PARAM" MODIFY ("PARAM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_REPORT_DUEDATE_PARAM" MODIFY ("VALID_FREQ" NOT NULL ENABLE);
  ALTER TABLE "CMS_REPORT_DUEDATE_PARAM" MODIFY ("VALID_FREQ_UNIT" NOT NULL ENABLE);
  ALTER TABLE "CMS_REPORT_DUEDATE_PARAM" MODIFY ("MIS_REPORT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_REPORT_DUEDATE_PARAM" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_REPORT_DUEDATE_PARAM" ADD CONSTRAINT "SQL080609120047930" PRIMARY KEY ("PARAM_ID")
  USING INDEX "SQL080609120047930"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_REPORT_ERRLOG
--------------------------------------------------------

  ALTER TABLE "CMS_REPORT_ERRLOG" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_REPORT_ERRLOG" ADD CONSTRAINT "CC1169526321315" PRIMARY KEY ("ID")
  USING INDEX "CC1169526321315"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_REPORT_FREQUENCY
--------------------------------------------------------

  ALTER TABLE "CMS_REPORT_FREQUENCY" MODIFY ("REPORT_FREQUENCY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_REPORT_FREQUENCY" ADD CONSTRAINT "CC1169526345911" PRIMARY KEY ("REPORT_FREQUENCY_ID")
  USING INDEX "CC1169526345911"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_REPORT_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_REPORT_MASTER" MODIFY ("REPORT_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_REPORT_MASTER" ADD CONSTRAINT "CC1169526366480" PRIMARY KEY ("REPORT_MASTER_ID")
  USING INDEX "CC1169526366480"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_REPORT_REQUEST
--------------------------------------------------------

  ALTER TABLE "CMS_REPORT_REQUEST" MODIFY ("REPORT_REQUEST_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_REPORT_REQUEST" MODIFY ("REPORT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_REPORT_REQUEST" ADD CONSTRAINT "CC1169526387280" PRIMARY KEY ("REPORT_REQUEST_ID")
  USING INDEX "CC1169526387280"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_REPORT_TEMPLATE
--------------------------------------------------------

  ALTER TABLE "CMS_REPORT_TEMPLATE" MODIFY ("REPORT_TEMPLATE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_REPORT_TEMPLATE" ADD CONSTRAINT "CC1169526404906" PRIMARY KEY ("REPORT_TEMPLATE_ID")
  USING INDEX "CC1169526404906"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_REV_CHECKLIST_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_REV_CHECKLIST_ITEM" MODIFY ("CMS_REV_CHECKLIST_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_REV_CHECKLIST_ITEM" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
  ALTER TABLE "CMS_REV_CHECKLIST_ITEM" ADD CONSTRAINT "CC1169526426286" PRIMARY KEY ("CMS_REV_CHECKLIST_ITEM_ID")
  USING INDEX "CC1169526426286"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_ROLE_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_ROLE_TYPE" MODIFY ("ROLETYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_ROLE_TYPE" ADD CONSTRAINT "CC1169526448328" PRIMARY KEY ("ROLETYPE_ID")
  USING INDEX "CC1169526448328"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SAMPLE_TEST
--------------------------------------------------------

  ALTER TABLE "CMS_SAMPLE_TEST" MODIFY ("PRDID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SAMPLE_TEST" ADD CONSTRAINT "PK_SAMPLE_TEST" PRIMARY KEY ("PRDID")
  USING INDEX "PK_SAMPLE_TEST"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SCC_GENERATED
--------------------------------------------------------

  ALTER TABLE "CMS_SCC_GENERATED" MODIFY ("SCC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SCC_GENERATED" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SCC_GENERATED" ADD CONSTRAINT "CC1169526474295" PRIMARY KEY ("SCC_ID")
  USING INDEX "CC1169526474295"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SCC_GENERATED_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_SCC_GENERATED_ITEM" MODIFY ("SCC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SCC_GENERATED_ITEM" MODIFY ("CMS_LSP_APPR_LMTS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SCC_GENERATED_ITEM" MODIFY ("ACTIVATED_LIMIT" NOT NULL ENABLE);
  ALTER TABLE "CMS_SCC_GENERATED_ITEM" ADD CONSTRAINT "CC1169526826051" PRIMARY KEY ("SCC_ITEM_ID")
  USING INDEX "CC1169526826051"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SCHEDULER_LOG
--------------------------------------------------------

  ALTER TABLE "CMS_SCHEDULER_LOG" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SCHEDULER_LOG" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_SCHEDULER_LOG" MODIFY ("SCHEDULER_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_SCHEDULER_LOG" MODIFY ("SCHEDULER_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_SCHEDULER_LOG" ADD CONSTRAINT "PK_CMS_SCHEDULER_LOG" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SECTOR_LIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_SECTOR_LIMIT" MODIFY ("SECTOR_LIMIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECTOR_LIMIT" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECTOR_LIMIT" ADD CONSTRAINT "SCTR_LMT_PK" PRIMARY KEY ("SECTOR_LIMIT_ID")
  USING INDEX "SCTR_LMT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SECURITY
--------------------------------------------------------

  ALTER TABLE "CMS_SECURITY" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY" ADD CONSTRAINT "CC1169526972261" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "SEC_I2"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SECURITY_10052016
--------------------------------------------------------

  ALTER TABLE "CMS_SECURITY_10052016" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_10052016" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_SECURITY_310713
--------------------------------------------------------

  ALTER TABLE "CMS_SECURITY_310713" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_310713" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_SECURITY_APPORTIONMENT
--------------------------------------------------------

  ALTER TABLE "CMS_SECURITY_APPORTIONMENT" MODIFY ("SEC_APPORTIONMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_APPORTIONMENT" MODIFY ("PRIORITY_RANKING" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_APPORTIONMENT" MODIFY ("PRIORITY_RANKING_AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_APPORTIONMENT" MODIFY ("PERC_AMT_IND" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_APPORTIONMENT" MODIFY ("MIN_PERC_AMT_IND" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_APPORTIONMENT" MODIFY ("MAX_PERC_AMT_IND" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_APPORTIONMENT" MODIFY ("CHARGE_DETAIL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_APPORTIONMENT" ADD CONSTRAINT "CC1169527006901" PRIMARY KEY ("SEC_APPORTIONMENT_ID")
  USING INDEX "CC1169527006901"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SECURITY_ASSET_LIFE
--------------------------------------------------------

  ALTER TABLE "CMS_SECURITY_ASSET_LIFE" MODIFY ("SECURITY_SUB_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_ASSET_LIFE" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_ASSET_LIFE" ADD CONSTRAINT "AL_SUBTYPE_ID_PK" PRIMARY KEY ("SECURITY_SUB_TYPE_ID")
  USING INDEX "AL_SUBTYPE_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SECURITY_COVERAGE
--------------------------------------------------------

  ALTER TABLE "CMS_SECURITY_COVERAGE" MODIFY ("SEC_COVERAGE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_COVERAGE" ADD CONSTRAINT "pk_cms_security_coverage" PRIMARY KEY ("SEC_COVERAGE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SECURITY_INSTRUMENT
--------------------------------------------------------

  ALTER TABLE "CMS_SECURITY_INSTRUMENT" MODIFY ("CMS_INSTRUMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_INSTRUMENT" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_INSTRUMENT" ADD CONSTRAINT "SEC_INSTRUMT_PK" PRIMARY KEY ("CMS_INSTRUMENT_ID")
  USING INDEX "SEC_INSTRUMT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SECURITY_PARAMETER
--------------------------------------------------------

  ALTER TABLE "CMS_SECURITY_PARAMETER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_PARAMETER" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_PARAMETER" ADD CONSTRAINT "CC1169527025318" PRIMARY KEY ("ID")
  USING INDEX "CC1169527025318"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SECURITY_SOURCE
--------------------------------------------------------

  ALTER TABLE "CMS_SECURITY_SOURCE" MODIFY ("CMS_SECURITY_SOURCE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_SOURCE" ADD CONSTRAINT "SEC_SOURCE_ID_PK" PRIMARY KEY ("CMS_SECURITY_SOURCE_ID")
  USING INDEX "SEC_SOURCE_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SECURITY_STOCK_TEMP
--------------------------------------------------------

  ALTER TABLE "CMS_SECURITY_STOCK_TEMP" MODIFY ("GC_DET_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_STOCK_TEMP" MODIFY ("GC_STOCK_DET_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_SECURITY_SUB_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_SECURITY_SUB_TYPE" MODIFY ("SECURITY_SUB_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_SUB_TYPE" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SECURITY_SUB_TYPE" ADD CONSTRAINT "CC1169527045367" PRIMARY KEY ("SECURITY_SUB_TYPE_ID")
  USING INDEX "CC1169527045367"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SEC_ENVELOPE
--------------------------------------------------------

  ALTER TABLE "CMS_SEC_ENVELOPE" MODIFY ("SEC_ENVELOPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SEC_ENVELOPE" MODIFY ("SEC_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SEC_ENVELOPE" ADD CONSTRAINT "SQL110121194556070" PRIMARY KEY ("SEC_ENVELOPE_ID")
  USING INDEX "SQL110121194556070"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SEC_ENVELOPE_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_SEC_ENVELOPE_ITEM" MODIFY ("SEC_ENVELOPE_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SEC_ENVELOPE_ITEM" MODIFY ("SEC_ENVELOPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SEC_ENVELOPE_ITEM" MODIFY ("SEC_ENVELOPE_ITEM_ADDR" NOT NULL ENABLE);
  ALTER TABLE "CMS_SEC_ENVELOPE_ITEM" MODIFY ("SEC_ENVELOPE_ITEM_BARCODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_SEC_ENVELOPE_ITEM" MODIFY ("SEC_ENVELOPE_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SEC_ENVELOPE_ITEM" ADD CONSTRAINT "SQL110121194556190" PRIMARY KEY ("SEC_ENVELOPE_ITEM_ID")
  USING INDEX "SQL110121194556190"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SEC_LIQUIDATION
--------------------------------------------------------

  ALTER TABLE "CMS_SEC_LIQUIDATION" MODIFY ("LIQUIDATION_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SEC_LIQUIDATION" ADD CONSTRAINT "LIQUIDATION_PK" PRIMARY KEY ("LIQUIDATION_ID")
  USING INDEX "LIQUIDATION_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SEC_RECOVERY
--------------------------------------------------------

  ALTER TABLE "CMS_SEC_RECOVERY" MODIFY ("RECOVERY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SEC_RECOVERY" ADD CONSTRAINT "RECOVERY_PK" PRIMARY KEY ("RECOVERY_ID")
  USING INDEX "RECOVERY_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SEC_RECOVERY_EXPENSE
--------------------------------------------------------

  ALTER TABLE "CMS_SEC_RECOVERY_EXPENSE" MODIFY ("RECOVERY_EXPENSE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SEC_RECOVERY_EXPENSE" ADD CONSTRAINT "RECOV_EXP_PK" PRIMARY KEY ("RECOVERY_EXPENSE_ID")
  USING INDEX "RECOV_EXP_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SEC_RECOVERY_INCOME
--------------------------------------------------------

  ALTER TABLE "CMS_SEC_RECOVERY_INCOME" MODIFY ("RECOVERY_INCOME_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SEC_RECOVERY_INCOME" ADD CONSTRAINT "RECOV_INC_PK" PRIMARY KEY ("RECOVERY_INCOME_ID")
  USING INDEX "RECOV_INC_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SETTLEMENT
--------------------------------------------------------

  ALTER TABLE "CMS_SETTLEMENT" MODIFY ("SETTLEMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SETTLEMENT" MODIFY ("PAYMENT_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_SETTLEMENT" MODIFY ("PAYMENT_CCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_SETTLEMENT" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SETTLEMENT" ADD CONSTRAINT "CC1169527064624" PRIMARY KEY ("SETTLEMENT_ID")
  USING INDEX "CC1169527064624"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SMS_UPLOAD_LOG
--------------------------------------------------------

  ALTER TABLE "CMS_SMS_UPLOAD_LOG" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_SPEC_COVENANT_DTLS
--------------------------------------------------------

  ALTER TABLE "CMS_SPEC_COVENANT_DTLS" MODIFY ("COVENANT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_SPEC_LINE_COVENANT_DTLS
--------------------------------------------------------

  ALTER TABLE "CMS_SPEC_LINE_COVENANT_DTLS" MODIFY ("COVENANT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_SSL_TOKEN
--------------------------------------------------------

  ALTER TABLE "CMS_SSL_TOKEN" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SSL_TOKEN" MODIFY ("TOKEN" NOT NULL ENABLE);
  ALTER TABLE "CMS_SSL_TOKEN" ADD CONSTRAINT "CC1169527086105" PRIMARY KEY ("USER_ID")
  USING INDEX "CC1169527086105"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ADD_DOC_FAC_DET
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ADD_DOC_FAC_DET" MODIFY ("ADD_DOC_FAC_DET_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ADD_DOC_FAC_DET" ADD PRIMARY KEY ("ADD_DOC_FAC_DET_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_APPROVAL_MATRIX
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_APPROVAL_MATRIX" MODIFY ("APPROVAL_MATRIX_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ASSET
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ASSET" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASSET" ADD CONSTRAINT "CC1169527113254" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CC1169527113254"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ASSET_AIRCRAFT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ASSET_AIRCRAFT" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASSET_AIRCRAFT" ADD CONSTRAINT "STG_AIRCRAFT_PK" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "STG_AIRCRAFT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ASSET_GC_DET
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ASSET_GC_DET" MODIFY ("GC_DET_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASSET_GC_DET" ADD CONSTRAINT "CMS_STAGE_ASSET_GC_DET_PK" PRIMARY KEY ("GC_DET_ID")
  USING INDEX "CMS_STAGE_ASSET_GC_DET_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ASSET_GC_DET_1
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ASSET_GC_DET_1" MODIFY ("GC_DET_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ASSET_GC_STOCK_DET
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ASSET_GC_STOCK_DET" MODIFY ("GC_STOCK_DET_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASSET_GC_STOCK_DET" ADD CONSTRAINT "CMS_STAGE_ASSET_GC_STOCK__PK" PRIMARY KEY ("GC_STOCK_DET_ID")
  USING INDEX "CMS_STAGE_ASSET_GC_STOCK__PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ASSET_GOLD
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ASSET_GOLD" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASSET_GOLD" ADD CONSTRAINT "STG_ASSET_GOLD_PK" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "STG_ASSET_GOLD_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ASSET_PDC
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ASSET_PDC" MODIFY ("ASSET_PDC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASSET_PDC" ADD CONSTRAINT "CC1169527135696" PRIMARY KEY ("ASSET_PDC_ID")
  USING INDEX "CC1169527135696"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ASSET_PLANT_EQUIP
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ASSET_PLANT_EQUIP" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASSET_PLANT_EQUIP" ADD CONSTRAINT "STG_ASSET_PLANT_PK" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "STG_ASSET_PLANT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ASSET_VEHICLE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ASSET_VEHICLE" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASSET_VEHICLE" ADD CONSTRAINT "STG_ASSET_VEH_PK" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "STG_ASSET_VEH_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ASSET_VESSEL
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ASSET_VESSEL" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASSET_VESSEL" ADD CONSTRAINT "STG_ASST_VESSEL_PK" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "STG_ASST_VESSEL_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ASST_GC_DEBTOR
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ASST_GC_DEBTOR" MODIFY ("CMS_ASST_GC_DEBTOR_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASST_GC_DEBTOR" ADD CONSTRAINT "CC1169527158299" PRIMARY KEY ("CMS_ASST_GC_DEBTOR_ID")
  USING INDEX "CC1169527158299"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ASST_GC_FXASST_OTHR
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ASST_GC_FXASST_OTHR" MODIFY ("CMS_ASST_GC_FAO_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASST_GC_FXASST_OTHR" ADD CONSTRAINT "CC1169527176105" PRIMARY KEY ("CMS_ASST_GC_FAO_ID")
  USING INDEX "CC1169527176105"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ASST_GC_INSR_FAO_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ASST_GC_INSR_FAO_MAP" MODIFY ("CMS_ASST_GC_INSR_FAO_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASST_GC_INSR_FAO_MAP" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASST_GC_INSR_FAO_MAP" ADD CONSTRAINT "CC1169527203424" PRIMARY KEY ("CMS_ASST_GC_INSR_FAO_MAP_ID")
  USING INDEX "CC1169527203424"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ASST_GC_INSR_STK_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ASST_GC_INSR_STK_MAP" MODIFY ("CMS_ASST_GC_INSR_STK_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASST_GC_INSR_STK_MAP" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASST_GC_INSR_STK_MAP" ADD CONSTRAINT "CC1169527226417" PRIMARY KEY ("CMS_ASST_GC_INSR_STK_MAP_ID")
  USING INDEX "CC1169527226417"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ASST_GC_STOCK
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ASST_GC_STOCK" MODIFY ("CMS_ASST_GC_STOCK_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASST_GC_STOCK" MODIFY ("STOCK_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ASST_GC_STOCK" ADD CONSTRAINT "CC1169527246165" PRIMARY KEY ("CMS_ASST_GC_STOCK_ID")
  USING INDEX "CC1169527246165"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_BANK_ENTITY_PARAM
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_BANK_ENTITY_PARAM" MODIFY ("BANK_ENTITY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_BANK_ENTITY_PARAM" ADD CONSTRAINT "SQL110121194743100" PRIMARY KEY ("BANK_ENTITY_ID")
  USING INDEX "SQL110121194743100"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_BL_BUILDUP
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_BL_BUILDUP" MODIFY ("BUILDUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_BL_BUILDUP" ADD CONSTRAINT "BL_STG_BUL_ID_PK" PRIMARY KEY ("BUILDUP_ID")
  USING INDEX "BL_STG_BUL_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_BL_DEVELOPMENT_DOCS
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_BL_DEVELOPMENT_DOCS" MODIFY ("DEV_DOC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_BL_DEVELOPMENT_DOCS" ADD CONSTRAINT "BL_STG_DEV_ID_PK" PRIMARY KEY ("DEV_DOC_ID")
  USING INDEX "BL_STG_DEV_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_BL_DISBURSEMENT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_BL_DISBURSEMENT" MODIFY ("DISBURSEMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_BL_DISBURSEMENT" ADD CONSTRAINT "BL_STG_DISB_ID_PK" PRIMARY KEY ("DISBURSEMENT_ID")
  USING INDEX "BL_STG_DISB_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_BL_DISBURSEMENT_DETS
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_BL_DISBURSEMENT_DETS" MODIFY ("DISBURSE_DETAIL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_BL_DISBURSEMENT_DETS" ADD CONSTRAINT "BL_STG_DIS_DTL_PK" PRIMARY KEY ("DISBURSE_DETAIL_ID")
  USING INDEX "BL_STG_DIS_DTL_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_BL_FDR
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_BL_FDR" MODIFY ("FDR_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_BL_FDR" ADD CONSTRAINT "BL_STG_FDR_ID_PK" PRIMARY KEY ("FDR_ID")
  USING INDEX "BL_STG_FDR_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_BL_PROJECT_SCHEDULE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_BL_PROJECT_SCHEDULE" MODIFY ("SCHEDULE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_BL_PROJECT_SCHEDULE" ADD CONSTRAINT "BL_STG_SCHD_ID_PK" PRIMARY KEY ("SCHEDULE_ID")
  USING INDEX "BL_STG_SCHD_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_BL_PROPERTY_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_BL_PROPERTY_TYPE" MODIFY ("PROPERTY_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_BL_PROPERTY_TYPE" ADD CONSTRAINT "BL_STG_PROP_ID_PK" PRIMARY KEY ("PROPERTY_TYPE_ID")
  USING INDEX "BL_STG_PROP_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_BL_SALES_PROCEEDS
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_BL_SALES_PROCEEDS" MODIFY ("PROCEEDS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_BL_SALES_PROCEEDS" ADD CONSTRAINT "BL_STG_SALE_ID_PK" PRIMARY KEY ("PROCEEDS_ID")
  USING INDEX "BL_STG_SALE_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_BL_SETTLEMENT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_BL_SETTLEMENT" MODIFY ("SETTLEMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_BL_SETTLEMENT" ADD CONSTRAINT "BL_STG_SETT_ID_PK" PRIMARY KEY ("SETTLEMENT_ID")
  USING INDEX "BL_STG_SETT_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_BRIDGING_LOAN
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_BRIDGING_LOAN" MODIFY ("PROJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_BRIDGING_LOAN" ADD CONSTRAINT "BL_STG_PROJ_ID_PK" PRIMARY KEY ("PROJECT_ID")
  USING INDEX "BL_STG_PROJ_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CASEBRANCH
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CASEBRANCH" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CASECRE4ATION_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CASECRE4ATION_ITEM" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CASECRE4ATION_ITEM" MODIFY ("CHECKLISTITEMID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CASECRE4ATION_ITEM" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CASECREATIONUPDATE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CASECREATIONUPDATE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CASECREATION_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CASECREATION_ITEM" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CASECREATION_ITEM" MODIFY ("CHECKLISTITEMID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CASECREATION_ITEM" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CASH
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CASH" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CASH" ADD CONSTRAINT "CC1169527270801" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CC1169527270801"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CASH_DEPOSIT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CASH_DEPOSIT" MODIFY ("CASH_DEPOSIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CASH_DEPOSIT" ADD CONSTRAINT "CC1169527291951" PRIMARY KEY ("CASH_DEPOSIT_ID")
  USING INDEX "CC1169527291951"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CASH_DEPOSIT_1406
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CASH_DEPOSIT_1406" MODIFY ("CASH_DEPOSIT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CASH_MARGIN
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CASH_MARGIN" MODIFY ("CASH_MARGIN_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CASH_MARGIN" MODIFY ("AGREEMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CASH_MARGIN" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CASH_MARGIN" ADD CONSTRAINT "CASH_MARGIN_ST_PK" PRIMARY KEY ("CASH_MARGIN_ID")
  USING INDEX "CASH_MARGIN_ST_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CCI_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CCI_MAP" MODIFY ("CCI_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CCI_MAP" MODIFY ("CMS_CCI_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CERSAI_MAPPING
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CERSAI_MAPPING" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CERSAI_MAPPING" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CF_ADVANCE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CF_ADVANCE" MODIFY ("ADVANCE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CF_ADVANCE" ADD CONSTRAINT "CF_STG_ADV_ID_PK" PRIMARY KEY ("ADVANCE_ID")
  USING INDEX "CF_STG_ADV_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CF_FACILITY_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CF_FACILITY_TYPE" MODIFY ("FACILITY_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CF_FACILITY_TYPE" ADD CONSTRAINT "CF_STG_FAC_ID_PK" PRIMARY KEY ("FACILITY_TYPE_ID")
  USING INDEX "CF_STG_FAC_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CF_FDR
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CF_FDR" MODIFY ("FDR_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CF_FDR" ADD CONSTRAINT "CF_STG_FDR_ID_PK" PRIMARY KEY ("FDR_ID")
  USING INDEX "CF_STG_FDR_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CF_PAYMENT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CF_PAYMENT" MODIFY ("PAYMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CF_PAYMENT" ADD CONSTRAINT "CF_STG_PAY_ID_PK" PRIMARY KEY ("PAYMENT_ID")
  USING INDEX "CF_STG_PAY_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CF_TERMS_CONDITIONS
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CF_TERMS_CONDITIONS" MODIFY ("TNC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CF_TERMS_CONDITIONS" ADD CONSTRAINT "CF_STG_TNC_ID_PK" PRIMARY KEY ("TNC_ID")
  USING INDEX "CF_STG_TNC_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CHARGE_DETAIL
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CHARGE_DETAIL" MODIFY ("CHARGE_DETAIL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CHARGE_DETAIL" ADD CONSTRAINT "CC1170231486682" PRIMARY KEY ("CHARGE_DETAIL_ID")
  USING INDEX "STG_CHG_DTL_I3"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CHECKLIST_ITEM_IMAGE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CHECKLIST_ITEM_IMAGE" MODIFY ("CHK_ITEM_IMAGE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CITY
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CITY" MODIFY ("CITY_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CITY" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CITY" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CITY" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CMDT_APPV
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CMDT_APPV" MODIFY ("APPV_COMMODITY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_APPV" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_APPV" ADD CONSTRAINT "CC1169528324386" PRIMARY KEY ("APPV_COMMODITY_ID")
  USING INDEX "CC1169528324386"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CMDT_BUYER
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CMDT_BUYER" MODIFY ("BUYER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_BUYER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_BUYER" ADD CONSTRAINT "CC1169528347699" PRIMARY KEY ("BUYER_ID")
  USING INDEX "CC1169528347699"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CMDT_CNTR
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CMDT_CNTR" MODIFY ("CONTRACT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_CNTR" MODIFY ("CONTRACT_NO" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_CNTR" MODIFY ("CONTRACT_CCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_CNTR" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_CNTR" ADD CONSTRAINT "CC1169529149032" PRIMARY KEY ("CONTRACT_ID")
  USING INDEX "CC1169529149032"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CMDT_DEAL
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CMDT_DEAL" MODIFY ("DEAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_DEAL" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_DEAL" MODIFY ("DEAL_NO" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_DEAL" MODIFY ("DEAL_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_DEAL" MODIFY ("TRX_REF_NO" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_DEAL" MODIFY ("MATURITY_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_DEAL" MODIFY ("ORIG_FACE_AMT_CCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_DEAL" MODIFY ("FINANCE_PCT" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_DEAL" MODIFY ("IS_PRE_SOLD" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_DEAL" MODIFY ("IS_ATTAIN_ENFORCE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_DEAL" ADD CONSTRAINT "CC1169529175710" PRIMARY KEY ("DEAL_ID")
  USING INDEX "CC1169529175710"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CMDT_LOAN
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CMDT_LOAN" MODIFY ("LOAN_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_LOAN" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_LOAN" ADD CONSTRAINT "CC1169529241494" PRIMARY KEY ("LOAN_ID")
  USING INDEX "CC1169529241494"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CMDT_PRICE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CMDT_PRICE" MODIFY ("COMMODITY_PRICE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_PRICE" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_PRICE" ADD CONSTRAINT "CC1169529272499" PRIMARY KEY ("COMMODITY_PRICE_ID")
  USING INDEX "CC1169529272499"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CMDT_PROFILE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CMDT_PROFILE" MODIFY ("PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_PROFILE" MODIFY ("CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_PROFILE" MODIFY ("PRODUCT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_PROFILE" MODIFY ("PRODUCT_SUB_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_PROFILE" MODIFY ("PRICE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_PROFILE" MODIFY ("RIC_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_PROFILE" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_PROFILE" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_PROFILE" ADD CONSTRAINT "CC1169529293469" PRIMARY KEY ("PROFILE_ID")
  USING INDEX "CC1169529293469"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CMDT_SUB_LMT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CMDT_SUB_LMT" MODIFY ("SUB_LMT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_SUB_LMT" ADD CONSTRAINT "CC1169529320588" PRIMARY KEY ("SUB_LMT_ID")
  USING INDEX "CC1169529320588"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CMDT_SUB_LMT_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CMDT_SUB_LMT_TYPE" MODIFY ("SUB_LMT_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_SUB_LMT_TYPE" ADD CONSTRAINT "CC1169529346175" PRIMARY KEY ("SUB_LMT_TYPE_ID")
  USING INDEX "CC1169529346175"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CMDT_SUPPLIER
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CMDT_SUPPLIER" MODIFY ("SUPPLIER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_SUPPLIER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_SUPPLIER" ADD CONSTRAINT "CC1169529366654" PRIMARY KEY ("SUPPLIER_ID")
  USING INDEX "CC1169529366654"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CMDT_UOM
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CMDT_UOM" MODIFY ("COMMODITY_UOM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_UOM" MODIFY ("PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_UOM" MODIFY ("UOM_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_UOM" MODIFY ("MKT_UOM" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_UOM" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_UOM" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_UOM" ADD CONSTRAINT "CC1169529397599" PRIMARY KEY ("COMMODITY_UOM_ID")
  USING INDEX "CC1169529397599"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CMDT_WRHSE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CMDT_WRHSE" MODIFY ("WAREHOUSE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_WRHSE" MODIFY ("COUNTRY_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_WRHSE" MODIFY ("WAREHOUSE_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_WRHSE" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_WRHSE" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CMDT_WRHSE" ADD CONSTRAINT "CC1169529421393" PRIMARY KEY ("WAREHOUSE_ID")
  USING INDEX "CC1169529421393"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_COLLATERAL_ROC_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_COLLATERAL_ROC_MAP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COLLATERAL_ROC_MAP" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COLLATERAL_ROC_MAP" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COLLATERAL_ROC_MAP" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COLLATERAL_ROC_MAP" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COLLATERAL_ROC_MAP" MODIFY ("COLLATERAL_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COLLATERAL_ROC_MAP" MODIFY ("COLLATERAL_ROC_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COLLATERAL_ROC_MAP" MODIFY ("COLLATERAL_ROC_DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COLLATERAL_ROC_MAP" MODIFY ("IRB_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COLLATERAL_ROC_MAP" MODIFY ("INSURANCE_APPLICABLE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COLLATERAL_ROC_MAP" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_COMMODITY
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_COMMODITY" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COMMODITY" ADD CONSTRAINT "CC1169529446079" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CC1169529446079"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_COMPONENT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_COMPONENT" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COMPONENT" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COMPONENT" MODIFY ("COMPONENT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COMPONENT" MODIFY ("COMPONENT_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COMPONENT" MODIFY ("COMPONENT_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COMPONENT" MODIFY ("HAS_INSURANCE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COMPONENT" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COMPONENT" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CONTRACT_FINANCING
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CONTRACT_FINANCING" MODIFY ("CONTRACT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CONTRACT_FINANCING" ADD CONSTRAINT "CF_STG_CONT_ID_PK" PRIMARY KEY ("CONTRACT_ID")
  USING INDEX "CF_STG_CONT_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_COUNTRY
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_COUNTRY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COUNTRY" MODIFY ("COUNTRY_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COUNTRY" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COUNTRY" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COUNTRY" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_COUNTRY_LIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_COUNTRY_LIMIT" MODIFY ("COUNTRY_LIMIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COUNTRY_LIMIT" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COUNTRY_LIMIT" ADD CONSTRAINT "ST_CTRY_LIMIT_PK" PRIMARY KEY ("COUNTRY_LIMIT_ID")
  USING INDEX "ST_CTRY_LIMIT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_COUNTRY_RATING
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_COUNTRY_RATING" MODIFY ("COUNTRY_RATING_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COUNTRY_RATING" MODIFY ("COUNTRY_RATING_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COUNTRY_RATING" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_COUNTRY_RATING" ADD CONSTRAINT "ST_CTRY_RATING_PK" PRIMARY KEY ("COUNTRY_RATING_ID")
  USING INDEX "ST_CTRY_RATING_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CREDIT_APPROVAL
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CREDIT_APPROVAL" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CREDIT_APPROVAL" MODIFY ("APPROVAL_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CREDIT_APPROVAL" ADD CONSTRAINT "PK_STAGE_CREDIT_APPROVAL" PRIMARY KEY ("ID")
  USING INDEX "PK_STAGE_CREDIT_APPROVAL"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CREDIT_RISK_PARAM
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CREDIT_RISK_PARAM" MODIFY ("PARAM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CREDIT_RISK_PARAM" MODIFY ("FEED_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CREDIT_RISK_PARAM" MODIFY ("PARAM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CUSTOMER_DETAILS
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CUSTOMER_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CUSTOMER_DETAILS" ADD CONSTRAINT "CC1303213289630_1" PRIMARY KEY ("ID")
  USING INDEX "CC1303213289630_1"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CUST_DOC
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CUST_DOC" MODIFY ("CUSTODIAN_DOC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CUST_DOC" MODIFY ("CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CUST_DOC" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CUST_DOC" ADD CONSTRAINT "CC1169529473829" PRIMARY KEY ("CUSTODIAN_DOC_ID")
  USING INDEX "CC1169529473829"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CUST_DOC_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CUST_DOC_ITEM" MODIFY ("CUSTODIAN_DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CUST_DOC_ITEM" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CUST_DOC_ITEM" MODIFY ("CHECKLIST_ITEM_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CUST_DOC_ITEM" ADD CONSTRAINT "CC1169529497623" PRIMARY KEY ("CUSTODIAN_DOC_ITEM_ID")
  USING INDEX "CC1169529497623"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_CUST_GRP
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CUST_GRP" MODIFY ("GRP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_CUST_GRP" ADD CONSTRAINT "PK_STAGE_GRP_ID" PRIMARY KEY ("GRP_ID")
  USING INDEX "PK_STAGE_GRP_ID"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_DEAL_CASH
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_DEAL_CASH" MODIFY ("CASH_DEPOSIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DEAL_CASH" MODIFY ("DEPOSIT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DEAL_CASH" MODIFY ("DEPOSIT_REF_NO" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DEAL_CASH" MODIFY ("DEPOSIT_CCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DEAL_CASH" MODIFY ("LOC_CTRY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DEAL_CASH" MODIFY ("MATURITY_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DEAL_CASH" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DEAL_CASH" ADD CONSTRAINT "CC1169529521657" PRIMARY KEY ("CASH_DEPOSIT_ID")
  USING INDEX "CC1169529521657"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_DEMO
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_DEMO" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DEMO" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DEMO" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DEMO" ADD CONSTRAINT "CMS_STAGE_DEMO_PK" PRIMARY KEY ("ID")
  USING INDEX "CMS_STAGE_DEMO_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_DIERCTOR_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_DIERCTOR_MASTER" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_DIRECTOR_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_DIRECTOR_MASTER" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_DISCREPENCY
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_DISCREPENCY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DISCREPENCY" MODIFY ("CUSTOMER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DISCREPENCY" MODIFY ("DISCREPENCY_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DISCREPENCY" MODIFY ("CRITICAL" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DISCREPENCY" MODIFY ("DISCREPENCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DISCREPENCY" MODIFY ("DISCREPENCY_COUNTER" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DISCREPENCY" MODIFY ("DEFERED_COUNTER" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DISCREPENCY" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_DISC_FAC_LIST
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_DISC_FAC_LIST" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DISC_FAC_LIST" MODIFY ("DISCREPENCY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DISC_FAC_LIST" MODIFY ("FACILITY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DISC_FAC_LIST" MODIFY ("FACILITY_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DISC_FAC_LIST" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_DOCUMENT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_DOCUMENT" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DOCUMENT" ADD CONSTRAINT "CC1169529548226" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CC1169529548226"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_DOCUMENT_PROPERTY
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_DOCUMENT_PROPERTY" MODIFY ("PROPERTY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_DOCUMENT_PROPERTY" ADD CONSTRAINT "PK_STG_DYN_PROP" PRIMARY KEY ("PROPERTY_ID")
  USING INDEX "PK_STG_DYN_PROP"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_EARMARK
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_EARMARK" MODIFY ("EARMARK_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_EARMARK" MODIFY ("EARMARK_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_EARMARK" MODIFY ("FEED_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_EARMARK" ADD CONSTRAINT "PK_STAGE_EARMARK" PRIMARY KEY ("EARMARK_ID")
  USING INDEX "PK_STAGE_EARMARK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ECO_SECTOR_LIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ECO_SECTOR_LIMIT" MODIFY ("ECO_SECTOR_LIMIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ECO_SECTOR_LIMIT" ADD CONSTRAINT "ECO_SECTOR_LIMIT_2" PRIMARY KEY ("ECO_SECTOR_LIMIT_ID")
  USING INDEX "ECO_SECTOR_LIMIT_2"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_ENTITY_LIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_ENTITY_LIMIT" MODIFY ("ENTITY_LIMIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ENTITY_LIMIT" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_ENTITY_LIMIT" ADD CONSTRAINT "ST_ENT_LMT_PK" PRIMARY KEY ("ENTITY_LIMIT_ID")
  USING INDEX "ST_ENT_LMT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_EXCLUDED_FACILITY
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_EXCLUDED_FACILITY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_EXCLUDED_FACILITY" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_EXCLUDED_FACILITY" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_EXCLUDED_FACILITY" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_EXCLUDED_FACILITY" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_EXCLUDED_FACILITY" MODIFY ("EXCLUDED_FACILITY_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_EXCLUDED_FACILITY" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_EXEMPTED_INST_GP5
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_EXEMPTED_INST_GP5" MODIFY ("EXEMPTED_INST_GP5_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_EXEMPTED_INST_GP5" ADD CONSTRAINT "EI_ST_GP5_ID_PK" PRIMARY KEY ("EXEMPTED_INST_GP5_ID")
  USING INDEX "EI_ST_GP5_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_EXEMPT_FACILITY
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_EXEMPT_FACILITY" MODIFY ("EXEMPT_FACILITY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_EXEMPT_FACILITY" ADD CONSTRAINT "EXM_FAC_STG_ID_PK" PRIMARY KEY ("EXEMPT_FACILITY_ID")
  USING INDEX "EXM_FAC_STG_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_FACILITY_NEW_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_FACILITY_NEW_MASTER" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_FCCBRANCH_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_FCCBRANCH_MASTER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FCCBRANCH_MASTER" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FCCBRANCH_MASTER" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FCCBRANCH_MASTER" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FCCBRANCH_MASTER" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FCCBRANCH_MASTER" MODIFY ("BRANCHCODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FCCBRANCH_MASTER" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_FEED_GROUP
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_FEED_GROUP" MODIFY ("FEED_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FEED_GROUP" ADD CONSTRAINT "CC1169529690881" PRIMARY KEY ("FEED_GROUP_ID")
  USING INDEX "CC1169529690881"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_FEE_DETAILS
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_FEE_DETAILS" MODIFY ("FEE_DETAILS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FEE_DETAILS" ADD CONSTRAINT "SQL080609120106340" PRIMARY KEY ("FEE_DETAILS_ID")
  USING INDEX "SQL080609120106340"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_FINANCE_DOC
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_FINANCE_DOC" MODIFY ("DOC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FINANCE_DOC" MODIFY ("DOC_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FINANCE_DOC" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FINANCE_DOC" ADD CONSTRAINT "CC1169529712301" PRIMARY KEY ("DOC_ID")
  USING INDEX "CC1169529712301"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_FOREX
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_FOREX" MODIFY ("FEED_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FOREX" MODIFY ("BUY_CURRENCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FOREX" MODIFY ("SELL_CURRENCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FOREX" MODIFY ("BUY_UNIT" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FOREX" MODIFY ("SELL_UNIT" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FOREX" MODIFY ("CMS_VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FOREX" MODIFY ("FEED_REF" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_FOREX" ADD CONSTRAINT "CC1169529739821" PRIMARY KEY ("FEED_ID")
  USING INDEX "CC1169529739821"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_GC_INSURANCE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_GC_INSURANCE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_GC_INSURANCE_001
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_GC_INSURANCE_001" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_GC_INSURANCE_BK
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_GC_INSURANCE_BK" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GC_INSURANCE_BK" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GC_INSURANCE_BK" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GC_INSURANCE_BK" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GC_INSURANCE_BK" MODIFY ("INSURANCE_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GC_INSURANCE_BK" MODIFY ("INSURANCE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GC_INSURANCE_BK" MODIFY ("IS_PROCESSED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GC_INSURANCE_BK" MODIFY ("DEPRECATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_GENERAL_PARAM_GROUP
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_GENERAL_PARAM_GROUP" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_GOLD_FEED
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_GOLD_FEED" MODIFY ("GOLD_FEED_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GOLD_FEED" MODIFY ("FEED_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GOLD_FEED" ADD CONSTRAINT "GOLD_FEED_PK_2" PRIMARY KEY ("GOLD_FEED_ID")
  USING INDEX "GOLD_FEED_PK_2"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_GOODS_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_GOODS_MASTER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GOODS_MASTER" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GOODS_MASTER" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GOODS_MASTER" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GOODS_MASTER" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GOODS_MASTER" MODIFY ("GOODS_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GOODS_MASTER" MODIFY ("GOODS_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GOODS_MASTER" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_GROUP_MEMBER
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_GROUP_MEMBER" MODIFY ("GRP_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GROUP_MEMBER" ADD CONSTRAINT "SQL110121194742790" PRIMARY KEY ("GRP_MEMBER_ID")
  USING INDEX "SQL110121194742790"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_GROUP_OTRLIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_GROUP_OTRLIMIT" MODIFY ("GRP_OTRLIMIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GROUP_OTRLIMIT" ADD CONSTRAINT "SQL110121194742680" PRIMARY KEY ("GRP_OTRLIMIT_ID")
  USING INDEX "SQL110121194742680"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_GROUP_SUBLIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_GROUP_SUBLIMIT" MODIFY ("GRP_SUBLIMIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GROUP_SUBLIMIT" ADD CONSTRAINT "SQL110121194742570" PRIMARY KEY ("GRP_SUBLIMIT_ID")
  USING INDEX "SQL110121194742570"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_GRP_CREDIT_GRADE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_GRP_CREDIT_GRADE" MODIFY ("GRP_CREDIT_GRADE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GRP_CREDIT_GRADE" ADD CONSTRAINT "SQL110121194742470" PRIMARY KEY ("GRP_CREDIT_GRADE_ID")
  USING INDEX "SQL110121194742470"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_GUARANTEE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_GUARANTEE" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_GUARANTEE" ADD CONSTRAINT "CC1169529763445" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CC1169529763445"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_HEDGE_CNTR
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_HEDGE_CNTR" MODIFY ("HEDGECONTRACT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HEDGE_CNTR" MODIFY ("TREASURY_REF_NO" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HEDGE_CNTR" MODIFY ("AGREEMT_REF_NO" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HEDGE_CNTR" MODIFY ("MARGIN_PCT" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HEDGE_CNTR" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HEDGE_CNTR" MODIFY ("DEAL_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HEDGE_CNTR" ADD CONSTRAINT "CC1169529890868" PRIMARY KEY ("HEDGECONTRACT_ID")
  USING INDEX "CC1169529890868"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_HEDGE_EXT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_HEDGE_EXT" MODIFY ("HEDGE_EXT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HEDGE_EXT" MODIFY ("START_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HEDGE_EXT" MODIFY ("END_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HEDGE_EXT" MODIFY ("PERIOD_UNIT_QTY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HEDGE_EXT" MODIFY ("PERIOD_UNIT" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HEDGE_EXT" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HEDGE_EXT" ADD CONSTRAINT "CC1169529911848" PRIMARY KEY ("HEDGE_EXT_ID")
  USING INDEX "CC1169529911848"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_HOLIDAY
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_HOLIDAY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HOLIDAY" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HOLIDAY" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HOLIDAY" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HOLIDAY" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HOLIDAY" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HOLIDAY" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_HOLIDAY" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_IFSC_CODE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_IFSC_CODE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_IFSC_CODE" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_IMAGE_TAG_DETAILS
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_IMAGE_TAG_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_IMAGE_UPLOAD
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_IMAGE_UPLOAD" MODIFY ("IMG_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_IMAGE_UPLOAD" ADD CONSTRAINT "IMG_ID_PK_3" PRIMARY KEY ("IMG_ID")
  USING INDEX "IMG_ID_PK_3"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_IMAGE_UPLOAD_DETAILS
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_IMAGE_UPLOAD_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_IMAGE_UPLOAD_DETAILS" ADD CONSTRAINT "ID_PK_2" PRIMARY KEY ("ID")
  USING INDEX "ID_PK_2"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_INDUSTRY_NAME
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_INDUSTRY_NAME" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INDUSTRY_NAME" ADD CONSTRAINT "PK_INDUSTRY_NAME_STAGE" PRIMARY KEY ("ID")
  USING INDEX "PK_INDUSTRY_NAME_STAGE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_INSURANCE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_INSURANCE" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INSURANCE" ADD CONSTRAINT "CC1169529945136" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CC1169529945136"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_INSURANCE_CDS
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_INSURANCE_CDS" MODIFY ("CDS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INSURANCE_CDS" ADD CONSTRAINT "CC1169529972656" PRIMARY KEY ("CDS_ID")
  USING INDEX "CC1169529972656"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_INSURANCE_COVERAGE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_INSURANCE_COVERAGE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INSURANCE_COVERAGE" MODIFY ("INSURANCE_COVERAGE_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INSURANCE_COVERAGE" MODIFY ("COMPANY_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INSURANCE_COVERAGE" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INSURANCE_COVERAGE" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INSURANCE_COVERAGE" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INSURANCE_COVERAGE" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INSURANCE_COVERAGE" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INSURANCE_COVERAGE" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INSURANCE_COVERAGE" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INSURANCE_COVERAGE" ADD CONSTRAINT "PK_INSURANCE_COVERAGE_3" PRIMARY KEY ("ID")
  USING INDEX "PK_INSURANCE_COVERAGE_3"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_INSURANCE_POLICY
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_INSURANCE_POLICY" MODIFY ("INSURANCE_POLICY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INSURANCE_POLICY" ADD CONSTRAINT "CC1169530004752" PRIMARY KEY ("INSURANCE_POLICY_ID")
  USING INDEX "CC1169530004752"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_INTEREST_RATE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_INTEREST_RATE" MODIFY ("INT_RATE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INTEREST_RATE" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INTEREST_RATE" ADD CONSTRAINT "IRS_INTRATE_ID_PK" PRIMARY KEY ("INT_RATE_ID")
  USING INDEX "IRS_INTRATE_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_INTERNAL_LIMIT_PARAM
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_INTERNAL_LIMIT_PARAM" MODIFY ("INT_LIMIT_PARAM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_INTERNAL_LIMIT_PARAM" ADD CONSTRAINT "SQL110121194742040" PRIMARY KEY ("INT_LIMIT_PARAM_ID")
  USING INDEX "SQL110121194742040"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_LEI_DATE_VALIDATION
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_LEI_DATE_VALIDATION" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_LIEN
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_LIEN" ADD PRIMARY KEY ("LIEN_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_LIMIT_CHARGE_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_LIMIT_CHARGE_MAP" MODIFY ("LIMIT_CHARGE_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LIMIT_CHARGE_MAP" MODIFY ("CHARGE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LIMIT_CHARGE_MAP" ADD CONSTRAINT "CC1169530029117" PRIMARY KEY ("LIMIT_CHARGE_MAP_ID")
  USING INDEX "CC1169530029117"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_LIMIT_SECURITY_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_LIMIT_SECURITY_MAP" MODIFY ("CHARGE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LIMIT_SECURITY_MAP" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LIMIT_SECURITY_MAP" ADD CONSTRAINT "CC1169530410485" PRIMARY KEY ("CHARGE_ID")
  USING INDEX "CC1169530410485"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_LINE_DETAIL
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_LINE_DETAIL" MODIFY ("LINE_DETAIL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_LMT_BOOK
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_LMT_BOOK" MODIFY ("LMT_BK_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LMT_BOOK" ADD CONSTRAINT "PK_ST_CMS_LMT_BK" PRIMARY KEY ("LMT_BK_ID")
  USING INDEX "PK_ST_CMS_LMT_BK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_LMT_BOOK_DTL
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_LMT_BOOK_DTL" MODIFY ("LMT_BK_DETAIL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LMT_BOOK_DTL" MODIFY ("LMT_BK_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LMT_BOOK_DTL" ADD CONSTRAINT "PK_ST_LMT_BK_DTL" PRIMARY KEY ("LMT_BK_DETAIL_ID")
  USING INDEX "PK_ST_LMT_BK_DTL"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_LOAN_GUARANTOR
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_LOAN_GUARANTOR" MODIFY ("GUARANTOR_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_GUARANTOR" MODIFY ("GUARANTOR_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_GUARANTOR" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_GUARANTOR" ADD CONSTRAINT "CC1169530490450" PRIMARY KEY ("GUARANTOR_ID")
  USING INDEX "CC1169530490450"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_LOAN_LMT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_LOAN_LMT" MODIFY ("LOAN_LMT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_LMT" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_LMT" ADD CONSTRAINT "CC1169530512963" PRIMARY KEY ("LOAN_LMT_ID")
  USING INDEX "CC1169530512963"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_LOAN_OBLIGOR
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_LOAN_OBLIGOR" MODIFY ("OBLIGOR_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_OBLIGOR" MODIFY ("OBLIGOR_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_OBLIGOR" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_OBLIGOR" ADD CONSTRAINT "CC1169530565478" PRIMARY KEY ("OBLIGOR_ID")
  USING INDEX "CC1169530565478"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_LOAN_PARTICIPANT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_LOAN_PARTICIPANT" MODIFY ("PARTICIPANT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_PARTICIPANT" MODIFY ("PARTICIPANT_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_PARTICIPANT" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_PARTICIPANT" ADD CONSTRAINT "CC1169530633827" PRIMARY KEY ("PARTICIPANT_ID")
  USING INDEX "CC1169530633827"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_LOAN_PAYMT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_LOAN_PAYMT" MODIFY ("EXP_PAYMT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_PAYMT" MODIFY ("EXP_PAYMT_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_PAYMT" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_PAYMT" ADD CONSTRAINT "CC1169530667495" PRIMARY KEY ("EXP_PAYMT_ID")
  USING INDEX "CC1169530667495"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_LOAN_SUB_LMT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_LOAN_SUB_LMT" MODIFY ("SUB_LMT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_SUB_LMT" MODIFY ("SUB_LMT_AMT_CCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_SUB_LMT" MODIFY ("LOAN_FACILITY_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_SUB_LMT" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOAN_SUB_LMT" ADD CONSTRAINT "CC1169530723105" PRIMARY KEY ("SUB_LMT_ID")
  USING INDEX "CC1169530723105"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_LOA_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_LOA_MASTER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOA_MASTER" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOA_MASTER" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOA_MASTER" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LOA_MASTER" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_LSP_SYS_XREF
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_LSP_SYS_XREF" MODIFY ("CMS_LSP_SYS_XREF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_LSP_SYS_XREF" ADD CONSTRAINT "STG_XREF_ID_PK" PRIMARY KEY ("CMS_LSP_SYS_XREF_ID")
  USING INDEX "STG_XREF_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_MAIN_SECTOR_LIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_MAIN_SECTOR_LIMIT" MODIFY ("MAIN_SECTOR_LIMIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MAIN_SECTOR_LIMIT" ADD CONSTRAINT "MAIN_SECTOR_LIMIT_3" PRIMARY KEY ("MAIN_SECTOR_LIMIT_ID")
  USING INDEX "MAIN_SECTOR_LIMIT_3"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_MARKETABLE_SEC
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_MARKETABLE_SEC" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MARKETABLE_SEC" ADD CONSTRAINT "CC1169530769852" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CC1169530769852"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_MF_CHECKLIST
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_MF_CHECKLIST" MODIFY ("MF_CHECKLIST_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MF_CHECKLIST" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MF_CHECKLIST" MODIFY ("MF_TEMPLATE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MF_CHECKLIST" ADD CONSTRAINT "ST_MF_CHECKLIST_PK" PRIMARY KEY ("MF_CHECKLIST_ID")
  USING INDEX "ST_MF_CHECKLIST_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_MF_CHECKLIST_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_MF_CHECKLIST_ITEM" MODIFY ("MF_CHECKLIST_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MF_CHECKLIST_ITEM" ADD CONSTRAINT "ST_MFCHKLSTITEM_PK" PRIMARY KEY ("MF_CHECKLIST_ITEM_ID")
  USING INDEX "ST_MFCHKLSTITEM_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_MF_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_MF_ITEM" MODIFY ("MF_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MF_ITEM" ADD CONSTRAINT "ST_MF_ITEM_PK" PRIMARY KEY ("MF_ITEM_ID")
  USING INDEX "ST_MF_ITEM_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_MF_TEMPLATE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_MF_TEMPLATE" MODIFY ("MF_TEMPLATE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MF_TEMPLATE" ADD CONSTRAINT "ST_MF_TEMPLATE_PK" PRIMARY KEY ("MF_TEMPLATE_ID")
  USING INDEX "ST_MF_TEMPLATE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_MF_TEMPLATE_SEC_SUBT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_MF_TEMPLATE_SEC_SUBT" MODIFY ("TEMPLATE_SUBTYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MF_TEMPLATE_SEC_SUBT" MODIFY ("MF_TEMPLATE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MF_TEMPLATE_SEC_SUBT" MODIFY ("SECURITY_SUB_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MF_TEMPLATE_SEC_SUBT" ADD CONSTRAINT "ST_MFSECSUBTYPE_PK" PRIMARY KEY ("TEMPLATE_SUBTYPE_ID")
  USING INDEX "ST_MFSECSUBTYPE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_MUTUAL_FUNDS_FEED
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_MUTUAL_FUNDS_FEED" MODIFY ("FEED_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MUTUAL_FUNDS_FEED" MODIFY ("SCHEME_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MUTUAL_FUNDS_FEED" MODIFY ("SCHEME_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MUTUAL_FUNDS_FEED" MODIFY ("SCHEME_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MUTUAL_FUNDS_FEED" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MUTUAL_FUNDS_FEED" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_MY_DEMO
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_MY_DEMO" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MY_DEMO" MODIFY ("CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MY_DEMO" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MY_DEMO" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MY_DEMO" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MY_DEMO" MODIFY ("CONTACT" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_MY_DEMO" MODIFY ("DEPRECATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_NEW_TAT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_NEW_TAT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_NPA_TRAQ_CODE_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_NPA_TRAQ_CODE_MASTER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_NPA_TRAQ_CODE_MASTER" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_NPA_TRAQ_CODE_MASTER" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_NPA_TRAQ_CODE_MASTER" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_NPA_TRAQ_CODE_MASTER" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_NPA_TRAQ_CODE_MASTER" MODIFY ("NPA_TRAQ_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_NPA_TRAQ_CODE_MASTER" MODIFY ("SECURITY_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_NPA_TRAQ_CODE_MASTER" MODIFY ("SECURITY_SUB_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_NPA_TRAQ_CODE_MASTER" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_NPL
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_NPL" MODIFY ("CMS_NPL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_NPL" ADD CONSTRAINT "PK_CMS_STAGE_NPL" PRIMARY KEY ("CMS_NPL_ID")
  USING INDEX "PK_CMS_STAGE_NPL"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_OTHERS
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_OTHERS" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHERS" ADD CONSTRAINT "CC1169530799855" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "CC1169530799855"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_OTHER_BANK
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_OTHER_BANK" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHER_BANK" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHER_BANK" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHER_BANK" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHER_BANK" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHER_BANK" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHER_BANK" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_OTHER_BANK_BRANCH
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_OTHER_BANK_BRANCH" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHER_BANK_BRANCH" MODIFY ("BRANCH_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHER_BANK_BRANCH" MODIFY ("OTHER_BANK_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHER_BANK_BRANCH" MODIFY ("BRANCH_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHER_BANK_BRANCH" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHER_BANK_BRANCH" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHER_BANK_BRANCH" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHER_BANK_BRANCH" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHER_BANK_BRANCH" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHER_BANK_BRANCH" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_OTHER_BANK_BRANCH" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_PARTY_GROUP
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_PARTY_GROUP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PARTY_GROUP" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PARTY_GROUP" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PARTY_GROUP" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PARTY_GROUP" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PARTY_GROUP" MODIFY ("PARTY_GROUP_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PARTY_GROUP" MODIFY ("PARTY_GROUP_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PARTY_GROUP" MODIFY ("CURRENCY_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_PCH_SALE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_PCH_SALE" MODIFY ("PURCHASE_SALES_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PCH_SALE" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PCH_SALE" ADD CONSTRAINT "CC1169530956501" PRIMARY KEY ("PURCHASE_SALES_ID")
  USING INDEX "CC1169530956501"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_POLICY_CAP
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_POLICY_CAP" MODIFY ("POLICY_CAP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_POLICY_CAP" ADD CONSTRAINT "CRP_STG_PC_ID_PK" PRIMARY KEY ("POLICY_CAP_ID")
  USING INDEX "CRP_STG_PC_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_POLICY_CAP_GROUP
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_POLICY_CAP_GROUP" MODIFY ("POLICY_CAP_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_POLICY_CAP_GROUP" ADD CONSTRAINT "PSCG_PK" PRIMARY KEY ("POLICY_CAP_GROUP_ID")
  USING INDEX "PSCG_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_PORTFOLIO_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_PORTFOLIO_ITEM" MODIFY ("ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PORTFOLIO_ITEM" ADD CONSTRAINT "CC1169530973205" PRIMARY KEY ("ITEM_ID")
  USING INDEX "CC1169530973205"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_PRECOND
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_PRECOND" MODIFY ("PRECOND_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PRECOND" ADD CONSTRAINT "CC1169530992292" PRIMARY KEY ("PRECOND_ID")
  USING INDEX "CC1169530992292"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_PRICE_FEED
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_PRICE_FEED" MODIFY ("FEED_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PRICE_FEED" MODIFY ("CMS_VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PRICE_FEED" MODIFY ("FEED_REF" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PRICE_FEED" ADD CONSTRAINT "CC1169531012090" PRIMARY KEY ("FEED_ID")
  USING INDEX "CC1169531012090"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_PRODUCT_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_PRODUCT_MASTER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PRODUCT_MASTER" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PRODUCT_MASTER" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PRODUCT_MASTER" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PRODUCT_MASTER" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PRODUCT_MASTER" MODIFY ("PRODUCT_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PRODUCT_MASTER" MODIFY ("PRODUCT_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PRODUCT_MASTER" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_PRODUCT_PROGRAM
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_PRODUCT_PROGRAM" MODIFY ("PRODUCT_PROGRAM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PRODUCT_PROGRAM" ADD CONSTRAINT "SQL110121194747470" PRIMARY KEY ("PRODUCT_PROGRAM_ID")
  USING INDEX "SQL110121194747470"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_PRODUCT_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_PRODUCT_TYPE" MODIFY ("PRODUCT_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PRODUCT_TYPE" ADD CONSTRAINT "SQL110121194747500" PRIMARY KEY ("PRODUCT_TYPE_ID")
  USING INDEX "SQL110121194747500"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_PROPERTY
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_PROPERTY" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PROPERTY" MODIFY ("STD_QUIT_RENT" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PROPERTY" MODIFY ("NON_STD_QUIT_RENT" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PROPERTY" MODIFY ("QUIT_RENT_RECEIPT" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PROPERTY" ADD CONSTRAINT "PKCMS_STAGE_PROP" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "PKCMS_STAGE_PROP"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_PROPERTY_IDX
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_PROPERTY_IDX" MODIFY ("PROPERTY_IDX_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PROPERTY_IDX" ADD CONSTRAINT "SQL110121194555190" PRIMARY KEY ("PROPERTY_IDX_ID")
  USING INDEX "SQL110121194555190"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_PROPERTY_IDX_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_PROPERTY_IDX_ITEM" MODIFY ("PROPERTY_IDX_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PROPERTY_IDX_ITEM" ADD CONSTRAINT "SQL110121194555330" PRIMARY KEY ("PROPERTY_IDX_ITEM_ID")
  USING INDEX "SQL110121194555330"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_PROPERTY_PARAMETERS
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_PROPERTY_PARAMETERS" MODIFY ("PARAMETER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PROPERTY_PARAMETERS" ADD CONSTRAINT "SQL080609120049310" PRIMARY KEY ("PARAMETER_ID")
  USING INDEX "SQL080609120049310"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_PROP_IDX_MUKIM_CODE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_PROP_IDX_MUKIM_CODE" MODIFY ("PROPERTY_IDX_MUKIM_CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PROP_IDX_MUKIM_CODE" ADD CONSTRAINT "SQL110121194555800" PRIMARY KEY ("PROPERTY_IDX_MUKIM_CODE_ID")
  USING INDEX "SQL110121194555800"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_PROP_IDX_PROP_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_PROP_IDX_PROP_TYPE" MODIFY ("PROPERTY_IDX_PROPERTY_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PROP_IDX_PROP_TYPE" ADD CONSTRAINT "SQL110121194556010" PRIMARY KEY ("PROPERTY_IDX_PROPERTY_TYPE_ID")
  USING INDEX "SQL110121194556010"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_PROP_IDX_SEC_SUBTYPE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_PROP_IDX_SEC_SUBTYPE" MODIFY ("PROPERTY_IDX_SEC_SUBTYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_PROP_IDX_SEC_SUBTYPE" ADD CONSTRAINT "SQL110121194555460" PRIMARY KEY ("PROPERTY_IDX_SEC_SUBTYPE_ID")
  USING INDEX "SQL110121194555460"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_RBI_CATEGORY
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_RBI_CATEGORY" MODIFY ("STAGE_RBI_CATEGORY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RBI_CATEGORY" MODIFY ("INDUSTRY_NAME_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RBI_CATEGORY" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RBI_CATEGORY" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RBI_CATEGORY" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RBI_CATEGORY" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RBI_CATEGORY" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RBI_CATEGORY" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RBI_CATEGORY" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RBI_CATEGORY" ADD CONSTRAINT "PK_STAGE_RBI_CATEGORY" PRIMARY KEY ("STAGE_RBI_CATEGORY_ID")
  USING INDEX "PK_STAGE_RBI_CATEGORY"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_RCPT_RELEASE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_RCPT_RELEASE" MODIFY ("RELEASE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RCPT_RELEASE" MODIFY ("RELEASE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RCPT_RELEASE" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RCPT_RELEASE" ADD CONSTRAINT "CMS_SRR_PK_RI" PRIMARY KEY ("RELEASE_ID")
  USING INDEX "CMS_SRR_PK_RI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_REGION
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_REGION" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_REGION" MODIFY ("REGION_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_REGION" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_REGION" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_REGION" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_RELATIONSHIP_MGR
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_RELATIONSHIP_MGR" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RELATIONSHIP_MGR" MODIFY ("RM_MGR_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RELATIONSHIP_MGR" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RELATIONSHIP_MGR" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RELATIONSHIP_MGR" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RELATIONSHIP_MGR" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RELATIONSHIP_MGR" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RELATIONSHIP_MGR" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RELATIONSHIP_MGR" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_RELATIONSHIP_MGR" ADD CONSTRAINT "PK_RELATIONSHIP_MGR" PRIMARY KEY ("ID")
  USING INDEX "PK_RELATIONSHIP_MGR"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SECTOR_LIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SECTOR_LIMIT" MODIFY ("SECTOR_LIMIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SECTOR_LIMIT" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SECTOR_LIMIT" ADD CONSTRAINT "ST_SCTR_LMT_PK" PRIMARY KEY ("SECTOR_LIMIT_ID")
  USING INDEX "ST_SCTR_LMT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SECURITY
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SECURITY" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SECURITY" ADD CONSTRAINT "PK_CMS_STAGE_SEC" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "STG_SEC_I1"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SECURITY_10052016
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SECURITY_10052016" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SECURITY_310713
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SECURITY_310713" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SECURITY_ASSET_LIFE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SECURITY_ASSET_LIFE" MODIFY ("SECURITY_SUB_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SECURITY_ASSET_LIFE" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SECURITY_ASSET_LIFE" MODIFY ("SECURITY_SUB_TYPE_SEQ" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SECURITY_ASSET_LIFE" ADD CONSTRAINT "AL_SUBTYPE_SEQ_PK" PRIMARY KEY ("SECURITY_SUB_TYPE_SEQ")
  USING INDEX "AL_SUBTYPE_SEQ_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SECURITY_COVERAGE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SECURITY_COVERAGE" MODIFY ("SEC_COVERAGE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SECURITY_COVERAGE" ADD CONSTRAINT "pk_stage_security_coverage" PRIMARY KEY ("SEC_COVERAGE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SECURITY_PARAMETER
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SECURITY_PARAMETER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SECURITY_PARAMETER" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SECURITY_PARAMETER" ADD CONSTRAINT "PK_CMS_STG_SEC_PRM" PRIMARY KEY ("ID")
  USING INDEX "PK_CMS_STG_SEC_PRM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SECURITY_SOURCE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SECURITY_SOURCE" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SECURITY_SOURCE" MODIFY ("SCI_SECURITY_DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SECURITY_SOURCE" MODIFY ("SOURCE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SECURITY_SOURCE" ADD CONSTRAINT "SQL080609120050780" PRIMARY KEY ("SCI_SECURITY_DTL_ID", "SOURCE_ID")
  USING INDEX "SQL080609120050780"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SECURITY_SUB_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SECURITY_SUB_TYPE" MODIFY ("SECURITY_SUB_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SECURITY_SUB_TYPE" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SECURITY_SUB_TYPE" MODIFY ("SECURITY_SUB_TYPE_SEQ" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SECURITY_SUB_TYPE" ADD CONSTRAINT "PK_STG_SEC_SUBTYPE" PRIMARY KEY ("SECURITY_SUB_TYPE_SEQ")
  USING INDEX "PK_STG_SEC_SUBTYPE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SEC_APPORTIONMENT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SEC_APPORTIONMENT" MODIFY ("SEC_APPORTIONMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_APPORTIONMENT" MODIFY ("PRIORITY_RANKING" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_APPORTIONMENT" MODIFY ("PRIORITY_RANKING_AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_APPORTIONMENT" MODIFY ("PERC_AMT_IND" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_APPORTIONMENT" MODIFY ("MIN_PERC_AMT_IND" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_APPORTIONMENT" MODIFY ("MAX_PERC_AMT_IND" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_APPORTIONMENT" MODIFY ("CHARGE_DETAIL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_APPORTIONMENT" ADD CONSTRAINT "PKCMS_STG_SEC_APPT" PRIMARY KEY ("SEC_APPORTIONMENT_ID")
  USING INDEX "PKCMS_STG_SEC_APPT"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SEC_ENVELOPE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SEC_ENVELOPE" MODIFY ("SEC_ENVELOPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_ENVELOPE" MODIFY ("SEC_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_ENVELOPE" ADD CONSTRAINT "SQL110121194556130" PRIMARY KEY ("SEC_ENVELOPE_ID")
  USING INDEX "SQL110121194556130"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SEC_ENVELOPE_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SEC_ENVELOPE_ITEM" MODIFY ("SEC_ENVELOPE_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_ENVELOPE_ITEM" MODIFY ("SEC_ENVELOPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_ENVELOPE_ITEM" MODIFY ("SEC_ENVELOPE_ITEM_ADDR" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_ENVELOPE_ITEM" MODIFY ("SEC_ENVELOPE_ITEM_BARCODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_ENVELOPE_ITEM" MODIFY ("SEC_ENVELOPE_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_ENVELOPE_ITEM" ADD CONSTRAINT "SQL110121194556240" PRIMARY KEY ("SEC_ENVELOPE_ITEM_ID")
  USING INDEX "SQL110121194556240"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SEC_LIQUIDATION
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SEC_LIQUIDATION" MODIFY ("LIQUIDATION_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_LIQUIDATION" ADD CONSTRAINT "S20070925" PRIMARY KEY ("LIQUIDATION_ID")
  USING INDEX "S20070925"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SEC_RECOVERY
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SEC_RECOVERY" MODIFY ("RECOVERY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_RECOVERY" ADD CONSTRAINT "STG_RECOVERY_PK" PRIMARY KEY ("RECOVERY_ID")
  USING INDEX "STG_RECOVERY_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SEC_RECOVERY_EXPENSE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SEC_RECOVERY_EXPENSE" MODIFY ("RECOVERY_EXPENSE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_RECOVERY_EXPENSE" ADD CONSTRAINT "STG_RECOV_EXP_PK" PRIMARY KEY ("RECOVERY_EXPENSE_ID")
  USING INDEX "STG_RECOV_EXP_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SEC_RECOVERY_INCOME
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SEC_RECOVERY_INCOME" MODIFY ("RECOVERY_INCOME_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SEC_RECOVERY_INCOME" ADD CONSTRAINT "STG_RECOV_INC_PK" PRIMARY KEY ("RECOVERY_INCOME_ID")
  USING INDEX "STG_RECOV_INC_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SETTLEMENT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SETTLEMENT" MODIFY ("SETTLEMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SETTLEMENT" MODIFY ("PAYMENT_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SETTLEMENT" MODIFY ("PAYMENT_CCY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SETTLEMENT" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SETTLEMENT" ADD CONSTRAINT "CMS_SST_PK_SI" PRIMARY KEY ("SETTLEMENT_ID")
  USING INDEX "CMS_SST_PK_SI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_STATE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_STATE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_STATE" MODIFY ("STATE_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_STATE" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_STATE" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_STATE" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_STATE_PINCODE_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_STATE_PINCODE_MAP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_STATE_PINCODE_MAP" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_STATE_PINCODE_MAP" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_STATE_PINCODE_MAP" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_STATE_PINCODE_MAP" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_STATE_PINCODE_MAP" MODIFY ("STATE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_STATE_PINCODE_MAP" MODIFY ("PINCODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_STATE_PINCODE_MAP" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_STTLMT_RCPT_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_STTLMT_RCPT_MAP" MODIFY ("SETTLMT_WHRCPT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_STTLMT_RCPT_MAP" MODIFY ("WAREHSE_RCPT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_STTLMT_RCPT_MAP" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_STTLMT_RCPT_MAP" ADD CONSTRAINT "CMS_SSR_PK_SI" PRIMARY KEY ("SETTLMT_WHRCPT_ID")
  USING INDEX "CMS_SSR_PK_SI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SUB_SECTOR_LIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SUB_SECTOR_LIMIT" MODIFY ("SUB_SECTOR_LIMIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SUB_SECTOR_LIMIT" ADD CONSTRAINT "SUB_SECTOR_LIMIT_3" PRIMARY KEY ("SUB_SECTOR_LIMIT_ID")
  USING INDEX "SUB_SECTOR_LIMIT_3"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SYSTEM_BANK
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SYSTEM_BANK" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SYSTEM_BANK" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SYSTEM_BANK" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SYSTEM_BANK" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SYSTEM_BANK" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SYSTEM_BANK" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SYSTEM_BANK" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SYSTEM_BANK" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SYSTEM_BANK" MODIFY ("SYSTEM_BANK_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SYSTEM_BANK" MODIFY ("SYSTEM_BANK_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_SYSTEM_BANK_BRANCH
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_SYSTEM_BANK_BRANCH" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_SYSTEM_BANK_BRANCH" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_TAT_DOCUMENT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_TAT_DOCUMENT" MODIFY ("TAT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TAT_DOCUMENT" ADD CONSTRAINT "CMS_STG_TAT_ID_PK" PRIMARY KEY ("TAT_ID")
  USING INDEX "CMS_STG_TAT_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_TAT_DOCUMENT_DRAFT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_TAT_DOCUMENT_DRAFT" MODIFY ("DRAFT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TAT_DOCUMENT_DRAFT" ADD CONSTRAINT "CMS_STG_DRFT_ID_PK" PRIMARY KEY ("DRAFT_ID")
  USING INDEX "CMS_STG_TAT_DOC_DRAFT_I1"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_TAT_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_TAT_MASTER" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_TAT_PARAM
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_TAT_PARAM" MODIFY ("TAT_PARAM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TAT_PARAM" MODIFY ("APPLICATION_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TAT_PARAM" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TAT_PARAM" ADD CONSTRAINT "SQL110121194556870" PRIMARY KEY ("TAT_PARAM_ID")
  USING INDEX "SQL110121194556870"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_TAT_PARAM_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_TAT_PARAM_ITEM" MODIFY ("TAT_PARAM_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TAT_PARAM_ITEM" MODIFY ("TAT_PARAM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TAT_PARAM_ITEM" MODIFY ("STAGE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TAT_PARAM_ITEM" MODIFY ("STAGE_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TAT_PARAM_ITEM" MODIFY ("PRE_STAGE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TAT_PARAM_ITEM" MODIFY ("POST_STAGE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TAT_PARAM_ITEM" MODIFY ("DURATION" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TAT_PARAM_ITEM" MODIFY ("DURATION_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TAT_PARAM_ITEM" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TAT_PARAM_ITEM" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TAT_PARAM_ITEM" ADD CONSTRAINT "SQL110121194556910" PRIMARY KEY ("TAT_PARAM_ITEM_ID")
  USING INDEX "SQL110121194556910"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_TB_DEAL
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_TB_DEAL" MODIFY ("CMS_DEAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TB_DEAL" MODIFY ("AGREEMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TB_DEAL" ADD CONSTRAINT "TB_DEAL_ST_PK" PRIMARY KEY ("CMS_DEAL_ID")
  USING INDEX "TB_DEAL_ST_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_TB_DEAL_VAL
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_TB_DEAL_VAL" MODIFY ("CMS_DEAL_VAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TB_DEAL_VAL" MODIFY ("CMS_DEAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TB_DEAL_VAL" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TB_DEAL_VAL" ADD CONSTRAINT "TB_DEAL_VAL_ST_PK" PRIMARY KEY ("CMS_DEAL_VAL_ID")
  USING INDEX "TB_DEAL_VAL_ST_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_THRESHOLD_RATING
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_THRESHOLD_RATING" MODIFY ("RATING_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_THRESHOLD_RATING" MODIFY ("AGREEMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_THRESHOLD_RATING" ADD CONSTRAINT "THRES_RATE_ST_PK" PRIMARY KEY ("RATING_ID")
  USING INDEX "THRES_RATE_ST_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_TITLEDOC_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_TITLEDOC_TYPE" MODIFY ("TITLEDOC_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TITLEDOC_TYPE" MODIFY ("DOCUMENT_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TITLEDOC_TYPE" MODIFY ("DOCUMENT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TITLEDOC_TYPE" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TITLEDOC_TYPE" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TITLEDOC_TYPE" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TITLEDOC_TYPE" ADD CONSTRAINT "CMS_SDT_PK_TI" PRIMARY KEY ("TITLEDOC_TYPE_ID")
  USING INDEX "CMS_SDT_PK_TI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_TITLE_DOC
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_TITLE_DOC" MODIFY ("TITLE_DOC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TITLE_DOC" MODIFY ("TITLEDOC_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TITLE_DOC" MODIFY ("DEAL_PROC_STG" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TITLE_DOC" MODIFY ("ELIGIBILITY_ADV_PCT" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TITLE_DOC" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TITLE_DOC" ADD CONSTRAINT "CMS_STD_PK_DI" PRIMARY KEY ("TITLE_DOC_ID")
  USING INDEX "CMS_STD_PK_DI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_TRADING_AGREEMENT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_TRADING_AGREEMENT" MODIFY ("AGREEMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TRADING_AGREEMENT" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_TRADING_AGREEMENT" ADD CONSTRAINT "AGREEMENT_ST_PK" PRIMARY KEY ("AGREEMENT_ID")
  USING INDEX "AGREEMENT_ST_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_UDF
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_UDF" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_UDF" MODIFY ("MODULEID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_UDF" MODIFY ("MODULENAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_UDF" MODIFY ("FIELDNAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_UDF" MODIFY ("FIELDTYPEID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_UDF" MODIFY ("FIELDTYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_UDF" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_UDF" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_UDF" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_UDF" ADD CONSTRAINT "CMS_STAGE_UDF_MASTER_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_VALUATION
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_VALUATION" MODIFY ("VALUATION_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_VALUATION" ADD CONSTRAINT "PK_CMS_STAGE_VAL" PRIMARY KEY ("VALUATION_ID")
  USING INDEX "PK_CMS_STAGE_VAL"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_VALUATION_AGENCY
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_VALUATION_AGENCY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_VALUATION_AGENCY" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_VALUATION_AMT_RATING
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_VALUATION_AMT_RATING" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STAGE_WRHSE_RCPT
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_WRHSE_RCPT" MODIFY ("WAREHSE_RCPT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_WRHSE_RCPT" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STAGE_WRHSE_RCPT" ADD CONSTRAINT "CMS_SWR_PK_RI" PRIMARY KEY ("WAREHSE_RCPT_ID")
  USING INDEX "CMS_SWR_PK_RI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STATE
--------------------------------------------------------

  ALTER TABLE "CMS_STATE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STATE" MODIFY ("STATE_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STATE" MODIFY ("STATE_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STATE" MODIFY ("REGION_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STATE" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STATE" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STATE" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STATE" ADD CONSTRAINT "SQL110416160817940" PRIMARY KEY ("ID")
  USING INDEX "SQL110416160817940"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STATE_PINCODE_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_STATE_PINCODE_MAP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STATE_PINCODE_MAP" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STATE_PINCODE_MAP" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STATE_PINCODE_MAP" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STATE_PINCODE_MAP" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STATE_PINCODE_MAP" MODIFY ("STATE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STATE_PINCODE_MAP" MODIFY ("PINCODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STATE_PINCODE_MAP" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_COLLATERAL_NEW_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_STG_COLLATERAL_NEW_MASTER" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STG_FACILITY_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FACILITY_MASTER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_FACILITY_MASTER" ADD CONSTRAINT "SQL110121194558820" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194558820"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_FAC_BBA_VARI_PACKAGE
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FAC_BBA_VARI_PACKAGE" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_FAC_BBA_VARI_PACKAGE" ADD CONSTRAINT "SQL110121194559660" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194559660"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_FAC_BNM_CODES
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FAC_BNM_CODES" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_FAC_BNM_CODES" ADD CONSTRAINT "SQL110121194558870" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194558870"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_FAC_FEE_CHARGE
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FAC_FEE_CHARGE" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_FAC_FEE_CHARGE" ADD CONSTRAINT "SQL110121194558910" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194558910"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_FAC_GENERAL
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FAC_GENERAL" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_FAC_GENERAL" ADD CONSTRAINT "SQL110121194558970" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194558970"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_FAC_INCREMENTAL
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FAC_INCREMENTAL" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_FAC_INCREMENTAL" ADD CONSTRAINT "SQL110121194600100" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194600100"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_FAC_INSURANCE
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FAC_INSURANCE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_FAC_INSURANCE" ADD CONSTRAINT "SQL110121194559040" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194559040"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_FAC_INTEREST
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FAC_INTEREST" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_FAC_INTEREST" ADD CONSTRAINT "SQL110121194559260" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194559260"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_FAC_ISLAMIC_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FAC_ISLAMIC_MASTER" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_FAC_ISLAMIC_MASTER" ADD CONSTRAINT "SQL110121194559410" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194559410"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_FAC_MESSAGE
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FAC_MESSAGE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_FAC_MESSAGE" ADD CONSTRAINT "SQL110121194559870" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194559870"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_FAC_OFFICER
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FAC_OFFICER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_FAC_OFFICER" ADD CONSTRAINT "SQL110121194559080" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194559080"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_FAC_PAYMENT
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FAC_PAYMENT" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_FAC_PAYMENT" ADD CONSTRAINT "SQL110121194559320" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194559320"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_FAC_REDUCTION
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FAC_REDUCTION" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_FAC_REDUCTION" ADD CONSTRAINT "SQL110121194600180" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194600180"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_FAC_RELATIONSHIP
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FAC_RELATIONSHIP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_FAC_RELATIONSHIP" ADD CONSTRAINT "SQL110121194559150" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194559150"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_FAC_RENTAL_RENEWAL
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FAC_RENTAL_RENEWAL" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_FAC_RENTAL_RENEWAL" ADD CONSTRAINT "SQL110121194559930" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194559930"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_FAC_SECURITY_DEPOSIT
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FAC_SECURITY_DEPOSIT" MODIFY ("CMS_FAC_MASTER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_FAC_SECURITY_DEPOSIT" ADD CONSTRAINT "SQL110121194600010" PRIMARY KEY ("CMS_FAC_MASTER_ID")
  USING INDEX "SQL110121194600010"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_FCLT_NW_MASTER_2108
--------------------------------------------------------

  ALTER TABLE "CMS_STG_FCLT_NW_MASTER_2108" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STG_INSURANCE_COVERAGE_DET
--------------------------------------------------------

  ALTER TABLE "CMS_STG_INSURANCE_COVERAGE_DET" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_INSURANCE_COVERAGE_DET" MODIFY ("INSURANCE_COVERAGE_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_INSURANCE_COVERAGE_DET" MODIFY ("INSURANCE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_INSURANCE_COVERAGE_DET" MODIFY ("CATEGORY_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_INSURANCE_COVERAGE_DET" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_INSURANCE_COVERAGE_DET" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_INSURANCE_COVERAGE_DET" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_INSURANCE_COVERAGE_DET" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_INSURANCE_COVERAGE_DET" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_INSURANCE_COVERAGE_DET" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_INSURANCE_COVERAGE_DET" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_INSURANCE_COVERAGE_DET" ADD CONSTRAINT "PK_INSURANCE_COVERAGE_DTLS_3" PRIMARY KEY ("ID")
  USING INDEX "PK_INSURANCE_COVERAGE_DTLS_3"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_INTERNAL_CREDIT_RATING
--------------------------------------------------------

  ALTER TABLE "CMS_STG_INTERNAL_CREDIT_RATING" MODIFY ("INT_CR_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_INTERNAL_CREDIT_RATING" ADD CONSTRAINT "SQL110121194743890" PRIMARY KEY ("INT_CR_ID")
  USING INDEX "SQL110121194743890"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_LEAD_NODAL_BANK_STOCK
--------------------------------------------------------

  ALTER TABLE "CMS_STG_LEAD_NODAL_BANK_STOCK" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_LEAD_NODAL_BANK_STOCK" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_LEAD_NODAL_BANK_STOCK" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_LEAD_NODAL_BANK_STOCK" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_LEAD_NODAL_BANK_STOCK" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_LEAD_NODAL_BANK_STOCK" ADD CONSTRAINT "pk_stg_lead_nodal_bank_stock" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_LOCAL_CAD
--------------------------------------------------------

  ALTER TABLE "CMS_STG_LOCAL_CAD" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_LOCAL_CAD" MODIFY ("CAD_EMPLOYEE_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_LOCAL_CAD" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_LOCAL_CAD" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_LOCAL_CAD" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_LOCAL_CAD" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_LOCAL_CAD" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_LOCAL_CAD" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_LOCAL_CAD" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STG_PORTFOL_ITEM_21032016
--------------------------------------------------------

  ALTER TABLE "CMS_STG_PORTFOL_ITEM_21032016" MODIFY ("ITEM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STG_PROP_IDX_DISTRICT_CODE
--------------------------------------------------------

  ALTER TABLE "CMS_STG_PROP_IDX_DISTRICT_CODE" MODIFY ("PROPERTY_IDX_DISTRICT_CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_PROP_IDX_DISTRICT_CODE" ADD CONSTRAINT "SQL110121194555680" PRIMARY KEY ("PROPERTY_IDX_DISTRICT_CODE_ID")
  USING INDEX "SQL110121194555680"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STG_SECURITY_COVERAGE
--------------------------------------------------------

  ALTER TABLE "CMS_STG_SECURITY_COVERAGE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_SECURITY_COVERAGE" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_SECURITY_COVERAGE" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_SECURITY_COVERAGE" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_SECURITY_COVERAGE" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_SECURITY_COVERAGE" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STG_SECURITY_COVERAGE" ADD CONSTRAINT "pk_stg_security_coverage" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STOCK_EXCHANGE
--------------------------------------------------------

  ALTER TABLE "CMS_STOCK_EXCHANGE" MODIFY ("STOCK_EXCHANGE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STOCK_EXCHANGE" ADD CONSTRAINT "PK_CMS_STOCK_EXCG" PRIMARY KEY ("STOCK_EXCHANGE")
  USING INDEX "PK_CMS_STOCK_EXCG"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_STP_READY_STATUS_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_STP_READY_STATUS_MAP" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STP_READY_STATUS_MAP" MODIFY ("TRANSACTION_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_STP_READY_STATUS_MAP" MODIFY ("IS_STP_READY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_STTLMT_RCPT_MAP
--------------------------------------------------------

  ALTER TABLE "CMS_STTLMT_RCPT_MAP" MODIFY ("SETTLMT_WHRCPT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STTLMT_RCPT_MAP" MODIFY ("WAREHSE_RCPT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STTLMT_RCPT_MAP" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_STTLMT_RCPT_MAP" ADD CONSTRAINT "CMS_DSR_PK_SI" PRIMARY KEY ("SETTLMT_WHRCPT_ID")
  USING INDEX "CMS_DSR_PK_SI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SUB_CERSAI_MAPPING
--------------------------------------------------------

  ALTER TABLE "CMS_SUB_CERSAI_MAPPING" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_SUB_SECTOR_LIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_SUB_SECTOR_LIMIT" MODIFY ("SUB_SECTOR_LIMIT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SUB_SECTOR_LIMIT" ADD CONSTRAINT "SUB_SECTOR_LIMIT" PRIMARY KEY ("SUB_SECTOR_LIMIT_ID")
  USING INDEX "SUB_SECTOR_LIMIT"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SUB_STAGE_CERSAI_MAPPING
--------------------------------------------------------

  ALTER TABLE "CMS_SUB_STAGE_CERSAI_MAPPING" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_SYSTEM_BANK
--------------------------------------------------------

  ALTER TABLE "CMS_SYSTEM_BANK" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK" MODIFY ("SYSTEM_BANK_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK" MODIFY ("SYSTEM_BANK_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK" ADD CONSTRAINT "PK_SYSTEM_BANK" PRIMARY KEY ("ID")
  USING INDEX "PK_SYSTEM_BANK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_SYSTEM_BANK_BRANCH
--------------------------------------------------------

  ALTER TABLE "CMS_SYSTEM_BANK_BRANCH" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK_BRANCH" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK_BRANCH" MODIFY ("CREATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK_BRANCH" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK_BRANCH" MODIFY ("LAST_UPDATE_BY" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK_BRANCH" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK_BRANCH" MODIFY ("DEPRECATED" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK_BRANCH" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK_BRANCH" MODIFY ("SYSTEM_BANK_BRANCH_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK_BRANCH" MODIFY ("SYSTEM_BANK_BRANCH_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK_BRANCH" MODIFY ("SYSTEM_BANK_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_SYSTEM_BANK_BRANCH" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_TAT_DOCUMENT
--------------------------------------------------------

  ALTER TABLE "CMS_TAT_DOCUMENT" MODIFY ("TAT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_DOCUMENT" ADD CONSTRAINT "CMS_TAT_ID_PK" PRIMARY KEY ("TAT_ID")
  USING INDEX "CMS_TAT_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TAT_DOCUMENT_DRAFT
--------------------------------------------------------

  ALTER TABLE "CMS_TAT_DOCUMENT_DRAFT" MODIFY ("DRAFT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_DOCUMENT_DRAFT" ADD CONSTRAINT "CMS_DRAFT_ID_PK" PRIMARY KEY ("DRAFT_ID")
  USING INDEX "CMS_TAT_DOC_DRAFT_I1"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TAT_ENTRY
--------------------------------------------------------

  ALTER TABLE "CMS_TAT_ENTRY" MODIFY ("TAT_ENTRY_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_ENTRY" MODIFY ("LIMIT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_ENTRY" ADD CONSTRAINT "PK_TAT_ENTRY" PRIMARY KEY ("TAT_ENTRY_ID")
  USING INDEX "PK_TAT_ENTRY"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TAT_MASTER
--------------------------------------------------------

  ALTER TABLE "CMS_TAT_MASTER" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_TAT_PARAM
--------------------------------------------------------

  ALTER TABLE "CMS_TAT_PARAM" MODIFY ("TAT_PARAM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_PARAM" MODIFY ("APPLICATION_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_PARAM" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_PARAM" ADD CONSTRAINT "SQL110121194556770" PRIMARY KEY ("TAT_PARAM_ID")
  USING INDEX "SQL110121194556770"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TAT_PARAM_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_TAT_PARAM_ITEM" MODIFY ("TAT_PARAM_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_PARAM_ITEM" MODIFY ("TAT_PARAM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_PARAM_ITEM" MODIFY ("STAGE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_PARAM_ITEM" MODIFY ("STAGE_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_PARAM_ITEM" MODIFY ("PRE_STAGE" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_PARAM_ITEM" MODIFY ("POST_STAGE" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_PARAM_ITEM" MODIFY ("DURATION" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_PARAM_ITEM" MODIFY ("DURATION_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_PARAM_ITEM" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_PARAM_ITEM" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_PARAM_ITEM" ADD CONSTRAINT "SQL110121194556820" PRIMARY KEY ("TAT_PARAM_ITEM_ID")
  USING INDEX "SQL110121194556820"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TAT_TRACK
--------------------------------------------------------

  ALTER TABLE "CMS_TAT_TRACK" MODIFY ("TAT_TRACK_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_TRACK" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_TRACK" MODIFY ("LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_TRACK" ADD CONSTRAINT "SQL110121194556940" PRIMARY KEY ("TAT_TRACK_ID")
  USING INDEX "SQL110121194556940"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TAT_TRACK_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_TAT_TRACK_ITEM" MODIFY ("TAT_TRACK_STAGE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_TRACK_ITEM" MODIFY ("TAT_PARAM_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_TRACK_ITEM" MODIFY ("TAT_TRACK_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TAT_TRACK_ITEM" ADD CONSTRAINT "SQL110121194556990" PRIMARY KEY ("TAT_TRACK_STAGE_ID")
  USING INDEX "SQL110121194556990"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TB_DEAL
--------------------------------------------------------

  ALTER TABLE "CMS_TB_DEAL" MODIFY ("CMS_DEAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TB_DEAL" MODIFY ("AGREEMENT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_TB_DEAL_VAL
--------------------------------------------------------

  ALTER TABLE "CMS_TB_DEAL_VAL" MODIFY ("CMS_DEAL_VAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TB_DEAL_VAL" MODIFY ("CMS_DEAL_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TB_DEAL_VAL" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TB_DEAL_VAL" ADD CONSTRAINT "TB_DEAL_VAL_PK" PRIMARY KEY ("CMS_DEAL_VAL_ID")
  USING INDEX "TB_DEAL_VAL_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TEAM
--------------------------------------------------------

  ALTER TABLE "CMS_TEAM" MODIFY ("TEAM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEAM" ADD CONSTRAINT "PK_CMS_TEAM" PRIMARY KEY ("TEAM_ID")
  USING INDEX "PK_CMS_TEAM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TEAM_CMS_SEGMENT_CODE
--------------------------------------------------------

  ALTER TABLE "CMS_TEAM_CMS_SEGMENT_CODE" MODIFY ("CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEAM_CMS_SEGMENT_CODE" MODIFY ("SEGMENT_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEAM_CMS_SEGMENT_CODE" ADD CONSTRAINT "CMS_SGMT_CODE_PK" PRIMARY KEY ("CODE_ID")
  USING INDEX "CMS_SGMT_CODE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TEAM_COUNTRY_CODE
--------------------------------------------------------

  ALTER TABLE "CMS_TEAM_COUNTRY_CODE" MODIFY ("CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEAM_COUNTRY_CODE" MODIFY ("COUNTRY_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_TEAM_FUNCTION_GRP
--------------------------------------------------------

  ALTER TABLE "CMS_TEAM_FUNCTION_GRP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEAM_FUNCTION_GRP" ADD CONSTRAINT "SQL110121194554940" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194554940"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TEAM_MEMBER
--------------------------------------------------------

  ALTER TABLE "CMS_TEAM_MEMBER" MODIFY ("TEAM_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEAM_MEMBER" ADD CONSTRAINT "PK_CMS_MEM_ID" PRIMARY KEY ("TEAM_MEMBER_ID")
  USING INDEX "PK_CMS_MEM_ID"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TEAM_MEMBERSHIP
--------------------------------------------------------

  ALTER TABLE "CMS_TEAM_MEMBERSHIP" MODIFY ("TEAM_MEMBERSHIP_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_TEAM_MEMBER_04052012
--------------------------------------------------------

  ALTER TABLE "CMS_TEAM_MEMBER_04052012" MODIFY ("TEAM_MEMBER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_TEAM_ORGANISATION_CODE
--------------------------------------------------------

  ALTER TABLE "CMS_TEAM_ORGANISATION_CODE" MODIFY ("CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEAM_ORGANISATION_CODE" MODIFY ("ORGANISATION_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEAM_ORGANISATION_CODE" ADD CONSTRAINT "CMS_TEAM_ORG_CODE" PRIMARY KEY ("CODE_ID")
  USING INDEX "CMS_TEAM_ORG_CODE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TEAM_ORG_GROUP_CODE
--------------------------------------------------------

  ALTER TABLE "CMS_TEAM_ORG_GROUP_CODE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEAM_ORG_GROUP_CODE" MODIFY ("ORG_GROUP_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEAM_ORG_GROUP_CODE" ADD CONSTRAINT "TEAM_ORG_GRP_CODE" PRIMARY KEY ("ID")
  USING INDEX "TEAM_ORG_GRP_CODE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TEAM_SEGMENT_CODE
--------------------------------------------------------

  ALTER TABLE "CMS_TEAM_SEGMENT_CODE" MODIFY ("CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEAM_SEGMENT_CODE" MODIFY ("SEGMENT_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEAM_SEGMENT_CODE" ADD CONSTRAINT "CMS_TEAM_SGMT_CODE" PRIMARY KEY ("CODE_ID")
  USING INDEX "CMS_TEAM_SGMT_CODE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TEAM_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_TEAM_TYPE" MODIFY ("TEAM_TYPE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_TEAM_TYPE_MEMBERSHIP
--------------------------------------------------------

  ALTER TABLE "CMS_TEAM_TYPE_MEMBERSHIP" MODIFY ("TEAM_TYPE_MEMBERSHIP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEAM_TYPE_MEMBERSHIP" ADD CONSTRAINT "CMS_TEM_TYP_MEM_ID" PRIMARY KEY ("TEAM_TYPE_MEMBERSHIP_ID")
  USING INDEX "CMS_TEM_TYP_MEM_ID"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TEMP_GEOGRAPHY
--------------------------------------------------------

  ALTER TABLE "CMS_TEMP_GEOGRAPHY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEMP_GEOGRAPHY" ADD CONSTRAINT "SQL110201110306010" PRIMARY KEY ("ID")
  USING INDEX "SQL110201110306010"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TEMP_IMAGE_UPLOAD
--------------------------------------------------------

  ALTER TABLE "CMS_TEMP_IMAGE_UPLOAD" MODIFY ("IMG_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEMP_IMAGE_UPLOAD" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEMP_IMAGE_UPLOAD" ADD CONSTRAINT "IMG_ID_PK" PRIMARY KEY ("IMG_ID")
  USING INDEX "IMG_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TEMP_IMAGE_UPLOAD_2012
--------------------------------------------------------

  ALTER TABLE "CMS_TEMP_IMAGE_UPLOAD_2012" MODIFY ("IMG_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEMP_IMAGE_UPLOAD_2012" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_TEMP_PUBLIC_HOLIDAY
--------------------------------------------------------

  ALTER TABLE "CMS_TEMP_PUBLIC_HOLIDAY" MODIFY ("HOLIDAY_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_TEMP_PUBLIC_HOLIDAY" MODIFY ("COUNTRY_ISO_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_THRESHOLD_RATING
--------------------------------------------------------

  ALTER TABLE "CMS_THRESHOLD_RATING" MODIFY ("RATING_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_THRESHOLD_RATING" MODIFY ("AGREEMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_THRESHOLD_RATING" ADD CONSTRAINT "THRES_RATE_PK" PRIMARY KEY ("RATING_ID")
  USING INDEX "THRES_RATE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TITLEDOC_TYPE
--------------------------------------------------------

  ALTER TABLE "CMS_TITLEDOC_TYPE" MODIFY ("TITLEDOC_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TITLEDOC_TYPE" MODIFY ("DOCUMENT_NAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_TITLEDOC_TYPE" MODIFY ("DOCUMENT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_TITLEDOC_TYPE" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TITLEDOC_TYPE" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TITLEDOC_TYPE" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_TITLEDOC_TYPE" ADD CONSTRAINT "CMS_CDT_PK_TI" PRIMARY KEY ("TITLEDOC_TYPE_ID")
  USING INDEX "CMS_CDT_PK_TI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TITLE_DOC
--------------------------------------------------------

  ALTER TABLE "CMS_TITLE_DOC" MODIFY ("TITLE_DOC_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TITLE_DOC" MODIFY ("TITLEDOC_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TITLE_DOC" MODIFY ("DEAL_PROC_STG" NOT NULL ENABLE);
  ALTER TABLE "CMS_TITLE_DOC" MODIFY ("ELIGIBILITY_ADV_PCT" NOT NULL ENABLE);
  ALTER TABLE "CMS_TITLE_DOC" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TITLE_DOC" ADD CONSTRAINT "CMS_DTD_PK_DI" PRIMARY KEY ("TITLE_DOC_ID")
  USING INDEX "CMS_DTD_PK_DI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TRADE_COMMISSION
--------------------------------------------------------

  ALTER TABLE "CMS_TRADE_COMMISSION" MODIFY ("CMS_TRADE_COMMISSION_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TRADE_COMMISSION" MODIFY ("CMS_LSP_APPR_LMTS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TRADE_COMMISSION" ADD CONSTRAINT "TRADE_COMM_PK" PRIMARY KEY ("CMS_TRADE_COMMISSION_ID")
  USING INDEX "TRADE_COMM_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TRADE_LIMIT
--------------------------------------------------------

  ALTER TABLE "CMS_TRADE_LIMIT" MODIFY ("CMS_LSP_APPR_LMTS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TRADE_LIMIT" ADD CONSTRAINT "TRADE_LMT_PK" PRIMARY KEY ("CMS_LSP_APPR_LMTS_ID")
  USING INDEX "TRADE_LMT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TRADE_MESSAGE_LOG
--------------------------------------------------------

  ALTER TABLE "CMS_TRADE_MESSAGE_LOG" MODIFY ("LOG_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_TRADE_PRICING
--------------------------------------------------------

  ALTER TABLE "CMS_TRADE_PRICING" MODIFY ("CMS_TRADE_PRICING_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TRADE_PRICING" MODIFY ("CMS_LSP_APPR_LMTS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TRADE_PRICING" ADD CONSTRAINT "TRADE_PRICING_PK" PRIMARY KEY ("CMS_TRADE_PRICING_ID")
  USING INDEX "TRADE_PRICING_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TRADE_SUPPLIER_BUYER
--------------------------------------------------------

  ALTER TABLE "CMS_TRADE_SUPPLIER_BUYER" MODIFY ("CMS_TRADE_SUPPLIER_BUYER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TRADE_SUPPLIER_BUYER" MODIFY ("CMS_LSP_APPR_LMTS_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TRADE_SUPPLIER_BUYER" ADD CONSTRAINT "TR_SUPPLY_BUY_PK" PRIMARY KEY ("CMS_TRADE_SUPPLIER_BUYER_ID")
  USING INDEX "TR_SUPPLY_BUY_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_TRADING_AGREEMENT
--------------------------------------------------------

  ALTER TABLE "CMS_TRADING_AGREEMENT" MODIFY ("AGREEMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TRADING_AGREEMENT" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_TRADING_AGREEMENT" ADD CONSTRAINT "AGREEMENT_PK" PRIMARY KEY ("AGREEMENT_ID")
  USING INDEX "AGREEMENT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_UDF
--------------------------------------------------------

  ALTER TABLE "CMS_UDF" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_UDF" MODIFY ("MODULEID" NOT NULL ENABLE);
  ALTER TABLE "CMS_UDF" MODIFY ("MODULENAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_UDF" MODIFY ("FIELDNAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_UDF" MODIFY ("FIELDTYPEID" NOT NULL ENABLE);
  ALTER TABLE "CMS_UDF" MODIFY ("FIELDTYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_UDF" MODIFY ("CREATION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_UDF" MODIFY ("LAST_UPDATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CMS_UDF" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_UDF" ADD CONSTRAINT "CMS_UDF_MASTER_PK" PRIMARY KEY ("ID")
  USING INDEX "CMS_UDF_MASTER_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_UDF_20190528
--------------------------------------------------------

  ALTER TABLE "CMS_UDF_20190528" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_UDF_20190528" MODIFY ("MODULEID" NOT NULL ENABLE);
  ALTER TABLE "CMS_UDF_20190528" MODIFY ("MODULENAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_UDF_20190528" MODIFY ("FIELDNAME" NOT NULL ENABLE);
  ALTER TABLE "CMS_UDF_20190528" MODIFY ("FIELDTYPEID" NOT NULL ENABLE);
  ALTER TABLE "CMS_UDF_20190528" MODIFY ("FIELDTYPE" NOT NULL ENABLE);
  ALTER TABLE "CMS_UDF_20190528" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_UPLOADED_IMAGES
--------------------------------------------------------

  ALTER TABLE "CMS_UPLOADED_IMAGES" MODIFY ("IMG_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_UPLOADED_IMAGES" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CMS_UPLOADED_IMAGES" ADD CONSTRAINT "CMS_UPLOADED_IMAGES_PK" PRIMARY KEY ("IMG_ID")
  USING INDEX "CMS_UPLOADED_IMAGES_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_USER
--------------------------------------------------------

  ALTER TABLE "CMS_USER" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_USER" ADD CONSTRAINT "PK_CMS_USER" PRIMARY KEY ("USER_ID")
  USING INDEX "PK_CMS_USER"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_USER_MODULE
--------------------------------------------------------

  ALTER TABLE "CMS_USER_MODULE" MODIFY ("MODULE_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_USER_MODULE" MODIFY ("MODULE_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_USER_SESSION
--------------------------------------------------------

  ALTER TABLE "CMS_USER_SESSION" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_USER_SESSION" MODIFY ("SESSION_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_USER_SESSION" ADD CONSTRAINT "PK_CMS_USR_SESSION" PRIMARY KEY ("USER_ID")
  USING INDEX "PK_CMS_USR_SESSION"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_VALUATION
--------------------------------------------------------

  ALTER TABLE "CMS_VALUATION" MODIFY ("VALUATION_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_VALUATION" ADD CONSTRAINT "PK_CMS_VALUATION" PRIMARY KEY ("VALUATION_ID")
  USING INDEX "PK_CMS_VALUATION"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_VALUATION_AGENCY
--------------------------------------------------------

  ALTER TABLE "CMS_VALUATION_AGENCY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_VALUATION_AGENCY" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "CMS_VALUATION_AGENCY" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_VALUATION_AMT_RATING
--------------------------------------------------------

  ALTER TABLE "CMS_VALUATION_AMT_RATING" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CMS_VALUER
--------------------------------------------------------

  ALTER TABLE "CMS_VALUER" MODIFY ("VALUER_CODE" NOT NULL ENABLE);
  ALTER TABLE "CMS_VALUER" ADD CONSTRAINT "PK_CMS_VALUER" PRIMARY KEY ("VALUER_CODE")
  USING INDEX "PK_CMS_VALUER"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_WAIVER_GENERATED
--------------------------------------------------------

  ALTER TABLE "CMS_WAIVER_GENERATED" MODIFY ("WAIVER_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_WAIVER_GENERATED" ADD CONSTRAINT "CMS_WAIVER_GENERAT" PRIMARY KEY ("WAIVER_ID")
  USING INDEX "CMS_WAIVER_GENERAT"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_WAIVER_GENERATED_ITEM
--------------------------------------------------------

  ALTER TABLE "CMS_WAIVER_GENERATED_ITEM" MODIFY ("WAIVER_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_WAIVER_GENERATED_ITEM" ADD CONSTRAINT "CMS_WAIVER_GEN_ITM" PRIMARY KEY ("WAIVER_ITEM_ID")
  USING INDEX "CMS_WAIVER_GEN_ITM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CMS_WRHSE_RCPT
--------------------------------------------------------

  ALTER TABLE "CMS_WRHSE_RCPT" MODIFY ("WAREHSE_RCPT_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_WRHSE_RCPT" MODIFY ("CMS_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "CMS_WRHSE_RCPT" ADD CONSTRAINT "CMS_DWR_PK_RI" PRIMARY KEY ("WAREHSE_RCPT_ID")
  USING INDEX "CMS_DWR_PK_RI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COMMON_CODE_CATEGORY
--------------------------------------------------------

  ALTER TABLE "COMMON_CODE_CATEGORY" MODIFY ("CATEGORY_ID" NOT NULL ENABLE);
  ALTER TABLE "COMMON_CODE_CATEGORY" MODIFY ("CATEGORY_CODE" NOT NULL ENABLE);
  ALTER TABLE "COMMON_CODE_CATEGORY" ADD CONSTRAINT "CCCAT_CAT_ID_PK" PRIMARY KEY ("CATEGORY_ID")
  USING INDEX "CCCAT_CAT_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COMMON_CODE_CATEGORY_ENTRY
--------------------------------------------------------

  ALTER TABLE "COMMON_CODE_CATEGORY_ENTRY" MODIFY ("ENTRY_ID" NOT NULL ENABLE);
  ALTER TABLE "COMMON_CODE_CATEGORY_ENTRY" MODIFY ("ENTRY_CODE" NOT NULL ENABLE);
  ALTER TABLE "COMMON_CODE_CATEGORY_ENTRY" ADD CONSTRAINT "CCCAT_ENT_ID_PK" PRIMARY KEY ("ENTRY_ID")
  USING INDEX "CCCAT_ENT_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COMMON_CODE_CATEGORY_ENTRY123
--------------------------------------------------------

  ALTER TABLE "COMMON_CODE_CATEGORY_ENTRY123" MODIFY ("ENTRY_ID" NOT NULL ENABLE);
  ALTER TABLE "COMMON_CODE_CATEGORY_ENTRY123" MODIFY ("ENTRY_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COMMON_CODE_ENTRY_AUDIT
--------------------------------------------------------

  ALTER TABLE "COMMON_CODE_ENTRY_AUDIT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DOC_INFO
--------------------------------------------------------

  ALTER TABLE "DOC_INFO" MODIFY ("DESC_2013" NOT NULL ENABLE);
  ALTER TABLE "DOC_INFO" MODIFY ("DOC_ID_2013" NOT NULL ENABLE);
  ALTER TABLE "DOC_INFO" MODIFY ("DESC_2014" NOT NULL ENABLE);
  ALTER TABLE "DOC_INFO" MODIFY ("DOC_ID_2014" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DOC_INFO_2014
--------------------------------------------------------

  ALTER TABLE "DOC_INFO_2014" MODIFY ("DESC_2013" NOT NULL ENABLE);
  ALTER TABLE "DOC_INFO_2014" MODIFY ("DOC_ID_2013" NOT NULL ENABLE);
  ALTER TABLE "DOC_INFO_2014" MODIFY ("DESC_2014" NOT NULL ENABLE);
  ALTER TABLE "DOC_INFO_2014" MODIFY ("DOC_ID_2014" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DUMMY_AUDIT_CMS_BASEL_MONTHLY
--------------------------------------------------------

  ALTER TABLE "DUMMY_AUDIT_CMS_BASEL_MONTHLY" MODIFY ("FIC_MIS_DATE" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_AUDIT_CMS_BASEL_MONTHLY" MODIFY ("V_F_SECURITY_ID" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_AUDIT_CMS_BASEL_MONTHLY" MODIFY ("V_F_MITIGANT_SOURCE_SYS" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_AUDIT_CMS_BASEL_MONTHLY" MODIFY ("V_F_SYSTEM_EXP_IND" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_AUDIT_CMS_BASEL_MONTHLY" MODIFY ("N_F_LINE_SERIAL" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_AUDIT_CMS_BASEL_MONTHLY" MODIFY ("V_F_MITIGANT_CODE" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_AUDIT_CMS_BASEL_MONTHLY" MODIFY ("V_F_MITIGANT_TYPE_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DUMMY_CMS_BASEL_MONTHLY
--------------------------------------------------------

  ALTER TABLE "DUMMY_CMS_BASEL_MONTHLY" MODIFY ("FIC_MIS_DATE" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_CMS_BASEL_MONTHLY" MODIFY ("V_F_SECURITY_ID" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_CMS_BASEL_MONTHLY" MODIFY ("V_F_MITIGANT_SOURCE_SYS" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_CMS_BASEL_MONTHLY" MODIFY ("V_F_SYSTEM_EXP_IND" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_CMS_BASEL_MONTHLY" MODIFY ("N_F_LINE_SERIAL" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_CMS_BASEL_MONTHLY" MODIFY ("V_F_MITIGANT_CODE" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_CMS_BASEL_MONTHLY" MODIFY ("V_F_MITIGANT_TYPE_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DUMMY_CMS_BASEL_TABLE
--------------------------------------------------------

  ALTER TABLE "DUMMY_CMS_BASEL_TABLE" MODIFY ("FIC_MIS_DATE" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_CMS_BASEL_TABLE" MODIFY ("V_F_SECURITY_ID" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_CMS_BASEL_TABLE" MODIFY ("V_F_MITIGANT_SOURCE_SYS" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_CMS_BASEL_TABLE" MODIFY ("V_F_SYSTEM_EXP_IND" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_CMS_BASEL_TABLE" MODIFY ("V_F_MITIGANT_CODE" NOT NULL ENABLE);
  ALTER TABLE "DUMMY_CMS_BASEL_TABLE" MODIFY ("V_F_MITIGANT_TYPE_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DWH_CLOSEDDELETEEXTRACT
--------------------------------------------------------

  ALTER TABLE "DWH_CLOSEDDELETEEXTRACT" MODIFY ("N_LINE_SERIAL" NOT NULL ENABLE);
  ALTER TABLE "DWH_CLOSEDDELETEEXTRACT" MODIFY ("SEC_NAME" NOT NULL ENABLE);
  ALTER TABLE "DWH_CLOSEDDELETEEXTRACT" MODIFY ("V_MITIGANT_CODE" NOT NULL ENABLE);
  ALTER TABLE "DWH_CLOSEDDELETEEXTRACT" MODIFY ("FIC_MIS_DATE" NOT NULL ENABLE);
  ALTER TABLE "DWH_CLOSEDDELETEEXTRACT" MODIFY ("V_F_MITIGANT_SOURCE_SYS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DWH_OPENEXTRACT
--------------------------------------------------------

  ALTER TABLE "DWH_OPENEXTRACT" MODIFY ("N_LINE_SERIAL" NOT NULL ENABLE);
  ALTER TABLE "DWH_OPENEXTRACT" MODIFY ("SEC_NAME" NOT NULL ENABLE);
  ALTER TABLE "DWH_OPENEXTRACT" MODIFY ("V_MITIGANT_CODE" NOT NULL ENABLE);
  ALTER TABLE "DWH_OPENEXTRACT" MODIFY ("FIC_MIS_DATE" NOT NULL ENABLE);
  ALTER TABLE "DWH_OPENEXTRACT" MODIFY ("V_F_MITIGANT_SOURCE_SYS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EMAIL_NOTIFICATION
--------------------------------------------------------

  ALTER TABLE "EMAIL_NOTIFICATION" MODIFY ("NOTIFCATION_ID" NOT NULL ENABLE);
  ALTER TABLE "EMAIL_NOTIFICATION" ADD CONSTRAINT "EMAIL_NOTIFICATION_PK" PRIMARY KEY ("NOTIFCATION_ID")
  USING INDEX "EMAIL_NOTIFICATION_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EOY_PROC
--------------------------------------------------------

  ALTER TABLE "EOY_PROC" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "EOY_PROC" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EXPLAIN_ARGUMENT
--------------------------------------------------------

  ALTER TABLE "EXPLAIN_ARGUMENT" MODIFY ("EXPLAIN_REQUESTER" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_ARGUMENT" MODIFY ("EXPLAIN_TIME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_ARGUMENT" MODIFY ("SOURCE_NAME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_ARGUMENT" MODIFY ("SOURCE_SCHEMA" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_ARGUMENT" MODIFY ("SOURCE_VERSION" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_ARGUMENT" MODIFY ("EXPLAIN_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_ARGUMENT" MODIFY ("STMTNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_ARGUMENT" MODIFY ("SECTNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_ARGUMENT" MODIFY ("OPERATOR_ID" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_ARGUMENT" MODIFY ("ARGUMENT_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EXPLAIN_DIAGNOSTIC
--------------------------------------------------------

  ALTER TABLE "EXPLAIN_DIAGNOSTIC" MODIFY ("EXPLAIN_REQUESTER" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC" MODIFY ("EXPLAIN_TIME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC" MODIFY ("SOURCE_NAME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC" MODIFY ("SOURCE_SCHEMA" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC" MODIFY ("SOURCE_VERSION" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC" MODIFY ("EXPLAIN_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC" MODIFY ("STMTNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC" MODIFY ("SECTNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC" MODIFY ("DIAGNOSTIC_ID" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC" MODIFY ("CODE" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC" ADD CONSTRAINT "SQL110403121944270" PRIMARY KEY ("EXPLAIN_REQUESTER", "EXPLAIN_TIME", "SOURCE_NAME", "SOURCE_SCHEMA", "SOURCE_VERSION", "EXPLAIN_LEVEL", "STMTNO", "SECTNO", "DIAGNOSTIC_ID")
  USING INDEX "SQL110403121944270"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EXPLAIN_DIAGNOSTIC_DATA
--------------------------------------------------------

  ALTER TABLE "EXPLAIN_DIAGNOSTIC_DATA" MODIFY ("EXPLAIN_REQUESTER" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC_DATA" MODIFY ("EXPLAIN_TIME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC_DATA" MODIFY ("SOURCE_NAME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC_DATA" MODIFY ("SOURCE_SCHEMA" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC_DATA" MODIFY ("SOURCE_VERSION" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC_DATA" MODIFY ("EXPLAIN_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC_DATA" MODIFY ("STMTNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC_DATA" MODIFY ("SECTNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC_DATA" MODIFY ("DIAGNOSTIC_ID" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_DIAGNOSTIC_DATA" MODIFY ("ORDINAL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EXPLAIN_INSTANCE
--------------------------------------------------------

  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("EXPLAIN_REQUESTER" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("EXPLAIN_TIME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("SOURCE_NAME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("SOURCE_SCHEMA" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("SOURCE_VERSION" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("EXPLAIN_OPTION" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("SNAPSHOT_TAKEN" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("DB2_VERSION" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("SQL_TYPE" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("QUERYOPT" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("BLOCK" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("ISOLATION" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("BUFFPAGE" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("AVG_APPLS" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("SORTHEAP" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("LOCKLIST" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("MAXLOCKS" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("LOCKS_AVAIL" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("CPU_SPEED" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("DBHEAP" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("COMM_SPEED" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("PARALLELISM" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" MODIFY ("DATAJOINER" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_INSTANCE" ADD CONSTRAINT "SQL110403121943460" PRIMARY KEY ("EXPLAIN_REQUESTER", "EXPLAIN_TIME", "SOURCE_NAME", "SOURCE_SCHEMA", "SOURCE_VERSION")
  USING INDEX "SQL110403121943460"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EXPLAIN_OBJECT
--------------------------------------------------------

  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("EXPLAIN_REQUESTER" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("EXPLAIN_TIME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("SOURCE_NAME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("SOURCE_SCHEMA" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("SOURCE_VERSION" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("EXPLAIN_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("STMTNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("SECTNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("OBJECT_SCHEMA" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("OBJECT_NAME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("OBJECT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("COLUMN_COUNT" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("ROW_COUNT" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("WIDTH" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("PAGES" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("DISTINCT_" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("OVERHEAD" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("TRANSFER_RATE" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("PREFETCHSIZE" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("EXTENTSIZE" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("CLUSTER_" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("NLEAF" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("NLEVELS" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("FULLKEYCARD" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("OVERFLOW" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("FIRSTKEYCARD" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("FIRST2KEYCARD" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("FIRST3KEYCARD" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("FIRST4KEYCARD" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("SEQUENTIAL_PAGES" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("DENSITY" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("STATS_SRC" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("AVERAGE_SEQUENCE_GAP" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("AVERAGE_SEQUENCE_FETCH_GAP" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("AVERAGE_SEQUENCE_PAGES" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("AVERAGE_SEQUENCE_FETCH_PAGES" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("AVERAGE_RANDOM_PAGES" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("AVERAGE_RANDOM_FETCH_PAGES" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("NUMRIDS" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("NUMRIDS_DELETED" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("NUM_EMPTY_LEAFS" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("ACTIVE_BLOCKS" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OBJECT" MODIFY ("NUM_DATA_PARTS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EXPLAIN_OPERATOR
--------------------------------------------------------

  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("EXPLAIN_REQUESTER" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("EXPLAIN_TIME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("SOURCE_NAME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("SOURCE_SCHEMA" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("SOURCE_VERSION" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("EXPLAIN_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("STMTNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("SECTNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("OPERATOR_ID" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("OPERATOR_TYPE" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("TOTAL_COST" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("IO_COST" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("CPU_COST" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("FIRST_ROW_COST" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("RE_TOTAL_COST" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("RE_IO_COST" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("RE_CPU_COST" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("COMM_COST" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("FIRST_COMM_COST" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("BUFFERS" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("REMOTE_TOTAL_COST" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_OPERATOR" MODIFY ("REMOTE_COMM_COST" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EXPLAIN_PREDICATE
--------------------------------------------------------

  ALTER TABLE "EXPLAIN_PREDICATE" MODIFY ("EXPLAIN_REQUESTER" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_PREDICATE" MODIFY ("EXPLAIN_TIME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_PREDICATE" MODIFY ("SOURCE_NAME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_PREDICATE" MODIFY ("SOURCE_SCHEMA" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_PREDICATE" MODIFY ("SOURCE_VERSION" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_PREDICATE" MODIFY ("EXPLAIN_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_PREDICATE" MODIFY ("STMTNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_PREDICATE" MODIFY ("SECTNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_PREDICATE" MODIFY ("OPERATOR_ID" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_PREDICATE" MODIFY ("PREDICATE_ID" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_PREDICATE" MODIFY ("HOW_APPLIED" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_PREDICATE" MODIFY ("WHEN_EVALUATED" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_PREDICATE" MODIFY ("RELOP_TYPE" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_PREDICATE" MODIFY ("SUBQUERY" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_PREDICATE" MODIFY ("FILTER_FACTOR" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EXPLAIN_STATEMENT
--------------------------------------------------------

  ALTER TABLE "EXPLAIN_STATEMENT" MODIFY ("EXPLAIN_REQUESTER" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STATEMENT" MODIFY ("EXPLAIN_TIME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STATEMENT" MODIFY ("SOURCE_NAME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STATEMENT" MODIFY ("SOURCE_SCHEMA" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STATEMENT" MODIFY ("SOURCE_VERSION" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STATEMENT" MODIFY ("EXPLAIN_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STATEMENT" MODIFY ("STMTNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STATEMENT" MODIFY ("SECTNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STATEMENT" MODIFY ("QUERYNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STATEMENT" MODIFY ("QUERYTAG" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STATEMENT" MODIFY ("STATEMENT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STATEMENT" MODIFY ("UPDATABLE" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STATEMENT" MODIFY ("DELETABLE" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STATEMENT" MODIFY ("TOTAL_COST" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STATEMENT" MODIFY ("STATEMENT_TEXT" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STATEMENT" MODIFY ("QUERY_DEGREE" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STATEMENT" ADD CONSTRAINT "SQL110403121943690" PRIMARY KEY ("EXPLAIN_REQUESTER", "EXPLAIN_TIME", "SOURCE_NAME", "SOURCE_SCHEMA", "SOURCE_VERSION", "EXPLAIN_LEVEL", "STMTNO", "SECTNO")
  USING INDEX "SQL110403121943690"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EXPLAIN_STREAM
--------------------------------------------------------

  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("EXPLAIN_REQUESTER" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("EXPLAIN_TIME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("SOURCE_NAME" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("SOURCE_SCHEMA" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("SOURCE_VERSION" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("EXPLAIN_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("STMTNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("SECTNO" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("STREAM_ID" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("SOURCE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("SOURCE_ID" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("TARGET_TYPE" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("TARGET_ID" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("STREAM_COUNT" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("COLUMN_COUNT" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("PREDICATE_ID" NOT NULL ENABLE);
  ALTER TABLE "EXPLAIN_STREAM" MODIFY ("PMID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FUNCTION_ACESS_2
--------------------------------------------------------

  ALTER TABLE "FUNCTION_ACESS_2" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "FUNCTION_ACESS_2" MODIFY ("ACTION" NOT NULL ENABLE);
  ALTER TABLE "FUNCTION_ACESS_2" MODIFY ("EVENT" NOT NULL ENABLE);
  ALTER TABLE "FUNCTION_ACESS_2" MODIFY ("ROLE_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HOST_BRANCH
--------------------------------------------------------

  ALTER TABLE "HOST_BRANCH" MODIFY ("CMS_HOST_BRANCH_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF100
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF100" MODIFY ("ADD_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF101
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF101" MODIFY ("COUNTRY_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF102
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF102" MODIFY ("STATE_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF103
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF103" MODIFY ("VIP_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF104
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF104" MODIFY ("JOB_DESIG_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF105
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF105" MODIFY ("ID_NUM_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF106
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF106" MODIFY ("INSIDER_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF107
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF107" MODIFY ("ELEC_ADDR_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF108
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF108" MODIFY ("MARITAL_STAT_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF109
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF109" MODIFY ("BUSINESS_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF110
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF110" MODIFY ("BRANCH_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF111
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF111" MODIFY ("CLASS_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF112
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF112" MODIFY ("LPCCOD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF113
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF113" MODIFY ("FACILITY_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF114
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF114" MODIFY ("LOAN_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF115
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF115" MODIFY ("PURPOSE_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF116
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF116" MODIFY ("DESIG_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF118
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF118" MODIFY ("OFFICER_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF119
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF119" MODIFY ("LMT_STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF120
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF120" MODIFY ("RATE_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF121
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF121" MODIFY ("DEALER_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF122
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF122" MODIFY ("SRC_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF123
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF123" MODIFY ("LAWY_ID_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF124
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF124" MODIFY ("DEPT_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF125
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF125" MODIFY ("BANK_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF126
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF126" MODIFY ("REL_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF127
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF127" MODIFY ("CUST_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF128
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF128" MODIFY ("CUST_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF129
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF129" MODIFY ("STATE_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF130
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF130" MODIFY ("DFT_BUMI_NRCC_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF131
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF131" MODIFY ("LOAN_SEC_MIX" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF132
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF132" MODIFY ("COLL_TYPE_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF133
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF133" MODIFY ("COLL_ISSUER_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF134
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF134" MODIFY ("REL_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF135
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF135" MODIFY ("OFFICER_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF136
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF136" MODIFY ("TYPE_INS_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF137
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF137" MODIFY ("INS_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF138
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF138" MODIFY ("HOLD_MAIL_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF139
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF139" MODIFY ("OFFICER_REL_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF140
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF140" MODIFY ("DEP_TYPE_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF141
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF141" MODIFY ("CAR_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF142
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF142" MODIFY ("MSG_TYPE_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF143
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF143" MODIFY ("MSG_SEVERITY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF144
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF144" MODIFY ("ETH_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF145
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF145" MODIFY ("TRANS_ROUT_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF146
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF146" MODIFY ("GOLD_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF147
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF147" MODIFY ("ITEM_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF148
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF148" MODIFY ("TYPE_UNIT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF149
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF149" MODIFY ("PROP_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF150
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF150" MODIFY ("LPECOD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF151
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF151" MODIFY ("MAKE" NOT NULL ENABLE);
  ALTER TABLE "HP_TEMP_PF151" MODIFY ("MODEL_NUM" NOT NULL ENABLE);
  ALTER TABLE "HP_TEMP_PF151" MODIFY ("YEAR_MANUF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF152
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF152" MODIFY ("SHARE_COUNT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF153
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF153" MODIFY ("DEALER_GRP" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF154
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF154" MODIFY ("COUNTRY_CODE" NOT NULL ENABLE);
  ALTER TABLE "HP_TEMP_PF154" MODIFY ("HOL_DATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF156
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF156" MODIFY ("VALUER_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF157
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF157" MODIFY ("LOAN_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF159
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF159" MODIFY ("RATE_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF160
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF160" MODIFY ("PEN_INT_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF161
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF161" MODIFY ("TERR_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF200
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF200" MODIFY ("CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF201
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF201" MODIFY ("CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF202
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF202" MODIFY ("CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF203
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF203" MODIFY ("CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF204
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF204" MODIFY ("CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HP_TEMP_PF205
--------------------------------------------------------

  ALTER TABLE "HP_TEMP_PF205" MODIFY ("CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ICM_ACE_LIST
--------------------------------------------------------

  ALTER TABLE "ICM_ACE_LIST" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "ICM_ACE_LIST" MODIFY ("PRINCIPAL" NOT NULL ENABLE);
  ALTER TABLE "ICM_ACE_LIST" MODIFY ("USER_FLAG" NOT NULL ENABLE);
  ALTER TABLE "ICM_ACE_LIST" MODIFY ("EXISTENCE_PERM" NOT NULL ENABLE);
  ALTER TABLE "ICM_ACE_LIST" MODIFY ("READ_PERM" NOT NULL ENABLE);
  ALTER TABLE "ICM_ACE_LIST" MODIFY ("UPDATE_PERM" NOT NULL ENABLE);
  ALTER TABLE "ICM_ACE_LIST" MODIFY ("EXECUTE_PERM" NOT NULL ENABLE);
  ALTER TABLE "ICM_ACE_LIST" ADD CONSTRAINT "SQL110323174059760" PRIMARY KEY ("ACL_ID", "PRINCIPAL", "USER_FLAG")
  USING INDEX "SQL110323174059760"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ICM_ACL_DEFN
--------------------------------------------------------

  ALTER TABLE "ICM_ACL_DEFN" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "ICM_ACL_DEFN" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "ICM_ACL_DEFN" MODIFY ("OWNER" NOT NULL ENABLE);
  ALTER TABLE "ICM_ACL_DEFN" MODIFY ("LAST_UPDATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "ICM_ACL_DEFN" MODIFY ("LAST_UPDATED_BY" NOT NULL ENABLE);
  ALTER TABLE "ICM_ACL_DEFN" ADD CONSTRAINT "SQL110323174100300" PRIMARY KEY ("ACL_ID")
  USING INDEX "SQL110323174100300"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ID_TABLE
--------------------------------------------------------

  ALTER TABLE "ID_TABLE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ID_TABLE" ADD CONSTRAINT "SQL110323174058770" PRIMARY KEY ("ID")
  USING INDEX "SQL110323174058770"  ENABLE;
--------------------------------------------------------
--  Constraints for Table IFSCCODE_INTERFACE_LOG
--------------------------------------------------------

  ALTER TABLE "IFSCCODE_INTERFACE_LOG" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table IFSCCODE_INTERFACE_LOG_BKP
--------------------------------------------------------

  ALTER TABLE "IFSCCODE_INTERFACE_LOG_BKP" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table INDEX_PROPERTY
--------------------------------------------------------

  ALTER TABLE "INDEX_PROPERTY" MODIFY ("OBJECT_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "INDEX_PROPERTY" MODIFY ("INDEX_NAME" NOT NULL ENABLE);
  ALTER TABLE "INDEX_PROPERTY" MODIFY ("SEQ_NO" NOT NULL ENABLE);
  ALTER TABLE "INDEX_PROPERTY" MODIFY ("PROP_ID" NOT NULL ENABLE);
  ALTER TABLE "INDEX_PROPERTY" ADD CONSTRAINT "SQL110323174059300" PRIMARY KEY ("OBJECT_TYPE_ID", "INDEX_NAME", "SEQ_NO")
  USING INDEX "SQL110323174059300"  ENABLE;
--------------------------------------------------------
--  Constraints for Table INTERAFACE_TRANSACTION
--------------------------------------------------------

  ALTER TABLE "INTERAFACE_TRANSACTION" MODIFY ("FACILITYCATEGORYID" NOT NULL ENABLE);
  ALTER TABLE "INTERAFACE_TRANSACTION" MODIFY ("FACILITYID" NOT NULL ENABLE);
  ALTER TABLE "INTERAFACE_TRANSACTION" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "INTERAFACE_TRANSACTION" MODIFY ("FACILITY_TRANSACTION" NOT NULL ENABLE);
  ALTER TABLE "INTERAFACE_TRANSACTION" MODIFY ("CPSID_FACILITY_MASTER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LINE_DELTA_DATA_FOR_SCM
--------------------------------------------------------

  ALTER TABLE "LINE_DELTA_DATA_FOR_SCM" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LMT_PROFILE_BIZ_DAYS
--------------------------------------------------------

  ALTER TABLE "LMT_PROFILE_BIZ_DAYS" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "LMT_PROFILE_BIZ_DAYS" ADD CONSTRAINT "CMS_LPB_PK_LP" PRIMARY KEY ("CMS_LSP_LMT_PROFILE_ID")
  USING INDEX "CMS_LPB_PK_LP"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGDET
--------------------------------------------------------

  ALTER TABLE "LOGDET" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "LOGDET" MODIFY ("LOGMSTID" NOT NULL ENABLE);
  ALTER TABLE "LOGDET" MODIFY ("ERRORDESC" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMST
--------------------------------------------------------

  ALTER TABLE "LOGMST" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "LOGMST" MODIFY ("DMID" NOT NULL ENABLE);
  ALTER TABLE "LOGMST" MODIFY ("SEQUENCENO" NOT NULL ENABLE);
  ALTER TABLE "LOGMST" MODIFY ("CSV_FILENAME" NOT NULL ENABLE);
  ALTER TABLE "LOGMST" MODIFY ("MIG_TABLENAME" NOT NULL ENABLE);
  ALTER TABLE "LOGMST" MODIFY ("STAGE_TABLENAME" NOT NULL ENABLE);
  ALTER TABLE "LOGMST" MODIFY ("TABLENAME" NOT NULL ENABLE);
  ALTER TABLE "LOGMST" MODIFY ("TOTALRECORDS" NOT NULL ENABLE);
  ALTER TABLE "LOGMST" MODIFY ("RECORDS_CONSIDERED" NOT NULL ENABLE);
  ALTER TABLE "LOGMST" MODIFY ("MIGRATEDRECORDS" NOT NULL ENABLE);
  ALTER TABLE "LOGMST" MODIFY ("RECORDS_DELETED" NOT NULL ENABLE);
  ALTER TABLE "LOGMST" MODIFY ("STARTTIME" NOT NULL ENABLE);
  ALTER TABLE "LOGMST" MODIFY ("ENDTIME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MDCODECONDIT00
--------------------------------------------------------

  ALTER TABLE "MDCODECONDIT00" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "MDCODECONDIT00" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "MDCODECONDIT00" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MDCODECONDIT00" MODIFY ("ICM$OWNER" NOT NULL ENABLE);
  ALTER TABLE "MDCODECONDIT00" MODIFY ("ICM$CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "MDCODECONDIT00" MODIFY ("ICM$CREATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDCODECONDIT00" MODIFY ("ICM$LAST_UPD_BY" NOT NULL ENABLE);
  ALTER TABLE "MDCODECONDIT00" MODIFY ("ICM$LAST_UPD_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDCODECONDIT00" MODIFY ("ICM$APPLICATION" NOT NULL ENABLE);
  ALTER TABLE "MDCODECONDIT00" MODIFY ("ICM$APP_READERS" NOT NULL ENABLE);
  ALTER TABLE "MDCODECONDIT00" MODIFY ("ICM$APP_UPDATERS" NOT NULL ENABLE);
  ALTER TABLE "MDCODECONDIT00" MODIFY ("CODECONDITIONID00" NOT NULL ENABLE);
  ALTER TABLE "MDCODECONDIT00" ADD CONSTRAINT "SQL110323174104630" PRIMARY KEY ("OBJECT_ID")
  USING INDEX "SQL110323174104630"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MDCONTACTGRO00
--------------------------------------------------------

  ALTER TABLE "MDCONTACTGRO00" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTGRO00" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTGRO00" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTGRO00" MODIFY ("ICM$OWNER" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTGRO00" MODIFY ("ICM$CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTGRO00" MODIFY ("ICM$CREATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTGRO00" MODIFY ("ICM$LAST_UPD_BY" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTGRO00" MODIFY ("ICM$LAST_UPD_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTGRO00" MODIFY ("ICM$APPLICATION" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTGRO00" MODIFY ("ICM$APP_READERS" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTGRO00" MODIFY ("ICM$APP_UPDATERS" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTGRO00" ADD CONSTRAINT "SQL110323174105260" PRIMARY KEY ("OBJECT_ID")
  USING INDEX "SQL110323174105260"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MDCONTACTNAM00
--------------------------------------------------------

  ALTER TABLE "MDCONTACTNAM00" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTNAM00" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTNAM00" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTNAM00" MODIFY ("ICM$OWNER" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTNAM00" MODIFY ("ICM$CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTNAM00" MODIFY ("ICM$CREATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTNAM00" MODIFY ("ICM$LAST_UPD_BY" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTNAM00" MODIFY ("ICM$LAST_UPD_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTNAM00" MODIFY ("ICM$APPLICATION" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTNAM00" MODIFY ("ICM$APP_READERS" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTNAM00" MODIFY ("ICM$APP_UPDATERS" NOT NULL ENABLE);
  ALTER TABLE "MDCONTACTNAM00" ADD CONSTRAINT "SQL110323174104930" PRIMARY KEY ("OBJECT_ID")
  USING INDEX "SQL110323174104930"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MDFOLLOWONAC00
--------------------------------------------------------

  ALTER TABLE "MDFOLLOWONAC00" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "MDFOLLOWONAC00" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "MDFOLLOWONAC00" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MDFOLLOWONAC00" MODIFY ("ICM$OWNER" NOT NULL ENABLE);
  ALTER TABLE "MDFOLLOWONAC00" MODIFY ("ICM$CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "MDFOLLOWONAC00" MODIFY ("ICM$CREATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDFOLLOWONAC00" MODIFY ("ICM$LAST_UPD_BY" NOT NULL ENABLE);
  ALTER TABLE "MDFOLLOWONAC00" MODIFY ("ICM$LAST_UPD_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDFOLLOWONAC00" MODIFY ("ICM$APPLICATION" NOT NULL ENABLE);
  ALTER TABLE "MDFOLLOWONAC00" MODIFY ("ICM$APP_READERS" NOT NULL ENABLE);
  ALTER TABLE "MDFOLLOWONAC00" MODIFY ("ICM$APP_UPDATERS" NOT NULL ENABLE);
  ALTER TABLE "MDFOLLOWONAC00" MODIFY ("FOLLOWONACTIONID00" NOT NULL ENABLE);
  ALTER TABLE "MDFOLLOWONAC00" ADD CONSTRAINT "SQL110323174103290" PRIMARY KEY ("OBJECT_ID")
  USING INDEX "SQL110323174103290"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MDNAMEDSCHED00
--------------------------------------------------------

  ALTER TABLE "MDNAMEDSCHED00" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "MDNAMEDSCHED00" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "MDNAMEDSCHED00" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MDNAMEDSCHED00" MODIFY ("ICM$OWNER" NOT NULL ENABLE);
  ALTER TABLE "MDNAMEDSCHED00" MODIFY ("ICM$CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "MDNAMEDSCHED00" MODIFY ("ICM$CREATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDNAMEDSCHED00" MODIFY ("ICM$LAST_UPD_BY" NOT NULL ENABLE);
  ALTER TABLE "MDNAMEDSCHED00" MODIFY ("ICM$LAST_UPD_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDNAMEDSCHED00" MODIFY ("ICM$APPLICATION" NOT NULL ENABLE);
  ALTER TABLE "MDNAMEDSCHED00" MODIFY ("ICM$APP_READERS" NOT NULL ENABLE);
  ALTER TABLE "MDNAMEDSCHED00" MODIFY ("ICM$APP_UPDATERS" NOT NULL ENABLE);
  ALTER TABLE "MDNAMEDSCHED00" MODIFY ("SCHEDULEID00" NOT NULL ENABLE);
  ALTER TABLE "MDNAMEDSCHED00" ADD CONSTRAINT "SQL110323174102940" PRIMARY KEY ("OBJECT_ID")
  USING INDEX "SQL110323174102940"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MDNOTIFICATI00
--------------------------------------------------------

  ALTER TABLE "MDNOTIFICATI00" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "MDNOTIFICATI00" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "MDNOTIFICATI00" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MDNOTIFICATI00" MODIFY ("ICM$OWNER" NOT NULL ENABLE);
  ALTER TABLE "MDNOTIFICATI00" MODIFY ("ICM$CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "MDNOTIFICATI00" MODIFY ("ICM$CREATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDNOTIFICATI00" MODIFY ("ICM$LAST_UPD_BY" NOT NULL ENABLE);
  ALTER TABLE "MDNOTIFICATI00" MODIFY ("ICM$LAST_UPD_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDNOTIFICATI00" MODIFY ("ICM$APPLICATION" NOT NULL ENABLE);
  ALTER TABLE "MDNOTIFICATI00" MODIFY ("ICM$APP_READERS" NOT NULL ENABLE);
  ALTER TABLE "MDNOTIFICATI00" MODIFY ("ICM$APP_UPDATERS" NOT NULL ENABLE);
  ALTER TABLE "MDNOTIFICATI00" MODIFY ("NOTIFICATIONACTIONID00" NOT NULL ENABLE);
  ALTER TABLE "MDNOTIFICATI00" ADD CONSTRAINT "SQL110323174103630" PRIMARY KEY ("OBJECT_ID")
  USING INDEX "SQL110323174103630"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MDSCHEDEVENT00
--------------------------------------------------------

  ALTER TABLE "MDSCHEDEVENT00" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "MDSCHEDEVENT00" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "MDSCHEDEVENT00" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MDSCHEDEVENT00" MODIFY ("ICM$OWNER" NOT NULL ENABLE);
  ALTER TABLE "MDSCHEDEVENT00" MODIFY ("ICM$CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "MDSCHEDEVENT00" MODIFY ("ICM$CREATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDSCHEDEVENT00" MODIFY ("ICM$LAST_UPD_BY" NOT NULL ENABLE);
  ALTER TABLE "MDSCHEDEVENT00" MODIFY ("ICM$LAST_UPD_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDSCHEDEVENT00" MODIFY ("ICM$APPLICATION" NOT NULL ENABLE);
  ALTER TABLE "MDSCHEDEVENT00" MODIFY ("ICM$APP_READERS" NOT NULL ENABLE);
  ALTER TABLE "MDSCHEDEVENT00" MODIFY ("ICM$APP_UPDATERS" NOT NULL ENABLE);
  ALTER TABLE "MDSCHEDEVENT00" MODIFY ("SCHEDULEEVENTID00" NOT NULL ENABLE);
  ALTER TABLE "MDSCHEDEVENT00" ADD CONSTRAINT "SQL110323174102610" PRIMARY KEY ("OBJECT_ID")
  USING INDEX "SQL110323174102610"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MDSUCCESSCOD00
--------------------------------------------------------

  ALTER TABLE "MDSUCCESSCOD00" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "MDSUCCESSCOD00" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "MDSUCCESSCOD00" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MDSUCCESSCOD00" MODIFY ("ICM$OWNER" NOT NULL ENABLE);
  ALTER TABLE "MDSUCCESSCOD00" MODIFY ("ICM$CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "MDSUCCESSCOD00" MODIFY ("ICM$CREATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDSUCCESSCOD00" MODIFY ("ICM$LAST_UPD_BY" NOT NULL ENABLE);
  ALTER TABLE "MDSUCCESSCOD00" MODIFY ("ICM$LAST_UPD_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDSUCCESSCOD00" MODIFY ("ICM$APPLICATION" NOT NULL ENABLE);
  ALTER TABLE "MDSUCCESSCOD00" MODIFY ("ICM$APP_READERS" NOT NULL ENABLE);
  ALTER TABLE "MDSUCCESSCOD00" MODIFY ("ICM$APP_UPDATERS" NOT NULL ENABLE);
  ALTER TABLE "MDSUCCESSCOD00" ADD CONSTRAINT "SQL110323174104350" PRIMARY KEY ("OBJECT_ID")
  USING INDEX "SQL110323174104350"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MDTASKCATEGO00
--------------------------------------------------------

  ALTER TABLE "MDTASKCATEGO00" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "MDTASKCATEGO00" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "MDTASKCATEGO00" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MDTASKCATEGO00" MODIFY ("ICM$OWNER" NOT NULL ENABLE);
  ALTER TABLE "MDTASKCATEGO00" MODIFY ("ICM$CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "MDTASKCATEGO00" MODIFY ("ICM$CREATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDTASKCATEGO00" MODIFY ("ICM$LAST_UPD_BY" NOT NULL ENABLE);
  ALTER TABLE "MDTASKCATEGO00" MODIFY ("ICM$LAST_UPD_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDTASKCATEGO00" MODIFY ("ICM$APPLICATION" NOT NULL ENABLE);
  ALTER TABLE "MDTASKCATEGO00" MODIFY ("ICM$APP_READERS" NOT NULL ENABLE);
  ALTER TABLE "MDTASKCATEGO00" MODIFY ("ICM$APP_UPDATERS" NOT NULL ENABLE);
  ALTER TABLE "MDTASKCATEGO00" MODIFY ("TASKCATEGORYID00" NOT NULL ENABLE);
  ALTER TABLE "MDTASKCATEGO00" ADD CONSTRAINT "SQL110323174104010" PRIMARY KEY ("OBJECT_ID")
  USING INDEX "SQL110323174104010"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MDTASKEXECTY00
--------------------------------------------------------

  ALTER TABLE "MDTASKEXECTY00" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "MDTASKEXECTY00" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "MDTASKEXECTY00" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MDTASKEXECTY00" MODIFY ("ICM$OWNER" NOT NULL ENABLE);
  ALTER TABLE "MDTASKEXECTY00" MODIFY ("ICM$CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "MDTASKEXECTY00" MODIFY ("ICM$CREATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDTASKEXECTY00" MODIFY ("ICM$LAST_UPD_BY" NOT NULL ENABLE);
  ALTER TABLE "MDTASKEXECTY00" MODIFY ("ICM$LAST_UPD_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDTASKEXECTY00" MODIFY ("ICM$APPLICATION" NOT NULL ENABLE);
  ALTER TABLE "MDTASKEXECTY00" MODIFY ("ICM$APP_READERS" NOT NULL ENABLE);
  ALTER TABLE "MDTASKEXECTY00" MODIFY ("ICM$APP_UPDATERS" NOT NULL ENABLE);
  ALTER TABLE "MDTASKEXECTY00" MODIFY ("TASKEXECID00" NOT NULL ENABLE);
  ALTER TABLE "MDTASKEXECTY00" ADD CONSTRAINT "SQL110323174105690" PRIMARY KEY ("OBJECT_ID")
  USING INDEX "SQL110323174105690"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MDTASKSNAPSH00
--------------------------------------------------------

  ALTER TABLE "MDTASKSNAPSH00" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSNAPSH00" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSNAPSH00" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSNAPSH00" MODIFY ("ICM$OWNER" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSNAPSH00" MODIFY ("ICM$CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSNAPSH00" MODIFY ("ICM$CREATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSNAPSH00" MODIFY ("ICM$LAST_UPD_BY" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSNAPSH00" MODIFY ("ICM$LAST_UPD_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSNAPSH00" MODIFY ("ICM$APPLICATION" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSNAPSH00" MODIFY ("ICM$APP_READERS" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSNAPSH00" MODIFY ("ICM$APP_UPDATERS" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSNAPSH00" MODIFY ("TASKID00" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSNAPSH00" MODIFY ("SUFFIX00" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSNAPSH00" ADD CONSTRAINT "SQL110323174106790" PRIMARY KEY ("OBJECT_ID")
  USING INDEX "SQL110323174106790"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MDTASKSTATIS00
--------------------------------------------------------

  ALTER TABLE "MDTASKSTATIS00" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSTATIS00" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSTATIS00" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSTATIS00" MODIFY ("ICM$OWNER" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSTATIS00" MODIFY ("ICM$CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSTATIS00" MODIFY ("ICM$CREATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSTATIS00" MODIFY ("ICM$LAST_UPD_BY" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSTATIS00" MODIFY ("ICM$LAST_UPD_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSTATIS00" MODIFY ("ICM$APPLICATION" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSTATIS00" MODIFY ("ICM$APP_READERS" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSTATIS00" MODIFY ("ICM$APP_UPDATERS" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSTATIS00" MODIFY ("TASKID00" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSTATIS00" MODIFY ("SUFFIX00" NOT NULL ENABLE);
  ALTER TABLE "MDTASKSTATIS00" ADD CONSTRAINT "SQL110323174107240" PRIMARY KEY ("OBJECT_ID")
  USING INDEX "SQL110323174107240"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MDTASKTYPE00
--------------------------------------------------------

  ALTER TABLE "MDTASKTYPE00" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "MDTASKTYPE00" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "MDTASKTYPE00" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MDTASKTYPE00" MODIFY ("ICM$OWNER" NOT NULL ENABLE);
  ALTER TABLE "MDTASKTYPE00" MODIFY ("ICM$CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "MDTASKTYPE00" MODIFY ("ICM$CREATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDTASKTYPE00" MODIFY ("ICM$LAST_UPD_BY" NOT NULL ENABLE);
  ALTER TABLE "MDTASKTYPE00" MODIFY ("ICM$LAST_UPD_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDTASKTYPE00" MODIFY ("ICM$APPLICATION" NOT NULL ENABLE);
  ALTER TABLE "MDTASKTYPE00" MODIFY ("ICM$APP_READERS" NOT NULL ENABLE);
  ALTER TABLE "MDTASKTYPE00" MODIFY ("ICM$APP_UPDATERS" NOT NULL ENABLE);
  ALTER TABLE "MDTASKTYPE00" MODIFY ("TASKID00" NOT NULL ENABLE);
  ALTER TABLE "MDTASKTYPE00" MODIFY ("SUFFIX00" NOT NULL ENABLE);
  ALTER TABLE "MDTASKTYPE00" ADD CONSTRAINT "SQL110323174102100" PRIMARY KEY ("OBJECT_ID")
  USING INDEX "SQL110323174102100"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MDTHISTORYTY00
--------------------------------------------------------

  ALTER TABLE "MDTHISTORYTY00" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "MDTHISTORYTY00" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "MDTHISTORYTY00" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MDTHISTORYTY00" MODIFY ("ICM$OWNER" NOT NULL ENABLE);
  ALTER TABLE "MDTHISTORYTY00" MODIFY ("ICM$CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "MDTHISTORYTY00" MODIFY ("ICM$CREATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDTHISTORYTY00" MODIFY ("ICM$LAST_UPD_BY" NOT NULL ENABLE);
  ALTER TABLE "MDTHISTORYTY00" MODIFY ("ICM$LAST_UPD_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDTHISTORYTY00" MODIFY ("ICM$APPLICATION" NOT NULL ENABLE);
  ALTER TABLE "MDTHISTORYTY00" MODIFY ("ICM$APP_READERS" NOT NULL ENABLE);
  ALTER TABLE "MDTHISTORYTY00" MODIFY ("ICM$APP_UPDATERS" NOT NULL ENABLE);
  ALTER TABLE "MDTHISTORYTY00" MODIFY ("TASKID00" NOT NULL ENABLE);
  ALTER TABLE "MDTHISTORYTY00" MODIFY ("SUFFIX00" NOT NULL ENABLE);
  ALTER TABLE "MDTHISTORYTY00" MODIFY ("TASKHISTORYID00" NOT NULL ENABLE);
  ALTER TABLE "MDTHISTORYTY00" MODIFY ("ROOTTASKHISTORYID00" NOT NULL ENABLE);
  ALTER TABLE "MDTHISTORYTY00" ADD CONSTRAINT "SQL110323174106050" PRIMARY KEY ("OBJECT_ID")
  USING INDEX "SQL110323174106050"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MDTRESULTTYP00
--------------------------------------------------------

  ALTER TABLE "MDTRESULTTYP00" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "MDTRESULTTYP00" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "MDTRESULTTYP00" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MDTRESULTTYP00" MODIFY ("ICM$OWNER" NOT NULL ENABLE);
  ALTER TABLE "MDTRESULTTYP00" MODIFY ("ICM$CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "MDTRESULTTYP00" MODIFY ("ICM$CREATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDTRESULTTYP00" MODIFY ("ICM$LAST_UPD_BY" NOT NULL ENABLE);
  ALTER TABLE "MDTRESULTTYP00" MODIFY ("ICM$LAST_UPD_TIME" NOT NULL ENABLE);
  ALTER TABLE "MDTRESULTTYP00" MODIFY ("ICM$APPLICATION" NOT NULL ENABLE);
  ALTER TABLE "MDTRESULTTYP00" MODIFY ("ICM$APP_READERS" NOT NULL ENABLE);
  ALTER TABLE "MDTRESULTTYP00" MODIFY ("ICM$APP_UPDATERS" NOT NULL ENABLE);
  ALTER TABLE "MDTRESULTTYP00" ADD CONSTRAINT "SQL110323174106460" PRIMARY KEY ("OBJECT_ID")
  USING INDEX "SQL110323174106460"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MIG_CAM_UPDATE
--------------------------------------------------------

  ALTER TABLE "MIG_CAM_UPDATE" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CCC_BANKMETHOD
--------------------------------------------------------

  ALTER TABLE "MIG_CCC_BANKMETHOD" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CCC_COMMODITY
--------------------------------------------------------

  ALTER TABLE "MIG_CCC_COMMODITY" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CCC_INDUSTRY
--------------------------------------------------------

  ALTER TABLE "MIG_CCC_INDUSTRY" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CCC_INFRASTRUCTURE
--------------------------------------------------------

  ALTER TABLE "MIG_CCC_INFRASTRUCTURE" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CCC_MSMSCLASIFICATION
--------------------------------------------------------

  ALTER TABLE "MIG_CCC_MSMSCLASIFICATION" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CCC_PARTY_ENTITY
--------------------------------------------------------

  ALTER TABLE "MIG_CCC_PARTY_ENTITY" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CCC_RAMRATING
--------------------------------------------------------

  ALTER TABLE "MIG_CCC_RAMRATING" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CCC_RATINGTYPE
--------------------------------------------------------

  ALTER TABLE "MIG_CCC_RATINGTYPE" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CCC_RBIASSETCLASS
--------------------------------------------------------

  ALTER TABLE "MIG_CCC_RBIASSETCLASS" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CCC_RBICATEGORY
--------------------------------------------------------

  ALTER TABLE "MIG_CCC_RBICATEGORY" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CCC_RELATEDTYPE
--------------------------------------------------------

  ALTER TABLE "MIG_CCC_RELATEDTYPE" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CCC_SEGMENT
--------------------------------------------------------

  ALTER TABLE "MIG_CCC_SEGMENT" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CCC_SYSTEM
--------------------------------------------------------

  ALTER TABLE "MIG_CCC_SYSTEM" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CMS_COLLATERAL
--------------------------------------------------------

  ALTER TABLE "MIG_CMS_COLLATERAL" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CMS_COUNTRY
--------------------------------------------------------

  ALTER TABLE "MIG_CMS_COUNTRY" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CMS_FACILITY_MASTER
--------------------------------------------------------

  ALTER TABLE "MIG_CMS_FACILITY_MASTER" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CMS_FOREX
--------------------------------------------------------

  ALTER TABLE "MIG_CMS_FOREX" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CMS_LOCATION
--------------------------------------------------------

  ALTER TABLE "MIG_CMS_LOCATION" MODIFY ("RISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "MIG_CMS_LOCATION" MODIFY ("SISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "MIG_CMS_LOCATION" MODIFY ("CISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CMS_PARTY_GROUP
--------------------------------------------------------

  ALTER TABLE "MIG_CMS_PARTY_GROUP" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CMS_REGIONMASTER
--------------------------------------------------------

  ALTER TABLE "MIG_CMS_REGIONMASTER" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CMS_RELATIONSHIP_MGR
--------------------------------------------------------

  ALTER TABLE "MIG_CMS_RELATIONSHIP_MGR" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CMS_SYSTEM_BANK_BRANCH
--------------------------------------------------------

  ALTER TABLE "MIG_CMS_SYSTEM_BANK_BRANCH" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_CREDIT_APPROVAL
--------------------------------------------------------

  ALTER TABLE "MIG_CREDIT_APPROVAL" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_FACILITY_UPDATE
--------------------------------------------------------

  ALTER TABLE "MIG_FACILITY_UPDATE" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_NEW_SECURITIES_UPDATE
--------------------------------------------------------

  ALTER TABLE "MIG_NEW_SECURITIES_UPDATE" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_NEW_SEC_PROP
--------------------------------------------------------

  ALTER TABLE "MIG_NEW_SEC_PROP" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_NEW_SEC_REMAIN
--------------------------------------------------------

  ALTER TABLE "MIG_NEW_SEC_REMAIN" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_SEC_FIXED_DEPOSIT
--------------------------------------------------------

  ALTER TABLE "MIG_SEC_FIXED_DEPOSIT" MODIFY ("SOURCESECURITYID" NOT NULL ENABLE);
  ALTER TABLE "MIG_SEC_FIXED_DEPOSIT" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_SEC_FIXED_DEPOSIT_LIEN
--------------------------------------------------------

  ALTER TABLE "MIG_SEC_FIXED_DEPOSIT_LIEN" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_SEC_INS
--------------------------------------------------------

  ALTER TABLE "MIG_SEC_INS" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIG_SEC_OTHER
--------------------------------------------------------

  ALTER TABLE "MIG_SEC_OTHER" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NLIST
--------------------------------------------------------

  ALTER TABLE "NLIST" MODIFY ("RNUM" NOT NULL ENABLE);
  ALTER TABLE "NLIST" ADD CONSTRAINT "PK_NLIST" PRIMARY KEY ("RNUM")
  USING INDEX "PK_NLIST"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NOTIFICATION
--------------------------------------------------------

  ALTER TABLE "NOTIFICATION" MODIFY ("NOTIFICATION_ID" NOT NULL ENABLE);
  ALTER TABLE "NOTIFICATION" MODIFY ("NOTIFICATION_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "NOTIFICATION" ADD CONSTRAINT "PK_NOTIFICATION" PRIMARY KEY ("NOTIFICATION_ID")
  USING INDEX "PK_NOTIFICATION"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NOTIFICATION_RECIPIENT
--------------------------------------------------------

  ALTER TABLE "NOTIFICATION_RECIPIENT" MODIFY ("RECIPIENT_ID" NOT NULL ENABLE);
  ALTER TABLE "NOTIFICATION_RECIPIENT" ADD CONSTRAINT "NOTIF_RECIPIENT_PK" PRIMARY KEY ("RECIPIENT_ID")
  USING INDEX "NOTIF_RECIPIENT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NOTIFICATION_RECURRENCE
--------------------------------------------------------

  ALTER TABLE "NOTIFICATION_RECURRENCE" MODIFY ("RECURRENCE_ID" NOT NULL ENABLE);
  ALTER TABLE "NOTIFICATION_RECURRENCE" ADD CONSTRAINT "PK_NOTIFI_RECUR" PRIMARY KEY ("RECURRENCE_ID")
  USING INDEX "PK_NOTIFI_RECUR"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NOTIFICATION_TYPE
--------------------------------------------------------

  ALTER TABLE "NOTIFICATION_TYPE" MODIFY ("NOTIFICATION_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "NOTIFICATION_TYPE" ADD CONSTRAINT "PK_NOTIFY_TYPE" PRIMARY KEY ("NOTIFICATION_TYPE_ID")
  USING INDEX "PK_NOTIFY_TYPE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NOTIFICATION_TYPE_RECIPIENT
--------------------------------------------------------

  ALTER TABLE "NOTIFICATION_TYPE_RECIPIENT" MODIFY ("RECIPIENT_ID" NOT NULL ENABLE);
  ALTER TABLE "NOTIFICATION_TYPE_RECIPIENT" ADD CONSTRAINT "PK_NOTI_TYPE_RCPT" PRIMARY KEY ("RECIPIENT_ID")
  USING INDEX "PK_NOTI_TYPE_RCPT"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NOTIFICATION_TYPE_RECURRENCE
--------------------------------------------------------

  ALTER TABLE "NOTIFICATION_TYPE_RECURRENCE" MODIFY ("RECURRENCE_ID" NOT NULL ENABLE);
  ALTER TABLE "NOTIFICATION_TYPE_RECURRENCE" ADD CONSTRAINT "PK_NOTI_TYPE_RECUR" PRIMARY KEY ("RECURRENCE_ID")
  USING INDEX "PK_NOTI_TYPE_RECUR"  ENABLE;
--------------------------------------------------------
--  Constraints for Table OBJECT_INDEX
--------------------------------------------------------

  ALTER TABLE "OBJECT_INDEX" MODIFY ("OBJECT_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "OBJECT_INDEX" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "OBJECT_INDEX" MODIFY ("INDEX_NAME" NOT NULL ENABLE);
  ALTER TABLE "OBJECT_INDEX" MODIFY ("UNIQUE_FLAG" NOT NULL ENABLE);
  ALTER TABLE "OBJECT_INDEX" MODIFY ("TRIGGERED" NOT NULL ENABLE);
  ALTER TABLE "OBJECT_INDEX" ADD CONSTRAINT "SQL110323174100710" PRIMARY KEY ("OBJECT_TYPE_ID", "NAME")
  USING INDEX "SQL110323174100710"  ENABLE;
--------------------------------------------------------
--  Constraints for Table OBJECT_TYPE
--------------------------------------------------------

  ALTER TABLE "OBJECT_TYPE" MODIFY ("OBJECT_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "OBJECT_TYPE" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "OBJECT_TYPE" MODIFY ("SCHEMA_NAME" NOT NULL ENABLE);
  ALTER TABLE "OBJECT_TYPE" MODIFY ("TABLE_NAME" NOT NULL ENABLE);
  ALTER TABLE "OBJECT_TYPE" MODIFY ("LAST_UPDATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "OBJECT_TYPE" MODIFY ("LAST_UPDATED_BY" NOT NULL ENABLE);
  ALTER TABLE "OBJECT_TYPE" MODIFY ("OWNER" NOT NULL ENABLE);
  ALTER TABLE "OBJECT_TYPE" ADD CONSTRAINT "SQL110323174058490" PRIMARY KEY ("OBJECT_TYPE_ID")
  USING INDEX "SQL110323174058490"  ENABLE;
--------------------------------------------------------
--  Constraints for Table OFA_ACCESS_PROFILE
--------------------------------------------------------

  ALTER TABLE "OFA_ACCESS_PROFILE" MODIFY ("ACCESS_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "OFA_ACCESS_PROFILE" ADD CONSTRAINT "PK_OFA_ACCESS_PROF" PRIMARY KEY ("ACCESS_PROFILE_ID")
  USING INDEX "PK_OFA_ACCESS_PROF"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PAN_VALIDATION_LOG
--------------------------------------------------------

  ALTER TABLE "PAN_VALIDATION_LOG" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RAM_RATINGUPLOAD_DETAILS
--------------------------------------------------------

  ALTER TABLE "RAM_RATINGUPLOAD_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "RAM_RATINGUPLOAD_DETAILS" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table RBIFYDATADEC15_1
--------------------------------------------------------

  ALTER TABLE "RBIFYDATADEC15_1" MODIFY ("CMS_LE_SUB_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_1" MODIFY ("CMS_LSP_LMT_PROFILE_ID1" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_1" MODIFY ("CMS_LSP_APPR_LMTS_ID2" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_1" MODIFY ("SECURITY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RBIFYDATADEC15_2
--------------------------------------------------------

  ALTER TABLE "RBIFYDATADEC15_2" MODIFY ("CMS_LE_SUB_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_2" MODIFY ("CMS_LSP_LMT_PROFILE_ID1" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_2" MODIFY ("CMS_LSP_APPR_LMTS_ID2" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_2" MODIFY ("CMS_LSP_SYS_XREF_ID3" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_2" MODIFY ("SECURITY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RBIFYDATADEC15_3
--------------------------------------------------------

  ALTER TABLE "RBIFYDATADEC15_3" MODIFY ("CMS_LE_SUB_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_3" MODIFY ("CMS_LSP_LMT_PROFILE_ID1" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_3" MODIFY ("CMS_LSP_APPR_LMTS_ID2" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_3" MODIFY ("CMS_LSP_SYS_XREF_ID3" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_3" MODIFY ("SECURITY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RBIFYDATADEC15_4
--------------------------------------------------------

  ALTER TABLE "RBIFYDATADEC15_4" MODIFY ("CMS_LE_SUB_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_4" MODIFY ("CMS_LSP_LMT_PROFILE_ID1" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_4" MODIFY ("CMS_LSP_APPR_LMTS_ID2" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_4" MODIFY ("CMS_LSP_SYS_XREF_ID3" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_4" MODIFY ("SECURITY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RBIFYDATADEC15_8
--------------------------------------------------------

  ALTER TABLE "RBIFYDATADEC15_8" MODIFY ("CMS_LE_SUB_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_8" MODIFY ("CMS_LSP_LMT_PROFILE_ID1" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_8" MODIFY ("CMS_LSP_APPR_LMTS_ID2" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_8" MODIFY ("CMS_LSP_SYS_XREF_ID3" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_8" MODIFY ("SECURITY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RBIFYDATADEC15_9
--------------------------------------------------------

  ALTER TABLE "RBIFYDATADEC15_9" MODIFY ("CMS_LE_SUB_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_9" MODIFY ("CMS_LSP_LMT_PROFILE_ID1" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_9" MODIFY ("CMS_LSP_APPR_LMTS_ID2" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_9" MODIFY ("CMS_LSP_SYS_XREF_ID3" NOT NULL ENABLE);
  ALTER TABLE "RBIFYDATADEC15_9" MODIFY ("SECURITY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RECP_COLLATERAL
--------------------------------------------------------

  ALTER TABLE "RECP_COLLATERAL" MODIFY ("DATA_SOURCE_ID" NOT NULL ENABLE);
  ALTER TABLE "RECP_COLLATERAL" MODIFY ("COLLATERAL_BKEY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RECURRENT_DOC_DP
--------------------------------------------------------

  ALTER TABLE "RECURRENT_DOC_DP" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REC_DUPLICATE_DOC_CLEANUP
--------------------------------------------------------

  ALTER TABLE "REC_DUPLICATE_DOC_CLEANUP" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REC_TRX_PENDING_21Y
--------------------------------------------------------

  ALTER TABLE "REC_TRX_PENDING_21Y" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REF_ID_TABLE
--------------------------------------------------------

  ALTER TABLE "REF_ID_TABLE" MODIFY ("OBJECT_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "REF_ID_TABLE" MODIFY ("REFERENCE_ID" NOT NULL ENABLE);
  ALTER TABLE "REF_ID_TABLE" ADD CONSTRAINT "SQL110323174100550" PRIMARY KEY ("OBJECT_TYPE_ID")
  USING INDEX "SQL110323174100550"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REL_CAT
--------------------------------------------------------

  ALTER TABLE "REL_CAT" MODIFY ("CATEGORY_ID" NOT NULL ENABLE);
  ALTER TABLE "REL_CAT" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "REL_CAT" MODIFY ("LAST_UPDATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "REL_CAT" MODIFY ("LAST_UPDATED_BY" NOT NULL ENABLE);
  ALTER TABLE "REL_CAT" MODIFY ("OWNER" NOT NULL ENABLE);
  ALTER TABLE "REL_CAT" ADD CONSTRAINT "SQL110323174057690" PRIMARY KEY ("CATEGORY_ID")
  USING INDEX "SQL110323174057690"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REL_CAT_MEMBER
--------------------------------------------------------

  ALTER TABLE "REL_CAT_MEMBER" MODIFY ("CATEGORY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REL_INSTANCE
--------------------------------------------------------

  ALTER TABLE "REL_INSTANCE" MODIFY ("REL_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "REL_INSTANCE" MODIFY ("REL_INST_ID" NOT NULL ENABLE);
  ALTER TABLE "REL_INSTANCE" MODIFY ("LAST_UPDATED_TIME" NOT NULL ENABLE);
  ALTER TABLE "REL_INSTANCE" MODIFY ("LAST_UPDATED_BY" NOT NULL ENABLE);
  ALTER TABLE "REL_INSTANCE" MODIFY ("OWNER" NOT NULL ENABLE);
  ALTER TABLE "REL_INSTANCE" ADD CONSTRAINT "SQL110323174059550" PRIMARY KEY ("REL_INST_ID", "REL_TYPE_ID")
  USING INDEX "SQL110323174059550"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REL_LINK
--------------------------------------------------------

  ALTER TABLE "REL_LINK" MODIFY ("REL_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "REL_LINK" MODIFY ("REL_INST_ID" NOT NULL ENABLE);
  ALTER TABLE "REL_LINK" MODIFY ("OBJECT_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "REL_LINK" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "REL_LINK" MODIFY ("LINK_TYPE" NOT NULL ENABLE);
  ALTER TABLE "REL_LINK" ADD CONSTRAINT "SQL110323174058210" PRIMARY KEY ("REL_INST_ID", "OBJECT_TYPE_ID", "OBJECT_ID")
  USING INDEX "SQL110323174058210"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SAMPLE_TEST
--------------------------------------------------------

  ALTER TABLE "SAMPLE_TEST" MODIFY ("PRDID" NOT NULL ENABLE);
  ALTER TABLE "SAMPLE_TEST" MODIFY ("PRDNAME" NOT NULL ENABLE);
  ALTER TABLE "SAMPLE_TEST" MODIFY ("REMARK" NOT NULL ENABLE);
  ALTER TABLE "SAMPLE_TEST" ADD CONSTRAINT "PK_SAMPLE_TEST_3" PRIMARY KEY ("PRDID")
  USING INDEX "PK_SAMPLE_TEST_3"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SAMPLE_TEST1
--------------------------------------------------------

  ALTER TABLE "SAMPLE_TEST1" MODIFY ("PRDID" NOT NULL ENABLE);
  ALTER TABLE "SAMPLE_TEST1" MODIFY ("PRDNAME" NOT NULL ENABLE);
  ALTER TABLE "SAMPLE_TEST1" MODIFY ("REMARK" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_BKG_LOCTN
--------------------------------------------------------

  ALTER TABLE "SCI_BKG_LOCTN" MODIFY ("CMS_BKG_LOCTN_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_BKG_LOCTN" MODIFY ("BKL_BKG_LOCTN_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_BKG_LOCTN" MODIFY ("BKL_BKG_LOCTN_DESC" NOT NULL ENABLE);
  ALTER TABLE "SCI_BKG_LOCTN" MODIFY ("BKL_CNTRY_ISO_CODE" NOT NULL ENABLE);
  ALTER TABLE "SCI_BKG_LOCTN" MODIFY ("BKL_BKG_LOCTN_ORGN_NUM" NOT NULL ENABLE);
  ALTER TABLE "SCI_BKG_LOCTN" MODIFY ("BKL_BKG_LOCTN_ORGN_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SCI_BKG_LOCTN" ADD CONSTRAINT "XUQBKG_LOCTN" UNIQUE ("BKL_BKG_LOCTN_ID")
  USING INDEX "XUQBKG_LOCTN"  ENABLE;
  ALTER TABLE "SCI_BKG_LOCTN" ADD CONSTRAINT "PK_BKG_LOCTN" PRIMARY KEY ("CMS_BKG_LOCTN_ID")
  USING INDEX "PK_BKG_LOCTN"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_BKG_LOCTN_EMP_CODE
--------------------------------------------------------

  ALTER TABLE "SCI_BKG_LOCTN_EMP_CODE" MODIFY ("CMS_BKG_LOCTN_EMP_CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_BKG_LOCTN_EMP_CODE" MODIFY ("BLE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_BKG_LOCTN_EMP_CODE" MODIFY ("BLE_BKG_LOCTN_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_BKG_LOCTN_EMP_CODE" MODIFY ("BLE_EMP_CODE" NOT NULL ENABLE);
  ALTER TABLE "SCI_BKG_LOCTN_EMP_CODE" ADD CONSTRAINT "PK_BKG_LOC_EMP_COD" PRIMARY KEY ("CMS_BKG_LOCTN_EMP_CODE_ID")
  USING INDEX "PK_BKG_LOC_EMP_COD"  ENABLE;
  ALTER TABLE "SCI_BKG_LOCTN_EMP_CODE" ADD CONSTRAINT "XUQBKG_LOC_EMP_COD" UNIQUE ("BLE_BKG_LOCTN_ID", "BLE_EMP_CODE")
  USING INDEX "XUQBKG_LOC_EMP_COD"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_BKG_LOCTN_EXT_SYS_MAP
--------------------------------------------------------

  ALTER TABLE "SCI_BKG_LOCTN_EXT_SYS_MAP" MODIFY ("CMS_BKG_LOCTN_EXT_SYS_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_BKG_LOCTN_EXT_SYS_MAP" MODIFY ("BKX_BKG_LOCTN_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_BKG_LOCTN_EXT_SYS_MAP" MODIFY ("BKX_BKG_EXT_SYS_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_BKG_LOCTN_EXT_SYS_MAP" MODIFY ("BKX_EXT_SYS_CODE_NUM" NOT NULL ENABLE);
  ALTER TABLE "SCI_BKG_LOCTN_EXT_SYS_MAP" MODIFY ("BKX_EXT_SYS_CODE_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SCI_BKG_LOCTN_EXT_SYS_MAP" ADD CONSTRAINT "BKG_LOC_EXT_SYSMAP" UNIQUE ("BKX_BKG_EXT_SYS_MAP_ID", "BKX_BKG_LOCTN_ID", "BKX_EXT_SYS_CODE_NUM", "BKX_EXT_SYS_CODE_VALUE")
  USING INDEX "BKG_LOC_EXT_SYSMAP"  ENABLE;
  ALTER TABLE "SCI_BKG_LOCTN_EXT_SYS_MAP" ADD CONSTRAINT "PK_BKG_EXT_SYSMAP" PRIMARY KEY ("CMS_BKG_LOCTN_EXT_SYS_MAP_ID")
  USING INDEX "PK_BKG_EXT_SYSMAP"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_COUNTRY
--------------------------------------------------------

  ALTER TABLE "SCI_COUNTRY" MODIFY ("CMS_COUNTRY_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_COUNTRY" MODIFY ("CTR_CNTRY_ISO_CODE" NOT NULL ENABLE);
  ALTER TABLE "SCI_COUNTRY" MODIFY ("CTR_CNTRY_NAME" NOT NULL ENABLE);
  ALTER TABLE "SCI_COUNTRY" ADD CONSTRAINT "INDICATOR293" CHECK (

  CTR_OECD_CNTRY_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_COUNTRY" ADD CONSTRAINT "PK_COUNTRY" PRIMARY KEY ("CMS_COUNTRY_ID")
  USING INDEX "PK_COUNTRY"  ENABLE;
  ALTER TABLE "SCI_COUNTRY" ADD CONSTRAINT "INDICATOR292" CHECK (

  CTR_EU_CNTRY_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_COUNTRY" ADD CONSTRAINT "INDICATOR295" CHECK (

  CTR_WORK_DAY_FRI_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_COUNTRY" ADD CONSTRAINT "INDICATOR296" CHECK (

  CTR_WORK_DAY_SAT_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_COUNTRY" ADD CONSTRAINT "INDICATOR297" CHECK (

  CTR_WORK_DAY_SUN_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_COUNTRY" ADD CONSTRAINT "INDICATOR294" CHECK (

  CTR_OWN_CLRNG_SYS_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_COUNTRY" ADD CONSTRAINT "XUQCOUNTRY" UNIQUE ("CTR_CNTRY_ISO_CODE")
  USING INDEX "XUQCOUNTRY"  ENABLE;
  ALTER TABLE "SCI_COUNTRY" ADD CONSTRAINT "INDICATOR291" CHECK (

  CTR_DATA_PROTECT_IND IN ('Y', 'N')
) ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_CPC_BKG_LOCTN_MAP
--------------------------------------------------------

  ALTER TABLE "SCI_CPC_BKG_LOCTN_MAP" MODIFY ("CMS_CPC_BKG_LOCTN_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_CPC_BKG_LOCTN_MAP" MODIFY ("CBM_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_CPC_BKG_LOCTN_MAP" MODIFY ("CBM_BKG_LOCTN_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_CPC_BKG_LOCTN_MAP" MODIFY ("CBM_CPC_ZONE_NUM" NOT NULL ENABLE);
  ALTER TABLE "SCI_CPC_BKG_LOCTN_MAP" MODIFY ("CBM_CPC_ZONE_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SCI_CPC_BKG_LOCTN_MAP" ADD CONSTRAINT "PK_CPC_BKG_LOC_MAP" PRIMARY KEY ("CMS_CPC_BKG_LOCTN_MAP_ID")
  USING INDEX "PK_CPC_BKG_LOC_MAP"  ENABLE;
  ALTER TABLE "SCI_CPC_BKG_LOCTN_MAP" ADD CONSTRAINT "XUQCPC_BKG_LOC_MAP" UNIQUE ("CBM_BKG_LOCTN_ID", "CBM_CPC_ZONE_NUM", "CBM_CPC_ZONE_VALUE")
  USING INDEX "XUQCPC_BKG_LOC_MAP"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_CURRENCY
--------------------------------------------------------

  ALTER TABLE "SCI_CURRENCY" MODIFY ("CMS_CURRENCY_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_CURRENCY" MODIFY ("CUR_CRRNCY_ISO_CODE" NOT NULL ENABLE);
  ALTER TABLE "SCI_CURRENCY" MODIFY ("CUR_CRRNCY_DESC" NOT NULL ENABLE);
  ALTER TABLE "SCI_CURRENCY" ADD CONSTRAINT "PK_CURRENCY" PRIMARY KEY ("CMS_CURRENCY_ID")
  USING INDEX "PK_CURRENCY"  ENABLE;
  ALTER TABLE "SCI_CURRENCY" ADD CONSTRAINT "INDICATOR303" CHECK (

  CUR_NET_CRRNCY_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_CURRENCY" ADD CONSTRAINT "INDICATOR304" CHECK (

  CUR_MAJOR_CRRNCY_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_CURRENCY" ADD CONSTRAINT "INDICATOR302" CHECK (

  CUR_RSTRCT_CRRNCY_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_CURRENCY" ADD CONSTRAINT "INDICATOR306" CHECK (

  CUR_CLS_ELIGIBLE_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_CURRENCY" ADD CONSTRAINT "INDICATOR305" CHECK (

  CUR_EURO_CRRNCY_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_CURRENCY" ADD CONSTRAINT "XUQCURRENCY" UNIQUE ("CUR_CRRNCY_ISO_CODE")
  USING INDEX "XUQCURRENCY"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_EMP_EMP_CODE_MAP
--------------------------------------------------------

  ALTER TABLE "SCI_EMP_EMP_CODE_MAP" MODIFY ("EEC_EMP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_EMP_EMP_CODE_MAP" MODIFY ("EEC_EMP_CODE" NOT NULL ENABLE);
  ALTER TABLE "SCI_EMP_EMP_CODE_MAP" MODIFY ("EEC_SYS_GEN_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_EMP_EMP_CODE_MAP" ADD CONSTRAINT "UNQ_EMP_EMP_CODE" UNIQUE ("EEC_SYS_GEN_MAP_ID")
  USING INDEX "UNQ_EMP_EMP_CODE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_EMP_PROFILE
--------------------------------------------------------

  ALTER TABLE "SCI_EMP_PROFILE" MODIFY ("EMP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_EMP_PROFILE" MODIFY ("EMP_NAME" NOT NULL ENABLE);
  ALTER TABLE "SCI_EMP_PROFILE" ADD CONSTRAINT "PK_EMP_PROFILE" PRIMARY KEY ("EMP_ID")
  USING INDEX "PK_EMP_PROFILE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_FAC_CO_BORROWER
--------------------------------------------------------

  ALTER TABLE "SCI_FAC_CO_BORROWER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_FAC_CO_BORROWER" ADD CONSTRAINT "pk_sci_fac_co_borrower" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_GRP_CREDIT_GRADE
--------------------------------------------------------

  ALTER TABLE "SCI_GRP_CREDIT_GRADE" MODIFY ("CMS_GRP_CREDIT_GRADE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_CREDIT_GRADE" MODIFY ("GCG_GRP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_CREDIT_GRADE" MODIFY ("GCG_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_CREDIT_GRADE" MODIFY ("GCG_CRDT_GRADE_TYPE_NUM" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_CREDIT_GRADE" MODIFY ("GCG_CRDT_GRADE_TYPE_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_CREDIT_GRADE" MODIFY ("GCG_CRDT_GRADE_CODE_NUM" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_CREDIT_GRADE" MODIFY ("GCG_CRDT_GRADE_CODE_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_CREDIT_GRADE" MODIFY ("GCG_CRDT_GRADE_START_DATE" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_CREDIT_GRADE" ADD CONSTRAINT "PK_GRP_CRDT_GRADE" PRIMARY KEY ("CMS_GRP_CREDIT_GRADE_ID")
  USING INDEX "PK_GRP_CRDT_GRADE"  ENABLE;
  ALTER TABLE "SCI_GRP_CREDIT_GRADE" ADD CONSTRAINT "XUQGRP_CRDT_GRADE" UNIQUE ("GCG_GRP_ID", "GCG_ID")
  USING INDEX "XUQGRP_CRDT_GRADE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_GRP_LE_LE_MAP
--------------------------------------------------------

  ALTER TABLE "SCI_GRP_LE_LE_MAP" MODIFY ("CMS_GRP_LE_LE_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_LE_LE_MAP" MODIFY ("GLL_GRP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_LE_LE_MAP" MODIFY ("GLL_PRNT_LE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_LE_LE_MAP" MODIFY ("GLL_REL_STATUS_NUM" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_LE_LE_MAP" MODIFY ("GLL_CHILD_LE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_LE_LE_MAP" MODIFY ("GLL_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_LE_LE_MAP" MODIFY ("GLL_REL_STATUS_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_LE_LE_MAP" MODIFY ("GLL_OWNSP_PERCENT" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_LE_LE_MAP" ADD CONSTRAINT "PK_GRP_LE_LE_MAP" PRIMARY KEY ("CMS_GRP_LE_LE_MAP_ID")
  USING INDEX "PK_GRP_LE_LE_MAP"  ENABLE;
  ALTER TABLE "SCI_GRP_LE_LE_MAP" ADD CONSTRAINT "XUQGRP_LE_LE_MAP" UNIQUE ("GLL_GRP_ID", "GLL_PRNT_LE_ID", "GLL_CHILD_LE_ID", "GLL_ID")
  USING INDEX "XUQGRP_LE_LE_MAP"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_GRP_LE_MAP
--------------------------------------------------------

  ALTER TABLE "SCI_GRP_LE_MAP" MODIFY ("CMS_GRP_LE_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_LE_MAP" MODIFY ("GLE_GRP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_LE_MAP" MODIFY ("GLE_LE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_LE_MAP" MODIFY ("GLE_LINK_TYPE_NUM" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_LE_MAP" MODIFY ("GLE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_LE_MAP" MODIFY ("GLE_LINK_TYPE_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_LE_MAP" ADD CONSTRAINT "PK_GRP_LE_MAP" PRIMARY KEY ("CMS_GRP_LE_MAP_ID")
  USING INDEX "PK_GRP_LE_MAP"  ENABLE;
  ALTER TABLE "SCI_GRP_LE_MAP" ADD CONSTRAINT "XUQGRP_LE_MAP" UNIQUE ("GLE_GRP_ID", "GLE_LE_ID", "GLE_ID")
  USING INDEX "XUQGRP_LE_MAP"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_GRP_MAP
--------------------------------------------------------

  ALTER TABLE "SCI_GRP_MAP" MODIFY ("CMS_GRP_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_MAP" MODIFY ("GMP_GRP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_MAP" MODIFY ("GMP_CHILD_GRP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_MAP" MODIFY ("GMP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_MAP" ADD CONSTRAINT "PK_GRP_MAP" PRIMARY KEY ("CMS_GRP_MAP_ID")
  USING INDEX "PK_GRP_MAP"  ENABLE;
  ALTER TABLE "SCI_GRP_MAP" ADD CONSTRAINT "XUQGRP_MAP" UNIQUE ("GMP_ID", "GMP_GRP_ID", "GMP_CHILD_GRP_ID")
  USING INDEX "XUQGRP_MAP"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_GRP_PROFILE
--------------------------------------------------------

  ALTER TABLE "SCI_GRP_PROFILE" MODIFY ("CMS_GRP_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_PROFILE" MODIFY ("GRP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_PROFILE" MODIFY ("GRP_NAME" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_PROFILE" MODIFY ("GRP_ULTIMATE_IND" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_PROFILE" MODIFY ("GRP_DMCL_CNTRY_ISO_CODE" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_PROFILE" MODIFY ("GRP_SGMNT_TYPE_NUM" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_PROFILE" MODIFY ("GRP_SGMNT_TYPE_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_PROFILE" MODIFY ("GRP_BIZ_TYPE_NUM" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_PROFILE" MODIFY ("GRP_BIZ_TYPE_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_PROFILE" MODIFY ("GRP_STATUS_NUM" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_PROFILE" MODIFY ("GRP_STATUS_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_PROFILE" MODIFY ("GRP_EMP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_PROFILE" MODIFY ("GRP_EMP_TYPE_NUM" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_PROFILE" MODIFY ("GRP_EMP_TYPE_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_PROFILE" MODIFY ("GRP_EMP_CODE" NOT NULL ENABLE);
  ALTER TABLE "SCI_GRP_PROFILE" ADD CONSTRAINT "XUQGRP_PROFILE" UNIQUE ("GRP_ID")
  USING INDEX "XUQGRP_PROFILE"  ENABLE;
  ALTER TABLE "SCI_GRP_PROFILE" ADD CONSTRAINT "INDICATOR316" CHECK (

  GRP_ULTIMATE_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_GRP_PROFILE" ADD CONSTRAINT "PK_GRP_PROFILE" PRIMARY KEY ("CMS_GRP_PROFILE_ID")
  USING INDEX "PK_GRP_PROFILE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_INSTRUCT_REF
--------------------------------------------------------

  ALTER TABLE "SCI_INSTRUCT_REF" MODIFY ("CMS_INSTRUCT_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_INSTRUCT_REF" ADD CONSTRAINT "PK_SCI_INSTRCT_REF" PRIMARY KEY ("CMS_INSTRUCT_REF_ID")
  USING INDEX "PK_SCI_INSTRCT_REF"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LE_BANKING_METHOD
--------------------------------------------------------

  ALTER TABLE "SCI_LE_BANKING_METHOD" MODIFY ("CMS_LE_BANKING_METHOD_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_BANKING_METHOD" MODIFY ("CMS_LE_BANK_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_LE_CO_BORROWER
--------------------------------------------------------

  ALTER TABLE "SCI_LE_CO_BORROWER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_CO_BORROWER" ADD CONSTRAINT "pk_sci_le_co_borrower" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LE_CREDIT_GRADE
--------------------------------------------------------

  ALTER TABLE "SCI_LE_CREDIT_GRADE" MODIFY ("CMS_LE_CREDIT_GRADE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_CREDIT_GRADE" ADD CONSTRAINT "PK_LE_CREDIT_GRADE" PRIMARY KEY ("CMS_LE_CREDIT_GRADE_ID")
  USING INDEX "PK_LE_CREDIT_GRADE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LE_CREDIT_STATUS
--------------------------------------------------------

  ALTER TABLE "SCI_LE_CREDIT_STATUS" MODIFY ("CMS_LE_CREDIT_STATUS_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_CREDIT_STATUS" ADD CONSTRAINT "PK_LE_CRDT_STATUS" PRIMARY KEY ("CMS_LE_CREDIT_STATUS_ID")
  USING INDEX "PK_LE_CRDT_STATUS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LE_CRI
--------------------------------------------------------

  ALTER TABLE "SCI_LE_CRI" MODIFY ("SCI_LE_CRI_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_LE_CRI_FAC
--------------------------------------------------------

  ALTER TABLE "SCI_LE_CRI_FAC" MODIFY ("SCI_LE_CRI_FAC_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_CRI_FAC" MODIFY ("FACILITY_NAME" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_CRI_FAC" MODIFY ("FACILITY_AMOUNT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_LE_CRI_FAC_STAGING
--------------------------------------------------------

  ALTER TABLE "SCI_LE_CRI_FAC_STAGING" MODIFY ("SCI_LE_CRI_FAC_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_CRI_FAC_STAGING" MODIFY ("FACILITY_NAME" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_CRI_FAC_STAGING" MODIFY ("FACILITY_AMOUNT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_LE_CRI_STAGING
--------------------------------------------------------

  ALTER TABLE "SCI_LE_CRI_STAGING" MODIFY ("SCI_LE_CRI_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_LE_DIRECTOR
--------------------------------------------------------

  ALTER TABLE "SCI_LE_DIRECTOR" MODIFY ("CMS_LE_DIRECTOR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_LE_ISIC_DTL
--------------------------------------------------------

  ALTER TABLE "SCI_LE_ISIC_DTL" MODIFY ("CMS_LE_ISIC_DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_ISIC_DTL" ADD CONSTRAINT "PKSCI_LE_ISIC_DTL" PRIMARY KEY ("CMS_LE_ISIC_DTL_ID")
  USING INDEX "PKSCI_LE_ISIC_DTL"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LE_KYC
--------------------------------------------------------

  ALTER TABLE "SCI_LE_KYC" MODIFY ("CMS_LE_KYC_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_KYC" ADD CONSTRAINT "PK_LE_KYC" PRIMARY KEY ("CMS_LE_KYC_ID")
  USING INDEX "PK_LE_KYC"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LE_MAIN_PROFILE
--------------------------------------------------------

  ALTER TABLE "SCI_LE_MAIN_PROFILE" MODIFY ("CMS_LE_MAIN_PROFILE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_LE_MAIN_PROFILE_BK
--------------------------------------------------------

  ALTER TABLE "SCI_LE_MAIN_PROFILE_BK" MODIFY ("CMS_LE_MAIN_PROFILE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_LE_OTHER_SYSTEM
--------------------------------------------------------

  ALTER TABLE "SCI_LE_OTHER_SYSTEM" MODIFY ("CMS_LE_OTHER_SYS_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_LE_REG_ADDR
--------------------------------------------------------

  ALTER TABLE "SCI_LE_REG_ADDR" MODIFY ("CMS_LE_REG_ADDR_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_REG_ADDR" ADD CONSTRAINT "PK_LE_REG_ADDR" PRIMARY KEY ("CMS_LE_REG_ADDR_ID")
  USING INDEX "PK_LE_REG_ADDR"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LE_REL
--------------------------------------------------------

  ALTER TABLE "SCI_LE_REL" MODIFY ("SCI_LE_REL_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_REL" MODIFY ("PARENT_SUB_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_REL" MODIFY ("CMS_LE_SUB_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_REL" ADD CONSTRAINT "SQL110121194742080" PRIMARY KEY ("SCI_LE_REL_ID")
  USING INDEX "SQL110121194742080"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LE_SUBLINE
--------------------------------------------------------

  ALTER TABLE "SCI_LE_SUBLINE" MODIFY ("CMS_LE_SUBLINE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_SUBLINE" MODIFY ("CMS_LE_SUBLINE_PARTY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_LE_SUB_PROFILE
--------------------------------------------------------

  ALTER TABLE "SCI_LE_SUB_PROFILE" MODIFY ("CMS_LE_SUB_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_SUB_PROFILE" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_SUB_PROFILE" ADD CONSTRAINT "PK_LE_SUB_PROFILE" PRIMARY KEY ("CMS_LE_SUB_PROFILE_ID")
  USING INDEX "LE_SUB_PRF_I6"  ENABLE;
  ALTER TABLE "SCI_LE_SUB_PROFILE" ADD CONSTRAINT "INDICATOR325" CHECK (
    LSP_BANK_SCY_ACT_IND IN ('Y', 'N')
  ) ENABLE;
  ALTER TABLE "SCI_LE_SUB_PROFILE" ADD CONSTRAINT "SQL110121194550080" CHECK (
    ULSP_SHORT_NAME = (UPPER(LSP_SHORT_NAME))
  ) DISABLE;
  ALTER TABLE "SCI_LE_SUB_PROFILE" ADD CONSTRAINT "INDICATOR324" CHECK (
    LSP_DCL_AGREE_IND IN ('Y', 'N')
  ) ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LE_UDF
--------------------------------------------------------

  ALTER TABLE "SCI_LE_UDF" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LE_UDF" ADD CONSTRAINT "SCI_LE_UDF_PK" PRIMARY KEY ("ID")
  USING INDEX "SCI_LE_UDF_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LE_VENDOR_DETAILS
--------------------------------------------------------

  ALTER TABLE "SCI_LE_VENDOR_DETAILS" ADD CONSTRAINT "SYSTEMPK" PRIMARY KEY ("CMS_LE_VENDOR_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LIMITS_REPORT
--------------------------------------------------------

  ALTER TABLE "SCI_LIMITS_REPORT" MODIFY ("LMT_REPORT_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LIMITS_REPORT" MODIFY ("CMS_LSP_APPR_LMTS_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_LINE_COBORROWER
--------------------------------------------------------

  ALTER TABLE "SCI_LINE_COBORROWER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LINE_COBORROWER" ADD CONSTRAINT "SCI_LINE_COBORROWER_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LMT_CREDIT_GRADE
--------------------------------------------------------

  ALTER TABLE "SCI_LMT_CREDIT_GRADE" MODIFY ("CMS_LMT_CREDIT_GRADE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LMT_CREDIT_GRADE" ADD CONSTRAINT "PK_LM_CREDIT_GRADE" PRIMARY KEY ("CMS_LMT_CREDIT_GRADE_ID")
  USING INDEX "PK_LM_CREDIT_GRADE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LSP_APPR_LMTS
--------------------------------------------------------

  ALTER TABLE "SCI_LSP_APPR_LMTS" MODIFY ("CMS_LSP_APPR_LMTS_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_APPR_LMTS" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_APPR_LMTS" ADD CONSTRAINT "PK_LSP_APPR_LMTS" PRIMARY KEY ("CMS_LSP_APPR_LMTS_ID")
  USING INDEX "PK_LSP_APPR_LMTS"  ENABLE;
  ALTER TABLE "SCI_LSP_APPR_LMTS" ADD CONSTRAINT "INDICATOR329" CHECK (

  LMT_ADVISE_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_LSP_APPR_LMTS" ADD CONSTRAINT "INDICATOR331" CHECK (

  LMT_SHARE_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_LSP_APPR_LMTS" ADD CONSTRAINT "INDICATOR330" CHECK (

  LMT_CMMTD_IND IN ('Y', 'N')
) ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LSP_APPR_LMTS_252014
--------------------------------------------------------

  ALTER TABLE "SCI_LSP_APPR_LMTS_252014" MODIFY ("CMS_LSP_APPR_LMTS_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_APPR_LMTS_252014" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_APPR_LMTS_252014" ADD CONSTRAINT "PK_LSP_APPR_LMTS123" PRIMARY KEY ("CMS_LSP_APPR_LMTS_ID")
  USING INDEX "PK_LSP_APPR_LMTS123"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LSP_COBO_LMT_XREF_MAP
--------------------------------------------------------

  ALTER TABLE "SCI_LSP_COBO_LMT_XREF_MAP" MODIFY ("CMS_LSP_COBO_LMT_XREF_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_COBO_LMT_XREF_MAP" MODIFY ("LCX_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_COBO_LMT_XREF_MAP" MODIFY ("LCX_LSX_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_COBO_LMT_XREF_MAP" MODIFY ("LCX_LLP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_COBO_LMT_XREF_MAP" MODIFY ("LCX_LSP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_COBO_LMT_XREF_MAP" MODIFY ("LCX_LE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_COBO_LMT_XREF_MAP" MODIFY ("LCX_LMT_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_COBO_LMT_XREF_MAP" MODIFY ("LCX_COBO_LSP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_COBO_LMT_XREF_MAP" MODIFY ("LCX_COBO_LE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_COBO_LMT_XREF_MAP" ADD CONSTRAINT "XUQCOBOLMT_XREFMAP" UNIQUE ("LCX_ID", "LCX_COBO_LE_ID", "LCX_COBO_LSP_ID", "LCX_LMT_ID", "LCX_LE_ID", "LCX_LSP_ID", "LCX_LLP_ID", "LCX_LSX_ID")
  USING INDEX "XUQCOBOLMT_XREFMAP"  ENABLE;
  ALTER TABLE "SCI_LSP_COBO_LMT_XREF_MAP" ADD CONSTRAINT "PK_COBOLMT_XREFMAP" PRIMARY KEY ("CMS_LSP_COBO_LMT_XREF_MAP_ID")
  USING INDEX "PK_COBOLMT_XREFMAP"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LSP_CO_BORROW_LMT
--------------------------------------------------------

  ALTER TABLE "SCI_LSP_CO_BORROW_LMT" MODIFY ("CMS_LSP_CO_BORROW_LMT_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_CO_BORROW_LMT" MODIFY ("LCL_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_CO_BORROW_LMT" ADD CONSTRAINT "PK_LSP_CO_BO_LMT" PRIMARY KEY ("CMS_LSP_CO_BORROW_LMT_ID")
  USING INDEX "PK_LSP_CO_BO_LMT"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LSP_EMP_MAP
--------------------------------------------------------

  ALTER TABLE "SCI_LSP_EMP_MAP" MODIFY ("CMS_LSP_EMP_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_EMP_MAP" MODIFY ("CMS_LE_SUB_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_EMP_MAP" MODIFY ("LEM_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_EMP_MAP" MODIFY ("LEM_LE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_EMP_MAP" MODIFY ("LEM_LSP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_EMP_MAP" MODIFY ("LEM_EMP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_EMP_MAP" MODIFY ("LEM_EMP_CODE" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_EMP_MAP" MODIFY ("LEM_EMP_TYPE_NUM" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_EMP_MAP" MODIFY ("LEM_EMP_TYPE_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_EMP_MAP" MODIFY ("LEM_PRINCIPAL_FAM_IND" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_EMP_MAP" ADD CONSTRAINT "INDICATOR335" CHECK (

  LEM_PRINCIPAL_FAM_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_LSP_EMP_MAP" ADD CONSTRAINT "PK_LSP_EMP_MAP" PRIMARY KEY ("CMS_LSP_EMP_MAP_ID")
  USING INDEX "PK_LSP_EMP_MAP"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LSP_JOINT_BORROWER
--------------------------------------------------------

  ALTER TABLE "SCI_LSP_JOINT_BORROWER" MODIFY ("CMS_LSP_JOINT_BORROWER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_LSP_LMTS_XREF_MAP
--------------------------------------------------------

  ALTER TABLE "SCI_LSP_LMTS_XREF_MAP" MODIFY ("CMS_LSP_LMTS_XREF_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_LMTS_XREF_MAP" ADD CONSTRAINT "PK_LSPLMTS_XREFMAP" PRIMARY KEY ("CMS_LSP_LMTS_XREF_MAP_ID")
  USING INDEX "PK_LSPLMTS_XREFMAP"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LSP_LMT_PROFILE
--------------------------------------------------------

  ALTER TABLE "SCI_LSP_LMT_PROFILE" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_LMT_PROFILE" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_LMT_PROFILE" ADD CONSTRAINT "PK_LSP_LMT_PROFILE" PRIMARY KEY ("CMS_LSP_LMT_PROFILE_ID")
  USING INDEX "LMT_PRF_I6"  ENABLE;
  ALTER TABLE "SCI_LSP_LMT_PROFILE" ADD CONSTRAINT "INDICATOR339" CHECK (

  LLP_UNWRT_STD_CMPLNCE_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_LSP_LMT_PROFILE" ADD CONSTRAINT "INDICATOR340" CHECK (

  LLP_PROD_PRG_COMPLNCE_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_LSP_LMT_PROFILE" ADD CONSTRAINT "INDICATOR341" CHECK (

  LLP_CNTRY_RISK_APPR_REQ_IND IN ('Y', 'N')
) ENABLE;
  ALTER TABLE "SCI_LSP_LMT_PROFILE" ADD CONSTRAINT "INDICATOR338" CHECK (

  LLP_CRDT_PLCY_COMPLNCE_IND IN ('Y', 'N')
) ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LSP_LMT_PROFILE_05122013
--------------------------------------------------------

  ALTER TABLE "SCI_LSP_LMT_PROFILE_05122013" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_LMT_PROFILE_05122013" MODIFY ("ISMIGRATED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_LSP_LMT_PROFILE_UDF
--------------------------------------------------------

  ALTER TABLE "SCI_LSP_LMT_PROFILE_UDF" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_LMT_PROFILE_UDF" ADD CONSTRAINT "SCI_LSP_LMT_PROFILE_UDF_PK" PRIMARY KEY ("ID")
  USING INDEX "SCI_LSP_LMT_PROFILE_UDF_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LSP_LMT_XREF_UDF
--------------------------------------------------------

  ALTER TABLE "SCI_LSP_LMT_XREF_UDF" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_LMT_XREF_UDF" ADD CONSTRAINT "SCI_LSP_LMT_XREF_UDF_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LSP_LMT_XREF_UDF_2
--------------------------------------------------------

  ALTER TABLE "SCI_LSP_LMT_XREF_UDF_2" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_LMT_XREF_UDF_2" ADD CONSTRAINT "SCI_LSP_LMT_XREF_UDF_PK2" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LSP_OFF_ADDR
--------------------------------------------------------

  ALTER TABLE "SCI_LSP_OFF_ADDR" MODIFY ("CMS_LOA_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_OFF_ADDR" ADD CONSTRAINT "PK_LSP_OFF_ADDR" PRIMARY KEY ("CMS_LOA_ID")
  USING INDEX "PK_LSP_OFF_ADDR"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LSP_SYS_XREF
--------------------------------------------------------

  ALTER TABLE "SCI_LSP_SYS_XREF" MODIFY ("CMS_LSP_SYS_XREF_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_LSP_SYS_XREF" ADD CONSTRAINT "PK_LSP_SYS_XREF" PRIMARY KEY ("CMS_LSP_SYS_XREF_ID")
  USING INDEX "PK_LSP_SYS_XREF"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_LSP_SYS_XREF_30JUL2021
--------------------------------------------------------

  ALTER TABLE "SCI_LSP_SYS_XREF_30JUL2021" MODIFY ("CMS_LSP_SYS_XREF_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_LSP_SYS_XREF_BACK_UP
--------------------------------------------------------

  ALTER TABLE "SCI_LSP_SYS_XREF_BACK_UP" MODIFY ("CMS_LSP_SYS_XREF_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_PLDGR_CREDIT_GRADE
--------------------------------------------------------

  ALTER TABLE "SCI_PLDGR_CREDIT_GRADE" MODIFY ("CMS_PLDGR_CREDIT_GRADE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_PLDGR_CREDIT_GRADE" MODIFY ("PCG_CRDT_GRADE_TYPE_NUM" NOT NULL ENABLE);
  ALTER TABLE "SCI_PLDGR_CREDIT_GRADE" MODIFY ("PCG_CRDT_GRADE_TYPE_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SCI_PLDGR_CREDIT_GRADE" MODIFY ("PCG_CRDT_GRADE_CODE_NUM" NOT NULL ENABLE);
  ALTER TABLE "SCI_PLDGR_CREDIT_GRADE" MODIFY ("PCG_CRDT_GRADE_CODE_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SCI_PLDGR_CREDIT_GRADE" MODIFY ("PCG_CRDT_GRADE_START_DATE" NOT NULL ENABLE);
  ALTER TABLE "SCI_PLDGR_CREDIT_GRADE" ADD CONSTRAINT "PK_PLDGR_CRDTGRAD" PRIMARY KEY ("CMS_PLDGR_CREDIT_GRADE_ID")
  USING INDEX "PK_PLDGR_CRDTGRAD"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_PLEDGOR_DTL
--------------------------------------------------------

  ALTER TABLE "SCI_PLEDGOR_DTL" MODIFY ("CMS_PLEDGOR_DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_PLEDGOR_DTL" ADD CONSTRAINT "PK_PLEDGOR_DTL" PRIMARY KEY ("CMS_PLEDGOR_DTL_ID")
  USING INDEX "PK_PLEDGOR_DTL"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCI_PLEDGOR_REPORT
--------------------------------------------------------

  ALTER TABLE "SCI_PLEDGOR_REPORT" MODIFY ("PLG_REPORT_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_PLEDGOR_REPORT" MODIFY ("CMS_PLEDGOR_DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_PLEDGOR_REPORT" MODIFY ("PLG_PLEDGOR_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_PLEDGOR_REPORT" MODIFY ("PLG_LEGAL_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCI_SEC_PLDGR_MAP
--------------------------------------------------------

  ALTER TABLE "SCI_SEC_PLDGR_MAP" MODIFY ("CMS_SEC_PLDGR_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "SCI_SEC_PLDGR_MAP" ADD CONSTRAINT "PK_SEC_PLDGR_MAP" PRIMARY KEY ("CMS_SEC_PLDGR_MAP_ID")
  USING INDEX "PK_SEC_PLDGR_MAP"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SECURITY_FIELD
--------------------------------------------------------

  ALTER TABLE "SECURITY_FIELD" MODIFY ("FIELD_NAME" NOT NULL ENABLE);
  ALTER TABLE "SECURITY_FIELD" MODIFY ("SECURITY_SUB_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "SECURITY_FIELD" MODIFY ("IS_SSC_UPDATABLE" NOT NULL ENABLE);
  ALTER TABLE "SECURITY_FIELD" ADD CONSTRAINT "CHK_SECURITY_FIELD" CHECK (

  IS_SSC_UPDATABLE in ('Y', 'N')
) ENABLE;
  ALTER TABLE "SECURITY_FIELD" ADD CONSTRAINT "PK_SECURITY_FIELD" PRIMARY KEY ("FIELD_NAME", "SECURITY_SUB_TYPE_ID")
  USING INDEX "PK_SECURITY_FIELD"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SECURITY_SUBTYPE_MAPPING
--------------------------------------------------------

  ALTER TABLE "SECURITY_SUBTYPE_MAPPING" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "SECURITY_SUBTYPE_MAPPING" MODIFY ("SCI_SECURITY_DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "SECURITY_SUBTYPE_MAPPING" ADD CONSTRAINT "SQL080609120047680" PRIMARY KEY ("CMS_COLLATERAL_ID")
  USING INDEX "SQL080609120047680"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SECURITY_TYPE
--------------------------------------------------------

  ALTER TABLE "SECURITY_TYPE" MODIFY ("SECURITY_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "SECURITY_TYPE" ADD CONSTRAINT "PKSECURITY_TYPE" PRIMARY KEY ("SECURITY_TYPE_ID")
  USING INDEX "PKSECURITY_TYPE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SESSIONS
--------------------------------------------------------

  ALTER TABLE "SESSIONS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SESSIONS" MODIFY ("PROPID" NOT NULL ENABLE);
  ALTER TABLE "SESSIONS" MODIFY ("APPNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SETTINGS
--------------------------------------------------------

  ALTER TABLE "SETTINGS" MODIFY ("SCHEMA_NAME" NOT NULL ENABLE);
  ALTER TABLE "SETTINGS" MODIFY ("TABLE_OPTIONS" NOT NULL ENABLE);
  ALTER TABLE "SETTINGS" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "SETTINGS" MODIFY ("LOB_EMULATION" NOT NULL ENABLE);
  ALTER TABLE "SETTINGS" MODIFY ("LEGACY_VIEWS" NOT NULL ENABLE);
  ALTER TABLE "SETTINGS" MODIFY ("DB_TYPE" NOT NULL ENABLE);
  ALTER TABLE "SETTINGS" MODIFY ("LOB_EMU_SIZE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SI_ERROR_LOG
--------------------------------------------------------

  ALTER TABLE "SI_ERROR_LOG" MODIFY ("SI_NUMBER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SI_LOAD_TYPE_CONFIG
--------------------------------------------------------

  ALTER TABLE "SI_LOAD_TYPE_CONFIG" MODIFY ("CONFIG_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SI_PROC_TIME_LOG
--------------------------------------------------------

  ALTER TABLE "SI_PROC_TIME_LOG" MODIFY ("PROC_NUMBER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_ASSET_TRADE_IN
--------------------------------------------------------

  ALTER TABLE "STAGE_ASSET_TRADE_IN" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_ASSET_TRADE_IN" ADD CONSTRAINT "CC1169518763546" PRIMARY KEY ("ID")
  USING INDEX "CC1169518763546"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_BANKING_ARR_FAC_EXC
--------------------------------------------------------

  ALTER TABLE "STAGE_BANKING_ARR_FAC_EXC" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_BANKING_ARR_FAC_EXC" MODIFY ("SYSTEM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_BUS_PARAM
--------------------------------------------------------

  ALTER TABLE "STAGE_BUS_PARAM" MODIFY ("PARAMETER_PK" NOT NULL ENABLE);
  ALTER TABLE "STAGE_BUS_PARAM" MODIFY ("PARAMETER_CODE" NOT NULL ENABLE);
  ALTER TABLE "STAGE_BUS_PARAM" MODIFY ("ENTITY_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_BUS_PARAM" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "STAGE_BUS_PARAM" ADD CONSTRAINT "PKSTAGE_BUS_PARAM" PRIMARY KEY ("PARAMETER_PK")
  USING INDEX "PKSTAGE_BUS_PARAM"  ENABLE;
  ALTER TABLE "STAGE_BUS_PARAM" ADD CONSTRAINT "UISTAGE_BUS_PARAM" UNIQUE ("PARAMETER_CODE", "PARAMETER_PK")
  USING INDEX "UISTAGE_BUS_PARAM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_BUS_PARAM_GRP
--------------------------------------------------------

  ALTER TABLE "STAGE_BUS_PARAM_GRP" MODIFY ("GROUP_CODE" NOT NULL ENABLE);
  ALTER TABLE "STAGE_BUS_PARAM_GRP" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "STAGE_BUS_PARAM_GRP" ADD CONSTRAINT "PK_STG_BUS_PAR_GRP" PRIMARY KEY ("GROUP_CODE")
  USING INDEX "PK_STG_BUS_PAR_GRP"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_CCC_GENERATED
--------------------------------------------------------

  ALTER TABLE "STAGE_CCC_GENERATED" MODIFY ("CCC_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CCC_GENERATED" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CCC_GENERATED" MODIFY ("SUB_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CCC_GENERATED" ADD CONSTRAINT "PK_STAGE_CCC_GEN" PRIMARY KEY ("CCC_ID")
  USING INDEX "PK_STAGE_CCC_GEN"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_CCC_GENERATED_ITEM
--------------------------------------------------------

  ALTER TABLE "STAGE_CCC_GENERATED_ITEM" MODIFY ("CCC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CCC_GENERATED_ITEM" MODIFY ("CMS_LSP_APPR_LMTS_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CCC_GENERATED_ITEM" MODIFY ("ACTIVATED_LIMIT" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CCC_GENERATED_ITEM" ADD CONSTRAINT "PK_STG_CCC_GEN_ITM" PRIMARY KEY ("CCC_ITEM_ID")
  USING INDEX "PK_STG_CCC_GEN_ITM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_CC_DOC_LOC
--------------------------------------------------------

  ALTER TABLE "STAGE_CC_DOC_LOC" MODIFY ("DOC_LOC_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CC_DOC_LOC" MODIFY ("SUB_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CC_DOC_LOC" ADD CONSTRAINT "PK_STG_CC_DOC_LOC" PRIMARY KEY ("DOC_LOC_ID")
  USING INDEX "PK_STG_CC_DOC_LOC"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_CC_TASK
--------------------------------------------------------

  ALTER TABLE "STAGE_CC_TASK" MODIFY ("TASK_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CC_TASK" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CC_TASK" ADD CONSTRAINT "PK_STAGE_CC_TASK" PRIMARY KEY ("TASK_ID")
  USING INDEX "PK_STAGE_CC_TASK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_CHECKLIST
--------------------------------------------------------

  ALTER TABLE "STAGE_CHECKLIST" MODIFY ("CHECKLIST_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CHECKLIST" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CHECKLIST" ADD CONSTRAINT "PK_STAGE_CHECKLIST" PRIMARY KEY ("CHECKLIST_ID")
  USING INDEX "PK_STAGE_CHECKLIST"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_CHECKLIST_19122013
--------------------------------------------------------

  ALTER TABLE "STAGE_CHECKLIST_19122013" MODIFY ("CHECKLIST_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CHECKLIST_19122013" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_CHECKLIST_ITEM
--------------------------------------------------------

  ALTER TABLE "STAGE_CHECKLIST_ITEM" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CHECKLIST_ITEM" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CHECKLIST_ITEM" ADD CONSTRAINT "PK_STG_CHKLIST_ITM" PRIMARY KEY ("DOC_ITEM_ID")
  USING INDEX "PK_STG_CHKLIST_ITM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_CHECKLIST_ITEM_11012013
--------------------------------------------------------

  ALTER TABLE "STAGE_CHECKLIST_ITEM_11012013" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CHECKLIST_ITEM_11012013" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_CHECKLIST_ITEM_19122013
--------------------------------------------------------

  ALTER TABLE "STAGE_CHECKLIST_ITEM_19122013" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CHECKLIST_ITEM_19122013" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_CHECKLIST_ITEM_20092012
--------------------------------------------------------

  ALTER TABLE "STAGE_CHECKLIST_ITEM_20092012" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CHECKLIST_ITEM_20092012" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_CHECKLIST_ITEM_25112014
--------------------------------------------------------

  ALTER TABLE "STAGE_CHECKLIST_ITEM_25112014" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_CHECKLIST_ITEM_BKP
--------------------------------------------------------

  ALTER TABLE "STAGE_CHECKLIST_ITEM_BKP" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CHECKLIST_ITEM_BKP" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_CHECKLIST_ITEM_SHARE
--------------------------------------------------------

  ALTER TABLE "STAGE_CHECKLIST_ITEM_SHARE" MODIFY ("CHECKLIST_ITEM_SHARE_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CHECKLIST_ITEM_SHARE" ADD CONSTRAINT "PK_STG_CHK_ITM_SHR" PRIMARY KEY ("CHECKLIST_ITEM_SHARE_ID")
  USING INDEX "PK_STG_CHK_ITM_SHR"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_CLIST_ITEM_SHARE_BKUP
--------------------------------------------------------

  ALTER TABLE "STAGE_CLIST_ITEM_SHARE_BKUP" MODIFY ("CHECKLIST_ITEM_SHARE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_COLLATERAL_TASK
--------------------------------------------------------

  ALTER TABLE "STAGE_COLLATERAL_TASK" MODIFY ("TASK_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_COLLATERAL_TASK" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_COLLATERAL_TASK" ADD CONSTRAINT "PK_STG_COL_TASK" PRIMARY KEY ("TASK_ID")
  USING INDEX "PK_STG_COL_TASK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_COMMON_CODE_CATEGORY
--------------------------------------------------------

  ALTER TABLE "STAGE_COMMON_CODE_CATEGORY" MODIFY ("CATEGORY_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_COMMON_CODE_CATEGORY" MODIFY ("CATEGORY_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_COMMON_CODE_ENTRY
--------------------------------------------------------

  ALTER TABLE "STAGE_COMMON_CODE_ENTRY" MODIFY ("STAGE_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_COMMON_CODE_ENTRY" MODIFY ("ENTRY_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_COMMON_CODE_ENTRY" ADD CONSTRAINT "CCC_ENT_STG_ID_PK" PRIMARY KEY ("STAGE_ID")
  USING INDEX "CCC_ENT_STG_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_CONVENANT
--------------------------------------------------------

  ALTER TABLE "STAGE_CONVENANT" MODIFY ("CONVENANT_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CONVENANT" MODIFY ("CONVENANT_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CONVENANT" ADD CONSTRAINT "PK_STAGE_CONVENANT" PRIMARY KEY ("CONVENANT_ID")
  USING INDEX "PK_STAGE_CONVENANT"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_CONVENANT_SUB_ITEM
--------------------------------------------------------

  ALTER TABLE "STAGE_CONVENANT_SUB_ITEM" MODIFY ("SUB_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CONVENANT_SUB_ITEM" MODIFY ("SUB_ITEM_REF_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_CO_BORROWER_LIMIT
--------------------------------------------------------

  ALTER TABLE "STAGE_CO_BORROWER_LIMIT" MODIFY ("CMS_LSP_CO_BORROW_LMT_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CO_BORROWER_LIMIT" ADD CONSTRAINT "PK_STAGE_CO_BO_LMT" PRIMARY KEY ("CMS_LSP_CO_BORROW_LMT_ID")
  USING INDEX "PK_STAGE_CO_BO_LMT"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_CUSTODIAN_DOC
--------------------------------------------------------

  ALTER TABLE "STAGE_CUSTODIAN_DOC" MODIFY ("CUSTODIAN_DOC_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CUSTODIAN_DOC" MODIFY ("CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CUSTODIAN_DOC" MODIFY ("SUB_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CUSTODIAN_DOC" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "STAGE_CUSTODIAN_DOC" ADD CONSTRAINT "PK_STG_CUST_DOC" PRIMARY KEY ("CUSTODIAN_DOC_ID")
  USING INDEX "PK_STG_CUST_DOC"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_DDN_GENERATED
--------------------------------------------------------

  ALTER TABLE "STAGE_DDN_GENERATED" MODIFY ("DDN_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DDN_GENERATED" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DDN_GENERATED" ADD CONSTRAINT "PK_STG_DDN_GEN" PRIMARY KEY ("DDN_ID")
  USING INDEX "PK_STG_DDN_GEN"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_DDN_GENERATED_ITEM
--------------------------------------------------------

  ALTER TABLE "STAGE_DDN_GENERATED_ITEM" MODIFY ("DDN_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DDN_GENERATED_ITEM" MODIFY ("CMS_LSP_APPR_LMTS_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DDN_GENERATED_ITEM" MODIFY ("HAS_ISSUED" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DDN_GENERATED_ITEM" ADD CONSTRAINT "PK_STG_DDN_GEN_ITM" PRIMARY KEY ("DDN_ITEM_ID")
  USING INDEX "PK_STG_DDN_GEN_ITM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_DEFERRAL_GENERATED
--------------------------------------------------------

  ALTER TABLE "STAGE_DEFERRAL_GENERATED" MODIFY ("DEFERRAL_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DEFERRAL_GENERATED" ADD CONSTRAINT "STG_DEFER_GEN" PRIMARY KEY ("DEFERRAL_ID")
  USING INDEX "STG_DEFER_GEN"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_DEFERRAL_GENERATED_ITEM
--------------------------------------------------------

  ALTER TABLE "STAGE_DEFERRAL_GENERATED_ITEM" MODIFY ("DEFERRAL_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DEFERRAL_GENERATED_ITEM" ADD CONSTRAINT "STG_DEFER_GEN_ITM" PRIMARY KEY ("DEFERRAL_ITEM_ID")
  USING INDEX "STG_DEFER_GEN_ITM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_DEFERRAL_UPLOAD
--------------------------------------------------------

  ALTER TABLE "STAGE_DEFERRAL_UPLOAD" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DEFERRAL_UPLOAD" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_DIARY_EMAIL_MAP
--------------------------------------------------------

  ALTER TABLE "STAGE_DIARY_EMAIL_MAP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DIARY_EMAIL_MAP" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_DIARY_EMAIL_SEG_MAP
--------------------------------------------------------

  ALTER TABLE "STAGE_DIARY_EMAIL_SEG_MAP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DIARY_EMAIL_SEG_MAP" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_DOCUMENT_GLOBALLIST
--------------------------------------------------------

  ALTER TABLE "STAGE_DOCUMENT_GLOBALLIST" MODIFY ("DOCUMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DOCUMENT_GLOBALLIST" MODIFY ("DOCUMENT_DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DOCUMENT_GLOBALLIST" MODIFY ("CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DOCUMENT_GLOBALLIST" ADD CONSTRAINT "PK_STG_DOC_GBLIST" PRIMARY KEY ("DOCUMENT_ID")
  USING INDEX "PK_STG_DOC_GBLIST"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_DOCUMENT_GLOBALLIST_1912
--------------------------------------------------------

  ALTER TABLE "STAGE_DOCUMENT_GLOBALLIST_1912" MODIFY ("DOCUMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DOCUMENT_GLOBALLIST_1912" MODIFY ("DOCUMENT_DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DOCUMENT_GLOBALLIST_1912" MODIFY ("CATEGORY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_DOCUMENT_ITEM
--------------------------------------------------------

  ALTER TABLE "STAGE_DOCUMENT_ITEM" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DOCUMENT_ITEM" ADD CONSTRAINT "PK_STG_DOCU_ITEM" PRIMARY KEY ("DOC_ITEM_ID")
  USING INDEX "PK_STG_DOCU_ITEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_DOCUMENT_ITEM_19122013
--------------------------------------------------------

  ALTER TABLE "STAGE_DOCUMENT_ITEM_19122013" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_DOCUMENT_MASTERLIST
--------------------------------------------------------

  ALTER TABLE "STAGE_DOCUMENT_MASTERLIST" MODIFY ("MASTERLIST_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DOCUMENT_MASTERLIST" ADD CONSTRAINT "PK_STG_DOC_MLIST" PRIMARY KEY ("MASTERLIST_ID")
  USING INDEX "PK_STG_DOC_MLIST"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_DOCUMENT_MASTERLIST_1912
--------------------------------------------------------

  ALTER TABLE "STAGE_DOCUMENT_MASTERLIST_1912" MODIFY ("MASTERLIST_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_DOC_LOAN_APP_TYPE
--------------------------------------------------------

  ALTER TABLE "STAGE_DOC_LOAN_APP_TYPE" MODIFY ("DOC_LOAN_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DOC_LOAN_APP_TYPE" MODIFY ("APP_TYPE" NOT NULL ENABLE);
  ALTER TABLE "STAGE_DOC_LOAN_APP_TYPE" ADD CONSTRAINT "SQL110121194526830" PRIMARY KEY ("DOC_LOAN_ID")
  USING INDEX "SQL110121194526830"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_FAC_MULTI_TIER_FINANCING
--------------------------------------------------------

  ALTER TABLE "STAGE_FAC_MULTI_TIER_FINANCING" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_FAC_MULTI_TIER_FINANCING" ADD CONSTRAINT "SQL110121194559540" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194559540"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_LE_REL
--------------------------------------------------------

  ALTER TABLE "STAGE_LE_REL" MODIFY ("SCI_LE_REL_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_LE_REL" MODIFY ("PARENT_SUB_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_LE_REL" MODIFY ("CMS_LE_SUB_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_LE_REL" ADD CONSTRAINT "SQL110121194742140" PRIMARY KEY ("SCI_LE_REL_ID")
  USING INDEX "SQL110121194742140"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_LIMIT
--------------------------------------------------------

  ALTER TABLE "STAGE_LIMIT" MODIFY ("CMS_LSP_APPR_LMTS_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_LIMIT" ADD CONSTRAINT "PK_STAGE_LIMIT" PRIMARY KEY ("CMS_LSP_APPR_LMTS_ID")
  USING INDEX "STG_APPR_LMTS_IDX3"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_LIMIT_PROFILE
--------------------------------------------------------

  ALTER TABLE "STAGE_LIMIT_PROFILE" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_LIMIT_PROFILE" ADD CONSTRAINT "PK_STAGE_LIMIT_PRO" PRIMARY KEY ("CMS_LSP_LMT_PROFILE_ID")
  USING INDEX "PK_STAGE_LIMIT_PRO"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_LIMIT_PROFILE_UDF
--------------------------------------------------------

  ALTER TABLE "STAGE_LIMIT_PROFILE_UDF" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_LIMIT_PROFILE_UDF" ADD CONSTRAINT "STAGE_LIMIT_PROFILE_UDF_PK" PRIMARY KEY ("ID")
  USING INDEX "STAGE_LIMIT_PROFILE_UDF_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_LIMIT_XREF
--------------------------------------------------------

  ALTER TABLE "STAGE_LIMIT_XREF" MODIFY ("CMS_LSP_LMTS_XREF_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_LIMIT_XREF" ADD CONSTRAINT "PK_STAGE_LMT_XREF" PRIMARY KEY ("CMS_LSP_LMTS_XREF_MAP_ID")
  USING INDEX "PK_STAGE_LMT_XREF"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_PLEDGOR_DTL
--------------------------------------------------------

  ALTER TABLE "STAGE_PLEDGOR_DTL" MODIFY ("CMS_PLEDGOR_DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_PLEDGOR_DTL" MODIFY ("PLG_LEGAL_NAME" NOT NULL ENABLE);
  ALTER TABLE "STAGE_PLEDGOR_DTL" ADD CONSTRAINT "SQL080609120031510" PRIMARY KEY ("CMS_PLEDGOR_DTL_ID")
  USING INDEX "SQL080609120031510"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_PSCC_GENERATED
--------------------------------------------------------

  ALTER TABLE "STAGE_PSCC_GENERATED" MODIFY ("PSCC_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_PSCC_GENERATED" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_PSCC_GENERATED" ADD CONSTRAINT "PK_STAGE_PSCC_GEN" PRIMARY KEY ("PSCC_ID")
  USING INDEX "PK_STAGE_PSCC_GEN"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_PSCC_GENERATED_ITEM
--------------------------------------------------------

  ALTER TABLE "STAGE_PSCC_GENERATED_ITEM" MODIFY ("PSCC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_PSCC_GENERATED_ITEM" MODIFY ("CMS_LSP_APPR_LMTS_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_PSCC_GENERATED_ITEM" MODIFY ("ACTIVATED_LIMIT" NOT NULL ENABLE);
  ALTER TABLE "STAGE_PSCC_GENERATED_ITEM" ADD CONSTRAINT "PK_STG_PSCC_GENITM" PRIMARY KEY ("PSCC_ITEM_ID")
  USING INDEX "PK_STG_PSCC_GENITM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_RECURRENT_DOC
--------------------------------------------------------

  ALTER TABLE "STAGE_RECURRENT_DOC" MODIFY ("RECURRENT_DOC_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_RECURRENT_DOC" ADD CONSTRAINT "PK_STG_RECUR_DOC" PRIMARY KEY ("RECURRENT_DOC_ID")
  USING INDEX "PK_STG_RECUR_DOC"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_RECURRENT_DOC_ITEM
--------------------------------------------------------

  ALTER TABLE "STAGE_RECURRENT_DOC_ITEM" MODIFY ("RECURRENT_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_RECURRENT_DOC_ITEM" MODIFY ("RECURRENT_ITEM_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_RECURRENT_DOC_ITEM" ADD CONSTRAINT "PK_STG_RECR_DOCITM" PRIMARY KEY ("RECURRENT_ITEM_ID")
  USING INDEX "PK_STG_RECR_DOCITM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_RECURRENT_DOC_SUB_ITEM
--------------------------------------------------------

  ALTER TABLE "STAGE_RECURRENT_DOC_SUB_ITEM" MODIFY ("SUB_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_RECURRENT_DOC_SUB_ITEM" MODIFY ("SUB_ITEM_REF_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_RECURRENT_DOC_SUB_ITEM" ADD CONSTRAINT "PK_STG_RDOC_SUBITM" PRIMARY KEY ("SUB_ITEM_ID")
  USING INDEX "PK_STG_RDOC_SUBITM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_SCC_GENERATED
--------------------------------------------------------

  ALTER TABLE "STAGE_SCC_GENERATED" MODIFY ("SCC_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SCC_GENERATED" MODIFY ("CMS_LSP_LMT_PROFILE_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SCC_GENERATED" ADD CONSTRAINT "PK_STG_SCC_GEN" PRIMARY KEY ("SCC_ID")
  USING INDEX "PK_STG_SCC_GEN"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_SCC_GENERATED_ITEM
--------------------------------------------------------

  ALTER TABLE "STAGE_SCC_GENERATED_ITEM" MODIFY ("SCC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SCC_GENERATED_ITEM" MODIFY ("CMS_LSP_APPR_LMTS_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SCC_GENERATED_ITEM" MODIFY ("ACTIVATED_LIMIT" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SCC_GENERATED_ITEM" ADD CONSTRAINT "PK_STG_SCC_GEN_ITM" PRIMARY KEY ("SCC_ITEM_ID")
  USING INDEX "PK_STG_SCC_GEN_ITM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_SCI_FAC_CO_BORROWER
--------------------------------------------------------

  ALTER TABLE "STAGE_SCI_FAC_CO_BORROWER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SCI_FAC_CO_BORROWER" ADD CONSTRAINT "PK_STAGE_SCI_FAC_CO_BORROWER" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_SCI_LE_BANKING_METHOD
--------------------------------------------------------

  ALTER TABLE "STAGE_SCI_LE_BANKING_METHOD" MODIFY ("CMS_LE_BANKING_METHOD_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SCI_LE_BANKING_METHOD" MODIFY ("CMS_LE_BANK_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_SCI_LE_CO_BORROWER
--------------------------------------------------------

  ALTER TABLE "STAGE_SCI_LE_CO_BORROWER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SCI_LE_CO_BORROWER" ADD CONSTRAINT "pk_stage_sci_le_co_borrower" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_SCI_LE_DIRECTOR
--------------------------------------------------------

  ALTER TABLE "STAGE_SCI_LE_DIRECTOR" MODIFY ("CMS_LE_DIRECTOR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_SCI_LE_MAIN_PROFILE
--------------------------------------------------------

  ALTER TABLE "STAGE_SCI_LE_MAIN_PROFILE" MODIFY ("CMS_LE_MAIN_PROFILE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_SCI_LE_OTHER_SYSTEM
--------------------------------------------------------

  ALTER TABLE "STAGE_SCI_LE_OTHER_SYSTEM" MODIFY ("CMS_LE_OTHER_SYS_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_SCI_LE_REG_ADDR
--------------------------------------------------------

  ALTER TABLE "STAGE_SCI_LE_REG_ADDR" MODIFY ("CMS_LE_REG_ADDR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_SCI_LE_SUBLINE
--------------------------------------------------------

  ALTER TABLE "STAGE_SCI_LE_SUBLINE" MODIFY ("CMS_LE_SUBLINE_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SCI_LE_SUBLINE" MODIFY ("CMS_LE_SUBLINE_PARTY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_SCI_LE_SUB_PROFILE
--------------------------------------------------------

  ALTER TABLE "STAGE_SCI_LE_SUB_PROFILE" MODIFY ("CMS_LE_SUB_PROFILE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAGE_SCI_LE_UDF
--------------------------------------------------------

  ALTER TABLE "STAGE_SCI_LE_UDF" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SCI_LE_UDF" ADD CONSTRAINT "STAGE_SCI_LE_UDF_PK" PRIMARY KEY ("ID")
  USING INDEX "STAGE_SCI_LE_UDF_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_SCI_LE_VENDOR_DETAILS
--------------------------------------------------------

  ALTER TABLE "STAGE_SCI_LE_VENDOR_DETAILS" ADD CONSTRAINT "SYSTEM_PK" PRIMARY KEY ("CMS_LE_VENDOR_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_SCI_LINE_COBORROWER
--------------------------------------------------------

  ALTER TABLE "STAGE_SCI_LINE_COBORROWER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SCI_LINE_COBORROWER" ADD CONSTRAINT "STAGE_SCI_LINE_COBORROWER_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_SCI_LSP_LMT_XREF_UDF
--------------------------------------------------------

  ALTER TABLE "STAGE_SCI_LSP_LMT_XREF_UDF" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SCI_LSP_LMT_XREF_UDF" ADD CONSTRAINT "STAGE_SCI_LSP_LMT_XREF_UDF_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_SCI_LSP_LMT_XREF_UDF_2
--------------------------------------------------------

  ALTER TABLE "STAGE_SCI_LSP_LMT_XREF_UDF_2" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SCI_LSP_LMT_XREF_UDF_2" ADD CONSTRAINT "STAGE_SCI_LSP_LMT_XREF_UDF_PK2" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_SECURITY_INSTRUMENT
--------------------------------------------------------

  ALTER TABLE "STAGE_SECURITY_INSTRUMENT" MODIFY ("CMS_INSTRUMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SECURITY_INSTRUMENT" MODIFY ("CMS_COLLATERAL_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SECURITY_INSTRUMENT" ADD CONSTRAINT "SEC_INSTRUMT_ST_PK" PRIMARY KEY ("CMS_INSTRUMENT_ID")
  USING INDEX "SEC_INSTRUMT_ST_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_SECURITY_PARAMETER
--------------------------------------------------------

  ALTER TABLE "STAGE_SECURITY_PARAMETER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SECURITY_PARAMETER" ADD CONSTRAINT "PK_STG_SEC_PARAM" PRIMARY KEY ("ID")
  USING INDEX "PK_STG_SEC_PARAM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_SEC_PLDGR_MAP
--------------------------------------------------------

  ALTER TABLE "STAGE_SEC_PLDGR_MAP" MODIFY ("CMS_SEC_PLDGR_MAP_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_SEC_PLDGR_MAP" ADD CONSTRAINT "SQL080609120032200" PRIMARY KEY ("CMS_SEC_PLDGR_MAP_ID")
  USING INDEX "SQL080609120032200"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_TEAM
--------------------------------------------------------

  ALTER TABLE "STAGE_TEAM" MODIFY ("TEAM_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_TEAM" ADD CONSTRAINT "PK_STAGE_TEAM" PRIMARY KEY ("TEAM_ID")
  USING INDEX "PK_STAGE_TEAM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_TEAM_CMS_SEGMENT_CODE
--------------------------------------------------------

  ALTER TABLE "STAGE_TEAM_CMS_SEGMENT_CODE" MODIFY ("CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_TEAM_CMS_SEGMENT_CODE" MODIFY ("SEGMENT_CODE" NOT NULL ENABLE);
  ALTER TABLE "STAGE_TEAM_CMS_SEGMENT_CODE" ADD CONSTRAINT "PKSTG_CMS_SGMT_COD" PRIMARY KEY ("CODE_ID")
  USING INDEX "PKSTG_CMS_SGMT_COD"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_TEAM_COUNTRY_CODE
--------------------------------------------------------

  ALTER TABLE "STAGE_TEAM_COUNTRY_CODE" MODIFY ("CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_TEAM_COUNTRY_CODE" MODIFY ("COUNTRY_CODE" NOT NULL ENABLE);
  ALTER TABLE "STAGE_TEAM_COUNTRY_CODE" ADD CONSTRAINT "PK_STG_TEAM_CY_COD" PRIMARY KEY ("CODE_ID")
  USING INDEX "PK_STG_TEAM_CY_COD"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_TEAM_FUNCTION_GRP
--------------------------------------------------------

  ALTER TABLE "STAGE_TEAM_FUNCTION_GRP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_TEAM_FUNCTION_GRP" ADD CONSTRAINT "SQL110121194554990" PRIMARY KEY ("ID")
  USING INDEX "SQL110121194554990"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_TEAM_MEMBER
--------------------------------------------------------

  ALTER TABLE "STAGE_TEAM_MEMBER" MODIFY ("TEAM_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_TEAM_MEMBER" ADD CONSTRAINT "PK_STAGE_MEM_ID" PRIMARY KEY ("TEAM_MEMBER_ID")
  USING INDEX "PK_STAGE_MEM_ID"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_TEAM_MEMBERSHIP
--------------------------------------------------------

  ALTER TABLE "STAGE_TEAM_MEMBERSHIP" MODIFY ("TEAM_MEMBERSHIP_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_TEAM_MEMBERSHIP" ADD CONSTRAINT "PK_STG_TEAM_MEM_ID" PRIMARY KEY ("TEAM_MEMBERSHIP_ID")
  USING INDEX "PK_STG_TEAM_MEM_ID"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_TEAM_ORGANISATION_CODE
--------------------------------------------------------

  ALTER TABLE "STAGE_TEAM_ORGANISATION_CODE" MODIFY ("CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_TEAM_ORGANISATION_CODE" MODIFY ("ORGANISATION_CODE" NOT NULL ENABLE);
  ALTER TABLE "STAGE_TEAM_ORGANISATION_CODE" ADD CONSTRAINT "PK_STG_TEAM_ORGCOD" PRIMARY KEY ("CODE_ID")
  USING INDEX "PK_STG_TEAM_ORGCOD"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_TEAM_ORG_GROUP_CODE
--------------------------------------------------------

  ALTER TABLE "STAGE_TEAM_ORG_GROUP_CODE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_TEAM_ORG_GROUP_CODE" MODIFY ("ORG_GROUP_CODE" NOT NULL ENABLE);
  ALTER TABLE "STAGE_TEAM_ORG_GROUP_CODE" ADD CONSTRAINT "STG_TEAM_ORG_GRP" PRIMARY KEY ("ID")
  USING INDEX "STG_TEAM_ORG_GRP"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_TEAM_SEGMENT_CODE
--------------------------------------------------------

  ALTER TABLE "STAGE_TEAM_SEGMENT_CODE" MODIFY ("CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_TEAM_SEGMENT_CODE" MODIFY ("SEGMENT_CODE" NOT NULL ENABLE);
  ALTER TABLE "STAGE_TEAM_SEGMENT_CODE" ADD CONSTRAINT "PKSTG_TEM_SGMT_COD" PRIMARY KEY ("CODE_ID")
  USING INDEX "PKSTG_TEM_SGMT_COD"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_USER
--------------------------------------------------------

  ALTER TABLE "STAGE_USER" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_USER" ADD CONSTRAINT "PK_STAGE_USER" PRIMARY KEY ("USER_ID")
  USING INDEX "PK_STAGE_USER"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_WAIVER_GENERATED
--------------------------------------------------------

  ALTER TABLE "STAGE_WAIVER_GENERATED" MODIFY ("WAIVER_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_WAIVER_GENERATED" ADD CONSTRAINT "STAGE_WAIVER_GEN" PRIMARY KEY ("WAIVER_ID")
  USING INDEX "STAGE_WAIVER_GEN"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STAGE_WAIVER_GENERATED_ITEM
--------------------------------------------------------

  ALTER TABLE "STAGE_WAIVER_GENERATED_ITEM" MODIFY ("WAIVER_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STAGE_WAIVER_GENERATED_ITEM" ADD CONSTRAINT "STAG_WAIVE_GEN_ITM" PRIMARY KEY ("WAIVER_ITEM_ID")
  USING INDEX "STAG_WAIVE_GEN_ITM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STGE_TEMP_IMAGE_UPLOAD
--------------------------------------------------------

  ALTER TABLE "STGE_TEMP_IMAGE_UPLOAD" MODIFY ("IMG_ID" NOT NULL ENABLE);
  ALTER TABLE "STGE_TEMP_IMAGE_UPLOAD" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "STGE_TEMP_IMAGE_UPLOAD" ADD PRIMARY KEY ("IMG_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STG_CHECK_ITEM_BKP_23052014
--------------------------------------------------------

  ALTER TABLE "STG_CHECK_ITEM_BKP_23052014" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STG_CHECK_ITEM_BKP_23052014" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STG_EXC_LINE_FR_STP_SRM
--------------------------------------------------------

  ALTER TABLE "STG_EXC_LINE_FR_STP_SRM" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "STG_EXC_LINE_FR_STP_SRM" MODIFY ("LINE_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STG_LIST_BKP_23052014
--------------------------------------------------------

  ALTER TABLE "STG_LIST_BKP_23052014" MODIFY ("CHECKLIST_ID" NOT NULL ENABLE);
  ALTER TABLE "STG_LIST_BKP_23052014" MODIFY ("VERSION_TIME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STG_LIST_ITEM_BKP_23052014
--------------------------------------------------------

  ALTER TABLE "STG_LIST_ITEM_BKP_23052014" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "STG_LIST_ITEM_BKP_23052014" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STG_SPEC_COVENANT_DETAILS
--------------------------------------------------------

  ALTER TABLE "STG_SPEC_COVENANT_DETAILS" MODIFY ("COVENANT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STG_SPEC_LINE_COVENANT_DETAILS
--------------------------------------------------------

  ALTER TABLE "STG_SPEC_LINE_COVENANT_DETAILS" MODIFY ("COVENANT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STP_ERROR_CODE_MAP
--------------------------------------------------------

  ALTER TABLE "STP_ERROR_CODE_MAP" MODIFY ("ERROR_CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "STP_ERROR_CODE_MAP" MODIFY ("ERROR_CODE" NOT NULL ENABLE);
  ALTER TABLE "STP_ERROR_CODE_MAP" ADD CONSTRAINT "STP_COMMON_ERR_PK" PRIMARY KEY ("ERROR_CODE_ID")
  USING INDEX "STP_COMMON_ERR_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STP_MASTER_TRANS
--------------------------------------------------------

  ALTER TABLE "STP_MASTER_TRANS" MODIFY ("MASTER_TRX_ID" NOT NULL ENABLE);
  ALTER TABLE "STP_MASTER_TRANS" ADD CONSTRAINT "SQL110121194557460" PRIMARY KEY ("MASTER_TRX_ID")
  USING INDEX "SQL110121194557460"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STP_TRANS
--------------------------------------------------------

  ALTER TABLE "STP_TRANS" MODIFY ("TRX_ID" NOT NULL ENABLE);
  ALTER TABLE "STP_TRANS" ADD CONSTRAINT "SQL110121194557580" PRIMARY KEY ("TRX_ID")
  USING INDEX "SQL110121194557580"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STP_TRANS_ERROR
--------------------------------------------------------

  ALTER TABLE "STP_TRANS_ERROR" MODIFY ("ERROR_ID" NOT NULL ENABLE);
  ALTER TABLE "STP_TRANS_ERROR" ADD CONSTRAINT "SQL110121194557740" PRIMARY KEY ("ERROR_ID")
  USING INDEX "SQL110121194557740"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STP_TRANS_HISTORY
--------------------------------------------------------

  ALTER TABLE "STP_TRANS_HISTORY" MODIFY ("TRX_HISTORY_ID" NOT NULL ENABLE);
  ALTER TABLE "STP_TRANS_HISTORY" MODIFY ("TRX_ID" NOT NULL ENABLE);
  ALTER TABLE "STP_TRANS_HISTORY" ADD CONSTRAINT "SQL110121194557690" PRIMARY KEY ("TRX_HISTORY_ID")
  USING INDEX "SQL110121194557690"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T20110401_142622
--------------------------------------------------------

  ALTER TABLE "T20110401_142622" MODIFY ("FEED_ID" NOT NULL ENABLE);
  ALTER TABLE "T20110401_142622" MODIFY ("BUY_CURRENCY" NOT NULL ENABLE);
  ALTER TABLE "T20110401_142622" MODIFY ("SELL_CURRENCY" NOT NULL ENABLE);
  ALTER TABLE "T20110401_142622" MODIFY ("BUY_UNIT" NOT NULL ENABLE);
  ALTER TABLE "T20110401_142622" MODIFY ("EFFECTIVE_DATE" NOT NULL ENABLE);
  ALTER TABLE "T20110401_142622" MODIFY ("SELL_UNIT" NOT NULL ENABLE);
  ALTER TABLE "T20110401_142622" MODIFY ("CMS_VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "T20110401_142622" MODIFY ("FEED_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T20110401_142622_EXCEPTION
--------------------------------------------------------

  ALTER TABLE "T20110401_142622_EXCEPTION" MODIFY ("FEED_ID" NOT NULL ENABLE);
  ALTER TABLE "T20110401_142622_EXCEPTION" MODIFY ("BUY_CURRENCY" NOT NULL ENABLE);
  ALTER TABLE "T20110401_142622_EXCEPTION" MODIFY ("SELL_CURRENCY" NOT NULL ENABLE);
  ALTER TABLE "T20110401_142622_EXCEPTION" MODIFY ("BUY_UNIT" NOT NULL ENABLE);
  ALTER TABLE "T20110401_142622_EXCEPTION" MODIFY ("EFFECTIVE_DATE" NOT NULL ENABLE);
  ALTER TABLE "T20110401_142622_EXCEPTION" MODIFY ("SELL_UNIT" NOT NULL ENABLE);
  ALTER TABLE "T20110401_142622_EXCEPTION" MODIFY ("CMS_VERSION_TIME" NOT NULL ENABLE);
  ALTER TABLE "T20110401_142622_EXCEPTION" MODIFY ("FEED_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T20110504_080952
--------------------------------------------------------

  ALTER TABLE "T20110504_080952" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T20110504_080952_EXCEPTION
--------------------------------------------------------

  ALTER TABLE "T20110504_080952_EXCEPTION" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "T20110504_080952_EXCEPTION" MODIFY ("REVALUATION_FREQUENCY_DAYS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TEMP_AP
--------------------------------------------------------

  ALTER TABLE "TEMP_AP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "TEMP_AP" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "TEMP_AP" MODIFY ("PLACE" NOT NULL ENABLE);
  ALTER TABLE "TEMP_AP" ADD CONSTRAINT "CC1298870684357" PRIMARY KEY ("ID")
  USING INDEX "CC1298870684357"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TEMP_CHECKLIST_ITEM
--------------------------------------------------------

  ALTER TABLE "TEMP_CHECKLIST_ITEM" MODIFY ("DOC_ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "TEMP_CHECKLIST_ITEM" MODIFY ("DOC_ITEM_REF" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TEMP_CMS_GENERAL_PARAM
--------------------------------------------------------

  ALTER TABLE "TEMP_CMS_GENERAL_PARAM" MODIFY ("PARAM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TEMP_COMMON_CODE_CATEGORY_ENTR
--------------------------------------------------------

  ALTER TABLE "TEMP_COMMON_CODE_CATEGORY_ENTR" MODIFY ("ENTRY_ID" NOT NULL ENABLE);
  ALTER TABLE "TEMP_COMMON_CODE_CATEGORY_ENTR" MODIFY ("ENTRY_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TEST_MASTER
--------------------------------------------------------

  ALTER TABLE "TEST_MASTER" MODIFY ("ITEMID" NOT NULL ENABLE);
  ALTER TABLE "TEST_MASTER" MODIFY ("ITEM_CODE" NOT NULL ENABLE);
  ALTER TABLE "TEST_MASTER" MODIFY ("ITEM_NAME" NOT NULL ENABLE);
  ALTER TABLE "TEST_MASTER" MODIFY ("ITEM_TYPE" NOT NULL ENABLE);
  ALTER TABLE "TEST_MASTER" MODIFY ("ITEM_STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANSACTION
--------------------------------------------------------

  ALTER TABLE "TRANSACTION" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANSACTION_1
--------------------------------------------------------

  ALTER TABLE "TRANSACTION_1" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANSACTION_1406
--------------------------------------------------------

  ALTER TABLE "TRANSACTION_1406" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANSACTION_19122013
--------------------------------------------------------

  ALTER TABLE "TRANSACTION_19122013" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANSACTION_24JUL
--------------------------------------------------------

  ALTER TABLE "TRANSACTION_24JUL" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANSACTION_BK_01
--------------------------------------------------------

  ALTER TABLE "TRANSACTION_BK_01" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANSACTION_BK_02
--------------------------------------------------------

  ALTER TABLE "TRANSACTION_BK_02" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANSACTION_BK_3813
--------------------------------------------------------

  ALTER TABLE "TRANSACTION_BK_3813" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANSACTION_QC
--------------------------------------------------------

  ALTER TABLE "TRANSACTION_QC" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANSACTION_TYPE_NAME
--------------------------------------------------------

  ALTER TABLE "TRANSACTION_TYPE_NAME" MODIFY ("TRANSACTION_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANSHISTORY_24JUL
--------------------------------------------------------

  ALTER TABLE "TRANSHISTORY_24JUL" MODIFY ("TR_HISTORY_ID" NOT NULL ENABLE);
  ALTER TABLE "TRANSHISTORY_24JUL" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANS_HISTORY
--------------------------------------------------------

  ALTER TABLE "TRANS_HISTORY" MODIFY ("TR_HISTORY_ID" NOT NULL ENABLE);
  ALTER TABLE "TRANS_HISTORY" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
  ALTER TABLE "TRANS_HISTORY" ADD CONSTRAINT "CC1169796995914" PRIMARY KEY ("TR_HISTORY_ID")
  USING INDEX "CC1169796995914"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TRANS_HISTORY_19122013
--------------------------------------------------------

  ALTER TABLE "TRANS_HISTORY_19122013" MODIFY ("TR_HISTORY_ID" NOT NULL ENABLE);
  ALTER TABLE "TRANS_HISTORY_19122013" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANS_HISTORY_BK_01
--------------------------------------------------------

  ALTER TABLE "TRANS_HISTORY_BK_01" MODIFY ("TR_HISTORY_ID" NOT NULL ENABLE);
  ALTER TABLE "TRANS_HISTORY_BK_01" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANS_HISTORY_BK_02
--------------------------------------------------------

  ALTER TABLE "TRANS_HISTORY_BK_02" MODIFY ("TR_HISTORY_ID" NOT NULL ENABLE);
  ALTER TABLE "TRANS_HISTORY_BK_02" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANS_HISTORY_BK_3813
--------------------------------------------------------

  ALTER TABLE "TRANS_HISTORY_BK_3813" MODIFY ("TR_HISTORY_ID" NOT NULL ENABLE);
  ALTER TABLE "TRANS_HISTORY_BK_3813" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANS_HISTORY_QC
--------------------------------------------------------

  ALTER TABLE "TRANS_HISTORY_QC" MODIFY ("TR_HISTORY_ID" NOT NULL ENABLE);
  ALTER TABLE "TRANS_HISTORY_QC" MODIFY ("TRANSACTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRX_TYPE_REPORT
--------------------------------------------------------

  ALTER TABLE "TRX_TYPE_REPORT" MODIFY ("TRANSACTION_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TR_STATE_MATRIX
--------------------------------------------------------

  ALTER TABLE "TR_STATE_MATRIX" MODIFY ("STATEID" NOT NULL ENABLE);
  ALTER TABLE "TR_STATE_MATRIX" MODIFY ("STATEINS" NOT NULL ENABLE);
  ALTER TABLE "TR_STATE_MATRIX" MODIFY ("OPERATION" NOT NULL ENABLE);
  ALTER TABLE "TR_STATE_MATRIX" MODIFY ("FROMSTATE" NOT NULL ENABLE);
  ALTER TABLE "TR_STATE_MATRIX" MODIFY ("TOSTATE" NOT NULL ENABLE);
  ALTER TABLE "TR_STATE_MATRIX" MODIFY ("USERSTATE" NOT NULL ENABLE);
  ALTER TABLE "TR_STATE_MATRIX" MODIFY ("ENABLEIND" NOT NULL ENABLE);
  ALTER TABLE "TR_STATE_MATRIX" MODIFY ("FRONTENDOP" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TR_STATE_MATRIX_1707
--------------------------------------------------------

  ALTER TABLE "TR_STATE_MATRIX_1707" MODIFY ("STATEID" NOT NULL ENABLE);
  ALTER TABLE "TR_STATE_MATRIX_1707" MODIFY ("STATEINS" NOT NULL ENABLE);
  ALTER TABLE "TR_STATE_MATRIX_1707" MODIFY ("OPERATION" NOT NULL ENABLE);
  ALTER TABLE "TR_STATE_MATRIX_1707" MODIFY ("FROMSTATE" NOT NULL ENABLE);
  ALTER TABLE "TR_STATE_MATRIX_1707" MODIFY ("TOSTATE" NOT NULL ENABLE);
  ALTER TABLE "TR_STATE_MATRIX_1707" MODIFY ("USERSTATE" NOT NULL ENABLE);
  ALTER TABLE "TR_STATE_MATRIX_1707" MODIFY ("ENABLEIND" NOT NULL ENABLE);
  ALTER TABLE "TR_STATE_MATRIX_1707" MODIFY ("FRONTENDOP" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TR_STSTE_MATRIX_3008
--------------------------------------------------------

  ALTER TABLE "TR_STSTE_MATRIX_3008" MODIFY ("STATEID" NOT NULL ENABLE);
  ALTER TABLE "TR_STSTE_MATRIX_3008" MODIFY ("STATEINS" NOT NULL ENABLE);
  ALTER TABLE "TR_STSTE_MATRIX_3008" MODIFY ("OPERATION" NOT NULL ENABLE);
  ALTER TABLE "TR_STSTE_MATRIX_3008" MODIFY ("FROMSTATE" NOT NULL ENABLE);
  ALTER TABLE "TR_STSTE_MATRIX_3008" MODIFY ("TOSTATE" NOT NULL ENABLE);
  ALTER TABLE "TR_STSTE_MATRIX_3008" MODIFY ("USERSTATE" NOT NULL ENABLE);
  ALTER TABLE "TR_STSTE_MATRIX_3008" MODIFY ("ENABLEIND" NOT NULL ENABLE);
  ALTER TABLE "TR_STSTE_MATRIX_3008" MODIFY ("FRONTENDOP" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USER_DELETED_NOTIFICATION
--------------------------------------------------------

  ALTER TABLE "USER_DELETED_NOTIFICATION" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "USER_DELETED_NOTIFICATION" MODIFY ("NOTIFICATION_ID" NOT NULL ENABLE);
  ALTER TABLE "USER_DELETED_NOTIFICATION" MODIFY ("DELETED_DATE" NOT NULL ENABLE);
  ALTER TABLE "USER_DELETED_NOTIFICATION" ADD CONSTRAINT "PK_USER_NOTIFI" PRIMARY KEY ("USER_ID", "NOTIFICATION_ID")
  USING INDEX "PK_USER_NOTIFI"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CMS_DISC_FACILITY_LIST
--------------------------------------------------------

  ALTER TABLE "CMS_DISC_FACILITY_LIST" ADD FOREIGN KEY ("DISCREPENCY_ID")
	  REFERENCES "CMS_DISCREPENCY" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CMS_LAD_DETAIL
--------------------------------------------------------

  ALTER TABLE "CMS_LAD_DETAIL" ADD CONSTRAINT "SYS_C00363534" FOREIGN KEY ("FILTER_ID")
	  REFERENCES "CMS_LAD_FILTER" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CMS_STAGE_CITY
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_CITY" ADD FOREIGN KEY ("STATE_ID")
	  REFERENCES "CMS_STATE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CMS_STAGE_DISC_FAC_LIST
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_DISC_FAC_LIST" ADD FOREIGN KEY ("DISCREPENCY_ID")
	  REFERENCES "CMS_STAGE_DISCREPENCY" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CMS_STAGE_REGION
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_REGION" ADD FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "CMS_COUNTRY" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CMS_STAGE_STATE
--------------------------------------------------------

  ALTER TABLE "CMS_STAGE_STATE" ADD FOREIGN KEY ("REGION_ID")
	  REFERENCES "CMS_REGION" ("ID") ENABLE;
