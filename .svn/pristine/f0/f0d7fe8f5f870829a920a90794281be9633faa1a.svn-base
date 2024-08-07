-----------------------------
-- Cleanup
-----------------------------
-- DELETE FROM MIG_QC_REPORT;		//Use drop and recreate mig report - much faster

-----------------------------
-- Update pledger
-----------------------------
-- Cif Id, Customer Short Name
UPDATE MIG_CO019_PL pl
SET CIF_ID = (select cu.CIF_ID from MIG_CU001_CU cu
                where pl.SRC_LE_ID = cu.CIF_ID),
    CUST_NAME_S = (select cu1.CUST_NAME_S from MIG_CU001_CU cu1
                    where pl.SRC_LE_ID = cu1.CIF_ID);
					
commit;					

-- Application type
UPDATE MIG_CO019_PL pl
SET APPLICATION_TYPE = (select aa.APPLICATION_TYPE from MIG_CA001_AA aa, MIG_CA003_1 fac
                        where aa.LOS_BCA_REF_NUM = fac.LOS_AA_NUMBER
                        and fac.LIMIT_ID = pl.LIMIT_ID
                        group by aa.APPLICATION_TYPE, aa.CIF_ID, pl.SECURITY_ID, pl.LIMIT_ID);
						
commit;						

-- Application law type
UPDATE MIG_CO019_PL pl
SET APPLICATION_LAW_TYPE = (select aa.APPLICATION_LAW_TYPE from MIG_CA001_AA aa, MIG_CA003_1 fac
	                        where aa.LOS_BCA_REF_NUM = fac.LOS_AA_NUMBER
	                        and fac.LIMIT_ID = pl.LIMIT_ID
	                        group by aa.APPLICATION_LAW_TYPE, aa.CIF_ID, pl.SECURITY_ID, pl.LIMIT_ID);
							
commit;							

-- Update Collateral Code
UPDATE MIG_CO019_PL pl
SET SOURCE_SECURITY_SUB_TYPE = (select sec.SOURCE_SECURITY_SUB_TYPE from CMS_SECURITY sec, CMS_LIMIT_SECURITY_MAP lsm
								where pl.CMS_ACT_COL_ID = sec.CMS_COLLATERAL_ID
								and lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID 
								and lsm.CMS_LSP_APPR_LMTS_ID = pl.CMS_ACT_LMT_ID
								group by sec.SOURCE_SECURITY_SUB_TYPE, pl.CMS_ACT_COL_ID, pl.CMS_ACT_LMT_ID);
								
commit;	

-- Update  cms security organisation (For data extraction purpose)
update MIG_CO019_PL pl
set LOC_ORG_CODE = (select sec.SECURITY_ORGANISATION from CMS_SECURITY sec
				    where pl.SECURITY_ID = sec.SCI_SECURITY_DTL_ID
					group by sec.SECURITY_ORGANISATION fetch first row only);			

commit;

-- Update  cms security subtype(For data extraction purpose)
update MIG_CO019_PL pl
set CMS_SECURITY_SUBTYPE_ID = (select sec.SECURITY_SUB_TYPE_ID from CMS_SECURITY sec
                                where pl.SECURITY_ID = sec.SCI_SECURITY_DTL_ID
                                group by sec.SECURITY_SUB_TYPE_ID fetch first row only);	

commit;

-----------------------------
-- Customer
-----------------------------
-- CU001
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||                       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.CIF_ID), '-') || ' | ' ||                       
		-- COALESCE(char(mig.CUST_NAME_L), '-') || ' | ' ||    
		-- COALESCE(char(mig.CUST_NAME_S), '-') || ' | ' ||                  
		-- COALESCE(char(mig.CUST_CLASS_CODE), '-') || ' | ' ||              
		-- COALESCE(char(mig.ID_ISSUE_COUNTRY), '-') || ' | ' ||             
		-- COALESCE(char(mig.ID_TYPE_CODE), '-') || ' | ' ||                 
		-- COALESCE(char(mig.ID_NUMBER), '-') || ' | ' ||                    
		-- COALESCE(char(mig.ID_IISSUE_DATE), '-') || ' | ' ||               
		-- COALESCE(char(mig.SECONDARY_ID_COUNTRY_ISSUED), '-') || ' | ' ||  
		-- COALESCE(char(mig.SECONDARY_ID_TYPE_CODE), '-') || ' | ' ||       
		-- COALESCE(char(mig.SECONDARY_ID_NUMBER), '-') || ' | ' ||          
		-- COALESCE(char(mig.CUST_TYPE), '-') || ' | ' ||                    
		-- COALESCE(char(mig.CUST_START_DATE), '-') || ' | ' ||              
		-- COALESCE(char(mig.BLACKLISTED), '-') || ' | ' ||                  
		-- COALESCE(char(mig.ISIC_CODE), '-') || ' | ' ||                    
		-- COALESCE(char(mig.PRIMARY_ADD_TYPE_CODE), '-') || ' | ' ||        
		-- COALESCE(char(mig.PRIMARY_ADD_1), '-') || ' | ' ||                
		-- COALESCE(char(mig.PRIMARY_ADD_2), '-') || ' | ' ||                
		-- COALESCE(char(mig.PRIMARY_ADD_3), '-') || ' | ' ||                
		-- COALESCE(char(mig.PRIMARY_ADD_4), '-') || ' | ' ||                
		-- COALESCE(char(mig.PRIMARY_ADD_5), '-') || ' | ' ||                
		-- COALESCE(char(mig.PRIMARY_POSTCODE), '-') || ' | ' ||             
		-- COALESCE(char(mig.PRIMARY_CITY), '-') || ' | ' ||                 
		-- COALESCE(char(mig.PRIMARY_STATE), '-') || ' | ' ||                
		-- COALESCE(char(mig.PRIMARY_COUNTRY), '-') || ' | ' ||              
		-- COALESCE(char(mig.SECONDARY_ADD_TYPE_CODE), '-') || ' | ' ||      
		-- COALESCE(char(mig.SECONDARY_ADD_1), '-') || ' | ' ||              
		-- COALESCE(char(mig.SECONDARY_ADD_2), '-') || ' | ' ||              
		-- COALESCE(char(mig.SECONDARY_ADD_3), '-') || ' | ' ||              
		-- COALESCE(char(mig.SECONDARY_ADD_4), '-') || ' | ' ||              
		-- COALESCE(char(mig.SECONDARY_ADD_5), '-') || ' | ' ||              
		-- COALESCE(char(mig.SECONDARY_POSTCODE), '-') || ' | ' ||           
		-- COALESCE(char(mig.SECONDARY_CITY), '-') || ' | ' ||               
		-- COALESCE(char(mig.SECONDARY_STATE), '-') || ' | ' ||              
		-- COALESCE(char(mig.SECONDARY_COUNTRY), '-') || ' | ' ||            
		-- COALESCE(char(mig.LMP_ACC_OFFICER_NUM), '-') || ' | ' ||          
		-- COALESCE(char(mig.LMP_ACC_OFFICER_VALUE), '-') || ' | ' ||        
		-- COALESCE(char(mig.CMS_SUB_ORIG_ORGANISATION), '-') || ' | ' ||    
		-- COALESCE(char(mig.LSP_DMCL_CNTRY_ISO_CODE), '-') || ' | ' ||  
		-- 'T'
	-- , 'SIBS', 'CU001', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y' 
	-- FROM MIG_CU001_CU mig, MIG_CO019_PL pl
	-- WHERE mig.CIF_ID = pl.CIF_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||                       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||
			COALESCE(char(mig.CIF_ID), '' '') || '' | '' ||                       
			COALESCE(char(mig.CUST_NAME_L), '' '') || '' | '' ||    
			COALESCE(char(mig.CUST_NAME_S), '' '') || '' | '' ||                  
			COALESCE(char(mig.CUST_CLASS_CODE), '' '') || '' | '' ||              
			COALESCE(char(mig.ID_ISSUE_COUNTRY), '' '') || '' | '' ||             
			COALESCE(char(mig.ID_TYPE_CODE), '' '') || '' | '' ||                 
			COALESCE(char(mig.ID_NUMBER), '' '') || '' | '' ||                    
			COALESCE(char(REPLACE(FORMAT_DATE(mig.ID_IISSUE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||               
			COALESCE(char(mig.SECONDARY_ID_COUNTRY_ISSUED), '' '') || '' | '' ||  
			COALESCE(char(mig.SECONDARY_ID_TYPE_CODE), '' '') || '' | '' ||       
			COALESCE(char(mig.SECONDARY_ID_NUMBER), '' '') || '' | '' ||          
			COALESCE(char(mig.CUST_TYPE), '' '') || '' | '' ||                    
			COALESCE(char(REPLACE(FORMAT_DATE(mig.CUST_START_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||              
			COALESCE(char(mig.BLACKLISTED), '' '') || '' | '' ||                  
			COALESCE(char(mig.ISIC_CODE), '' '') || '' | '' ||                    
			COALESCE(char(mig.PRIMARY_ADD_TYPE_CODE), '' '') || '' | '' ||        
			COALESCE(char(mig.PRIMARY_ADD_1), '' '') || '' | '' ||                
			COALESCE(char(mig.PRIMARY_ADD_2), '' '') || '' | '' ||                
			COALESCE(char(mig.PRIMARY_ADD_3), '' '') || '' | '' ||                
			COALESCE(char(mig.PRIMARY_ADD_4), '' '') || '' | '' ||                
			COALESCE(char(mig.PRIMARY_ADD_5), '' '') || '' | '' ||                
			COALESCE(char(mig.PRIMARY_POSTCODE), '' '') || '' | '' ||             
			COALESCE(char(mig.PRIMARY_CITY), '' '') || '' | '' ||                 
			COALESCE(char(mig.PRIMARY_STATE), '' '') || '' | '' ||                
			COALESCE(char(mig.PRIMARY_COUNTRY), '' '') || '' | '' ||              
			COALESCE(char(mig.SECONDARY_ADD_TYPE_CODE), '' '') || '' | '' ||      
			COALESCE(char(mig.SECONDARY_ADD_1), '' '') || '' | '' ||              
			COALESCE(char(mig.SECONDARY_ADD_2), '' '') || '' | '' ||              
			COALESCE(char(mig.SECONDARY_ADD_3), '' '') || '' | '' ||              
			COALESCE(char(mig.SECONDARY_ADD_4), '' '') || '' | '' ||              
			COALESCE(char(mig.SECONDARY_ADD_5), '' '') || '' | '' ||              
			COALESCE(char(mig.SECONDARY_POSTCODE), '' '') || '' | '' ||           
			COALESCE(char(mig.SECONDARY_CITY), '' '') || '' | '' ||               
			COALESCE(char(mig.SECONDARY_STATE), '' '') || '' | '' ||              
			COALESCE(char(mig.SECONDARY_COUNTRY), '' '') || '' | '' ||            
			COALESCE(char(mig.LMP_ACC_OFFICER_NUM), '' '') || '' | '' ||          
			COALESCE(char(mig.LMP_ACC_OFFICER_VALUE), '' '') || '' | '' ||        
			COALESCE(char(mig.CMS_SUB_ORIG_ORGANISATION), '' '') || '' | '' ||    
			COALESCE(char(mig.LSP_DMCL_CNTRY_ISO_CODE), '' '') || '' | '' ||  
			COALESCE(char(mig.MAILING_ADD_TYPE_CODE), '' '') || '' | '' ||      
			COALESCE(char(mig.MAILING_ADD_1), '' '') || '' | '' ||              
			COALESCE(char(mig.MAILING_ADD_2), '' '') || '' | '' ||              
			COALESCE(char(mig.MAILING_ADD_3), '' '') || '' | '' ||              
			COALESCE(char(mig.MAILING_ADD_4), '' '') || '' | '' ||              
			COALESCE(char(mig.MAILING_ADD_5), '' '') || '' | '' ||              
			COALESCE(char(mig.MAILING_POSTCODE), '' '') || '' | '' ||           
			COALESCE(char(mig.MAILING_CITY), '' '') || '' | '' ||               
			COALESCE(char(mig.MAILING_STATE), '' '') || '' | '' ||              
			COALESCE(char(mig.MAILING_COUNTRY), '' '') || '' | '' || 			
			''T''
		, ''SIBS'', ''CU001'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y'' 
		FROM MIG_CU001_CU mig, MIG_CO019_PL pl
		WHERE mig.CIF_ID = pl.CIF_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');	
	
commit;	
 
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CU001', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CU001' and FLAG = 'Y'), 'SIBS', 'CU001', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CU001', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV001SIBS', 'SIBS', 'CU001', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CU001', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CU001', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CU001' and FLAG = 'Y'), 'SIBS', 'CU001', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CU001', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV001SIBS', 'SIBS', 'CU001', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CU001', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CU001', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CU001' and FLAG = 'Y'), 'SIBS', 'CU001', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CU001', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV001SIBS', 'SIBS', 'CU001', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CU001', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CU001', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CU001' and FLAG = 'Y'), 'SIBS', 'CU001', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CU001', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV001SIBS', 'SIBS', 'CU001', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CU001', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CU001', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CU001' and FLAG = 'Y'), 'SIBS', 'CU001', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CU001', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV001SIBS', 'SIBS', 'CU001', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CU001', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CU001', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CU001' and FLAG = 'Y'), 'SIBS', 'CU001', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CU001', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV001SIBS', 'SIBS', 'CU001', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CU001', 'OTH', 'ISL');
 
    
-----------------------------
-- AA
-----------------------------
-- CA001
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||    
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' ||   
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.CIF_ID), '-') || ' | ' ||    
		-- COALESCE(char(mig.CIF_SOURCE), '-') || ' | ' ||   
		-- COALESCE(char(mig.LOS_BCA_REF_NUM), '-') || ' | ' ||       
		-- COALESCE(char(mig.AA_NUMBER), '-') || ' | ' ||             
		-- COALESCE(char(mig.JOINT_BORROWER_IND), '-') || ' | ' ||    
		-- COALESCE(char(mig.AA_APPROVED_DATE), '-') || ' | ' ||      
		-- COALESCE(char(mig.ORI_LOC_COUNTRY), '-') || ' | ' ||       
		-- COALESCE(char(mig.ORI_LOC_ORG_CODE), '-') || ' | ' ||      
		-- COALESCE(char(mig.ANNUAL_REVIEW_DATE), '-') || ' | ' ||    
		-- COALESCE(char(mig.AA_STAT), '-') || ' | ' ||               
		-- COALESCE(char(mig.AA_CREATE_DATE), '-') || ' | ' ||  
		-- COALESCE(char(mig.APPLICATION_TYPE), '-') || ' | ' ||   
		-- COALESCE(char(mig.APPLICATION_LAW_TYPE), '-') || ' | ' ||  		
		-- 'T'
	-- , 'SIBS', 'CA001', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y'
	-- FROM MIG_CA001_AA mig, MIG_CO019_PL pl
	-- WHERE mig.CIF_ID = pl.CIF_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||    
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' ||   
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||
			COALESCE(char(mig.CIF_ID), '' '') || '' | '' ||    
			COALESCE(char(mig.CIF_SOURCE), '' '') || '' | '' ||   
			COALESCE(char(mig.LOS_BCA_REF_NUM), '' '') || '' | '' ||       
			COALESCE(char(mig.AA_NUMBER), '' '') || '' | '' ||             
			COALESCE(char(mig.JOINT_BORROWER_IND), '' '') || '' | '' ||    
			COALESCE(char(REPLACE(FORMAT_DATE(mig.AA_APPROVED_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||      
			COALESCE(char(mig.ORI_LOC_COUNTRY), '' '') || '' | '' ||       
			COALESCE(char(mig.ORI_LOC_ORG_CODE), '' '') || '' | '' ||      
			COALESCE(char(REPLACE(FORMAT_DATE(mig.ANNUAL_REVIEW_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||    
			COALESCE(char(mig.AA_STAT), '' '') || '' | '' ||               
			COALESCE(char(REPLACE(FORMAT_DATE(mig.AA_CREATE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||  
			COALESCE(char(mig.APPLICATION_TYPE), '' '') || '' | '' ||   
			COALESCE(char(mig.APPLICATION_LAW_TYPE), '' '') || '' | '' ||  		
			''T''
		, ''SIBS'', ''CA001'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''
		FROM MIG_CA001_AA mig, MIG_CO019_PL pl
		WHERE mig.CIF_ID = pl.CIF_ID
		AND mig.AA_NUMBER = pl.APPLICATION_NO
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		

commit;	
	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA001', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA001' and FLAG = 'Y'), 'SIBS', 'CA001', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA001', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV002SIBS', 'SIBS', 'CA001', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA001', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA001', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA001' and FLAG = 'Y'), 'SIBS', 'CA001', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA001', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV002SIBS', 'SIBS', 'CA001', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA001', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA001', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA001' and FLAG = 'Y'), 'SIBS', 'CA001', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA001', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV002SIBS', 'SIBS', 'CA001', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA001', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA001', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA001' and FLAG = 'Y'), 'SIBS', 'CA001', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA001', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV002SIBS', 'SIBS', 'CA001', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA001', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA001', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA001' and FLAG = 'Y'), 'SIBS', 'CA001', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA001', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV002SIBS', 'SIBS', 'CA001', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA001', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA001', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA001' and FLAG = 'Y'), 'SIBS', 'CA001', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA001', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV002SIBS', 'SIBS', 'CA001', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA001', 'OTH', 'ISL');


-----------------------------
-- Joint Borrower
-----------------------------    
-- CA002
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' ||   
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.CIF_ID), '-') || ' | ' ||   
		-- COALESCE(char(mig.CIF_SOURCE), '-') || ' | ' ||  		
		-- COALESCE(char(mig.AA_NUMBER), '-') || ' | ' ||    
		-- 'T'
	-- , 'SIBS', 'CA002', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y'  
	-- FROM MIG_CA002_JB mig, MIG_CO019_PL pl 
	-- WHERE mig.CIF_ID = pl.CIF_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' ||   
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  
			''D'' || '' | '' ||
			COALESCE(char(mig.CIF_ID), '' '') || '' | '' ||   
			COALESCE(char(mig.CIF_SOURCE), '' '') || '' | '' ||  		
			COALESCE(char(mig.AA_NUMBER), '' '') || '' | '' ||    
			''T''
		, ''SIBS'', ''CA002'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''  
		FROM MIG_CA002_JB mig, MIG_CO019_PL pl 
		WHERE mig.CIF_ID = pl.CIF_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');			
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA002', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA002' and FLAG = 'Y'), 'SIBS', 'CA002', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA002', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV003SIBS', 'SIBS', 'CA002', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA002', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA002', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA002' and FLAG = 'Y'), 'SIBS', 'CA002', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA002', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV003SIBS', 'SIBS', 'CA002', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA002', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA002', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA002' and FLAG = 'Y'), 'SIBS', 'CA002', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA002', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV003SIBS', 'SIBS', 'CA002', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA002', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA002', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA002' and FLAG = 'Y'), 'SIBS', 'CA002', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA002', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV003SIBS', 'SIBS', 'CA002', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA002', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA002', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA002' and FLAG = 'Y'), 'SIBS', 'CA002', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA002', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV003SIBS', 'SIBS', 'CA002', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA002', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA002', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA002' and FLAG = 'Y'), 'SIBS', 'CA002', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA002', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV003SIBS', 'SIBS', 'CA002', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA002', 'OTH', 'ISL');


-----------------------------
-- Facility
-----------------------------    
-- CA003_1
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' ||   
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.CIF_ID), '-') || ' | ' ||   
		-- COALESCE(char(mig.LOS_AA_NUMBER), '-') || ' | ' ||                   
		-- COALESCE(char(mig.AA_NUMBER), '-') || ' | ' ||                       
		-- COALESCE(char(mig.LIMIT_ID), '-') || ' | ' ||                        
		-- COALESCE(char(mig.ACF_NO), '-') || ' | ' ||                          
		-- COALESCE(char(mig.FACILITY_CODE), '-') || ' | ' ||                   
		-- COALESCE(char(mig.FACILITY_SEQ), '-') || ' | ' ||                    
		-- COALESCE(char(mig.EXPIRY_DATE), '-') || ' | ' ||                     
		-- COALESCE(char(mig.ORI_LOC_COUNTRY), '-') || ' | ' ||                 
		-- COALESCE(char(mig.ORG_LOC_ORG_CODE), '-') || ' | ' ||                
		-- COALESCE(char(mig.PRODUCT_TYPE_CODE), '-') || ' | ' ||               
		-- COALESCE(char(mig.LIMIT_CURRENCY), '-') || ' | ' ||                  
		-- COALESCE(char(mig.LIMIT_AMT), '-') || ' | ' ||                       
		-- COALESCE(char(mig.LIMIT_TENOR), '-') || ' | ' ||                     
		-- COALESCE(char(mig.LIMIT_TENOR_UOM), '-') || ' | ' ||                 
		-- COALESCE(char(mig.DRAWING_LIMIT_AMT), '-') || ' | ' ||               
		-- COALESCE(char(mig.OUTSTANDING_AMT), '-') || ' | ' ||                 
		-- COALESCE(char(mig.FINANCED_AMOUNT), '-') || ' | ' ||                 
		-- COALESCE(char(mig.APPLICATION_DATE), '-') || ' | ' ||                
		-- COALESCE(char(mig.INSTALLMENT_AMOUNT), '-') || ' | ' ||              
		-- COALESCE(char(mig.FINAL_PAYMENT), '-') || ' | ' ||                   
		-- COALESCE(char(mig.LOAN_PURPOSE_CODE_VALUE), '-') || ' | ' ||         
		-- COALESCE(char(mig.OFFER_DATE), '-') || ' | ' ||                      
		-- COALESCE(char(mig.OFFER_ACCEPTED_DATE), '-') || ' | ' ||             
		-- COALESCE(char(mig.APPROVED_DATE), '-') || ' | ' ||                   
		-- COALESCE(char(mig.PERSON_APPROVED_CODE_VALUE), '-') || ' | ' ||      
		-- COALESCE(char(mig.CAR_CODE_FLAG), '-') || ' | ' ||                   
		-- COALESCE(char(mig.CAR_CODE_VALUE), '-') || ' | ' ||                  
		-- COALESCE(char(mig.OFFICER_CODE_VALUE), '-') || ' | ' ||              
		-- COALESCE(char(mig.LMT_STATUS_CODE_VALUE), '-') || ' | ' ||           
		-- COALESCE(char(mig.FAC_STATUS_CODE_VALUE), '-') || ' | ' ||           
		-- COALESCE(char(mig.INTEREST_RATE), '-') || ' | ' ||                   
		-- COALESCE(char(mig.INTEREST_TYPE_CODE_VALUE), '-') || ' | ' ||        
		-- COALESCE(char(mig.SPREAD), '-') || ' | ' ||                          
		-- COALESCE(char(mig.SPREAD_SIGN), '-') || ' | ' ||                     
		-- COALESCE(char(mig.PRIME_RATE_FLOOR), '-') || ' | ' ||                
		-- COALESCE(char(mig.PRIME_RATE_CEILING), '-') || ' | ' ||              
		-- COALESCE(char(mig.PRIME_REVIEW_DATE), '-') || ' | ' ||               
		-- COALESCE(char(mig.PRIME_REVIEW_TERM), '-') || ' | ' ||               
		-- COALESCE(char(mig.PRIME_REVIEW_TERM_CODE_VALUE), '-') || ' | ' ||    
		-- COALESCE(char(mig.OD_EXCESS_RATE_VAR), '-') || ' | ' ||              
		-- COALESCE(char(mig.OD_EXCESS_RATE_VAR_CODE), '-') || ' | ' ||         
		-- COALESCE(char(mig.PAR_VALUE_SHARES), '-') || ' | ' ||                
		-- COALESCE(char(mig.DEALER_NUM_LPP_CODE_VALUE), '-') || ' | ' ||       
		-- COALESCE(char(mig.LATE_CHARGE_TYPE), '-') || ' | ' ||                
		-- COALESCE(char(mig.COMMISSION_FEES), '-') || ' | ' ||                 
		-- COALESCE(char(mig.HANDLING_FEES), '-') || ' | ' ||                   
		-- COALESCE(char(mig.SUBSIDY_AMOUNT), '-') || ' | ' ||                  
		-- COALESCE(char(mig.OTHERS_FEE), '-') || ' | ' ||                      
		-- COALESCE(char(mig.COMMISSION_RATE), '-') || ' | ' ||                 
		-- COALESCE(char(mig.COMMISSION_BASIS_CODE_VALUE), '-') || ' | ' ||     
		-- COALESCE(char(mig.MAX_COMSSN_AMOUNT), '-') || ' | ' ||               
		-- COALESCE(char(mig.MIN_COMSSN_AMOUNT), '-') || ' | ' ||               
		-- COALESCE(char(mig.STANDBY_LINE_FAC_CODE), '-') || ' | ' ||           
		-- COALESCE(char(mig.STANDBY_LINE_FAC_SEQ), '-') || ' | ' ||            
		-- COALESCE(char(mig.COMMITMENT_RATE), '-') || ' | ' ||                 
		-- COALESCE(char(mig.COMTMT_RATE_NUM_CODE_VALUE), '-') || ' | ' ||      
		-- COALESCE(char(mig.LAST_MAINTENANCE_DATE), '-') || ' | ' ||           
		-- COALESCE(char(mig.ORIGINAL_AMOUNT), '-') || ' | ' ||                 
		-- COALESCE(char(mig.MAIN_FACILITY_IND), '-') || ' | ' ||               
		-- COALESCE(char(mig.MAIN_FACILITY_AA_NUM), '-') || ' | ' ||            
		-- COALESCE(char(mig.MAIN_FACILITY_CODE), '-') || ' | ' ||              
		-- COALESCE(char(mig.MAIN_FACILITY_SEQ), '-') || ' | ' ||               
		-- COALESCE(char(mig.STANDBY_LINE), '-') || ' | ' ||                    
		-- COALESCE(char(mig.LEVEL), '-') || ' | ' ||                           
		-- COALESCE(char(mig.UTILISED_AMOUNT), '-') || ' | ' ||                 
		-- COALESCE(char(mig.SPEC_PROVISION), '-') || ' | ' ||                  
		-- COALESCE(char(mig.INT_IN_SUSPENSE), '-') || ' | ' ||                 
		-- COALESCE(char(mig.OUTSTANDING_AMOUNT), '-') || ' | ' ||              
		-- COALESCE(char(mig.PAYMENT_CD_CODE_VALUE), '-') || ' | ' ||           
		-- COALESCE(char(mig.PAYMENT_FREQ_CODE_VALUE), '-') || ' | ' ||         
		-- COALESCE(char(mig.PAYMENT_FREQ_CD_CODE_VALUE), '-') || ' | ' ||      
		-- COALESCE(char(mig.INT_PAYMENT_FREQ_CODE_VALUE), '-') || ' | ' ||     
		-- COALESCE(char(mig.INT_PAYMENT_FREQ_CD_CODE_VALUE), '-') || ' | ' ||  
		-- COALESCE(char(mig.GRADE_PERIOD_CODE_VALUE), '-') || ' | ' ||         
		-- COALESCE(char(mig.GRADE_PERIOD_CD_CODE_VALUE), '-') || ' | ' ||      
		-- COALESCE(char(mig.REVOLVING_IND), '-') || ' | ' ||                   
		-- COALESCE(char(mig.REVOLVING_ON_CRITERIA_IND), '-') || ' | ' ||       
		-- COALESCE(char(mig.FLOOR_PLEDGED_LIMIT), '-') || ' | ' ||             
		-- COALESCE(char(mig.ACTUAL_PLEDGED_LIMIT), '-') || ' | ' ||            
		-- COALESCE(char(mig.ALT_SCHEDULE), '-') || ' | ' ||                    
		-- COALESCE(char(mig.AVAIL_PERIOD_MONTH), '-') || ' | ' ||              
		-- COALESCE(char(mig.AVAIL_PERIOD_DAY), '-') || ' | ' ||                
		-- COALESCE(char(mig.RETENTION_SUM), '-') || ' | ' ||                   
		-- COALESCE(char(mig.RETENTION_PERIOD), '-') || ' | ' ||                
		-- COALESCE(char(mig.RETENTION_PERIOD_CODE), '-') || ' | ' ||           
		-- COALESCE(char(mig.APPL_SRC_CODE_VALUE), '-') || ' | ' ||             
		-- COALESCE(char(mig.LAWYER_CODE_VALUE), '-') || ' | ' ||               
		-- COALESCE(char(mig.DISBURSEMENT_MANNER), '-') || ' | ' ||             
		-- COALESCE(char(mig.CAL_FIRST_INSTL_DATE), '-') || ' | ' ||            
		-- COALESCE(char(mig.ISO_REFERRAL_NUM), '-') || ' | ' ||                
		-- COALESCE(char(mig.ALLOW_INCENTIVE_IND), '-') || ' | ' ||             
		-- COALESCE(char(mig.CGC_BNM_APPROVED_DATE), '-') || ' | ' ||           
		-- COALESCE(char(mig.ALT_RATE), '-') || ' | ' ||                        
		-- COALESCE(char(mig.CREDIT_LINE_IND), '-') || ' | ' ||                 
		-- COALESCE(char(mig.PROD_PACKAGE_CODE_VALUE), '-') || ' | ' ||         
		-- COALESCE(char(mig.EFFECTIVE_COSE_OF_FUND), '-') || ' | ' ||          
		-- COALESCE(char(mig.ECOF_ADMIN_COST), '-') || ' | ' ||                 
		-- COALESCE(char(mig.ECOF_RATE), '-') || ' | ' ||                       
		-- COALESCE(char(mig.ECOF_VARIANCE), '-') || ' | ' ||                   
		-- COALESCE(char(mig.ECOF_VARIANCE_CODE), '-') || ' | ' ||              
		-- COALESCE(char(mig.AVAIL_DATE), '-') || ' | ' ||                      
		-- COALESCE(char(mig.AVAIL_PERIOD), '-') || ' | ' ||                    
		-- COALESCE(char(mig.DATE_INSTRUCTED), '-') || ' | ' ||                 
		-- COALESCE(char(mig.SOLICITOR_REFERENCE), '-') || ' | ' ||             
		-- COALESCE(char(mig.DEPARTMENT_CODE_VALUE), '-') || ' | ' ||           
		-- COALESCE(char(mig.REFINANCE_FROM_BANK_CODE_VALUE), '-') || ' | ' ||  
		-- COALESCE(char(mig.SOLICITOR_NAME), '-') || ' | ' ||  
		-- COALESCE(char(mig.ENTERED_DATE), '-') || ' | ' ||
		-- 'T'
	-- , 'SIBS', 'CA003_1', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y' 
	-- FROM MIG_CA003_1 mig, MIG_CO019_PL pl 
	-- WHERE mig.LIMIT_ID = pl.LIMIT_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' ||   
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||
			COALESCE(char(mig.CIF_ID), '' '') || '' | '' ||   
			COALESCE(char(mig.LOS_AA_NUMBER), '' '') || '' | '' ||                   
			COALESCE(char(mig.AA_NUMBER), '' '') || '' | '' ||                       
			COALESCE(char(mig.LIMIT_ID), '' '') || '' | '' ||                        
			COALESCE(char(mig.ACF_NO), '' '') || '' | '' ||                          
			COALESCE(char(mig.FACILITY_CODE), '' '') || '' | '' ||                   
			COALESCE(char(mig.FACILITY_SEQ), '' '') || '' | '' ||                    
			COALESCE(char(REPLACE(FORMAT_DATE(mig.EXPIRY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||                     
			COALESCE(char(mig.ORI_LOC_COUNTRY), '' '') || '' | '' ||                 
			COALESCE(char(mig.ORG_LOC_ORG_CODE), '' '') || '' | '' ||                
			COALESCE(char(mig.PRODUCT_TYPE_CODE), '' '') || '' | '' ||               
			COALESCE(char(mig.LIMIT_CURRENCY), '' '') || '' | '' ||                  
			COALESCE(char(mig.LIMIT_AMT), '' '') || '' | '' ||                       
			COALESCE(char(mig.LIMIT_TENOR), '' '') || '' | '' ||                     
			COALESCE(char(mig.LIMIT_TENOR_UOM), '' '') || '' | '' ||                 
			COALESCE(char(mig.DRAWING_LIMIT_AMT), '' '') || '' | '' ||      
			COALESCE((case when mig.OUTSTANDING_AMT > 0 THEN ''+ | '' || char(mig.OUTSTANDING_AMT) ELSE ''- | '' || char(mig.OUTSTANDING_AMT*-1) END), '' '') || '' | '' ||         
			COALESCE(char(mig.FINANCED_AMOUNT), '' '') || '' | '' ||                 
			COALESCE(char(REPLACE(FORMAT_DATE(mig.APPLICATION_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||                
			COALESCE(char(mig.INSTALLMENT_AMOUNT), '' '') || '' | '' ||              
			COALESCE(char(mig.FINAL_PAYMENT), '' '') || '' | '' ||                   
			COALESCE(char(mig.LOAN_PURPOSE_CODE_VALUE), '' '') || '' | '' ||         
			COALESCE(char(REPLACE(FORMAT_DATE(mig.OFFER_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||                      
			COALESCE(char(REPLACE(FORMAT_DATE(mig.OFFER_ACCEPTED_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||             
			COALESCE(char(REPLACE(FORMAT_DATE(mig.APPROVED_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||                   
			COALESCE(char(mig.PERSON_APPROVED_CODE_VALUE), '' '') || '' | '' ||      
			COALESCE(char(mig.CAR_CODE_FLAG), '' '') || '' | '' ||                   
			COALESCE(char(mig.CAR_CODE_VALUE), '' '') || '' | '' ||                  
			COALESCE(char(mig.OFFICER_CODE_VALUE), '' '') || '' | '' ||              
			COALESCE(char(mig.LMT_STATUS_CODE_VALUE), '' '') || '' | '' ||           
			COALESCE(char(mig.FAC_STATUS_CODE_VALUE), '' '') || '' | '' ||           
			COALESCE(char(mig.INTEREST_RATE), '' '') || '' | '' ||                   
			COALESCE(char(mig.INTEREST_TYPE_CODE_VALUE), '' '') || '' | '' ||        
			COALESCE(char(mig.SPREAD), '' '') || '' | '' ||                          
			COALESCE(char(mig.SPREAD_SIGN), '' '') || '' | '' ||                     
			COALESCE(char(mig.PRIME_RATE_FLOOR), '' '') || '' | '' ||                
			COALESCE(char(mig.PRIME_RATE_CEILING), '' '') || '' | '' ||              
			COALESCE(char(REPLACE(FORMAT_DATE(mig.PRIME_REVIEW_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||               
			COALESCE(char(mig.PRIME_REVIEW_TERM), '' '') || '' | '' ||               
			COALESCE(char(mig.PRIME_REVIEW_TERM_CODE_VALUE), '' '') || '' | '' ||    
			COALESCE(char(mig.OD_EXCESS_RATE_VAR), '' '') || '' | '' ||              
			COALESCE(char(mig.OD_EXCESS_RATE_VAR_CODE), '' '') || '' | '' ||         
			COALESCE(char(mig.PAR_VALUE_SHARES), '' '') || '' | '' ||                
			COALESCE(char(mig.DEALER_NUM_LPP_CODE_VALUE), '' '') || '' | '' ||       
			COALESCE(char(mig.LATE_CHARGE_TYPE), '' '') || '' | '' ||                
			COALESCE(char(mig.COMMISSION_FEES), '' '') || '' | '' ||                 
			COALESCE(char(mig.HANDLING_FEES), '' '') || '' | '' ||                   
			COALESCE(char(mig.SUBSIDY_AMOUNT), '' '') || '' | '' ||                  
			COALESCE(char(mig.OTHERS_FEE), '' '') || '' | '' ||                      
			COALESCE(char(mig.COMMISSION_RATE), '' '') || '' | '' ||                 
			COALESCE(char(mig.COMMISSION_BASIS_CODE_VALUE), '' '') || '' | '' ||     
			COALESCE(char(mig.MAX_COMSSN_AMOUNT), '' '') || '' | '' ||               
			COALESCE(char(mig.MIN_COMSSN_AMOUNT), '' '') || '' | '' ||               
			COALESCE(char(mig.STANDBY_LINE_FAC_CODE), '' '') || '' | '' ||           
			COALESCE(char(mig.STANDBY_LINE_FAC_SEQ), '' '') || '' | '' ||            
			COALESCE(char(mig.COMMITMENT_RATE), '' '') || '' | '' ||                 
			COALESCE(char(mig.COMTMT_RATE_NUM_CODE_VALUE), '' '') || '' | '' ||      
			COALESCE(char(REPLACE(FORMAT_DATE(mig.LAST_MAINTENANCE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||           
			COALESCE(char(mig.ORIGINAL_AMOUNT), '' '') || '' | '' ||                 
			COALESCE(char(mig.MAIN_FACILITY_IND), '' '') || '' | '' ||               
			COALESCE(char(mig.MAIN_FACILITY_AA_NUM), '' '') || '' | '' ||            
			COALESCE(char(mig.MAIN_FACILITY_CODE), '' '') || '' | '' ||              
			COALESCE(char(mig.MAIN_FACILITY_SEQ), '' '') || '' | '' ||               
			COALESCE(char(mig.STANDBY_LINE), '' '') || '' | '' ||                    
			COALESCE(char(mig.LEVEL), '' '') || '' | '' ||                           
			COALESCE(char(mig.UTILISED_AMOUNT), '' '') || '' | '' ||                 
			COALESCE(char(mig.SPEC_PROVISION), '' '') || '' | '' ||                  
			COALESCE(char(mig.INT_IN_SUSPENSE), '' '') || '' | '' ||                 
			COALESCE(char(mig.OUTSTANDING_AMOUNT), '' '') || '' | '' ||              
			COALESCE(char(mig.PAYMENT_CD_CODE_VALUE), '' '') || '' | '' ||           
			COALESCE(char(mig.PAYMENT_FREQ_CODE_VALUE), '' '') || '' | '' ||         
			COALESCE(char(mig.PAYMENT_FREQ_CD_CODE_VALUE), '' '') || '' | '' ||      
			COALESCE(char(mig.INT_PAYMENT_FREQ_CODE_VALUE), '' '') || '' | '' ||     
			COALESCE(char(mig.INT_PAYMENT_FREQ_CD_CODE_VALUE), '' '') || '' | '' ||  
			COALESCE(char(mig.GRADE_PERIOD_CODE_VALUE), '' '') || '' | '' ||         
			COALESCE(char(mig.GRADE_PERIOD_CD_CODE_VALUE), '' '') || '' | '' ||      
			COALESCE(char(mig.REVOLVING_IND), '' '') || '' | '' ||                   
			COALESCE(char(mig.REVOLVING_ON_CRITERIA_IND), '' '') || '' | '' ||       
			COALESCE(char(mig.FLOOR_PLEDGED_LIMIT), '' '') || '' | '' ||             
			COALESCE(char(mig.ACTUAL_PLEDGED_LIMIT), '' '') || '' | '' ||            
			COALESCE(char(mig.ALT_SCHEDULE), '' '') || '' | '' ||                    
			COALESCE(char(mig.AVAIL_PERIOD_MONTH), '' '') || '' | '' ||              
			COALESCE(char(mig.AVAIL_PERIOD_DAY), '' '') || '' | '' ||                
			COALESCE(char(mig.RETENTION_SUM), '' '') || '' | '' ||                   
			COALESCE(char(mig.RETENTION_PERIOD), '' '') || '' | '' ||                
			COALESCE(char(mig.RETENTION_PERIOD_CODE), '' '') || '' | '' ||           
			COALESCE(char(mig.APPL_SRC_CODE_VALUE), '' '') || '' | '' ||             
			COALESCE(char(mig.LAWYER_CODE_VALUE), '' '') || '' | '' ||               
			COALESCE(char(mig.DISBURSEMENT_MANNER), '' '') || '' | '' ||             
			COALESCE(char(mig.CAL_FIRST_INSTL_DATE), '' '') || '' | '' ||            
			COALESCE(char(mig.ISO_REFERRAL_NUM), '' '') || '' | '' ||                
			COALESCE(char(mig.ALLOW_INCENTIVE_IND), '' '') || '' | '' ||             
			COALESCE(char(REPLACE(FORMAT_DATE(mig.CGC_BNM_APPROVED_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||           
			COALESCE(char(mig.ALT_RATE), '' '') || '' | '' ||                        
			COALESCE(char(mig.CREDIT_LINE_IND), '' '') || '' | '' ||                 
			COALESCE(char(mig.PROD_PACKAGE_CODE_VALUE), '' '') || '' | '' ||         
			COALESCE(char(mig.EFFECTIVE_COSE_OF_FUND), '' '') || '' | '' ||          
			COALESCE(char(mig.ECOF_ADMIN_COST), '' '') || '' | '' ||                 
			COALESCE(char(mig.ECOF_RATE), '' '') || '' | '' ||                       
			COALESCE(char(mig.ECOF_VARIANCE), '' '') || '' | '' ||                   
			COALESCE(char(mig.ECOF_VARIANCE_CODE), '' '') || '' | '' ||              
			COALESCE(char(REPLACE(FORMAT_DATE(mig.AVAIL_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||                      
			COALESCE(char(mig.AVAIL_PERIOD), '' '') || '' | '' ||                    
			COALESCE(char(REPLACE(FORMAT_DATE(mig.DATE_INSTRUCTED, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||                 
			COALESCE(char(mig.SOLICITOR_REFERENCE), '' '') || '' | '' ||             
			COALESCE(char(mig.DEPARTMENT_CODE_VALUE), '' '') || '' | '' ||           
			COALESCE(char(mig.REFINANCE_FROM_BANK_CODE_VALUE), '' '') || '' | '' ||  
			COALESCE(char(mig.SOLICITOR_NAME), '' '') || '' | '' ||  
			COALESCE(char(REPLACE(FORMAT_DATE(mig.ENTERED_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||
			''T''
		, ''SIBS'', ''CA003_1'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y'' 
		FROM MIG_CA003_1 mig, MIG_CO019_PL pl 
		WHERE mig.LIMIT_ID = pl.LIMIT_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	
	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_1', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_1' and FLAG = 'Y'), 'SIBS', 'CA003_1', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_1', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV004SIBS', 'SIBS', 'CA003_1', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_1', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_1', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_1' and FLAG = 'Y'), 'SIBS', 'CA003_1', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_1', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV004SIBS', 'SIBS', 'CA003_1', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_1', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_1', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_1' and FLAG = 'Y'), 'SIBS', 'CA003_1', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_1', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV004SIBS', 'SIBS', 'CA003_1', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_1', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_1', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_1' and FLAG = 'Y'), 'SIBS', 'CA003_1', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_1', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV004SIBS', 'SIBS', 'CA003_1', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_1', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_1', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_1' and FLAG = 'Y'), 'SIBS', 'CA003_1', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_1', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV004SIBS', 'SIBS', 'CA003_1', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_1', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_1', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_1' and FLAG = 'Y'), 'SIBS', 'CA003_1', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_1', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV004SIBS', 'SIBS', 'CA003_1', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_1', 'OTH', 'ISL');


-- CA003_2
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' ||   
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.LMT_ID), '-') || ' | ' ||                         
		-- COALESCE(char(mig.LLP_BCA_REF_NUM), '-') || ' | ' ||                
		-- COALESCE(char(mig.LMT_FAC_CODE), '-') || ' | ' ||                   
		-- COALESCE(char(mig.LMT_FAC_SEQ), '-') || ' | ' ||                    
		-- COALESCE(char(mig.INDUSTRY_CODE_VALUE), '-') || ' | ' ||            
		-- COALESCE(char(mig.SECTOR_CODE_VALUE), '-') || ' | ' ||              
		-- COALESCE(char(mig.STATE_CODE_VALUE), '-') || ' | ' ||               
		-- COALESCE(char(mig.BUMI_NRCC_CODE_VALUE), '-') || ' | ' ||           
		-- COALESCE(char(mig.SMALL_SCALE_CODE_VALUE), '-') || ' | ' ||         
		-- COALESCE(char(mig.PRESCRIBED_RATE_CODE_VALUE), '-') || ' | ' ||     
		-- COALESCE(char(mig.RELATIONSHIP_CODE_VALUE), '-') || ' | ' ||        
		-- COALESCE(char(mig.GOODS_FINANCED_ONE_CODE_VALUE), '-') || ' | ' ||  
		-- COALESCE(char(mig.GOODS_FINANCED_TWO_CODE_VALUE), '-') || ' | ' ||  
		-- COALESCE(char(mig.EXEMPTED_CODE_IND), '-') || ' | ' ||              
		-- COALESCE(char(mig.EXEMPTED_CODE_VALUE), '-') || ' | ' ||            
		-- COALESCE(char(mig.HOST_TIER_SEQ), '-') || ' | ' ||                  
		-- COALESCE(char(mig.PURPOSE_CODE_VALUE), '-') || ' | ' ||		       
		-- 'T'
	-- , 'SIBS', 'CA003_2', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y' 
	-- FROM MIG_CA003_2_BNM mig, MIG_CO019_PL pl 
	-- WHERE mig.LMT_ID = pl.LIMIT_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' ||   
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||
			COALESCE(char(mig.LMT_ID), '' '') || '' | '' ||                         
			COALESCE(char(mig.LLP_BCA_REF_NUM), '' '') || '' | '' ||                
			COALESCE(char(mig.LMT_FAC_CODE), '' '') || '' | '' ||                   
			COALESCE(char(mig.LMT_FAC_SEQ), '' '') || '' | '' ||                    
			COALESCE(char(mig.INDUSTRY_CODE_VALUE), '' '') || '' | '' ||            
			COALESCE(char(mig.SECTOR_CODE_VALUE), '' '') || '' | '' ||              
			COALESCE(char(mig.STATE_CODE_VALUE), '' '') || '' | '' ||               
			COALESCE(char(mig.BUMI_NRCC_CODE_VALUE), '' '') || '' | '' ||           
			COALESCE(char(mig.SMALL_SCALE_CODE_VALUE), '' '') || '' | '' ||         
			COALESCE(char(mig.PRESCRIBED_RATE_CODE_VALUE), '' '') || '' | '' ||     
			COALESCE(char(mig.RELATIONSHIP_CODE_VALUE), '' '') || '' | '' ||        
			COALESCE(char(mig.GOODS_FINANCED_ONE_CODE_VALUE), '' '') || '' | '' ||  
			COALESCE(char(mig.GOODS_FINANCED_TWO_CODE_VALUE), '' '') || '' | '' ||  
			COALESCE(char(mig.EXEMPTED_CODE_IND), '' '') || '' | '' ||              
			COALESCE(char(mig.EXEMPTED_CODE_VALUE), '' '') || '' | '' ||            
			COALESCE(char(mig.HOST_TIER_SEQ), '' '') || '' | '' ||                  
			COALESCE(char(mig.PURPOSE_CODE_VALUE), '' '') || '' | '' ||		       
			''T''
		, ''SIBS'', ''CA003_2'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y'' 
		FROM MIG_CA003_2_BNM mig, MIG_CO019_PL pl 
		WHERE mig.LMT_ID = pl.LIMIT_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_2', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_2' and FLAG = 'Y'), 'SIBS', 'CA003_2', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_2', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV005SIBS', 'SIBS', 'CA003_2', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_2', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_2', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_2' and FLAG = 'Y'), 'SIBS', 'CA003_2', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_2', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV005SIBS', 'SIBS', 'CA003_2', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_2', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_2', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_2' and FLAG = 'Y'), 'SIBS', 'CA003_2', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_2', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV005SIBS', 'SIBS', 'CA003_2', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_2', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_2', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_2' and FLAG = 'Y'), 'SIBS', 'CA003_2', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_2', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV005SIBS', 'SIBS', 'CA003_2', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_2', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_2', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_2' and FLAG = 'Y'), 'SIBS', 'CA003_2', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_2', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV005SIBS', 'SIBS', 'CA003_2', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_2', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_2', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_2' and FLAG = 'Y'), 'SIBS', 'CA003_2', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_2', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV005SIBS', 'SIBS', 'CA003_2', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_2', 'OTH', 'ISL');

 
-- CA003_3
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' ||   
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||	
		-- COALESCE(char(mig.LMT_ID), '-') || ' | ' ||                   
		-- COALESCE(char(mig.LLP_BCA_REF_NUM), '-') || ' | ' ||          
		-- COALESCE(char(mig.LMT_FAC_CODE), '-') || ' | ' ||             
		-- COALESCE(char(mig.LMT_FAC_SEQ), '-') || ' | ' ||              
		-- COALESCE(char(mig.SEQ_NUM), '-') || ' | ' ||                  
		-- COALESCE(char(mig.RELATIONSHIP_CODE_VALUE), '-') || ' | ' ||  
		-- COALESCE(char(mig.OFFICER_CODE_VALUE), '-') || ' | ' ||       
		-- COALESCE(char(mig.OFFICER_TYPE_CODE_VALUE), '-') || ' | ' ||  
		-- COALESCE(char(mig.RELATIONSHIP_CODE_NUM), '-') || ' | ' ||    
		-- COALESCE(char(mig.OFFICER_CODE_NUM), '-') || ' | ' ||         
		-- COALESCE(char(mig.OFFICER_TYPE_CODE_NUM), '-') || ' | ' ||
		-- 'T'
	-- ,'SIBS', 'CA003_3', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y'  
	-- FROM MIG_CA003_3_OFF mig, MIG_CO019_PL pl 
	-- WHERE mig.LMT_ID = pl.LIMIT_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' ||   
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||	
			COALESCE(char(mig.LMT_ID), '' '') || '' | '' ||                   
			COALESCE(char(mig.LLP_BCA_REF_NUM), '' '') || '' | '' ||          
			COALESCE(char(mig.LMT_FAC_CODE), '' '') || '' | '' ||             
			COALESCE(char(mig.LMT_FAC_SEQ), '' '') || '' | '' ||              
			COALESCE(char(mig.SEQ_NUM), '' '') || '' | '' ||                  
			COALESCE(char(mig.RELATIONSHIP_CODE_VALUE), '' '') || '' | '' ||  
			COALESCE(char(mig.OFFICER_CODE_VALUE), '' '') || '' | '' ||       
			COALESCE(char(mig.OFFICER_TYPE_CODE_VALUE), '' '') || '' | '' ||  
			''T''
		,''SIBS'', ''CA003_3'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''  
		FROM MIG_CA003_3_OFF mig, MIG_CO019_PL pl 
		WHERE mig.LMT_ID = pl.LIMIT_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_3', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_3' and FLAG = 'Y'), 'SIBS', 'CA003_3', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_3', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV006SIBS', 'SIBS', 'CA003_3', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_3', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_3', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_3' and FLAG = 'Y'), 'SIBS', 'CA003_3', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_3', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV006SIBS', 'SIBS', 'CA003_3', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_3', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_3', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_3' and FLAG = 'Y'), 'SIBS', 'CA003_3', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_3', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV006SIBS', 'SIBS', 'CA003_3', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_3', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_3', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_3' and FLAG = 'Y'), 'SIBS', 'CA003_3', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_3', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV006SIBS', 'SIBS', 'CA003_3', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_3', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_3', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_3' and FLAG = 'Y'), 'SIBS', 'CA003_3', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_3', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV006SIBS', 'SIBS', 'CA003_3', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_3', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_3', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_3' and FLAG = 'Y'), 'SIBS', 'CA003_3', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_3', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV006SIBS', 'SIBS', 'CA003_3', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_3', 'OTH', 'ISL');

 
-- CA003_4
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' ||   
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||	
		-- COALESCE(char(mig.LMT_ID), '-') || ' | ' ||                        
		-- COALESCE(char(mig.LLP_BCA_REF_NUM), '-') || ' | ' ||               
		-- COALESCE(char(mig.LMT_FAC_CODE), '-') || ' | ' ||                  
		-- COALESCE(char(mig.LMT_FAC_SEQ), '-') || ' | ' ||                   
		-- COALESCE(char(mig.CIF_NUMBER), '-') || ' | ' ||                    
		-- COALESCE(char(mig.ACCT_RELATIONSHIP_CODE_VALUE), '-') || ' | ' ||  
		-- COALESCE(char(mig.GUARANTEE_AMOUNT), '-') || ' | ' ||              
		-- COALESCE(char(mig.GUARANTEE_PERCENTAGE), '-') || ' | ' ||          
		-- COALESCE(char(mig.SHARE_HOLDER_PERCENTAGE), '-') || ' | ' ||       
		-- COALESCE(char(mig.HOST_ADD_SEQ_NUM), '-') || ' | ' ||              
		-- COALESCE(char(mig.RECEIVE_MAIL_CODE), '-') || ' | ' ||             
		-- COALESCE(char(mig.HOLD_MAIN_CODE_VALUE), '-') || ' | ' ||          
		-- COALESCE(char(mig.NAME_ASSOC_WITH_FAC_ORDER), '-') || ' | ' ||     
		-- COALESCE(char(mig.NAME_CONJUNCTION_POSITION), '-') || ' | ' ||     
		-- COALESCE(char(mig.NAME_CONJUNCTION_CODE), '-') || ' | ' ||         
		-- COALESCE(char(mig.PROFIT_RATIO), '-') || ' | ' ||                  
		-- COALESCE(char(mig.DIVIDEND_RATIO), '-') || ' | ' ||                
		-- COALESCE(char(mig.CUSTOMER_NAME), '-') || ' | ' ||   	
		-- 'T'
	-- , 'SIBS', 'CA003_4', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y' 
	-- FROM MIG_CA003_4_REL mig, MIG_CO019_PL pl 
	-- WHERE mig.LMT_ID = pl.LIMIT_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' ||   
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||	
			COALESCE(char(mig.LMT_ID), '' '') || '' | '' ||                        
			COALESCE(char(mig.LLP_BCA_REF_NUM), '' '') || '' | '' ||               
			COALESCE(char(mig.LMT_FAC_CODE), '' '') || '' | '' ||                  
			COALESCE(char(mig.LMT_FAC_SEQ), '' '') || '' | '' ||                   
			COALESCE(char(mig.CIF_NUMBER), '' '') || '' | '' ||                    
			COALESCE(char(mig.ACCT_RELATIONSHIP_CODE_VALUE), '' '') || '' | '' ||  
			COALESCE(char(mig.GUARANTEE_AMOUNT), '' '') || '' | '' ||              
			COALESCE(char(mig.GUARANTEE_PERCENTAGE), '' '') || '' | '' ||          
			COALESCE(char(mig.SHARE_HOLDER_PERCENTAGE), '' '') || '' | '' ||       
			COALESCE(char(mig.HOST_ADD_SEQ_NUM), '' '') || '' | '' ||              
			COALESCE(char(mig.RECEIVE_MAIL_CODE), '' '') || '' | '' ||             
			COALESCE(char(mig.HOLD_MAIN_CODE_VALUE), '' '') || '' | '' ||          
			COALESCE(char(mig.NAME_ASSOC_WITH_FAC_ORDER), '' '') || '' | '' ||     
			COALESCE(char(mig.NAME_CONJUNCTION_POSITION), '' '') || '' | '' ||     
			COALESCE(char(mig.NAME_CONJUNCTION_CODE), '' '') || '' | '' ||         
			COALESCE(char(mig.PROFIT_RATIO), '' '') || '' | '' ||                  
			COALESCE(char(mig.DIVIDEND_RATIO), '' '') || '' | '' ||                
			COALESCE(char(mig.CUSTOMER_NAME), '' '') || '' | '' ||   	
			''T''
		, ''SIBS'', ''CA003_4'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''
		FROM MIG_CA003_4_REL mig, MIG_CO019_PL pl 
		WHERE mig.LMT_ID = pl.LIMIT_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_4', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_4' and FLAG = 'Y'), 'SIBS', 'CA003_4', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_4', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV007SIBS', 'SIBS', 'CA003_4', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_4', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_4', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_4' and FLAG = 'Y'), 'SIBS', 'CA003_4', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_4', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV007SIBS', 'SIBS', 'CA003_4', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_4', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_4', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_4' and FLAG = 'Y'), 'SIBS', 'CA003_4', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_4', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV007SIBS', 'SIBS', 'CA003_4', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_4', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_4', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_4' and FLAG = 'Y'), 'SIBS', 'CA003_4', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_4', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV007SIBS', 'SIBS', 'CA003_4', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_4', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_4', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_4' and FLAG = 'Y'), 'SIBS', 'CA003_4', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_4', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV007SIBS', 'SIBS', 'CA003_4', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_4', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_4', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_4' and FLAG = 'Y'), 'SIBS', 'CA003_4', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_4', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV007SIBS', 'SIBS', 'CA003_4', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_4', 'OTH', 'ISL');

 
-- CA003_5
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 	
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||	
		-- COALESCE(char(mig.LMT_ID), '-') || ' | ' ||                      
		-- COALESCE(char(mig.LLP_BCA_REF_NUM), '-') || ' | ' ||             
		-- COALESCE(char(mig.LMT_FAC_CODE), '-') || ' | ' ||                
		-- COALESCE(char(mig.LMT_FAC_SEQ), '-') || ' | ' ||                 
		-- COALESCE(char(mig.COVERAGE_TYPE_CODE_VALUE), '-') || ' | ' ||    
		-- COALESCE(char(mig.INSR_COMPANY_CODE_VALUE), '-') || ' | ' ||     
		-- COALESCE(char(mig.POLICY_NUMBER), '-') || ' | ' ||               
		-- COALESCE(char(mig.POLICY_NUMBER_CV_NOTE), '-') || ' | ' ||       
		-- COALESCE(char(mig.INSURED_AMOUNT), '-') || ' | ' ||              
		-- COALESCE(char(mig.INSURANCE_PREMIUM), '-') || ' | ' ||           
		-- COALESCE(char(mig.ISSUED_DATE), '-') || ' | ' ||                 
		-- COALESCE(char(mig.EXPIRY_DATE), '-') || ' | ' ||                 
		-- COALESCE(char(mig.EFFECTIVE_DATE), '-') || ' | ' ||              
		-- COALESCE(char(mig.ARRANGEMENT_IND), '-') || ' | ' ||             
		-- COALESCE(char(mig.REMARKS), '-') || ' | ' ||                     
		-- COALESCE(char(mig.COVERAGE_TYPE_CODE_VALUE_1), '-') || ' | ' ||  
		-- COALESCE(char(mig.INSR_COMPANY_CODE_VALUE_1), '-') || ' | ' ||   
		-- COALESCE(char(mig.POLICY_NUMBER_1), '-') || ' | ' ||             
		-- COALESCE(char(mig.POLICY_NUMBER_CV_NOTE_1), '-') || ' | ' ||     
		-- COALESCE(char(mig.INSURED_AMOUNT_1), '-') || ' | ' ||            
		-- COALESCE(char(mig.INSURANCE_PREMIUM_1), '-') || ' | ' ||         
		-- COALESCE(char(mig.ISSUED_DATE_1), '-') || ' | ' ||               
		-- COALESCE(char(mig.EXPIRY_DATE_1), '-') || ' | ' ||               
		-- COALESCE(char(mig.EFFECTIVE_DATE_1), '-') || ' | ' ||            
		-- COALESCE(char(mig.ARRANGEMENT_IND_1), '-') || ' | ' ||           
		-- COALESCE(char(mig.REMARKS_1), '-') || ' | ' ||		      
		-- 'T'	
	-- , 'SIBS', 'CA003_5', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y' 
	-- FROM MIG_CA003_5_INS mig, MIG_CO019_PL pl 
	-- WHERE mig.LMT_ID = pl.LIMIT_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 	
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||	
			COALESCE(char(mig.LMT_ID), '' '') || '' | '' ||                      
			COALESCE(char(mig.LLP_BCA_REF_NUM), '' '') || '' | '' ||             
			COALESCE(char(mig.LMT_FAC_CODE), '' '') || '' | '' ||                
			COALESCE(char(mig.LMT_FAC_SEQ), '' '') || '' | '' ||                 
			COALESCE(char(mig.COVERAGE_TYPE_CODE_VALUE), '' '') || '' | '' ||    
			COALESCE(char(mig.INSR_COMPANY_CODE_VALUE), '' '') || '' | '' ||     
			COALESCE(char(mig.POLICY_NUMBER), '' '') || '' | '' ||               
			COALESCE(char(mig.POLICY_NUMBER_CV_NOTE), '' '') || '' | '' ||       
			COALESCE(char(mig.INSURED_AMOUNT), '' '') || '' | '' ||              
			COALESCE(char(mig.INSURANCE_PREMIUM), '' '') || '' | '' ||           
			COALESCE(char(REPLACE(FORMAT_DATE(mig.ISSUED_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||                 
			COALESCE(char(REPLACE(FORMAT_DATE(mig.EXPIRY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||                 
			COALESCE(char(REPLACE(FORMAT_DATE(mig.EFFECTIVE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||              
			COALESCE(char(mig.ARRANGEMENT_IND), '' '') || '' | '' ||             
			COALESCE(char(mig.REMARKS), '' '') || '' | '' ||                     
			COALESCE(char(mig.COVERAGE_TYPE_CODE_VALUE_1), '' '') || '' | '' ||  
			COALESCE(char(mig.INSR_COMPANY_CODE_VALUE_1), '' '') || '' | '' ||   
			COALESCE(char(mig.POLICY_NUMBER_1), '' '') || '' | '' ||             
			COALESCE(char(mig.POLICY_NUMBER_CV_NOTE_1), '' '') || '' | '' ||     
			COALESCE(char(mig.INSURED_AMOUNT_1), '' '') || '' | '' ||            
			COALESCE(char(mig.INSURANCE_PREMIUM_1), '' '') || '' | '' ||         
			COALESCE(char(REPLACE(FORMAT_DATE(mig.ISSUED_DATE_1, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||               
			COALESCE(char(REPLACE(FORMAT_DATE(mig.EXPIRY_DATE_1, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||               
			COALESCE(char(REPLACE(FORMAT_DATE(mig.EFFECTIVE_DATE_1, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||            
			COALESCE(char(mig.ARRANGEMENT_IND_1), '' '') || '' | '' ||           
			COALESCE(char(mig.REMARKS_1), '' '') || '' | '' ||		      
			''T''	
		, ''SIBS'', ''CA003_5'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y'' 
		FROM MIG_CA003_5_INS mig, MIG_CO019_PL pl 
		WHERE mig.LMT_ID = pl.LIMIT_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_5', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_5' and FLAG = 'Y'), 'SIBS', 'CA003_5', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_5', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV008SIBS', 'SIBS', 'CA003_5', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_5', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_5', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_5' and FLAG = 'Y'), 'SIBS', 'CA003_5', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_5', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV008SIBS', 'SIBS', 'CA003_5', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_5', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_5', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_5' and FLAG = 'Y'), 'SIBS', 'CA003_5', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_5', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV008SIBS', 'SIBS', 'CA003_5', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_5', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_5', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_5' and FLAG = 'Y'), 'SIBS', 'CA003_5', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_5', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV008SIBS', 'SIBS', 'CA003_5', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_5', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_5', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_5' and FLAG = 'Y'), 'SIBS', 'CA003_5', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_5', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV008SIBS', 'SIBS', 'CA003_5', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_5', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_5', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_5' and FLAG = 'Y'), 'SIBS', 'CA003_5', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_5', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV008SIBS', 'SIBS', 'CA003_5', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_5', 'OTH', 'ISL');


-- CA003_6
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||	
		-- COALESCE(char(mig.LMT_ID), '-') || ' | ' ||                 
		-- COALESCE(char(mig.LLP_BCA_REF_NUM), '-') || ' | ' ||        
		-- COALESCE(char(mig.LMT_FAC_CODE), '-') || ' | ' ||           
		-- COALESCE(char(mig.LMT_FAC_SEQ), '-') || ' | ' ||            
		-- COALESCE(char(mig.TIER_SEQ_NO), '-') || ' | ' ||            
		-- COALESCE(char(mig.TIER_TERM), '-') || ' | ' ||              
		-- COALESCE(char(mig.TIER_TERM_CODE), '-') || ' | ' ||         
		-- COALESCE(char(mig.RATE), '-') || ' | ' ||	     
		-- 'T'	
	-- , 'SIBS', 'CA003_6', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y'  
	-- FROM MIG_CA003_6_MUL mig, MIG_CO019_PL pl 
	-- WHERE mig.LMT_ID = pl.LIMIT_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||	
			COALESCE(char(mig.LMT_ID), '' '') || '' | '' ||                 
			COALESCE(char(mig.LLP_BCA_REF_NUM), '' '') || '' | '' ||        
			COALESCE(char(mig.LMT_FAC_CODE), '' '') || '' | '' ||           
			COALESCE(char(mig.LMT_FAC_SEQ), '' '') || '' | '' ||            
			COALESCE(char(mig.TIER_SEQ_NO), '' '') || '' | '' ||            
			COALESCE(char(mig.TIER_TERM), '' '') || '' | '' ||              
			COALESCE(char(mig.TIER_TERM_CODE), '' '') || '' | '' ||         
			COALESCE(char(mig.RATE), '' '') || '' | '' ||	     
			''T''	
		, ''SIBS'', ''CA003_6'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''  
		FROM MIG_CA003_6_MUL mig, MIG_CO019_PL pl 
		WHERE mig.LMT_ID = pl.LIMIT_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_6', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_6' and FLAG = 'Y'), 'SIBS', 'CA003_6', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_6', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV009SIBS', 'SIBS', 'CA003_6', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_6', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_6', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_6' and FLAG = 'Y'), 'SIBS', 'CA003_6', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_6', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV009SIBS', 'SIBS', 'CA003_6', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_6', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_6', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_6' and FLAG = 'Y'), 'SIBS', 'CA003_6', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_6', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV009SIBS', 'SIBS', 'CA003_6', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_6', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_6', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_6' and FLAG = 'Y'), 'SIBS', 'CA003_6', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_6', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV009SIBS', 'SIBS', 'CA003_6', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_6', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_6', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_6' and FLAG = 'Y'), 'SIBS', 'CA003_6', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_6', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV009SIBS', 'SIBS', 'CA003_6', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_6', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_6', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_6' and FLAG = 'Y'), 'SIBS', 'CA003_6', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_6', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV009SIBS', 'SIBS', 'CA003_6', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_6', 'OTH', 'ISL');

 
-- CA003_7
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||	
		-- COALESCE(char(mig.LMT_ID), '-') || ' | ' ||                          
		-- COALESCE(char(mig.LLP_BCA_REF_NUM), '-') || ' | ' ||                 
		-- COALESCE(char(mig.LMT_FAC_CODE), '-') || ' | ' ||                    
		-- COALESCE(char(mig.LMT_FAC_SEQ), '-') || ' | ' ||                     
		-- COALESCE(char(mig.GPP_TERM), '-') || ' | ' ||                        
		-- COALESCE(char(mig.GPP_TERM_CODE), '-') || ' | ' ||                   
		-- COALESCE(char(mig.GPP_PAYMENT_MODE_VALUE), '-') || ' | ' ||          
		-- COALESCE(char(mig.SELLING_PRICE), '-') || ' | ' ||                   
		-- COALESCE(char(mig.TOTAL_GPP_AMT), '-') || ' | ' ||                   
		-- COALESCE(char(mig.SPTF_GRACE_EXP_DATE), '-') || ' | ' ||             
		-- COALESCE(char(mig.SECURITY_DEP_OF_MTH), '-') || ' | ' ||             
		-- COALESCE(char(mig.SECURITY_DEP_PERCENTAGE), '-') || ' | ' ||         
		-- COALESCE(char(mig.SECURITY_DEP_AMT), '-') || ' | ' ||                
		-- COALESCE(char(mig.CUSTOMER_INTEREST_RATE), '-') || ' | ' ||          
		-- COALESCE(char(mig.GPP_CALCULATION_MEHTOD_VALUE), '-') || ' | ' ||    
		-- COALESCE(char(mig.FULREL_PROFIC_CALC_METHOD), '-') || ' | ' ||       
		-- COALESCE(char(mig.FIXED_AMT_REFUND), '-') || ' | ' ||                
		-- COALESCE(char(mig.COMPOUNDING_METHOD), '-') || ' | ' ||              
		-- COALESCE(char(mig.DATE_STOP_COMPOUNDING), '-') || ' | ' ||           
		-- COALESCE(char(mig.REFUND_GPP_PROFIT_VALUE), '-') || ' | ' ||         
		-- COALESCE(char(mig.REFUND_FULREL_PROFIT_VALUE), '-') || ' | ' ||      
		-- COALESCE(char(mig.COMMISSION_RATE), '-') || ' | ' ||                 
		-- COALESCE(char(mig.FIXED_COM_AMOUNT), '-') || ' | ' ||                
		-- COALESCE(char(mig.COMMISSION_TERM), '-') || ' | ' ||                 
		-- COALESCE(char(mig.COMMISSION_EXPIRY_DATE), '-') || ' | ' ||          
		-- COALESCE(char(mig.EXC_CMP_IN_PMT_AMT), '-') || ' | ' ||              
		-- COALESCE(char(mig.SPTF_DUAL_REPAYMENT_MODE_VALUE), '-') || ' | ' ||  
		-- COALESCE(char(mig.SNP_AGREEMENT_DATE), '-') || ' | ' ||              
		-- COALESCE(char(mig.GPP_DURATION_FOR_SNP), '-') || ' | ' ||            
		-- COALESCE(char(mig.SNP_TERM), '-') || ' | ' ||                        
		-- COALESCE(char(mig.SNP_TERM_CODE_VALUE), '-') || ' | ' ||             
		-- COALESCE(char(mig.FULL_REL_PFT_12_METHOD), '-') || ' | ' ||	       
		-- 'T'
	-- , 'SIBS', 'CA003_7', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y'  
	-- FROM MIG_CA003_7_ISL mig, MIG_CO019_PL pl 
	-- WHERE mig.LMT_ID = pl.LIMIT_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
		(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||	
			COALESCE(char(mig.LMT_ID), '' '') || '' | '' ||                          
			COALESCE(char(mig.LLP_BCA_REF_NUM), '' '') || '' | '' ||                 
			COALESCE(char(mig.LMT_FAC_CODE), '' '') || '' | '' ||                    
			COALESCE(char(mig.LMT_FAC_SEQ), '' '') || '' | '' ||                     
			COALESCE(char(mig.GPP_TERM), '' '') || '' | '' ||                        
			COALESCE(char(mig.GPP_TERM_CODE), '' '') || '' | '' ||                   
			COALESCE(char(mig.GPP_PAYMENT_MODE_VALUE), '' '') || '' | '' ||          
			COALESCE(char(mig.SELLING_PRICE), '' '') || '' | '' ||                   
			COALESCE(char(mig.TOTAL_GPP_AMT), '' '') || '' | '' ||                   
			COALESCE(char(REPLACE(FORMAT_DATE(mig.SPTF_GRACE_EXP_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||             
			COALESCE(char(mig.SECURITY_DEP_OF_MTH), '' '') || '' | '' ||             
			COALESCE(char(mig.SECURITY_DEP_PERCENTAGE), '' '') || '' | '' ||         
			COALESCE(char(mig.SECURITY_DEP_AMT), '' '') || '' | '' ||                
			COALESCE(char(mig.CUSTOMER_INTEREST_RATE), '' '') || '' | '' ||          
			COALESCE(char(mig.GPP_CALCULATION_MEHTOD_VALUE), '' '') || '' | '' ||    
			COALESCE(char(mig.FULREL_PROFIC_CALC_METHOD), '' '') || '' | '' ||       
			COALESCE(char(mig.FIXED_AMT_REFUND), '' '') || '' | '' ||                
			COALESCE(char(mig.COMPOUNDING_METHOD), '' '') || '' | '' ||              
			COALESCE(char(mig.DATE_STOP_COMPOUNDING), '' '') || '' | '' ||           
			COALESCE(char(mig.REFUND_GPP_PROFIT_VALUE), '' '') || '' | '' ||         
			COALESCE(char(mig.REFUND_FULREL_PROFIT_VALUE), '' '') || '' | '' ||      
			COALESCE(char(mig.COMMISSION_RATE), '' '') || '' | '' ||                 
			COALESCE(char(mig.FIXED_COM_AMOUNT), '' '') || '' | '' ||                
			COALESCE(char(mig.COMMISSION_TERM), '' '') || '' | '' ||                 
			COALESCE(char(REPLACE(FORMAT_DATE(mig.COMMISSION_EXPIRY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||          
			COALESCE(char(mig.EXC_CMP_IN_PMT_AMT), '' '') || '' | '' ||              
			COALESCE(char(mig.SPTF_DUAL_REPAYMENT_MODE_VALUE), '' '') || '' | '' ||  
			COALESCE(char(REPLACE(FORMAT_DATE(mig.SNP_AGREEMENT_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||              
			COALESCE(char(mig.GPP_DURATION_FOR_SNP), '' '') || '' | '' ||            
			COALESCE(char(mig.SNP_TERM), '' '') || '' | '' ||                        
			COALESCE(char(mig.SNP_TERM_CODE_VALUE), '' '') || '' | '' ||             
			COALESCE(char(mig.FULL_REL_PFT_12_METHOD), '' '') || '' | '' ||	       
			''T''
		, ''SIBS'', ''CA003_7'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''  
		FROM MIG_CA003_7_ISL mig, MIG_CO019_PL pl 
		WHERE mig.LMT_ID = pl.LIMIT_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_7', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_7' and FLAG = 'Y'), 'SIBS', 'CA003_7', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_7', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV010SIBS', 'SIBS', 'CA003_7', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_7', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_7', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_7' and FLAG = 'Y'), 'SIBS', 'CA003_7', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_7', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV010SIBS', 'SIBS', 'CA003_7', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_7', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_7', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_7' and FLAG = 'Y'), 'SIBS', 'CA003_7', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_7', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV010SIBS', 'SIBS', 'CA003_7', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_7', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_7', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_7' and FLAG = 'Y'), 'SIBS', 'CA003_7', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_7', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV010SIBS', 'SIBS', 'CA003_7', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_7', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_7', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_7' and FLAG = 'Y'), 'SIBS', 'CA003_7', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_7', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV010SIBS', 'SIBS', 'CA003_7', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_7', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_7', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_7' and FLAG = 'Y'), 'SIBS', 'CA003_7', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_7', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV010SIBS', 'SIBS', 'CA003_7', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_7', 'OTH', 'ISL');

 
-- CA003_8
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||	
		-- COALESCE(char(mig.LMT_ID), '-') || ' | ' ||                          
		-- COALESCE(char(mig.LLP_BCA_REF_NUM), '-') || ' | ' ||                 
		-- COALESCE(char(mig.LMT_FAC_CODE), '-') || ' | ' ||                    
		-- COALESCE(char(mig.LMT_FAC_SEQ), '-') || ' | ' ||                     
		-- COALESCE(char(mig.CUST_PROF_RATE), '-') || ' | ' ||                  
		-- COALESCE(char(mig.REBATE_METHOD), '-') || ' | ' ||                   
		-- COALESCE(char(mig.GPP_PAYMENT_MODE), '-') || ' | ' ||                
		-- COALESCE(char(mig.GPP_CAL_METHOD), '-') || ' | ' ||                  
		-- COALESCE(char(mig.GPP_TERM), '-') || ' | ' ||                        
		-- COALESCE(char(mig.GPP_TERM_CODE), '-') || ' | ' ||                   
		-- COALESCE(char(mig.FULL_RELEASE_PROFIT), '-') || ' | ' ||             
		-- COALESCE(char(mig.REFUND_FULL_RELEASE_PROFIT), '-') || ' | ' ||      
		-- COALESCE(char(mig.FUL_REL_PROFIT_CAL_METHOD), '-') || ' | ' ||       
		-- COALESCE(char(mig.INSTALLMENT), '-') || ' | ' ||                     
		-- COALESCE(char(mig.FINAL_PAYMENT_AMT), '-') || ' | ' ||               
		-- COALESCE(char(mig.TOTAL_GPP_AMT), '-') || ' | ' ||                   
		-- COALESCE(char(mig.SELLING_PRICE), '-') || ' | ' ||                   
		-- COALESCE(char(mig.TOTAL_PROFIT), '-') || ' | ' ||                    
		-- COALESCE(char(mig.LAST_MAINTAIN_DATE), '-') || ' | ' ||	      
		-- 'T'		
	-- , 'SIBS', 'CA003_8', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y' 
	-- FROM MIG_CA003_8_BBA mig, MIG_CO019_PL pl 
	-- WHERE mig.LMT_ID = pl.LIMIT_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||	
			COALESCE(char(mig.LMT_ID), '' '') || '' | '' ||                          
			COALESCE(char(mig.LLP_BCA_REF_NUM), '' '') || '' | '' ||                 
			COALESCE(char(mig.LMT_FAC_CODE), '' '') || '' | '' ||                    
			COALESCE(char(mig.LMT_FAC_SEQ), '' '') || '' | '' ||                     
			COALESCE(char(mig.CUST_PROF_RATE), '' '') || '' | '' ||                  
			COALESCE(char(mig.REBATE_METHOD), '' '') || '' | '' ||                   
			COALESCE(char(mig.GPP_PAYMENT_MODE), '' '') || '' | '' ||                
			COALESCE(char(mig.GPP_CAL_METHOD), '' '') || '' | '' ||                  
			COALESCE(char(mig.GPP_TERM), '' '') || '' | '' ||                        
			COALESCE(char(mig.GPP_TERM_CODE), '' '') || '' | '' ||                   
			COALESCE(char(mig.FULL_RELEASE_PROFIT), '' '') || '' | '' ||             
			COALESCE(char(mig.REFUND_FULL_RELEASE_PROFIT), '' '') || '' | '' ||      
			COALESCE(char(mig.FUL_REL_PROFIT_CAL_METHOD), '' '') || '' | '' ||       
			COALESCE(char(mig.INSTALLMENT), '' '') || '' | '' ||                     
			COALESCE(char(mig.FINAL_PAYMENT_AMT), '' '') || '' | '' ||               
			COALESCE(char(mig.TOTAL_GPP_AMT), '' '') || '' | '' ||                   
			COALESCE(char(mig.SELLING_PRICE), '' '') || '' | '' ||                   
			COALESCE(char(mig.TOTAL_PROFIT), '' '') || '' | '' ||                    
			COALESCE(char(REPLACE(FORMAT_DATE(mig.LAST_MAINTAIN_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||	      
			''T''		
		, ''SIBS'', ''CA003_8'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y'' 
		FROM MIG_CA003_8_BBA mig, MIG_CO019_PL pl 
		WHERE mig.LMT_ID = pl.LIMIT_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_8', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_8' and FLAG = 'Y'), 'SIBS', 'CA003_8', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_8', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV011SIBS', 'SIBS', 'CA003_8', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_8', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_8', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_8' and FLAG = 'Y'), 'SIBS', 'CA003_8', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_8', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV011SIBS', 'SIBS', 'CA003_8', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_8', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_8', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA003_8' and FLAG = 'Y'), 'SIBS', 'CA003_8', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_8', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV011SIBS', 'SIBS', 'CA003_8', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_8', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_8', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_8' and FLAG = 'Y'), 'SIBS', 'CA003_8', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_8', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV011SIBS', 'SIBS', 'CA003_8', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_8', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_8', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_8' and FLAG = 'Y'), 'SIBS', 'CA003_8', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_8', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV011SIBS', 'SIBS', 'CA003_8', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_8', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA003_8', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA003_8' and FLAG = 'Y'), 'SIBS', 'CA003_8', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA003_8', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV011SIBS', 'SIBS', 'CA003_8', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA003_8', 'OTH', 'ISL');
 
 
-----------------------------
-- Limit-Account
-----------------------------    
-- CA004
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||	
		-- COALESCE(char(mig.LIMIT_ID), '-') || ' | ' ||                 
		-- COALESCE(char(mig.AA_NUMBER), '-') || ' | ' ||                
		-- COALESCE(char(mig.FACILITY_CODE), '-') || ' | ' ||            
		-- COALESCE(char(mig.FACILITY_SEQ), '-') || ' | ' ||             
		-- COALESCE(char(mig.EXTERNAL_SYSTEM_ACCT_NO), '-') || ' | ' ||  
		-- COALESCE(char(mig.ACCT_TYPE), '-') || ' | ' ||                
		-- COALESCE(char(mig.ACCT_SEQ), '-') || ' | ' ||                 
		-- COALESCE(char(mig.LOC_COUNTRY), '-') || ' | ' ||	 
		-- COALESCE(char(mig.LOC_ORG_CODE), '-') || ' | ' ||	 
		-- 'T'
	-- , 'SIBS', 'CA004', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y'  
	-- FROM MIG_CA004 mig, MIG_CO019_PL pl 
	-- WHERE mig.LIMIT_ID = pl.LIMIT_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||	
			COALESCE(char(mig.LIMIT_ID), '' '') || '' | '' ||                 
			COALESCE(char(mig.AA_NUMBER), '' '') || '' | '' ||                
			COALESCE(char(mig.FACILITY_CODE), '' '') || '' | '' ||            
			COALESCE(char(mig.FACILITY_SEQ), '' '') || '' | '' ||             
			COALESCE(char(mig.EXTERNAL_SYSTEM_ACCT_NO), '' '') || '' | '' ||  
			COALESCE(char(mig.ACCT_TYPE), '' '') || '' | '' ||                
			COALESCE(char(mig.ACCT_SEQ), '' '') || '' | '' ||                 
			COALESCE(char(mig.LOC_COUNTRY), '' '') || '' | '' ||	 
			COALESCE(char(mig.LOC_ORG_CODE), '' '') || '' | '' ||	 
			''T''
		, ''SIBS'', ''CA004'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''  
		FROM MIG_CA004 mig, MIG_CO019_PL pl 
		WHERE mig.LIMIT_ID = pl.LIMIT_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');	

commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA004', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA004' and FLAG = 'Y'), 'SIBS', 'CA004', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA004', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV016SIBS', 'SIBS', 'CA004', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA004', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA004', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA004' and FLAG = 'Y'), 'SIBS', 'CA004', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA004', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV016SIBS', 'SIBS', 'CA004', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA004', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA004', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CA004' and FLAG = 'Y'), 'SIBS', 'CA004', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA004', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV016SIBS', 'SIBS', 'CA004', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA004', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA004', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA004' and FLAG = 'Y'), 'SIBS', 'CA004', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA004', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV016SIBS', 'SIBS', 'CA004', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA004', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA004', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA004' and FLAG = 'Y'), 'SIBS', 'CA004', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA004', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV016SIBS', 'SIBS', 'CA004', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA004', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CA004', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CA004' and FLAG = 'Y'), 'SIBS', 'CA004', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CA004', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV016SIBS', 'SIBS', 'CA004', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CA004', 'OTH', 'ISL');


-----------------------------
-- Collateral
-----------------------------
-- CO001:AB
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 	
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||	
		-- COALESCE(char(mig.SECURITY_ID), '-') || ' | ' ||                
		-- COALESCE(char(mig.CMS_SECURITY_TYPE_ID), '-') || ' | ' ||       
		-- COALESCE(char(mig.CMS_SECURITY_SUBTYPE_ID), '-') || ' | ' ||    
		-- COALESCE(char(mig.SECURITY_REF_NOTE), '-') || ' | ' ||          
		-- COALESCE(char(mig.SOURCE_SECURITY_TYPE), '-') || ' | ' ||       
		-- COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||   
		-- COALESCE(char(mig.CURRENCY), '-') || ' | ' ||                   
		-- COALESCE(char(mig.LOC_COUNTRY), '-') || ' | ' ||                
		-- COALESCE(char(mig.LOC_ORG_CODE), '-') || ' | ' ||               
		-- COALESCE(char(mig.CUSTODIAN_TYPE), '-') || ' | ' ||             
		-- COALESCE(char(mig.LEGAL_ENFORCEABILITY), '-') || ' | ' ||       
		-- COALESCE(char(mig.LEGAL_ENFORCEABILITY_DATE), '-') || ' | ' ||  
		-- COALESCE(char(mig.SECURITY_PERFECTION_DATE), '-') || ' | ' ||   
		-- COALESCE(char(mig.ASSET_DESC), '-') || ' | ' ||                 
		-- COALESCE(char(mig.ASSET_TYPE_CAT), '-') || ' | ' ||             
		-- COALESCE(char(mig.ASSET_TYPE_CODE), '-') || ' | ' ||            
		-- COALESCE(char(mig.PURCHASE_PRICE), '-') || ' | ' ||             
		-- COALESCE(char(mig.PURCHASE_PRICE_CURRENCY), '-') || ' | ' ||    
		-- COALESCE(char(mig.PURCHASE_DATE), '-') || ' | ' ||              
		-- COALESCE(char(mig.REG_DATE), '-') || ' | ' ||                   
		-- COALESCE(char(mig.MANUFACTURE_YEAR), '-') || ' | ' ||           
		-- COALESCE(char(mig.MODEL_NO), '-') || ' | ' ||                   
		-- COALESCE(char(mig.RESIDUAL_ASSET_LIFE), '-') || ' | ' ||        
		-- COALESCE(char(mig.SALES_PROCEED), '-') || ' | ' ||              
		-- COALESCE(char(mig.REG_NO), '-') || ' | ' ||                     
		-- COALESCE(char(mig.REG_FEE), '-') || ' | ' ||                    
		-- COALESCE(char(mig.BRAND), '-') || ' | ' ||                      
		-- COALESCE(char(mig.GOOD_STAT), '-') || ' | ' ||                  
		-- COALESCE(char(mig.REG_CARD_NUMBER), '-') || ' | ' ||            
		-- COALESCE(char(mig.CHASSIS_NUMBER), '-') || ' | ' ||             
		-- COALESCE(char(mig.REPOSESSION_DATE), '-') || ' | ' ||           
		-- COALESCE(char(mig.REPOSESSION_AGE), '-') || ' | ' ||            
		-- COALESCE(char(mig.ENGINE_NUMBER), '-') || ' | ' ||              
		-- COALESCE(char(mig.HORSE_POWER), '-') || ' | ' ||                
		-- COALESCE(char(mig.DOWN_PAYMENT_TRADE_IN), '-') || ' | ' ||      
		-- COALESCE(char(mig.DOWN_PAYMENT_CASH), '-') || ' | ' ||          
		-- COALESCE(char(mig.FREIGHT_CHARGES), '-') || ' | ' ||            
		-- COALESCE(char(mig.PRICE_LIST), '-') || ' | ' ||                 
		-- COALESCE(char(mig.PUBLIC_TRANSPORT), '-') || ' | ' ||           
		-- COALESCE(char(mig.SECURITY_MATURITY_DATE), '-') || ' | ' ||     
		-- COALESCE(char(mig.SECURITY_CUSTODIAN), '-') || ' | ' ||         
		-- COALESCE(char(mig.PHY_INSPECTION_DONE), '-') || ' | ' ||        
		-- COALESCE(char(mig.ENV_RISKY_STATUS), '-') || ' | ' ||           
		-- COALESCE(char(mig.ENV_RISKY_DATE), '-') || ' | ' ||             
		-- COALESCE(char(mig.BORROWER_DEPENDENCY), '-') || ' | ' ||        
		-- COALESCE(char(mig.SERIAL_NO), '-') || ' | ' ||                  
		-- COALESCE(char(mig.SCRAP_VALUE), '-') || ' | ' ||                
		-- COALESCE(char(mig.EXCHANGE_CONTROL_OBTAINED), '-') || ' | ' ||  
		-- COALESCE(char(mig.EXCHANGE_CONTROL_DATE), '-') || ' | ' ||      
		-- COALESCE(char(mig.IS_CGC_PLEDGED), '-') || ' | ' ||             
		-- COALESCE(char(mig.CHATTEL_SOLD_DATE), '-') || ' | ' ||          
		-- COALESCE(char(mig.RL_SERIAL_NO), '-') || ' | ' ||               
		-- COALESCE(char(mig.COLLATERAL_STATUS), '-') || ' | ' ||          
		-- COALESCE(char(mig.VEHICLE_COLOR), '-') || ' | ' ||              
		-- COALESCE(char(mig.ROAD_TAX_AMT_TYPE), '-') || ' | ' ||          
		-- COALESCE(char(mig.ROAD_TAX_EXPIRY_DATE), '-') || ' | ' ||       
		-- COALESCE(char(mig.E_HAK_MILIK_NUMBER), '-') || ' | ' ||     
		-- 'T' 
	-- , 'SIBS', 'CO001', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y' 
	-- FROM MIG_CO001_AB mig, MIG_CO019_PL pl 
	-- WHERE mig.SECURITY_ID = pl.SECURITY_ID
	-- AND mig.IS_VALID = 'Y'); 
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 	
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||	
			COALESCE(char(mig.SECURITY_ID), '' '') || '' | '' ||                
			COALESCE(char(mig.CMS_SECURITY_SUBTYPE_ID), '' '') || '' | '' ||    
			COALESCE(char(mig.SECURITY_REF_NOTE), '' '') || '' | '' ||          
			COALESCE(char(mig.SOURCE_SECURITY_TYPE), '' '') || '' | '' ||       
			COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||   
			COALESCE(char(mig.CURRENCY), '' '') || '' | '' ||                   
			COALESCE(char(mig.LOC_COUNTRY), '' '') || '' | '' ||                
			COALESCE(char(mig.LOC_ORG_CODE), '' '') || '' | '' ||               
			COALESCE(char(mig.CUSTODIAN_TYPE), '' '') || '' | '' ||             
			COALESCE(char(mig.LEGAL_ENFORCEABILITY), '' '') || '' | '' ||       
			COALESCE(char(REPLACE(FORMAT_DATE(mig.LEGAL_ENFORCEABILITY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||  
			COALESCE(char(REPLACE(FORMAT_DATE(mig.SECURITY_PERFECTION_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||   
			COALESCE(char(mig.ASSET_DESC), '' '') || '' | '' ||                 
			COALESCE(char(mig.ASSET_TYPE_CODE), '' '') || '' | '' ||            
			COALESCE(char(mig.PURCHASE_PRICE), '' '') || '' | '' ||             
			COALESCE(char(mig.PURCHASE_PRICE_CURRENCY), '' '') || '' | '' ||    
			COALESCE(char(REPLACE(FORMAT_DATE(mig.PURCHASE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||              
			COALESCE(char(REPLACE(FORMAT_DATE(mig.REG_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||                   
			COALESCE(char(mig.MANUFACTURE_YEAR), '' '') || '' | '' ||           
			COALESCE(char(mig.MODEL_NO), '' '') || '' | '' ||                   
			COALESCE(char(mig.SALES_PROCEED), '' '') || '' | '' ||              
			COALESCE(char(mig.REG_NO), '' '') || '' | '' ||                     
			COALESCE(char(mig.REG_FEE), '' '') || '' | '' ||                    
			COALESCE(char(mig.BRAND), '' '') || '' | '' ||                      
			COALESCE(char(mig.GOOD_STAT), '' '') || '' | '' ||                  
			COALESCE(char(mig.REG_CARD_NUMBER), '' '') || '' | '' ||            
			COALESCE(char(mig.CHASSIS_NUMBER), '' '') || '' | '' ||             
			COALESCE(char(REPLACE(FORMAT_DATE(mig.REPOSESSION_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||           
			COALESCE(char(mig.REPOSESSION_AGE), '' '') || '' | '' ||            
			COALESCE(char(mig.ENGINE_NUMBER), '' '') || '' | '' ||              
			COALESCE(char(mig.HORSE_POWER), '' '') || '' | '' ||                
			COALESCE(char(mig.DOWN_PAYMENT_TRADE_IN), '' '') || '' | '' ||      
			COALESCE(char(mig.DOWN_PAYMENT_CASH), '' '') || '' | '' ||          
			COALESCE(char(mig.FREIGHT_CHARGES), '' '') || '' | '' ||            
			COALESCE(char(mig.PRICE_LIST), '' '') || '' | '' ||                 
			COALESCE(char(mig.PUBLIC_TRANSPORT), '' '') || '' | '' ||           
			COALESCE(char(REPLACE(FORMAT_DATE(mig.SECURITY_MATURITY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||     
			COALESCE(char(mig.SECURITY_CUSTODIAN), '' '') || '' | '' ||         
			COALESCE(char(mig.PHY_INSPECTION_DONE), '' '') || '' | '' ||        
			COALESCE(char(mig.ENV_RISKY_STATUS), '' '') || '' | '' ||           
			COALESCE(char(mig.BORROWER_DEPENDENCY), '' '') || '' | '' ||        
			COALESCE(char(mig.SERIAL_NO), '' '') || '' | '' ||                  
			COALESCE(char(mig.SCRAP_VALUE), '' '') || '' | '' ||                
			COALESCE(char(mig.EXCHANGE_CONTROL_OBTAINED), '' '') || '' | '' ||  
			COALESCE(char(mig.IS_CGC_PLEDGED), '' '') || '' | '' ||             
			COALESCE(char(REPLACE(FORMAT_DATE(mig.CHATTEL_SOLD_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||          
			COALESCE(char(mig.RL_SERIAL_NO), '' '') || '' | '' ||               
			COALESCE(char(mig.COLLATERAL_STATUS), '' '') || '' | '' ||          
			COALESCE(char(mig.VEHICLE_COLOR), '' '') || '' | '' ||              
			COALESCE(char(REPLACE(FORMAT_DATE(mig.ROAD_TAX_EXPIRY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||       
			COALESCE(char(mig.E_HAK_MILIK_NUMBER), '' '') || '' | '' ||     
			''T'' 
		, ''SIBS'', ''CO001'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y'' 
		FROM MIG_CO001_AB mig, MIG_CO019_PL pl 
		WHERE mig.SECURITY_ID = pl.SECURITY_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO001', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO001' and FLAG = 'Y'), 'SIBS', 'CO001', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO001', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV018SIBS', 'SIBS', 'CO001', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO001', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO001', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO001' and FLAG = 'Y'), 'SIBS', 'CO001', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO001', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV018SIBS', 'SIBS', 'CO001', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO001', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO001', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO001' and FLAG = 'Y'), 'SIBS', 'CO001', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO001', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV018SIBS', 'SIBS', 'CO001', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO001', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO001', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO001' and FLAG = 'Y'), 'SIBS', 'CO001', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO001', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV018SIBS', 'SIBS', 'CO001', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO001', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO001', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO001' and FLAG = 'Y'), 'SIBS', 'CO001', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO001', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV018SIBS', 'SIBS', 'CO001', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO001', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO001', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO001' and FLAG = 'Y'), 'SIBS', 'CO001', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO001', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV018SIBS', 'SIBS', 'CO001', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO001', 'OTH', 'ISL');


-- CO002:AB-Gold
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 	
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.SECURITY_ID), '-') || ' | ' ||                
		-- COALESCE(char(mig.CMS_SECURITY_SUBTYPE_ID), '-') || ' | ' ||    
		-- COALESCE(char(mig.SECURITY_REF_NOTE), '-') || ' | ' ||          
		-- COALESCE(char(mig.SOURCE_SECURITY_TYPE), '-') || ' | ' ||       
		-- COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||   
		-- COALESCE(char(mig.CURRENCY), '-') || ' | ' ||                   
		-- COALESCE(char(mig.LOC_COUNTRY), '-') || ' | ' ||                
		-- COALESCE(char(mig.LOC_ORG_CODE), '-') || ' | ' ||               
		-- COALESCE(char(mig.CUSTODIAN_TYPE), '-') || ' | ' ||             
		-- COALESCE(char(mig.LEGAL_ENFORCEABILITY), '-') || ' | ' ||       
		-- COALESCE(char(mig.LEGAL_ENFORCEABILITY_DATE), '-') || ' | ' ||  
		-- COALESCE(char(mig.SECURITY_PERFECTION_DATE), '-') || ' | ' ||   
		-- COALESCE(char(mig.ASSET_DESC), '-') || ' | ' ||                 
		-- COALESCE(char(mig.ASSET_TYPE_CODE), '-') || ' | ' ||            
		-- COALESCE(char(mig.PURCHASE_PRICE), '-') || ' | ' ||             
		-- COALESCE(char(mig.PURCHASE_PRICE_CURRENCY), '-') || ' | ' ||    
		-- COALESCE(char(mig.SALES_PROCEED), '-') || ' | ' ||              
		-- COALESCE(char(mig.GOLD_GRADE), '-') || ' | ' ||                 
		-- COALESCE(char(mig.PURCHASE_RECEIPT_NO), '-') || ' | ' ||        
		-- COALESCE(char(mig.GOLD_UNIT_PRICE), '-') || ' | ' ||            
		-- COALESCE(char(mig.GOLD_UNIT_PRICE_UOM), '-') || ' | ' ||        
		-- COALESCE(char(mig.GOLD_WEIGHT), '-') || ' | ' ||                
		-- COALESCE(char(mig.GOLD_WEIGHT_UOM), '-') || ' | ' ||            
		-- COALESCE(char(mig.AUCTION_DATE), '-') || ' | ' ||               
		-- COALESCE(char(mig.AUCTION_PRICE), '-') || ' | ' ||              
		-- COALESCE(char(mig.AUCTIONEER), '-') || ' | ' ||                 
		-- COALESCE(char(mig.SECURITY_MATURITY_DATE), '-') || ' | ' ||     
		-- COALESCE(char(mig.SECURITY_CUSTODIAN), '-') || ' | ' ||         
		-- COALESCE(char(mig.CERT_EXPIRY_DATE), '-') || ' | ' ||           
		-- COALESCE(char(mig.ENV_RISKY_STATUS), '-') || ' | ' ||           
		-- COALESCE(char(mig.EXCHANGE_CONTROL_OBTAINED), '-') || ' | ' ||  
		-- COALESCE(char(mig.PHY_INSPECTION_DONE), '-') || ' | ' ||        
		-- COALESCE(char(mig.BORROWER_DEPENDENCY), '-') || ' | ' ||        
		-- COALESCE(char(mig.IS_CGC_PLEDGED), '-') || ' | ' ||             
		-- COALESCE(char(mig.COLLATERAL_STATUS), '-') || ' | ' ||  
		-- 'T'
	-- , 'SIBS', 'CO002', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y'  
	-- FROM MIG_CO002_AB_GOLD mig, MIG_CO019_PL pl 
	-- WHERE mig.SECURITY_ID = pl.SECURITY_ID
	-- AND mig.IS_VALID = 'Y'); 
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 	
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||
			COALESCE(char(mig.SECURITY_ID), '' '') || '' | '' ||                
			COALESCE(char(mig.CMS_SECURITY_SUBTYPE_ID), '' '') || '' | '' ||    
			COALESCE(char(mig.SECURITY_REF_NOTE), '' '') || '' | '' ||          
			COALESCE(char(mig.SOURCE_SECURITY_TYPE), '' '') || '' | '' ||       
			COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||   
			COALESCE(char(mig.CURRENCY), '' '') || '' | '' ||                   
			COALESCE(char(mig.LOC_COUNTRY), '' '') || '' | '' ||                
			COALESCE(char(mig.LOC_ORG_CODE), '' '') || '' | '' ||               
			COALESCE(char(mig.CUSTODIAN_TYPE), '' '') || '' | '' ||             
			COALESCE(char(mig.LEGAL_ENFORCEABILITY), '' '') || '' | '' ||       
			COALESCE(char(REPLACE(FORMAT_DATE(mig.LEGAL_ENFORCEABILITY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||  
			COALESCE(char(REPLACE(FORMAT_DATE(mig.SECURITY_PERFECTION_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||   
			COALESCE(char(mig.ASSET_DESC), '' '') || '' | '' ||                 
			COALESCE(char(mig.ASSET_TYPE_CODE), '' '') || '' | '' ||            
			COALESCE(char(mig.PURCHASE_PRICE), '' '') || '' | '' ||             
			COALESCE(char(mig.PURCHASE_PRICE_CURRENCY), '' '') || '' | '' ||    
			COALESCE(char(mig.SALES_PROCEED), '' '') || '' | '' ||              
			COALESCE(char(mig.GOLD_GRADE), '' '') || '' | '' ||                 
			COALESCE(char(mig.PURCHASE_RECEIPT_NO), '' '') || '' | '' ||        
			COALESCE(char(mig.GOLD_UNIT_PRICE), '' '') || '' | '' ||            
			COALESCE(char(mig.GOLD_UNIT_PRICE_UOM), '' '') || '' | '' ||        
			COALESCE(char(mig.GOLD_WEIGHT), '' '') || '' | '' ||                
			COALESCE(char(mig.GOLD_WEIGHT_UOM), '' '') || '' | '' ||            
			COALESCE(char(REPLACE(FORMAT_DATE(mig.AUCTION_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||               
			COALESCE(char(mig.AUCTION_PRICE), '' '') || '' | '' ||              
			COALESCE(char(mig.AUCTIONEER), '' '') || '' | '' ||                 
			COALESCE(char(REPLACE(FORMAT_DATE(mig.SECURITY_MATURITY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||     
			COALESCE(char(mig.SECURITY_CUSTODIAN), '' '') || '' | '' ||         
			COALESCE(char(REPLACE(FORMAT_DATE(mig.CERT_EXPIRY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||           
			COALESCE(char(mig.ENV_RISKY_STATUS), '' '') || '' | '' ||           
			COALESCE(char(mig.EXCHANGE_CONTROL_OBTAINED), '' '') || '' | '' ||  
			COALESCE(char(mig.PHY_INSPECTION_DONE), '' '') || '' | '' ||        
			COALESCE(char(mig.BORROWER_DEPENDENCY), '' '') || '' | '' ||        
			COALESCE(char(mig.IS_CGC_PLEDGED), '' '') || '' | '' ||             
			COALESCE(char(mig.COLLATERAL_STATUS), '' '') || '' | '' ||  
			''T''
		, ''SIBS'', ''CO002'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''  
		FROM MIG_CO002_AB_GOLD mig, MIG_CO019_PL pl 
		WHERE mig.SECURITY_ID = pl.SECURITY_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');	

commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO002', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO002' and FLAG = 'Y'), 'SIBS', 'CO002', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO002', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV019SIBS', 'SIBS', 'CO002', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO002', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO002', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO002' and FLAG = 'Y'), 'SIBS', 'CO002', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO002', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV019SIBS', 'SIBS', 'CO002', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO002', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO002', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO002' and FLAG = 'Y'), 'SIBS', 'CO002', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO002', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV019SIBS', 'SIBS', 'CO002', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO002', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO002', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO002' and FLAG = 'Y'), 'SIBS', 'CO002', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO002', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV019SIBS', 'SIBS', 'CO002', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO002', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO002', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO002' and FLAG = 'Y'), 'SIBS', 'CO002', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO002', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV019SIBS', 'SIBS', 'CO002', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO002', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO002', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO002' and FLAG = 'Y'), 'SIBS', 'CO002', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO002', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV019SIBS', 'SIBS', 'CO002', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO002', 'OTH', 'ISL');
	
 
-- CO005:CS
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 	
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.SECURITY_ID), '-') || ' | ' ||                
		-- COALESCE(char(mig.CMS_SECURITY_TYPE_ID), '-') || ' | ' ||       
		-- COALESCE(char(mig.CMS_SECURITY_SUBTYPE_ID), '-') || ' | ' ||    
		-- COALESCE(char(mig.SECURITY_REF_NOTE), '-') || ' | ' ||          
		-- COALESCE(char(mig.SOURCE_SECURITY_TYPE), '-') || ' | ' ||       
		-- COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||   
		-- COALESCE(char(mig.CURRENCY), '-') || ' | ' ||                   
		-- COALESCE(char(mig.LOC_COUNTRY), '-') || ' | ' ||                
		-- COALESCE(char(mig.LOC_ORG_CODE), '-') || ' | ' ||               
		-- COALESCE(char(mig.CUSTODIAN_TYPE), '-') || ' | ' ||             
		-- COALESCE(char(mig.CUSTODIAN), '-') || ' | ' ||                  
		-- COALESCE(char(mig.LEGAL_ENFORCEBILITY), '-') || ' | ' ||        
		-- COALESCE(char(mig.LEGAL_ENFORCEBILITY_DATE), '-') || ' | ' ||   
		-- COALESCE(char(mig.SECURITY_PERFECTION_DATE), '-') || ' | ' ||   
		-- COALESCE(char(mig.INTEREST_CAPITAL), '-') || ' | ' ||           
		-- COALESCE(char(mig.IS_OWN_BANK), '-') || ' | ' ||         
		-- COALESCE(char(mig.GROUP_ACCOUNT_NO), '-') || ' | ' ||  		
		-- COALESCE(char(mig.REF_NO), '-') || ' | ' ||                     
		-- COALESCE(char(mig.AMT_CURRENCY), '-') || ' | ' ||               
		-- COALESCE(char(mig.AMT), '-') || ' | ' ||                        
		-- COALESCE(char(mig.DEPOSIT_MATURITY_DATE), '-') || ' | ' ||      
		-- COALESCE(char(mig.TENURE), '-') || ' | ' ||                     
		-- COALESCE(char(mig.TENURE_UNIT), '-') || ' | ' ||                
		-- COALESCE(char(mig.EXCHANGE_CONTROL_OBTAINED), '-') || ' | ' ||  
		-- COALESCE(char(mig.CHARGE_NATURE), '-') || ' | ' ||              
		-- COALESCE(char(mig.CHARGE_AMOUNT), '-') || ' | ' ||              
		-- COALESCE(char(mig.LEGAL_CHARGE_DATE), '-') || ' | ' ||          
		-- COALESCE(char(mig.CHARGE_TYPE), '-') || ' | ' ||                
		-- COALESCE(char(mig.BORROWER_DEPENDENCY), '-') || ' | ' ||        
		-- COALESCE(char(mig.IS_CGC_PLEDGED), '-') || ' | ' ||             
		-- COALESCE(char(mig.DESCRIPTION), '-') || ' | ' ||                
		-- COALESCE(char(mig.ISSUER), '-') || ' | ' ||        
		-- COALESCE(char(mig.COLLATERAL_STATUS), '-') || ' | ' ||       		
		-- COALESCE(char(mig.HOLD_STATUS), '-') || ' | ' ||                
		-- 'T' 
	-- , 'SIBS', 'CO005', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y'  
	-- FROM MIG_CO005_CS mig, MIG_CO019_PL pl 
	-- WHERE mig.SECURITY_ID = pl.SECURITY_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 	
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||
			COALESCE(char(mig.SECURITY_ID), '' '') || '' | '' ||                
			COALESCE(char(mig.CMS_SECURITY_SUBTYPE_ID), '' '') || '' | '' ||    
			COALESCE(char(mig.SECURITY_REF_NOTE), '' '') || '' | '' ||          
			COALESCE(char(mig.SOURCE_SECURITY_TYPE), '' '') || '' | '' ||       
			COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||   
			COALESCE(char(mig.CURRENCY), '' '') || '' | '' ||                   
			COALESCE(char(mig.LOC_COUNTRY), '' '') || '' | '' ||                
			COALESCE(char(mig.LOC_ORG_CODE), '' '') || '' | '' ||               
			COALESCE(char(mig.CUSTODIAN_TYPE), '' '') || '' | '' ||             
			COALESCE(char(mig.CUSTODIAN), '' '') || '' | '' ||                  
			COALESCE(char(mig.LEGAL_ENFORCEBILITY), '' '') || '' | '' ||        
			COALESCE(char(REPLACE(FORMAT_DATE(mig.LEGAL_ENFORCEBILITY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||   
			COALESCE(char(REPLACE(FORMAT_DATE(mig.SECURITY_PERFECTION_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||   
			COALESCE(char(mig.INTEREST_CAPITAL), '' '') || '' | '' ||           
			COALESCE(char(mig.IS_OWN_BANK), '' '') || '' | '' ||         
			COALESCE(char(mig.GROUP_ACCOUNT_NO), '' '') || '' | '' ||  		
			COALESCE(char(mig.REF_NO), '' '') || '' | '' ||                     
			COALESCE(char(mig.AMT_CURRENCY), '' '') || '' | '' ||               
			COALESCE(char(mig.AMT), '' '') || '' | '' ||                        
			COALESCE(char(REPLACE(FORMAT_DATE(mig.DEPOSIT_MATURITY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||      
			COALESCE(char(CAST (mig.TENURE as BIGINT)), '' '') || '' | '' ||                     
			COALESCE(char(mig.TENURE_UNIT), '' '') || '' | '' ||                
			COALESCE(char(mig.EXCHANGE_CONTROL_OBTAINED), '' '') || '' | '' ||  
			COALESCE(char(mig.CHARGE_NATURE), '' '') || '' | '' ||              
			COALESCE(char(mig.CHARGE_AMOUNT), '' '') || '' | '' ||              
			COALESCE(char(REPLACE(FORMAT_DATE(mig.LEGAL_CHARGE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||          
			COALESCE(char(mig.CHARGE_TYPE), '' '') || '' | '' ||                
			COALESCE(char(mig.BORROWER_DEPENDENCY), '' '') || '' | '' ||        
			COALESCE(char(mig.IS_CGC_PLEDGED), '' '') || '' | '' ||             
			COALESCE(char(mig.DESCRIPTION), '' '') || '' | '' ||                
			COALESCE(char(mig.ISSUER), '' '') || '' | '' ||        
			COALESCE(char(mig.COLLATERAL_STATUS), '' '') || '' | '' ||       		
			COALESCE(char(mig.HOLD_STATUS), '' '') || '' | '' ||                
			''T'' 
		, ''SIBS'', ''CO005'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''  
		FROM MIG_CO005_CS mig, MIG_CO019_PL pl 
		WHERE mig.SECURITY_ID = pl.SECURITY_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO005', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO005' and FLAG = 'Y'), 'SIBS', 'CO005', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO005', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV022SIBS', 'SIBS', 'CO005', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO005', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO005', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO005' and FLAG = 'Y'), 'SIBS', 'CO005', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO005', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV022SIBS', 'SIBS', 'CO005', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO005', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO005', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO005' and FLAG = 'Y'), 'SIBS', 'CO005', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO005', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV022SIBS', 'SIBS', 'CO005', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO005', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO005', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO005' and FLAG = 'Y'), 'SIBS', 'CO005', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO005', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV022SIBS', 'SIBS', 'CO005', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO005', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO005', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO005' and FLAG = 'Y'), 'SIBS', 'CO005', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO005', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV022SIBS', 'SIBS', 'CO005', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO005', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO005', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO005' and FLAG = 'Y'), 'SIBS', 'CO005', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO005', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV022SIBS', 'SIBS', 'CO005', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO005', 'OTH', 'ISL');

    
-- CO008:MS
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 	
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.SECURITY_ID), '-') || ' | ' ||                 
		-- COALESCE(char(mig.CMS_SECURITY_TYPE_ID), '-') || ' | ' ||        
		-- COALESCE(char(mig.CMS_SECURITY_SUBTYPE_ID), '-') || ' | ' ||     
		-- COALESCE(char(mig.SECURITY_REF_NOTE), '-') || ' | ' ||           
		-- COALESCE(char(mig.SOURCE_SECURITY_TYPE), '-') || ' | ' ||        
		-- COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||    
		-- COALESCE(char(mig.CURRENCY), '-') || ' | ' ||                    
		-- COALESCE(char(mig.LOC_COUNTRY), '-') || ' | ' ||                 
		-- COALESCE(char(mig.LOC_ORG_CODE), '-') || ' | ' ||                
		-- COALESCE(char(mig.TYPE), '-') || ' | ' ||                        
		-- COALESCE(char(mig.CERTIFICATE_NUMBER), '-') || ' | ' ||          
		-- COALESCE(char(mig.NUMBER_OF_UNITS), '-') || ' | ' ||             
		-- COALESCE(char(mig.STOCK_EXCHANGE_BOND_MARKET), '-') || ' | ' ||  
		-- COALESCE(char(mig.STOCK_CODE_BOND_CODE), '-') || ' | ' ||        
		-- COALESCE(char(mig.RECOGNIZED_EXCHANGE), '-') || ' | ' ||         
		-- COALESCE(char(mig.IS_LEGAL_ENFORCE), '-') || ' | ' ||            
		-- COALESCE(char(mig.IS_LEGAL_ENFORCE_DATE), '-') || ' | ' ||       
		-- COALESCE(char(mig.SECURITY_PERFECTION_DATE), '-') || ' | ' ||    
		-- COALESCE(char(mig.BORROWER_DEPENDENCY), '-') || ' | ' ||         
		-- COALESCE(char(mig.IS_CGC_PLEDGED), '-') || ' | ' ||              
		-- COALESCE(char(mig.CDS_NUMBER), '-') || ' | ' ||                  
		-- COALESCE(char(mig.SECURITY_REFERRED), '-') || ' | ' ||           
		-- COALESCE(char(mig.CUSTODIAN_TYPE), '-') || ' | ' ||              
		-- COALESCE(char(mig.SECURITY_CUSTODIAN), '-') || ' | ' ||          
		-- COALESCE(char(mig.SECURITY_MATURITY_DATE), '-') || ' | ' ||      
		-- COALESCE(char(mig.ISSUER_NAME), '-') || ' | ' ||                 
		-- COALESCE(char(mig.STOCK_EXCHANGE_COUNTRY), '-') || ' | ' ||      
		-- COALESCE(char(mig.LOCAL_EXCHANGE), '-') || ' | ' ||              
		-- COALESCE(char(mig.BASEL_COMPLIANT_TEXT), '-') || ' | ' ||        
		-- COALESCE(char(mig.EXCHANGE_CONTROL_OBTAINED), '-') || ' | ' ||   
		-- COALESCE(char(mig.CHARGE_NATURE), '-') || ' | ' ||               
		-- COALESCE(char(mig.CHARGE_AMOUNT), '-') || ' | ' ||               
		-- COALESCE(char(mig.LEGAL_CHARGE_DATE), '-') || ' | ' ||           
		-- COALESCE(char(mig.CHARGE_TYPE), '-') || ' | ' ||                 
		-- COALESCE(char(mig.UNIT_PRICE), '-') || ' | ' ||                  
		-- COALESCE(char(mig.UNIT_PRICE_CURRENCY), '-') || ' | ' ||         
		-- COALESCE(char(mig.CAPPED_PRICE), '-') || ' | ' ||                
		-- COALESCE(char(mig.COLLATERAL_STATUS), '-') || ' | ' ||      
		-- COALESCE(char(mig.SOURCE_ID), 'SIBS') || ' | ' ||		
		-- 'T'	
	-- , 'SIBS', 'CO008', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y' 
	-- FROM MIG_CO008_MS mig, MIG_CO019_PL pl 
	-- WHERE mig.SECURITY_ID = pl.SECURITY_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 	
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||
			COALESCE(char(mig.SECURITY_ID), '' '') || '' | '' ||                 
			COALESCE(char(mig.SECURITY_REF_NOTE), '' '') || '' | '' ||           
			COALESCE(char(mig.SOURCE_SECURITY_TYPE), '' '') || '' | '' ||        
			COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||    
			COALESCE(char(mig.CURRENCY), '' '') || '' | '' ||                    
			COALESCE(char(mig.LOC_COUNTRY), '' '') || '' | '' ||                 
			COALESCE(char(mig.LOC_ORG_CODE), '' '') || '' | '' ||                
			COALESCE(char(mig.TYPE), '' '') || '' | '' ||                        
			COALESCE(char(mig.CERTIFICATE_NUMBER), '' '') || '' | '' ||          
			COALESCE(char(mig.NUMBER_OF_UNITS), '' '') || '' | '' ||             
			COALESCE(char(mig.STOCK_EXCHANGE_BOND_MARKET), '' '') || '' | '' ||  
			COALESCE(char(mig.STOCK_CODE_BOND_CODE), '' '') || '' | '' ||        
			COALESCE(char(mig.RECOGNIZED_EXCHANGE), '' '') || '' | '' ||         
			COALESCE(char(mig.IS_LEGAL_ENFORCE), '' '') || '' | '' ||            
			COALESCE(char(REPLACE(FORMAT_DATE(mig.IS_LEGAL_ENFORCE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||       
			COALESCE(char(REPLACE(FORMAT_DATE(mig.SECURITY_PERFECTION_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||    
			COALESCE(char(mig.BORROWER_DEPENDENCY), '' '') || '' | '' ||         
			COALESCE(char(mig.IS_CGC_PLEDGED), '' '') || '' | '' ||              
			COALESCE(char(mig.CDS_NUMBER), '' '') || '' | '' ||                  
			COALESCE(char(mig.SECURITY_REFERRED), '' '') || '' | '' ||           
			COALESCE(char(mig.CUSTODIAN_TYPE), '' '') || '' | '' ||              
			COALESCE(char(mig.SECURITY_CUSTODIAN), '' '') || '' | '' ||          
			COALESCE(char(REPLACE(FORMAT_DATE(mig.SECURITY_MATURITY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||      
			COALESCE(char(mig.ISSUER_NAME), '' '') || '' | '' ||                 
			COALESCE(char(mig.STOCK_EXCHANGE_COUNTRY), '' '') || '' | '' ||      
			COALESCE(char(mig.LOCAL_EXCHANGE), '' '') || '' | '' ||              
			COALESCE(char(mig.BASEL_COMPLIANT_TEXT), '' '') || '' | '' ||        
			COALESCE(char(mig.EXCHANGE_CONTROL_OBTAINED), '' '') || '' | '' ||   
			COALESCE(char(mig.CHARGE_NATURE), '' '') || '' | '' ||               
			COALESCE(char(mig.CHARGE_AMOUNT), '' '') || '' | '' ||               
			COALESCE(char(REPLACE(FORMAT_DATE(mig.LEGAL_CHARGE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||           
			COALESCE(char(mig.CHARGE_TYPE), '' '') || '' | '' ||                 
			COALESCE(char(mig.UNIT_PRICE), '' '') || '' | '' ||                  
			COALESCE(char(mig.UNIT_PRICE_CURRENCY), '' '') || '' | '' ||         
			COALESCE(char(mig.CAPPED_PRICE), '' '') || '' | '' ||                
			COALESCE(char(mig.COLLATERAL_STATUS), '' '') || '' | '' ||      
			COALESCE(char(mig.SOURCE_ID), ''SIBS'') || '' | '' ||		
			''T''	
		, ''SIBS'', ''CO008'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''
		FROM MIG_CO008_MS mig, MIG_CO019_PL pl 
		WHERE mig.SECURITY_ID = pl.SECURITY_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');

commit;	
	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO008', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO008' and FLAG = 'Y'), 'SIBS', 'CO008', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO008', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV024SIBS', 'SIBS', 'CO008', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO008', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO008', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO008' and FLAG = 'Y'), 'SIBS', 'CO008', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO008', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV024SIBS', 'SIBS', 'CO008', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO008', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO008', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO008' and FLAG = 'Y'), 'SIBS', 'CO008', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO008', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV024SIBS', 'SIBS', 'CO008', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO008', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO008', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO008' and FLAG = 'Y'), 'SIBS', 'CO008', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO008', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV024SIBS', 'SIBS', 'CO008', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO008', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO008', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO008' and FLAG = 'Y'), 'SIBS', 'CO008', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO008', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV024SIBS', 'SIBS', 'CO008', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO008', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO008', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO008' and FLAG = 'Y'), 'SIBS', 'CO008', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO008', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV024SIBS', 'SIBS', 'CO008', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO008', 'OTH', 'ISL');


-- CO009:PT
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.SECURITY_ID), '-') || ' | ' ||                    
		-- COALESCE(char(mig.CMS_SECURITY_SUBTYPE_ID), '-') || ' | ' ||        
		-- COALESCE(char(mig.SECURITY_REF_NOTE), '-') || ' | ' ||              
		-- COALESCE(char(mig.SOURCE_SECURITY_TYPE), '-') || ' | ' ||           
		-- COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||       
		-- COALESCE(char(mig.CURRENCY), '-') || ' | ' ||                       
		-- COALESCE(char(mig.LOC_COUNTRY), '-') || ' | ' ||                    
		-- COALESCE(char(mig.LOC_ORG_CODE), '-') || ' | ' ||                   
		-- COALESCE(char(mig.CUSTODIAN_TYPE), '-') || ' | ' ||                 
		-- COALESCE(char(mig.CUSTODIAN), '-') || ' | ' ||                      
		-- COALESCE(char(mig.SECURITY_EXPIRY_DATE), '-') || ' | ' ||           
		-- COALESCE(char(mig.LEGAL_ENFORCEABILITY), '-') || ' | ' ||           
		-- COALESCE(char(mig.LEGAL_ENFORCEABILITY_DATE), '-') || ' | ' ||      
		-- COALESCE(char(mig.SECURITY_PERFECTION_DATE), '-') || ' | ' ||       
		-- COALESCE(char(mig.SALE_PURCHASE_AGREEMENT_VALUE), '-') || ' | ' ||  
		-- COALESCE(char(mig.SALE_PURCHASE_DATE), '-') || ' | ' ||             
		-- COALESCE(char(mig.TITLE_TYPE), '-') || ' | ' ||                     
		-- COALESCE(char(mig.MASTER_TITLE), '-') || ' | ' ||                   
		-- COALESCE(char(mig.MASTER_TITLE_NUMBER), '-') || ' | ' ||            
		-- COALESCE(char(mig.TITLE_NUMBER_PREFIX), '-') || ' | ' ||            
		-- COALESCE(char(mig.TITLE_NUMBER), '-') || ' | ' ||                   
		-- COALESCE(char(mig.LOT_NO), '-') || ' | ' ||                         
		-- COALESCE(char(mig.POST_CODE), '-') || ' | ' ||                      
		-- COALESCE(char(mig.STATE_CODE), '-') || ' | ' ||                     
		-- COALESCE(char(mig.LAND_AREA), '-') || ' | ' ||                      
		-- COALESCE(char(mig.LAND_AREA_UOM), '-') || ' | ' ||                  
		-- COALESCE(char(mig.BUILT_UP_AREA), '-') || ' | ' ||                  
		-- COALESCE(char(mig.BUILD_AREA_UOM), '-') || ' | ' ||                 
		-- COALESCE(char(mig.TENURE), '-') || ' | ' ||                         
		-- COALESCE(char(mig.TENURE_UNIT), '-') || ' | ' ||                    
		-- COALESCE(char(mig.QUIT_RENT_RECEIPT), '-') || ' | ' ||              
		-- COALESCE(char(mig.QUIT_RENT_AMT_PAID), '-') || ' | ' ||             
		-- COALESCE(char(mig.QUIT_RENT_PAYMENT_DATE), '-') || ' | ' ||         
		-- COALESCE(char(mig.PROPERTY_USAGE), '-') || ' | ' ||                 
		-- COALESCE(char(mig.ABANDONED_PROJECT), '-') || ' | ' ||              
		-- COALESCE(char(mig.PROPERTY_COMPLETION_STATUS), '-') || ' | ' ||     
		-- COALESCE(char(mig.PROPERTY_TYPE_CODE), '-') || ' | ' ||             
		-- COALESCE(char(mig.AUCTIONEER), '-') || ' | ' ||                     
		-- COALESCE(char(mig.AUCTION_PRICE), '-') || ' | ' ||                  
		-- COALESCE(char(mig.AUCTION_DATE), '-') || ' | ' ||                   
		-- COALESCE(char(mig.CHATTEL_SOLD_DATE), '-') || ' | ' ||              
		-- COALESCE(char(mig.PRI_CAVEAT_GUARANTEE_DATE), '-') || ' | ' ||      
		-- COALESCE(char(mig.AMOUNT_REDEEM), '-') || ' | ' ||                  
		-- COALESCE(char(mig.UNIT_PRICE), '-') || ' | ' ||                     
		-- COALESCE(char(mig.PROPERTY_ADDRESS), '-') || ' | ' ||               
		-- COALESCE(char(mig.PROPERTY_ADDRESS_2), '-') || ' | ' ||             
		-- COALESCE(char(mig.PROPERTY_ADDRESS_3), '-') || ' | ' ||             
		-- COALESCE(char(mig.ASSESSMENT_RATE), '-') || ' | ' ||                
		-- COALESCE(char(mig.ASSESSMENT_PAYMENT_DATE), '-') || ' | ' ||        
		-- COALESCE(char(mig.ASSESSMENT), '-') || ' | ' ||                     
		-- COALESCE(char(mig.EXCHANGE_CONTROL_OBTAINED), '-') || ' | ' ||      
		-- COALESCE(char(mig.BORROWER_DEPENDENCY), '-') || ' | ' ||            
		-- COALESCE(char(mig.IS_CGC_PLEDGED), '-') || ' | ' ||                 
		-- COALESCE(char(mig.IS_PHY_INSPECT), '-') || ' | ' ||                 
		-- COALESCE(char(mig.ENV_RISKY_STATUS), '-') || ' | ' ||               
		-- COALESCE(char(mig.INDEPENDENT_VALUER_FLAG), '-') || ' | ' ||        
		-- COALESCE(char(mig.COLLATERAL_STATUS), '-') || ' | ' ||		  
		-- 'T'
	-- , 'SIBS', 'CO009', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y'  
	-- FROM MIG_CO009_PT mig, MIG_CO019_PL pl 
	-- WHERE mig.SECURITY_ID = pl.SECURITY_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||
			COALESCE(char(mig.SECURITY_ID), '' '') || '' | '' ||                    
			COALESCE(char(mig.CMS_SECURITY_SUBTYPE_ID), '' '') || '' | '' ||        
			COALESCE(char(mig.SECURITY_REF_NOTE), '' '') || '' | '' ||              
			COALESCE(char(mig.SOURCE_SECURITY_TYPE), '' '') || '' | '' ||           
			COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||       
			COALESCE(char(mig.CURRENCY), '' '') || '' | '' ||                       
			COALESCE(char(mig.LOC_COUNTRY), '' '') || '' | '' ||                    
			COALESCE(char(mig.LOC_ORG_CODE), '' '') || '' | '' ||                   
			COALESCE(char(mig.CUSTODIAN_TYPE), '' '') || '' | '' ||                 
			COALESCE(char(mig.CUSTODIAN), '' '') || '' | '' ||                      
			COALESCE(char(REPLACE(FORMAT_DATE(mig.SECURITY_EXPIRY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||           
			COALESCE(char(mig.LEGAL_ENFORCEABILITY), '' '') || '' | '' ||           
			COALESCE(char(REPLACE(FORMAT_DATE(mig.LEGAL_ENFORCEABILITY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||      
			COALESCE(char(REPLACE(FORMAT_DATE(mig.SECURITY_PERFECTION_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||       
			COALESCE(char(mig.SALE_PURCHASE_AGREEMENT_VALUE), '' '') || '' | '' ||  
			COALESCE(char(REPLACE(FORMAT_DATE(mig.SALE_PURCHASE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||             
			COALESCE(char(mig.TITLE_TYPE), '' '') || '' | '' ||                     
			COALESCE(char(mig.MASTER_TITLE), '' '') || '' | '' ||                   
			COALESCE(char(mig.MASTER_TITLE_NUMBER), '' '') || '' | '' ||            
			COALESCE(char(mig.TITLE_NUMBER_PREFIX), '' '') || '' | '' ||            
			COALESCE(char(mig.TITLE_NUMBER), '' '') || '' | '' ||                   
			COALESCE(char(mig.LOT_NO), '' '') || '' | '' ||                         
			COALESCE(char(mig.POST_CODE), '' '') || '' | '' ||                      
			COALESCE(char(mig.STATE_CODE), '' '') || '' | '' ||                     
			COALESCE(char(mig.LAND_AREA), '' '') || '' | '' ||                      
			COALESCE(char(mig.LAND_AREA_UOM), '' '') || '' | '' ||                  
			COALESCE(char(mig.BUILT_UP_AREA), '' '') || '' | '' ||                  
			COALESCE(char(mig.BUILD_AREA_UOM), '' '') || '' | '' ||                 
			COALESCE(char(mig.TENURE), '' '') || '' | '' ||                         
			COALESCE(char(mig.TENURE_UNIT), '' '') || '' | '' ||                    
			COALESCE(char(mig.QUIT_RENT_RECEIPT), '' '') || '' | '' ||              
			COALESCE(char(mig.QUIT_RENT_AMT_PAID), '' '') || '' | '' ||             
			COALESCE(char(REPLACE(FORMAT_DATE(mig.QUIT_RENT_PAYMENT_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||         
			COALESCE(char(mig.PROPERTY_USAGE), '' '') || '' | '' ||                 
			COALESCE(char(mig.ABANDONED_PROJECT), '' '') || '' | '' ||              
			COALESCE(char(mig.PROPERTY_COMPLETION_STATUS), '' '') || '' | '' ||     
			COALESCE(char(mig.PROPERTY_TYPE_CODE), '' '') || '' | '' ||             
			COALESCE(char(mig.AUCTIONEER), '' '') || '' | '' ||                     
			COALESCE(char(mig.AUCTION_PRICE), '' '') || '' | '' ||                  
			COALESCE(char(REPLACE(FORMAT_DATE(mig.AUCTION_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||                   
			COALESCE(char(REPLACE(FORMAT_DATE(mig.CHATTEL_SOLD_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||              
			COALESCE(char(REPLACE(FORMAT_DATE(mig.PRI_CAVEAT_GUARANTEE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||      
			COALESCE(char(mig.AMOUNT_REDEEM), '' '') || '' | '' ||                  
			COALESCE(char(mig.UNIT_PRICE), '' '') || '' | '' ||                     
			COALESCE(char(mig.PROPERTY_ADDRESS), '' '') || '' | '' ||               
			COALESCE(char(mig.PROPERTY_ADDRESS_2), '' '') || '' | '' ||             
			COALESCE(char(mig.PROPERTY_ADDRESS_3), '' '') || '' | '' ||             
			COALESCE(char(mig.ASSESSMENT_RATE), '' '') || '' | '' ||                
			COALESCE(char(REPLACE(FORMAT_DATE(mig.ASSESSMENT_PAYMENT_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||        
			COALESCE(char(mig.ASSESSMENT), '' '') || '' | '' ||                     
			COALESCE(char(mig.EXCHANGE_CONTROL_OBTAINED), '' '') || '' | '' ||      
			COALESCE(char(mig.BORROWER_DEPENDENCY), '' '') || '' | '' ||            
			COALESCE(char(mig.IS_CGC_PLEDGED), '' '') || '' | '' ||                 
			COALESCE(char(mig.IS_PHY_INSPECT), '' '') || '' | '' ||                 
			COALESCE(char(mig.ENV_RISKY_STATUS), '' '') || '' | '' ||               
			COALESCE(char(mig.INDEPENDENT_VALUER_FLAG), '' '') || '' | '' ||        
			COALESCE(char(mig.COLLATERAL_STATUS), '' '') || '' | '' ||		  
			''T''
		, ''SIBS'', ''CO009'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''  
		FROM MIG_CO009_PT mig, MIG_CO019_PL pl 
		WHERE mig.SECURITY_ID = pl.SECURITY_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO009', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO009' and FLAG = 'Y'), 'SIBS', 'CO009', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO009', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV025SIBS', 'SIBS', 'CO009', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO009', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO009', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO009' and FLAG = 'Y'), 'SIBS', 'CO009', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO009', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV025SIBS', 'SIBS', 'CO009', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO009', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO009', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO009' and FLAG = 'Y'), 'SIBS', 'CO009', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO009', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV025SIBS', 'SIBS', 'CO009', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO009', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO009', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO009' and FLAG = 'Y'), 'SIBS', 'CO009', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO009', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV025SIBS', 'SIBS', 'CO009', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO009', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO009', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO009' and FLAG = 'Y'), 'SIBS', 'CO009', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO009', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV025SIBS', 'SIBS', 'CO009', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO009', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO009', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO009' and FLAG = 'Y'), 'SIBS', 'CO009', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO009', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV025SIBS', 'SIBS', 'CO009', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO009', 'OTH', 'ISL');

    
-- CO010:GT
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.SECURITY_ID), '-') || ' | ' ||                
		-- COALESCE(char(mig.SECURITY_REF_NOTE), '-') || ' | ' ||          
		-- COALESCE(char(mig.SOURCE_SECURITY_TYPE), '-') || ' | ' ||       
		-- COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||   
		-- COALESCE(char(mig.CURRENCY), '-') || ' | ' ||                   
		-- COALESCE(char(mig.LOC_COUNTRY), '-') || ' | ' ||                
		-- COALESCE(char(mig.LOC_ORG_CODE), '-') || ' | ' ||               
		-- COALESCE(char(mig.CUSTODIAN_TYPE), '-') || ' | ' ||             
		-- COALESCE(char(mig.SECURITY_EXPIRY_DATE), '-') || ' | ' ||       
		-- COALESCE(char(mig.LEGAL_ENFORCEABILITY), '-') || ' | ' ||       
		-- COALESCE(char(mig.LEGAL_ENFORCEABILITY_DATE), '-') || ' | ' ||  
		-- COALESCE(char(mig.SECURITY_PERFECTION_DATE), '-') || ' | ' ||   
		-- COALESCE(char(mig.GUARANTEES_DESC), '-') || ' | ' ||            
		-- COALESCE(char(mig.REF_NO), '-') || ' | ' ||                     
		-- COALESCE(char(mig.GUARANTEE_AMT), '-') || ' | ' ||              
		-- COALESCE(char(mig.GUARANTEE_DATE), '-') || ' | ' ||             
		-- COALESCE(char(mig.BORROWER_DEPENDENCY), '-') || ' | ' ||        
		-- COALESCE(char(mig.BENEFICIARY_NAME), '-') || ' | ' ||           
		-- COALESCE(char(mig.SECURITY_CUSTODIAN), '-') || ' | ' ||         
		-- COALESCE(char(mig.CHARGE_TYPE), '-') || ' | ' ||                
		-- COALESCE(char(mig.ISSUING_BANK), '-') || ' | ' ||               
		-- COALESCE(char(mig.ISSUING_BANK_COUNTRY), '-') || ' | ' ||       
		-- COALESCE(char(mig.EXCHANGE_CONTROL_OBTAINED), '-') || ' | ' ||  
		-- COALESCE(char(mig.COLLATERAL_STATUS), '-') || ' | ' ||        
		-- 'T' 
	-- , 'SIBS', 'CO010', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y' 
	-- FROM MIG_CO010_GT mig, MIG_CO019_PL pl 
	-- WHERE mig.SECURITY_ID = pl.SECURITY_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||
			COALESCE(char(mig.SECURITY_ID), '' '') || '' | '' ||        
			COALESCE(char(mig.CMS_SECURITY_SUBTYPE_ID), '' '') || '' | '' ||   			
			COALESCE(char(mig.SECURITY_REF_NOTE), '' '') || '' | '' ||          
			COALESCE(char(mig.SOURCE_SECURITY_TYPE), '' '') || '' | '' ||       
			COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||   
			COALESCE(char(mig.CURRENCY), '' '') || '' | '' ||                   
			COALESCE(char(mig.LOC_COUNTRY), '' '') || '' | '' ||                
			COALESCE(char(mig.LOC_ORG_CODE), '' '') || '' | '' ||               
			COALESCE(char(mig.CUSTODIAN_TYPE), '' '') || '' | '' ||             
			COALESCE(char(REPLACE(FORMAT_DATE(mig.SECURITY_EXPIRY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||       
			COALESCE(char(mig.LEGAL_ENFORCEABILITY), '' '') || '' | '' ||       
			COALESCE(char(REPLACE(FORMAT_DATE(mig.LEGAL_ENFORCEABILITY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||  
			COALESCE(char(REPLACE(FORMAT_DATE(mig.SECURITY_PERFECTION_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||   
			COALESCE(char(mig.GUARANTEES_DESC), '' '') || '' | '' ||            
			COALESCE(char(mig.REF_NO), '' '') || '' | '' ||                     
			COALESCE(char(mig.GUARANTEE_AMT), '' '') || '' | '' ||              
			COALESCE(char(REPLACE(FORMAT_DATE(mig.GUARANTEE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||             
			COALESCE(char(mig.BORROWER_DEPENDENCY), '' '') || '' | '' ||        
			COALESCE(char(mig.BENEFICIARY_NAME), '' '') || '' | '' ||           
			COALESCE(char(mig.SECURITY_CUSTODIAN), '' '') || '' | '' ||         
			COALESCE(char(mig.CHARGE_TYPE), '' '') || '' | '' ||                
			COALESCE(char(mig.ISSUING_BANK), '' '') || '' | '' ||               
			COALESCE(char(mig.ISSUING_BANK_COUNTRY), '' '') || '' | '' ||       
			COALESCE(char(mig.EXCHANGE_CONTROL_OBTAINED), '' '') || '' | '' ||  
			COALESCE(char(mig.COLLATERAL_STATUS), '' '') || '' | '' ||        
			''T'' 
		, ''SIBS'', ''CO010'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y'' 
		FROM MIG_CO010_GT mig, MIG_CO019_PL pl 
		WHERE mig.SECURITY_ID = pl.SECURITY_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO010', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO010' and FLAG = 'Y'), 'SIBS', 'CO010', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO010', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV026SIBS', 'SIBS', 'CO010', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO010', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO010', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO010' and FLAG = 'Y'), 'SIBS', 'CO010', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO010', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV026SIBS', 'SIBS', 'CO010', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO010', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO010', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO010' and FLAG = 'Y'), 'SIBS', 'CO010', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO010', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV026SIBS', 'SIBS', 'CO010', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO010', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO010', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO010' and FLAG = 'Y'), 'SIBS', 'CO010', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO010', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV026SIBS', 'SIBS', 'CO010', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO010', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO010', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO010' and FLAG = 'Y'), 'SIBS', 'CO010', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO010', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV026SIBS', 'SIBS', 'CO010', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO010', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO010', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO010' and FLAG = 'Y'), 'SIBS', 'CO010', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO010', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV026SIBS', 'SIBS', 'CO010', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO010', 'OTH', 'ISL');
	

-- CO011:OT
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.SECURITY_ID), '-') || ' | ' ||                
		-- COALESCE(char(mig.CMS_SECURITY_SUBTYPE_ID), '-') || ' | ' ||    
		-- COALESCE(char(mig.SECURITY_REF_NOTE), '-') || ' | ' ||          
		-- COALESCE(char(mig.SOURCE_SECURITY_TYPE), '-') || ' | ' ||       
		-- COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||   
		-- COALESCE(char(mig.CURRENCY), '-') || ' | ' ||                   
		-- COALESCE(char(mig.LOC_COUNTRY), '-') || ' | ' ||                
		-- COALESCE(char(mig.LOC_ORG_CODE), '-') || ' | ' ||               
		-- COALESCE(char(mig.CUSTODIAN_TYPE), '-') || ' | ' ||             
		-- COALESCE(char(mig.SECURITY_CUSTODIAN), '-') || ' | ' ||         
		-- COALESCE(char(mig.IS_PHY_INSPECT), '-') || ' | ' ||             
		-- COALESCE(char(mig.ENV_RISKY_STATUS), '-') || ' | ' ||           
		-- COALESCE(char(mig.BORROWER_DEPENDENCY), '-') || ' | ' ||        
		-- COALESCE(char(mig.LEGAL_ENFORCEABILITY), '-') || ' | ' ||       
		-- COALESCE(char(mig.LEGAL_ENFORCEABILITY_DATE), '-') || ' | ' ||  
		-- COALESCE(char(mig.SECURITY_MATURITY_DATE), '-') || ' | ' ||     
		-- COALESCE(char(mig.IS_CGC_PLEDGED), '-') || ' | ' ||             
		-- COALESCE(char(mig.NUMBER_OF_UNITS), '-') || ' | ' ||            
		-- COALESCE(char(mig.DESCRIPTION_OTHERS), '-') || ' | ' ||         
		-- COALESCE(char(mig.COLLATERAL_STATUS), '-') || ' | ' ||      
		-- 'T' 
	-- , 'SIBS', 'CO011', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y' 
	-- FROM MIG_CO011_OT mig, MIG_CO019_PL pl 
	-- WHERE mig.SECURITY_ID = pl.SECURITY_ID
	-- AND mig.IS_VALID = 'Y');

	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||
			COALESCE(char(mig.SECURITY_ID), '' '') || '' | '' ||                
			COALESCE(char(mig.CMS_SECURITY_SUBTYPE_ID), '' '') || '' | '' ||    
			COALESCE(char(mig.SECURITY_REF_NOTE), '' '') || '' | '' ||          
			COALESCE(char(mig.SOURCE_SECURITY_TYPE), '' '') || '' | '' ||       
			COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||   
			COALESCE(char(mig.CURRENCY), '' '') || '' | '' ||                   
			COALESCE(char(mig.LOC_COUNTRY), '' '') || '' | '' ||                
			COALESCE(char(mig.LOC_ORG_CODE), '' '') || '' | '' ||               
			COALESCE(char(mig.CUSTODIAN_TYPE), '' '') || '' | '' ||             
			COALESCE(char(mig.SECURITY_CUSTODIAN), '' '') || '' | '' ||         
			COALESCE(char(mig.IS_PHY_INSPECT), '' '') || '' | '' ||             
			COALESCE(char(mig.ENV_RISKY_STATUS), '' '') || '' | '' ||           
			COALESCE(char(mig.BORROWER_DEPENDENCY), '' '') || '' | '' ||        
			COALESCE(char(mig.LEGAL_ENFORCEABILITY), '' '') || '' | '' ||       
			COALESCE(char(REPLACE(FORMAT_DATE(mig.LEGAL_ENFORCEABILITY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||  
			COALESCE(char(REPLACE(FORMAT_DATE(mig.SECURITY_MATURITY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||     
			COALESCE(char(mig.IS_CGC_PLEDGED), '' '') || '' | '' ||             
			COALESCE(char(mig.NUMBER_OF_UNITS), '' '') || '' | '' ||            
			COALESCE(char(mig.DESCRIPTION_OTHERS), '' '') || '' | '' ||         
			COALESCE(char(mig.COLLATERAL_STATUS), '' '') || '' | '' ||      
			''T'' 
		, ''SIBS'', ''CO011'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y'' 
		FROM MIG_CO011_OT mig, MIG_CO019_PL pl 
		WHERE mig.SECURITY_ID = pl.SECURITY_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO011', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO011' and FLAG = 'Y'), 'SIBS', 'CO011', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO011', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV027SIBS', 'SIBS', 'CO011', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO011', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO011', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO011' and FLAG = 'Y'), 'SIBS', 'CO011', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO011', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV027SIBS', 'SIBS', 'CO011', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO011', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO011', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'SF' and INTERFACE_ID = 'CO011' and FLAG = 'Y'), 'SIBS', 'CO011', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO011', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV027SIBS', 'SIBS', 'CO011', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO011', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO011', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO011' and FLAG = 'Y'), 'SIBS', 'CO011', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO011', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV027SIBS', 'SIBS', 'CO011', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO011', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO011', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO011' and FLAG = 'Y'), 'SIBS', 'CO011', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO011', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV027SIBS', 'SIBS', 'CO011', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO011', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO011', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO011' and FLAG = 'Y'), 'SIBS', 'CO011', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO011', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV027SIBS', 'SIBS', 'CO011', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO011', 'OTH', 'ISL');


-- CO012:IN
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.SECURITY_ID), '-') || ' | ' ||               
		-- COALESCE(char(mig.CMS_SECURITY_SUBTYPE_ID), '-') || ' | ' ||   
		-- COALESCE(char(mig.SECURITY_REF_NOTE), '-') || ' | ' ||         
		-- COALESCE(char(mig.SOURCE_SECURITY_TYPE), '-') || ' | ' ||      
		-- COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  
		-- COALESCE(char(mig.CURRENCY), '-') || ' | ' ||                  
		-- COALESCE(char(mig.LOC_COUNTRY), '-') || ' | ' ||               
		-- COALESCE(char(mig.LOC_ORG_CODE), '-') || ' | ' ||              
		-- COALESCE(char(mig.CUSTODIAN_TYPE), '-') || ' | ' ||            
		-- COALESCE(char(mig.SECURITY_CUSTODIAN), '-') || ' | ' ||        
		-- COALESCE(char(mig.CHARGE_TYPE), '-') || ' | ' ||               
		-- COALESCE(char(mig.CHARGE_NATURE), '-') || ' | ' ||             
		-- COALESCE(char(mig.CHARGE_AMOUNT), '-') || ' | ' ||             
		-- COALESCE(char(mig.LEGAL_CHARGE_DATE), '-') || ' | ' ||         
		-- COALESCE(char(mig.IS_LEGAL_ENFORCE), '-') || ' | ' ||          
		-- COALESCE(char(mig.IS_LEGAL_ENFORCE_DATE), '-') || ' | ' ||     
		-- COALESCE(char(mig.COLLATERAL_STATUS), '-') || ' | ' || 	
		-- 'T' 
	-- , 'SIBS', 'CO012', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y'  
	-- FROM MIG_CO012_IN mig, MIG_CO019_PL pl 
	-- WHERE mig.SECURITY_ID = pl.SECURITY_ID
	-- AND mig.IS_VALID = 'Y');
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||
			COALESCE(char(mig.SECURITY_ID), '' '') || '' | '' ||               
			COALESCE(char(mig.CMS_SECURITY_SUBTYPE_ID), '' '') || '' | '' ||   
			COALESCE(char(mig.SECURITY_REF_NOTE), '' '') || '' | '' ||         
			COALESCE(char(mig.SOURCE_SECURITY_TYPE), '' '') || '' | '' ||      
			COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  
			COALESCE(char(mig.CURRENCY), '' '') || '' | '' ||                  
			COALESCE(char(mig.LOC_COUNTRY), '' '') || '' | '' ||               
			COALESCE(char(mig.LOC_ORG_CODE), '' '') || '' | '' ||              
			COALESCE(char(mig.CUSTODIAN_TYPE), '' '') || '' | '' ||            
			COALESCE(char(mig.SECURITY_CUSTODIAN), '' '') || '' | '' ||        
			COALESCE(char(mig.CHARGE_TYPE), '' '') || '' | '' ||               
			COALESCE(char(mig.CHARGE_NATURE), '' '') || '' | '' ||             
			COALESCE(char(mig.CHARGE_AMOUNT), '' '') || '' | '' ||             
			COALESCE(char(REPLACE(FORMAT_DATE(mig.LEGAL_CHARGE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||         
			COALESCE(char(mig.IS_LEGAL_ENFORCE), '' '') || '' | '' ||          
			COALESCE(char(REPLACE(FORMAT_DATE(mig.IS_LEGAL_ENFORCE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||     
			COALESCE(char(mig.COLLATERAL_STATUS), '' '') || '' | '' || 	
			''T'' 
		, ''SIBS'', ''CO012'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''  
		FROM MIG_CO012_IN mig, MIG_CO019_PL pl 
		WHERE mig.SECURITY_ID = pl.SECURITY_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO012', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO012' and FLAG = 'Y'), 'SIBS', 'CO012', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO012', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV028SIBS', 'SIBS', 'CO012', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO012', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO012', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO012' and FLAG = 'Y'), 'SIBS', 'CO012', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO012', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV028SIBS', 'SIBS', 'CO012', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO012', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO012', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO012' and FLAG = 'Y'), 'SIBS', 'CO012', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO012', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV028SIBS', 'SIBS', 'CO012', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO012', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO012', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO012' and FLAG = 'Y'), 'SIBS', 'CO012', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO012', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV028SIBS', 'SIBS', 'CO012', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO012', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO012', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO012' and FLAG = 'Y'), 'SIBS', 'CO012', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO012', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV028SIBS', 'SIBS', 'CO012', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO012', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO012', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO012' and FLAG = 'Y'), 'SIBS', 'CO012', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO012', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV028SIBS', 'SIBS', 'CO012', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO012', 'OTH', 'ISL');


-- CO014:CL
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.SECURITY_ID), '-') || ' | ' ||               
		-- COALESCE(char(mig.CMS_SECURITY_SUBTYPE_ID), '-') || ' | ' ||   
		-- COALESCE(char(mig.SECURITY_REF_NOTE), '-') || ' | ' ||         
		-- COALESCE(char(mig.SOURCE_SECURITY_TYPE), '-') || ' | ' ||      
		-- COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  
		-- COALESCE(char(mig.LOC_COUNTRY), '-') || ' | ' ||               
		-- COALESCE(char(mig.LOC_ORG_CODE), '-') || ' | ' ||              
		-- COALESCE(char(mig.IS_LEGAL_ENFORCE), '-') || ' | ' ||          
		-- COALESCE(char(mig.IS_LEGAL_ENFORCE_DATE), '-') || ' | ' ||     
		-- COALESCE(char(mig.COLLATERAL_STATUS), '-') || ' | ' ||         
		-- 'T' 
	-- , 'SIBS', 'CO014', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y'  
	-- FROM MIG_CO014_CL mig, MIG_CO019_PL pl 
	-- WHERE mig.SECURITY_ID = pl.SECURITY_ID
	-- AND mig.IS_VALID = 'Y');    
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||
			COALESCE(char(mig.SECURITY_ID), '' '') || '' | '' ||               
			COALESCE(char(mig.CMS_SECURITY_SUBTYPE_ID), '' '') || '' | '' ||   
			COALESCE(char(mig.SECURITY_REF_NOTE), '' '') || '' | '' ||         
			COALESCE(char(mig.SOURCE_SECURITY_TYPE), '' '') || '' | '' ||      
			COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  
			COALESCE(char(mig.LOC_COUNTRY), '' '') || '' | '' ||               
			COALESCE(char(mig.LOC_ORG_CODE), '' '') || '' | '' ||              
			COALESCE(char(mig.IS_LEGAL_ENFORCE), '' '') || '' | '' ||          
			COALESCE(char(REPLACE(FORMAT_DATE(mig.IS_LEGAL_ENFORCE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||     
			COALESCE(char(mig.COLLATERAL_STATUS), '' '') || '' | '' ||         
			''T'' 
		, ''SIBS'', ''CO014'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''  
		FROM MIG_CO014_CL mig, MIG_CO019_PL pl 
		WHERE mig.SECURITY_ID = pl.SECURITY_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO014', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO014' and FLAG = 'Y'), 'SIBS', 'CO014', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO014', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV030SIBS', 'SIBS', 'CO014', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO014', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO014', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO014' and FLAG = 'Y'), 'SIBS', 'CO014', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO014', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV030SIBS', 'SIBS', 'CO014', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO014', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO014', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO014' and FLAG = 'Y'), 'SIBS', 'CO014', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO014', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV030SIBS', 'SIBS', 'CO014', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO014', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO014', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO014' and FLAG = 'Y'), 'SIBS', 'CO014', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO014', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV030SIBS', 'SIBS', 'CO014', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO014', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO014', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO014' and FLAG = 'Y'), 'SIBS', 'CO014', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO014', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV030SIBS', 'SIBS', 'CO014', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO014', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO014', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO014' and FLAG = 'Y'), 'SIBS', 'CO014', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO014', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV030SIBS', 'SIBS', 'CO014', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO014', 'OTH', 'ISL');


-----------------------------
-- Lin kages
-----------------------------	 
-- CO015:VL
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.SECURITY_ID), '-') || ' | ' ||           
		-- COALESCE(char(mig.VALUER_CODE), '-') || ' | ' ||           
		-- COALESCE(char(mig.VALUATION_DATE), '-') || ' | ' ||        
		-- COALESCE(char(mig.VALUATION_CURRENCY), '-') || ' | ' ||    
		-- COALESCE(char(mig.CMV), '-') || ' | ' ||                   
		-- COALESCE(char(mig.FSV), '-') || ' | ' ||                   
		-- COALESCE(char(mig.ASSUMPTION_VALUE), '-') || ' | ' ||      
		-- COALESCE(char(mig.RESERVE_PRICE), '-') || ' | ' ||         
		-- COALESCE(char(mig.RESERVE_PRICE_DATE), '-') || ' | ' ||    
		-- COALESCE(char(mig.APPRAISAL_VALUE), '-') || ' | ' ||       
		-- COALESCE(char(mig.APPRAISAL_VALUE_DATE), '-') || ' | ' ||  	
		-- 'T' 
	-- , 'SIBS', 'CO015', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y'  
	-- FROM MIG_CO015_VL mig, MIG_CO019_PL pl 
	-- WHERE mig.SECURITY_ID = pl.SECURITY_ID
	-- AND mig.IS_VALID = 'Y');    
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||
			COALESCE(char(mig.SECURITY_ID), '' '') || '' | '' ||           
			COALESCE(char(mig.VALUER_CODE), '' '') || '' | '' ||           
			COALESCE(char(REPLACE(FORMAT_DATE(mig.VALUATION_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||        
			COALESCE(char(mig.VALUATION_CURRENCY), '' '') || '' | '' ||    
			COALESCE(char(mig.CMV), '' '') || '' | '' ||                   
			COALESCE(char(mig.FSV), '' '') || '' | '' ||                   
			COALESCE(char(mig.RESERVE_PRICE), '' '') || '' | '' ||         
			COALESCE(char(REPLACE(FORMAT_DATE(mig.RESERVE_PRICE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||    
			''T'' 
		, ''SIBS'', ''CO015'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''  
		FROM MIG_CO015_VL mig, MIG_CO019_PL pl 
		WHERE mig.SECURITY_ID = pl.SECURITY_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO015', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO015' and FLAG = 'Y'), 'SIBS', 'CO015', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO015', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV031SIBS', 'SIBS', 'CO015', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO015', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO015', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO015' and FLAG = 'Y'), 'SIBS', 'CO015', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO015', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV031SIBS', 'SIBS', 'CO015', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO015', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO015', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO015' and FLAG = 'Y'), 'SIBS', 'CO015', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO015', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV031SIBS', 'SIBS', 'CO015', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO015', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO015', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO015' and FLAG = 'Y'), 'SIBS', 'CO015', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO015', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV031SIBS', 'SIBS', 'CO015', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO015', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO015', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO015' and FLAG = 'Y'), 'SIBS', 'CO015', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO015', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV031SIBS', 'SIBS', 'CO015', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO015', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO015', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO015' and FLAG = 'Y'), 'SIBS', 'CO015', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO015', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV031SIBS', 'SIBS', 'CO015', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO015', 'OTH', 'ISL');


-- CO016:INS Policy
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.SECURITY_ID), '-') || ' | ' ||                  
		-- COALESCE(char(mig.POLICY_NUMBER), '-') || ' | ' ||                
		-- COALESCE(char(mig.INSURER_NAME_CODE), '-') || ' | ' ||            
		-- COALESCE(char(mig.INSURANCE_TYPE_CODE), '-') || ' | ' ||          
		-- COALESCE(char(mig.INSURANCE_POLICY_CURRENCY), '-') || ' | ' ||    
		-- COALESCE(char(mig.INSURED_AMT), '-') || ' | ' ||                  
		-- COALESCE(char(mig.EFFECTIVE_DATE), '-') || ' | ' ||               
		-- COALESCE(char(mig.EXPIRY_DATE), '-') || ' | ' ||                  
		-- COALESCE(char(mig.PROP_NO_COVER_NOTE_NUMBER), '-') || ' | ' ||    
		-- COALESCE(char(mig.GROSS_PREMIUM), '-') || ' | ' ||                
		-- COALESCE(char(mig.STAMP_DUTY), '-') || ' | ' ||                   
		-- COALESCE(char(mig.NET_PREMIUM_PAY_TO_INS_COMP), '-') || ' | ' ||  
		-- COALESCE(char(mig.NET_PREMIUM_PAY_BY_BORROWER), '-') || ' | ' ||  
		-- COALESCE(char(mig.COMMISSION_EARNED), '-') || ' | ' ||            
		-- COALESCE(char(mig.BANK_CUST_ARRANGE_INS_IND), '-') || ' | ' ||    
		-- COALESCE(char(mig.NONSCHEMA_SCHEMA), '-') || ' | ' ||             
		-- COALESCE(char(mig.INS_PREMIUM), '-') || ' | ' ||                  
		-- COALESCE(char(mig.INS_ISSUE_DATE), '-') || ' | ' ||               
		-- COALESCE(char(mig.AUTO_DEBIT), '-') || ' | ' ||                   
		-- COALESCE(char(mig.TAKAFUL_COMMISSION), '-') || ' | ' ||           
		-- COALESCE(char(mig.NEW_AMT_INSURED), '-') || ' | ' ||              
		-- COALESCE(char(mig.ENDORSEMENT_DATE), '-') || ' | ' ||             
		-- COALESCE(char(mig.BUILDING_OCCUPATION_CODE), '-') || ' | ' ||     
		-- COALESCE(char(mig.NATURE_OF_WORK), '-') || ' | ' ||               
		-- COALESCE(char(mig.TYPE_OF_BUILDING), '-') || ' | ' ||             
		-- COALESCE(char(mig.NUMBER_OF_STOREY), '-') || ' | ' ||             
		-- COALESCE(char(mig.WALL), '-') || ' | ' ||                         
		-- COALESCE(char(mig.EXTENSION_WALL), '-') || ' | ' ||               
		-- COALESCE(char(mig.ROOF), '-') || ' | ' ||                         
		-- COALESCE(char(mig.EXTENSION_ROOF), '-') || ' | ' ||               
		-- COALESCE(char(mig.ENDORSEMENT_CODE), '-') || ' | ' ||             
		-- COALESCE(char(mig.REMARK1), '-') || ' | ' ||                      
		-- COALESCE(char(mig.REMARK2), '-') || ' | ' ||                      
		-- COALESCE(char(mig.REMARK3), '-') || ' | ' ||                      
		-- COALESCE(char(mig.POLICY_CUSTODIAN_CODE), '-') || ' | ' ||        
		-- COALESCE(char(mig.INSURANCE_CLAIM_DATE), '-') || ' | ' ||         
		-- COALESCE(char(mig.INSURANCE_EXCHANGE_RATE), '-') || ' | ' ||      
		-- COALESCE(char(mig.TYPE_OF_FLOOR), '-') || ' | ' ||                
		-- COALESCE(char(mig.TYPE_OF_PERILS1), '-') || ' | ' ||              
		-- COALESCE(char(mig.TYPE_OF_PERILS2), '-') || ' | ' ||              
		-- COALESCE(char(mig.TYPE_OF_PERILS3), '-') || ' | ' ||              
		-- COALESCE(char(mig.TYPE_OF_PERILS4), '-') || ' | ' ||              
		-- COALESCE(char(mig.TYPE_OF_PERILS5), '-') || ' | ' ||              
		-- COALESCE(char(mig.DEBITING_ACC_NO), '-') || ' | ' ||     
		-- COALESCE(char(mig.ACC_TYPE_CODE), '-') || ' | ' ||   		
		-- 'T'
	-- , 'SIBS', 'CO016', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y'  
	-- FROM MIG_CO016_IN mig, MIG_CO019_PL pl 
	-- WHERE mig.SECURITY_ID = pl.SECURITY_ID
	-- AND mig.IS_VALID = 'Y');     
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||
			COALESCE(char(mig.SECURITY_ID), '' '') || '' | '' ||                  
			COALESCE(char(mig.POLICY_NUMBER), '' '') || '' | '' ||                
			COALESCE(char(mig.INSURER_NAME_CODE), '' '') || '' | '' ||            
			COALESCE(char(mig.INSURANCE_TYPE_CODE), '' '') || '' | '' ||          
			COALESCE(char(mig.INSURANCE_POLICY_CURRENCY), '' '') || '' | '' ||    
			COALESCE(char(mig.INSURED_AMT), '' '') || '' | '' ||                  
			COALESCE(char(REPLACE(FORMAT_DATE(mig.EFFECTIVE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||               
			COALESCE(char(REPLACE(FORMAT_DATE(mig.EXPIRY_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||                  
			COALESCE(char(mig.PROP_NO_COVER_NOTE_NUMBER), '' '') || '' | '' ||    
			COALESCE(char(mig.GROSS_PREMIUM), '' '') || '' | '' ||                
			COALESCE(char(mig.STAMP_DUTY), '' '') || '' | '' ||                   
			COALESCE(char(mig.NET_PREMIUM_PAY_TO_INS_COMP), '' '') || '' | '' ||  
			COALESCE(char(mig.NET_PREMIUM_PAY_BY_BORROWER), '' '') || '' | '' ||  
			COALESCE(char(mig.COMMISSION_EARNED), '' '') || '' | '' ||            
			COALESCE(char(mig.BANK_CUST_ARRANGE_INS_IND), '' '') || '' | '' ||    
			COALESCE(char(mig.NONSCHEMA_SCHEMA), '' '') || '' | '' ||             
			COALESCE(char(mig.INS_PREMIUM), '' '') || '' | '' ||                  
			COALESCE(char(REPLACE(FORMAT_DATE(mig.INS_ISSUE_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||               
			COALESCE(char(mig.AUTO_DEBIT), '' '') || '' | '' ||                   
			COALESCE(char(mig.TAKAFUL_COMMISSION), '' '') || '' | '' ||           
			COALESCE(char(mig.NEW_AMT_INSURED), '' '') || '' | '' ||              
			COALESCE(char(REPLACE(FORMAT_DATE(mig.ENDORSEMENT_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||             
			COALESCE(char(mig.BUILDING_OCCUPATION_CODE), '' '') || '' | '' ||     
			COALESCE(char(mig.NATURE_OF_WORK), '' '') || '' | '' ||               
			COALESCE(char(mig.TYPE_OF_BUILDING), '' '') || '' | '' ||             
			COALESCE(char(mig.NUMBER_OF_STOREY), '' '') || '' | '' ||             
			COALESCE(char(mig.WALL), '' '') || '' | '' ||                         
			COALESCE(char(mig.EXTENSION_WALL), '' '') || '' | '' ||               
			COALESCE(char(mig.ROOF), '' '') || '' | '' ||                         
			COALESCE(char(mig.EXTENSION_ROOF), '' '') || '' | '' ||               
			COALESCE(char(mig.ENDORSEMENT_CODE), '' '') || '' | '' ||             
			COALESCE(char(mig.REMARK1), '' '') || '' | '' ||                      
			COALESCE(char(mig.REMARK2), '' '') || '' | '' ||                      
			COALESCE(char(mig.REMARK3), '' '') || '' | '' ||                      
			COALESCE(char(mig.POLICY_CUSTODIAN_CODE), '' '') || '' | '' ||        
			COALESCE(char(REPLACE(FORMAT_DATE(mig.INSURANCE_CLAIM_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||         
			COALESCE(char(mig.INSURANCE_EXCHANGE_RATE), '' '') || '' | '' ||      
			COALESCE(char(mig.TYPE_OF_FLOOR), '' '') || '' | '' ||                
			COALESCE(char(mig.TYPE_OF_PERILS1), '' '') || '' | '' ||              
			COALESCE(char(mig.TYPE_OF_PERILS2), '' '') || '' | '' ||              
			COALESCE(char(mig.TYPE_OF_PERILS3), '' '') || '' | '' ||              
			COALESCE(char(mig.TYPE_OF_PERILS4), '' '') || '' | '' ||              
			COALESCE(char(mig.TYPE_OF_PERILS5), '' '') || '' | '' ||              
			COALESCE(char(mig.DEBITING_ACC_NO), '' '') || '' | '' ||     
			COALESCE(char(mig.ACC_TYPE_CODE), '' '') || '' | '' ||   
			COALESCE(char(mig.POLICY_SEQ_NO), '' '') || '' | '' ||   
			''T''
		, ''SIBS'', ''CO016'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''  
		FROM MIG_CO016_IN mig, MIG_CO019_PL pl 
		WHERE mig.SECURITY_ID = pl.SECURITY_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE, mig.POLICY_SEQ_NO) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO016', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO016' and FLAG = 'Y'), 'SIBS', 'CO016', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO016', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV032SIBS', 'SIBS', 'CO016', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO016', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO016', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO016' and FLAG = 'Y'), 'SIBS', 'CO016', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO016', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV032SIBS', 'SIBS', 'CO016', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO016', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO016', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO016' and FLAG = 'Y'), 'SIBS', 'CO016', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO016', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV032SIBS', 'SIBS', 'CO016', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO016', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO016', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO016' and FLAG = 'Y'), 'SIBS', 'CO016', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO016', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV032SIBS', 'SIBS', 'CO016', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO016', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO016', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO016' and FLAG = 'Y'), 'SIBS', 'CO016', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO016', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV032SIBS', 'SIBS', 'CO016', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO016', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO016', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO016' and FLAG = 'Y'), 'SIBS', 'CO016', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO016', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV032SIBS', 'SIBS', 'CO016', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO016', 'OTH', 'ISL');


-- CO017:CD
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.SECURITY_ID), '-') || ' | ' ||                
		-- COALESCE(char(mig.LIMIT_ID), '-') || ' | ' ||                   
		-- COALESCE(char(mig.APPLICATION_NO), '-') || ' | ' ||             
		-- COALESCE(char(mig.FACILITY_CODE), '-') || ' | ' ||              
		-- COALESCE(char(mig.FACILITY_SEQ), '-') || ' | ' ||               
		-- COALESCE(char(mig.RANKING_OF_SECURITY), '-') || ' | ' ||        
		-- COALESCE(char(mig.CHARGE_AMT), '-') || ' | ' ||                 
		-- COALESCE(char(mig.DATE_LEGALLY_CHARGE), '-') || ' | ' ||        
		-- COALESCE(char(mig.PRESENTATION_NO), '-') || ' | ' ||            
		-- COALESCE(char(mig.PRESENTATION_DATE), '-') || ' | ' ||          
		-- COALESCE(char(mig.FOLIO), '-') || ' | ' ||                      
		-- COALESCE(char(mig.JILID), '-') || ' | ' ||                      
		-- COALESCE(char(mig.FIRST_THIRD_PARTY_CHARGE), '-') || ' | ' ||   
		-- COALESCE(char(mig.CHARGE_TYPE_CODE), '-') || ' | ' ||           
		-- COALESCE(char(mig.NATURE_OF_CHARGE), '-') || ' | ' ||           
		-- COALESCE(char(mig.CHARGE_PENDING_REDEMPTION), '-') || ' | ' ||  
		-- COALESCE(char(mig.CHARGE_REGISTERED_DATE), '-') || ' | ' ||     
		-- COALESCE(char(mig.CAVEAT_WAIVED_IND), '-') || ' | ' ||		     
		-- 'T'
	-- , 'SIBS', 'CO017', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y'  
	-- FROM MIG_CO017_CD mig, MIG_CO019_PL pl 
	-- WHERE mig.SECURITY_ID = pl.SECURITY_ID
	-- AND mig.IS_VALID = 'Y');  
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 
			COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||
			COALESCE(char(mig.SECURITY_ID), '' '') || '' | '' ||                
			COALESCE(char(mig.LIMIT_ID), '' '') || '' | '' ||                   
			COALESCE(char(mig.APPLICATION_NO), '' '') || '' | '' ||             
			COALESCE(char(mig.FACILITY_CODE), '' '') || '' | '' ||              
			COALESCE(char(mig.FACILITY_SEQ), '' '') || '' | '' ||               
			COALESCE(char(mig.RANKING_OF_SECURITY), '' '') || '' | '' ||        
			COALESCE(char(mig.CHARGE_AMT), '' '') || '' | '' ||                 
			COALESCE(char(REPLACE(FORMAT_DATE(mig.DATE_LEGALLY_CHARGE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||         
			COALESCE(char(mig.PRESENTATION_NO), '' '') || '' | '' ||            
			COALESCE(char(REPLACE(FORMAT_DATE(mig.PRESENTATION_DATE, ''dd/mm/yyyy''),''/'','''')), '' '') || '' | '' ||          
			COALESCE(char(mig.FOLIO), '' '') || '' | '' ||                      
			COALESCE(char(mig.JILID), '' '') || '' | '' ||                      
			COALESCE(char(mig.FIRST_THIRD_PARTY_CHARGE), '' '') || '' | '' ||   
			COALESCE(char(mig.CHARGE_TYPE_CODE), '' '') || '' | '' ||           
			COALESCE(char(mig.NATURE_OF_CHARGE), '' '') || '' | '' ||           
			COALESCE(char(mig.CHARGE_PENDING_REDEMPTION), '' '') || '' | '' ||  
			COALESCE(char(mig.CAVEAT_WAIVED_IND), '' '') || '' | '' ||		     
			''T''
		, ''SIBS'', ''CO017'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''  
		FROM MIG_CO017_CD mig, MIG_CO019_PL pl 
		WHERE mig.SECURITY_ID = pl.SECURITY_ID
		AND mig.IS_VALID = ''Y''
		ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO017', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO017' and FLAG = 'Y'), 'SIBS', 'CO017', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO017', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV033SIBS', 'SIBS', 'CO017', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO017', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO017', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO017' and FLAG = 'Y'), 'SIBS', 'CO017', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO017', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV033SIBS', 'SIBS', 'CO017', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO017', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO017', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO017' and FLAG = 'Y'), 'SIBS', 'CO017', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO017', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV033SIBS', 'SIBS', 'CO017', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO017', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO017', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO017' and FLAG = 'Y'), 'SIBS', 'CO017', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO017', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV033SIBS', 'SIBS', 'CO017', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO017', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO017', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO017' and FLAG = 'Y'), 'SIBS', 'CO017', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO017', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV033SIBS', 'SIBS', 'CO017', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO017', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO017', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO017' and FLAG = 'Y'), 'SIBS', 'CO017', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO017', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV033SIBS', 'SIBS', 'CO017', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO017', 'OTH', 'ISL');


-- CO018:Pledgor
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(pl.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(pl.CUST_NAME_S), '-') || ' | ' || 
		-- COALESCE(char(pl.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(pl.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(pl.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.SECURITY_ID), '-') || ' | ' ||             
		-- COALESCE(char(mig.PLEDGOR_CIF_ID), '-') || ' | ' ||          
		-- COALESCE(char(mig.PLEDGOR_LEGAL_NAME), '-') || ' | ' ||      
		-- COALESCE(char(mig.REL_WITH_BORROWER_CODE), '-') || ' | ' ||  
		-- COALESCE(char(mig.REL_WITH_BORROWER_DESC), '-') || ' | ' ||
		-- 'T'
	-- , 'SIBS', 'CO018', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, 'Y'  
	-- FROM MIG_CO018_PG mig, MIG_CO019_PL pl 
	-- WHERE mig.SECURITY_ID = pl.SECURITY_ID
	-- AND mig.IS_VALID = 'Y');     
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
		COALESCE(char(pl.CIF_ID), '' '') || '' | '' ||       
		COALESCE(char(pl.CUST_NAME_S), '' '') || '' | '' || 
		COALESCE(char(pl.APPLICATION_NO), '' '') || '' | '' ||  
		COALESCE(char(pl.FACILITY_CODE), '' '') || '' | '' ||  
		COALESCE(char(pl.FACILITY_SEQUENCE), '' '') || '' | '' ||  
		COALESCE(char(pl.SECURITY_ID), '' '') || '' | '' ||  
		COALESCE(char(pl.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
		''D'' || '' | '' ||
		COALESCE(char(mig.SECURITY_ID), '' '') || '' | '' ||             
		COALESCE(char(mig.PLEDGOR_CIF_ID), '' '') || '' | '' ||          
		COALESCE(char(mig.PLEDGOR_LEGAL_NAME), '' '') || '' | '' ||      
		COALESCE(char(mig.REL_WITH_BORROWER_CODE), '' '') || '' | '' ||  
		COALESCE(char(mig.REL_WITH_BORROWER_DESC), '' '') || '' | '' ||
		''T''
	, ''SIBS'', ''CO018'', pl.APPLICATION_TYPE, pl.APPLICATION_LAW_TYPE, ''Y''  
	FROM MIG_CO018_PG mig, MIG_CO019_PL pl 
	WHERE mig.SECURITY_ID = pl.SECURITY_ID
	AND mig.IS_VALID = ''Y''
	ORDER BY CAST (pl.CIF_ID as BIGINT), CAST (pl.APPLICATION_NO as BIGINT), pl.FACILITY_CODE, pl.FACILITY_SEQUENCE, CAST (pl.SECURITY_ID as BIGINT), pl.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO018', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO018' and FLAG = 'Y'), 'SIBS', 'CO018', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO018', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV034SIBS', 'SIBS', 'CO018', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO018', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO018', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO018' and FLAG = 'Y'), 'SIBS', 'CO018', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO018', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV034SIBS', 'SIBS', 'CO018', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO018', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO018', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO018' and FLAG = 'Y'), 'SIBS', 'CO018', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO018', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV034SIBS', 'SIBS', 'CO018', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO018', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO018', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO018' and FLAG = 'Y'), 'SIBS', 'CO018', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO018', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV034SIBS', 'SIBS', 'CO018', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO018', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO018', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO018' and FLAG = 'Y'), 'SIBS', 'CO018', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO018', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV034SIBS', 'SIBS', 'CO018', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO018', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO018', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO018' and FLAG = 'Y'), 'SIBS', 'CO018', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO018', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV034SIBS', 'SIBS', 'CO018', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO018', 'OTH', 'ISL');


-- CO019:Pledge
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)
	-- (SELECT 'Valid_Detail', 
		-- COALESCE(char(mig.CIF_ID), '-') || ' | ' ||       
		-- COALESCE(char(mig.CUST_NAME_S), '-') || ' | ' || 
		-- COALESCE(char(mig.APPLICATION_NO), '-') || ' | ' ||  
		-- COALESCE(char(mig.FACILITY_CODE), '-') || ' | ' ||  
		-- COALESCE(char(mig.FACILITY_SEQUENCE), '-') || ' | ' ||  
		-- COALESCE(char(mig.SECURITY_ID), '-') || ' | ' ||  
		-- COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '-') || ' | ' ||  		
		-- 'D' || ' | ' ||
		-- COALESCE(char(mig.SECURITY_ID), '-') || ' | ' ||             
		-- COALESCE(char(mig.LIMIT_ID), '-') || ' | ' ||                
		-- COALESCE(char(mig.APPLICATION_NO), '-') || ' | ' ||          
		-- COALESCE(char(mig.FACILITY_CODE), '-') || ' | ' ||           
		-- COALESCE(char(mig.FACILITY_SEQUENCE), '-') || ' | ' ||       
		-- COALESCE(char(mig.AMOUNT_PLEDGED), '-') || ' | ' ||          
		-- COALESCE(char(mig.PERCENT_PLEDGED), '-') || ' | ' ||         
		-- COALESCE(char(mig.AMOUNT_DRAW), '-') || ' | ' ||             
		-- COALESCE(char(mig.PERCENT_DRAW), '-') || ' | ' ||  	           
		-- 'T' 		
	-- , 'SIBS', 'CO019', mig.APPLICATION_TYPE, mig.APPLICATION_LAW_TYPE, 'Y'  
	-- FROM MIG_CO019_PL mig
	-- WHERE mig.IS_VALID = 'Y');   
	
	Call SYSPROC.ADMIN_CMD('LOAD FROM 
	(SELECT ''Valid_Detail'', 
			COALESCE(char(mig.CIF_ID), '' '') || '' | '' ||       
			COALESCE(char(mig.CUST_NAME_S), '' '') || '' | '' || 
			COALESCE(char(mig.APPLICATION_NO), '' '') || '' | '' ||  
			COALESCE(char(mig.FACILITY_CODE), '' '') || '' | '' ||  
			COALESCE(char(mig.FACILITY_SEQUENCE), '' '') || '' | '' ||  
			COALESCE(char(mig.SECURITY_ID), '' '') || '' | '' ||  
			COALESCE(char(mig.SOURCE_SECURITY_SUB_TYPE), '' '') || '' | '' ||  		
			''D'' || '' | '' ||
			COALESCE(char(mig.SECURITY_ID), '' '') || '' | '' ||             
			COALESCE(char(mig.LIMIT_ID), '' '') || '' | '' ||                
			COALESCE(char(mig.APPLICATION_NO), '' '') || '' | '' ||          
			COALESCE(char(mig.FACILITY_CODE), '' '') || '' | '' ||           
			COALESCE(char(mig.FACILITY_SEQUENCE), '' '') || '' | '' ||       
			COALESCE(char(mig.AMOUNT_PLEDGED), '' '') || '' | '' ||          
			COALESCE(char(mig.PERCENT_PLEDGED), '' '') || '' | '' ||         
			COALESCE(char(mig.AMOUNT_DRAW), '' '') || '' | '' ||             
			COALESCE(char(mig.PERCENT_DRAW), '' '') || '' | '' ||  	           
			''T'' 		
		, ''SIBS'', ''CO019'', mig.APPLICATION_TYPE, mig.APPLICATION_LAW_TYPE, ''Y''  
		FROM MIG_CO019_PL mig
		WHERE mig.IS_VALID = ''Y''
		ORDER BY CAST (mig.CIF_ID as BIGINT), CAST (mig.APPLICATION_NO as BIGINT), mig.FACILITY_CODE, mig.FACILITY_SEQUENCE, CAST (mig.SECURITY_ID as BIGINT), mig.SOURCE_SECURITY_SUB_TYPE) OF CURSOR 
	INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2, FLAG)');		
	
commit;	

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO019', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO019' and FLAG = 'Y'), 'SIBS', 'CO019', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO019', 'HP', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV035SIBS', 'SIBS', 'CO019', 'HP', 'CON');	
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO019', 'HP', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO019', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO019' and FLAG = 'Y'), 'SIBS', 'CO019', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO019', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV035SIBS', 'SIBS', 'CO019', 'MO', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO019', 'MO', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO019', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'SF' and KEY_VALUE2 = 'CON' and INTERFACE_ID = 'CO019' and FLAG = 'Y'), 'SIBS', 'CO019', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO019', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV035SIBS', 'SIBS', 'CO019', 'SF', 'CON');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO019', 'SF', 'CON');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO019', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'HP' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO019' and FLAG = 'Y'), 'SIBS', 'CO019', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO019', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV035SIBS', 'SIBS', 'CO019', 'HP', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO019', 'HP', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO019', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'MO' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO019' and FLAG = 'Y'), 'SIBS', 'CO019', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO019', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV035SIBS', 'SIBS', 'CO019', 'MO', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO019', 'MO', 'ISL');

-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'CIF ID | Customer Short Name | ', 'SIBS', 'CO019', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Records Count(s): ' || (select char(COUNT(*)) from MIG_QC_REPORT where KEY_VALUE1 = 'OTH' and KEY_VALUE2 = 'ISL' and INTERFACE_ID = 'CO019' and FLAG = 'Y'), 'SIBS', 'CO019', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'SIBS', 'CO019', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'Report for migration template: CV035SIBS', 'SIBS', 'CO019', 'OTH', 'ISL');
-- INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID, KEY_VALUE1, KEY_VALUE2) VALUES ('Valid_Detail', 'QC Report 7 for Migration [Detail Records of Migrated Data]', 'SIBS', 'CO019', 'OTH', 'ISL');	