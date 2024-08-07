------------------------
-- Concentration Report 
------------------------  
SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,ABCLIMS;

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'Top100LargestExposureCustomer', 'Country', 'Monthly', 'LCON001_Top100LargestExposureCustomer.rpt',
    'Top 100 Largest Exposure Single Customer', 'LCON001', 'LCN', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'Top50LargestExposureGroup', 'Country', 'Monthly', 'LCON002_Top50LargestExposureGroup.rpt',
    'Top 50 Largest Exposure BGEL Groups', 'LCON002', 'LCN', 'ACTIVE');
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'GroupBreachedBGELLimit', 'Country', 'Monthly', 'LCON003_GroupBreachedBGELLimit.rpt',
    'BGEL Groups that breached the BGEL or GP5 Limit, whichever is lower', 'LCON003', 'LCN', 'ACTIVE');
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'ExposureByBGELLastReviewDate', 'Country', 'Monthly', 'LCON004_ExposureByBGELLastReviewDate.rpt',
    'Exposure Report by BGEL Last Review Date For Past 3 Months', 'LCON004', 'LCN', 'ACTIVE');
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'SummaryLimitBooking', 'Country', 'Monthly', 'LCON005_SummaryLimitBooking.rpt',
    'Monthly Summary Report for Booking of Limit', 'LCON005', 'LCN', 'ACTIVE');
	
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'LimitBookingNotReleased', 'Country', 'Monthly', 'LCON006_LimitBookingNotReleased.rpt',
    'Summary Report for Booking of Limit Not Released > 30 days', 'LCON006', 'LCN', 'ACTIVE');

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'ExposureByEconomicSector', 'Country', 'Monthly', 'LCON007_ExposureByEconomicSector.rpt',
    'Exposure Report by Economic Sector', 'LCON007', 'LCN', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'ExposureByProductProgram', 'Country', 'Monthly', 'LCON008_ExposureByProductProgram.rpt',
    'Exposure Report by Product Program', 'LCON008', 'LCN', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'NewProductType', 'Country', 'Daily', 'LCON009_NewProductType.rpt',
    'New Product Type', 'LCON009', 'LCN', 'ACTIVE');	
   
----------------------
-- Phase 2B Reports --
----------------------      
        
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'SolicitorTotalCases', 'MIS', 'Monthly', 'BUS026_SolicitorTotalCases.rpt', 
    'Total Cases Given To Solicitor', 'BUS026', 'MIS', 'ACTIVE');
       
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'InsurerTotalCases', 'MIS', 'Monthly', 'BUS027_InsurerTotalCases.rpt', 
    'Total Cases Given To Insurer', 'BUS027', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'ValuerTotalCases', 'MIS', 'Monthly', 'BUS028_ValuerTotalCases.rpt', 
    'Total Cases Given To Valuer', 'BUS028', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'ExpiredCCNSecDocs', 'MIS', 'Monthly', 'BUS029_ExpiredCCNSecDocs.rpt', 
    'List of Expired Constitutional & Contractual and Security Documents', 'BUS029', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'DeferredCCNSecDocs', 'MIS', 'Daily', 'BUS030_DeferredCCNSecDocs.rpt', 
    'List of Deferred Constitutional & Contractual and Security Documents', 'BUS030', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'CCNSecDocsDeficiency', 'MIS', 'Monthly', 'BUS031_CCNSecDocsDeficiency.rpt', 
    'List of Constitutional & Contractual and Security Documents Deficiency', 'BUS031', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'CCNSecDocsPendingLodge', 'MIS', 'Daily', 'BUS032_CCNSecDocsPendingLodge.rpt', 
    'List of Constitutional & Contractual and Security Documents Pending Lodge', 'BUS032', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'CCNSecDocsDueToExpire', 'MIS', 'Monthly', 'BUS033_CCNSecDocsDueToExpire.rpt', 
    'List of Constitutional & Contractual and Security Documents Due To Expire', 'BUS033', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'CCNSecDocsTemporarilyUplifted', 'MIS', 'Monthly', 'BUS034_CCNSecDocsTemporarilyUplifted.rpt', 
    'List of Constitutional & Contractual and Security Documents Temporarily Uplifted', 'BUS034', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'CCNSecDocsPermanentlyUplifted', 'MIS', 'Monthly', 'BUS035_CCNSecDocsPermanentlyUplifted.rpt', 
    'List of Constitutional & Contractual and Security Documents Permanently Uplifted', 'BUS035', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'MonthlyTATReportInProgressCases(CO)', 'MIS', 'Monthly', 'BUS036_MonthlyTATReportInProgressCases(CO).rpt', 
    'Monthly TAT Report In Progress Cases (CO)', 'BUS036_CO', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'MonthlyTATReportInProgressCases(COM)', 'MIS', 'Monthly', 'BUS036_MonthlyTATReportInProgressCases(COM).rpt', 
    'Monthly TAT Report In Progress Cases (COM)', 'BUS036_COM', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'MonthlyTATReportInProgressCases(HP)', 'MIS', 'Monthly', 'BUS036_MonthlyTATReportInProgressCases(HP).rpt', 
    'Monthly TAT Report In Progress Cases (HP)', 'BUS036_HP', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'MonthlyTATReportInProgressCases(MO)', 'MIS', 'Monthly', 'BUS036_MonthlyTATReportInProgressCases(MO).rpt', 
    'Monthly TAT Report In Progress Cases (MO)', 'BUS036_MO', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'MonthlyTATReportInProgressCases(PL)', 'MIS', 'Monthly', 'BUS036_MonthlyTATReportInProgressCases(PL).rpt', 
    'Monthly TAT Report In Progress Cases (PL)', 'BUS036_PL', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'CumulativeTATReportInProgressCases(CO)', 'MIS', 'Monthly', 'BUS037_CumulativeTATReportInProgressCases(CO).rpt', 
    'CumulativeTATReport In Progress Cases (CO)', 'BUS037_CO', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'CumulativeTATReportInProgressCases(COM)', 'MIS', 'Monthly', 'BUS037_CumulativeTATReportInProgressCases(COM).rpt', 
    'CumulativeTATReport In Progress Cases (COM)', 'BUS037_COM', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'CumulativeTATReportInProgressCases(HP)', 'MIS', 'Monthly', 'BUS037_CumulativeTATReportInProgressCases(HP).rpt', 
    'CumulativeTATReport In Progress Cases (HP)', 'BUS037_HP', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'CumulativeTATReportInProgressCases(MO)', 'MIS', 'Monthly', 'BUS037_CumulativeTATReportInProgressCases(MO).rpt', 
    'CumulativeTATReport In Progress Cases (MO)', 'BUS037_MO', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'CumulativeTATReport–InProgressCases(PL)', 'MIS', 'Monthly', 'BUS037_CumulativeTATReport–InProgressCases(PL).rpt', 
    'CumulativeTATReport - In Progress Cases (PL)', 'BUS037_PL', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'MonthlyTATReportCompletedCases(CO)', 'MIS', 'Monthly', 'BUS038_MonthlyTATReportCompletedCases(CO).rpt', 
    'Monthly TATReport Completed Cases(CO)', 'BUS038_CO', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'MonthlyTATReportCompletedCases(COM)', 'MIS', 'Monthly', 'BUS038_MonthlyTATReportCompletedCases(COM).rpt', 
    'Monthly TAT Report Completed Cases (COM)', 'BUS038_COM', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'MonthlyTATReportCompletedCases(HP)', 'MIS', 'Monthly', 'BUS038_MonthlyTATReportCompletedCases(HP).rpt', 
    'Monthly TAT Report Completed Cases (HP)', 'BUS038_HP', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'MonthlyTATReportCompletedCases(MO)', 'MIS', 'Monthly', 'BUS038_MonthlyTATReportCompletedCases(MO).rpt', 
    'Monthly TAT Report Completed Cases (MO)', 'BUS038_MO', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'MonthlyTATReportCompletedCases(PL)', 'MIS', 'Monthly', 'BUS038_MonthlyTATReportCompletedCases(PL).rpt', 
    'Monthly TAT Report Completed Cases(PL)', 'BUS038_PL', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'CumulativeTATReportCompletedCases(CO)', 'MIS', 'Monthly', 'BUS039_CumulativeTATReportCompletedCases(CO).rpt', 
    'Cumulative TAT Report CompletedCases (CO)', 'BUS039_CO', 'MIS', 'ACTIVE');
    
Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'CumulativeTATReportCompletedCases(COM)', 'MIS', 'Monthly', 'BUS039_CumulativeTATReportCompletedCases(COM).rpt', 
    'Cumulative TAT Report CompletedCases (COM)', 'BUS039_COM', 'MIS', 'ACTIVE');
    
 Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'CumulativeTATReportCompletedCases(HP)', 'MIS', 'Monthly', 'BUS039_CumulativeTATReportCompletedCases(HP).rpt', 
    'Cumulative TAT Report CompletedCases (HP)', 'BUS039_HP', 'MIS', 'ACTIVE');
    
 Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'CumulativeTATReportCompletedCases(MO)', 'MIS', 'Monthly', 'BUS039_CumulativeTATReportCompletedCases(MO).rpt', 
    'Cumulative TAT Report CompletedCases (MO)', 'BUS039_MO', 'MIS', 'ACTIVE');
    
  Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'CumulativeTATReportCompletedCases(PL)', 'MIS', 'Monthly', 'BUS039_CumulativeTATReportCompletedCases(PL).rpt', 
    'Cumulative TAT Report Completed Cases (PL)', 'BUS039_PL', 'MIS', 'ACTIVE');
    
  Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'DCLCaseStatus', 'MIS', 'Monthly', 'BUS040_DCLCaseStatus.rpt', 'DCL Case Status', 'BUS040', 'MIS', 'ACTIVE');
    
  Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for cms_report_master_seq), 'CCNSecDocsInVault', 'MIS', 'Monthly', 'BUS041_CCNSecDocsInVault.rpt', 'List of Constitutional & Contractual and Security Documents In Vault', 'BUS041', 'MIS', 'ACTIVE');

------------------------
-- CCI Report 
------------------------  

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'CCICustomerMatching', 'Country', 'Weekly', 'CCI001_CCICustomerMatching.rpt',
    'Customer Matching Report', 'CCI001', 'CCI', 'ACTIVE');	

------------------------
-- Group Report 
------------------------  

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'GrpExpRptByGrpMember', 'GRP', 'Daily', 'RPT01_SVC_GrpExpRpt_ByGrpMember.rpt',
    'Group Exposure Report by Group Member', 'RPT01', 'GRP', 'ACTIVE');	

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'GrpExpRptForGP5', 'GRP', 'Daily', 'RPT02_SVC_GrpExpRpt_ForGP5.rpt',
    'Group Exposure Report by GP5', 'RPT02', 'GRP', 'ACTIVE');	

Insert into cms_report_master
   (REPORT_MASTER_ID, REPORT_NAME, SCOPE, FREQUENCY, REPORT_FILE_NAME, 
    TITLE_MASK, MIS_REPORT_ID, REPORT_CATEGORY_ID, STATUS)
 Values
   (char(next value for CMS_REPORT_SEQ), 'SVCGrpExpCharts', 'GRP', 'Daily', 'RPT03_SVC_GrpExpCharts.rpt',
    'Group Exposure Chart', 'RPT03', 'GRP', 'ACTIVE');	
	
------------------------
-- Template setup
------------------------  	

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'LCON001_Top100LargestExposureCustomer.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'LCON001';
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'LCON002_Top50LargestExposureGroup.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'LCON002';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'LCON003_GroupBreachedBGELLimit.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'LCON003';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'LCON004_ExposureByBGELLastReviewDate.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'LCON004';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'LCON005_SummaryLimitBooking.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'LCON005';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'LCON006_LimitBookingNotReleased.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'LCON006';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'LCON007_ExposureByEconomicSector.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'LCON007';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'CCI001_CCICustomerMatching.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'CCI001';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'RPT01_SVC_GrpExpRpt_ByGrpMember.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'RPT01';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'RPT02_SVC_GrpExpRpt_ForGP5.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'RPT02';
	
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'RPT03_SVC_GrpExpCharts.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'RPT03';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'LCON008_ExposureByProductProgram.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'LCON008';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'LCON009_NewProductType.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'LCON009';
    
----------------------
-- Phase 2B Reports --
----------------------   

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS026_SolicitorTotalCases.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS026';
      
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS026_SolicitorTotalCases.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS026';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS027_InsurerTotalCases.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS027';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS027_InsurerTotalCases.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS027';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS028_ValuerTotalCases.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS028';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS028_ValuerTotalCases.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS028';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS029_ExpiredCCNSecDocs.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS029';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS029_ExpiredCCNSecDocs.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS029';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS030_DeferredCCNSecDocs.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS030';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS030_DeferredCCNSecDocs.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS030';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS031_CCNSecDocsDeficiency.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS031';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS031_CCNSecDocsDeficiency.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS031';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS032_CCNSecDocsPendingLodge.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS032';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS032_CCNSecDocsPendingLodge.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS032';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS033_CCNSecDocsDueToExpire.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS033';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS033_CCNSecDocsDueToExpire.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS033';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS034_CCNSecDocsTemporarilyUplifted.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS034';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS034_CCNSecDocsTemporarilyUplifted.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS034';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS035_CCNSecDocsPermanentlyUplifted.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS035';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS035_CCNSecDocsPermanentlyUplifted.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS035';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS036_MonthlyTATReportInProgressCasesCO.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS036_CO';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS036_MonthlyTATReportInProgressCasesCO.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS036_CO';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS036_MonthlyTATReportInProgressCasesCOM.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS036_COM';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS036_MonthlyTATReportInProgressCasesCOM.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS036_COM';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS036_MonthlyTATReportInProgressCasesHP.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS036_HP';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS036_MonthlyTATReportInProgressCasesHP.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS036_HP';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS036_MonthlyTATReportInProgressCasesMO.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS036_MO';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS036_MonthlyTATReportInProgressCasesMO.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS036_MO';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS036_MonthlyTATReportInProgressCasesPL.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS036_PL';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS036_MonthlyTATReportInProgressCasesPL.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS036_PL';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS037_CumulativeTATReportInProgressCasesCO.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS037_CO';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS037_CumulativeTATReportInProgressCasesCO.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS037_CO';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS037_CumulativeTATReportInProgressCasesCOM.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS037_COM';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS037_CumulativeTATReportInProgressCasesCOM.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS037_COM';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS037_CumulativeTATReportInProgressCasesHP.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS037_HP';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS037_CumulativeTATReportInProgressCasesHP.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS037_HP';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS037_CumulativeTATReportInProgressCasesMO.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS037_MO';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS037_CumulativeTATReportInProgressCasesMO.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS037_MO';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS037_CumulativeTATReportInProgressCasesPL.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS037_PL';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS037_CumulativeTATReportInProgressCasesPL.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS037_PL';   
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS038_MonthlyTATReportCompletedCasesCO.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS038_CO';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS038_MonthlyTATReportCompletedCasesCO.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS038_CO';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS038_MonthlyTATReportCompletedCasesCOM.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS038_COM';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS038_MonthlyTATReportCompletedCasesCOM.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS038_COM';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS038_MonthlyTATReportCompletedCasesHP.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS038_HP';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS038_MonthlyTATReportCompletedCasesHP.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS038_HP';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS038_MonthlyTATReportCompletedCasesMO.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS038_MO';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS038_MonthlyTATReportCompletedCasesMO.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS038_MO';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS038_MonthlyTATReportCompletedCasesPL.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS038_PL';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS038_MonthlyTATReportCompletedCasesPL.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS038_PL';

Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS039_CumulativeTATReportCompletedCasesCO.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS039_CO';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS039_CumulativeTATReportCompletedCasesCO.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS039_CO';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS039_CumulativeTATReportCompletedCasesCOM.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS039_COM';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS039_CumulativeTATReportCompletedCasesCOM.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS039_COM';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS039_CumulativeTATReportCompletedCasesHP.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS039_HP';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS039_CumulativeTATReportCompletedCasesHP.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS039_HP';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS039_CumulativeTATReportCompletedCasesMO.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS039_MO';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS039_CumulativeTATReportCompletedCasesMO.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS039_MO';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS039_CumulativeTATReportCompletedCasesPL.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS039_PL';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
   
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS039_CumulativeTATReportCompletedCasesPL.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS039_PL';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS040_DCLCaseStatus.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS040';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS040_DCLCaseStatus.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS040';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'XLS', 'BUS041_CCNSecDocsInVault.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS041';
    
Insert into CMS_REPORT_TEMPLATE
   (REPORT_TEMPLATE_ID, REPORT_MASTER_ID, FILE_TYPE, TEMPLATE_NAME, STATUS)
select
    next value for CMS_REPORT_TEMPLATE_SEQ, report_master_id, 'PDF', 'BUS041_CCNSecDocsInVault.rpt', 'ACTIVE'
    from cms_report_master where MIS_REPORT_ID = 'BUS041';