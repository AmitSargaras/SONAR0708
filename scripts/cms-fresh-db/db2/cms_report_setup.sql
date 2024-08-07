delete from cms_report_master;

delete from cms_report_template;

delete from CMS_REPORT_COUNTRY_MAP;

delete from CMS_REPORT_DUEDATE_PARAM;

/**************************
CMS_REPORT_MASTER
***************************/	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'usercreation', 'SYS', 'Weekly', 'usercreation.rpt', 'Listing of New User Record Creation', 'SYS001', 'SYS', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'userupdate', 'SYS', 'Weekly', 'userupdate.rpt', 'Listing of User Profile Amendment', 'SYS002', 'SYS', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'userdelete', 'SYS', 'Weekly', 'userdelete.rpt', 'Listing of User Record Deletion', 'SYS003', 'SYS', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'failedLogin', 'SYS', 'Weekly', 'failedLogin.rpt', 'Summary Of Unsuccessful Login Attempts', 'SYS004', 'SYS', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'sessionSummary', 'SYS', 'Weekly', 'sessionSummary.rpt', 'Summary Of Session Activity', 'SYS005', 'SYS', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'SYS006_Dormant User Account', 'SYS', 'Weekly', 'SYS006_Dormant User Account.rpt', 'Listing of Dormant User Account', 'SYS006', 'SYS', 'ACTIVE');
   
         

-----------------------------
-- Business Report
-----------------------------
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS001_CC_Report', 'MIS', 'Monthly', 'BUS001_CC_Report.rpt', 
    '$ Report on FD as Collateral', 'BUS001', 'MIS', 'ACTIVE');
   
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS002_UT', 'MIS', 'Daily', 'BUS002_UT.rpt', 
    '$ Report on Unit Trust', 'BUS002', 'MIS', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS003_STRC_PT', 'MIS', 'Monthly', 'BUS003_STRC_PT.rpt', 
    '$ Report on Security Coverage of STRC Secured Entirely & Partially by Property', 'BUS003', 'MIS', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS004_STRC_MS', 'MIS', 'Monthly', 'BUS004_STRC_MS.rpt', 
    '$ Report On Security Coverage Of Strc Secured Entirely And Partially By Quoted Shares', 'BUS004', 'MIS', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS005_ExposureAgtShares', 'MIS', 'Monthly', 'BUS005_ExposureAgtShares.rpt', 
    '$ Exposure Against Shares (Normal Account)', 'BUS005', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS006_Return_FI', 'MIS', 'Quarterly', 'BUS006_Return_FI.rpt', 
    '$ Return On Shares Of Licensed Financial Institutions Pledged As Collateral For Loans', 'BUS006', 'MIS', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, 
    MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS007_Return_FI', 'MIS', 'Quarterly', 'BUS007_Return_FI.rpt', 
    '$ Return On Shares Of Licensed Financial Institutions Pledged As Collateral For Loans (To be submitted if a single borrower has pledged 5% or more of the paid-up capital of a licensed institution)', 
    'BUS007', 'MIS', 'ACTIVE');
  
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS008_StandbyLC', 'MIS', 'Daily', 'BUS008_StandbyLC.rpt', 
    '$ Standby LCs/Guarantees Record by Customer', 'BUS008', 'MIS', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS009_AbandonedProj', 'MIS', 'Monthly', 'BUS009_AbandonedProj.rpt', 
    '$ Report on Abandoned Project - Property', 'BUS009', 'MIS', 'ACTIVE');
      
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS010_MissValuation', 'MIS', 'Monthly', 'BUS010_MissValuation.rpt', 
    '$ Report on Valuation Value Missing Where Legal Enforceability = Yes', 'BUS010', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS012_PT_Foreigner', 'MIS', 'Daily', 'BUS012_PT_Foreigner.rpt', 
    '$ Report on Individual Borrowers who are Foreigners', 'BUS012', 'MIS', 'ACTIVE');
                
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS013_ColDueForEvaluation', 'MIS', 'Monthly', 'CollateralsDueForEvaluation_xls.rpt', 
    '$ List of Collaterals due for Evaluation for the month', 'BUS013', 'MIS', 'ACTIVE');				

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS014_PropertyDueForEvaluation', 'MIS', 'Monthly', 'ListOfPropertyDueForEvaluation_xls.rpt', 
    '$ List of Property Due for Evaluation within the next three months', 'BUS014', 'MIS', 'ACTIVE');				
            
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS015_ABGenChargeDueForEval', 'MIS', 'Monthly', 'ListOfAssetBasedGCDueForEvaluation_xls.rpt', 
    '$ List of Asset Based-General Charge Due for Evaluation within the next 30 days', 'BUS015', 'MIS', 'ACTIVE');	
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS016_ColOverdueForEval', 'MIS', 'Monthly', 'CollateralOverDueForEvaluationNonAuto_xls.rpt', 
    '$ List of Collaterals Overdue for Evaluation for the month', 'BUS016', 'MIS', 'ACTIVE');	
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS017_PropertyOverdyeForEval', 'MIS', 'Monthly', 'ListOfPropertyOverDueForEvaluation_xls.rpt', 
    '$ List of Property OverDue for Evaluation', 'BUS017', 'MIS', 'ACTIVE');	
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS018_ABGenChargeOverdueForEval', 'MIS', 'Monthly', 'ListOfAssetBasedGCOverDueForEvaluation_xls.rpt', 
    '$ List of Asset Based-General Charge OverDue for Evaluation', 'BUS018', 'MIS', 'ACTIVE');	
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS019_CustomerActualBelowRequiredSecCoverage', 'MIS', 'Daily', 'LmtsAdjustment.rpt', 
    '$ List of Customers whose Actual Security Coverage is below Required Security Coverage', 'BUS019', 'MIS', 'ACTIVE');	
      
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS020_CustomerColMarginAboveCtryCRP', 'MIS', 'Daily', 'ListOfCustomersWithColMarginAboveCntryColRP.rpt', 
    '$ List of Customer with Collateral Margin Higher than Approved Country Collateral Recovery Parameters', 'BUS020', 'MIS', 'ACTIVE');
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS021_GenChargePhyInspection', 'MIS', 'Monthly', 'ListOfGeneralCharge_PhysInspection_xls.rpt', 
    '$ List of Physical Inspection Required for Asset Based – General Due Within 60 days/ Overdue', 'BUS021', 'MIS', 'ACTIVE');	
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS022_QuitRentNotReceived', 'MIS', 'Monthly', 'ListOfCustomerWithQuitRentNotReceived.rpt', 
    '$ List of Customers with Quit Rent Receipt Not Received', 'BUS022', 'MIS', 'ACTIVE');	
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS023_ColDueToMature', 'MIS', 'BiMonthly', 'CollateralsDueToMature_xls.rpt', 
    '$ List of Collaterals Due to Mature within the next 60 days', 'BUS023', 'MIS', 'ACTIVE');	

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS024_OverdueRecurrentDoc', 'MIS', 'Daily', 'OverdueRecurrentDoc.rpt', 
    '$ List of Overdue Recurrent Documents / Overdue Covenant', 'BUS024', 'MIS', 'ACTIVE');
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'BUS025_DueRecurrentDoc', 'MIS', 'Daily', 'RecurrentDocDueForSub_xls.rpt', 
    '$ List of Recurrent Document Due/ Covenant Due for Submission within the next 30 days', 'BUS025', 'MIS', 'ACTIVE');	
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'ReminderLetterToSolicitor', 'MIS', 'Fortnight', 'ReminderLetterToSolicitor.rpt', 
    'Reminder Letter to Solicitor', 'RLS1', 'MIS', 'ACTIVE');	
	
-----------------------------
-- PreDeal Reports    
-----------------------------
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'CountersBreachingConCap', 'MIS', 'Daily', 'PDR001_CountersBreachingConCap.rpt', 
    '$ Report on Share Counters Breaching Concentration Cap Limit', 'PDR001', 'PDR', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'EarmarkNotReleasedFor7Days', 'MIS', 'Daily', 'EarmarkNotReleasedFor7Days.rpt', 
    '$ Report on Ear-marking Shares which have not been released after 7 calendar days period', 'PDR002', 'PDR', 'ACTIVE');


------------------------
-- Concentration Report 
------------------------  
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'KLCICounters', 'Country', 'Daily', 'CON001_KLCICounters.rpt', 
    '$ Concentration Report on KLCI Counter', 'CON001', 'CON', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'MainBoardCounters', 'Country', 'Daily', 'CON002_MainBoardCounters.rpt', 
    '$ Concentration Report on Main Board Counters', 'CON002', 'CON', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'SecondBoardCounters', 'Country', 'Daily', 'CON003_SecondBoardCounters.rpt', 
    '$ Concentration Report on Second Board Counters', 'CON003', 'CON', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'MESDAQ_SESDAQ_Counters', 'Country', 'Daily', 'CON004_MESDAQ_SESDAQ_Counters.rpt', 
    '$ Concentration Report on MESDAQ / SESDAQ Counters', 'CON004', 'CON', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'FICounters', 'Country', 'Daily', 'CON005_FICounters.rpt', 
    '$ Concentration Report on Financial Institutions', 'CON005', 'CON', 'ACTIVE');
  
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'Warrants', 'Country', 'Daily', 'CON006_Warrants.rpt', 
    '$ Concentration Report on Warrants', 'CON006', 'CON', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'LoanStock', 'Country', 'Daily', 'CON007_LoanStock.rpt', 
    '$ Concentration Report on Loan Stocks', 'CON007', 'CON', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'CountersReceiveAfterQuotaTrigger', 'Country', 'Daily', 'CON008_CountersReceiveAfterQuotaTrigger.rpt', 
    '$ Concentration Report of Counters Received After Quota Trigger', 'CON008', 'CON', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'PN4PN17SuspendedDesignatedCounters', 'Country', 'Weekly', 'CON009_PN4PN17SuspendedDesignatedCounters.rpt', 
    '$ Concentration Report List of PN4, PN17, Suspended and Designated Counters', 'CON009', 'CON', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'CountersBreachingQuota', 'Country', 'Daily', 'CON010_CountersBreachingQuota.rpt', 
    '$ Concentration Report on All Counters Breaching Quota', 'CON010', 'CON', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'AutoFinanceLoan', 'Country', 'Monthly', 'CON016_AutoFinanceLoan.rpt', 
    '$ Concentration Risk Report of Auto Finance Loans', 'CON016', 'CON', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'AutoFinanceRepossession', 'Country', 'Monthly', 'CON017_AutoFinanceRepossession.rpt', 
    '$ Concentration Risk Report of Auto Finance By Repossession', 'CON017', 'CON', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'DeveloperNameForProperty', 'Country', 'Monthly', 'CON018_DeveloperNameForProperty.rpt', 
    '$ Concentration Report of Developer Name for Property', 'CON018', 'CON', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'PropertyByBizUnit', 'Country', 'Daily', 'ConPropertyByBU.rpt', 
    '$ Concentration Risk Report of Property by Business Unit', 'CON019', 'CON', 'ACTIVE');
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'PropertyByState', 'Country', 'Daily', 'CON020_PropertyByState.rpt', 
    '$ Concentration Risk Report of Property by State', 'CON020', 'CON', 'ACTIVE');	
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'PropertyByStateSubtype', 'Country', 'Daily', 'CON021_PropertyByStateSubtype.rpt', 
    '$ Concentration Risk Report of Property by State, Property Sub-Type, Description in Country (Malaysia)', 'CON021', 'CON', 'ACTIVE');		
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'SetOfTriggers', 'Country', 'Monthly', 'CON022_SetOfTrigger.rpt', 
    '$ Set of Triggers to monitor performance by Concentration Risk', 'CON022', 'CON', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'EquipmentPortfolioBySector', 'Country', 'Monthly', 'CON027_BySector.rpt', 
    '$ Concentration of Equipment Portfolio by Sector', 'CON027', 'CON', 'ACTIVE');
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'Top50Borrowers', 'Country', 'Monthly', 'CON028_Top50Borrowers.rpt', 
    '$ Concentration Report of Top 50 Borrowers', 'CON028', 'CON', 'ACTIVE');	
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'SecurityByBizUnitSecType', 'Country', 'Daily', 'CON029_SecurityByBizUnitSecType.rpt', 
    '$ Concentration Risk Report of Securities by Business Unit/Entity & Securities Type', 'CON029', 'CON', 'ACTIVE');		
    
-----------------------------
-- PreDeal Reports    
-----------------------------
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'CountersBreachingConCap', 'MIS', 'Daily', 'PDR001_CountersBreachingConCap.rpt', 
    '$ Report on Share Counters Breaching Concentration Cap Limit', 'PDR001', 'PDR', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'EarmarkNotReleasedFor7Days', 'MIS', 'Daily', 'EarmarkNotReleasedFor7Days.rpt', 
    '$ Report on Ear-marking Shares which have not been released after 7 calendar days period', 'PDR002', 'PDR', 'ACTIVE');
    
   
/**************************
CMS_REPORT_TEMPLATE
***************************/

----------------------
-- System Reports
----------------------

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'usercreation.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'SYS001';   

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'usercreation.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'SYS001';      
       
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'userupdate.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'SYS002';   
   
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'userupdate.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'SYS002';   
   
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'userdelete.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'SYS003';      
   
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'userdelete.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'SYS003';      
   
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'failedLogin.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'SYS004';   

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'failedLogin.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'SYS004';   

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'sessionSummary.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'SYS005';   
       
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'sessionSummary.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'SYS005';   

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'SYS006_Dormant User Account.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'SYS006';   
           
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'SYS006_Dormant User Account.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'SYS006';   
    
 
  
    
-----------------------------
-- Business Report
-----------------------------
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS001_CC_Report.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS001';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS001_CC_Report_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS001';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS002_UT.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS002';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS002_UT.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS002';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS003_STRC_PT.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS003';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS003_STRC_PT_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS003';
        
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS004_STRC_MS.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS004';
        
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS004_STRC_MS.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS004';
        
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS005_ExposureAgtShares.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS005';
        
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS005_ExposureAgtShares.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS005';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS006_Return_FI.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS006';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS006_Return_FI.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS006';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS007_Return_FI.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS007';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS007_Return_FI.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS007';
        
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS008_StandbyLC.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS008';
        
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS008_StandbyLC.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS008';
        
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS009_AbandonedProj.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS009';
        
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS009_AbandonedProj.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS009';
        
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS010_MissValuation.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS010';
        
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS010_MissValuation.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS010';        
        
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS012_PT_Foreigner.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS012';
        
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS012_PT_Foreigner.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS012';
     
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CollateralsDueForEvaluation_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS013';	 
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'ListOfPropertyDueForEvaluation_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS014';	                    
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'ListOfAssetBasedGCDueForEvaluation_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS015';		
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CollateralOverDueForEvaluationNonAuto_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS016';		

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'ListOfPropertyOverDueForEvaluation_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS017';	
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'ListOfAssetBasedGCOverDueForEvaluation_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS018';	
	
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'LmtsAdjustment.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS019';		
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'LmtsAdjustment.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS019';	
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'ListOfCustomersWithColMarginAboveCntryColRP.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS020';	

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'ListOfGeneralCharge_PhysInspection_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS021';		
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'ListOfCustomerWithQuitRentNotReceived.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS022';	
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CollateralsDueToMature_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS023';
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'OverdueRecurrentDoc.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS024';	
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'OverdueRecurrentDoc_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS024';	
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'RecurrentDocDueForSub.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS025';		
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'RecurrentDocDueForSub_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS025';		

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'ReminderLetterToSolicitor.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'RLS1';	
-----------------------------
-- PreDeal Reports   
-----------------------------
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'PDR001_CountersBreachingConCap.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'PDR001';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'PDR001_CountersBreachingConCap_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'PDR001';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'EarmarkNotReleasedFor7Days.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'PDR002';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'EarmarkNotReleasedFor7Days_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'PDR002';
               

-----------------------------
-- Concentration Report   
-----------------------------
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON001_KLCICounters.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON001';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON001_KLCICounters_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON001';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON002_MainBoardCounters.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON002';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON002_MainBoardCounters_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON002';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON003_SecondBoardCounters.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON003';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON003_SecondBoardCounters_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON003';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON004_MESDAQ_SESDAQ_Counters.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON004';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON004_MESDAQ_SESDAQ_Counters_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON004';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON005_FICounters.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON005';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON005_FICounters_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON005';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON006_Warrants.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON006';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON006_Warrants_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON006';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON007_LoanStock.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON007';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON007_LoanStock_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON007';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON008_CountersReceiveAfterQuotaTrigger.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON008';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON008_CountersReceiveAfterQuotaTrigger_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON008';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON009_PN4PN17SuspendedDesignatedCounters.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON009';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON009_PN4PN17SuspendedDesignatedCounters_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON009';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON010_CountersBreachingQuota.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON010';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON010_CountersBreachingQuota_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON010';
   
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON016_AutoFinanceLoan.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON016';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON016_AutoFinanceLoan_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON016';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON017_AutoFinanceRepossession.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON017';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON017_AutoFinanceRepossession_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON017';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON018_DeveloperNameForProperty.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON018';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON018_DeveloperNameForProperty_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON018';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'ConPropertyByBU.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON019';    
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'ConPropertyByBU.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON019';    
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON020_PropertyByState.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON020';
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON020_PropertyByState_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON020';	

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON021.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON021';	
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON021_xls.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON021';	
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON022_SetOfTrigger.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON022';		

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON022_SetOfTrigger.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON022';	

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'CON027_BySector.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON027';		

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CON027_BySector.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON027';		
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'ConRptofTop50Borrowers.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON028';		

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'ConRptofTop50Borrowers.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON028';	

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'ConSecurityByBUE.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON029';		

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'ConSecurityByBUE.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CON029';		
	
/**************************
CMS_REPORT_COUNTRY_MAP
***************************/	
INSERT INTO CMS_REPORT_COUNTRY_MAP (REPORT_MASTER_ID, COUNTRY_ISO_CODE)
SELECT REPORT_MASTER_ID, 'MY' FROM CMS_REPORT_MASTER WHERE MIS_REPORT_ID = 'CON001';

INSERT INTO CMS_REPORT_COUNTRY_MAP (REPORT_MASTER_ID, COUNTRY_ISO_CODE)
SELECT REPORT_MASTER_ID, 'MY' FROM CMS_REPORT_MASTER WHERE MIS_REPORT_ID = 'CON003';    
 
/**************************
CMS_REPORT_DUEDATE_PARAM
***************************/	
INSERT INTO CMS_REPORT_DUEDATE_PARAM (PARAM_ID, VALID_FREQ, VALID_FREQ_UNIT, MIS_REPORT_ID, STATUS)
VALUES (1, 30, 'D', 'BUS015', 'ACTIVE'); 
INSERT INTO CMS_REPORT_DUEDATE_PARAM (PARAM_ID, VALID_FREQ, VALID_FREQ_UNIT, MIS_REPORT_ID, STATUS)
VALUES (2, 60, 'D', 'BUS021', 'ACTIVE'); 
INSERT INTO CMS_REPORT_DUEDATE_PARAM (PARAM_ID, VALID_FREQ, VALID_FREQ_UNIT, MIS_REPORT_ID, STATUS)
VALUES (3, 60, 'D', 'BUS023', 'ACTIVE'); 
INSERT INTO CMS_REPORT_DUEDATE_PARAM (PARAM_ID, VALID_FREQ, VALID_FREQ_UNIT, MIS_REPORT_ID, STATUS)
VALUES (4, 30, 'D', 'BUS025', 'ACTIVE');  
INSERT INTO CMS_REPORT_DUEDATE_PARAM (PARAM_ID, VALID_FREQ, VALID_FREQ_UNIT, MIS_REPORT_ID, STATUS)
VALUES (5, 1, 'M', 'BUS013', 'ACTIVE');
INSERT INTO CMS_REPORT_DUEDATE_PARAM (PARAM_ID, VALID_FREQ, VALID_FREQ_UNIT, MIS_REPORT_ID, STATUS)
VALUES (6, 3, 'M', 'BUS014', 'ACTIVE'); 

/**************************
CMS_FREQUENCY_PARAM
***************************/	
Insert into CMS_REPORT_FREQUENCY
   (REPORT_FREQUENCY_ID, REPORT_MASTER_ID, FREQ_DAY_1, FREQ_DAY_2, STATUS)
select
    next value for CMS_REPORT_FREQUNCY_SEQ, report_master_id, 5, 20, 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'RLS1';