--------------------------------------------------------
--  File created - Thursday-March-24-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Index ACCOUNT_SEC_MAP_IDX1
--------------------------------------------------------

  CREATE INDEX "ACCOUNT_SEC_MAP_IDX1" ON "CMS_ACCOUNT_SEC_MAP" ("CMS_LSP_SYS_XREF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index AC_PF_RTP_I1
--------------------------------------------------------

  CREATE INDEX "AC_PF_RTP_I1" ON "OFA_ACCESS_PROFILE_ROLETYPE" ("ACCESS_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index AGREEMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AGREEMENT_PK" ON "CMS_TRADING_AGREEMENT" ("AGREEMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index AGREEMENT_ST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AGREEMENT_ST_PK" ON "CMS_STAGE_TRADING_AGREEMENT" ("AGREEMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index AL_SUBTYPE_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AL_SUBTYPE_ID_PK" ON "CMS_SECURITY_ASSET_LIFE" ("SECURITY_SUB_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index AL_SUBTYPE_SEQ_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AL_SUBTYPE_SEQ_PK" ON "CMS_STAGE_SECURITY_ASSET_LIFE" ("SECURITY_SUB_TYPE_SEQ") 
  ;
--------------------------------------------------------
--  DDL for Index APPLICATIONSI
--------------------------------------------------------

  CREATE UNIQUE INDEX "APPLICATIONSI" ON "APPLICATIONS" ("APPLICATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ARG_I1
--------------------------------------------------------

  CREATE INDEX "ARG_I1" ON "EXPLAIN_ARGUMENT" ("EXPLAIN_LEVEL", "EXPLAIN_TIME", "OPERATOR_ID", "SECTNO", "STMTNO") 
  ;
--------------------------------------------------------
--  DDL for Index ASM_IDX1
--------------------------------------------------------

  CREATE INDEX "ASM_IDX1" ON "CMS_ACCOUNT_SEC_MAP" ("ASM_EXT_SYS_ACCOUNT_NUM", "ASM_EXT_SYS_ACCOUNT_SEQ", "ASM_SRC_SECURITY_ID", "CMS_COLLATERAL_ID", "CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ASSET_AIRCRAFT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ASSET_AIRCRAFT_PK" ON "CMS_ASSET_AIRCRAFT" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ASSET_GOLD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ASSET_GOLD_PK" ON "CMS_ASSET_GOLD" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ASSET_PDC_I1
--------------------------------------------------------

  CREATE INDEX "ASSET_PDC_I1" ON "CMS_ASSET_PDC" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ASSET_PLANT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ASSET_PLANT_PK" ON "CMS_ASSET_PLANT_EQUIP" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ASSET_TRADE_IN_IDX1
--------------------------------------------------------

  CREATE INDEX "ASSET_TRADE_IN_IDX1" ON "CMS_ASSET_TRADE_IN" ("COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index AST_GC_DBT_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "AST_GC_DBT_U1" ON "CMS_ASST_GC_DEBTOR" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index AST_GC_FXO_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "AST_GC_FXO_U1" ON "CMS_ASST_GC_FXASST_OTHR" ("CMS_COLLATERAL_ID", "FXASST_OTHR_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index AST_GC_INF_I1
--------------------------------------------------------

  CREATE INDEX "AST_GC_INF_I1" ON "CMS_ASST_GC_INSR_FAO_MAP" ("CMS_COLLATERAL_ID", "FXASST_OTHR_ID", "INSR_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index AST_GC_INS_I1
--------------------------------------------------------

  CREATE INDEX "AST_GC_INS_I1" ON "CMS_ASST_GC_INSR_STK_MAP" ("INSR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index AST_GC_INS_I2
--------------------------------------------------------

  CREATE INDEX "AST_GC_INS_I2" ON "CMS_ASST_GC_INSR_STK_MAP" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index AST_GC_STK_I1
--------------------------------------------------------

  CREATE INDEX "AST_GC_STK_I1" ON "CMS_ASST_GC_STOCK" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index AST_GC_STK_I2
--------------------------------------------------------

  CREATE INDEX "AST_GC_STK_I2" ON "CMS_ASST_GC_STOCK" ("NEXT_PHY_INSPECT_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index AST_GC_STK_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "AST_GC_STK_U1" ON "CMS_ASST_GC_STOCK" ("CMS_COLLATERAL_ID", "STATUS", "STOCK_ID") 
  ;
--------------------------------------------------------
--  DDL for Index AST_GS_INS_I3
--------------------------------------------------------

  CREATE INDEX "AST_GS_INS_I3" ON "CMS_ASST_GC_INSR_STK_MAP" ("CMS_COLLATERAL_ID", "INSR_ID", "STATUS", "STOCK_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BCH_DDN_DOC_I1
--------------------------------------------------------

  CREATE INDEX "BCH_DDN_DOC_I1" ON "CMS_BATCH_DDN_DOC" ("DDN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BFL_TAT_PRM_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "BFL_TAT_PRM_U1" ON "CMS_BFL_TAT_PARAM" ("BCA_TYPE", "BFL_TYPE", "COUNTRY", "SEGMENT") 
  ;
--------------------------------------------------------
--  DDL for Index BKG_LOC_EXT_SYSMAP
--------------------------------------------------------

  CREATE UNIQUE INDEX "BKG_LOC_EXT_SYSMAP" ON "SCI_BKG_LOCTN_EXT_SYS_MAP" ("BKX_BKG_EXT_SYS_MAP_ID", "BKX_BKG_LOCTN_ID", "BKX_EXT_SYS_CODE_NUM", "BKX_EXT_SYS_CODE_VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index BL_BUL_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_BUL_ID_PK" ON "CMS_BL_BUILDUP" ("BUILDUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_DEV_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_DEV_ID_PK" ON "CMS_BL_DEVELOPMENT_DOCUMENT" ("DEV_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_DISB_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_DISB_ID_PK" ON "CMS_BL_DISBURSEMENT" ("DISBURSEMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_DIS_DTL_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_DIS_DTL_ID_PK" ON "CMS_BL_DISBURSEMENT_DETAIL" ("DISBURSE_DETAIL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_FDR_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_FDR_ID_PK" ON "CMS_BL_FDR" ("FDR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_PROJ_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_PROJ_ID_PK" ON "CMS_BRIDGING_LOAN" ("PROJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_PROP_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_PROP_ID_PK" ON "CMS_BL_PROPERTY_TYPE" ("PROPERTY_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_SALE_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_SALE_ID_PK" ON "CMS_BL_SALES_PROCEEDS" ("PROCEEDS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_SCHD_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_SCHD_ID_PK" ON "CMS_BL_PROJECT_SCHEDULE" ("SCHEDULE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_SETT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_SETT_ID_PK" ON "CMS_BL_SETTLEMENT" ("SETTLEMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_STG_BUL_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_STG_BUL_ID_PK" ON "CMS_STAGE_BL_BUILDUP" ("BUILDUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_STG_DEV_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_STG_DEV_ID_PK" ON "CMS_STAGE_BL_DEVELOPMENT_DOCS" ("DEV_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_STG_DISB_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_STG_DISB_ID_PK" ON "CMS_STAGE_BL_DISBURSEMENT" ("DISBURSEMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_STG_DIS_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_STG_DIS_DTL_PK" ON "CMS_STAGE_BL_DISBURSEMENT_DETS" ("DISBURSE_DETAIL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_STG_FDR_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_STG_FDR_ID_PK" ON "CMS_STAGE_BL_FDR" ("FDR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_STG_PROJ_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_STG_PROJ_ID_PK" ON "CMS_STAGE_BRIDGING_LOAN" ("PROJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_STG_PROP_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_STG_PROP_ID_PK" ON "CMS_STAGE_BL_PROPERTY_TYPE" ("PROPERTY_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_STG_SALE_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_STG_SALE_ID_PK" ON "CMS_STAGE_BL_SALES_PROCEEDS" ("PROCEEDS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_STG_SCHD_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_STG_SCHD_ID_PK" ON "CMS_STAGE_BL_PROJECT_SCHEDULE" ("SCHEDULE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BL_STG_SETT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BL_STG_SETT_ID_PK" ON "CMS_STAGE_BL_SETTLEMENT" ("SETTLEMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BUS_PARAM_I1
--------------------------------------------------------

  CREATE INDEX "BUS_PARAM_I1" ON "BUS_PARAM" ("GROUP_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index C24082010001
--------------------------------------------------------

  CREATE UNIQUE INDEX "C24082010001" ON "CMS_GENERAL_PARAM_GROUP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CASH_DEP_I1
--------------------------------------------------------

  CREATE INDEX "CASH_DEP_I1" ON "CMS_CASH_DEPOSIT" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CASH_DEP_I2
--------------------------------------------------------

  CREATE INDEX "CASH_DEP_I2" ON "CMS_CASH_DEPOSIT" ("DEPOSIT_RECEIPT_NUMBER", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CASH_MARGIN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CASH_MARGIN_PK" ON "CMS_CASH_MARGIN" ("CASH_MARGIN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CASH_MARGIN_ST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CASH_MARGIN_ST_PK" ON "CMS_STAGE_CASH_MARGIN" ("CASH_MARGIN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CB_LMT_I1
--------------------------------------------------------

  CREATE INDEX "CB_LMT_I1" ON "SCI_LSP_CO_BORROW_LMT" ("CMS_LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CB_LMT_I2
--------------------------------------------------------

  CREATE INDEX "CB_LMT_I2" ON "SCI_LSP_CO_BORROW_LMT" ("LCL_COBO_LE_ID", "LCL_LE_ID", "LCL_LLP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CB_LMT_I3
--------------------------------------------------------

  CREATE INDEX "CB_LMT_I3" ON "SCI_LSP_CO_BORROW_LMT" ("CMS_CUSTOMER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CB_LMT_MAP_I1
--------------------------------------------------------

  CREATE INDEX "CB_LMT_MAP_I1" ON "SCI_LSP_COBO_LMT_XREF_MAP" ("LCX_LE_ID", "LCX_LSP_ID", "LCX_LSX_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CB_LMT_MAP_I2
--------------------------------------------------------

  CREATE INDEX "CB_LMT_MAP_I2" ON "SCI_LSP_COBO_LMT_XREF_MAP" ("CMS_LSP_SYS_XREF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169518086845
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169518086845" ON "BUS_PARAM" ("PARAMETER_PK") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169518725764
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169518725764" ON "BUS_PARAM_GRP" ("GROUP_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169518763546
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169518763546" ON "STAGE_ASSET_TRADE_IN" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169518763547
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169518763547" ON "CMS_ASSET_TRADE_IN" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169518763548
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169518763548" ON "CMS_ASSET" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169518793221
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169518793221" ON "CMS_ASSET_PDC" ("ASSET_PDC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169518832477
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169518832477" ON "CMS_ASST_GC_DEBTOR" ("CMS_ASST_GC_DEBTOR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169518861569
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169518861569" ON "CMS_ASST_GC_FXASST_OTHR" ("CMS_ASST_GC_FAO_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169518981111
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169518981111" ON "CMS_ASST_GC_INSR_FAO_MAP" ("CMS_ASST_GC_INSR_FAO_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169519020267
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169519020267" ON "CMS_ASST_GC_INSR_STK_MAP" ("CMS_ASST_GC_INSR_STK_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169519151916
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169519151916" ON "CMS_ASST_GC_STOCK" ("CMS_ASST_GC_STOCK_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169519191203
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169519191203" ON "CMS_AUTHENTICATION" ("LOGIN_ID", "ROLE") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169519257048
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169519257048" ON "CMS_BATCH_DDN_DOC" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169519325856
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169519325856" ON "CMS_BCA_COBORROWER_MAP" ("CMS_LSP_LMT_PROFILE_ID", "CMS_CUSTOMER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169519364312
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169519364312" ON "CMS_BCA_PLEDGOR_MAP" ("CMS_LSP_LMT_PROFILE_ID", "CMS_PLEDGOR_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169519421834
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169519421834" ON "CMS_BFL_TAT_PARAM" ("BFL_TAT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169519529319
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169519529319" ON "CMS_CASH" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169519611487
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169519611487" ON "CMS_CASH_DEPOSIT" ("CASH_DEPOSIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169519976572
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169519976572" ON "CMS_CC_DOC_LOC" ("DOC_LOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520029338
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520029338" ON "CMS_CC_TASK" ("TASK_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520156401
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520156401" ON "CMS_CCC_GENERATED" ("CCC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520268552
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520268552" ON "CMS_CCC_GENERATED_ITEM" ("CCC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520355417
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520355417" ON "CMS_CHECKLIST" ("CHECKLIST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520399821
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520399821" ON "CMS_CHECKLIST_ITEM" ("DOC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520425798
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520425798" ON "CMS_CHECKLIST_ITEM_SHARE" ("CHECKLIST_ITEM_SHARE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520620869
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520620869" ON "CMS_CMDT_APPV" ("APPV_COMMODITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520665913
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520665913" ON "CMS_CMDT_BUYER" ("BUYER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520685892
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520685892" ON "CMS_CMDT_CNTR" ("CONTRACT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520729515
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520729515" ON "CMS_CMDT_DEAL" ("DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520758587
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520758587" ON "CMS_CMDT_LOAN" ("LOAN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520792305
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520792305" ON "CMS_CMDT_PRICE" ("COMMODITY_PRICE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520814397
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520814397" ON "CMS_CMDT_PROFILE" ("PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520849587
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520849587" ON "CMS_CMDT_SUB_LMT" ("SUB_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520870778
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520870778" ON "CMS_CMDT_SUB_LMT_TYPE" ("SUB_LMT_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520902313
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520902313" ON "CMS_CMDT_SUPPLIER" ("SUPPLIER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169520979404
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169520979404" ON "CMS_CMDT_UOM" ("COMMODITY_UOM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521002077
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521002077" ON "CMS_CMDT_WRHSE" ("WAREHOUSE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521024179
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521024179" ON "CMS_COLLATERAL_TASK" ("TASK_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521049034
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521049034" ON "CMS_COMMODITY" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521077916
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521077916" ON "CMS_CONVENANT" ("CONVENANT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521102551
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521102551" ON "CMS_CONVENANT_SUB_ITEM" ("SUB_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521131082
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521131082" ON "CMS_CUST_DOC" ("CUSTODIAN_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521159103
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521159103" ON "CMS_CUSTODIAN_AUTHORIZER" ("CUSTODIAN_AUTHZ_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521186492
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521186492" ON "CMS_CUSTODIAN_DOC" ("CUSTODIAN_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521229103
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521229103" ON "CMS_DAP_COUNTRY" ("DAP_COUNTRY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521250174
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521250174" ON "CMS_DATA_ACCESS" ("DATA_ACCESS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521274839
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521274839" ON "CMS_DDN_GENERATED" ("DDN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521296130
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521296130" ON "CMS_DDN_GENERATED_ITEM" ("DDN_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521334375
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521334375" ON "CMS_DEAL_CASH" ("CASH_DEPOSIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521361554
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521361554" ON "CMS_DEFERRAL_GENERATED" ("DEFERRAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521386319
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521386319" ON "CMS_DEFERRAL_GENERATED_ITEM" ("DEFERRAL_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521409142
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521409142" ON "CMS_DIARY_ITEM" ("ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521431454
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521431454" ON "CMS_DOCUMENT" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521454217
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521454217" ON "CMS_DOCUMENT_GLOBALLIST" ("DOCUMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521481606
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521481606" ON "CMS_DOCUMENT_ITEM" ("DOC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521509476
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521509476" ON "CMS_DOCUMENT_MASTERLIST" ("MASTERLIST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521531969
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521531969" ON "CMS_FEED_EXCEPTION" ("EXCEPTION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521576973
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521576973" ON "CMS_FINANCE_DOC" ("DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521596962
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521596962" ON "CMS_FOREX" ("FEED_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521625443
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521625443" ON "CMS_FOREX_HISTORY" ("HISTORY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521668926
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521668926" ON "CMS_GUARANTEE" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521692179
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521692179" ON "CMS_HEDGE_CNTR" ("HEDGECONTRACT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521709434
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521709434" ON "CMS_HEDGE_EXT" ("HEDGE_EXT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521731115
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521731115" ON "CMS_INSURANCE" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521760547
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521760547" ON "CMS_INSURANCE_CDS" ("CDS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521793064
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521793064" ON "CMS_INSURANCE_POLICY" ("INSURANCE_POLICY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521817670
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521817670" ON "CMS_LIMIT_CHARGE_MAP" ("LIMIT_CHARGE_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521847312
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521847312" ON "CMS_LIMIT_SECURITY_MAP" ("CHARGE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521872979
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521872979" ON "CMS_LOAN_GUARANTOR" ("GUARANTOR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169521909462
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169521909462" ON "CMS_LOAN_LMT" ("LOAN_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169522271182
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169522271182" ON "CMS_LOAN_OBLIGOR" ("OBLIGOR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169522773995
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169522773995" ON "CMS_LOAN_PARTICIPANT" ("PARTICIPANT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169522809015
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169522809015" ON "CMS_LOAN_PAYMT" ("EXP_PAYMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169522850024
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169522850024" ON "CMS_LOAN_SUB_LMT" ("SUB_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169522884413
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169522884413" ON "CMS_MARKETABLE_SEC" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169522912494
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169522912494" ON "CMS_MEMBERSHIP_TYPE" ("MEMBERSHIP_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169522966522
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169522966522" ON "CMS_MONITOR_DOC_CODE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169523006309
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169523006309" ON "CMS_OTHERS" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169523043692
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169523043692" ON "CMS_PASSWORD_HISTORY" ("PWD_HISTORY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169523065484
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169523065484" ON "CMS_PASSWORD_MAILER" ("PWD_MAILER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169523090219
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169523090219" ON "CMS_PASSWORD_POLICY" ("POLICY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169525464784
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169525464784" ON "CMS_PCH_SALE" ("PURCHASE_SALES_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169525537398
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169525537398" ON "CMS_PORTFOLIO_ITEM" ("ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169525574131
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169525574131" ON "CMS_PRECOND" ("PRECOND_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169525830910
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169525830910" ON "CMS_PRICE_FEED_HISTORY" ("HISTORY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169525857048
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169525857048" ON "CMS_PROPERTY" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526007144
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526007144" ON "CMS_PSCC_GENERATED" ("PSCC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526034864
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526034864" ON "CMS_PSCC_GENERATED_ITEM" ("PSCC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526105155
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526105155" ON "CMS_RCPT_RELEASE" ("RELEASE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526127737
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526127737" ON "CMS_RECURRENT_DOC" ("RECURRENT_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526151571
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526151571" ON "CMS_RECURRENT_DOC_ITEM" ("RECURRENT_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526174274
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526174274" ON "CMS_RECURRENT_DOC_SUB_ITEM" ("SUB_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526208513
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526208513" ON "CMS_REPORT_COUNTRY_MAP" ("REPORT_MASTER_ID", "COUNTRY_ISO_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526321315
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526321315" ON "CMS_REPORT_ERRLOG" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526345911
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526345911" ON "CMS_REPORT_FREQUENCY" ("REPORT_FREQUENCY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526366480
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526366480" ON "CMS_REPORT_MASTER" ("REPORT_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526387280
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526387280" ON "CMS_REPORT_REQUEST" ("REPORT_REQUEST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526404906
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526404906" ON "CMS_REPORT_TEMPLATE" ("REPORT_TEMPLATE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526426286
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526426286" ON "CMS_REV_CHECKLIST_ITEM" ("CMS_REV_CHECKLIST_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526448328
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526448328" ON "CMS_ROLE_TYPE" ("ROLETYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526474295
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526474295" ON "CMS_SCC_GENERATED" ("SCC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526826051
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526826051" ON "CMS_SCC_GENERATED_ITEM" ("SCC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169526972261
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169526972261" ON "CMS_SECURITY" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169527006901
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169527006901" ON "CMS_SECURITY_APPORTIONMENT" ("SEC_APPORTIONMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169527025318
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169527025318" ON "CMS_SECURITY_PARAMETER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169527045367
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169527045367" ON "CMS_SECURITY_SUB_TYPE" ("SECURITY_SUB_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169527064624
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169527064624" ON "CMS_SETTLEMENT" ("SETTLEMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169527086105
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169527086105" ON "CMS_SSL_TOKEN" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169527113254
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169527113254" ON "CMS_STAGE_ASSET" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169527135696
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169527135696" ON "CMS_STAGE_ASSET_PDC" ("ASSET_PDC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169527158299
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169527158299" ON "CMS_STAGE_ASST_GC_DEBTOR" ("CMS_ASST_GC_DEBTOR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169527176105
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169527176105" ON "CMS_STAGE_ASST_GC_FXASST_OTHR" ("CMS_ASST_GC_FAO_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169527203424
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169527203424" ON "CMS_STAGE_ASST_GC_INSR_FAO_MAP" ("CMS_ASST_GC_INSR_FAO_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169527226417
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169527226417" ON "CMS_STAGE_ASST_GC_INSR_STK_MAP" ("CMS_ASST_GC_INSR_STK_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169527246165
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169527246165" ON "CMS_STAGE_ASST_GC_STOCK" ("CMS_ASST_GC_STOCK_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169527270801
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169527270801" ON "CMS_STAGE_CASH" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169527291951
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169527291951" ON "CMS_STAGE_CASH_DEPOSIT" ("CASH_DEPOSIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169528324386
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169528324386" ON "CMS_STAGE_CMDT_APPV" ("APPV_COMMODITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169528347699
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169528347699" ON "CMS_STAGE_CMDT_BUYER" ("BUYER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529149032
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529149032" ON "CMS_STAGE_CMDT_CNTR" ("CONTRACT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529175710
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529175710" ON "CMS_STAGE_CMDT_DEAL" ("DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529241494
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529241494" ON "CMS_STAGE_CMDT_LOAN" ("LOAN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529272499
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529272499" ON "CMS_STAGE_CMDT_PRICE" ("COMMODITY_PRICE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529293469
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529293469" ON "CMS_STAGE_CMDT_PROFILE" ("PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529320588
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529320588" ON "CMS_STAGE_CMDT_SUB_LMT" ("SUB_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529346175
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529346175" ON "CMS_STAGE_CMDT_SUB_LMT_TYPE" ("SUB_LMT_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529366654
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529366654" ON "CMS_STAGE_CMDT_SUPPLIER" ("SUPPLIER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529397599
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529397599" ON "CMS_STAGE_CMDT_UOM" ("COMMODITY_UOM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529421393
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529421393" ON "CMS_STAGE_CMDT_WRHSE" ("WAREHOUSE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529446079
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529446079" ON "CMS_STAGE_COMMODITY" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529473829
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529473829" ON "CMS_STAGE_CUST_DOC" ("CUSTODIAN_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529497623
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529497623" ON "CMS_STAGE_CUST_DOC_ITEM" ("CUSTODIAN_DOC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529521657
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529521657" ON "CMS_STAGE_DEAL_CASH" ("CASH_DEPOSIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529548226
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529548226" ON "CMS_STAGE_DOCUMENT" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529690881
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529690881" ON "CMS_STAGE_FEED_GROUP" ("FEED_GROUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529712301
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529712301" ON "CMS_STAGE_FINANCE_DOC" ("DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529739821
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529739821" ON "CMS_STAGE_FOREX" ("FEED_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529763445
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529763445" ON "CMS_STAGE_GUARANTEE" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529890868
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529890868" ON "CMS_STAGE_HEDGE_CNTR" ("HEDGECONTRACT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529911848
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529911848" ON "CMS_STAGE_HEDGE_EXT" ("HEDGE_EXT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529945136
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529945136" ON "CMS_STAGE_INSURANCE" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169529972656
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169529972656" ON "CMS_STAGE_INSURANCE_CDS" ("CDS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169530004752
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169530004752" ON "CMS_STAGE_INSURANCE_POLICY" ("INSURANCE_POLICY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169530029117
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169530029117" ON "CMS_STAGE_LIMIT_CHARGE_MAP" ("LIMIT_CHARGE_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169530410485
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169530410485" ON "CMS_STAGE_LIMIT_SECURITY_MAP" ("CHARGE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169530490450
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169530490450" ON "CMS_STAGE_LOAN_GUARANTOR" ("GUARANTOR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169530512963
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169530512963" ON "CMS_STAGE_LOAN_LMT" ("LOAN_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169530565478
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169530565478" ON "CMS_STAGE_LOAN_OBLIGOR" ("OBLIGOR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169530633827
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169530633827" ON "CMS_STAGE_LOAN_PARTICIPANT" ("PARTICIPANT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169530667495
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169530667495" ON "CMS_STAGE_LOAN_PAYMT" ("EXP_PAYMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169530723105
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169530723105" ON "CMS_STAGE_LOAN_SUB_LMT" ("SUB_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169530769852
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169530769852" ON "CMS_STAGE_MARKETABLE_SEC" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169530799855
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169530799855" ON "CMS_STAGE_OTHERS" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169530956501
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169530956501" ON "CMS_STAGE_PCH_SALE" ("PURCHASE_SALES_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169530973205
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169530973205" ON "CMS_STAGE_PORTFOLIO_ITEM" ("ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169530992292
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169530992292" ON "CMS_STAGE_PRECOND" ("PRECOND_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169531012090
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169531012090" ON "CMS_STAGE_PRICE_FEED" ("FEED_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1169796995914
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1169796995914" ON "TRANS_HISTORY" ("TR_HISTORY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC11697969959141
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC11697969959141" ON "TRANS_HISTORY_USER" ("TR_HISTORY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1295352657681
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1295352657681" ON "CMS_GEOGRAPHY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1298870684357
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1298870684357" ON "TEMP_AP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1298876442489
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1298876442489" ON "CMS_BHAVCOPY" ("SC_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index CC1300527269558
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1300527269558" ON "CMS_EXCHANGE_RATE_ITEM" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1303213289630
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1303213289630" ON "CMS_CUSTOMER_DETAILS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC1303213289630_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "CC1303213289630_1" ON "CMS_STAGE_CUSTOMER_DETAILS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CCCAT_CAT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCCAT_CAT_ID_PK" ON "COMMON_CODE_CATEGORY" ("CATEGORY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CCCAT_ENT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCCAT_ENT_ID_PK" ON "COMMON_CODE_CATEGORY_ENTRY" ("ENTRY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CCC_ENT_STG_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCC_ENT_STG_ID_PK" ON "STAGE_COMMON_CODE_ENTRY" ("STAGE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CCC_GEN_I1
--------------------------------------------------------

  CREATE INDEX "CCC_GEN_I1" ON "CMS_CCC_GENERATED" ("CMS_LE_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CCC_GEN_I2
--------------------------------------------------------

  CREATE INDEX "CCC_GEN_I2" ON "CMS_CCC_GENERATED" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CCC_GEN_I3
--------------------------------------------------------

  CREATE INDEX "CCC_GEN_I3" ON "CMS_CCC_GENERATED" ("CMS_PLEDGOR_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CCC_GEN_I4
--------------------------------------------------------

  CREATE INDEX "CCC_GEN_I4" ON "CMS_CCC_GENERATED" ("CHECKLIST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CCC_GEN_I5
--------------------------------------------------------

  CREATE INDEX "CCC_GEN_I5" ON "CMS_CCC_GENERATED" ("GENERATION_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index CCC_GEN_ITM_I1
--------------------------------------------------------

  CREATE INDEX "CCC_GEN_ITM_I1" ON "CMS_CCC_GENERATED_ITEM" ("CCC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC_DOC_LOC_I1
--------------------------------------------------------

  CREATE INDEX "CC_DOC_LOC_I1" ON "CMS_CC_DOC_LOC" ("CMS_LE_SUB_PROFILE_ID", "CMS_LSP_LMT_PROFILE_ID", "CMS_PLEDGOR_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC_TASK_I1
--------------------------------------------------------

  CREATE INDEX "CC_TASK_I1" ON "CMS_CC_TASK" ("CMS_LMP_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CC_TASK_I2
--------------------------------------------------------

  CREATE INDEX "CC_TASK_I2" ON "CMS_CC_TASK" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CF_ADV_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CF_ADV_ID_PK" ON "CMS_CF_ADVANCE" ("ADVANCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CF_CONT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CF_CONT_ID_PK" ON "CMS_CONTRACT_FINANCING" ("CONTRACT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CF_FAC_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CF_FAC_ID_PK" ON "CMS_CF_FACILITY_TYPE" ("FACILITY_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CF_FDR_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CF_FDR_ID_PK" ON "CMS_CF_FDR" ("FDR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CF_PAY_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CF_PAY_ID_PK" ON "CMS_CF_PAYMENT" ("PAYMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CF_STG_ADV_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CF_STG_ADV_ID_PK" ON "CMS_STAGE_CF_ADVANCE" ("ADVANCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CF_STG_CONT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CF_STG_CONT_ID_PK" ON "CMS_STAGE_CONTRACT_FINANCING" ("CONTRACT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CF_STG_FAC_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CF_STG_FAC_ID_PK" ON "CMS_STAGE_CF_FACILITY_TYPE" ("FACILITY_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CF_STG_FDR_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CF_STG_FDR_ID_PK" ON "CMS_STAGE_CF_FDR" ("FDR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CF_STG_PAY_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CF_STG_PAY_ID_PK" ON "CMS_STAGE_CF_PAYMENT" ("PAYMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CF_STG_TNC_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CF_STG_TNC_ID_PK" ON "CMS_STAGE_CF_TERMS_CONDITIONS" ("TNC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CF_TNC_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CF_TNC_ID_PK" ON "CMS_CF_TERMS_CONDITIONS" ("TNC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CHECKLIST_CAM_CATEGORY_IDX1
--------------------------------------------------------

  CREATE INDEX "CHECKLIST_CAM_CATEGORY_IDX1" ON "CMS_CHECKLIST" ("CMS_LSP_LMT_PROFILE_ID", "CATEGORY") 
  ;
--------------------------------------------------------
--  DDL for Index CHG_DTL_I1
--------------------------------------------------------

  CREATE INDEX "CHG_DTL_I1" ON "CMS_CHARGE_DETAIL" ("CMS_COLLATERAL_ID", "SECURITY_RANK") 
  ;
--------------------------------------------------------
--  DDL for Index CHG_DTL_I2
--------------------------------------------------------

  CREATE INDEX "CHG_DTL_I2" ON "CMS_CHARGE_DETAIL" ("SCI_LAS_SEC_ID", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CHG_DTL_I3
--------------------------------------------------------

  CREATE INDEX "CHG_DTL_I3" ON "CMS_CHARGE_DETAIL" ("CHARGE_DETAIL_ID", "SOURCE_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index CHG_DTL_I4
--------------------------------------------------------

  CREATE INDEX "CHG_DTL_I4" ON "CMS_CHARGE_DETAIL" ("CHARGE_DETAIL_ID", "CMS_COLLATERAL_ID", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CHKLIST_I1
--------------------------------------------------------

  CREATE INDEX "CHKLIST_I1" ON "CMS_CHECKLIST" ("CMS_LMP_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CHKLIST_I2
--------------------------------------------------------

  CREATE INDEX "CHKLIST_I2" ON "CMS_CHECKLIST" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CHKLIST_I3
--------------------------------------------------------

  CREATE INDEX "CHKLIST_I3" ON "CMS_CHECKLIST" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CHKLIST_I4
--------------------------------------------------------

  CREATE INDEX "CHKLIST_I4" ON "CMS_CHECKLIST" ("CATEGORY", "CHECKLIST_ID", "SUB_CATEGORY") 
  ;
--------------------------------------------------------
--  DDL for Index CHKLIST_ITM_I1
--------------------------------------------------------

  CREATE INDEX "CHKLIST_ITM_I1" ON "CMS_CHECKLIST_ITEM" ("STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index CHKLIST_ITM_I2
--------------------------------------------------------

  CREATE INDEX "CHKLIST_ITM_I2" ON "CMS_CHECKLIST_ITEM" ("IS_DELETED") 
  ;
--------------------------------------------------------
--  DDL for Index CHKLIST_ITM_I3
--------------------------------------------------------

  CREATE INDEX "CHKLIST_ITM_I3" ON "CMS_CHECKLIST_ITEM" ("CHECKLIST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CHKLIST_ITM_I4
--------------------------------------------------------

  CREATE INDEX "CHKLIST_ITM_I4" ON "CMS_CHECKLIST_ITEM" ("EXPIRY_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index CHKLIST_ITM_I5
--------------------------------------------------------

  CREATE INDEX "CHKLIST_ITM_I5" ON "CMS_CHECKLIST_ITEM" ("DOCUMENT_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index CHKLIST_ITM_I6
--------------------------------------------------------

  CREATE INDEX "CHKLIST_ITM_I6" ON "CMS_CHECKLIST_ITEM" ("LAST_UPDATE_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index CHKLIST_ITM_I7
--------------------------------------------------------

  CREATE INDEX "CHKLIST_ITM_I7" ON "CMS_CHECKLIST_ITEM" ("IDENTIFY_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index CHKLIST_ITM_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHKLIST_ITM_U1" ON "CMS_CHECKLIST_ITEM" ("DOC_ITEM_REF") 
  ;
--------------------------------------------------------
--  DDL for Index CHK_DOC_ID_SUB_ITEM
--------------------------------------------------------

  CREATE INDEX "CHK_DOC_ID_SUB_ITEM" ON "CMS_LAD_SUB_ITEM" ("CHK_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CHK_ITM_SH_I1
--------------------------------------------------------

  CREATE INDEX "CHK_ITM_SH_I1" ON "CMS_CHECKLIST_ITEM_SHARE" ("CHECKLIST_ID", "DOC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CHK_ITM_SH_I2
--------------------------------------------------------

  CREATE INDEX "CHK_ITM_SH_I2" ON "CMS_CHECKLIST_ITEM_SHARE" ("STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_APPV_I1
--------------------------------------------------------

  CREATE INDEX "CMDT_APPV_I1" ON "CMS_CMDT_APPV" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_APPV_I2
--------------------------------------------------------

  CREATE INDEX "CMDT_APPV_I2" ON "CMS_CMDT_APPV" ("PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_BUY_I1
--------------------------------------------------------

  CREATE INDEX "CMDT_BUY_I1" ON "CMS_CMDT_BUYER" ("PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_CNTR_I1
--------------------------------------------------------

  CREATE INDEX "CMDT_CNTR_I1" ON "CMS_CMDT_CNTR" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_CNTR_I2
--------------------------------------------------------

  CREATE INDEX "CMDT_CNTR_I2" ON "CMS_CMDT_CNTR" ("APPV_COMMODITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_CNTR_I3
--------------------------------------------------------

  CREATE INDEX "CMDT_CNTR_I3" ON "CMS_CMDT_CNTR" ("SUPPLIER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_DEAL_I1
--------------------------------------------------------

  CREATE INDEX "CMDT_DEAL_I1" ON "CMS_CMDT_DEAL" ("CMS_LSP_CO_BORROW_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_DEAL_I2
--------------------------------------------------------

  CREATE INDEX "CMDT_DEAL_I2" ON "CMS_CMDT_DEAL" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_DEAL_I3
--------------------------------------------------------

  CREATE INDEX "CMDT_DEAL_I3" ON "CMS_CMDT_DEAL" ("HEDGE_CNTR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_DEAL_I4
--------------------------------------------------------

  CREATE INDEX "CMDT_DEAL_I4" ON "CMS_CMDT_DEAL" ("CNTR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_DEAL_I5
--------------------------------------------------------

  CREATE INDEX "CMDT_DEAL_I5" ON "CMS_CMDT_DEAL" ("CNTR_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_DEAL_I6
--------------------------------------------------------

  CREATE INDEX "CMDT_DEAL_I6" ON "CMS_CMDT_DEAL" ("CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_LOAN_I1
--------------------------------------------------------

  CREATE INDEX "CMDT_LOAN_I1" ON "CMS_CMDT_LOAN" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_PRC_I1
--------------------------------------------------------

  CREATE INDEX "CMDT_PRC_I1" ON "CMS_CMDT_PRICE" ("PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_SUB_LMT_I1
--------------------------------------------------------

  CREATE INDEX "CMDT_SUB_LMT_I1" ON "CMS_CMDT_SUB_LMT" ("CHARGE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_SUP_I1
--------------------------------------------------------

  CREATE INDEX "CMDT_SUP_I1" ON "CMS_CMDT_SUPPLIER" ("PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMDT_UOM_I1
--------------------------------------------------------

  CREATE INDEX "CMDT_UOM_I1" ON "CMS_CMDT_UOM" ("PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_AGGR_EXP_BW_BE_CUST_IDX
--------------------------------------------------------

  CREATE INDEX "CMS_AGGR_EXP_BW_BE_CUST_IDX" ON "CMS_AGGR_EXP_BW_BE_CUST" ("BANK_ENTITY") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_AGGR_EXP_BW_BE_IDX
--------------------------------------------------------

  CREATE INDEX "CMS_AGGR_EXP_BW_BE_IDX" ON "CMS_AGGR_EXP_BW_BE" ("BANK_ENTITY") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_AGGR_EXP_CTR_IDX
--------------------------------------------------------

  CREATE INDEX "CMS_AGGR_EXP_CTR_IDX" ON "CMS_AGGR_EXP_CTR" ("CTR") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_AGGR_EXP_ENTITY_IDX
--------------------------------------------------------

  CREATE INDEX "CMS_AGGR_EXP_ENTITY_IDX" ON "CMS_AGGR_EXP_ENTITY" ("CMS_LE_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_AGGR_EXP_GRP_IDX
--------------------------------------------------------

  CREATE INDEX "CMS_AGGR_EXP_GRP_IDX" ON "CMS_AGGR_EXP_GRP" ("GROUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_AGGR_EXP_POL_IDX
--------------------------------------------------------

  CREATE INDEX "CMS_AGGR_EXP_POL_IDX" ON "CMS_AGGR_EXP_POL" ("BANK_ENTITY", "POL") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_AGGR_EXP_PROD_TYPE_IDX
--------------------------------------------------------

  CREATE INDEX "CMS_AGGR_EXP_PROD_TYPE_IDX" ON "CMS_AGGR_EXP_PROD_TYPE" ("CMS_AGGR_EXP_PROD_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_ASSET_GC_STOCK_DET_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_ASSET_GC_STOCK_DET_PK" ON "CMS_ASSET_GC_STOCK_DET" ("GC_STOCK_DET_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_ASSET_GENERAL_CHRG_DE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_ASSET_GENERAL_CHRG_DE_PK" ON "CMS_ASSET_GC_DET" ("GC_DET_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_ASSET_IDX1
--------------------------------------------------------

  CREATE INDEX "CMS_ASSET_IDX1" ON "CMS_ASSET" ("CMS_COLLATERAL_ID", "REG_NO") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_ASSET_IDX2
--------------------------------------------------------

  CREATE INDEX "CMS_ASSET_IDX2" ON "CMS_ASSET" ("BRAND", "CMS_COLLATERAL_ID", "GOOD_STATUS", "MANUFACTURE_YEAR") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_ASSET_VEHICLE_IDX1
--------------------------------------------------------

  CREATE INDEX "CMS_ASSET_VEHICLE_IDX1" ON "CMS_ASSET_VEHICLE" ("CHASSIS_NUMBER", "CMS_COLLATERAL_ID", "ENGINE_NUMBER") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_ASSET_VEH_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_ASSET_VEH_PK" ON "CMS_ASSET_VEHICLE" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_ASST_VESSEL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_ASST_VESSEL_PK" ON "CMS_ASSET_VESSEL" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_CDI_PK_II
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_CDI_PK_II" ON "CMS_CUST_DOC_ITEM" ("CUSTODIAN_DOC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_CDT_PK_TI
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_CDT_PK_TI" ON "CMS_TITLEDOC_TYPE" ("TITLEDOC_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_CHK_IMG_CHK_IMG_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_CHK_IMG_CHK_IMG_IDX" ON "CMS_CHECKLIST_ITEM_IMAGE" ("CHK_ITEM_IMAGE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_CHK_ITEM_IMAGE_ID_IDX
--------------------------------------------------------

  CREATE INDEX "CMS_CHK_ITEM_IMAGE_ID_IDX" ON "CMS_CHECKLIST_ITEM_IMAGE" ("DOC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_COLLATERAL_ID_INDEX
--------------------------------------------------------

  CREATE INDEX "CMS_COLLATERAL_ID_INDEX" ON "CMS_STAGE_ASSET_GC_DET" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_COLLATERAL_ID_INDEX_1
--------------------------------------------------------

  CREATE INDEX "CMS_COLLATERAL_ID_INDEX_1" ON "CMS_STAGE_ASSET_GC_DET_1" ("CMS_COLLATERAL_ID_1") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_COL_GRP_AGGR_IDX1
--------------------------------------------------------

  CREATE INDEX "CMS_COL_GRP_AGGR_IDX1" ON "CMS_COL_GRP_AGGR" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_DEMO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_DEMO_PK" ON "CMS_DEMO" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_DOCUMENT_GLOBALLIST_INDEX2
--------------------------------------------------------

  CREATE INDEX "CMS_DOCUMENT_GLOBALLIST_INDEX2" ON "CMS_DOCUMENT_GLOBALLIST" ("DOCUMENT_ID", "CATEGORY", "DOCUMENT_DESCRIPTION", "STATEMENT_TYPE", "EXPIRY_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_DSR_PK_SI
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_DSR_PK_SI" ON "CMS_STTLMT_RCPT_MAP" ("SETTLMT_WHRCPT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_DTD_PK_DI
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_DTD_PK_DI" ON "CMS_TITLE_DOC" ("TITLE_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_DWR_PK_RI
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_DWR_PK_RI" ON "CMS_WRHSE_RCPT" ("WAREHSE_RCPT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_EODSYNC_STATUS_LOG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_EODSYNC_STATUS_LOG_PK" ON "CMS_EODSYNC_STATUS_LOG" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_EODSYNC_STATUS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_EODSYNC_STATUS_PK" ON "CMS_EODSYNC_STATUS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_EOD_STATUS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_EOD_STATUS_PK" ON "CMS_EOD_STATUS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_FAC_MASTER_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_FAC_MASTER_U1" ON "CMS_FACILITY_MASTER" ("CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_FAC_MULTI_TIER_FIN_IDX1
--------------------------------------------------------

  CREATE INDEX "CMS_FAC_MULTI_TIER_FIN_IDX1" ON "CMS_FAC_MULTI_TIER_FINANCING" ("CMS_FAC_MASTER_ID", "CMS_REF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_FAC_REL_IDX1
--------------------------------------------------------

  CREATE INDEX "CMS_FAC_REL_IDX1" ON "CMS_FAC_RELATIONSHIP" ("CMS_FAC_MASTER_ID", "CMS_REF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_FAC_REL_IDX2
--------------------------------------------------------

  CREATE INDEX "CMS_FAC_REL_IDX2" ON "CMS_FAC_RELATIONSHIP" ("CIF_NUMBER", "CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_FEE_DTL_IDX1
--------------------------------------------------------

  CREATE INDEX "CMS_FEE_DTL_IDX1" ON "CMS_FEE_DETAILS" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_GROUP_CUSTOMER_TEMP_IDX1
--------------------------------------------------------

  CREATE INDEX "CMS_GROUP_CUSTOMER_TEMP_IDX1" ON "CMS_GROUP_CUSTOMER_TEMP" ("CMS_SUB_PROFILE_ID", "GRP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_LAD_FILTER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_LAD_FILTER_PK" ON "CMS_LAD_FILTER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_LIMIT_EXPOSURE_IDX1
--------------------------------------------------------

  CREATE INDEX "CMS_LIMIT_EXPOSURE_IDX1" ON "CMS_LIMIT_EXPOSURE" ("CMS_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_LIMIT_GRP_AGGR_IDX1
--------------------------------------------------------

  CREATE INDEX "CMS_LIMIT_GRP_AGGR_IDX1" ON "CMS_LIMIT_GRP_AGGR" ("CMS_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_LINE_DTL_COL_ID_IDX
--------------------------------------------------------

  CREATE INDEX "CMS_LINE_DTL_COL_ID_IDX" ON "CMS_LINE_DETAIL" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_LINE_DTL_LINE_DTL_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_LINE_DTL_LINE_DTL_IDX" ON "CMS_LINE_DETAIL" ("LINE_DETAIL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_LPB_PK_LP
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_LPB_PK_LP" ON "LMT_PROFILE_BIZ_DAYS" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_MUTUAL_FUNDS_FEED_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_MUTUAL_FUNDS_FEED_PK" ON "CMS_MUTUAL_FUNDS_FEED" ("FEED_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_NEW_PROD_TYPE_IDX
--------------------------------------------------------

  CREATE INDEX "CMS_NEW_PROD_TYPE_IDX" ON "CMS_NEW_PROD_TYPE" ("CMS_NEW_PROD_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_PROCESS_COL_ALLOC_IDX1
--------------------------------------------------------

  CREATE INDEX "CMS_PROCESS_COL_ALLOC_IDX1" ON "CMS_PROCESS_COL_ALLOC" ("COLL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_PROPERTY_IDX1
--------------------------------------------------------

  CREATE INDEX "CMS_PROPERTY_IDX1" ON "CMS_PROPERTY" ("CMS_COLLATERAL_ID", "TITLE_NUMBER", "TITLE_NUMBER_PREFIX", "TITLE_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_PUBLIC_HOLIDAY_IDX1
--------------------------------------------------------

  CREATE INDEX "CMS_PUBLIC_HOLIDAY_IDX1" ON "CMS_PUBLIC_HOLIDAY" ("COUNTRY_ISO_CODE", "HOLIDAY_DATE", "STATE_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_SDT_PK_TI
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_SDT_PK_TI" ON "CMS_STAGE_TITLEDOC_TYPE" ("TITLEDOC_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_SGMT_CODE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_SGMT_CODE_PK" ON "CMS_TEAM_CMS_SEGMENT_CODE" ("CODE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_SRR_PK_RI
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_SRR_PK_RI" ON "CMS_STAGE_RCPT_RELEASE" ("RELEASE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_SSR_PK_SI
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_SSR_PK_SI" ON "CMS_STAGE_STTLMT_RCPT_MAP" ("SETTLMT_WHRCPT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_SST_PK_SI
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_SST_PK_SI" ON "CMS_STAGE_SETTLEMENT" ("SETTLEMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_STAGE_ASSET_GC_DET_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_STAGE_ASSET_GC_DET_PK" ON "CMS_STAGE_ASSET_GC_DET" ("GC_DET_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_STAGE_ASSET_GC_STOCK__PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_STAGE_ASSET_GC_STOCK__PK" ON "CMS_STAGE_ASSET_GC_STOCK_DET" ("GC_STOCK_DET_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_STAGE_DEMO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_STAGE_DEMO_PK" ON "CMS_STAGE_DEMO" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_STAGE_UDF_MASTER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_STAGE_UDF_MASTER_PK" ON "CMS_STAGE_UDF" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_STATEMATRIX_ACTION_INDEX1
--------------------------------------------------------

  CREATE INDEX "CMS_STATEMATRIX_ACTION_INDEX1" ON "CMS_STATEMATRIX_ACTION" ("TEAM_MEMBERSHIP_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_STD_PK_DI
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_STD_PK_DI" ON "CMS_STAGE_TITLE_DOC" ("TITLE_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_STG_CHK_IMG_CHK_IMG_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_STG_CHK_IMG_CHK_IMG_IDX" ON "CMS_STAGE_CHECKLIST_ITEM_IMAGE" ("CHK_ITEM_IMAGE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_STG_CHK_ITEM_IMAGE_ID_IDX
--------------------------------------------------------

  CREATE INDEX "CMS_STG_CHK_ITEM_IMAGE_ID_IDX" ON "CMS_STAGE_CHECKLIST_ITEM_IMAGE" ("DOC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_STG_LINE_DTL_COL_ID_IDX
--------------------------------------------------------

  CREATE INDEX "CMS_STG_LINE_DTL_COL_ID_IDX" ON "CMS_STAGE_LINE_DETAIL" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_STG_LINE_DTL_LINE_DTL_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_STG_LINE_DTL_LINE_DTL_IDX" ON "CMS_STAGE_LINE_DETAIL" ("LINE_DETAIL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_STG_TAT_DOC_DRAFT_I1
--------------------------------------------------------

  CREATE INDEX "CMS_STG_TAT_DOC_DRAFT_I1" ON "CMS_STAGE_TAT_DOCUMENT_DRAFT" ("DRAFT_ID", "TAT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_STG_TAT_IDX1
--------------------------------------------------------

  CREATE INDEX "CMS_STG_TAT_IDX1" ON "CMS_STAGE_TAT_DOCUMENT" ("CMS_LSP_LMT_PROFILE_ID", "DISBURSEMENT_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_STG_TAT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_STG_TAT_ID_PK" ON "CMS_STAGE_TAT_DOCUMENT" ("TAT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_SWR_PK_RI
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_SWR_PK_RI" ON "CMS_STAGE_WRHSE_RCPT" ("WAREHSE_RCPT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_TAT_DOC_DRAFT_I1
--------------------------------------------------------

  CREATE INDEX "CMS_TAT_DOC_DRAFT_I1" ON "CMS_TAT_DOCUMENT_DRAFT" ("DRAFT_ID", "TAT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_TAT_DOC_DRAFT_I2
--------------------------------------------------------

  CREATE INDEX "CMS_TAT_DOC_DRAFT_I2" ON "CMS_TAT_DOCUMENT_DRAFT" ("DOC_DRAFT_STAGE", "DRAFT_NUMBER", "TAT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_TAT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_TAT_ID_PK" ON "CMS_TAT_DOCUMENT" ("TAT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_TEAM_ORG_CODE
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_TEAM_ORG_CODE" ON "CMS_TEAM_ORGANISATION_CODE" ("CODE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_TEAM_SGMT_CODE
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_TEAM_SGMT_CODE" ON "CMS_TEAM_SEGMENT_CODE" ("CODE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_TEMP_IMAGE_UPLOAD_INDEX1
--------------------------------------------------------

  CREATE INDEX "CMS_TEMP_IMAGE_UPLOAD_INDEX1" ON "CMS_TEMP_IMAGE_UPLOAD" ("STATUS", "FROM_SERVER") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_TEMP_IMAGE_UPLOAD_INDEX2
--------------------------------------------------------

  CREATE INDEX "CMS_TEMP_IMAGE_UPLOAD_INDEX2" ON "CMS_TEMP_IMAGE_UPLOAD" ("CUST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_TEMP_PUBLIC_HOLIDAY_IDX1
--------------------------------------------------------

  CREATE INDEX "CMS_TEMP_PUBLIC_HOLIDAY_IDX1" ON "CMS_TEMP_PUBLIC_HOLIDAY" ("COUNTRY_ISO_CODE", "HOLIDAY_DATE", "STATE_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_TEMP_WORKING_DAYS_IDX1
--------------------------------------------------------

  CREATE INDEX "CMS_TEMP_WORKING_DAYS_IDX1" ON "CMS_TEMP_WORKING_DAYS" ("BRANCH", "PROCESSING_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_TEM_TYP_MEM_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_TEM_TYP_MEM_ID" ON "CMS_TEAM_TYPE_MEMBERSHIP" ("TEAM_TYPE_MEMBERSHIP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_UDF_MASTER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_UDF_MASTER_PK" ON "CMS_UDF" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_UPLOADED_IMAGES_INDEX1
--------------------------------------------------------

  CREATE INDEX "CMS_UPLOADED_IMAGES_INDEX1" ON "CMS_UPLOADED_IMAGES" ("CUST_ID", "CATEGORY", "IMG_DEPRICATED") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_UPLOADED_IMAGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_UPLOADED_IMAGES_PK" ON "CMS_UPLOADED_IMAGES" ("IMG_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_WAIVER_GENERAT
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_WAIVER_GENERAT" ON "CMS_WAIVER_GENERATED" ("WAIVER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_WAIVER_GEN_ITM
--------------------------------------------------------

  CREATE UNIQUE INDEX "CMS_WAIVER_GEN_ITM" ON "CMS_WAIVER_GENERATED_ITEM" ("WAIVER_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CMS_WORKING_DAYS_IDX1
--------------------------------------------------------

  CREATE INDEX "CMS_WORKING_DAYS_IDX1" ON "CMS_WORKING_DAYS" ("BRANCH", "PROCESSING_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index CM_COD_CAT_I1
--------------------------------------------------------

  CREATE INDEX "CM_COD_CAT_I1" ON "COMMON_CODE_CATEGORY_ENTRY" ("CATEGORY_CODE", "ENTRY_CODE", "ENTRY_NAME", "ENTRY_SOURCE") 
  ;
--------------------------------------------------------
--  DDL for Index CM_COD_CAT_I2
--------------------------------------------------------

  CREATE INDEX "CM_COD_CAT_I2" ON "COMMON_CODE_CATEGORY_ENTRY" ("CATEGORY_CODE", "ENTRY_CODE", "REF_ENTRY_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index CM_COD_CAT_I3
--------------------------------------------------------

  CREATE INDEX "CM_COD_CAT_I3" ON "COMMON_CODE_CATEGORY_ENTRY" ("ACTIVE_STATUS", "REF_ENTRY_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index CM_COD_CAT_U1
--------------------------------------------------------

  CREATE INDEX "CM_COD_CAT_U1" ON "COMMON_CODE_CATEGORY_ENTRY" ("ENTRY_CODE", "CATEGORY_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index CM_COD_CAT_U2
--------------------------------------------------------

  CREATE INDEX "CM_COD_CAT_U2" ON "COMMON_CODE_CATEGORY_ENTRY" ("ACTIVE_STATUS", "CATEGORY_CODE", "ENTRY_CODE", "ENTRY_SOURCE") 
  ;
--------------------------------------------------------
--  DDL for Index COL_ID_INDX
--------------------------------------------------------

  CREATE INDEX "COL_ID_INDX" ON "ADFCSTOCK_RCV26072019" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index COL_TASK_I1
--------------------------------------------------------

  CREATE INDEX "COL_TASK_I1" ON "CMS_COLLATERAL_TASK" ("CMS_LE_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index COL_TASK_I2
--------------------------------------------------------

  CREATE INDEX "COL_TASK_I2" ON "CMS_COLLATERAL_TASK" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index COL_TASK_I3
--------------------------------------------------------

  CREATE INDEX "COL_TASK_I3" ON "CMS_COLLATERAL_TASK" ("CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index COL_TASK_I4
--------------------------------------------------------

  CREATE INDEX "COL_TASK_I4" ON "CMS_COLLATERAL_TASK" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CONVENANT_I1
--------------------------------------------------------

  CREATE INDEX "CONVENANT_I1" ON "CMS_CONVENANT" ("RECURRENT_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CONV_SUB_I1
--------------------------------------------------------

  CREATE INDEX "CONV_SUB_I1" ON "CMS_CONVENANT_SUB_ITEM" ("CONVENANT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CONV_SUB_I2
--------------------------------------------------------

  CREATE INDEX "CONV_SUB_I2" ON "CMS_CONVENANT_SUB_ITEM" ("DEFERRED_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index CRP_CRD_GRD_I1
--------------------------------------------------------

  CREATE INDEX "CRP_CRD_GRD_I1" ON "SCI_GRP_CREDIT_GRADE" ("CMS_GRP_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CRP_I1
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRP_I1" ON "CMS_CREDIT_RISK_PARAM" ("FEED_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CRP_PC_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRP_PC_ID_PK" ON "CMS_POLICY_CAP" ("POLICY_CAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CRP_STG_PC_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CRP_STG_PC_ID_PK" ON "CMS_STAGE_POLICY_CAP" ("POLICY_CAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CTN_I1
--------------------------------------------------------

  CREATE INDEX "CTN_I1" ON "SCI_COUNTRY" ("CTR_AREA_CODE_NUM") 
  ;
--------------------------------------------------------
--  DDL for Index CTRY_LIMIT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CTRY_LIMIT_PK" ON "CMS_COUNTRY_LIMIT" ("COUNTRY_LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CTRY_RATING_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CTRY_RATING_PK" ON "CMS_COUNTRY_RATING" ("COUNTRY_RATING_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CUSTO_DOC_I1
--------------------------------------------------------

  CREATE INDEX "CUSTO_DOC_I1" ON "CMS_CUSTODIAN_DOC" ("STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index CUSTO_DOC_I2
--------------------------------------------------------

  CREATE INDEX "CUSTO_DOC_I2" ON "CMS_CUSTODIAN_DOC" ("CHECKLIST_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CUSTO_DOC_I3
--------------------------------------------------------

  CREATE INDEX "CUSTO_DOC_I3" ON "CMS_CUSTODIAN_DOC" ("CHECKLIST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CUSTO_DOC_I4
--------------------------------------------------------

  CREATE INDEX "CUSTO_DOC_I4" ON "CMS_CUSTODIAN_DOC" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CUST_AUTH_I1
--------------------------------------------------------

  CREATE INDEX "CUST_AUTH_I1" ON "CMS_CUSTODIAN_AUTHORIZER" ("CUSTODIAN_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CUST_DOC_I1
--------------------------------------------------------

  CREATE INDEX "CUST_DOC_I1" ON "CMS_CUST_DOC" ("CHECKLIST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CUST_DOC_IT_I1
--------------------------------------------------------

  CREATE INDEX "CUST_DOC_IT_I1" ON "CMS_CUST_DOC_ITEM" ("CUSTODIAN_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CUST_DOC_IT_I2
--------------------------------------------------------

  CREATE INDEX "CUST_DOC_IT_I2" ON "CMS_CUST_DOC_ITEM" ("CHECKER_TRX_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index CUST_DOC_IT_I3
--------------------------------------------------------

  CREATE INDEX "CUST_DOC_IT_I3" ON "CMS_CUST_DOC_ITEM" ("MAKER_TRX_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index CUST_DOC_IT_I4
--------------------------------------------------------

  CREATE INDEX "CUST_DOC_IT_I4" ON "CMS_CUST_DOC_ITEM" ("CHECKLIST_ITEM_REF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CUST_ID_SUBFOLDER_NAME
--------------------------------------------------------

  CREATE INDEX "CUST_ID_SUBFOLDER_NAME" ON "CMS_TEMP_IMAGE_UPLOAD" ("CUST_ID", "SUBFOLDER_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index DDN_GEN_I1
--------------------------------------------------------

  CREATE INDEX "DDN_GEN_I1" ON "CMS_DDN_GENERATED" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index DDN_GEN_I2
--------------------------------------------------------

  CREATE INDEX "DDN_GEN_I2" ON "CMS_DDN_GENERATED" ("GENERATION_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index DDN_GEN_IT_I1
--------------------------------------------------------

  CREATE INDEX "DDN_GEN_IT_I1" ON "CMS_DDN_GENERATED_ITEM" ("CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index DDN_GEN_IT_I2
--------------------------------------------------------

  CREATE INDEX "DDN_GEN_IT_I2" ON "CMS_DDN_GENERATED_ITEM" ("DDN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index DEAL_CASH_I1
--------------------------------------------------------

  CREATE INDEX "DEAL_CASH_I1" ON "CMS_DEAL_CASH" ("DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index DEF_GEN_IT_I1
--------------------------------------------------------

  CREATE INDEX "DEF_GEN_IT_I1" ON "CMS_DEFERRAL_GENERATED_ITEM" ("DEFERRAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index DIARY_IT_I2
--------------------------------------------------------

  CREATE INDEX "DIARY_IT_I2" ON "CMS_DIARY_ITEM" ("ALLOWED_COUNTRY", "ITEM_DUE_DATE", "TEAM_TYPE_MEMBERSHIP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index DIARY_IT_I3
--------------------------------------------------------

  CREATE INDEX "DIARY_IT_I3" ON "CMS_DIARY_ITEM" ("LE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index DIARY_IT_I4
--------------------------------------------------------

  CREATE INDEX "DIARY_IT_I4" ON "CMS_DIARY_ITEM" ("ALLOWED_COUNTRY", "ITEM_EXPIRY_DATE", "TEAM_TYPE_MEMBERSHIP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index DISCREPENCY
--------------------------------------------------------

  CREATE INDEX "DISCREPENCY" ON "CMS_DISCREPENCY" ("DISCREPENCY") 
  ;
--------------------------------------------------------
--  DDL for Index DISCREPENCY_STATUS
--------------------------------------------------------

  CREATE INDEX "DISCREPENCY_STATUS" ON "CMS_DISCREPENCY" ("STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index DOC_DYN_PROP_SETUP_IDX1
--------------------------------------------------------

  CREATE INDEX "DOC_DYN_PROP_SETUP_IDX1" ON "CMS_DOC_DYNAMIC_PROPERTY_SETUP" ("CATEGORY_CODE", "SECURITY_SUB_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index DOC_GLOBAL_IDX1
--------------------------------------------------------

  CREATE INDEX "DOC_GLOBAL_IDX1" ON "CMS_DOCUMENT_GLOBALLIST" ("DOCUMENT_ID", "EXPIRY_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index DOC_GLOBAL_IDX2
--------------------------------------------------------

  CREATE INDEX "DOC_GLOBAL_IDX2" ON "CMS_DOCUMENT_GLOBALLIST" ("DOCUMENT_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index DOC_ITEM_ID_ITEM
--------------------------------------------------------

  CREATE INDEX "DOC_ITEM_ID_ITEM" ON "CMS_LAD_ITEM" ("DOC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index DOC_MLST_I1
--------------------------------------------------------

  CREATE INDEX "DOC_MLST_I1" ON "CMS_DOCUMENT_MASTERLIST" ("APPLICABLE_LAW", "CATEGORY", "COUNTRY_ISO_CODE", "CUSTOMER_TYPE_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index DOC_MLST_I2
--------------------------------------------------------

  CREATE INDEX "DOC_MLST_I2" ON "CMS_DOCUMENT_MASTERLIST" ("CATEGORY", "COUNTRY_ISO_CODE", "SECURITY_SUB_TYPE_ID", "SECURITY_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index DOC_PROP_I1
--------------------------------------------------------

  CREATE INDEX "DOC_PROP_I1" ON "CMS_DOCUMENT_PROPERTY" ("DOC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index DOC_PROP_I2
--------------------------------------------------------

  CREATE INDEX "DOC_PROP_I2" ON "CMS_STAGE_DOCUMENT_PROPERTY" ("DOC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EAI_MSG_LOG_IDX2
--------------------------------------------------------

  CREATE INDEX "EAI_MSG_LOG_IDX2" ON "CMS_EAI_MESSAGE_LOG" ("MESSAGE_ID", "PUBLISH_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index ECO_SECTOR_LIMIT
--------------------------------------------------------

  CREATE UNIQUE INDEX "ECO_SECTOR_LIMIT" ON "CMS_ECO_SECTOR_LIMIT" ("ECO_SECTOR_LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ECO_SECTOR_LIMIT_2
--------------------------------------------------------

  CREATE UNIQUE INDEX "ECO_SECTOR_LIMIT_2" ON "CMS_STAGE_ECO_SECTOR_LIMIT" ("ECO_SECTOR_LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EI_GP5_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EI_GP5_ID_PK" ON "CMS_EXEMPTED_INST_GP5" ("EXEMPTED_INST_GP5_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EI_ST_GP5_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EI_ST_GP5_ID_PK" ON "CMS_STAGE_EXEMPTED_INST_GP5" ("EXEMPTED_INST_GP5_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EMAIL_NOTIFICATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EMAIL_NOTIFICATION_PK" ON "EMAIL_NOTIFICATION" ("NOTIFCATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EMP_COD_MAP_I1
--------------------------------------------------------

  CREATE INDEX "EMP_COD_MAP_I1" ON "SCI_EMP_EMP_CODE_MAP" ("EEC_EMP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EMP_MAP_I1
--------------------------------------------------------

  CREATE INDEX "EMP_MAP_I1" ON "SCI_LSP_EMP_MAP" ("CMS_LE_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EMP_MAP_I2
--------------------------------------------------------

  CREATE INDEX "EMP_MAP_I2" ON "SCI_LSP_EMP_MAP" ("LEM_EMP_BKG_LOC_CTRY", "LEM_EMP_BKG_LOC_ORG") 
  ;
--------------------------------------------------------
--  DDL for Index EMP_MAP_I3
--------------------------------------------------------

  CREATE INDEX "EMP_MAP_I3" ON "SCI_LSP_EMP_MAP" ("LEM_LE_ID", "LEM_LSP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EMP_MAP_I4
--------------------------------------------------------

  CREATE INDEX "EMP_MAP_I4" ON "SCI_LSP_EMP_MAP" ("LEM_EMP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EMP_MAP_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "EMP_MAP_U1" ON "SCI_LSP_EMP_MAP" ("CMS_LE_SUB_PROFILE_ID", "CMS_LSP_EMP_MAP_ID", "LEM_EMP_BKG_LOC_CTRY", "LEM_EMP_BKG_LOC_ORG") 
  ;
--------------------------------------------------------
--  DDL for Index ENT_LMT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENT_LMT_PK" ON "CMS_ENTITY_LIMIT" ("ENTITY_LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EXM_FAC_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EXM_FAC_ID_PK" ON "CMS_EXEMPT_FACILITY" ("EXEMPT_FACILITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EXM_FAC_STG_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EXM_FAC_STG_ID_PK" ON "CMS_STAGE_EXEMPT_FACILITY" ("EXEMPT_FACILITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EXP_DIAG_DAT_I1
--------------------------------------------------------

  CREATE INDEX "EXP_DIAG_DAT_I1" ON "EXPLAIN_DIAGNOSTIC_DATA" ("DIAGNOSTIC_ID", "EXPLAIN_LEVEL", "EXPLAIN_TIME", "ORDINAL", "SECTNO", "STMTNO") 
  ;
--------------------------------------------------------
--  DDL for Index EXT_SYS_MAP_I1
--------------------------------------------------------

  CREATE INDEX "EXT_SYS_MAP_I1" ON "SCI_BKG_LOCTN_EXT_SYS_MAP" ("BKX_BKG_LOCTN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EXT_SYS_MAP_I2
--------------------------------------------------------

  CREATE INDEX "EXT_SYS_MAP_I2" ON "SCI_BKG_LOCTN_EXT_SYS_MAP" ("CMS_BKG_LOCTN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index FAC_INSURANCE_IDX1
--------------------------------------------------------

  CREATE INDEX "FAC_INSURANCE_IDX1" ON "CMS_FAC_INSURANCE" ("CMS_FAC_MASTER_ID", "CMS_REF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index FAC_OFFICER_IDX1
--------------------------------------------------------

  CREATE INDEX "FAC_OFFICER_IDX1" ON "CMS_FAC_OFFICER" ("CMS_FAC_MASTER_ID", "CMS_REF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index FEED_GRP_I1
--------------------------------------------------------

  CREATE INDEX "FEED_GRP_I1" ON "CMS_FEED_GROUP" ("FEED_GROUP_ID", "GROUP_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index FIN_DOC_I1
--------------------------------------------------------

  CREATE INDEX "FIN_DOC_I1" ON "CMS_FINANCE_DOC" ("DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index FOREX_HIS_I1
--------------------------------------------------------

  CREATE INDEX "FOREX_HIS_I1" ON "CMS_FOREX_HISTORY" ("FEED_GROUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index FOREX_I1
--------------------------------------------------------

  CREATE INDEX "FOREX_I1" ON "CMS_FOREX" ("BUY_CURRENCY") 
  ;
--------------------------------------------------------
--  DDL for Index FOREX_I2
--------------------------------------------------------

  CREATE INDEX "FOREX_I2" ON "CMS_FOREX" ("FEED_GROUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index GC_DET_ID_TYPE
--------------------------------------------------------

  CREATE INDEX "GC_DET_ID_TYPE" ON "CMS_ASSET_GC_STOCK_DET" ("GC_DET_ID", "STOCK_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index GOLD_FEED_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "GOLD_FEED_PK" ON "CMS_GOLD_FEED" ("GOLD_FEED_ID") 
  ;
--------------------------------------------------------
--  DDL for Index GOLD_FEED_PK_2
--------------------------------------------------------

  CREATE UNIQUE INDEX "GOLD_FEED_PK_2" ON "CMS_STAGE_GOLD_FEED" ("GOLD_FEED_ID") 
  ;
--------------------------------------------------------
--  DDL for Index GRP_LE_MAP_I1
--------------------------------------------------------

  CREATE INDEX "GRP_LE_MAP_I1" ON "SCI_GRP_LE_MAP" ("CMS_GRP_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index GRP_LE_MAP_I2
--------------------------------------------------------

  CREATE INDEX "GRP_LE_MAP_I2" ON "SCI_GRP_LE_MAP" ("GLE_LE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index GRP_LE_MAP_I3
--------------------------------------------------------

  CREATE INDEX "GRP_LE_MAP_I3" ON "SCI_GRP_LE_MAP" ("CMS_LE_MAIN_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index GRP_MAP_I1
--------------------------------------------------------

  CREATE INDEX "GRP_MAP_I1" ON "SCI_GRP_MAP" ("CMS_GRP_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index HG_CNTR_I1
--------------------------------------------------------

  CREATE INDEX "HG_CNTR_I1" ON "CMS_HEDGE_CNTR" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index HG_EXT_I1
--------------------------------------------------------

  CREATE INDEX "HG_EXT_I1" ON "CMS_HEDGE_EXT" ("DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index HOST_BRANCH_IDX1
--------------------------------------------------------

  CREATE INDEX "HOST_BRANCH_IDX1" ON "HOST_BRANCH" ("BRANCH_NUM", "CENTRE_CODE", "CENTRE_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index HOST_CENTRE_IDX1
--------------------------------------------------------

  CREATE INDEX "HOST_CENTRE_IDX1" ON "HOST_CENTRE" ("CENTRE_CODE", "CENTRE_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index HOST_DEALER_IDX1
--------------------------------------------------------

  CREATE INDEX "HOST_DEALER_IDX1" ON "HOST_DEALER" ("DEALER_NUM", "DEALER_STATUS_2", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index HOST_FACILITY_TYPE_IDX1
--------------------------------------------------------

  CREATE INDEX "HOST_FACILITY_TYPE_IDX1" ON "HOST_FACILITY_TYPE" ("ACCOUNT_TYPE", "FACILITY_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index HOST_PRODUCT_TYPE_IDX1
--------------------------------------------------------

  CREATE INDEX "HOST_PRODUCT_TYPE_IDX1" ON "HOST_PRODUCT_TYPE" ("CONCEPT_CODE", "INTEREST_BASE", "LOAN_TYPE", "SPTF_LOAN_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index HOST_PRODUCT_TYPE_IDX2
--------------------------------------------------------

  CREATE INDEX "HOST_PRODUCT_TYPE_IDX2" ON "HOST_PRODUCT_TYPE" ("CURRENCY", "LOAN_TYPE", "SPTF_LOAN_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index ICM_ACL_DEFNI
--------------------------------------------------------

  CREATE UNIQUE INDEX "ICM_ACL_DEFNI" ON "ICM_ACL_DEFN" ("NAME") 
  ;
--------------------------------------------------------
--  DDL for Index ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "ID" ON "CMS_LAD_DETAIL" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX$$_170740001
--------------------------------------------------------

  CREATE INDEX "IDX$$_170740001" ON "SCI_LE_SUB_PROFILE" ("STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index IDX$$_170850004
--------------------------------------------------------

  CREATE INDEX "IDX$$_170850004" ON "CMS_ASSET_GC_DET" ("CMS_COLLATERAL_ID", "DOC_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index IDX$$_170850005
--------------------------------------------------------

  CREATE INDEX "IDX$$_170850005" ON "CMS_CASH_DEPOSIT" ("STATUS", "ACTIVE", "CASH_DEPOSIT_ID", "CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX$$_170850006
--------------------------------------------------------

  CREATE INDEX "IDX$$_170850006" ON "SCI_LE_CRI" (TO_NUMBER("CMS_LE_MAIN_PROFILE_ID")) 
  ;
--------------------------------------------------------
--  DDL for Index IDX_AA_PPCF
--------------------------------------------------------

  CREATE INDEX "IDX_AA_PPCF" ON "CMS_AA_PENDING_PERFECTION" ("APPLICATION_TYPE", "CMS_LSP_LMT_PROFILE_ID", "CMS_ORIG_COUNTRY", "CMS_ORIG_ORGANISATION") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_AA_PPCF1
--------------------------------------------------------

  CREATE INDEX "IDX_AA_PPCF1" ON "CMS_AA_PENDING_PERFECTION" ("HOST_BCA_REF_NUM") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_AA_PPCF2
--------------------------------------------------------

  CREATE INDEX "IDX_AA_PPCF2" ON "CMS_AA_PENDING_PERFECTION" ("LLP_LE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_AA_PPCF3
--------------------------------------------------------

  CREATE INDEX "IDX_AA_PPCF3" ON "CMS_AA_PENDING_PERFECTION" ("CMS_CUSTOMER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_EAI_AA_RESPONSE
--------------------------------------------------------

  CREATE INDEX "IDX_EAI_AA_RESPONSE" ON "CMS_EAI_AA_RESPONSE_LOG" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_EAI_MSG_REF
--------------------------------------------------------

  CREATE INDEX "IDX_EAI_MSG_REF" ON "CMS_EAI_MESSAGE_LOG" ("MESSAGE_REF_NUM") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_FILE_ID
--------------------------------------------------------

  CREATE INDEX "IDX_FILE_ID" ON "STAGE_FD_FILE_UPLOAD" ("FILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_INSR_SECSEQ1
--------------------------------------------------------

  CREATE INDEX "IDX_INSR_SECSEQ1" ON "SI_TEMP_ARBS_CO016" ("IS_VALID", "SECURITY_ID", "SEQ_NUMBER") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_MIS_RPT_ID
--------------------------------------------------------

  CREATE INDEX "IDX_MIS_RPT_ID" ON "CMS_REPORT_DUEDATE_PARAM" ("MIS_REPORT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_PLGSRC1
--------------------------------------------------------

  CREATE INDEX "IDX_PLGSRC1" ON "SCI_PLEDGOR_DTL" ("PLG_LE_ID", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SCI_LE_REG_ADDR_1
--------------------------------------------------------

  CREATE INDEX "IDX_SCI_LE_REG_ADDR_1" ON "SCI_LE_REG_ADDR" ("LRA_LE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SEC_SBTYP_MAP1
--------------------------------------------------------

  CREATE INDEX "IDX_SEC_SBTYP_MAP1" ON "SECURITY_SUBTYPE_MAPPING" ("SECURITY_SUB_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SEC_SOURCE_1
--------------------------------------------------------

  CREATE INDEX "IDX_SEC_SOURCE_1" ON "CMS_SECURITY_SOURCE" ("SOURCE_ID", "SOURCE_SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SEC_SOURCE_2
--------------------------------------------------------

  CREATE INDEX "IDX_SEC_SOURCE_2" ON "CMS_SECURITY_SOURCE" ("CMS_COLLATERAL_ID", "SOURCE_SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_ARBS_CO009_1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_ARBS_CO009_1" ON "SI_TEMP_ARBS_CO009" ("IS_VALID", "SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_CASH1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_CASH1" ON "SI_TEMP_ARBS_CO005" ("IS_VALID", "SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_CHRG1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_CHRG1" ON "SI_TEMP_ARBS_CO017" ("CMS_ACT_COL_ID", "RANKING_OF_SECURITY") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_CHRG2
--------------------------------------------------------

  CREATE INDEX "IDX_SI_CHRG2" ON "SI_TEMP_ARBS_CO017" ("CMS_STG_COL_ID", "RANKING_OF_SECURITY") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_CHRG3
--------------------------------------------------------

  CREATE INDEX "IDX_SI_CHRG3" ON "SI_TEMP_ARBS_CO017" ("IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_CHRG4
--------------------------------------------------------

  CREATE INDEX "IDX_SI_CHRG4" ON "SI_TEMP_ARBS_CO017" ("CMS_ACT_CHRG_DTL_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_CHRG5
--------------------------------------------------------

  CREATE INDEX "IDX_SI_CHRG5" ON "SI_TEMP_ARBS_CO017" ("CMS_STG_CHRG_DTL_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_CLEAN1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_CLEAN1" ON "SI_TEMP_ARBS_CO014" ("IS_VALID", "SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_CO009_COL1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_CO009_COL1" ON "SI_TEMP_ARBS_CO009" ("CMS_ACT_COL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_CO009_COL2
--------------------------------------------------------

  CREATE INDEX "IDX_SI_CO009_COL2" ON "SI_TEMP_ARBS_CO009" ("CMS_STG_COL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_CO010_COL1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_CO010_COL1" ON "SI_TEMP_ARBS_CO010" ("CMS_ACT_COL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_CO010_COL2
--------------------------------------------------------

  CREATE INDEX "IDX_SI_CO010_COL2" ON "SI_TEMP_ARBS_CO010" ("CMS_STG_COL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_CO010_SECVAL1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_CO010_SECVAL1" ON "SI_TEMP_ARBS_CO010" ("IS_VALID", "SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_CO1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_CO1" ON "SI_TEMP_ARBS_CO001" ("CMS_ACT_COL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_CO2
--------------------------------------------------------

  CREATE INDEX "IDX_SI_CO2" ON "SI_TEMP_ARBS_CO001" ("CMS_STG_COL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_COL1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_COL1" ON "SI_TEMP_ARBS_CO016" ("CMS_ACT_COL_ID", "SEQ_NUMBER") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_COL2
--------------------------------------------------------

  CREATE INDEX "IDX_SI_COL2" ON "SI_TEMP_ARBS_CO016" ("CMS_STG_COL_ID", "SEQ_NUMBER") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_COL3
--------------------------------------------------------

  CREATE INDEX "IDX_SI_COL3" ON "SI_TEMP_ARBS_CO018" ("IS_VALID", "SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_DOC1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_DOC1" ON "SI_TEMP_ARBS_CO013" ("IS_VALID", "SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_INSR1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_INSR1" ON "SI_TEMP_ARBS_CO016" ("CMS_ACT_INSR_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_INSR2
--------------------------------------------------------

  CREATE INDEX "IDX_SI_INSR2" ON "SI_TEMP_ARBS_CO016" ("CMS_STG_INSR_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_LMTSECM1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_LMTSECM1" ON "SI_TEMP_ARBS_CO017" ("CMS_ACT_CHRG_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_LMTSECM2
--------------------------------------------------------

  CREATE INDEX "IDX_SI_LMTSECM2" ON "SI_TEMP_ARBS_CO017" ("CMS_STG_CHRG_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_MARKET_BOND1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_MARKET_BOND1" ON "SI_TEMP_ARBS_CO007" ("IS_VALID", "SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_OTHERS1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_OTHERS1" ON "SI_TEMP_ARBS_CO011" ("IS_VALID", "SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_PLG1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_PLG1" ON "SI_TEMP_ARBS_CO018" ("IS_VALID", "PLEDGOR_CIF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_PLG2
--------------------------------------------------------

  CREATE INDEX "IDX_SI_PLG2" ON "SI_TEMP_ARBS_CO018" ("CMS_PLDGR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_PLGCOL
--------------------------------------------------------

  CREATE INDEX "IDX_SI_PLGCOL" ON "SI_TEMP_ARBS_CO018" ("CMS_ACT_COL_ID", "CMS_PLDGR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_SEC1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_SEC1" ON "SI_TEMP_ARBS_CO001" ("IS_VALID", "SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SI_VALTYP1
--------------------------------------------------------

  CREATE INDEX "IDX_SI_VALTYP1" ON "SI_TEMP_ARBS_CO015" ("VAL_TYPES") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_SRC_COLCODE1
--------------------------------------------------------

  CREATE INDEX "IDX_SRC_COLCODE1" ON "SI_HOST_COL_CODE_MAP" ("HOST_COL_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_STG_SECMAP_SOURCE
--------------------------------------------------------

  CREATE INDEX "IDX_STG_SECMAP_SOURCE" ON "CMS_STAGE_LIMIT_SECURITY_MAP" ("SOURCE_ID", "UPDATE_STATUS_IND") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_STP_STATUS_MAP
--------------------------------------------------------

  CREATE INDEX "IDX_STP_STATUS_MAP" ON "CMS_STP_READY_STATUS_MAP" ("TRANSACTION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_TRANSACTION3
--------------------------------------------------------

  CREATE INDEX "IDX_TRANSACTION3" ON "TRANSACTION" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_TRANSACTION4
--------------------------------------------------------

  CREATE INDEX "IDX_TRANSACTION4" ON "TRANSACTION" ("TEAM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_TRANSACTION5
--------------------------------------------------------

  CREATE INDEX "IDX_TRANSACTION5" ON "TRANSACTION" ("TRANSACTION_TYPE", "REFERENCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_TRANSACTION6
--------------------------------------------------------

  CREATE INDEX "IDX_TRANSACTION6" ON "TRANSACTION" ("STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_TR_STATE_MATRIX1
--------------------------------------------------------

  CREATE INDEX "IDX_TR_STATE_MATRIX1" ON "TR_STATE_MATRIX" ("STATEID", "STATEINS", "FROMSTATE") 
  ;
--------------------------------------------------------
--  DDL for Index ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ID_PK" ON "CMS_IMAGE_TAG_DETAILS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ID_PK_2
--------------------------------------------------------

  CREATE UNIQUE INDEX "ID_PK_2" ON "CMS_STAGE_IMAGE_UPLOAD_DETAILS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ID_PK_3
--------------------------------------------------------

  CREATE UNIQUE INDEX "ID_PK_3" ON "CMS_IMAGE_UPLOAD_DETAILS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index IMDCO00
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMDCO00" ON "MDCODECONDIT00" ("CODECONDITIONID00") 
  ;
--------------------------------------------------------
--  DDL for Index IMDCO01
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMDCO01" ON "MDCONTACTNAM00" ("NAME") 
  ;
--------------------------------------------------------
--  DDL for Index IMDCO02
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMDCO02" ON "MDCONTACTGRO00" ("NAME") 
  ;
--------------------------------------------------------
--  DDL for Index IMDFO00
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMDFO00" ON "MDFOLLOWONAC00" ("FOLLOWONACTIONID00") 
  ;
--------------------------------------------------------
--  DDL for Index IMDNA00
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMDNA00" ON "MDNAMEDSCHED00" ("SHAREDSCHEDULENAME00") 
  ;
--------------------------------------------------------
--  DDL for Index IMDNO00
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMDNO00" ON "MDNOTIFICATI00" ("NOTIFICATIONACTIONID00") 
  ;
--------------------------------------------------------
--  DDL for Index IMDSC00
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMDSC00" ON "MDSCHEDEVENT00" ("SCHEDULEEVENTID00") 
  ;
--------------------------------------------------------
--  DDL for Index IMDSU00
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMDSU00" ON "MDSUCCESSCOD00" ("SUCCESSCODESETNAME00") 
  ;
--------------------------------------------------------
--  DDL for Index IMDTA00
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMDTA00" ON "MDTASKTYPE00" ("TASKNAME00", "TOWNER00") 
  ;
--------------------------------------------------------
--  DDL for Index IMDTA01
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMDTA01" ON "MDTASKCATEGO00" ("CATEGORY00") 
  ;
--------------------------------------------------------
--  DDL for Index IMDTA02
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMDTA02" ON "MDTASKEXECTY00" ("TASKEXECID00") 
  ;
--------------------------------------------------------
--  DDL for Index IMDTA03
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMDTA03" ON "MDTASKSNAPSH00" ("MODIFIED00", "SUFFIX00", "TASKID00") 
  ;
--------------------------------------------------------
--  DDL for Index IMDTA04
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMDTA04" ON "MDTASKSTATIS00" ("SUFFIX00", "TASKID00") 
  ;
--------------------------------------------------------
--  DDL for Index IMDTH00
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMDTH00" ON "MDTHISTORYTY00" ("TASKHISTORYID00") 
  ;
--------------------------------------------------------
--  DDL for Index IMDTR00
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMDTR00" ON "MDTRESULTTYP00" ("NAME") 
  ;
--------------------------------------------------------
--  DDL for Index IMG_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMG_ID_PK" ON "CMS_TEMP_IMAGE_UPLOAD" ("IMG_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IMG_ID_PK_3
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMG_ID_PK_3" ON "CMS_STAGE_IMAGE_UPLOAD" ("IMG_ID") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX1
--------------------------------------------------------

  CREATE INDEX "INDEX1" ON "CMS_LOGIN_AUDIT" ("LOGIN_STATUS", "LOGIN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX11
--------------------------------------------------------

  CREATE INDEX "INDEX11" ON "CMS_FD_FILE_UPLOAD" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX12
--------------------------------------------------------

  CREATE INDEX "INDEX12" ON "CMS_FILE_UPLOAD" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX13
--------------------------------------------------------

  CREATE INDEX "INDEX13" ON "CMS_FD_FILE_UPLOAD" ("FILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX2
--------------------------------------------------------

  CREATE INDEX "INDEX2" ON "TRANS_HISTORY" ("TRANSACTION_ID", "TO_STATE", "FROM_STATE") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX3_GC_DET_ID
--------------------------------------------------------

  CREATE INDEX "INDEX3_GC_DET_ID" ON "CMS_ASSET_GC_STOCK_DET" ("GC_DET_ID") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX4
--------------------------------------------------------

  CREATE INDEX "INDEX4" ON "CMS_CASH_DEPOSIT" ("CASH_DEPOSIT_ID", "CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX8
--------------------------------------------------------

  CREATE INDEX "INDEX8" ON "TRANSACTION" ("REFERENCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX8_REG
--------------------------------------------------------

  CREATE INDEX "INDEX8_REG" ON "SCI_LE_REG_ADDR" ("LRA_REGION") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX9_TYPE
--------------------------------------------------------

  CREATE INDEX "INDEX9_TYPE" ON "SCI_LE_REG_ADDR" ("LRA_TYPE_VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index INDEXEMPCODE
--------------------------------------------------------

  CREATE UNIQUE INDEX "INDEXEMPCODE" ON "CMS_HRMS_DATA" ("EMPLOYEE_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index INDEXHRMSID
--------------------------------------------------------

  CREATE INDEX "INDEXHRMSID" ON "CMS_HRMS_DATA" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index INDEXMAINRELMGRCODE
--------------------------------------------------------

  CREATE INDEX "INDEXMAINRELMGRCODE" ON "SCI_LE_MAIN_PROFILE" ("RELATION_MGR_EMP_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index INDEXSUBRELMGRCODE
--------------------------------------------------------

  CREATE INDEX "INDEXSUBRELMGRCODE" ON "SCI_LE_SUB_PROFILE" ("RELATION_MGR_EMP_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX_CMS_COMPENENT_NAME
--------------------------------------------------------

  CREATE INDEX "INDEX_CMS_COMPENENT_NAME" ON "CMS_COMPONENT" ("COMPONENT_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX_CMS_COMPENENT_TYPE
--------------------------------------------------------

  CREATE INDEX "INDEX_CMS_COMPENENT_TYPE" ON "CMS_COMPONENT" ("COMPONENT_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX_CMS_GC_INS_COLL_ID
--------------------------------------------------------

  CREATE INDEX "INDEX_CMS_GC_INS_COLL_ID" ON "CMS_GC_INSURANCE" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX_COMPONENT_CODE
--------------------------------------------------------

  CREATE INDEX "INDEX_COMPONENT_CODE" ON "CMS_COMPONENT" ("COMPONENT_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX_INS_CVRG_CODE
--------------------------------------------------------

  CREATE INDEX "INDEX_INS_CVRG_CODE" ON "CMS_INSURANCE_COVERAGE" ("INSURANCE_COVERAGE_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX_LSP_APPR_LMTS
--------------------------------------------------------

  CREATE INDEX "INDEX_LSP_APPR_LMTS" ON "SCI_LSP_APPR_LMTS" ("LMT_TYPE_VALUE", "LMT_OUTER_LMT_ID", "CMS_LIMIT_STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index INDEX_SECURITY_COLID
--------------------------------------------------------

  CREATE INDEX "INDEX_SECURITY_COLID" ON "CMS_SECURITY_SOURCE" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IND_BASEL_MASTER_SYSTEM
--------------------------------------------------------

  CREATE INDEX "IND_BASEL_MASTER_SYSTEM" ON "CMS_BASEL_MASTER" ("SYSTEM") 
  ;
--------------------------------------------------------
--  DDL for Index IND_CHKLIST_RECEIVED_DATE
--------------------------------------------------------

  CREATE INDEX "IND_CHKLIST_RECEIVED_DATE" ON "CMS_CHECKLIST_ITEM" ("STATUS", "RECEIVED_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index IND_COL_NEW_MST_CODE
--------------------------------------------------------

  CREATE INDEX "IND_COL_NEW_MST_CODE" ON "CMS_COLLATERAL_NEW_MASTER" ("NEW_COLLATERAL_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index IND_CUSTOMER_ID_DESC
--------------------------------------------------------

  CREATE INDEX "IND_CUSTOMER_ID_DESC" ON "CMS_DISCREPENCY" ("CUSTOMER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IND_IMAGE_TAG_DET_CUST
--------------------------------------------------------

  CREATE INDEX "IND_IMAGE_TAG_DET_CUST" ON "CMS_IMAGE_TAG_DETAILS" ("CUST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IND_ISSUE_DATE_CASH_DEPOSIT
--------------------------------------------------------

  CREATE INDEX "IND_ISSUE_DATE_CASH_DEPOSIT" ON "CMS_CASH_DEPOSIT" (TRUNC("ISSUE_DATE")) 
  ;
--------------------------------------------------------
--  DDL for Index IND_LSP_LMT_PROFILE
--------------------------------------------------------

  CREATE INDEX "IND_LSP_LMT_PROFILE" ON "SCI_LSP_LMT_PROFILE" ("LLP_LE_ID", "CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IND_SUB_CERSAI_MAPPING
--------------------------------------------------------

  CREATE INDEX "IND_SUB_CERSAI_MAPPING" ON "CMS_SUB_CERSAI_MAPPING" ("MASTER_NAME", "CLIMS_VALUE", "ID") 
  ;
--------------------------------------------------------
--  DDL for Index IND_SUB_CER_MAP_VAL
--------------------------------------------------------

  CREATE INDEX "IND_SUB_CER_MAP_VAL" ON "CMS_SUB_CERSAI_MAPPING" ("CLIMS_VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index IND_SYS_BANK_BRN_CODE
--------------------------------------------------------

  CREATE INDEX "IND_SYS_BANK_BRN_CODE" ON "CMS_SYSTEM_BANK_BRANCH" ("SYSTEM_BANK_BRANCH_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index IND_TRANSACTION_REF_TRN_ID
--------------------------------------------------------

  CREATE INDEX "IND_TRANSACTION_REF_TRN_ID" ON "TRANSACTION" ("REFERENCE_ID", "TRANSACTION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IND_TRN_TRANSACTION_DATE
--------------------------------------------------------

  CREATE INDEX "IND_TRN_TRANSACTION_DATE" ON "TRANSACTION" (TRUNC("TRANSACTION_DATE")) 
  ;
--------------------------------------------------------
--  DDL for Index INS_CDS_I1
--------------------------------------------------------

  CREATE INDEX "INS_CDS_I1" ON "CMS_INSURANCE_CDS" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index INS_PLC_I1
--------------------------------------------------------

  CREATE INDEX "INS_PLC_I1" ON "CMS_INSURANCE_POLICY" ("CMS_COLLATERAL_ID", "POLICY_SEQ_NO") 
  ;
--------------------------------------------------------
--  DDL for Index INS_PLC_I10
--------------------------------------------------------

  CREATE INDEX "INS_PLC_I10" ON "CMS_INSURANCE_POLICY" ("INSR_ID", "POLICY_NO") 
  ;
--------------------------------------------------------
--  DDL for Index INS_PLC_I2
--------------------------------------------------------

  CREATE INDEX "INS_PLC_I2" ON "CMS_INSURANCE_POLICY" ("DOCUMENT_NO") 
  ;
--------------------------------------------------------
--  DDL for Index INS_PLC_I3
--------------------------------------------------------

  CREATE INDEX "INS_PLC_I3" ON "CMS_INSURANCE_POLICY" ("EXPIRY_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index INS_PLC_I4
--------------------------------------------------------

  CREATE INDEX "INS_PLC_I4" ON "CMS_STAGE_INSURANCE_POLICY" ("CMS_COLLATERAL_ID", "POLICY_SEQ_NO") 
  ;
--------------------------------------------------------
--  DDL for Index INS_PLC_I5
--------------------------------------------------------

  CREATE INDEX "INS_PLC_I5" ON "CMS_INSURANCE_POLICY" ("SOURCE_SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index INX_SOURCEREFNO
--------------------------------------------------------

  CREATE INDEX "INX_SOURCEREFNO" ON "SCI_LSP_SYS_XREF" ("SOURCE_REF_NO") 
  ;
--------------------------------------------------------
--  DDL for Index IRS_INTRATE_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "IRS_INTRATE_ID_PK" ON "CMS_STAGE_INTEREST_RATE" ("INT_RATE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index IR_INTRATE_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "IR_INTRATE_ID_PK" ON "CMS_INTEREST_RATE" ("INT_RATE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ITEM_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ITEM_ID_PK" ON "CMS_PORTFOLIO_ITEM_DTL" ("ITEM_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index JOINT_BORROWER_IDX2
--------------------------------------------------------

  CREATE INDEX "JOINT_BORROWER_IDX2" ON "SCI_LSP_JOINT_BORROWER" ("CMS_LMP_LIMIT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LAD_ID
--------------------------------------------------------

  CREATE INDEX "LAD_ID" ON "CMS_LAD" ("LAD_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LAD_ID_ITEM
--------------------------------------------------------

  CREATE INDEX "LAD_ID_ITEM" ON "CMS_LAD_ITEM" ("LAD_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LAD_SUB_ITEM
--------------------------------------------------------

  CREATE INDEX "LAD_SUB_ITEM" ON "CMS_LAD_SUB_ITEM" ("ID", "DOC_SUB_ITEM_ID", "DOC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LE_CRD_GRD_I1
--------------------------------------------------------

  CREATE INDEX "LE_CRD_GRD_I1" ON "SCI_LE_CREDIT_GRADE" ("CMS_MAIN_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LE_CRD_GRD_I2
--------------------------------------------------------

  CREATE INDEX "LE_CRD_GRD_I2" ON "SCI_LE_CREDIT_GRADE" ("LCG_CRDT_GRADE_START_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index LE_CRD_GRD_I3
--------------------------------------------------------

  CREATE INDEX "LE_CRD_GRD_I3" ON "SCI_LE_CREDIT_GRADE" ("LCG_CRDT_GRADE_CODE_VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index LE_CRD_GRD_I4
--------------------------------------------------------

  CREATE INDEX "LE_CRD_GRD_I4" ON "SCI_LE_CREDIT_GRADE" ("LCG_LE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LE_CRD_GRD_I5
--------------------------------------------------------

  CREATE INDEX "LE_CRD_GRD_I5" ON "SCI_LE_CREDIT_GRADE" ("CMS_MAIN_PROFILE_ID", "LCG_CRDT_GRADE_TYPE_VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index LE_CRD_STA_I1
--------------------------------------------------------

  CREATE INDEX "LE_CRD_STA_I1" ON "SCI_LE_CREDIT_STATUS" ("CMS_LE_MAIN_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LE_CRD_STA_I2
--------------------------------------------------------

  CREATE INDEX "LE_CRD_STA_I2" ON "SCI_LE_CREDIT_STATUS" ("LCS_LE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LE_DIRECTOR_INDEX
--------------------------------------------------------

  CREATE INDEX "LE_DIRECTOR_INDEX" ON "SCI_LE_DIRECTOR" ("CMS_LE_MAIN_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LE_ISIC_DTL_I1
--------------------------------------------------------

  CREATE INDEX "LE_ISIC_DTL_I1" ON "SCI_LE_ISIC_DTL" ("CMS_LE_MAIN_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LE_KYC_I1
--------------------------------------------------------

  CREATE INDEX "LE_KYC_I1" ON "SCI_LE_KYC" ("CMS_MAIN_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LE_LE_MAP_I1
--------------------------------------------------------

  CREATE INDEX "LE_LE_MAP_I1" ON "SCI_GRP_LE_LE_MAP" ("CMS_GRP_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LE_MAIN_PRF_I1
--------------------------------------------------------

  CREATE INDEX "LE_MAIN_PRF_I1" ON "SCI_LE_MAIN_PROFILE" ("CMS_LE_MAIN_PROFILE_ID", "LMP_LE_ID", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LE_MAIN_PRF_I10
--------------------------------------------------------

  CREATE INDEX "LE_MAIN_PRF_I10" ON "SCI_LE_MAIN_PROFILE" ("LMP_THIRD_ID_NUMBER", "LMP_THIRD_ID_TYPE_NUM", "LMP_THIRD_ID_TYPE_VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index LE_MAIN_PRF_I2
--------------------------------------------------------

  CREATE INDEX "LE_MAIN_PRF_I2" ON "SCI_LE_MAIN_PROFILE" ("LMP_ID_COUNTRY_ISSUED", "LMP_ID_NUMBER", "LMP_ID_TYPE_VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index LE_MAIN_PRF_I3
--------------------------------------------------------

  CREATE INDEX "LE_MAIN_PRF_I3" ON "SCI_LE_MAIN_PROFILE" ("CMS_LE_MAIN_PROFILE_ID", "LMP_LE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LE_MAIN_PRF_I8
--------------------------------------------------------

  CREATE INDEX "LE_MAIN_PRF_I8" ON "SCI_LE_MAIN_PROFILE" ("LMP_ID_NUMBER", "LMP_ID_TYPE_NUM", "LMP_ID_TYPE_VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index LE_MAIN_PRF_I9
--------------------------------------------------------

  CREATE INDEX "LE_MAIN_PRF_I9" ON "SCI_LE_MAIN_PROFILE" ("LMP_SECOND_ID_NUMBER", "LMP_SECOND_ID_TYPE_NUM", "LMP_SECOND_ID_TYPE_VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index LE_REG_ADD_I1
--------------------------------------------------------

  CREATE INDEX "LE_REG_ADD_I1" ON "SCI_LE_REG_ADDR" ("CMS_LE_MAIN_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LE_SUB_PRF_I2
--------------------------------------------------------

  CREATE INDEX "LE_SUB_PRF_I2" ON "SCI_LE_SUB_PROFILE" ("CMS_LE_MAIN_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LE_SUB_PRF_I6
--------------------------------------------------------

  CREATE INDEX "LE_SUB_PRF_I6" ON "SCI_LE_SUB_PROFILE" ("CMS_LE_SUB_PROFILE_ID", "ULSP_SHORT_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index LIENINDEX4
--------------------------------------------------------

  CREATE INDEX "LIENINDEX4" ON "CMS_LIEN" ("CASH_DEPOSIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LIQUIDATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIQUIDATION_PK" ON "CMS_SEC_LIQUIDATION" ("LIQUIDATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LI_TEMPLATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LI_TEMPLATE_PK" ON "CMS_LI_DOC" ("LI_TEMPLATE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_CHG_I1_3
--------------------------------------------------------

  CREATE INDEX "LMT_CHG_I1_3" ON "CMS_LIMIT_CHARGE_MAP" ("CHARGE_DETAIL_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_CHG_I2
--------------------------------------------------------

  CREATE INDEX "LMT_CHG_I2" ON "CMS_LIMIT_CHARGE_MAP" ("CHARGE_DETAIL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_CHG_I3
--------------------------------------------------------

  CREATE INDEX "LMT_CHG_I3" ON "CMS_LIMIT_CHARGE_MAP" ("CMS_COLLATERAL_ID", "CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_CHG_I4
--------------------------------------------------------

  CREATE INDEX "LMT_CHG_I4" ON "CMS_LIMIT_CHARGE_MAP" ("CMS_COLLATERAL_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_CHG_I6
--------------------------------------------------------

  CREATE INDEX "LMT_CHG_I6" ON "CMS_LIMIT_CHARGE_MAP" ("CHARGE_DETAIL_ID", "CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_LOS_IDX
--------------------------------------------------------

  CREATE INDEX "LMT_LOS_IDX" ON "SCI_LSP_APPR_LMTS" ("LOS_BCA_REF_NUM", "LOS_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_MAP_I1
--------------------------------------------------------

  CREATE INDEX "LMT_MAP_I1" ON "SCI_LSP_LMTS_XREF_MAP" ("CMS_LSP_SYS_XREF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_MAP_I2
--------------------------------------------------------

  CREATE INDEX "LMT_MAP_I2" ON "SCI_LSP_LMTS_XREF_MAP" ("CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_MAP_I3
--------------------------------------------------------

  CREATE INDEX "LMT_MAP_I3" ON "SCI_LSP_LMTS_XREF_MAP" ("LXM_LE_ID", "LXM_LSP_ID", "LXM_LSX_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_MAP_I4
--------------------------------------------------------

  CREATE INDEX "LMT_MAP_I4" ON "SCI_LSP_LMTS_XREF_MAP" ("CMS_LSP_APPR_LMTS_ID", "CMS_LSP_SYS_XREF_ID", "UPDATE_STATUS_IND") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_PRF_I2
--------------------------------------------------------

  CREATE INDEX "LMT_PRF_I2" ON "SCI_LSP_LMT_PROFILE" ("CMS_BCA_CREATE_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_PRF_I3
--------------------------------------------------------

  CREATE INDEX "LMT_PRF_I3" ON "SCI_LSP_LMT_PROFILE" ("CMS_CUSTOMER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_PRF_I4
--------------------------------------------------------

  CREATE INDEX "LMT_PRF_I4" ON "SCI_LSP_LMT_PROFILE" ("CMS_ORIG_COUNTRY", "CMS_ORIG_ORGANISATION") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_PRF_I5
--------------------------------------------------------

  CREATE INDEX "LMT_PRF_I5" ON "SCI_LSP_LMT_PROFILE" ("CMS_ACT_SEC_COVERAGE", "CMS_REQ_SEC_COVERAGE") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_PRF_I6
--------------------------------------------------------

  CREATE INDEX "LMT_PRF_I6" ON "SCI_LSP_LMT_PROFILE" ("CMS_LSP_LMT_PROFILE_ID", "CMS_ORIG_COUNTRY", "CMS_ORIG_ORGANISATION") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_PRF_U2
--------------------------------------------------------

  CREATE UNIQUE INDEX "LMT_PRF_U2" ON "SCI_LSP_LMT_PROFILE" ("CMS_CUSTOMER_ID", "CMS_LSP_LMT_PROFILE_ID", "CMS_ORIG_COUNTRY", "CMS_ORIG_ORGANISATION") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_SEC_I3
--------------------------------------------------------

  CREATE INDEX "LMT_SEC_I3" ON "CMS_LIMIT_SECURITY_MAP" ("CMS_LSP_CO_BORROW_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_SEC_I5
--------------------------------------------------------

  CREATE INDEX "LMT_SEC_I5" ON "CMS_LIMIT_SECURITY_MAP" ("CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_SEC_I6
--------------------------------------------------------

  CREATE INDEX "LMT_SEC_I6" ON "CMS_LIMIT_SECURITY_MAP" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_SEC_I7
--------------------------------------------------------

  CREATE INDEX "LMT_SEC_I7" ON "CMS_LIMIT_SECURITY_MAP" ("CHARGE_ID", "CMS_COLLATERAL_ID", "CMS_LSP_APPR_LMTS_ID", "UPDATE_STATUS_IND") 
  ;
--------------------------------------------------------
--  DDL for Index LMT_SEC_I8
--------------------------------------------------------

  CREATE INDEX "LMT_SEC_I8" ON "CMS_LIMIT_SECURITY_MAP" ("CMS_COLLATERAL_ID", "CMS_LSP_LMT_PROFILE_ID", "UPDATE_STATUS_IND") 
  ;
--------------------------------------------------------
--  DDL for Index LOAN_GUA_I1
--------------------------------------------------------

  CREATE INDEX "LOAN_GUA_I1" ON "CMS_LOAN_GUARANTOR" ("LOAN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LOAN_LMT_I1
--------------------------------------------------------

  CREATE INDEX "LOAN_LMT_I1" ON "CMS_LOAN_LMT" ("CMS_LSP_CO_BORROW_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LOAN_LMT_I2
--------------------------------------------------------

  CREATE INDEX "LOAN_LMT_I2" ON "CMS_LOAN_LMT" ("LOAN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LOAN_LMT_I3
--------------------------------------------------------

  CREATE INDEX "LOAN_LMT_I3" ON "CMS_LOAN_LMT" ("CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LOAN_OBL_I1
--------------------------------------------------------

  CREATE INDEX "LOAN_OBL_I1" ON "CMS_LOAN_OBLIGOR" ("LOAN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LOAN_PAR_I1
--------------------------------------------------------

  CREATE INDEX "LOAN_PAR_I1" ON "CMS_LOAN_PARTICIPANT" ("LOAN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LOAN_PAY_I1
--------------------------------------------------------

  CREATE INDEX "LOAN_PAY_I1" ON "CMS_LOAN_PAYMT" ("LOAN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LOAN_SL_I1
--------------------------------------------------------

  CREATE INDEX "LOAN_SL_I1" ON "CMS_LOAN_SUB_LMT" ("LOAN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LOC_EMP_COD_I1
--------------------------------------------------------

  CREATE INDEX "LOC_EMP_COD_I1" ON "SCI_BKG_LOCTN_EMP_CODE" ("CMS_BKG_LOCTN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LOC_FAM_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "LOC_FAM_U1" ON "CUST_LOC_FAM" ("BKG_LOC_CTRY", "BKG_LOC_ORG", "CUSTOMER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LOC_MAP_I1
--------------------------------------------------------

  CREATE INDEX "LOC_MAP_I1" ON "SCI_CPC_BKG_LOCTN_MAP" ("CMS_BKG_LOCTN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LSP_APPR_LMTS_IDX1
--------------------------------------------------------

  CREATE INDEX "LSP_APPR_LMTS_IDX1" ON "SCI_LSP_APPR_LMTS" ("LMT_ID", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LSP_APPR_LMTS_IDX2
--------------------------------------------------------

  CREATE INDEX "LSP_APPR_LMTS_IDX2" ON "SCI_LSP_APPR_LMTS" ("CMS_LIMIT_STATUS", "CMS_LSP_APPR_LMTS_ID", "LMT_OUTER_LMT_ID", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LSP_APPR_LMTS_IDX4
--------------------------------------------------------

  CREATE INDEX "LSP_APPR_LMTS_IDX4" ON "SCI_LSP_APPR_LMTS" ("LMT_BCA_REF_NUM", "LMT_FAC_CODE", "LMT_FAC_SEQ", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LSP_APPR_LMTS_IDX5
--------------------------------------------------------

  CREATE INDEX "LSP_APPR_LMTS_IDX5" ON "SCI_LSP_APPR_LMTS" ("CMS_LIMIT_PROFILE_ID", "CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LSP_APPR_LMTS_IDX6
--------------------------------------------------------

  CREATE UNIQUE INDEX "LSP_APPR_LMTS_IDX6" ON "SCI_LSP_APPR_LMTS" ("CMS_BKG_COUNTRY", "CMS_BKG_ORGANISATION", "CMS_LIMIT_PROFILE_ID", "CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LSP_APPR_LMTS_IDX7
--------------------------------------------------------

  CREATE INDEX "LSP_APPR_LMTS_IDX7" ON "SCI_LSP_APPR_LMTS" ("CMS_LIMIT_PROFILE_ID", "CMS_LIMIT_STATUS", "CMS_LSP_APPR_LMTS_ID", "LMT_TYPE_VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index LSP_JOINT_BORROWER_IDX1
--------------------------------------------------------

  CREATE INDEX "LSP_JOINT_BORROWER_IDX1" ON "SCI_LSP_JOINT_BORROWER" ("CMS_LE_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MAINCIFIDINDEX
--------------------------------------------------------

  CREATE INDEX "MAINCIFIDINDEX" ON "SCI_LE_MAIN_PROFILE" ("LMP_LE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MAIN_SECTOR_LIMIT
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAIN_SECTOR_LIMIT" ON "CMS_MAIN_SECTOR_LIMIT" ("MAIN_SECTOR_LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MAIN_SECTOR_LIMIT_3
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAIN_SECTOR_LIMIT_3" ON "CMS_STAGE_MAIN_SECTOR_LIMIT" ("MAIN_SECTOR_LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MFCHKLSTITEM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MFCHKLSTITEM_PK" ON "CMS_MF_CHECKLIST_ITEM" ("MF_CHECKLIST_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MF_CHECKLIST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MF_CHECKLIST_PK" ON "CMS_MF_CHECKLIST" ("MF_CHECKLIST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MF_ITEM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MF_ITEM_PK" ON "CMS_MF_ITEM" ("MF_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MF_SEC_SUBTYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MF_SEC_SUBTYPE_PK" ON "CMS_MF_TEMPLATE_SEC_SUBTYPE" ("TEMPLATE_SUBTYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MF_TEMPLATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MF_TEMPLATE_PK" ON "CMS_MF_TEMPLATE" ("MF_TEMPLATE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MIG_IDX_CMS_CHECKLIST1
--------------------------------------------------------

  CREATE INDEX "MIG_IDX_CMS_CHECKLIST1" ON "CMS_CHECKLIST" (UPPER("CATEGORY")) 
  ;
--------------------------------------------------------
--  DDL for Index MIG_IDX_CMS_CHECKLIST2
--------------------------------------------------------

  CREATE INDEX "MIG_IDX_CMS_CHECKLIST2" ON "CMS_CHECKLIST" ("STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index MIG_IDX_TRANSACTION1
--------------------------------------------------------

  CREATE INDEX "MIG_IDX_TRANSACTION1" ON "TRANSACTION" ("TRANSACTION_TYPE", "TRANSACTION_SUBTYPE", "REFERENCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MQ_MSG_I1
--------------------------------------------------------

  CREATE INDEX "MQ_MSG_I1" ON "CMS_MQ_MESSAGE_LOG" ("SCI_MESSAGE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MQ_MSG_I2
--------------------------------------------------------

  CREATE INDEX "MQ_MSG_I2" ON "CMS_MQ_MESSAGE_LOG" ("PUBLISH_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index NOTIF_I1
--------------------------------------------------------

  CREATE INDEX "NOTIF_I1" ON "NOTIFICATION" ("DETAILS") 
  ;
--------------------------------------------------------
--  DDL for Index NOTIF_I2
--------------------------------------------------------

  CREATE INDEX "NOTIF_I2" ON "NOTIFICATION" ("STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index NOTIF_RECIPIENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NOTIF_RECIPIENT_PK" ON "NOTIFICATION_RECIPIENT" ("RECIPIENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index NOT_RCP_I1
--------------------------------------------------------

  CREATE INDEX "NOT_RCP_I1" ON "NOTIFICATION_RECIPIENT" ("GROUP_ID", "NOTIFICATION_ID", "USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index NOT_RCP_I2
--------------------------------------------------------

  CREATE INDEX "NOT_RCP_I2" ON "NOTIFICATION_RECIPIENT" ("GROUP_ID", "NOTIFICATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index NOT_RCP_I3
--------------------------------------------------------

  CREATE INDEX "NOT_RCP_I3" ON "NOTIFICATION_RECIPIENT" ("NOTIFICATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index NOT_REC_I1
--------------------------------------------------------

  CREATE INDEX "NOT_REC_I1" ON "NOTIFICATION_RECURRENCE" ("NOTIFICATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index NOT_TP_REC_I1
--------------------------------------------------------

  CREATE INDEX "NOT_TP_REC_I1" ON "NOTIFICATION_TYPE_RECIPIENT" ("NOTIFICATION_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index NOT_TP_REC_I2
--------------------------------------------------------

  CREATE INDEX "NOT_TP_REC_I2" ON "NOTIFICATION_TYPE_RECURRENCE" ("NOTIFICATION_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index OBJECT_INDEXI
--------------------------------------------------------

  CREATE UNIQUE INDEX "OBJECT_INDEXI" ON "OBJECT_INDEX" ("INDEX_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index OBJECT_TYPEI
--------------------------------------------------------

  CREATE UNIQUE INDEX "OBJECT_TYPEI" ON "OBJECT_TYPE" ("NAME") 
  ;
--------------------------------------------------------
--  DDL for Index OBJ_I1
--------------------------------------------------------

  CREATE INDEX "OBJ_I1" ON "EXPLAIN_OBJECT" ("EXPLAIN_LEVEL", "EXPLAIN_TIME", "SECTNO", "STMTNO") 
  ;
--------------------------------------------------------
--  DDL for Index OFF_ADD_I1
--------------------------------------------------------

  CREATE INDEX "OFF_ADD_I1" ON "SCI_LSP_OFF_ADDR" ("LOA_LE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index OFF_ADD_I2
--------------------------------------------------------

  CREATE INDEX "OFF_ADD_I2" ON "SCI_LSP_OFF_ADDR" ("CMS_MAIN_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index OPR_I1
--------------------------------------------------------

  CREATE INDEX "OPR_I1" ON "EXPLAIN_OPERATOR" ("EXPLAIN_LEVEL", "EXPLAIN_TIME", "OPERATOR_ID", "SECTNO", "STMTNO") 
  ;
--------------------------------------------------------
--  DDL for Index OTHER_SYS_INDEX
--------------------------------------------------------

  CREATE INDEX "OTHER_SYS_INDEX" ON "SCI_LE_OTHER_SYSTEM" ("CMS_LE_OTHER_SYS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PARTYNAMEINDEX
--------------------------------------------------------

  CREATE INDEX "PARTYNAMEINDEX" ON "SCI_LE_SUB_PROFILE" ("LSP_SHORT_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index PCG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PCG_PK" ON "CMS_POLICY_CAP_GROUP" ("POLICY_CAP_GROUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PCH_SAL_I1
--------------------------------------------------------

  CREATE INDEX "PCH_SAL_I1" ON "CMS_PCH_SALE" ("BUYER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PCH_SAL_I2
--------------------------------------------------------

  CREATE INDEX "PCH_SAL_I2" ON "CMS_PCH_SALE" ("SUPPLIER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PCH_SAL_I3
--------------------------------------------------------

  CREATE INDEX "PCH_SAL_I3" ON "CMS_PCH_SALE" ("DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PKCMS_STAGE_PROP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PKCMS_STAGE_PROP" ON "CMS_STAGE_PROPERTY" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PKCMS_STG_SEC_APPT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PKCMS_STG_SEC_APPT" ON "CMS_STAGE_SEC_APPORTIONMENT" ("SEC_APPORTIONMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PKSCI_LE_ISIC_DTL
--------------------------------------------------------

  CREATE UNIQUE INDEX "PKSCI_LE_ISIC_DTL" ON "SCI_LE_ISIC_DTL" ("CMS_LE_ISIC_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PKSECURITY_TYPE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PKSECURITY_TYPE" ON "SECURITY_TYPE" ("SECURITY_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PKSTAGE_BUS_PARAM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PKSTAGE_BUS_PARAM" ON "STAGE_BUS_PARAM" ("PARAMETER_PK") 
  ;
--------------------------------------------------------
--  DDL for Index PKSTG_CMS_SGMT_COD
--------------------------------------------------------

  CREATE UNIQUE INDEX "PKSTG_CMS_SGMT_COD" ON "STAGE_TEAM_CMS_SEGMENT_CODE" ("CODE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PKSTG_TEM_SGMT_COD
--------------------------------------------------------

  CREATE UNIQUE INDEX "PKSTG_TEM_SGMT_COD" ON "STAGE_TEAM_SEGMENT_CODE" ("CODE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BKG_EXT_SYSMAP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BKG_EXT_SYSMAP" ON "SCI_BKG_LOCTN_EXT_SYS_MAP" ("CMS_BKG_LOCTN_EXT_SYS_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BKG_LOCTN
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BKG_LOCTN" ON "SCI_BKG_LOCTN" ("CMS_BKG_LOCTN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BKG_LOC_EMP_COD
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BKG_LOC_EMP_COD" ON "SCI_BKG_LOCTN_EMP_CODE" ("CMS_BKG_LOCTN_EMP_CODE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_BCA_SEC_LI1
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_BCA_SEC_LI1" ON "CMS_BCA_SEC_MAP" ("CUSTOMER_CATEGORY", "CMS_LSP_LMT_PROFILE_ID", "CMS_CUSTOMER_ID", "CMS_COLLATERAL_ID", "SCI_SECURITY_DTL_ID", "LE_ID", "CMS_ORIG_COUNTRY", "CMS_ORIG_ORGANISATION", "SECURITY_LOCATION", "CB_CUSTOMER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_LMT_BK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_LMT_BK" ON "CMS_LMT_BOOK" ("LMT_BK_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_LMT_BK_DTL
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_LMT_BK_DTL" ON "CMS_LMT_BOOK_DTL" ("LMT_BK_DETAIL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_MEM_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_MEM_ID" ON "CMS_TEAM_MEMBER" ("TEAM_MEMBER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_NPL
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_NPL" ON "CMS_NPL" ("CMS_NPL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_PARTY_GROUP_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_PARTY_GROUP_ID" ON "CMS_PARTY_GROUP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_RBI_CATEGORY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_RBI_CATEGORY" ON "CMS_RBI_CATEGORY" ("RBI_CATEGORY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_SCHEDULER_LOG
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_SCHEDULER_LOG" ON "CMS_SCHEDULER_LOG" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_STAGE_NPL
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_STAGE_NPL" ON "CMS_STAGE_NPL" ("CMS_NPL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_STAGE_VAL
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_STAGE_VAL" ON "CMS_STAGE_VALUATION" ("VALUATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_STG_SEC_PRM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_STG_SEC_PRM" ON "CMS_STAGE_SECURITY_PARAMETER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_STOCK_EXCG
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_STOCK_EXCG" ON "CMS_STOCK_EXCHANGE" ("STOCK_EXCHANGE") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_TEAM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_TEAM" ON "CMS_TEAM" ("TEAM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_USER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_USER" ON "CMS_USER" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_USR_SESSION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_USR_SESSION" ON "CMS_USER_SESSION" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_VALUATION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_VALUATION" ON "CMS_VALUATION" ("VALUATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CMS_VALUER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CMS_VALUER" ON "CMS_VALUER" ("VALUER_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index PK_COBOLMT_XREFMAP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_COBOLMT_XREFMAP" ON "SCI_LSP_COBO_LMT_XREF_MAP" ("CMS_LSP_COBO_LMT_XREF_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_COUNTRY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_COUNTRY" ON "SCI_COUNTRY" ("CMS_COUNTRY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CPC_BKG_LOC_MAP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CPC_BKG_LOC_MAP" ON "SCI_CPC_BKG_LOCTN_MAP" ("CMS_CPC_BKG_LOCTN_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CREDIT_APPROVAL
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CREDIT_APPROVAL" ON "CMS_CREDIT_APPROVAL" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_CURRENCY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CURRENCY" ON "SCI_CURRENCY" ("CMS_CURRENCY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_DIRECTOR_MASTER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_DIRECTOR_MASTER" ON "CMS_DIRECTOR_MASTER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_DYN_PROP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_DYN_PROP" ON "CMS_DOCUMENT_PROPERTY" ("PROPERTY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_EARMARK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_EARMARK" ON "CMS_EARMARK" ("EARMARK_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_EARMARK_GROUP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_EARMARK_GROUP" ON "CMS_EARMARK_GROUP" ("EARMARK_GROUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_EMP_PROFILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_EMP_PROFILE" ON "SCI_EMP_PROFILE" ("EMP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_EXCHANGE_RATE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_EXCHANGE_RATE" ON "CMS_EXCHANGE_RATE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_GRP_CRDT_GRADE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_GRP_CRDT_GRADE" ON "SCI_GRP_CREDIT_GRADE" ("CMS_GRP_CREDIT_GRADE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_GRP_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_GRP_ID" ON "CMS_CUST_GRP" ("GRP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_GRP_LE_LE_MAP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_GRP_LE_LE_MAP" ON "SCI_GRP_LE_LE_MAP" ("CMS_GRP_LE_LE_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_GRP_LE_MAP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_GRP_LE_MAP" ON "SCI_GRP_LE_MAP" ("CMS_GRP_LE_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_GRP_MAP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_GRP_MAP" ON "SCI_GRP_MAP" ("CMS_GRP_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_GRP_PROFILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_GRP_PROFILE" ON "SCI_GRP_PROFILE" ("CMS_GRP_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_INDUSTRY_NAME
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_INDUSTRY_NAME" ON "CMS_INDUSTRY_NAME" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_INDUSTRY_NAME_STAGE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_INDUSTRY_NAME_STAGE" ON "CMS_STAGE_INDUSTRY_NAME" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_INSURANCE_COVERAGE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_INSURANCE_COVERAGE" ON "CMS_INSURANCE_COVERAGE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_INSURANCE_COVERAGE_3
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_INSURANCE_COVERAGE_3" ON "CMS_STAGE_INSURANCE_COVERAGE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_INSURANCE_COVERAGE_DTLS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_INSURANCE_COVERAGE_DTLS" ON "CMS_INSURANCE_COVERAGE_DTLS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_INSURANCE_COVERAGE_DTLS_3
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_INSURANCE_COVERAGE_DTLS_3" ON "CMS_STG_INSURANCE_COVERAGE_DET" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LE_CRDT_STATUS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LE_CRDT_STATUS" ON "SCI_LE_CREDIT_STATUS" ("CMS_LE_CREDIT_STATUS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LE_CREDIT_GRADE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LE_CREDIT_GRADE" ON "SCI_LE_CREDIT_GRADE" ("CMS_LE_CREDIT_GRADE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LE_KYC
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LE_KYC" ON "SCI_LE_KYC" ("CMS_LE_KYC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LE_MAIN_PROFILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LE_MAIN_PROFILE" ON "SCI_LE_MAIN_PROFILE" ("CMS_LE_MAIN_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LE_REG_ADDR
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LE_REG_ADDR" ON "SCI_LE_REG_ADDR" ("CMS_LE_REG_ADDR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LE_SUB_PROFILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LE_SUB_PROFILE" ON "SCI_LE_SUB_PROFILE" ("CMS_LE_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LM_CREDIT_GRADE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LM_CREDIT_GRADE" ON "SCI_LMT_CREDIT_GRADE" ("CMS_LMT_CREDIT_GRADE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LSPLMTS_XREFMAP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LSPLMTS_XREFMAP" ON "SCI_LSP_LMTS_XREF_MAP" ("CMS_LSP_LMTS_XREF_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LSP_APPR_LMTS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LSP_APPR_LMTS" ON "SCI_LSP_APPR_LMTS" ("CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LSP_APPR_LMTS123
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LSP_APPR_LMTS123" ON "SCI_LSP_APPR_LMTS_252014" ("CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LSP_CO_BO_LMT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LSP_CO_BO_LMT" ON "SCI_LSP_CO_BORROW_LMT" ("CMS_LSP_CO_BORROW_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LSP_EMP_MAP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LSP_EMP_MAP" ON "SCI_LSP_EMP_MAP" ("CMS_LSP_EMP_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LSP_LMT_PROFILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LSP_LMT_PROFILE" ON "SCI_LSP_LMT_PROFILE" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LSP_OFF_ADDR
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LSP_OFF_ADDR" ON "SCI_LSP_OFF_ADDR" ("CMS_LOA_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_LSP_SYS_XREF
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_LSP_SYS_XREF" ON "SCI_LSP_SYS_XREF" ("CMS_LSP_SYS_XREF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_NLIST
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_NLIST" ON "NLIST" ("RNUM") 
  ;
--------------------------------------------------------
--  DDL for Index PK_NOTIFICATION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_NOTIFICATION" ON "NOTIFICATION" ("NOTIFICATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_NOTIFI_RECUR
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_NOTIFI_RECUR" ON "NOTIFICATION_RECURRENCE" ("RECURRENCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_NOTIFY_TYPE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_NOTIFY_TYPE" ON "NOTIFICATION_TYPE" ("NOTIFICATION_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_NOTI_TYPE_RCPT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_NOTI_TYPE_RCPT" ON "NOTIFICATION_TYPE_RECIPIENT" ("RECIPIENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_NOTI_TYPE_RECUR
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_NOTI_TYPE_RECUR" ON "NOTIFICATION_TYPE_RECURRENCE" ("RECURRENCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_OFA_ACCESS_PROF
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_OFA_ACCESS_PROF" ON "OFA_ACCESS_PROFILE" ("ACCESS_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_PLDGR_CRDTGRAD
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PLDGR_CRDTGRAD" ON "SCI_PLDGR_CREDIT_GRADE" ("CMS_PLDGR_CREDIT_GRADE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_PLEDGOR_DTL
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PLEDGOR_DTL" ON "SCI_PLEDGOR_DTL" ("CMS_PLEDGOR_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_RELATIONSHIP_MGR
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_RELATIONSHIP_MGR" ON "CMS_STAGE_RELATIONSHIP_MGR" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_RELATIONSHIP_MGR_3
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_RELATIONSHIP_MGR_3" ON "CMS_RELATIONSHIP_MGR" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_REPORT_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_REPORT_ID" ON "CMS_REPORT" ("REPORT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_SAMPLE_TEST
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SAMPLE_TEST" ON "CMS_SAMPLE_TEST" ("PRDID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_SAMPLE_TEST_3
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SAMPLE_TEST_3" ON "SAMPLE_TEST" ("PRDID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_SCI_INSTRCT_REF
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SCI_INSTRCT_REF" ON "SCI_INSTRUCT_REF" ("CMS_INSTRUCT_REF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_SECURITY_FIELD
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SECURITY_FIELD" ON "SECURITY_FIELD" ("FIELD_NAME", "SECURITY_SUB_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_SEC_PLDGR_MAP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SEC_PLDGR_MAP" ON "SCI_SEC_PLDGR_MAP" ("CMS_SEC_PLDGR_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STAGE_CCC_GEN
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STAGE_CCC_GEN" ON "STAGE_CCC_GENERATED" ("CCC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STAGE_CC_TASK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STAGE_CC_TASK" ON "STAGE_CC_TASK" ("TASK_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STAGE_CHECKLIST
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STAGE_CHECKLIST" ON "STAGE_CHECKLIST" ("CHECKLIST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STAGE_CONVENANT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STAGE_CONVENANT" ON "STAGE_CONVENANT" ("CONVENANT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STAGE_CO_BO_LMT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STAGE_CO_BO_LMT" ON "STAGE_CO_BORROWER_LIMIT" ("CMS_LSP_CO_BORROW_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STAGE_CREDIT_APPROVAL
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STAGE_CREDIT_APPROVAL" ON "CMS_STAGE_CREDIT_APPROVAL" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STAGE_EARMARK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STAGE_EARMARK" ON "CMS_STAGE_EARMARK" ("EARMARK_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STAGE_GRP_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STAGE_GRP_ID" ON "CMS_STAGE_CUST_GRP" ("GRP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STAGE_LIMIT_PRO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STAGE_LIMIT_PRO" ON "STAGE_LIMIT_PROFILE" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STAGE_LMT_XREF
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STAGE_LMT_XREF" ON "STAGE_LIMIT_XREF" ("CMS_LSP_LMTS_XREF_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STAGE_MEM_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STAGE_MEM_ID" ON "STAGE_TEAM_MEMBER" ("TEAM_MEMBER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STAGE_PSCC_GEN
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STAGE_PSCC_GEN" ON "STAGE_PSCC_GENERATED" ("PSCC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STAGE_RBI_CATEGORY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STAGE_RBI_CATEGORY" ON "CMS_STAGE_RBI_CATEGORY" ("STAGE_RBI_CATEGORY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STAGE_SCI_FAC_CO_BORROWER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STAGE_SCI_FAC_CO_BORROWER" ON "STAGE_SCI_FAC_CO_BORROWER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STAGE_TEAM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STAGE_TEAM" ON "STAGE_TEAM" ("TEAM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STAGE_USER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STAGE_USER" ON "STAGE_USER" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_BUS_PAR_GRP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_BUS_PAR_GRP" ON "STAGE_BUS_PARAM_GRP" ("GROUP_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_CCC_GEN_ITM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_CCC_GEN_ITM" ON "STAGE_CCC_GENERATED_ITEM" ("CCC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_CC_DOC_LOC
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_CC_DOC_LOC" ON "STAGE_CC_DOC_LOC" ("DOC_LOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_CHKLIST_ITM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_CHKLIST_ITM" ON "STAGE_CHECKLIST_ITEM" ("DOC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_CHK_ITM_SHR
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_CHK_ITM_SHR" ON "STAGE_CHECKLIST_ITEM_SHARE" ("CHECKLIST_ITEM_SHARE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_COL_TASK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_COL_TASK" ON "STAGE_COLLATERAL_TASK" ("TASK_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_CUST_DOC
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_CUST_DOC" ON "STAGE_CUSTODIAN_DOC" ("CUSTODIAN_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_DDN_GEN
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_DDN_GEN" ON "STAGE_DDN_GENERATED" ("DDN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_DDN_GEN_ITM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_DDN_GEN_ITM" ON "STAGE_DDN_GENERATED_ITEM" ("DDN_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_DOCU_ITEM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_DOCU_ITEM" ON "STAGE_DOCUMENT_ITEM" ("DOC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_DOC_GBLIST
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_DOC_GBLIST" ON "STAGE_DOCUMENT_GLOBALLIST" ("DOCUMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_DOC_MLIST
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_DOC_MLIST" ON "STAGE_DOCUMENT_MASTERLIST" ("MASTERLIST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_DYN_PROP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_DYN_PROP" ON "CMS_STAGE_DOCUMENT_PROPERTY" ("PROPERTY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_PSCC_GENITM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_PSCC_GENITM" ON "STAGE_PSCC_GENERATED_ITEM" ("PSCC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_RDOC_SUBITM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_RDOC_SUBITM" ON "STAGE_RECURRENT_DOC_SUB_ITEM" ("SUB_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_RECR_DOCITM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_RECR_DOCITM" ON "STAGE_RECURRENT_DOC_ITEM" ("RECURRENT_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_RECUR_DOC
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_RECUR_DOC" ON "STAGE_RECURRENT_DOC" ("RECURRENT_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_SCC_GEN
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_SCC_GEN" ON "STAGE_SCC_GENERATED" ("SCC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_SCC_GEN_ITM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_SCC_GEN_ITM" ON "STAGE_SCC_GENERATED_ITEM" ("SCC_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_SEC_PARAM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_SEC_PARAM" ON "STAGE_SECURITY_PARAMETER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_SEC_SUBTYPE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_SEC_SUBTYPE" ON "CMS_STAGE_SECURITY_SUB_TYPE" ("SECURITY_SUB_TYPE_SEQ") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_TEAM_CY_COD
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_TEAM_CY_COD" ON "STAGE_TEAM_COUNTRY_CODE" ("CODE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_TEAM_MEM_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_TEAM_MEM_ID" ON "STAGE_TEAM_MEMBERSHIP" ("TEAM_MEMBERSHIP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_STG_TEAM_ORGCOD
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STG_TEAM_ORGCOD" ON "STAGE_TEAM_ORGANISATION_CODE" ("CODE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_ST_CMS_LMT_BK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ST_CMS_LMT_BK" ON "CMS_STAGE_LMT_BOOK" ("LMT_BK_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_ST_LMT_BK_DTL
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ST_LMT_BK_DTL" ON "CMS_STAGE_LMT_BOOK_DTL" ("LMT_BK_DETAIL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_SYSTEM_BANK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SYSTEM_BANK" ON "CMS_SYSTEM_BANK" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TAT_ENTRY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TAT_ENTRY" ON "CMS_TAT_ENTRY" ("TAT_ENTRY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_USER_NOTIFI
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_USER_NOTIFI" ON "USER_DELETED_NOTIFICATION" ("USER_ID", "NOTIFICATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PLG_RPT_I1
--------------------------------------------------------

  CREATE INDEX "PLG_RPT_I1" ON "SCI_PLEDGOR_REPORT" ("CMS_ORIG_COUNTRY", "TIMESTAMP") 
  ;
--------------------------------------------------------
--  DDL for Index PORT_ITM_I1
--------------------------------------------------------

  CREATE INDEX "PORT_ITM_I1" ON "CMS_PORTFOLIO_ITEM" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PRD_I1
--------------------------------------------------------

  CREATE INDEX "PRD_I1" ON "EXPLAIN_PREDICATE" ("EXPLAIN_LEVEL", "EXPLAIN_TIME", "OPERATOR_ID", "SECTNO", "STMTNO") 
  ;
--------------------------------------------------------
--  DDL for Index PRI_FEED_HIS_I1
--------------------------------------------------------

  CREATE INDEX "PRI_FEED_HIS_I1" ON "CMS_PRICE_FEED_HISTORY" ("LAST_UPDATED_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index PRI_FEED_HIS_I2
--------------------------------------------------------

  CREATE INDEX "PRI_FEED_HIS_I2" ON "CMS_PRICE_FEED_HISTORY" ("ISIN_CODE", "LAST_UPDATED_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index PRI_FEED_I1
--------------------------------------------------------

  CREATE INDEX "PRI_FEED_I1" ON "CMS_PRICE_FEED" ("FEED_GROUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PRI_FEED_I2
--------------------------------------------------------

  CREATE INDEX "PRI_FEED_I2" ON "CMS_PRICE_FEED" ("FEED_ID", "TICKER") 
  ;
--------------------------------------------------------
--  DDL for Index PROPERTY_IDX_IDX1
--------------------------------------------------------

  CREATE INDEX "PROPERTY_IDX_IDX1" ON "CMS_PROPERTY_IDX" ("COUNTRY_CODE", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index PROPERTY_IDX_PROPERTY_TYPE_IDX
--------------------------------------------------------

  CREATE INDEX "PROPERTY_IDX_PROPERTY_TYPE_IDX" ON "CMS_PROPERTY_IDX_PROPERTY_TYPE" ("PROPERTY_IDX_ITEM_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index PROP_IDX_DISTRICT_CODE_IDX1
--------------------------------------------------------

  CREATE INDEX "PROP_IDX_DISTRICT_CODE_IDX1" ON "CMS_PROPERTY_IDX_DISTRICT_CODE" ("PROPERTY_IDX_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PROP_IDX_ITEM_IDX1
--------------------------------------------------------

  CREATE INDEX "PROP_IDX_ITEM_IDX1" ON "CMS_PROPERTY_IDX_ITEM" ("PROPERTY_IDX_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index PROP_IDX_MUKIM_CODE_IDX1
--------------------------------------------------------

  CREATE INDEX "PROP_IDX_MUKIM_CODE_IDX1" ON "CMS_PROPERTY_IDX_MUKIM_CODE" ("PROPERTY_IDX_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PROP_IDX_SEC_SUBTYPE_IDX1
--------------------------------------------------------

  CREATE INDEX "PROP_IDX_SEC_SUBTYPE_IDX1" ON "CMS_PROPERTY_IDX_SEC_SUBTYPE" ("PROPERTY_IDX_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index PSCC_GEN_I1
--------------------------------------------------------

  CREATE INDEX "PSCC_GEN_I1" ON "CMS_PSCC_GENERATED" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PSCC_GEN_I2
--------------------------------------------------------

  CREATE INDEX "PSCC_GEN_I2" ON "CMS_PSCC_GENERATED" ("GENERATION_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index PSCC_GEN_I3
--------------------------------------------------------

  CREATE INDEX "PSCC_GEN_I3" ON "CMS_PSCC_GENERATED_ITEM" ("PSCC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PSCG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PSCG_PK" ON "CMS_STAGE_POLICY_CAP_GROUP" ("POLICY_CAP_GROUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PWD_HIS_I1
--------------------------------------------------------

  CREATE INDEX "PWD_HIS_I1" ON "CMS_PASSWORD_HISTORY" ("CREDENTIALS_REF_ID", "PWD_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index RCPT_REL_I1
--------------------------------------------------------

  CREATE INDEX "RCPT_REL_I1" ON "CMS_RCPT_RELEASE" ("DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index RECOVERY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RECOVERY_PK" ON "CMS_SEC_RECOVERY" ("RECOVERY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index RECOV_EXP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RECOV_EXP_PK" ON "CMS_SEC_RECOVERY_EXPENSE" ("RECOVERY_EXPENSE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index RECOV_INC_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RECOV_INC_PK" ON "CMS_SEC_RECOVERY_INCOME" ("RECOVERY_INCOME_ID") 
  ;
--------------------------------------------------------
--  DDL for Index REC_CHK_IT_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "REC_CHK_IT_U1" ON "CMS_REV_CHECKLIST_ITEM" ("CMS_REV_CHECKLIST_ITEM_ID", "DOC_ITEM_REF") 
  ;
--------------------------------------------------------
--  DDL for Index REC_DOC_I1
--------------------------------------------------------

  CREATE INDEX "REC_DOC_I1" ON "CMS_RECURRENT_DOC" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index REC_DOC_IT_I1
--------------------------------------------------------

  CREATE INDEX "REC_DOC_IT_I1" ON "CMS_RECURRENT_DOC_ITEM" ("RECURRENT_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index REC_DOC_SUB_I1
--------------------------------------------------------

  CREATE INDEX "REC_DOC_SUB_I1" ON "CMS_RECURRENT_DOC_SUB_ITEM" ("DEFERRED_DATE", "DUE_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index REC_DOC_SUB_I2
--------------------------------------------------------

  CREATE INDEX "REC_DOC_SUB_I2" ON "CMS_RECURRENT_DOC_SUB_ITEM" ("RECURRENT_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index REL_CATI
--------------------------------------------------------

  CREATE UNIQUE INDEX "REL_CATI" ON "REL_CAT" ("NAME") 
  ;
--------------------------------------------------------
--  DDL for Index RPT_CTN_MAP_I1
--------------------------------------------------------

  CREATE INDEX "RPT_CTN_MAP_I1" ON "CMS_REPORT_COUNTRY_MAP" ("REPORT_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index RPT_CTN_ORG_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "RPT_CTN_ORG_U1" ON "CMS_REPORT_COUNTRY_ORG_MAP" ("COUNTRY", "ORGANISATION", "REPORT_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index RPT_I2
--------------------------------------------------------

  CREATE INDEX "RPT_I2" ON "CMS_REPORT" ("DATE_CREATED", "FREQUENCY", "REPORT_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index RPT_I3
--------------------------------------------------------

  CREATE INDEX "RPT_I3" ON "CMS_REPORT" ("ORG_CODE", "REPORT_DATE", "REPORT_MASTER_ID", "SCOPE_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index RPT_MST_I1
--------------------------------------------------------

  CREATE INDEX "RPT_MST_I1" ON "CMS_REPORT_MASTER" ("STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index RPT_MST_I2
--------------------------------------------------------

  CREATE INDEX "RPT_MST_I2" ON "CMS_REPORT_MASTER" ("REPORT_CATEGORY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index RPT_REQ_I1
--------------------------------------------------------

  CREATE INDEX "RPT_REQ_I1" ON "CMS_REPORT_REQUEST" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index RPT_REQ_I2
--------------------------------------------------------

  CREATE INDEX "RPT_REQ_I2" ON "CMS_REPORT_REQUEST" ("REPORT_GEN_TIME") 
  ;
--------------------------------------------------------
--  DDL for Index RPT_TPL_I1
--------------------------------------------------------

  CREATE INDEX "RPT_TPL_I1" ON "CMS_REPORT_TEMPLATE" ("REPORT_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index S20070925
--------------------------------------------------------

  CREATE UNIQUE INDEX "S20070925" ON "CMS_STAGE_SEC_LIQUIDATION" ("LIQUIDATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SCC_GEN_I1
--------------------------------------------------------

  CREATE INDEX "SCC_GEN_I1" ON "CMS_SCC_GENERATED" ("GENERATION_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index SCC_GEN_I2
--------------------------------------------------------

  CREATE INDEX "SCC_GEN_I2" ON "CMS_SCC_GENERATED" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SCC_GEN_ITM_I1
--------------------------------------------------------

  CREATE INDEX "SCC_GEN_ITM_I1" ON "CMS_SCC_GENERATED_ITEM" ("SCC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SCI_LE_CRI_INDEX1
--------------------------------------------------------

  CREATE INDEX "SCI_LE_CRI_INDEX1" ON "SCI_LE_CRI" ("CMS_LE_MAIN_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SCI_LE_REL_IND1
--------------------------------------------------------

  CREATE INDEX "SCI_LE_REL_IND1" ON "SCI_LE_REL" ("PARENT_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SCI_LE_REL_IND2
--------------------------------------------------------

  CREATE INDEX "SCI_LE_REL_IND2" ON "SCI_LE_REL" ("CMS_LE_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SCI_LE_UDF_INDEX1
--------------------------------------------------------

  CREATE INDEX "SCI_LE_UDF_INDEX1" ON "SCI_LE_UDF" ("CMS_LE_MAIN_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SCI_LE_UDF_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCI_LE_UDF_PK" ON "SCI_LE_UDF" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SCI_LINE_COBORROWER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCI_LINE_COBORROWER_PK" ON "SCI_LINE_COBORROWER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SCI_LSP_LMT_PROFILE_UDF_INDEX1
--------------------------------------------------------

  CREATE INDEX "SCI_LSP_LMT_PROFILE_UDF_INDEX1" ON "SCI_LSP_LMT_PROFILE_UDF" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SCI_LSP_LMT_PROFILE_UDF_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCI_LSP_LMT_PROFILE_UDF_PK" ON "SCI_LSP_LMT_PROFILE_UDF" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SCI_LSP_LMT_XREF_UDF_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCI_LSP_LMT_XREF_UDF_PK" ON "SCI_LSP_LMT_XREF_UDF" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SCI_LSP_LMT_XREF_UDF_PK2
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCI_LSP_LMT_XREF_UDF_PK2" ON "SCI_LSP_LMT_XREF_UDF_2" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SCI_LSP_SYS_XREF_FIN_INDEX1
--------------------------------------------------------

  CREATE INDEX "SCI_LSP_SYS_XREF_FIN_INDEX1" ON "SCI_LSP_SYS_XREF" ("FACILITY_SYSTEM_ID", "SERIAL_NO", "FACILITY_SYSTEM") 
  ;
--------------------------------------------------------
--  DDL for Index SCI_LSP_SYS_XREF_ID_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCI_LSP_SYS_XREF_ID_IDX" ON "SCI_LSP_LMT_XREF_UDF" ("SCI_LSP_SYS_XREF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SCI_LSP_SYS_XREF_UBS_INDEX1
--------------------------------------------------------

  CREATE INDEX "SCI_LSP_SYS_XREF_UBS_INDEX1" ON "SCI_LSP_SYS_XREF" ("FACILITY_SYSTEM_ID", "LINE_NO", "SERIAL_NO", "FACILITY_SYSTEM") 
  ;
--------------------------------------------------------
--  DDL for Index SCTR_LMT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCTR_LMT_PK" ON "CMS_SECTOR_LIMIT" ("SECTOR_LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SECURITYINDEX
--------------------------------------------------------

  CREATE INDEX "SECURITYINDEX" ON "CMS_SECURITY_SUB_TYPE" ("SECURITY_TYPE_ID", "SECURITY_SUB_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_ENVELOPE_ID_IDX1
--------------------------------------------------------

  CREATE INDEX "SEC_ENVELOPE_ID_IDX1" ON "CMS_SEC_ENVELOPE" ("SEC_LSP_LMT_PROFILE_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_ENVELOPE_ITEM_IDX1
--------------------------------------------------------

  CREATE INDEX "SEC_ENVELOPE_ITEM_IDX1" ON "CMS_SEC_ENVELOPE_ITEM" ("SEC_ENVELOPE_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_I1
--------------------------------------------------------

  CREATE INDEX "SEC_I1" ON "CMS_SECURITY" ("SECURITY_SUB_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_I2
--------------------------------------------------------

  CREATE INDEX "SEC_I2" ON "CMS_SECURITY" ("CMS_COLLATERAL_ID", "IS_SECURITY_PERFECTED") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_I3
--------------------------------------------------------

  CREATE INDEX "SEC_I3" ON "CMS_SECURITY" ("CMS_COLLATERAL_ID", "IS_MIGRATED_IND") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_I4
--------------------------------------------------------

  CREATE INDEX "SEC_I4" ON "CMS_SECURITY" ("CMS_COLLATERAL_ID", "SECURITY_SUB_TYPE_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_I5
--------------------------------------------------------

  CREATE INDEX "SEC_I5" ON "CMS_SECURITY" ("SCI_REFERENCE_NOTE") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_I6
--------------------------------------------------------

  CREATE INDEX "SEC_I6" ON "CMS_SECURITY" ("CMS_COLLATERAL_ID", "NEXT_REMARGIN_DATE", "SECURITY_SUB_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_I7
--------------------------------------------------------

  CREATE INDEX "SEC_I7" ON "CMS_SECURITY" ("LOS_SECURITY_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_I8
--------------------------------------------------------

  CREATE INDEX "SEC_I8" ON "CMS_SECURITY" ("CMS_COLLATERAL_ID", "SOURCE_SECURITY_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_INSTRUMT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEC_INSTRUMT_PK" ON "CMS_SECURITY_INSTRUMENT" ("CMS_INSTRUMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_INSTRUMT_ST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEC_INSTRUMT_ST_PK" ON "STAGE_SECURITY_INSTRUMENT" ("CMS_INSTRUMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_LIQ_IDX1
--------------------------------------------------------

  CREATE INDEX "SEC_LIQ_IDX1" ON "CMS_SEC_LIQUIDATION" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_PARA_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEC_PARA_U1" ON "CMS_SECURITY_PARAMETER" ("COUNTRY_ISO_CODE", "SECURITY_SUB_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_PLG_MAP_I1
--------------------------------------------------------

  CREATE INDEX "SEC_PLG_MAP_I1" ON "SCI_SEC_PLDGR_MAP" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_PLG_MAP_I2
--------------------------------------------------------

  CREATE INDEX "SEC_PLG_MAP_I2" ON "SCI_SEC_PLDGR_MAP" ("CMS_PLEDGOR_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_SOURCE_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEC_SOURCE_ID_PK" ON "CMS_SECURITY_SOURCE" ("CMS_SECURITY_SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SEC_U1
--------------------------------------------------------

  CREATE INDEX "SEC_U1" ON "CMS_SECURITY" ("SCI_SECURITY_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SESS_INDEX
--------------------------------------------------------

  CREATE UNIQUE INDEX "SESS_INDEX" ON "SESSIONS" ("APPNAME", "ID", "PROPID") 
  ;
--------------------------------------------------------
--  DDL for Index SETTLE_I1
--------------------------------------------------------

  CREATE INDEX "SETTLE_I1" ON "CMS_SETTLEMENT" ("DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SIS_XREF_I1
--------------------------------------------------------

  CREATE INDEX "SIS_XREF_I1" ON "SCI_LSP_SYS_XREF" ("UPDATE_STATUS_IND", "CMS_LSP_SYS_XREF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CA001_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CA001_IDX1" ON "SI_TEMP_ARBS_CA001" ("AA_NUMBER", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CA001_IDX2
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CA001_IDX2" ON "SI_TEMP_ARBS_CA001" ("CIF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CA002_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CA002_IDX1" ON "SI_TEMP_ARBS_CA002" ("AA_NUMBER", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CA002_IDX2
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CA002_IDX2" ON "SI_TEMP_ARBS_CA002" ("CIF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CA003_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CA003_IDX1" ON "SI_TEMP_ARBS_CA003" ("AA_NUMBER", "FACILITY_CODE", "FACILITY_SEQ", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CA003_IDX2
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CA003_IDX2" ON "SI_TEMP_ARBS_CA003" ("CIF_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CA003_IDX3
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CA003_IDX3" ON "SI_TEMP_ARBS_CA003" ("IS_VALID", "LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CA003_IDX4
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CA003_IDX4" ON "SI_TEMP_ARBS_CA003" ("CMS_ACT_LMT_PROFILE_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CA003_IDX5
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CA003_IDX5" ON "SI_TEMP_ARBS_CA003" ("CMS_ACT_LMT_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CA003_IDX6
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CA003_IDX6" ON "SI_TEMP_ARBS_CA003" ("CMS_STG_LMT_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CA004_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CA004_IDX1" ON "SI_TEMP_ARBS_CA004" ("ACCT_SEQ", "EXTERNAL_SYSTEM_ACCT_NO", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CA005_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CA005_IDX1" ON "SI_TEMP_ARBS_CA005" ("CMS_ACT_COL_ID", "CMS_ACT_LMT_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CA005_IDX2
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CA005_IDX2" ON "SI_TEMP_ARBS_CA005" ("CMS_ACT_LMT_ID", "IS_VALID", "STG_COL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CA005_IDX3
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CA005_IDX3" ON "SI_TEMP_ARBS_CA005" ("ACCT_SEQ", "EXTERNAL_SYSTEM_ACCT_NO", "SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CA019_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CA019_IDX1" ON "SI_TEMP_ARBS_CA019" ("AA_NUMBER", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CU001_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CU001_IDX1" ON "SI_TEMP_ARBS_CU001" ("CIF_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_ARBS_CU002_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_ARBS_CU002_IDX1" ON "SI_TEMP_ARBS_CU002" ("CIF_ID", "CREDIT_GRADE_TYPE", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_BOST_CA001_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_BOST_CA001_IDX1" ON "SI_TEMP_BOST_CA001" ("AA_NUMBER", "CIF_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_BOST_CA015_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_BOST_CA015_IDX1" ON "SI_TEMP_BOST_CA015" ("AA_NUMBER", "CIF_ID", "IS_VALID", "LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_BOST_CO022_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_BOST_CO022_IDX1" ON "SI_TEMP_BOST_CO022" ("CIF_ID", "IS_VALID", "SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_BOST_CO022_PLDGR_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_BOST_CO022_PLDGR_IDX1" ON "SI_TEMP_BOST_CO022_PLEDGOR" ("CIF_NUMBER") 
  ;
--------------------------------------------------------
--  DDL for Index SI_BOST_CO023_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_BOST_CO023_IDX1" ON "SI_TEMP_BOST_CO023" ("IS_VALID", "SECURITY_ID", "SHARE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_BOST_CO025_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_BOST_CO025_IDX1" ON "SI_TEMP_BOST_CO025" ("CIF_NUMBER", "DEPOSIT_RECEIPT_NO", "IS_VALID", "SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_BOST_CO025_PLDGR_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_BOST_CO025_PLDGR_IDX1" ON "SI_TEMP_BOST_CO025_PLEDGOR" ("CIF_NUMBER") 
  ;
--------------------------------------------------------
--  DDL for Index SI_BOST_CU005_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_BOST_CU005_IDX1" ON "SI_TEMP_BOST_CU005" ("CIF_ID", "IS_VALID", "PRIMARY_ADD_TYPE_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index SI_BOST_SH001_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_BOST_SH001_IDX1" ON "SI_TEMP_BOST_SH001" ("ISIN_CODE", "IS_VALID", "STOCK_CODE", "STOCK_EXCHANGE_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index SI_LLP_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_LLP_IDX1" ON "SCI_LSP_LMT_PROFILE" ("LLP_BCA_REF_NUM", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_LMT_SEC1
--------------------------------------------------------

  CREATE INDEX "SI_LMT_SEC1" ON "CMS_LIMIT_SECURITY_MAP" ("CMS_COLLATERAL_ID", "CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_LRA_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_LRA_IDX1" ON "SCI_LE_REG_ADDR" ("CMS_LE_MAIN_PROFILE_ID", "LRA_TYPE_VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index SI_LSP_LMT_PROFILE_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_LSP_LMT_PROFILE_IDX1" ON "SCI_LSP_LMT_PROFILE" ("CIF_SOURCE_ID", "CMS_BCA_STATUS", "LLP_BCA_REF_NUM", "LLP_LE_ID", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_LSP_LMT_PROFILE_IDX2
--------------------------------------------------------

  CREATE INDEX "SI_LSP_LMT_PROFILE_IDX2" ON "SCI_LSP_LMT_PROFILE" ("CMS_BCA_STATUS", "CMS_LSP_LMT_PROFILE_ID", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_LSP_LMT_PROFILE_IDX3
--------------------------------------------------------

  CREATE INDEX "SI_LSP_LMT_PROFILE_IDX3" ON "SCI_LSP_LMT_PROFILE" ("CMS_BCA_CREATE_DATE", "CMS_BCA_STATUS", "CMS_LSP_LMT_PROFILE_ID", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_LSX_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_LSX_IDX1" ON "SCI_LSP_SYS_XREF" ("LSX_EXT_SYS_ACCT_NUM", "LSX_EXT_SYS_ACCT_SEQ", "LSX_EXT_SYS_CODE_VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index SI_NPL_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_NPL_IDX1" ON "CMS_NPL" ("ACCOUNT_NUMBER", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_QUAN_CA020_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_QUAN_CA020_IDX1" ON "SI_TEMP_QUAN_CA020" ("CMS_ACT_LMT_ID", "IS_VALID", "LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_QUAN_CA020_IDX2
--------------------------------------------------------

  CREATE INDEX "SI_QUAN_CA020_IDX2" ON "SI_TEMP_QUAN_CA020" ("CMS_STG_LMT_ID", "IS_VALID", "LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_QUAN_CA020_IDX3
--------------------------------------------------------

  CREATE INDEX "SI_QUAN_CA020_IDX3" ON "SI_TEMP_QUAN_CA020" ("IS_VALID", "LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_QUAN_CA020_IDX4
--------------------------------------------------------

  CREATE INDEX "SI_QUAN_CA020_IDX4" ON "SI_TEMP_QUAN_CA020" ("CMS_ACT_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_QUAN_CA020_IDX5
--------------------------------------------------------

  CREATE INDEX "SI_QUAN_CA020_IDX5" ON "SI_TEMP_QUAN_CA020" ("CMS_STG_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_QUAN_CU002_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_QUAN_CU002_IDX1" ON "SI_TEMP_QUAN_CU002" ("CIF_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_QUAN_CU002_IDX2
--------------------------------------------------------

  CREATE INDEX "SI_QUAN_CU002_IDX2" ON "SI_TEMP_QUAN_CU002" ("CMS_LE_MAIN_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_QUAN_CU008_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_QUAN_CU008_IDX1" ON "SI_TEMP_QUAN_CU008" ("CIF_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_QUAN_CU008_IDX2
--------------------------------------------------------

  CREATE INDEX "SI_QUAN_CU008_IDX2" ON "SI_TEMP_QUAN_CU008" ("CMS_LE_MAIN_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_QUAN_CU008_IDX3
--------------------------------------------------------

  CREATE INDEX "SI_QUAN_CU008_IDX3" ON "SI_TEMP_QUAN_CU008" ("CMS_LE_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CA001_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CA001_IDX1" ON "SI_TEMP_SEMA_CA001" ("CIF_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CA001_IDX2
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CA001_IDX2" ON "SI_TEMP_SEMA_CA001" ("CMS_CUSTOMER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CA001_IDX3
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CA001_IDX3" ON "SI_TEMP_SEMA_CA001" ("CMS_ACT_AA_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CA001_IDX4
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CA001_IDX4" ON "SI_TEMP_SEMA_CA001" ("CMS_STG_AA_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CA012_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CA012_IDX1" ON "SI_TEMP_SEMA_CA012" ("CMS_ACT_LMT_ID", "IS_VALID", "LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CA012_IDX2
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CA012_IDX2" ON "SI_TEMP_SEMA_CA012" ("CMS_STG_LMT_ID", "IS_VALID", "LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CA012_IDX3
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CA012_IDX3" ON "SI_TEMP_SEMA_CA012" ("IS_VALID", "LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CA012_IDX4
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CA012_IDX4" ON "SI_TEMP_SEMA_CA012" ("CMS_ACT_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CA012_IDX5
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CA012_IDX5" ON "SI_TEMP_SEMA_CA012" ("CMS_STG_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CA012_IDX6
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CA012_IDX6" ON "SI_TEMP_SEMA_CA012" ("EXTERNAL_SYSTEM_ACCT_NO", "IS_OUTER_LMT", "LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CO020_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CO020_IDX1" ON "SI_TEMP_SEMA_CO020" ("IS_VALID", "SOURCE_SEC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CO020_IDX2
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CO020_IDX2" ON "SI_TEMP_SEMA_CO020" ("CMS_COLLATERAL_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CO020_IDX3
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CO020_IDX3" ON "SI_TEMP_SEMA_CO020" ("CMS_STG_COLLATERAL_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CO020_IDX4
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CO020_IDX4" ON "SI_TEMP_SEMA_CO020" ("CIF_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CU002_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CU002_IDX1" ON "SI_TEMP_SEMA_CU002" ("CIF_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CU002_IDX2
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CU002_IDX2" ON "SI_TEMP_SEMA_CU002" ("CMS_LE_MAIN_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CU004_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CU004_IDX1" ON "SI_TEMP_SEMA_CU004" ("CUST_CLASS_CAT", "CUST_CLASS_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CU004_IDX10
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CU004_IDX10" ON "SI_TEMP_SEMA_CU004" ("CMS_LE_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CU004_IDX2
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CU004_IDX2" ON "SI_TEMP_SEMA_CU004" ("ID_TYPE_CAT", "ID_TYPE_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CU004_IDX3
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CU004_IDX3" ON "SI_TEMP_SEMA_CU004" ("SECONDARY_ID_TYPE_CAT", "SECONDARY_ID_TYPE_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CU004_IDX4
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CU004_IDX4" ON "SI_TEMP_SEMA_CU004" ("CUST_TYPE_CAT", "CUST_TYPE_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CU004_IDX5
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CU004_IDX5" ON "SI_TEMP_SEMA_CU004" ("INCOME_GROUP", "INCOME_GROUP_CAT") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CU004_IDX6
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CU004_IDX6" ON "SI_TEMP_SEMA_CU004" ("PRIMARY_ADD_TYPE_CAT", "PRIMARY_ADD_TYPE_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CU004_IDX7
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CU004_IDX7" ON "SI_TEMP_SEMA_CU004" ("SECONDARY_ADD_TYPE_CAT", "SECONDARY_ADD_TYPE_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CU004_IDX8
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CU004_IDX8" ON "SI_TEMP_SEMA_CU004" ("CIF_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_CU004_IDX9
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_CU004_IDX9" ON "SI_TEMP_SEMA_CU004" ("CMS_LE_MAIN_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_UPDATE_AA_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_UPDATE_AA_IDX1" ON "SI_SEMA_UPDATE_AA_DATE" ("CMS_LIMIT_PROFILE_ID", "CREATE_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index SI_SEMA_UPDATE_AA_IDX2
--------------------------------------------------------

  CREATE INDEX "SI_SEMA_UPDATE_AA_IDX2" ON "SI_SEMA_UPDATE_AA_DATE" ("CMS_STG_LIMIT_PROFILE_ID", "CREATE_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index SI_STAGE_LMT_PROFILE_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_STAGE_LMT_PROFILE_IDX1" ON "STAGE_LIMIT_PROFILE" ("CIF_SOURCE_ID", "LLP_BCA_REF_NUM", "LLP_LE_ID", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_STBG_CO022_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_STBG_CO022_IDX1" ON "SI_TEMP_STBG_CO022" ("CIF_ID", "IS_VALID", "SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_STBG_CO022_IDX2
--------------------------------------------------------

  CREATE INDEX "SI_STBG_CO022_IDX2" ON "SI_TEMP_STBG_CO022" ("CMS_LSP_SYS_XREF_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_STBG_CO023_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_STBG_CO023_IDX1" ON "SI_TEMP_STBG_CO023" ("IS_VALID", "SECURITY_ID", "SHARE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_STBG_CO024_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_STBG_CO024_IDX1" ON "SI_TEMP_STBG_CO024" ("CIF_NUMBER", "IS_VALID", "SECURITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_STBG_CO024_PLDGR_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_STBG_CO024_PLDGR_IDX1" ON "SI_TEMP_STBG_CO024_PLEDGOR" ("CIF_NUMBER") 
  ;
--------------------------------------------------------
--  DDL for Index SI_STBG_PF001_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_STBG_PF001_IDX1" ON "SI_TEMP_STBG_PF001" ("ISIN_CODE", "IS_VALID", "STOCK_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index SI_STBG_PF002_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_STBG_PF002_IDX1" ON "SI_TEMP_STBG_PF002" ("IS_VALID", "STOCK_INDEX_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index SI_STBG_SH001_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_STBG_SH001_IDX1" ON "SI_TEMP_STBG_SH001" ("ISIN_CODE", "IS_VALID", "STOCK_CODE", "STOCK_EXCHANGE_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index SI_STG_LMT_PROFILE_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_STG_LMT_PROFILE_IDX1" ON "STAGE_LIMIT_PROFILE" ("CMS_BCA_STATUS", "CMS_LSP_LMT_PROFILE_ID", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_STG_LMT_SEC1
--------------------------------------------------------

  CREATE INDEX "SI_STG_LMT_SEC1" ON "CMS_STAGE_LIMIT_SECURITY_MAP" ("CMS_COLLATERAL_ID", "CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_TRX_STG_LMT_UPDATE_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_TRX_STG_LMT_UPDATE_IDX1" ON "SI_TRX_STG_LMT_UPDATE" ("ACT_LMT_ID", "STG_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_TSPR_CA006_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_TSPR_CA006_IDX1" ON "SI_TEMP_TSPR_CA006" ("CIF_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_TSPR_CA006_IDX2
--------------------------------------------------------

  CREATE INDEX "SI_TSPR_CA006_IDX2" ON "SI_TEMP_TSPR_CA006" ("LIMIT_ID", "OUTER_LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_TSPR_CA006_IDX3
--------------------------------------------------------

  CREATE INDEX "SI_TSPR_CA006_IDX3" ON "SI_TEMP_TSPR_CA006" ("TRADE_ACCT_NO", "TRADE_ACCT_SEQ") 
  ;
--------------------------------------------------------
--  DDL for Index SI_TSPR_CA008_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_TSPR_CA008_IDX1" ON "SI_TEMP_TSPR_CA008" ("INTEREST_MODE", "IS_VALID", "LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SI_TSPR_CA010_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_TSPR_CA010_IDX1" ON "SI_TEMP_TSPR_CA010" ("IS_VALID", "LIMIT_ID", "SUPPLIER_BUYER_NAME", "TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index SI_TSPR_CO021_IDX1
--------------------------------------------------------

  CREATE INDEX "SI_TSPR_CO021_IDX1" ON "SI_TEMP_TSPR_CO021" ("FACILITY_ID", "IS_VALID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL080609120031510
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL080609120031510" ON "STAGE_PLEDGOR_DTL" ("CMS_PLEDGOR_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL080609120032200
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL080609120032200" ON "STAGE_SEC_PLDGR_MAP" ("CMS_SEC_PLDGR_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL080609120047680
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL080609120047680" ON "SECURITY_SUBTYPE_MAPPING" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL080609120047930
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL080609120047930" ON "CMS_REPORT_DUEDATE_PARAM" ("PARAM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL080609120049030
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL080609120049030" ON "CMS_PROPERTY_PARAMETERS" ("PARAMETER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL080609120049310
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL080609120049310" ON "CMS_STAGE_PROPERTY_PARAMETERS" ("PARAMETER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL080609120050780
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL080609120050780" ON "CMS_STAGE_SECURITY_SOURCE" ("SCI_SECURITY_DTL_ID", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL080609120106210
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL080609120106210" ON "CMS_FEE_DETAILS" ("FEE_DETAILS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL080609120106340
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL080609120106340" ON "CMS_STAGE_FEE_DETAILS" ("FEE_DETAILS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL080609120113030
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL080609120113030" ON "CMS_NOMINEES" ("CMS_NOMINEES_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL080609120122000
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL080609120122000" ON "CMS_NOMINEES_CUSTOMER_TEMP" ("CMS_NOMINEES_CUSTOMER_TEMP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194526800
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194526800" ON "CMS_DOC_LOAN_APP_TYPE" ("DOC_LOAN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194526830
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194526830" ON "STAGE_DOC_LOAN_APP_TYPE" ("DOC_LOAN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194554900
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194554900" ON "CMS_FUNCTION_GROUP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194554940
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194554940" ON "CMS_TEAM_FUNCTION_GRP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194554990
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194554990" ON "STAGE_TEAM_FUNCTION_GRP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194555150
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194555150" ON "CMS_PROPERTY_IDX" ("PROPERTY_IDX_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194555190
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194555190" ON "CMS_STAGE_PROPERTY_IDX" ("PROPERTY_IDX_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194555260
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194555260" ON "CMS_PROPERTY_IDX_ITEM" ("PROPERTY_IDX_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194555330
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194555330" ON "CMS_STAGE_PROPERTY_IDX_ITEM" ("PROPERTY_IDX_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194555380
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194555380" ON "CMS_PROPERTY_IDX_SEC_SUBTYPE" ("PROPERTY_IDX_SEC_SUBTYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194555460
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194555460" ON "CMS_STAGE_PROP_IDX_SEC_SUBTYPE" ("PROPERTY_IDX_SEC_SUBTYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194555550
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194555550" ON "CMS_PROPERTY_IDX_DISTRICT_CODE" ("PROPERTY_IDX_DISTRICT_CODE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194555680
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194555680" ON "CMS_STG_PROP_IDX_DISTRICT_CODE" ("PROPERTY_IDX_DISTRICT_CODE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194555720
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194555720" ON "CMS_PROPERTY_IDX_MUKIM_CODE" ("PROPERTY_IDX_MUKIM_CODE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194555800
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194555800" ON "CMS_STAGE_PROP_IDX_MUKIM_CODE" ("PROPERTY_IDX_MUKIM_CODE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194555940
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194555940" ON "CMS_PROPERTY_IDX_PROPERTY_TYPE" ("PROPERTY_IDX_PROPERTY_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194556010
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194556010" ON "CMS_STAGE_PROP_IDX_PROP_TYPE" ("PROPERTY_IDX_PROPERTY_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194556070
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194556070" ON "CMS_SEC_ENVELOPE" ("SEC_ENVELOPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194556130
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194556130" ON "CMS_STAGE_SEC_ENVELOPE" ("SEC_ENVELOPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194556190
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194556190" ON "CMS_SEC_ENVELOPE_ITEM" ("SEC_ENVELOPE_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194556240
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194556240" ON "CMS_STAGE_SEC_ENVELOPE_ITEM" ("SEC_ENVELOPE_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194556770
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194556770" ON "CMS_TAT_PARAM" ("TAT_PARAM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194556820
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194556820" ON "CMS_TAT_PARAM_ITEM" ("TAT_PARAM_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194556870
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194556870" ON "CMS_STAGE_TAT_PARAM" ("TAT_PARAM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194556910
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194556910" ON "CMS_STAGE_TAT_PARAM_ITEM" ("TAT_PARAM_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194556940
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194556940" ON "CMS_TAT_TRACK" ("TAT_TRACK_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194556990
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194556990" ON "CMS_TAT_TRACK_ITEM" ("TAT_TRACK_STAGE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194557460
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194557460" ON "STP_MASTER_TRANS" ("MASTER_TRX_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194557580
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194557580" ON "STP_TRANS" ("TRX_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194557690
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194557690" ON "STP_TRANS_HISTORY" ("TRX_HISTORY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194557740
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194557740" ON "STP_TRANS_ERROR" ("ERROR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194558290
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194558290" ON "CMS_FACILITY_MASTER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194558350
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194558350" ON "CMS_FAC_BNM_CODES" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194558400
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194558400" ON "CMS_FAC_FEE_CHARGE" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194558440
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194558440" ON "CMS_FAC_GENERAL" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194558510
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194558510" ON "CMS_FAC_INSURANCE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194558570
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194558570" ON "CMS_FAC_OFFICER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194558630
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194558630" ON "CMS_FAC_RELATIONSHIP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194558710
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194558710" ON "CMS_FAC_INTEREST" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194558760
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194558760" ON "CMS_FAC_PAYMENT" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194558820
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194558820" ON "CMS_STG_FACILITY_MASTER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194558870
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194558870" ON "CMS_STG_FAC_BNM_CODES" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194558910
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194558910" ON "CMS_STG_FAC_FEE_CHARGE" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194558970
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194558970" ON "CMS_STG_FAC_GENERAL" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194559040
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194559040" ON "CMS_STG_FAC_INSURANCE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194559080
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194559080" ON "CMS_STG_FAC_OFFICER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194559150
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194559150" ON "CMS_STG_FAC_RELATIONSHIP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194559260
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194559260" ON "CMS_STG_FAC_INTEREST" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194559320
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194559320" ON "CMS_STG_FAC_PAYMENT" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194559370
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194559370" ON "CMS_FAC_ISLAMIC_MASTER" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194559410
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194559410" ON "CMS_STG_FAC_ISLAMIC_MASTER" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194559460
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194559460" ON "CMS_FAC_MULTI_TIER_FINANCING" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194559540
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194559540" ON "STAGE_FAC_MULTI_TIER_FINANCING" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194559620
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194559620" ON "CMS_FAC_BBA_VARI_PACKAGE" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194559660
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194559660" ON "CMS_STG_FAC_BBA_VARI_PACKAGE" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194559710
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194559710" ON "CMS_FAC_MESSAGE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194559760
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194559760" ON "CMS_FAC_RENTAL_RENEWAL" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194559820
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194559820" ON "CMS_FAC_SECURITY_DEPOSIT" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194559870
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194559870" ON "CMS_STG_FAC_MESSAGE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194559930
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194559930" ON "CMS_STG_FAC_RENTAL_RENEWAL" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194600010
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194600010" ON "CMS_STG_FAC_SECURITY_DEPOSIT" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194600050
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194600050" ON "CMS_FAC_INCREMENTAL" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194600100
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194600100" ON "CMS_STG_FAC_INCREMENTAL" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194600150
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194600150" ON "CMS_FAC_REDUCTION" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194600180
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194600180" ON "CMS_STG_FAC_REDUCTION" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194600470
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194600470" ON "CMS_BATCH_JOB" ("BATCH_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194741990
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194741990" ON "CMS_INTERNAL_LIMIT_PARAMETER" ("INT_LIMIT_PARAM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194742040
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194742040" ON "CMS_STAGE_INTERNAL_LIMIT_PARAM" ("INT_LIMIT_PARAM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194742080
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194742080" ON "SCI_LE_REL" ("SCI_LE_REL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194742140
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194742140" ON "STAGE_LE_REL" ("SCI_LE_REL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194742430
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194742430" ON "CMS_GRP_CREDIT_GRADE" ("GRP_CREDIT_GRADE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194742470
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194742470" ON "CMS_STAGE_GRP_CREDIT_GRADE" ("GRP_CREDIT_GRADE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194742520
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194742520" ON "CMS_GROUP_SUBLIMIT" ("GRP_SUBLIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194742570
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194742570" ON "CMS_STAGE_GROUP_SUBLIMIT" ("GRP_SUBLIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194742630
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194742630" ON "CMS_GROUP_OTRLIMIT" ("GRP_OTRLIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194742680
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194742680" ON "CMS_STAGE_GROUP_OTRLIMIT" ("GRP_OTRLIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194742740
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194742740" ON "CMS_GROUP_MEMBER" ("GRP_MEMBER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194742790
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194742790" ON "CMS_STAGE_GROUP_MEMBER" ("GRP_MEMBER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194743050
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194743050" ON "CMS_BANK_ENTITY_PARAM" ("BANK_ENTITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194743100
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194743100" ON "CMS_STAGE_BANK_ENTITY_PARAM" ("BANK_ENTITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194743850
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194743850" ON "CMS_INTERNAL_CREDIT_RATING" ("INT_CR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194743890
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194743890" ON "CMS_STG_INTERNAL_CREDIT_RATING" ("INT_CR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194747380
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194747380" ON "CMS_PRODUCT_PROGRAM" ("PRODUCT_PROGRAM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194747430
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194747430" ON "CMS_PRODUCT_TYPE" ("PRODUCT_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194747470
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194747470" ON "CMS_STAGE_PRODUCT_PROGRAM" ("PRODUCT_PROGRAM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110121194747500
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110121194747500" ON "CMS_STAGE_PRODUCT_TYPE" ("PRODUCT_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110201110306010
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110201110306010" ON "CMS_TEMP_GEOGRAPHY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174057690
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174057690" ON "REL_CAT" ("CATEGORY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174058210
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174058210" ON "REL_LINK" ("REL_INST_ID", "OBJECT_TYPE_ID", "OBJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174058490
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174058490" ON "OBJECT_TYPE" ("OBJECT_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174058770
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174058770" ON "ID_TABLE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174059020
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174059020" ON "APPLICATIONS" ("APPLICATION_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174059300
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174059300" ON "INDEX_PROPERTY" ("OBJECT_TYPE_ID", "INDEX_NAME", "SEQ_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174059550
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174059550" ON "REL_INSTANCE" ("REL_INST_ID", "REL_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174059760
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174059760" ON "ICM_ACE_LIST" ("ACL_ID", "PRINCIPAL", "USER_FLAG") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174100300
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174100300" ON "ICM_ACL_DEFN" ("ACL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174100550
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174100550" ON "REF_ID_TABLE" ("OBJECT_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174100710
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174100710" ON "OBJECT_INDEX" ("OBJECT_TYPE_ID", "NAME") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174102100
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174102100" ON "MDTASKTYPE00" ("OBJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174102610
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174102610" ON "MDSCHEDEVENT00" ("OBJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174102940
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174102940" ON "MDNAMEDSCHED00" ("OBJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174103290
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174103290" ON "MDFOLLOWONAC00" ("OBJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174103630
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174103630" ON "MDNOTIFICATI00" ("OBJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174104010
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174104010" ON "MDTASKCATEGO00" ("OBJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174104350
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174104350" ON "MDSUCCESSCOD00" ("OBJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174104630
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174104630" ON "MDCODECONDIT00" ("OBJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174104930
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174104930" ON "MDCONTACTNAM00" ("OBJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174105260
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174105260" ON "MDCONTACTGRO00" ("OBJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174105690
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174105690" ON "MDTASKEXECTY00" ("OBJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174106050
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174106050" ON "MDTHISTORYTY00" ("OBJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174106460
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174106460" ON "MDTRESULTTYP00" ("OBJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174106790
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174106790" ON "MDTASKSNAPSH00" ("OBJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110323174107240
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110323174107240" ON "MDTASKSTATIS00" ("OBJECT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110403121943460
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110403121943460" ON "EXPLAIN_INSTANCE" ("EXPLAIN_REQUESTER", "EXPLAIN_TIME", "SOURCE_NAME", "SOURCE_SCHEMA", "SOURCE_VERSION") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110403121943690
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110403121943690" ON "EXPLAIN_STATEMENT" ("EXPLAIN_REQUESTER", "EXPLAIN_TIME", "SOURCE_NAME", "SOURCE_SCHEMA", "SOURCE_VERSION", "EXPLAIN_LEVEL", "STMTNO", "SECTNO") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110403121944270
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110403121944270" ON "EXPLAIN_DIAGNOSTIC" ("EXPLAIN_REQUESTER", "EXPLAIN_TIME", "SOURCE_NAME", "SOURCE_SCHEMA", "SOURCE_VERSION", "EXPLAIN_LEVEL", "STMTNO", "SECTNO", "DIAGNOSTIC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110406120710080
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110406120710080" ON "CMS_RELATIONSHIP_MGR" ("RM_MGR_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110412105837350
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110412105837350" ON "CMS_COUNTRY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110414163848110
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110414163848110" ON "CMS_REGION" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110416160817940
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110416160817940" ON "CMS_STATE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SQL110416160950130
--------------------------------------------------------

  CREATE UNIQUE INDEX "SQL110416160950130" ON "CMS_CITY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index STAGE_ASSET_TRADE_IN_PK1
--------------------------------------------------------

  CREATE INDEX "STAGE_ASSET_TRADE_IN_PK1" ON "STAGE_ASSET_TRADE_IN" ("COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STAGE_CONVENANT_PK1
--------------------------------------------------------

  CREATE INDEX "STAGE_CONVENANT_PK1" ON "STAGE_CONVENANT" ("CONVENANT_REF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STAGE_CONVENANT_SUB_ITEM_PK1
--------------------------------------------------------

  CREATE INDEX "STAGE_CONVENANT_SUB_ITEM_PK1" ON "STAGE_CONVENANT_SUB_ITEM" ("SUB_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STAGE_LIMIT_PROFILE_UDF_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STAGE_LIMIT_PROFILE_UDF_PK" ON "STAGE_LIMIT_PROFILE_UDF" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index STAGE_SCI_LE_UDF_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STAGE_SCI_LE_UDF_PK" ON "STAGE_SCI_LE_UDF" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index STAGE_SCI_LINE_COBORROWER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STAGE_SCI_LINE_COBORROWER_PK" ON "STAGE_SCI_LINE_COBORROWER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index STAGE_SCI_LSP_LMT_XREF_UDF_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STAGE_SCI_LSP_LMT_XREF_UDF_PK" ON "STAGE_SCI_LSP_LMT_XREF_UDF" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index STAGE_SCI_LSP_LMT_XREF_UDF_PK2
--------------------------------------------------------

  CREATE UNIQUE INDEX "STAGE_SCI_LSP_LMT_XREF_UDF_PK2" ON "STAGE_SCI_LSP_LMT_XREF_UDF_2" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index STAGE_WAIVER_GEN
--------------------------------------------------------

  CREATE UNIQUE INDEX "STAGE_WAIVER_GEN" ON "STAGE_WAIVER_GENERATED" ("WAIVER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STAG_WAIVE_GEN_ITM
--------------------------------------------------------

  CREATE UNIQUE INDEX "STAG_WAIVE_GEN_ITM" ON "STAGE_WAIVER_GENERATED_ITEM" ("WAIVER_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STGE_TEMP_IMAGE_UPLOAD_INDEX1
--------------------------------------------------------

  CREATE INDEX "STGE_TEMP_IMAGE_UPLOAD_INDEX1" ON "STGE_TEMP_IMAGE_UPLOAD" ("STATUS", "FROM_SERVER") 
  ;
--------------------------------------------------------
--  DDL for Index STGE_TEMP_IMAGE_UPLOAD_INDEX2
--------------------------------------------------------

  CREATE INDEX "STGE_TEMP_IMAGE_UPLOAD_INDEX2" ON "STGE_TEMP_IMAGE_UPLOAD" ("CUST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STGE_TEMP_IMAGE_UPLOAD_INDEX3
--------------------------------------------------------

  CREATE INDEX "STGE_TEMP_IMAGE_UPLOAD_INDEX3" ON "STGE_TEMP_IMAGE_UPLOAD" ("CUST_ID", "SUBFOLDER_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index STG_AIRCRAFT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STG_AIRCRAFT_PK" ON "CMS_STAGE_ASSET_AIRCRAFT" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_APPR_LMTS_IDX1
--------------------------------------------------------

  CREATE INDEX "STG_APPR_LMTS_IDX1" ON "STAGE_LIMIT" ("LMT_BCA_REF_NUM", "LMT_FAC_CODE", "LMT_FAC_SEQ", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_APPR_LMTS_IDX2
--------------------------------------------------------

  CREATE INDEX "STG_APPR_LMTS_IDX2" ON "STAGE_LIMIT" ("CMS_LIMIT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_APPR_LMTS_IDX3
--------------------------------------------------------

  CREATE INDEX "STG_APPR_LMTS_IDX3" ON "STAGE_LIMIT" ("CMS_LSP_APPR_LMTS_ID", "LMT_ID", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_APPR_LMTS_IDX4
--------------------------------------------------------

  CREATE INDEX "STG_APPR_LMTS_IDX4" ON "STAGE_LIMIT" ("CMS_LIMIT_STATUS", "CMS_LSP_APPR_LMTS_ID", "LMT_OUTER_LMT_ID", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_APPR_LMTS_IDX5
--------------------------------------------------------

  CREATE UNIQUE INDEX "STG_APPR_LMTS_IDX5" ON "STAGE_LIMIT" ("CMS_BKG_COUNTRY", "CMS_BKG_ORGANISATION", "CMS_LIMIT_PROFILE_ID", "CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_ASSET_GOLD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STG_ASSET_GOLD_PK" ON "CMS_STAGE_ASSET_GOLD" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_ASSET_PLANT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STG_ASSET_PLANT_PK" ON "CMS_STAGE_ASSET_PLANT_EQUIP" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_ASSET_VEH_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STG_ASSET_VEH_PK" ON "CMS_STAGE_ASSET_VEHICLE" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_ASST_VESSEL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STG_ASST_VESSEL_PK" ON "CMS_STAGE_ASSET_VESSEL" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_BUS_PRM_I1
--------------------------------------------------------

  CREATE INDEX "STG_BUS_PRM_I1" ON "STAGE_BUS_PARAM" ("GROUP_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CASH_DEP_I1
--------------------------------------------------------

  CREATE INDEX "STG_CASH_DEP_I1" ON "CMS_STAGE_CASH_DEPOSIT" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CASH_DEP_I2
--------------------------------------------------------

  CREATE INDEX "STG_CASH_DEP_I2" ON "CMS_STAGE_CASH_DEPOSIT" ("DEPOSIT_RECEIPT_NUMBER", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CCC_GEN_I1
--------------------------------------------------------

  CREATE INDEX "STG_CCC_GEN_I1" ON "STAGE_CCC_GENERATED" ("CMS_LE_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CCC_GEN_I2
--------------------------------------------------------

  CREATE INDEX "STG_CCC_GEN_I2" ON "STAGE_CCC_GENERATED" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CCC_GEN_I3
--------------------------------------------------------

  CREATE INDEX "STG_CCC_GEN_I3" ON "STAGE_CCC_GENERATED" ("CMS_PLEDGOR_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CCC_IT_I1
--------------------------------------------------------

  CREATE INDEX "STG_CCC_IT_I1" ON "STAGE_CCC_GENERATED_ITEM" ("CCC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CCDL_I1
--------------------------------------------------------

  CREATE INDEX "STG_CCDL_I1" ON "STAGE_CC_DOC_LOC" ("CMS_LE_SUB_PROFILE_ID", "CMS_LSP_LMT_PROFILE_ID", "SUB_CATEGORY") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CHG_DTL_I1
--------------------------------------------------------

  CREATE INDEX "STG_CHG_DTL_I1" ON "CMS_STAGE_CHARGE_DETAIL" ("CMS_COLLATERAL_ID", "SECURITY_RANK") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CHG_DTL_I2
--------------------------------------------------------

  CREATE INDEX "STG_CHG_DTL_I2" ON "CMS_STAGE_CHARGE_DETAIL" ("SCI_LAS_SEC_ID", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CHG_DTL_I3
--------------------------------------------------------

  CREATE INDEX "STG_CHG_DTL_I3" ON "CMS_STAGE_CHARGE_DETAIL" ("CHARGE_DETAIL_ID", "SOURCE_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CHKLST_I1
--------------------------------------------------------

  CREATE INDEX "STG_CHKLST_I1" ON "STAGE_CHECKLIST" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CHKLST_I2
--------------------------------------------------------

  CREATE INDEX "STG_CHKLST_I2" ON "STAGE_CHECKLIST" ("CATEGORY", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CHKLST_I3
--------------------------------------------------------

  CREATE INDEX "STG_CHKLST_I3" ON "STAGE_CHECKLIST" ("CMS_LMP_SUB_PROFILE_ID", "CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CHKLST_I4
--------------------------------------------------------

  CREATE INDEX "STG_CHKLST_I4" ON "STAGE_CHECKLIST" ("CMS_COLLATERAL_ID", "CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CL_IT_I1
--------------------------------------------------------

  CREATE INDEX "STG_CL_IT_I1" ON "STAGE_CHECKLIST_ITEM" ("DOC_ITEM_REF") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CL_IT_I2
--------------------------------------------------------

  CREATE INDEX "STG_CL_IT_I2" ON "STAGE_CHECKLIST_ITEM" ("EXPIRY_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CL_IT_I3
--------------------------------------------------------

  CREATE INDEX "STG_CL_IT_I3" ON "STAGE_CHECKLIST_ITEM" ("CHECKLIST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CL_IT_I4
--------------------------------------------------------

  CREATE INDEX "STG_CL_IT_I4" ON "STAGE_CHECKLIST_ITEM" ("IDENTIFY_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CMD_APP_I1
--------------------------------------------------------

  CREATE INDEX "STG_CMD_APP_I1" ON "CMS_STAGE_CMDT_APPV" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CMT_APV_I1
--------------------------------------------------------

  CREATE INDEX "STG_CMT_APV_I1" ON "CMS_STAGE_CMDT_APPV" ("PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CMT_BUY_I1
--------------------------------------------------------

  CREATE INDEX "STG_CMT_BUY_I1" ON "CMS_STAGE_CMDT_BUYER" ("PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CMT_CNT_I1
--------------------------------------------------------

  CREATE INDEX "STG_CMT_CNT_I1" ON "CMS_STAGE_CMDT_CNTR" ("APPV_COMMODITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CMT_CNT_I2
--------------------------------------------------------

  CREATE INDEX "STG_CMT_CNT_I2" ON "CMS_STAGE_CMDT_CNTR" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CMT_CNT_I3
--------------------------------------------------------

  CREATE INDEX "STG_CMT_CNT_I3" ON "CMS_STAGE_CMDT_CNTR" ("SUPPLIER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CMT_DL_I1
--------------------------------------------------------

  CREATE INDEX "STG_CMT_DL_I1" ON "CMS_STAGE_CMDT_DEAL" ("CMS_LSP_CO_BORROW_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CMT_DL_I2
--------------------------------------------------------

  CREATE INDEX "STG_CMT_DL_I2" ON "CMS_STAGE_CMDT_DEAL" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CMT_DL_I3
--------------------------------------------------------

  CREATE INDEX "STG_CMT_DL_I3" ON "CMS_STAGE_CMDT_DEAL" ("CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CMT_DL_I4
--------------------------------------------------------

  CREATE INDEX "STG_CMT_DL_I4" ON "CMS_STAGE_CMDT_DEAL" ("CNTR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CMT_DL_I5
--------------------------------------------------------

  CREATE INDEX "STG_CMT_DL_I5" ON "CMS_STAGE_CMDT_DEAL" ("CNTR_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CMT_DL_I6
--------------------------------------------------------

  CREATE INDEX "STG_CMT_DL_I6" ON "CMS_STAGE_CMDT_DEAL" ("HEDGE_CNTR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CMT_LN_I1
--------------------------------------------------------

  CREATE INDEX "STG_CMT_LN_I1" ON "CMS_STAGE_CMDT_LOAN" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CMT_PRI_I1
--------------------------------------------------------

  CREATE INDEX "STG_CMT_PRI_I1" ON "CMS_STAGE_CMDT_PRICE" ("PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CMT_SUP_I1
--------------------------------------------------------

  CREATE INDEX "STG_CMT_SUP_I1" ON "CMS_STAGE_CMDT_SUPPLIER" ("PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CMT_UOM_I1
--------------------------------------------------------

  CREATE INDEX "STG_CMT_UOM_I1" ON "CMS_STAGE_CMDT_UOM" ("PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_COL_TSK_I1
--------------------------------------------------------

  CREATE INDEX "STG_COL_TSK_I1" ON "STAGE_COLLATERAL_TASK" ("CMS_LE_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CONV_I1
--------------------------------------------------------

  CREATE INDEX "STG_CONV_I1" ON "STAGE_CONVENANT" ("RECURRENT_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CONV_SIT_I1
--------------------------------------------------------

  CREATE INDEX "STG_CONV_SIT_I1" ON "STAGE_CONVENANT_SUB_ITEM" ("CONVENANT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CONV_SIT_I2
--------------------------------------------------------

  CREATE INDEX "STG_CONV_SIT_I2" ON "STAGE_CONVENANT_SUB_ITEM" ("DEFERRED_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CSTO_DOC_I1
--------------------------------------------------------

  CREATE INDEX "STG_CSTO_DOC_I1" ON "STAGE_CUSTODIAN_DOC" ("STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CSTO_DOC_I2
--------------------------------------------------------

  CREATE INDEX "STG_CSTO_DOC_I2" ON "STAGE_CUSTODIAN_DOC" ("CHECKLIST_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CSTO_DOC_I3
--------------------------------------------------------

  CREATE INDEX "STG_CSTO_DOC_I3" ON "STAGE_CUSTODIAN_DOC" ("CHECKLIST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CSTO_DOC_I4
--------------------------------------------------------

  CREATE INDEX "STG_CSTO_DOC_I4" ON "STAGE_CUSTODIAN_DOC" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_CUS_DOC_I1
--------------------------------------------------------

  CREATE INDEX "STG_CUS_DOC_I1" ON "CMS_STAGE_CUST_DOC" ("CHECKLIST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_DDN_GEN_I1
--------------------------------------------------------

  CREATE INDEX "STG_DDN_GEN_I1" ON "STAGE_DDN_GENERATED" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_DDN_IT_I1
--------------------------------------------------------

  CREATE INDEX "STG_DDN_IT_I1" ON "STAGE_DDN_GENERATED_ITEM" ("DDN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_DEFER_GEN
--------------------------------------------------------

  CREATE UNIQUE INDEX "STG_DEFER_GEN" ON "STAGE_DEFERRAL_GENERATED" ("DEFERRAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_DEFER_GEN_ITM
--------------------------------------------------------

  CREATE UNIQUE INDEX "STG_DEFER_GEN_ITM" ON "STAGE_DEFERRAL_GENERATED_ITEM" ("DEFERRAL_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_DEF_IT_I1
--------------------------------------------------------

  CREATE INDEX "STG_DEF_IT_I1" ON "STAGE_DEFERRAL_GENERATED_ITEM" ("DEFERRAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_DL_CSH_I1
--------------------------------------------------------

  CREATE INDEX "STG_DL_CSH_I1" ON "CMS_STAGE_DEAL_CASH" ("DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_DOC_IT_I1
--------------------------------------------------------

  CREATE INDEX "STG_DOC_IT_I1" ON "CMS_STAGE_CUST_DOC_ITEM" ("STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index STG_DOC_IT_I2
--------------------------------------------------------

  CREATE INDEX "STG_DOC_IT_I2" ON "CMS_STAGE_CUST_DOC_ITEM" ("CHECKLIST_ITEM_REF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_DOC_IT_I3
--------------------------------------------------------

  CREATE INDEX "STG_DOC_IT_I3" ON "CMS_STAGE_CUST_DOC_ITEM" ("CUSTODIAN_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_FAC_MASTER_IDX
--------------------------------------------------------

  CREATE INDEX "STG_FAC_MASTER_IDX" ON "CMS_STG_FACILITY_MASTER" ("CMS_LSP_APPR_LMTS_ID", "ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_FAC_MULTI_TIER_FINANCING_I
--------------------------------------------------------

  CREATE INDEX "STG_FAC_MULTI_TIER_FINANCING_I" ON "STAGE_FAC_MULTI_TIER_FINANCING" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_FAC_OFFICER_IDX1
--------------------------------------------------------

  CREATE INDEX "STG_FAC_OFFICER_IDX1" ON "CMS_STG_FAC_OFFICER" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_FAC_RELATIONSHIP_IDX1
--------------------------------------------------------

  CREATE INDEX "STG_FAC_RELATIONSHIP_IDX1" ON "CMS_STG_FAC_RELATIONSHIP" ("CMS_FAC_MASTER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_FEE_DTL_IDX1
--------------------------------------------------------

  CREATE INDEX "STG_FEE_DTL_IDX1" ON "CMS_STAGE_FEE_DETAILS" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_FIN_DOC_I1
--------------------------------------------------------

  CREATE INDEX "STG_FIN_DOC_I1" ON "CMS_STAGE_FINANCE_DOC" ("DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_FOREX_I1
--------------------------------------------------------

  CREATE INDEX "STG_FOREX_I1" ON "CMS_STAGE_FOREX" ("FEED_GROUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_HDG_CNT_I1
--------------------------------------------------------

  CREATE INDEX "STG_HDG_CNT_I1" ON "CMS_STAGE_HEDGE_CNTR" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_HDG_EXT_I1
--------------------------------------------------------

  CREATE INDEX "STG_HDG_EXT_I1" ON "CMS_STAGE_HEDGE_EXT" ("DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_INSURANCE_CDS_IDX
--------------------------------------------------------

  CREATE INDEX "STG_INSURANCE_CDS_IDX" ON "CMS_STAGE_INSURANCE_CDS" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LE_REL_IND1
--------------------------------------------------------

  CREATE INDEX "STG_LE_REL_IND1" ON "STAGE_LE_REL" ("PARENT_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LE_REL_IND2
--------------------------------------------------------

  CREATE INDEX "STG_LE_REL_IND2" ON "STAGE_LE_REL" ("CMS_LE_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LMT_CHG_I1
--------------------------------------------------------

  CREATE INDEX "STG_LMT_CHG_I1" ON "CMS_STAGE_LIMIT_CHARGE_MAP" ("CHARGE_DETAIL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LMT_CHG_I3
--------------------------------------------------------

  CREATE INDEX "STG_LMT_CHG_I3" ON "CMS_STAGE_LIMIT_CHARGE_MAP" ("CMS_COLLATERAL_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LMT_CHG_I4_3
--------------------------------------------------------

  CREATE INDEX "STG_LMT_CHG_I4_3" ON "CMS_STAGE_LIMIT_CHARGE_MAP" ("CMS_COLLATERAL_ID", "CMS_LSP_CO_BORROW_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LMT_MAP_I1
--------------------------------------------------------

  CREATE INDEX "STG_LMT_MAP_I1" ON "STAGE_LIMIT_XREF" ("CMS_LSP_SYS_XREF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LMT_MAP_I2
--------------------------------------------------------

  CREATE INDEX "STG_LMT_MAP_I2" ON "STAGE_LIMIT_XREF" ("CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LMT_MAP_I3
--------------------------------------------------------

  CREATE INDEX "STG_LMT_MAP_I3" ON "STAGE_LIMIT_XREF" ("LXM_LE_ID", "LXM_LSP_ID", "LXM_LSX_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LMT_PROFILE_IDX1
--------------------------------------------------------

  CREATE INDEX "STG_LMT_PROFILE_IDX1" ON "STAGE_LIMIT_PROFILE" ("LLP_BCA_REF_NUM", "SOURCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LMT_SEC_I1
--------------------------------------------------------

  CREATE INDEX "STG_LMT_SEC_I1" ON "CMS_STAGE_LIMIT_SECURITY_MAP" ("CMS_LSP_CO_BORROW_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LMT_SEC_I2
--------------------------------------------------------

  CREATE INDEX "STG_LMT_SEC_I2" ON "CMS_STAGE_LIMIT_SECURITY_MAP" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LMT_SEC_I3
--------------------------------------------------------

  CREATE INDEX "STG_LMT_SEC_I3" ON "CMS_STAGE_LIMIT_SECURITY_MAP" ("CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LN_GUA_I1
--------------------------------------------------------

  CREATE INDEX "STG_LN_GUA_I1" ON "CMS_STAGE_LOAN_GUARANTOR" ("LOAN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LN_LMT_I1
--------------------------------------------------------

  CREATE INDEX "STG_LN_LMT_I1" ON "CMS_STAGE_LOAN_LMT" ("CMS_LSP_CO_BORROW_LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LN_LMT_I2
--------------------------------------------------------

  CREATE INDEX "STG_LN_LMT_I2" ON "CMS_STAGE_LOAN_LMT" ("LOAN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LN_LMT_I3
--------------------------------------------------------

  CREATE INDEX "STG_LN_LMT_I3" ON "CMS_STAGE_LOAN_LMT" ("CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LN_OBL_I1
--------------------------------------------------------

  CREATE INDEX "STG_LN_OBL_I1" ON "CMS_STAGE_LOAN_OBLIGOR" ("LOAN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LN_PAR_I1
--------------------------------------------------------

  CREATE INDEX "STG_LN_PAR_I1" ON "CMS_STAGE_LOAN_PARTICIPANT" ("LOAN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LN_PAY_I1
--------------------------------------------------------

  CREATE INDEX "STG_LN_PAY_I1" ON "CMS_STAGE_LOAN_PAYMT" ("LOAN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_LN_SL_I1
--------------------------------------------------------

  CREATE INDEX "STG_LN_SL_I1" ON "CMS_STAGE_LOAN_SUB_LMT" ("LOAN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_PCH_SAL_I1
--------------------------------------------------------

  CREATE INDEX "STG_PCH_SAL_I1" ON "CMS_STAGE_PCH_SALE" ("BUYER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_PCH_SAL_I2
--------------------------------------------------------

  CREATE INDEX "STG_PCH_SAL_I2" ON "CMS_STAGE_PCH_SALE" ("DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_PCH_SAL_I3
--------------------------------------------------------

  CREATE INDEX "STG_PCH_SAL_I3" ON "CMS_STAGE_PCH_SALE" ("SUPPLIER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_PDC_I1
--------------------------------------------------------

  CREATE INDEX "STG_PDC_I1" ON "CMS_STAGE_ASSET_PDC" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_PORT_IT_I1
--------------------------------------------------------

  CREATE INDEX "STG_PORT_IT_I1" ON "CMS_STAGE_PORTFOLIO_ITEM" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_PRI_FED_I1
--------------------------------------------------------

  CREATE INDEX "STG_PRI_FED_I1" ON "CMS_STAGE_PRICE_FEED" ("FEED_GROUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_PROPERTY_IDX_IDX1
--------------------------------------------------------

  CREATE INDEX "STG_PROPERTY_IDX_IDX1" ON "CMS_STAGE_PROPERTY_IDX" ("COUNTRY_CODE", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index STG_PROPERTY_IDX_PROPERTY_TYPE
--------------------------------------------------------

  CREATE INDEX "STG_PROPERTY_IDX_PROPERTY_TYPE" ON "CMS_STAGE_PROP_IDX_PROP_TYPE" ("PROPERTY_IDX_ITEM_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index STG_PROP_IDX_DISTRICT_CODE_IDX
--------------------------------------------------------

  CREATE INDEX "STG_PROP_IDX_DISTRICT_CODE_IDX" ON "CMS_STG_PROP_IDX_DISTRICT_CODE" ("PROPERTY_IDX_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_PROP_IDX_ITEM_IDX1
--------------------------------------------------------

  CREATE INDEX "STG_PROP_IDX_ITEM_IDX1" ON "CMS_STAGE_PROPERTY_IDX_ITEM" ("PROPERTY_IDX_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index STG_PROP_IDX_MUKIM_CODE_IDX1
--------------------------------------------------------

  CREATE INDEX "STG_PROP_IDX_MUKIM_CODE_IDX1" ON "CMS_STAGE_PROP_IDX_MUKIM_CODE" ("PROPERTY_IDX_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_PROP_IDX_SEC_SUBTYPE_IDX1
--------------------------------------------------------

  CREATE INDEX "STG_PROP_IDX_SEC_SUBTYPE_IDX1" ON "CMS_STAGE_PROP_IDX_SEC_SUBTYPE" ("PROPERTY_IDX_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index STG_PSCC_GEN_I1
--------------------------------------------------------

  CREATE INDEX "STG_PSCC_GEN_I1" ON "STAGE_PSCC_GENERATED" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_PSCC_IT_I1
--------------------------------------------------------

  CREATE INDEX "STG_PSCC_IT_I1" ON "STAGE_PSCC_GENERATED_ITEM" ("PSCC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_RCP_REL_I1
--------------------------------------------------------

  CREATE INDEX "STG_RCP_REL_I1" ON "CMS_STAGE_RCPT_RELEASE" ("DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_RECOVERY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STG_RECOVERY_PK" ON "CMS_STAGE_SEC_RECOVERY" ("RECOVERY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_RECOV_EXP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STG_RECOV_EXP_PK" ON "CMS_STAGE_SEC_RECOVERY_EXPENSE" ("RECOVERY_EXPENSE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_RECOV_INC_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STG_RECOV_INC_PK" ON "CMS_STAGE_SEC_RECOVERY_INCOME" ("RECOVERY_INCOME_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_REC_DIT_I1
--------------------------------------------------------

  CREATE INDEX "STG_REC_DIT_I1" ON "STAGE_RECURRENT_DOC_ITEM" ("RECURRENT_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_REC_DOC_I1
--------------------------------------------------------

  CREATE INDEX "STG_REC_DOC_I1" ON "STAGE_RECURRENT_DOC" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_REC_DSIT_I1
--------------------------------------------------------

  CREATE INDEX "STG_REC_DSIT_I1" ON "STAGE_RECURRENT_DOC_SUB_ITEM" ("RECURRENT_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_SCC_GEN_I1
--------------------------------------------------------

  CREATE INDEX "STG_SCC_GEN_I1" ON "STAGE_SCC_GENERATED" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_SCC_IT_I1
--------------------------------------------------------

  CREATE INDEX "STG_SCC_IT_I1" ON "STAGE_SCC_GENERATED_ITEM" ("SCC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_SEC_ENVELOPE_ID_IDX1
--------------------------------------------------------

  CREATE INDEX "STG_SEC_ENVELOPE_ID_IDX1" ON "CMS_STAGE_SEC_ENVELOPE" ("SEC_LSP_LMT_PROFILE_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index STG_SEC_ENVELOPE_ITEM_IDX1
--------------------------------------------------------

  CREATE INDEX "STG_SEC_ENVELOPE_ITEM_IDX1" ON "CMS_STAGE_SEC_ENVELOPE_ITEM" ("SEC_ENVELOPE_ID", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index STG_SEC_I1
--------------------------------------------------------

  CREATE INDEX "STG_SEC_I1" ON "CMS_STAGE_SECURITY" ("CMS_COLLATERAL_ID", "SCI_SECURITY_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_STL_I1
--------------------------------------------------------

  CREATE INDEX "STG_STL_I1" ON "CMS_STAGE_SETTLEMENT" ("DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_STL_RCP_I1
--------------------------------------------------------

  CREATE INDEX "STG_STL_RCP_I1" ON "CMS_STAGE_STTLMT_RCPT_MAP" ("WAREHSE_RCPT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_SYS_XREF_IDX1
--------------------------------------------------------

  CREATE INDEX "STG_SYS_XREF_IDX1" ON "CMS_STAGE_LSP_SYS_XREF" ("LSX_EXT_SYS_ACCT_NUM", "LSX_EXT_SYS_ACCT_SEQ", "LSX_EXT_SYS_CODE_VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index STG_TEAM_ORG_GRP
--------------------------------------------------------

  CREATE UNIQUE INDEX "STG_TEAM_ORG_GRP" ON "STAGE_TEAM_ORG_GROUP_CODE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_TTL_DOC_I1
--------------------------------------------------------

  CREATE INDEX "STG_TTL_DOC_I1" ON "CMS_STAGE_TITLE_DOC" ("DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_TTL_DOC_I2
--------------------------------------------------------

  CREATE INDEX "STG_TTL_DOC_I2" ON "CMS_STAGE_TITLE_DOC" ("TITLEDOC_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_VAL_I1
--------------------------------------------------------

  CREATE INDEX "STG_VAL_I1" ON "CMS_STAGE_VALUATION" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_WRH_RCP_I1
--------------------------------------------------------

  CREATE INDEX "STG_WRH_RCP_I1" ON "CMS_STAGE_WRHSE_RCPT" ("TITLE_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_WRH_RCP_I2
--------------------------------------------------------

  CREATE INDEX "STG_WRH_RCP_I2" ON "CMS_STAGE_WRHSE_RCPT" ("WAREHOUSE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_WV_IT_I1
--------------------------------------------------------

  CREATE INDEX "STG_WV_IT_I1" ON "STAGE_WAIVER_GENERATED_ITEM" ("WAIVER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STG_XREF_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STG_XREF_ID_PK" ON "CMS_STAGE_LSP_SYS_XREF" ("CMS_LSP_SYS_XREF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STL_RCP_MAP_I1
--------------------------------------------------------

  CREATE INDEX "STL_RCP_MAP_I1" ON "CMS_STTLMT_RCPT_MAP" ("WAREHSE_RCPT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STMT_I1
--------------------------------------------------------

  CREATE INDEX "STMT_I1" ON "EXPLAIN_STATEMENT" ("EXPLAIN_LEVEL", "EXPLAIN_TIME", "SECTNO", "STMTNO") 
  ;
--------------------------------------------------------
--  DDL for Index STM_I1
--------------------------------------------------------

  CREATE INDEX "STM_I1" ON "EXPLAIN_STREAM" ("EXPLAIN_LEVEL", "EXPLAIN_TIME", "SECTNO", "STMTNO") 
  ;
--------------------------------------------------------
--  DDL for Index STP_COMMON_ERR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STP_COMMON_ERR_PK" ON "STP_ERROR_CODE_MAP" ("ERROR_CODE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STP_MASTER_TRX_IDX1
--------------------------------------------------------

  CREATE INDEX "STP_MASTER_TRX_IDX1" ON "STP_MASTER_TRANS" ("TRANSACTION_ID", "TRANSACTION_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index STP_MASTER_TRX_IDX2
--------------------------------------------------------

  CREATE INDEX "STP_MASTER_TRX_IDX2" ON "STP_MASTER_TRANS" ("LAST_SUBMISSION_DATE", "STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index STP_TRANS_ERROR_I1
--------------------------------------------------------

  CREATE INDEX "STP_TRANS_ERROR_I1" ON "STP_TRANS_ERROR" ("TRX_UID") 
  ;
--------------------------------------------------------
--  DDL for Index STP_TRANS_HISTORY_I1
--------------------------------------------------------

  CREATE INDEX "STP_TRANS_HISTORY_I1" ON "STP_TRANS_HISTORY" ("TRX_UID") 
  ;
--------------------------------------------------------
--  DDL for Index STP_TRANS_I1
--------------------------------------------------------

  CREATE INDEX "STP_TRANS_I1" ON "STP_TRANS" ("TRX_UID") 
  ;
--------------------------------------------------------
--  DDL for Index STP_TRANS_I2
--------------------------------------------------------

  CREATE INDEX "STP_TRANS_I2" ON "STP_TRANS" ("MASTER_TRX_ID", "REFERENCE_ID", "TRX_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index ST_CTRY_LIMIT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST_CTRY_LIMIT_PK" ON "CMS_STAGE_COUNTRY_LIMIT" ("COUNTRY_LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ST_CTRY_RATING_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST_CTRY_RATING_PK" ON "CMS_STAGE_COUNTRY_RATING" ("COUNTRY_RATING_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ST_ENT_LMT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST_ENT_LMT_PK" ON "CMS_STAGE_ENTITY_LIMIT" ("ENTITY_LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ST_MFCHKLSTITEM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST_MFCHKLSTITEM_PK" ON "CMS_STAGE_MF_CHECKLIST_ITEM" ("MF_CHECKLIST_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ST_MFSECSUBTYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST_MFSECSUBTYPE_PK" ON "CMS_STAGE_MF_TEMPLATE_SEC_SUBT" ("TEMPLATE_SUBTYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ST_MF_CHECKLIST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST_MF_CHECKLIST_PK" ON "CMS_STAGE_MF_CHECKLIST" ("MF_CHECKLIST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ST_MF_ITEM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST_MF_ITEM_PK" ON "CMS_STAGE_MF_ITEM" ("MF_ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ST_MF_TEMPLATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST_MF_TEMPLATE_PK" ON "CMS_STAGE_MF_TEMPLATE" ("MF_TEMPLATE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ST_SCTR_LMT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ST_SCTR_LMT_PK" ON "CMS_STAGE_SECTOR_LIMIT" ("SECTOR_LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SUBCIFIDINDEX
--------------------------------------------------------

  CREATE INDEX "SUBCIFIDINDEX" ON "SCI_LE_SUB_PROFILE" ("LSP_LE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SUB_SECTOR_LIMIT
--------------------------------------------------------

  CREATE UNIQUE INDEX "SUB_SECTOR_LIMIT" ON "CMS_SUB_SECTOR_LIMIT" ("SUB_SECTOR_LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SUB_SECTOR_LIMIT_3
--------------------------------------------------------

  CREATE UNIQUE INDEX "SUB_SECTOR_LIMIT_3" ON "CMS_STAGE_SUB_SECTOR_LIMIT" ("SUB_SECTOR_LIMIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYSTEMPK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEMPK" ON "SCI_LE_VENDOR_DETAILS" ("CMS_LE_VENDOR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYSTEM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM_PK" ON "STAGE_SCI_LE_VENDOR_DETAILS" ("CMS_LE_VENDOR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00145760
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00145760" ON "CMS_LIEN" ("LIEN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267074
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267074" ON "CMS_FCUBSDATA_LOG_BKP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267097
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267097" ON "CMS_STAGE_PRODUCT_MASTER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267158
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267158" ON "CMS_STATE_PINCODE_MAP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267176
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267176" ON "CMS_STAGE_IFSC_CODE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267219
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267219" ON "CMS_ADD_DOC_FAC_DET" ("ADD_DOC_FAC_DET_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267300
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267300" ON "CMS_STAGE_COLLATERAL_ROC_MAP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267413
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267413" ON "STAGE_DIARY_EMAIL_MAP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267449
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267449" ON "RAM_RATINGUPLOAD_DETAILS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267455
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267455" ON "CMS_GOODS_MASTER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267468
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267468" ON "CMS_NPADATA_LOG" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267510
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267510" ON "CMS_COLLATERAL_ROC_MAP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267617
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267617" ON "STAGE_DIARY_EMAIL_SEG_MAP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267693
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267693" ON "CMS_PSRDATA_LOG_BKP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267713
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267713" ON "CMS_NPA_TRAQ_CODE_MASTER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267839
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267839" ON "CMS_STAGE_CERSAI_MAPPING" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267907
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267907" ON "CMS_STAGE_STATE_PINCODE_MAP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267925
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267925" ON "CMS_IFSC_CODE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267933
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267933" ON "STAGE_DEFERRAL_UPLOAD" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00267945
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00267945" ON "CMS_FCUBSDATA_LOG" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00268008
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00268008" ON "CMS_STAGE_ADD_DOC_FAC_DET" ("ADD_DOC_FAC_DET_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00268035
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00268035" ON "CMS_DIARY_EMAIL_SEG_MAP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00268052
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00268052" ON "STGE_TEMP_IMAGE_UPLOAD" ("IMG_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00268089
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00268089" ON "CMS_STAGE_NPA_TRAQ_CODE_MASTER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00268141
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00268141" ON "CMS_STAGE_GOODS_MASTER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00268160
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00268160" ON "CMS_STAGE_LIEN" ("LIEN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00268208
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00268208" ON "CMS_PSRDATA_LOG" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00268217
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00268217" ON "CMS_PRODUCT_MASTER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00268220
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00268220" ON "CMS_CERSAI_MAPPING" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00268221
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00268221" ON "CMS_FCCBRANCH_MASTER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00268250
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00268250" ON "CMS_STAGE_EXCLUDED_FACILITY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00268264
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00268264" ON "CMS_DEFERRAL_UPLOAD" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00268279
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00268279" ON "CMS_DIARY_EMAIL_MAP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00268295
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00268295" ON "CMS_STAGE_FCCBRANCH_MASTER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C00268318
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C00268318" ON "CMS_EXCLUDED_FACILITY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C0056152
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0056152" ON "CMS_STAGE_CITY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C0056172
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0056172" ON "CMS_STAGE_COUNTRY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C0056177
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0056177" ON "CMS_STAGE_REGION" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C0056183
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0056183" ON "CMS_STAGE_STATE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C0058795
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0058795" ON "CMS_DISCREPENCY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C0058804
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0058804" ON "CMS_STAGE_DISCREPENCY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C0058808
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0058808" ON "CMS_DISC_FACILITY_LIST" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C0058814
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0058814" ON "CMS_STAGE_DISC_FAC_LIST" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C0058859
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0058859" ON "CMS_EXCHANGE_OF_INFORMATION" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C0059055
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0059055" ON "CMS_GENERAL_PARAM" ("PARAM_CODE", "PARAM_NAME", "PARAM_VALUE", "UI_VIEW") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193319C00005$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193319C00005$$" ON "CMS_MQ_MESSAGE_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193319C00010$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193319C00010$$" ON "CMS_MQ_MESSAGE_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193319C00011$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193319C00011$$" ON "CMS_MQ_MESSAGE_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193326C00007$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193326C00007$$" ON "CMS_PROPERTY_PARAMETERS" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193329C00012$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193329C00012$$" ON "CMS_STAGE_DIRECTOR_MASTER" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193332C00007$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193332C00007$$" ON "CMS_STAGE_PROPERTY_PARAMETERS" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193335C00012$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193335C00012$$" ON "EXPLAIN_ARGUMENT" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193338C00012$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193338C00012$$" ON "EXPLAIN_DIAGNOSTIC_DATA" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193341C00016$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193341C00016$$" ON "EXPLAIN_PREDICATE" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193344C00015$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193344C00015$$" ON "EXPLAIN_STATEMENT" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193344C00016$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193344C00016$$" ON "EXPLAIN_STATEMENT" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193349C00019$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193349C00019$$" ON "EXPLAIN_STREAM" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193349C00022$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193349C00022$$" ON "EXPLAIN_STREAM" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193349C00023$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193349C00023$$" ON "EXPLAIN_STREAM" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193356C00015$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193356C00015$$" ON "MDNOTIFICATI00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193356C00016$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193356C00016$$" ON "MDNOTIFICATI00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193356C00022$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193356C00022$$" ON "MDNOTIFICATI00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193363C00025$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193363C00025$$" ON "MDTASKEXECTY00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193363C00033$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193363C00033$$" ON "MDTASKEXECTY00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193363C00038$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193363C00038$$" ON "MDTASKEXECTY00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193370C00023$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193370C00023$$" ON "MDTASKSNAPSH00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193370C00031$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193370C00031$$" ON "MDTASKSNAPSH00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193370C00035$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193370C00035$$" ON "MDTASKSNAPSH00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193377C00020$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193377C00020$$" ON "MDTASKTYPE00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193377C00026$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193377C00026$$" ON "MDTASKTYPE00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193377C00027$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193377C00027$$" ON "MDTASKTYPE00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193377C00043$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193377C00043$$" ON "MDTASKTYPE00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193386C00015$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193386C00015$$" ON "MDTHISTORYTY00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193386C00019$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193386C00019$$" ON "MDTHISTORYTY00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193386C00035$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193386C00035$$" ON "MDTHISTORYTY00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193386C00036$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193386C00036$$" ON "MDTHISTORYTY00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193386C00045$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193386C00045$$" ON "MDTHISTORYTY00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193397C00012$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193397C00012$$" ON "MDTRESULTTYP00" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193400C00011$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193400C00011$$" ON "NOTIFICATION" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193403C00010$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193403C00010$$" ON "SESSIONS" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193403C00011$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193403C00011$$" ON "SESSIONS" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193408C00011$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193408C00011$$" ON "STP_TRANS" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193411C00011$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193411C00011$$" ON "STP_TRANS_HISTORY" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193414C00002$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193414C00002$$" ON "TEST_MASTER" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193414C00003$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193414C00003$$" ON "TEST_MASTER" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193414C00004$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193414C00004$$" ON "TEST_MASTER" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193414C00005$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193414C00005$$" ON "TEST_MASTER" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193423C00013$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193423C00013$$" ON "TRANSACTION" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193426C00013$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193426C00013$$" ON "TRANSACTION_1" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193429C00013$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193429C00013$$" ON "TRANSACTION_1406" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193433C00013$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193433C00013$$" ON "TRANSACTION_BK_02" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193436C00013$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193436C00013$$" ON "TRANSACTION_BK_01" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193439C00013$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193439C00013$$" ON "TRANSACTION_BK_3813" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193442C00013$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193442C00013$$" ON "TRANSACTION_19122013" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193450C00009$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193450C00009$$" ON "CMS_INTERFACE_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193450C00010$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193450C00010$$" ON "CMS_INTERFACE_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193455C00009$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193455C00009$$" ON "CMS_INTERFACE_LOG_BKP" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193455C00010$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193455C00010$$" ON "CMS_INTERFACE_LOG_BKP" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193468C00006$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193468C00006$$" ON "PAN_VALIDATION_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193468C00007$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193468C00007$$" ON "PAN_VALIDATION_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193664C00013$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193664C00013$$" ON "TRANSACTION_24JUL" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193672C00013$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193672C00013$$" ON "TRANSACTION_QC" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193680C00008$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193680C00008$$" ON "IFSCCODE_INTERFACE_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193680C00009$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193680C00009$$" ON "IFSCCODE_INTERFACE_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193685C00008$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193685C00008$$" ON "IFSCCODE_INTERFACE_LOG_BKP" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193685C00009$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193685C00009$$" ON "IFSCCODE_INTERFACE_LOG_BKP" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193705C00004$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193705C00004$$" ON "CMS_ECBF_CUST_INTERFACE_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193705C00005$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193705C00005$$" ON "CMS_ECBF_CUST_INTERFACE_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193710C00034$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193710C00034$$" ON "CMS_ECBF_LMT_INTERFACE_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193710C00035$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193710C00035$$" ON "CMS_ECBF_LMT_INTERFACE_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193716C00059$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193716C00059$$" ON "CMS_FX14_INTERFACE" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193716C00060$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193716C00060$$" ON "CMS_FX14_INTERFACE" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193722C00059$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193722C00059$$" ON "CMS_FX14_INTERFACE_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193722C00060$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193722C00060$$" ON "CMS_FX14_INTERFACE_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193727C00012$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193727C00012$$" ON "CMS_JS_INTERFACE_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193727C00013$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193727C00013$$" ON "CMS_JS_INTERFACE_LOG" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193732C00012$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193732C00012$$" ON "CMS_JS_INTERFACE_LOG_ROLLBACK_SCM" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000193732C00013$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000193732C00013$$" ON "CMS_JS_INTERFACE_LOG_ROLLBACK_SCM" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000234723C00013$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000234723C00013$$" ON "TRANSACTION_USER" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000242655C00013$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000242655C00013$$" ON "REC_TRX_PENDING_21Y" (
  ;
--------------------------------------------------------
--  DDL for Index TAT_DOC_IDX1
--------------------------------------------------------

  CREATE INDEX "TAT_DOC_IDX1" ON "CMS_TAT_DOCUMENT" ("CMS_LSP_LMT_PROFILE_ID", "DOC_COMPLETION_DATE", "FILE_FROM_BIZ_CENTER_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index TAT_DOC_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "TAT_DOC_U1" ON "CMS_TAT_DOCUMENT" ("CMS_LSP_LMT_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TAT_ENT_I1
--------------------------------------------------------

  CREATE INDEX "TAT_ENT_I1" ON "CMS_TAT_ENTRY" ("LIMIT_PROFILE_ID", "TAT_SERVICE_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index TAT_ENT_I2
--------------------------------------------------------

  CREATE INDEX "TAT_ENT_I2" ON "CMS_TAT_ENTRY" ("TAT_TIME_STAMP") 
  ;
--------------------------------------------------------
--  DDL for Index TB_DEAL_ST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TB_DEAL_ST_PK" ON "CMS_STAGE_TB_DEAL" ("CMS_DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TB_DEAL_VAL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TB_DEAL_VAL_PK" ON "CMS_TB_DEAL_VAL" ("CMS_DEAL_VAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TB_DEAL_VAL_ST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TB_DEAL_VAL_ST_PK" ON "CMS_STAGE_TB_DEAL_VAL" ("CMS_DEAL_VAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TEAM_FUNCTION_GRP_IDX1
--------------------------------------------------------

  CREATE INDEX "TEAM_FUNCTION_GRP_IDX1" ON "CMS_TEAM_FUNCTION_GRP" ("FUNCTION_GRP_ID", "TEAM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TEAM_I1
--------------------------------------------------------

  CREATE INDEX "TEAM_I1" ON "CMS_TEAM" ("TEAM_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TEAM_MB_I1
--------------------------------------------------------

  CREATE INDEX "TEAM_MB_I1" ON "CMS_TEAM_MEMBER" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TEAM_MB_U1
--------------------------------------------------------

  CREATE INDEX "TEAM_MB_U1" ON "CMS_TEAM_MEMBER" ("TEAM_MEMBERSHIP_ID", "USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TEAM_ORG_GRP_CODE
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAM_ORG_GRP_CODE" ON "CMS_TEAM_ORG_GROUP_CODE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index TEAM_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAM_U1" ON "CMS_TEAM" ("TEAM_ID", "TEAM_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TEMP_FAC_DTL_IDX2
--------------------------------------------------------

  CREATE INDEX "TEMP_FAC_DTL_IDX2" ON "TEMP_FAC_DTL" ("ACT_OUTSTANDING_AMT", "ALLOCATED_AMT", "LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TEMP_FAC_SEC_ALLOC_IDX1
--------------------------------------------------------

  CREATE INDEX "TEMP_FAC_SEC_ALLOC_IDX1" ON "TEMP_FAC_SEC_ALLOC" ("LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TEMP_FAC_SEC_ALLOC_IDX2
--------------------------------------------------------

  CREATE INDEX "TEMP_FAC_SEC_ALLOC_IDX2" ON "TEMP_FAC_SEC_ALLOC" ("CHARGE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TEMP_FAC_SEC_ALLOC_IDX3
--------------------------------------------------------

  CREATE INDEX "TEMP_FAC_SEC_ALLOC_IDX3" ON "TEMP_FAC_SEC_ALLOC" ("COL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TEST_IDX_6
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEST_IDX_6" ON "SCI_LE_SUB_PROFILE" ("CMS_LE_MAIN_PROFILE_ID", "CMS_LE_SUB_PROFILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index THRES_RATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "THRES_RATE_PK" ON "CMS_THRESHOLD_RATING" ("RATING_ID") 
  ;
--------------------------------------------------------
--  DDL for Index THRES_RATE_ST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "THRES_RATE_ST_PK" ON "CMS_STAGE_THRESHOLD_RATING" ("RATING_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TMP_FAC_DTL_IDX1
--------------------------------------------------------

  CREATE INDEX "TMP_FAC_DTL_IDX1" ON "TEMP_FAC_DTL" ("LMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TM_CMS_SEG_COD_U1
--------------------------------------------------------

  CREATE INDEX "TM_CMS_SEG_COD_U1" ON "CMS_TEAM_CMS_SEGMENT_CODE" ("SEGMENT_CODE", "TEAM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TM_ORG_COD_U1
--------------------------------------------------------

  CREATE INDEX "TM_ORG_COD_U1" ON "CMS_TEAM_ORGANISATION_CODE" ("ORGANISATION_CODE", "TEAM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TM_ORG_GRP_COD_U1
--------------------------------------------------------

  CREATE INDEX "TM_ORG_GRP_COD_U1" ON "CMS_TEAM_ORG_GROUP_CODE" ("ORG_GROUP_CODE", "TEAM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TM_SEG_COD_U1
--------------------------------------------------------

  CREATE INDEX "TM_SEG_COD_U1" ON "CMS_TEAM_SEGMENT_CODE" ("SEGMENT_CODE", "TEAM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TM_TP_MBS_I1
--------------------------------------------------------

  CREATE INDEX "TM_TP_MBS_I1" ON "CMS_TEAM_TYPE_MEMBERSHIP" ("TEAM_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TM_TP_MBS_I2
--------------------------------------------------------

  CREATE INDEX "TM_TP_MBS_I2" ON "CMS_TEAM_TYPE_MEMBERSHIP" ("MEMBERSHIP_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TM_TP_MBS_I3
--------------------------------------------------------

  CREATE INDEX "TM_TP_MBS_I3" ON "CMS_TEAM_TYPE_MEMBERSHIP" ("ROLETYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TRADE_COMM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TRADE_COMM_PK" ON "CMS_TRADE_COMMISSION" ("CMS_TRADE_COMMISSION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TRADE_LMT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TRADE_LMT_PK" ON "CMS_TRADE_LIMIT" ("CMS_LSP_APPR_LMTS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TRADE_PRICING_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TRADE_PRICING_PK" ON "CMS_TRADE_PRICING" ("CMS_TRADE_PRICING_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TRANSACTION_INDEX2
--------------------------------------------------------

  CREATE INDEX "TRANSACTION_INDEX2" ON "TRANSACTION" ("TEAM_MEMBERSHIP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TRANSACTION_INDEX4
--------------------------------------------------------

  CREATE INDEX "TRANSACTION_INDEX4" ON "TRANSACTION" ("TRANSACTION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TRANSHISTORY_REFID
--------------------------------------------------------

  CREATE INDEX "TRANSHISTORY_REFID" ON "TRANSHISTORY_24JUL" ("REFERENCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TRANSHISTORY_STAGING
--------------------------------------------------------

  CREATE INDEX "TRANSHISTORY_STAGING" ON "TRANSHISTORY_24JUL" ("STAGING_REFERENCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TRANS_REFERENCE
--------------------------------------------------------

  CREATE INDEX "TRANS_REFERENCE" ON "TRANSACTION_24JUL" ("REFERENCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TRX_HIS_I1
--------------------------------------------------------

  CREATE INDEX "TRX_HIS_I1" ON "TRANS_HISTORY" ("TRANSACTION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TRX_HIS_I2
--------------------------------------------------------

  CREATE INDEX "TRX_HIS_I2" ON "TRANS_HISTORY" ("STAGING_REFERENCE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TRX_HIS_I3
--------------------------------------------------------

  CREATE INDEX "TRX_HIS_I3" ON "TRANS_HISTORY" ("TRANSACTION_DATE", "TRANSACTION_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index TRX_HIS_I4
--------------------------------------------------------

  CREATE INDEX "TRX_HIS_I4" ON "TRANS_HISTORY" ("TRANSACTION_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index TRX_HIS_I5
--------------------------------------------------------

  CREATE INDEX "TRX_HIS_I5" ON "TRANS_HISTORY" ("FROM_STATE", "TRANSACTION_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index TR_SUPPLY_BUY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TR_SUPPLY_BUY_PK" ON "CMS_TRADE_SUPPLIER_BUYER" ("CMS_TRADE_SUPPLIER_BUYER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TTL_DOC_I1
--------------------------------------------------------

  CREATE INDEX "TTL_DOC_I1" ON "CMS_TITLE_DOC" ("DEAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TTL_DOC_I2
--------------------------------------------------------

  CREATE INDEX "TTL_DOC_I2" ON "CMS_TITLE_DOC" ("TITLEDOC_TYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index UISTAGE_BUS_PARAM
--------------------------------------------------------

  CREATE UNIQUE INDEX "UISTAGE_BUS_PARAM" ON "STAGE_BUS_PARAM" ("PARAMETER_CODE", "PARAMETER_PK") 
  ;
--------------------------------------------------------
--  DDL for Index ULSPINDEX
--------------------------------------------------------

  CREATE INDEX "ULSPINDEX" ON "SCI_LE_SUB_PROFILE" ("ULSP_SHORT_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index UNI_BUS_PARAM
--------------------------------------------------------

  CREATE UNIQUE INDEX "UNI_BUS_PARAM" ON "BUS_PARAM" ("PARAMETER_CODE", "PARAMETER_PK") 
  ;
--------------------------------------------------------
--  DDL for Index UNQ_EMP_EMP_CODE
--------------------------------------------------------

  CREATE UNIQUE INDEX "UNQ_EMP_EMP_CODE" ON "SCI_EMP_EMP_CODE_MAP" ("EEC_SYS_GEN_MAP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index UNTAGGED_TAGID_INDEX
--------------------------------------------------------

  CREATE INDEX "UNTAGGED_TAGID_INDEX" ON "CMS_IMAGE_TAG_MAP" ("TAG_ID", "UNTAGGED_STATUS") 
  ;
--------------------------------------------------------
--  DDL for Index URS_I1
--------------------------------------------------------

  CREATE INDEX "URS_I1" ON "CMS_USER" ("LOGIN_ID", "ROLETYPE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index VAL_I2
--------------------------------------------------------

  CREATE INDEX "VAL_I2" ON "CMS_VALUATION" ("CMS_COLLATERAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index VAL_I3
--------------------------------------------------------

  CREATE INDEX "VAL_I3" ON "CMS_VALUATION" ("CMS_COLLATERAL_ID", "SOURCE_TYPE", "VALUATION_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index VAL_I4
--------------------------------------------------------

  CREATE INDEX "VAL_I4" ON "CMS_VALUATION" ("LOS_VALUATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index VAL_IDX3
--------------------------------------------------------

  CREATE INDEX "VAL_IDX3" ON "CMS_VALUATION" ("CMS_COLLATERAL_ID", "SOURCE_ID", "SOURCE_TYPE", "VALUATION_DATE", "VALUATION_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index VAL_SECMKT_I1
--------------------------------------------------------

  CREATE INDEX "VAL_SECMKT_I1" ON "CMS_VALUATION_MKT_SEC_SUMMARY" ("TICKER") 
  ;
--------------------------------------------------------
--  DDL for Index VEH_HP_I1
--------------------------------------------------------

  CREATE INDEX "VEH_HP_I1" ON "CMS_VEHICLE_PRICE_FEED" ("CAR_MAKE", "CAR_MODEL", "CAR_YEAR", "REGION") 
  ;
--------------------------------------------------------
--  DDL for Index WAV_GEN_IT_I1
--------------------------------------------------------

  CREATE INDEX "WAV_GEN_IT_I1" ON "CMS_WAIVER_GENERATED_ITEM" ("WAIVER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index WRH_RCP_I1
--------------------------------------------------------

  CREATE INDEX "WRH_RCP_I1" ON "CMS_WRHSE_RCPT" ("TITLE_DOC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index WRH_RCP_I2
--------------------------------------------------------

  CREATE INDEX "WRH_RCP_I2" ON "CMS_WRHSE_RCPT" ("WAREHOUSE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index XREFID2
--------------------------------------------------------

  CREATE INDEX "XREFID2" ON "SCI_LSP_LMT_XREF_UDF_2" ("SCI_LSP_SYS_XREF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index XREFID3
--------------------------------------------------------

  CREATE INDEX "XREFID3" ON "SCI_LINE_COBORROWER" ("SCI_LSP_SYS_XREF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index XUQBKG_LOCTN
--------------------------------------------------------

  CREATE UNIQUE INDEX "XUQBKG_LOCTN" ON "SCI_BKG_LOCTN" ("BKL_BKG_LOCTN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index XUQBKG_LOC_EMP_COD
--------------------------------------------------------

  CREATE UNIQUE INDEX "XUQBKG_LOC_EMP_COD" ON "SCI_BKG_LOCTN_EMP_CODE" ("BLE_BKG_LOCTN_ID", "BLE_EMP_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index XUQCOBOLMT_XREFMAP
--------------------------------------------------------

  CREATE UNIQUE INDEX "XUQCOBOLMT_XREFMAP" ON "SCI_LSP_COBO_LMT_XREF_MAP" ("LCX_ID", "LCX_COBO_LE_ID", "LCX_COBO_LSP_ID", "LCX_LMT_ID", "LCX_LE_ID", "LCX_LSP_ID", "LCX_LLP_ID", "LCX_LSX_ID") 
  ;
--------------------------------------------------------
--  DDL for Index XUQCOUNTRY
--------------------------------------------------------

  CREATE UNIQUE INDEX "XUQCOUNTRY" ON "SCI_COUNTRY" ("CTR_CNTRY_ISO_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index XUQCPC_BKG_LOC_MAP
--------------------------------------------------------

  CREATE UNIQUE INDEX "XUQCPC_BKG_LOC_MAP" ON "SCI_CPC_BKG_LOCTN_MAP" ("CBM_BKG_LOCTN_ID", "CBM_CPC_ZONE_NUM", "CBM_CPC_ZONE_VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index XUQCURRENCY
--------------------------------------------------------

  CREATE UNIQUE INDEX "XUQCURRENCY" ON "SCI_CURRENCY" ("CUR_CRRNCY_ISO_CODE") 
  ;
--------------------------------------------------------
--  DDL for Index XUQGRP_CRDT_GRADE
--------------------------------------------------------

  CREATE UNIQUE INDEX "XUQGRP_CRDT_GRADE" ON "SCI_GRP_CREDIT_GRADE" ("GCG_GRP_ID", "GCG_ID") 
  ;
--------------------------------------------------------
--  DDL for Index XUQGRP_LE_LE_MAP
--------------------------------------------------------

  CREATE UNIQUE INDEX "XUQGRP_LE_LE_MAP" ON "SCI_GRP_LE_LE_MAP" ("GLL_GRP_ID", "GLL_PRNT_LE_ID", "GLL_CHILD_LE_ID", "GLL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index XUQGRP_LE_MAP
--------------------------------------------------------

  CREATE UNIQUE INDEX "XUQGRP_LE_MAP" ON "SCI_GRP_LE_MAP" ("GLE_GRP_ID", "GLE_LE_ID", "GLE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index XUQGRP_MAP
--------------------------------------------------------

  CREATE UNIQUE INDEX "XUQGRP_MAP" ON "SCI_GRP_MAP" ("GMP_ID", "GMP_GRP_ID", "GMP_CHILD_GRP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index XUQGRP_PROFILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "XUQGRP_PROFILE" ON "SCI_GRP_PROFILE" ("GRP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index XUQLE_SUB_PROFILE
--------------------------------------------------------

  CREATE INDEX "XUQLE_SUB_PROFILE" ON "SCI_LE_SUB_PROFILE" ("LSP_ID", "LSP_LE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index pk_cms_lead_nodal_bank_stock
--------------------------------------------------------

  CREATE UNIQUE INDEX "pk_cms_lead_nodal_bank_stock" ON "CMS_LEAD_NODAL_BANK_STOCK" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index pk_cms_security_coverage
--------------------------------------------------------

  CREATE UNIQUE INDEX "pk_cms_security_coverage" ON "CMS_SECURITY_COVERAGE" ("SEC_COVERAGE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index pk_sci_fac_co_borrower
--------------------------------------------------------

  CREATE UNIQUE INDEX "pk_sci_fac_co_borrower" ON "SCI_FAC_CO_BORROWER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index pk_sci_le_co_borrower
--------------------------------------------------------

  CREATE UNIQUE INDEX "pk_sci_le_co_borrower" ON "SCI_LE_CO_BORROWER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index pk_stage_sci_le_co_borrower
--------------------------------------------------------

  CREATE UNIQUE INDEX "pk_stage_sci_le_co_borrower" ON "STAGE_SCI_LE_CO_BORROWER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index pk_stage_security_coverage
--------------------------------------------------------

  CREATE UNIQUE INDEX "pk_stage_security_coverage" ON "CMS_STAGE_SECURITY_COVERAGE" ("SEC_COVERAGE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index pk_stg_lead_nodal_bank_stock
--------------------------------------------------------

  CREATE UNIQUE INDEX "pk_stg_lead_nodal_bank_stock" ON "CMS_STG_LEAD_NODAL_BANK_STOCK" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index pk_stg_security_coverage
--------------------------------------------------------

  CREATE UNIQUE INDEX "pk_stg_security_coverage" ON "CMS_STG_SECURITY_COVERAGE" ("ID") 
  ;
