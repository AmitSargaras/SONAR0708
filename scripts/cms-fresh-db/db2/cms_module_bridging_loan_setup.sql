------------------------------------------------------------------------------------------------------------
-- FAP for Bridging Loan Module
------------------------------------------------------------------------------------------------------------
/****************************
 BridgingLoan
****************************/
-- Insert into function access - BridgingLoan
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000001, 'BridgingLoan', 'list_summary', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000002, 'BridgingLoan', 'view', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000003, 'BridgingLoan', 'checker_view', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000004, 'BridgingLoan', 'create', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000005, 'BridgingLoan', 'maker_prepare_create', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000006, 'BridgingLoan', 'update', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000007, 'BridgingLoan', 'maker_prepare_update', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000008, 'BridgingLoan', 'delete', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000009, 'BridgingLoan', 'maker_prepare_delete', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000010, 'BridgingLoan', 'save', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000011, 'BridgingLoan', 'submit', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000012, 'BridgingLoan', 'maker_process', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000013, 'BridgingLoan', 'process', 11);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000014, 'BridgingLoan', 'approve', 11);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000015, 'BridgingLoan', 'reject', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000016, 'BridgingLoan', 'maker_prepare_close', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000017, 'BridgingLoan', 'maker_navigate_tab', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000018, 'BridgingLoan', 'maker_navigate_tab', 11);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000019, 'BridgingLoan', 'to_track', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000020, 'BridgingLoan', 'to_track', 11);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000021, 'BridgingLoan', 'maker_close', 10);    
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000022, 'BridgingLoan', 'list_summary', 11);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28000023, 'BridgingLoan', 'view', 11);



/****************************
 BL_PropertyType
****************************/
-- Insert into function access - BL_PropertyType
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28100001, 'BL_PropertyType', 'view', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28100002, 'BL_PropertyType', 'checker_view', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28100003, 'BL_PropertyType', 'create', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28100004, 'BL_PropertyType', 'maker_prepare_create', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28100005, 'BL_PropertyType', 'update', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28100006, 'BL_PropertyType', 'maker_prepare_update', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28100007, 'BL_PropertyType', 'delete', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28100008, 'BL_PropertyType', 'maker_prepare_delete', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28100009, 'BL_PropertyType', 'maker_prepare_close', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28100010, 'BL_PropertyType', 'maker_navigate_tab', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28100011, 'BL_PropertyType', 'maker_navigate_tab', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28100012, 'BL_PropertyType', 'view', 11);


/****************************
 BL_ProjectSchedule
****************************/
-- Insert into function access - BL_ProjectSchedule
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28200001, 'BL_ProjectSchedule', 'view', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28200002, 'BL_ProjectSchedule', 'checker_view', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28200003, 'BL_ProjectSchedule', 'create', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28200004, 'BL_ProjectSchedule', 'maker_prepare_create', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28200005, 'BL_ProjectSchedule', 'update', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28200006, 'BL_ProjectSchedule', 'maker_prepare_update', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28200007, 'BL_ProjectSchedule', 'delete', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28200008, 'BL_ProjectSchedule', 'maker_prepare_delete', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28200009, 'BL_ProjectSchedule', 'maker_prepare_close', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28200010, 'BL_ProjectSchedule', 'maker_navigate_tab', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28200011, 'BL_ProjectSchedule', 'maker_navigate_tab', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28200012, 'BL_ProjectSchedule', 'view', 11);


/****************************
 BL_AdvsPayment
****************************/
-- Insert into function access - BL_AdvsPayment
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28300001, 'BL_AdvsPayment', 'list_summary', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28300002, 'BL_AdvsPayment', 'checker_list_summary', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28300003, 'BL_AdvsPayment', 'maker_prepare_close', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28300004, 'BL_AdvsPayment', 'maker_navigate_tab', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28300005, 'BL_AdvsPayment', 'maker_navigate_tab', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28300006, 'BL_AdvsPayment', 'list_summary', 11);


/****************************
 BL_DevelopmentDoc
****************************/
-- Insert into function access - BL_DevelopmentDoc
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400001, 'BL_DevelopmentDoc', 'view', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400002, 'BL_DevelopmentDoc', 'checker_view', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400003, 'BL_DevelopmentDoc', 'create', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400004, 'BL_DevelopmentDoc', 'maker_prepare_create', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400005, 'BL_DevelopmentDoc', 'update', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400006, 'BL_DevelopmentDoc', 'maker_prepare_update', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400007, 'BL_DevelopmentDoc', 'delete', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400008, 'BL_DevelopmentDoc', 'maker_prepare_delete', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400009, 'BL_DevelopmentDoc', 'view_item', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400010, 'BL_DevelopmentDoc', 'checker_view_item', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400011, 'BL_DevelopmentDoc', 'maker_refresh', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400012, 'BL_DevelopmentDoc', 'maker_prepare_create_item', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400013, 'BL_DevelopmentDoc', 'create_item', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400014, 'BL_DevelopmentDoc', 'maker_prepare_update_item', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400015, 'BL_DevelopmentDoc', 'update_item', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400016, 'BL_DevelopmentDoc', 'maker_prepare_delete_item', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400017, 'BL_DevelopmentDoc', 'delete_item', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400018, 'BL_DevelopmentDoc', 'maker_prepare_close', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400019, 'BL_DevelopmentDoc', 'maker_navigate_tab', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400020, 'BL_DevelopmentDoc', 'maker_navigate_tab', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400021, 'BL_DevelopmentDoc', 'view', 11);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28400022, 'BL_DevelopmentDoc', 'view_item', 11);


/****************************
 BL_Disbursement
****************************/
-- Insert into function access - BL_Disbursement
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28500001, 'BL_Disbursement', 'view', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28500002, 'BL_Disbursement', 'checker_view', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28500003, 'BL_Disbursement', 'create', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28500004, 'BL_Disbursement', 'maker_prepare_create', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28500005, 'BL_Disbursement', 'update', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28500006, 'BL_Disbursement', 'maker_prepare_update', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28500007, 'BL_Disbursement', 'delete', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28500008, 'BL_Disbursement', 'maker_prepare_delete', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28500009, 'BL_Disbursement', 'maker_prepare_close', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28500010, 'BL_Disbursement', 'maker_navigate_tab', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28500011, 'BL_Disbursement', 'maker_navigate_tab', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28500012, 'BL_Disbursement', 'view', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28500013, 'BL_Disbursement', 'maker_prepare_save_create', 10); 


/****************************
 BL_DisbursementDetail
****************************/
-- Insert into function access - BL_DisbursementDetail
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28600001, 'BL_DisbursementDetail', 'view', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28600002, 'BL_DisbursementDetail', 'checker_view', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28600003, 'BL_DisbursementDetail', 'create', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28600004, 'BL_DisbursementDetail', 'maker_prepare_create', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28600005, 'BL_DisbursementDetail', 'update', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28600006, 'BL_DisbursementDetail', 'maker_prepare_update', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28600007, 'BL_DisbursementDetail', 'delete', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28600008, 'BL_DisbursementDetail', 'maker_prepare_delete', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28600009, 'BL_DisbursementDetail', 'maker_prepare_close', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28600010, 'BL_DisbursementDetail', 'maker_navigate_tab', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28600011, 'BL_DisbursementDetail', 'maker_navigate_tab', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28600012, 'BL_DisbursementDetail', 'view', 11);


/****************************
 BL_Settlement
****************************/
-- Insert into function access - BL_Settlement
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28700001, 'BL_Settlement', 'view', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28700002, 'BL_Settlement', 'checker_view', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28700003, 'BL_Settlement', 'create', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28700004, 'BL_Settlement', 'maker_prepare_create', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28700005, 'BL_Settlement', 'update', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28700006, 'BL_Settlement', 'maker_prepare_update', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28700007, 'BL_Settlement', 'delete', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28700008, 'BL_Settlement', 'maker_prepare_delete', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28700009, 'BL_Settlement', 'maker_prepare_close', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28700010, 'BL_Settlement', 'maker_navigate_tab', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28700011, 'BL_Settlement', 'maker_navigate_tab', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28700012, 'BL_Settlement', 'view', 11);


/****************************
 BL_BuildUp
****************************/
-- Insert into function access - BL_BuildUp
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800001, 'BL_BuildUp', 'list_summary', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800002, 'BL_BuildUp', 'checker_list_summary', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800003, 'BL_BuildUp', 'view', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800004, 'BL_BuildUp', 'checker_view', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800005, 'BL_BuildUp', 'create', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800006, 'BL_BuildUp', 'maker_prepare_create', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800007, 'BL_BuildUp', 'update', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800008, 'BL_BuildUp', 'maker_prepare_update', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800009, 'BL_BuildUp', 'delete', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800010, 'BL_BuildUp', 'maker_prepare_delete', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800011, 'BL_BuildUp', 'maker_prepare_close', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800012, 'BL_BuildUp', 'maker_navigate_tab', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800013, 'BL_BuildUp', 'maker_navigate_tab', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800014, 'BL_BuildUp', 'prepare_add_copy', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800015, 'BL_BuildUp', 'add_copy', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800016, 'BL_BuildUp', 'list_summary', 11);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800017, 'BL_BuildUp', 'view', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28800018, 'BL_BuildUp', 'generateBLDisclaimerLetter', 10);


/****************************
 BL_SalesProceeds
****************************/
-- Insert into function access - BL_SalesProceeds
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28900001, 'BL_SalesProceeds', 'view', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28900002, 'BL_SalesProceeds', 'checker_view', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28900003, 'BL_SalesProceeds', 'create', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28900004, 'BL_SalesProceeds', 'maker_prepare_create', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28900005, 'BL_SalesProceeds', 'update', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28900006, 'BL_SalesProceeds', 'maker_prepare_update', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28900007, 'BL_SalesProceeds', 'delete', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28900008, 'BL_SalesProceeds', 'maker_prepare_delete', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28900009, 'BL_SalesProceeds', 'maker_prepare_close', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28900010, 'BL_SalesProceeds', 'maker_navigate_tab', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28900011, 'BL_SalesProceeds', 'maker_navigate_tab', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (28900012, 'BL_SalesProceeds', 'view', 11);


/****************************
 BL_FDR
****************************/
-- Insert into function access - BL_FDR
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29000001, 'BL_FDR', 'list_summary', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29000002, 'BL_FDR', 'checker_list_summary', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29000003, 'BL_FDR', 'view', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29000004, 'BL_FDR', 'checker_view', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29000005, 'BL_FDR', 'create', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29000006, 'BL_FDR', 'maker_prepare_create', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29000007, 'BL_FDR', 'update', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29000008, 'BL_FDR', 'maker_prepare_update', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29000009, 'BL_FDR', 'delete', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29000010, 'BL_FDR', 'maker_prepare_delete', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29000011, 'BL_FDR', 'maker_prepare_close', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29000012, 'BL_FDR', 'maker_navigate_tab', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29000013, 'BL_FDR', 'maker_navigate_tab', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29000014, 'BL_FDR', 'list_summary', 11);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29000015, 'BL_FDR', 'view', 11);


/****************************
 BL_SG_AdvsPayment
****************************/
-- Insert into function access - BL_SG_AdvsPayment
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29100001, 'BL_SG_AdvsPayment', 'list_summary', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29100002, 'BL_SG_AdvsPayment', 'checker_list_summary', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29100003, 'BL_SG_AdvsPayment', 'maker_prepare_close', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29100004, 'BL_SG_AdvsPayment', 'maker_navigate_tab', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29100005, 'BL_SG_AdvsPayment', 'maker_navigate_tab', 11);


/****************************
 BL_SG_DevelopmentDoc
****************************/
-- Insert into function access - BL_SG_DevelopmentDoc
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29200001, 'BL_SG_DevelopmentDoc', 'view', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29200002, 'BL_SG_DevelopmentDoc', 'checker_view', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29200003, 'BL_SG_DevelopmentDoc', 'create', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29200004, 'BL_SG_DevelopmentDoc', 'maker_prepare_create', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29200005, 'BL_SG_DevelopmentDoc', 'update', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29200006, 'BL_SG_DevelopmentDoc', 'maker_prepare_update', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29200007, 'BL_SG_DevelopmentDoc', 'delete', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29200008, 'BL_SG_DevelopmentDoc', 'maker_prepare_delete', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29200009, 'BL_SG_DevelopmentDoc', 'view_item', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29200010, 'BL_SG_DevelopmentDoc', 'checker_view_item', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29200011, 'BL_SG_DevelopmentDoc', 'maker_refresh', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29200012, 'BL_SG_DevelopmentDoc', 'maker_prepare_create_item', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29200013, 'BL_SG_DevelopmentDoc', 'create_item', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29200014, 'BL_SG_DevelopmentDoc', 'maker_prepare_update_item', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29200015, 'BL_SG_DevelopmentDoc', 'update_item', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29400016, 'BL_SG_DevelopmentDoc', 'maker_prepare_delete_item', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29400017, 'BL_SG_DevelopmentDoc', 'delete_item', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29400018, 'BL_SG_DevelopmentDoc', 'maker_prepare_close', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29400019, 'BL_SG_DevelopmentDoc', 'maker_navigate_tab', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29400020, 'BL_SG_DevelopmentDoc', 'maker_navigate_tab', 11);


/****************************
 BL_SG_Disbursement
****************************/
-- Insert into function access - BL_SG_Disbursement
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29300001, 'BL_SG_Disbursement', 'view', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29300002, 'BL_SG_Disbursement', 'checker_view', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29300003, 'BL_SG_Disbursement', 'create', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29300004, 'BL_SG_Disbursement', 'maker_prepare_create', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29300005, 'BL_SG_Disbursement', 'update', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29300006, 'BL_SG_Disbursement', 'maker_prepare_update', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29300007, 'BL_SG_Disbursement', 'delete', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29300008, 'BL_SG_Disbursement', 'maker_prepare_delete', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29300009, 'BL_SG_Disbursement', 'maker_prepare_close', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29300010, 'BL_SG_Disbursement', 'maker_navigate_tab', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29300011, 'BL_SG_Disbursement', 'maker_navigate_tab', 11);


/****************************
 BL_SG_DisbursementDetail
****************************/
-- Insert into function access - BL_SG_DisbursementDetail
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29400001, 'BL_SG_DisbursementDetail', 'view', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29400002, 'BL_SG_DisbursementDetail', 'checker_view', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29400003, 'BL_SG_DisbursementDetail', 'create', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29400004, 'BL_SG_DisbursementDetail', 'maker_prepare_create', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29400005, 'BL_SG_DisbursementDetail', 'update', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29400006, 'BL_SG_DisbursementDetail', 'maker_prepare_update', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29400007, 'BL_SG_DisbursementDetail', 'delete', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29400008, 'BL_SG_DisbursementDetail', 'maker_prepare_delete', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29400009, 'BL_SG_DisbursementDetail', 'maker_prepare_close', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29400010, 'BL_SG_DisbursementDetail', 'maker_navigate_tab', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29400011, 'BL_SG_DisbursementDetail', 'maker_navigate_tab', 11);


/****************************
 BL_SG_Settlement
****************************/
-- Insert into function access - BL_SG_Settlement
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29500001, 'BL_SG_Settlement', 'view', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29500002, 'BL_SG_Settlement', 'checker_view', 11);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29500003, 'BL_SG_Settlement', 'create', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29500004, 'BL_SG_Settlement', 'maker_prepare_create', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29500005, 'BL_SG_Settlement', 'update', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29500006, 'BL_SG_Settlement', 'maker_prepare_update', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29500007, 'BL_SG_Settlement', 'delete', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29500008, 'BL_SG_Settlement', 'maker_prepare_delete', 10);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29500009, 'BL_SG_Settlement', 'maker_prepare_close', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29500010, 'BL_SG_Settlement', 'maker_navigate_tab', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) values (29500011, 'BL_SG_Settlement', 'maker_navigate_tab', 11);



------------------------------------------------------------------------------------------------------------
-- TR_STATE_MATRIX  for Bridging Loan Module
------------------------------------------------------------------------------------------------------------
-- Delete TR_STATE_MATRIX  
--DELETE FROM TR_STATE_MATRIX WHERE STATEINS = 'BRIDGING_LOAN';
	
-- Insert into TR_STATE_MATRIX  
INSERT INTO TR_STATE_MATRIX values (5700, 'BRIDGING_LOAN', 'MAKER_CREATE', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');
INSERT INTO TR_STATE_MATRIX values (5701, 'BRIDGING_LOAN', 'MAKER_CREATE', 'DRAFT', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');
INSERT INTO TR_STATE_MATRIX values (5702, 'BRIDGING_LOAN', 'MAKER_CREATE', 'REJECTED_CREATE', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX values (5703, 'BRIDGING_LOAN', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
INSERT INTO TR_STATE_MATRIX values (5704, 'BRIDGING_LOAN', 'MAKER_UPDATE', 'DRAFT', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
INSERT INTO TR_STATE_MATRIX values (5705, 'BRIDGING_LOAN', 'MAKER_UPDATE', 'REJECTED_UPDATE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX values (5706, 'BRIDGING_LOAN', 'MAKER_DELETE', 'ACTIVE', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1');
INSERT INTO TR_STATE_MATRIX values (5707, 'BRIDGING_LOAN', 'MAKER_DELETE', 'REJECTED_DELETE', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1');

INSERT INTO TR_STATE_MATRIX values (5708, 'BRIDGING_LOAN', 'MAKER_SAVE', 'ND', 'DRAFT', 'DRAFT', '1', '1');
INSERT INTO TR_STATE_MATRIX values (5709, 'BRIDGING_LOAN', 'MAKER_SAVE', 'DRAFT', 'DRAFT', 'DRAFT', '1', '1');
INSERT INTO TR_STATE_MATRIX values (5710, 'BRIDGING_LOAN', 'MAKER_SAVE', 'REJECTED_CREATE', 'DRAFT', 'DRAFT', '1', '1');
INSERT INTO TR_STATE_MATRIX values (5711, 'BRIDGING_LOAN', 'MAKER_SAVE', 'REJECTED_UPDATE', 'DRAFT', 'DRAFT', '1', '1');

INSERT INTO TR_STATE_MATRIX values (5712, 'BRIDGING_LOAN', 'MAKER_CLOSE_CREATE', 'DRAFT', 'CLOSE', 'CLOSE', '1', '1');
INSERT INTO TR_STATE_MATRIX values (5713, 'BRIDGING_LOAN', 'MAKER_CLOSE_CREATE', 'REJECTED_CREATE', 'CLOSE', 'CLOSE', '1', '1');
INSERT INTO TR_STATE_MATRIX values (5714, 'BRIDGING_LOAN', 'MAKER_CLOSE_UPDATE', 'DRAFT', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX values (5715, 'BRIDGING_LOAN', 'MAKER_CLOSE_UPDATE', 'REJECTED_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX values (5716, 'BRIDGING_LOAN', 'MAKER_CLOSE_DELETE', 'REJECTED_DELETE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX values (5717, 'BRIDGING_LOAN', 'CHECKER_APPROVE', 'PENDING_CREATE', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX values (5718, 'BRIDGING_LOAN', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX values (5719, 'BRIDGING_LOAN', 'CHECKER_APPROVE', 'PENDING_DELETE', 'CLOSE', 'CLOSE', '1', '1');

INSERT INTO TR_STATE_MATRIX values (5720, 'BRIDGING_LOAN', 'CHECKER_REJECT', 'PENDING_CREATE', 'REJECTED_CREATE', 'REJECTED_CREATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX values (5721, 'BRIDGING_LOAN', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED_UPDATE', 'REJECTED_UPDATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX values (5722, 'BRIDGING_LOAN', 'CHECKER_REJECT', 'PENDING_DELETE', 'REJECTED_DELETE', 'REJECTED_DELETE', '1', '1');

 
INSERT INTO TR_STATE_MATRIX values (5723, 'BRIDGING_LOAN', 'MAKER_SAVE', 'ACTIVE', 'DRAFT', 'DRAFT', '1', '1');


------------------------------------------------------------------------------------------------------------
-- CMS_TRX_TOTRACK for Bridging Loan Module
------------------------------------------------------------------------------------------------------------
-- Delete CMS_TRX_TOTRACK 
--DELETE FROM CMS_TRX_TOTRACK WHERE TRANSACTION_TYPE = 'BRIDGING_LOAN' ;

-- Insert Into CMS_TRX_TOTRACK
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES ('BRIDGING_LOAN', 'BridgingLoan.do?initEvent=to_track&event=to_track&trxID=', 'PENDING_CREATE', 'Pending Create', 'Maintain Bridging Loan', null, null);
 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES ('BRIDGING_LOAN', 'BridgingLoan.do?initEvent=to_track&event=to_track&trxID=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Bridging Loan', null, null);
 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES ('BRIDGING_LOAN', 'BridgingLoan.do?initEvent=to_track&event=to_track&trxID=', 'REJECTED_CREATE', 'Rejected Create', 'Maintain Bridging Loan', null, null);
 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES ('BRIDGING_LOAN', 'BridgingLoan.do?initEvent=to_track&event=to_track&trxID=', 'REJECTED_UPDATE', 'Rejected Update', 'Maintain Bridging Loan', null, null);
 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES ('BRIDGING_LOAN', 'BridgingLoan.do?initEvent=to_track&event=to_track&trxID=', 'REJECTED_DELETE', 'Rejected Delete', 'Maintain Bridging Loan', null, null);
 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES ('BRIDGING_LOAN', 'BridgingLoan.do?initEvent=to_track&event=to_track&trxID=', 'DRAFT', 'Draft', 'Maintain Bridging Loan', null, null);
 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES ('BRIDGING_LOAN', 'BridgingLoan.do?initEvent=to_track&event=to_track&trxID=', 'PENDING_DELETE', 'Pending Delete', 'Maintain Bridging Loan', null, null);
 
 

------------------------------------------------------------------------------------------------------------
-- CMS_STATEMATRIX_ACTION for Bridging Loan Module
------------------------------------------------------------------------------------------------------------
-- delete old data if any
--DELETE FROM CMS_STATEMATRIX_ACTION WHERE URL LIKE 'BridgingLoan.do?%' ;

-- pending_create
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) 
VALUES ( 5717, 11, 'Process', 'BridgingLoan.do?initEvent=process&event=process&trxID=', NULL); 

-- pending_update
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) 
VALUES ( 5718, 11, 'Process', 'BridgingLoan.do?initEvent=process&event=process&trxID=', NULL); 

-- pending_delete
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) 
VALUES ( 5719, 11, 'Process', 'BridgingLoan.do?initEvent=process&event=process&trxID=', NULL); 

-- Draft
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) 
VALUES ( 5712, 10, 'Close', 'BridgingLoan.do?initEvent=maker_prepare_close&event=maker_prepare_close&trxID=', NULL); 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) 
VALUES ( 5714, 10, 'Process', 'BridgingLoan.do?initEvent=maker_prepare_update&event=maker_prepare_update&trxID=', NULL);

-- Rejected
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) 
VALUES ( 5713, 10, 'Close', 'BridgingLoan.do?initEvent=maker_prepare_close&event=maker_prepare_close&trxID=', NULL); 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) 
VALUES ( 5713, 10, 'Process', 'BridgingLoan.do?initEvent=maker_process&event=maker_process&trxID=', NULL); 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) 
VALUES ( 5715, 10, 'Close', 'BridgingLoan.do?initEvent=maker_prepare_close&event=maker_prepare_close&trxID=', NULL); 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) 
VALUES ( 5715, 10, 'Process', 'BridgingLoan.do?initEvent=maker_process&event=maker_process&trxID=', NULL); 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) 
VALUES ( 5716, 10, 'Close', 'BridgingLoan.do?initEvent=maker_prepare_close&event=maker_prepare_close&trxID=', NULL); 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) 
VALUES ( 5716, 10, 'Process', 'BridgingLoan.do?initEvent=maker_process&event=maker_process&trxID=', NULL); 



