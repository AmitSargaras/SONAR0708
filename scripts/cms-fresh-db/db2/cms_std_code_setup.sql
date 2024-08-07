/********************************************
Common Code Category Setup
*********************************************/

/*************************
Category type: 1
**************************/

/**************************
Category Code: DDAP
Category Name: Dynamic DAP
***************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'DDAP', 'Dynamic DAP', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'RecurrentCheckList|list','BCA_ONLY','1',category_code, category_id from common_code_category where category_code = 'DDAP';
 
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'RecurrentReceipt|LIST','BCA_ONLY','1',category_code, category_id from common_code_category where category_code = 'DDAP';
 
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'Limits|prepare_update_limit','LIMIT','1',category_code, category_id from common_code_category where category_code = 'DDAP';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'CustomerProcess|editLimitProfile','LIMIT_PROFILE','1',category_code, category_id from common_code_category where category_code = 'DDAP';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'MILimit|prepare_update','LIMIT','1',category_code, category_id from common_code_category where category_code = 'DDAP';

/**************************
Category Code: 37
Category Name: System Code
***************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, '37', 'System Code', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'MIMB', 'Investment Banking', '1', 'MY', category_code, category_id from common_code_category where category_code = '37';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'ARBS', 'Core Banking System', '1', 'MY', category_code, category_id from common_code_category where category_code = '37';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'RLOS', 'Retail Loan Originating System', '1', 'MY', category_code, category_id from common_code_category where category_code = '37';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'SEMA', 'Credit Card System', '1', 'MY', category_code, category_id from common_code_category where category_code = '37';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'CLOS', 'Corporate Loan Originating System', '1', 'MY', category_code, category_id from common_code_category where category_code = '37';


/****************************
Category Code: 38
Category Name: Account Status
*****************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, '38', 'Account Status', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'N','New','1','38', category_id from common_code_category where category_code = '38';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'A','Active','1','38', category_id from common_code_category where category_code = '38';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'D','Dormant','1','38', category_id from common_code_category where category_code = '38';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'C','Close','1','38', category_id from common_code_category where category_code = '38';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'I','Inactive','1','38', category_id from common_code_category where category_code = '38';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'W','Watch','1','38', category_id from common_code_category where category_code = '38';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'X','De-link','1','38', category_id from common_code_category where category_code = '38';
	
/*******************************
Category Code: RATING_TYPE
Category Name: Rating Type
*******************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'RATING_TYPE', 'Rating Type', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'MOODY','Moody''s','1','RATING_TYPE', category_id from common_code_category where category_code = 'RATING_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'SP','S&P','1','RATING_TYPE', category_id from common_code_category where category_code = 'RATING_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'INT','Internal','1','RATING_TYPE', category_id from common_code_category where category_code = 'RATING_TYPE';

/*******************************************
Category Code: 54
Category Name: Security Subtype
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, '54', 'Security Subtype', 1, 'A'); 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'AB100', 'General Charge', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'AB101', 'Specific Charge - Plant & Equipment', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'AB102', 'Specific Charge - Vehicles/Floor Stocking', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'AB103', 'Specific Charge - Others', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'AB106', 'Receivables Assigned - Specific Invoices Not Via Agent', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'AB107', 'Receivables Assigned - Open', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'AB108', 'Post-Dated Cheques', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'AB109', 'Aircraft', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'AB110', 'Specific Charge - Gold', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'AB111', 'Vessel', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'CS200', 'Cash', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'CS202', 'Fixed Deposit', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'CS203', 'Repo', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'DC300', 'FX/Derivative - ISDA/IFEMA', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'DC301', 'FX/Derivative - Netting Agreement', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'DC302', 'Credit Agreement', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'DC303', 'Letter of Undertaking', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'DC304', 'Letter of Comfort', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'DC305', 'Negative Pledge', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'DC306', 'Deed of Subordination', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'DC307', 'Letter of Indemnity', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'DC308', 'Deed of Assignments', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'DC309', 'Lease Agreement', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'DC310', 'Letter of Awareness', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'GT400', 'Bank', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'GT402', 'Standby LC', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'GT405', 'Corporate', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'GT406', 'Government', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'GT407', 'Inter-branch Indemnity', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'GT408', 'Individual', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'GT409', 'Government - Linked (CGC)', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'GT410', 'Bank/Insurance Co - Inward LC', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'GT411', 'Government - State Government', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'GT412', 'Government - Local Government', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'GT413', 'Government - Statutory Authorities', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'GT414', 'Government - Federal Government', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'IN500', 'Credit Insurance', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'IN501', 'Life Insurance', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'IN502', 'Credit Derivatives', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'IN503', 'Credit Default Swaps', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'MS600', 'Main Index - Local', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'MS601', 'Main Index - Foreign', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'MS602', 'Government Local / Treasury Bills', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'MS603', 'Government Foreign', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'MS605', 'Other Listed - Local', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'MS606', 'Other Listed - Foreign', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'MS607', 'Non - Listed - Local', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'MS610', 'Bonds - Local', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'MS611', 'Bonds - Foreign', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'OT900', 'All Others', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'PT700', 'Agricultural', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'PT701', 'Commercial', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'PT703', 'Industrial', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'PT704', 'Residential', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'PT706', 'Special Purpose - Hotel', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'PT707', 'Vacant Land', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'PT708', 'Mining', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'PT709', 'Special Purpose - Land with Restriction on Transactions/Others', '1', '54', category_id from common_code_category where category_code = '54';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'CL001', 'No Collateral', '1', '54', category_id from common_code_category where category_code = '54';

update common_code_category_entry
set REF_ENTRY_CODE=substr(ENTRY_CODE,1,2)
where category_code = '54';

update common_code_category_entry c
set active_status = '0'
where not exists (select 1
	from common_code_category_entry ccce
	where ccce.ref_entry_code = c.entry_code
	and ccce.category_code = 'SOURCE_CMS_SEC_TYPE_MAP')
and c.category_code = '54';

/*******************************************
Category Code: 31
Category Name: Security Subtype
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, '31', 'Security Type', 1, 'A'); 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'AB', 'Asset Based', '1', '31', category_id from common_code_category where category_code = '31';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'CL', 'No Collateral', '1', '31', category_id from common_code_category where category_code = '31';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'CS', 'Cash', '1', '31', category_id from common_code_category where category_code = '31';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'DC', 'Documentation', '1', '31', category_id from common_code_category where category_code = '31';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'GT', 'Guarantees', '1', '31', category_id from common_code_category where category_code = '31';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'IN', 'Insurance', '1', '31', category_id from common_code_category where category_code = '31';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'MS', 'Marketable Securities', '1', '31', category_id from common_code_category where category_code = '31';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'OT', 'Others', '1', '31', category_id from common_code_category where category_code = '31';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'PT', 'Property', '1', '31', category_id from common_code_category where category_code = '31';

/*******************************************
Category Code: AA_STATUS
Category Name: AA Status
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'AA_STATUS', 'AA Status', 1, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'APPROVED', 'Approved', category_id, 'AA_STATUS', '1' from common_code_category where category_code = 'AA_STATUS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'DELETED', 'Deleted', category_id, 'AA_STATUS', '1' from common_code_category where category_code = 'AA_STATUS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'DISBURSED', 'Disbursed', category_id, 'AA_STATUS', '1' from common_code_category where category_code = 'AA_STATUS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NEW', 'Fresh', category_id, 'AA_STATUS', '1' from common_code_category where category_code = 'AA_STATUS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'RENEWAL', 'Renewal', category_id, 'AA_STATUS', '1' from common_code_category where category_code = 'AA_STATUS';


/**************************
Category Code: CHARGE_TYPE
Category Name: Charge Type
***************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'CHARGE_TYPE', 'Category of Land Use', 1, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'G', 'General', category_id, 'CHARGE_TYPE', '1' from common_code_category where category_code = 'CHARGE_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'S', 'Specific', category_id, 'CHARGE_TYPE', '1' from common_code_category where category_code = 'CHARGE_TYPE';


/*******************************************
Category Code: VALUATION_TYPE
Category Name: Valuation Type
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'VALUATION_TYPE', 'Valuation Type', 1, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'B', 'Branch', category_id, 'VALUATION_TYPE', '1' from common_code_category where category_code = 'VALUATION_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'F', 'Formal', category_id, 'VALUATION_TYPE', '1' from common_code_category where category_code = 'VALUATION_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'A', 'Appraised', category_id, 'VALUATION_TYPE', '1' from common_code_category where category_code = 'VALUATION_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'V', 'Verbal', category_id, 'VALUATION_TYPE', '1' from common_code_category where category_code = 'VALUATION_TYPE';

/************************************
Category Code: BOARD_TYPE
Category Name: Board Type
*************************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'BOARD_TYPE', 'Board Type', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, country, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, '001', 'KLCI Component Stock', 'KLS', 'MY', '1', category_code, category_id from common_code_category where category_code = 'BOARD_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, country, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, '002', 'Main Board (excluding KLCI Component Stock)', 'KLS', 'MY', '1', category_code, category_id from common_code_category where category_code = 'BOARD_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, country, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, '003', 'Second Board', 'KLS', 'MY', '1', category_code, category_id from common_code_category where category_code = 'BOARD_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, country, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, '004', 'MESDAQ', 'KLS', 'MY', '1', category_code, category_id from common_code_category where category_code = 'BOARD_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, country, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, '005', 'Main Board (excluding STI Component Stock)', 'SES', 'SG', '1', category_code, category_id from common_code_category where category_code = 'BOARD_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, country, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, '006', 'SESDAQ', 'SES', 'SG', '1', category_code, category_id from common_code_category where category_code = 'BOARD_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, country, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, '007', 'STI Component Stock', 'SES', 'SG', '1', category_code, category_id from common_code_category where category_code = 'BOARD_TYPE';

/************************************
Category Code: SHARE_STATUS
Category Name: Share Status
*************************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'SHARE_STATUS', 'Share Status', 1, 'A');

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, CATEGORY_CODE_ID , REF_ENTRY_CODE, COUNTRY) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1', 'Normal', '1', CATEGORY_CODE, CATEGORY_ID , 'KLS', 'MY' FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'SHARE_STATUS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, CATEGORY_CODE_ID , REF_ENTRY_CODE, COUNTRY) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '2', 'PN4', '1', CATEGORY_CODE, CATEGORY_ID , 'KLS', 'MY' FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'SHARE_STATUS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, CATEGORY_CODE_ID , REF_ENTRY_CODE, COUNTRY) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '3', 'PN17', '1', CATEGORY_CODE, CATEGORY_ID , 'KLS', 'MY' FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'SHARE_STATUS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, CATEGORY_CODE_ID , REF_ENTRY_CODE, COUNTRY ) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '4', 'Designated', '1', CATEGORY_CODE, CATEGORY_ID , 'KLS', 'MY' FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'SHARE_STATUS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, CATEGORY_CODE_ID , REF_ENTRY_CODE, COUNTRY) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '5', 'Others', '1', CATEGORY_CODE, CATEGORY_ID , 'KLS', 'MY' FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'SHARE_STATUS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, CATEGORY_CODE_ID , REF_ENTRY_CODE, COUNTRY) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '6', 'Suspended (Internal Suspension)', '1', CATEGORY_CODE, CATEGORY_ID , 'KLS', 'MY' FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'SHARE_STATUS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, CATEGORY_CODE_ID , REF_ENTRY_CODE, COUNTRY) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '7', 'Suspended (Stock Exchange Suspension)', '1', CATEGORY_CODE, CATEGORY_ID , 'KLS', 'MY' FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'SHARE_STATUS';


/************************************
Category Code: SHARE_TYPE
Category Name: Share Type
*************************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'SHARE_TYPE', 'Share Type', 1, 'A'); 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, ref_entry_code, category_code, category_code_id) select next value for common_code_category_entry_seq, '001', 'Normal Shares', '1', 'STOCK_TYPE', category_code, category_id from common_code_category where category_code = 'SHARE_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, ref_entry_code, category_code, category_code_id) select next value for common_code_category_entry_seq, '002', 'Warrants', '1', 'STOCK_TYPE', category_code, category_id from common_code_category where category_code = 'SHARE_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, ref_entry_code, category_code, category_code_id) select next value for common_code_category_entry_seq, '003', 'Loan Stocks', '1', 'STOCK_TYPE', category_code, category_id from common_code_category where category_code = 'SHARE_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, '005', 'Bonds', '1', category_code, category_id from common_code_category where category_code = 'SHARE_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, '006', 'Unit Trust', '1', category_code, category_id from common_code_category where category_code = 'SHARE_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, '007', 'TSR (Transferable Subscription Rights)', '1', category_code, category_id from common_code_category where category_code = 'SHARE_TYPE';


/*****************************
Category Code: 18
Category Name: Credit Risk Grade Type
******************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, '18', 'Credit Risk Grade Type', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'C', 'Credit Rating', '1', category_code, category_id from common_code_category where category_code = '18';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'D', 'Deposit Rating', '1', category_code, category_id from common_code_category where category_code = '18';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'O', 'Overall Rating', '1', category_code, category_id from common_code_category where category_code = '18';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'S', 'SEMA Rating', '1', category_code, category_id from common_code_category where category_code = '18';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'F', 'Fitch', '1', category_code, category_id from common_code_category where category_code = '18';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'M', 'MARC', '1', category_code, category_id from common_code_category where category_code = '18';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'R', 'RAM', '1', category_code, category_id from common_code_category where category_code = '18';

/****************************************************
Category Code: LE_ID_TYPE 
Category Name: Source system relating to LE ID Type
*****************************************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'LE_ID_TYPE', 'Source system relating to LE ID Type', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq,'ARBS','CIF','1','LE_ID_TYPE', 'MY', category_id from common_code_category where category_code = 'LE_ID_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq,'SEMA','SEMA','1','LE_ID_TYPE', 'MY', category_id from common_code_category where category_code = 'LE_ID_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq,'FINS','FINSYS','1','LE_ID_TYPE', 'MY', category_id from common_code_category where category_code = 'LE_ID_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq,'BOST','BOS-TRACS','1','LE_ID_TYPE', 'MY', category_id from common_code_category where category_code = 'LE_ID_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq,'QUAN','MUREX','1','LE_ID_TYPE', 'MY', category_id from common_code_category where category_code = 'LE_ID_TYPE';


/****************************************************
Category Code: ACCT_SOURCE
Category Name: Source system relating to Account
*****************************************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'ACCT_SOURCE', 'Source system relating to Account', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq,'ARBS','Bank','1','ACCT_SOURCE', 'MY', category_id from common_code_category where category_code = 'ACCT_SOURCE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq,'QUAN','Treasury','1','ACCT_SOURCE', 'MY', category_id from common_code_category where category_code = 'ACCT_SOURCE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq,'TSPR','Trade Finance','1','ACCT_SOURCE', 'MY', category_id from common_code_category where category_code = 'ACCT_SOURCE';    

/****************************************************
Category Code: PREDEAL_SOURCE
Category Name: Source system relating to Pre-Deal
*****************************************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'PREDEAL_SOURCE', 'Source system relating to Pre-Deal', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq,'ARBS','ARBS','1','PREDEAL_SOURCE', 'MY', category_id from common_code_category where category_code = 'PREDEAL_SOURCE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq,'STBG','Stock Banking','1','PREDEAL_SOURCE', 'MY', category_id from common_code_category where category_code = 'PREDEAL_SOURCE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq,'BOST','BOS-TRACS','1','PREDEAL_SOURCE', 'MY', category_id from common_code_category where category_code = 'PREDEAL_SOURCE';


/****************************************************
Category Code: OMV_TYPE
Category Name: OMV Type
*****************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
 values
 (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'OMV_TYPE', 'OMV Type', 1, 'A'); 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'INC','Increase','1','OMV_TYPE', category_id from common_code_category where category_code = 'OMV_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'RED','Reduce','1','OMV_TYPE', category_id from common_code_category where category_code = 'OMV_TYPE';
   

/****************************************************
Category Code: TRANSMISSION_TYPE
Category Name: Transmission Type
*****************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
 values
 (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'TRANSMISSION_TYPE', 'Transmission Type', 1, 'A'); 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'A','Auto','1','TRANSMISSION_TYPE', category_id from common_code_category where category_code = 'TRANSMISSION_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'M','Manual','1','TRANSMISSION_TYPE', category_id from common_code_category where category_code = 'TRANSMISSION_TYPE';


/*******************************************
Category Code: PROPERTY_COMPLETION_STATUS
Category Name: Property Completion Status
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'PROPERTY_COMPLETION_STATUS', 'Property Completion Status', 1, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'Y', 'Yes', category_id, 'PROPERTY_COMPLETION_STATUS', '1' from common_code_category where category_code = 'PROPERTY_COMPLETION_STATUS';
--Chee Hong @ 29 Sept 2010 ~ Dropped 'W' as it's not in use in GLOS and ARBS.
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'W', 'Yes ( without CoF issuance )', category_id, 'PROPERTY_COMPLETION_STATUS', '1' from common_code_category where category_code = 'PROPERTY_COMPLETION_STATUS';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'N', 'No', category_id, 'PROPERTY_COMPLETION_STATUS', '1'from common_code_category where category_code = 'PROPERTY_COMPLETION_STATUS';

/**********************************************************************************
Category Code: INSURANCE
Category Name: Insurance Type for Insurance Security
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'INSURANCE', 'Insurance Type for Insurance Security', 1, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, REF_ENTRY_CODE) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'INS01', 'Credit Insurance', category_id, 'INSURANCE', '1', 'IN500'  from common_code_category where category_code = 'INSURANCE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, REF_ENTRY_CODE) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'INS02', 'Political Risk Insurance', category_id, 'INSURANCE', '1', 'IN500'  from common_code_category where category_code = 'INSURANCE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, REF_ENTRY_CODE) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'INS03', 'Trade Credit Insurance', category_id, 'INSURANCE', '1', 'IN500'  from common_code_category where category_code = 'INSURANCE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, REF_ENTRY_CODE) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'INS04', 'Life Insurance', category_id, 'INSURANCE', '1', 'IN501'  from common_code_category where category_code = 'INSURANCE';


/*********************************
Category Code: 28
Category Name: Limit Tenor
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, '28', 'Limit Tenor', 1, 'A');

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'Y', 'Year(s)', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='28';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'M', 'Month(s)', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='28';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'D', 'Day(s)', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='28';

/*******************************************
Category Code: TITLE_TYPE
Category Name: Title Type
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'TITLE_TYPE', 'Title Type', 1, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1', 'Master', category_id, 'TITLE_TYPE', '1' from common_code_category where category_code = 'TITLE_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '2', 'Strata', category_id, 'TITLE_TYPE', '1' from common_code_category where category_code = 'TITLE_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '3', 'Individual', category_id, 'TITLE_TYPE', '1' from common_code_category where category_code = 'TITLE_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '4', 'Alienated', category_id, 'TITLE_TYPE', '1' from common_code_category where category_code = 'TITLE_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '5', 'Others', category_id, 'TITLE_TYPE', '1' from common_code_category where category_code = 'TITLE_TYPE';


/****************************************************
Category Code: SEC_SOURCE 
Category Name: Source system relating to security
*****************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
 values
 (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'SEC_SOURCE', 'Source system relating to security', 1, 'A'); 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'CLMS','CLIMS','1','SEC_SOURCE', category_id from common_code_category where category_code = 'SEC_SOURCE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'ARBS','ARBS','1','SEC_SOURCE', category_id from common_code_category where category_code = 'SEC_SOURCE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'TSPR','Trade Finance','1','SEC_SOURCE', category_id from common_code_category where category_code = 'SEC_SOURCE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'STBG','Stock Banking','1','SEC_SOURCE', category_id from common_code_category where category_code = 'SEC_SOURCE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'BOST','BOS-TRACS','1','SEC_SOURCE', category_id from common_code_category where category_code = 'SEC_SOURCE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'SEMA','SEMA','1','SEC_SOURCE', category_id from common_code_category where category_code = 'SEC_SOURCE';
  
/****************************************************
Category Code: ACTION_PARTY 
Category Name: Action Party
*****************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
 values
 (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'ACTION_PARTY', 'Action Party', 1, 'A'); 

insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, country, category_code, category_code_id)  select next value for common_code_category_entry_seq, 'APA', 'Approving Authority', '', '1', 'MY', category_code, category_id from common_code_category where category_code = 'ACTION_PARTY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, country, category_code, category_code_id)  select next value for common_code_category_entry_seq, 'CSA', 'CSA', '', '1', 'MY', category_code, category_id from common_code_category where category_code = 'ACTION_PARTY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, country, category_code, category_code_id)  select next value for common_code_category_entry_seq, 'BRH', 'Branch', '', '1', 'MY', category_code, category_id from common_code_category where category_code = 'ACTION_PARTY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, country, category_code, category_code_id)  select next value for common_code_category_entry_seq, 'CUS', 'Customer', '', '1', 'MY', category_code, category_id from common_code_category where category_code = 'ACTION_PARTY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, country, category_code, category_code_id)  select next value for common_code_category_entry_seq, 'DEA', 'Dealer', '', '1', 'MY', category_code, category_id from common_code_category where category_code = 'ACTION_PARTY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, country, category_code, category_code_id)  select next value for common_code_category_entry_seq, 'INS', 'Insurer', '', '1', 'MY', category_code, category_id from common_code_category where category_code = 'ACTION_PARTY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, country, category_code, category_code_id)  select next value for common_code_category_entry_seq, 'VAL', 'Valuer', '', '1', 'MY', category_code, category_id from common_code_category where category_code = 'ACTION_PARTY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, country, category_code, category_code_id)  select next value for common_code_category_entry_seq, 'LAW', 'Lawyer', '', '1', 'MY', category_code, category_id from common_code_category where category_code = 'ACTION_PARTY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, country, category_code, category_code_id)  select next value for common_code_category_entry_seq, 'CPH', 'CPH', '', '1', 'MY', category_code, category_id from common_code_category where category_code = 'ACTION_PARTY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, country, category_code, category_code_id)  select next value for common_code_category_entry_seq, 'CUD', 'Custodian', '', '1', 'MY', category_code, category_id from common_code_category where category_code = 'ACTION_PARTY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, country, category_code, category_code_id)  select next value for common_code_category_entry_seq, 'BZU', 'Business Units', '', '1', 'MY', category_code, category_id from common_code_category where category_code = 'ACTION_PARTY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, country, category_code, category_code_id)  select next value for common_code_category_entry_seq, 'UWO', 'Underwriting Office', '', '1', 'MY', category_code, category_id from common_code_category where category_code = 'ACTION_PARTY';


/****************************************************
Category Code: PROP_VAL_PERIOD 
Category Name: Annual/Quarter
*****************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
 values
 (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'PROP_VAL_PERIOD', 'Annual/Quarter', 1, 'A'); 
 
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'A', 'Annual', '1', category_code, category_id from common_code_category where category_code = 'PROP_VAL_PERIOD';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'Q1', 'Quarter 1', '1', category_code, category_id from common_code_category where category_code = 'PROP_VAL_PERIOD';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'Q2', 'Quarter 2', '1', category_code, category_id from common_code_category where category_code = 'PROP_VAL_PERIOD';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'Q3', 'Quarter 3', '1', category_code, category_id from common_code_category where category_code = 'PROP_VAL_PERIOD';

/****************************************************
Category Code: ACTION_PARTY 
Category Name: Action Party
*****************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
 values
 (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'ASSESSMENT_PERIOD', 'Assessment Period', 1, 'A'); 
 
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, '1H', '1H', '1', category_code, category_id from common_code_category where category_code = 'ASSESSMENT_PERIOD';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, '2H', '2H', '1', category_code, category_id from common_code_category where category_code = 'ASSESSMENT_PERIOD';

/****************************************************
Category Code: COMPLETION_STAGE 
Category Name: Completion Stage
*****************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
 values
 (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'COMPLETION_STAGE', 'Completion Stage', 1, 'A'); 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, '1', '>=80%', '1', category_code, category_id from common_code_category where category_code = 'COMPLETION_STAGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, '2', '50% to <80%', '1', category_code, category_id from common_code_category where category_code = 'COMPLETION_STAGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, '3', '<50%', '1', category_code, category_id from common_code_category where category_code = 'COMPLETION_STAGE';


/****************************************************
Category Code: COMPLETION_STAGE 
Category Name: Completion Stage
*****************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
 values
 (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'LOT_NO', 'Lot No', 1, 'A'); 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'PT', 'PT', '1', category_code, category_id from common_code_category where category_code = 'LOT_NO';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'LOT', 'LOT', '1', category_code, category_id from common_code_category where category_code = 'LOT_NO';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'SECTION', 'SECTION', '1', category_code, category_id from common_code_category where category_code = 'LOT_NO';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'TBO', 'To Be Obtained', '1', category_code, category_id from common_code_category where category_code = 'LOT_NO';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'PTD', 'PTD', '1', category_code, category_id from common_code_category where category_code = 'LOT_NO';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'PTB', 'PTB', '1', category_code, category_id from common_code_category where category_code = 'LOT_NO';

/****************************************************
Category Code: PBR_PBT_IND 
Category Name: PBR PBT Indicator
*****************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
 values
 (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'PBR_PBT_IND', 'PBR PBT Indicator', 1, 'A'); 
 
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'PBR', 'PBR', '1', category_code, category_id from common_code_category where category_code = 'PBR_PBT_IND';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'PBT', 'PBT', '1', category_code, category_id from common_code_category where category_code = 'PBR_PBT_IND';
insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'NA', 'NA', '1', category_code, category_id from common_code_category where category_code = 'PBR_PBT_IND';


/****************************************************
Category Code: TITLE_NUMBER 
Category Name: Title Number
*****************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
 values
 (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'TITLE_NUMBER', 'Title Number', 1, 'A'); 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'HSD', 'HSD', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'HSM', 'HSM', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'GN', 'GN', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'GM', 'GM', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'SCL', 'SCL', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'PN', 'Pajakan Negeri', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'PM', 'Pajakan Mukim', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'O', 'Others', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'GERAN', 'Geran', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'CT', 'CT', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'SL', 'SL', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'QTR', 'QTR', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'EMR', 'EMR', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'QTM', 'QTM', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'MCL', 'MCL', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'TL', 'TL', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'PL', 'PL', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'NL', 'NL', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'FR', 'FR', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'CL', 'CL', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'ST', 'ST', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'PSL', 'PSL', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'GS', 'GS', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'RGB', 'RGRCB', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'RGP', 'RGRCP', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'RG', 'RGRC', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'CG', 'CGRC', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'SQL', 'SQL', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'LSLS', 'LSLS', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'QT', 'QT', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'STL', 'A(LCGS)', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'CTL', '(LCGS)A', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'AAS', 'AA(LCGAS)', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'AAC', 'AA(LCGAC)', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'FRS', 'FORMB (LCLS)', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'FRC', 'FORMB (LDLC)', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'CLS', 'CLCPLS', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'CLC', 'CLCPLC', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'CDT', 'CDT', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'SLF', 'SLF', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'MCL', 'MCL', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'ML', 'ML', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'LT', 'LT', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'TBO', 'To Be Obtained', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,  category_code, category_code_id) select next value for common_code_category_entry_seq, 'PGN', 'Pegangan No.', '1', category_code, category_id from common_code_category where category_code = 'TITLE_NUMBER';

/**************************
Category Code: APPLICATION_CODE
Category Name: Loan Application Code
***************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values (next value for common_code_category_seq, 'APPLICATION_CODE', 'Loan Application Code', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'MO', 'Mortgage', '1', category_code, category_id from common_code_category where category_code = 'APPLICATION_CODE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'HP', 'Hire Purchase', '1', category_code, category_id from common_code_category where category_code = 'APPLICATION_CODE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'ALL', 'All', '1', category_code, category_id from common_code_category where category_code = 'APPLICATION_CODE';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, '3P', '3P', '1', category_code, category_id from common_code_category where category_code = 'APPLICATION_CODE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'AR', 'Ar-Rahnu', '1', category_code, category_id from common_code_category where category_code = 'APPLICATION_CODE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'GR', 'Gratuity', '1', category_code, category_id from common_code_category where category_code = 'APPLICATION_CODE';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'CHP', 'Corporate Hire Purchase', '1', category_code, category_id from common_code_category where category_code = 'APPLICATION_CODE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'CO', 'Corporate', '1', category_code, category_id from common_code_category where category_code = 'APPLICATION_CODE';


/**************************************
Category Code: APPLICATION_CODE_CC
Category Name: CC Loan Application Code
***************************************/

insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values (next value for common_code_category_seq, 'APPLICATION_CODE_CC', 'CC Loan Application Code', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq, 'HP', 'HP', '1', category_code, category_id from common_code_category where category_code = 'APPLICATION_CODE_CC';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq, 'NHP', 'Non-H', '1', category_code, category_id from common_code_category where category_code = 'APPLICATION_CODE_CC';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq, 'ALL', 'All', '1', category_code, category_id from common_code_category where category_code = 'APPLICATION_CODE_CC';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'CHP', 'Corporate Hire Purchase', '1', category_code, category_id from common_code_category where category_code = 'APPLICATION_CODE_CC';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'CO', 'Corporate', '1', category_code, category_id from common_code_category where category_code = 'APPLICATION_CODE_CC';


/**************************
Category Code: COL_STATUS
Category Name: Collateral Status
***************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'COL_STATUS', 'Collateral Status', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'1','Active','1',category_code, category_id from common_code_category where category_code = 'COL_STATUS';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'3','Released','1',category_code, category_id from common_code_category where category_code = 'COL_STATUS';


/**************************
Category Code: DDAP
Category Name: Dynamic DAP
***************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'DDAP', 'Dynamic DAP', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'RecurrentCheckList|list','BCA_ONLY','1',category_code, category_id from common_code_category where category_code = 'DDAP';
 
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'RecurrentReceipt|LIST','BCA_ONLY','1',category_code, category_id from common_code_category where category_code = 'DDAP';
 
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'Limits|prepare_update_limit','LIMIT','1',category_code, category_id from common_code_category where category_code = 'DDAP';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'CustomerProcess|editLimitProfile','LIMIT_PROFILE','1',category_code, category_id from common_code_category where category_code = 'DDAP';


/**************************************
Category Code: SEC_SUBTYP
Category Name: Security SubType - Auto Spawning
**************************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'SEC_SUBTYP', 'Security SubType - Auto Spawning', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'GT411','GT406','1',category_code, category_id 
from common_code_category where category_code = 'SEC_SUBTYP';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'GT412','GT406','1',category_code, category_id 
from common_code_category where category_code = 'SEC_SUBTYP';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'GT413','GT406','1',category_code, category_id 
from common_code_category where category_code = 'SEC_SUBTYP';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'GT414','GT409','1',category_code, category_id 
from common_code_category where category_code = 'SEC_SUBTYP';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'DC310','DC304','1',category_code, category_id 
from common_code_category where category_code = 'SEC_SUBTYP';


/**********************************************************************************
Category Code: FREQ_TYPE
Category Name: Frequency Type List
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'FREQ_TYPE', 'Frequency Type List', 1, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'D', 'Day(s)', category_id, 'FREQ_TYPE', '1' from common_code_category where category_code = 'FREQ_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'M', 'Month(s)', category_id, 'FREQ_TYPE', '1' from common_code_category where category_code = 'FREQ_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'W', 'Week(s)', category_id, 'FREQ_TYPE', '1' from common_code_category where category_code = 'FREQ_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'Y', 'Year(s)', category_id, 'FREQ_TYPE', '1' from common_code_category where category_code = 'FREQ_TYPE';


/***********************************
Category Code: TIME_FREQ
Category Name: Time Frequency
***********************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values                                                                   
(next value for common_code_category_seq, 'TIME_FREQ', 'Time Frequency', 2, 'A');

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1', 'Day(s)', category_id, category_code, '1' from common_code_category where category_code = 'TIME_FREQ';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '2', 'Week(s)', category_id, category_code, '1' from common_code_category where category_code = 'TIME_FREQ';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '3', 'Month(s)', category_id, category_code, '1' from common_code_category where category_code = 'TIME_FREQ';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '4', 'Year(s)', category_id, category_code, '1' from common_code_category where category_code = 'TIME_FREQ';


/************************************
Category Code: BANK_ENTITY
Category Name: Bank Entity - Policy Cap
*************************************/
insert into common_code_category
(category_id, category_code, category_name, category_type, active_status)
values 
(next value for common_code_category_seq, 'BANK_ENTITY', 'Bank Entity - Policy Cap', 1, 'A');



/*******************************************
Category Code: BANK_ENTITY_GROUP
Category Name: Bank Entity Group - Policy Cap
********************************************/
insert into common_code_category
(category_id, category_code, category_name, category_type, active_status)
values 
(next value for common_code_category_seq, 'BANK_ENTITY_GROUP', 'Bank Entity Group - Policy Cap', 1, 'A');

insert into common_code_category_entry 
(entry_id, entry_code, entry_name,  active_status, 
category_code,category_code_id) 
select next value for common_code_category_entry_seq, '001','Bank Group', '1',
'BANK_ENTITY_GROUP', category_id from common_code_category where category_code = 'BANK_ENTITY_GROUP';

/*******************************************
Category Code: 15
Category Name: ISIC Type
********************************************/
insert into common_code_category
(category_id, category_code, category_name, category_type, active_status)
values (next value for common_code_category_seq, '15' , 'ISIC Type', 1, 'A');

insert into common_code_category_entry
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id, country)
(select (next value for common_code_category_entry_seq), 'ISIC', 'ISIC', '1', '15',
 category_id, 'MY' from common_code_category where category_code = '15');

/*******************************************
Category Code: PROP_IDX_PERIOD
Category Name: Property Index - Valuation Period
********************************************/ 
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values(next value for common_code_category_seq, 'PROP_IDX_PERIOD', 'Property Index - Valuation Period', 1, 'A');


insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq,'ANNUAL','Annual','1','PROP_IDX_PERIOD', category_id 
from common_code_category where category_code = 'PROP_IDX_PERIOD';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code,  category_code_id) 
select next value for common_code_category_entry_seq,'QUARTER_ONE','Quarter 1','1','PROP_IDX_PERIOD',  category_id 
from common_code_category where category_code = 'PROP_IDX_PERIOD';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq,'QUARTER_TWO','Quarter 2','1','PROP_IDX_PERIOD',  category_id 
from common_code_category where category_code = 'PROP_IDX_PERIOD';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq,'QUARTER_THREE','Quarter 3','1','PROP_IDX_PERIOD',  category_id 
from common_code_category where category_code = 'PROP_IDX_PERIOD';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code,  category_code_id) 
select next value for common_code_category_entry_seq,'QUARTER_FOUR','Quarter 4','1','PROP_IDX_PERIOD', category_id 
from common_code_category where category_code = 'PROP_IDX_PERIOD';
 
/**********************************
Category Code: APP_LAW
Category Name: Applicable Law
***********************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'APP_LAW', 'Applicable Law', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq,'CON','CONVENTIONAL','1',category_code, category_id from common_code_category where category_code = 'APP_LAW';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq,'ISL','ISLAMIC','1',category_code, category_id from common_code_category where category_code = 'APP_LAW';


/**********************************
Category Code: COUNTRY_LAW_MAP
Category Name: Country Law Mapping
***********************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'COUNTRY_LAW_MAP', 'Country Law Mapping', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq,'MY','ISL','1',category_code, category_id from common_code_category where category_code = 'COUNTRY_LAW_MAP';
 
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq,'MY','CON','1',category_code, category_id from common_code_category where category_code = 'COUNTRY_LAW_MAP';
 

/***********************************************************************
Category Code: PROPERTY_USAGE
Category Name: Property Usage
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'PROPERTY_USAGE', 'Property Usage', 1, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'O01', 'OWNER OCCUPIED', category_id, category_code, '1' from common_code_category where category_code = 'PROPERTY_USAGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'O02', 'OWNER OCCUPIED & INVESTMENT', category_id, category_code, '1' from common_code_category where category_code = 'PROPERTY_USAGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'O03', 'INVESTMENT', category_id, category_code, '1' from common_code_category where category_code = 'PROPERTY_USAGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'O04', 'OTHERS', category_id, category_code, '1' from common_code_category where category_code = 'PROPERTY_USAGE';


/***********************************************************************
Category Code: REGION
Category Name: Region
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'REGION', 'Region', 1, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, COUNTRY, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'EM', 'EAST MALAYSIA', category_id, category_code, 'MY', '1' from common_code_category where category_code = 'REGION';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, COUNTRY, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'WM', 'WEST MALAYSIA', category_id, category_code, 'MY', '1' from common_code_category where category_code = 'REGION';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, COUNTRY, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'LKW', 'LANGKAWI', category_id, category_code, 'MY', '1' from common_code_category where category_code = 'REGION';

/************************
Category Code: STOCK_EXCHANGE
Category Name: Stock Exchange
********************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'STOCK_EXCHANGE', 'Stock Exchange', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, country, category_code,  category_code_id) select next value for common_code_category_entry_seq, 'KLS', 'Bursa Malaysia', '1', 'MY', category_code, category_id from common_code_category where category_code = 'STOCK_EXCHANGE';


/****************************
Category Code: 25
Category Name: Limit Type
*****************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, '25', 'Limit Type', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'OUTER','OUTER LIMIT','1','25',  category_id from common_code_category where category_code = '25';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq,'INNER','ALLOCATIONS FROM OUTER LIMITS','1','25',  category_id from common_code_category where category_code = '25';


/****************************
Category Code: OPTION_LIST
Category Name: Option List
*****************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'OPTION_LIST', 'Option List', 1, 'A'); 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'O','Not Applicable','1',category_code, category_id from common_code_category where category_code = 'OPTION_LIST';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'Y','Yes','1',category_code, category_id from common_code_category where category_code = 'OPTION_LIST';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'N','No','1',category_code, category_id from common_code_category where category_code = 'OPTION_LIST'; 


/****************************
Category Code: OFFICER_CATEGORY
Category Name: Officer Category
*****************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'OFFICER_CATEGORY', 'Officer Category', 1, 'A'); 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'RLOS-I', 'RLOS - Islamic',  '1', category_code, category_id from common_code_category where category_code = 'OFFICER_CATEGORY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'RLOS-C', 'RLOS - Conventional',  '1', category_code, category_id from common_code_category where category_code = 'OFFICER_CATEGORY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'RLOS-ALL', 'RLOS - All',  '1', category_code, category_id from common_code_category where category_code = 'OFFICER_CATEGORY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'CLOS-I', 'CLOS - Islamic',  '1', category_code, category_id from common_code_category where category_code = 'OFFICER_CATEGORY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'CLOS-C', 'CLOS - Conventional',  '1', category_code, category_id from common_code_category where category_code = 'OFFICER_CATEGORY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'CLOS-ALL', 'CLOS - All',  '1', category_code, category_id from common_code_category where category_code = 'OFFICER_CATEGORY';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'ALL', 'All',  '1', category_code, category_id from common_code_category where category_code = 'OFFICER_CATEGORY';


/*******************************************
Category Code: PROP_VAL_DESCR
Category Name: Property Valuation Description
********************************************/ 
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values(next value for common_code_category_seq, 'PROP_VAL_DESCR', 'Property Valuation Description', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq,'ISTP','Index for states and types of property','1','PROP_VAL_DESCR', 'MY', category_id 
from common_code_category where category_code = 'PROP_VAL_DESCR';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq,'ITP','Index for types of property','1','PROP_VAL_DESCR', 'MY', category_id 
from common_code_category where category_code = 'PROP_VAL_DESCR';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq,'ID','Index for districts','1','PROP_VAL_DESCR', 'MY', category_id 
from common_code_category where category_code = 'PROP_VAL_DESCR';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq,'IS','Index for states','1','PROP_VAL_DESCR', 'MY', category_id 
from common_code_category where category_code = 'PROP_VAL_DESCR';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq,'IRH','Index for all residential houses','1','PROP_VAL_DESCR', 'MY', category_id 
from common_code_category where category_code = 'PROP_VAL_DESCR';


/************************************
Category Code: YARD
Category Name: Yard Type
*************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'YARD', 'Yard Type', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'Y', 'Yard', '1', category_code, category_id from common_code_category where category_code = 'YARD';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'W', 'Warehouse', '1', category_code, category_id from common_code_category where category_code = 'YARD';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'S', 'Store', '1', category_code, category_id from common_code_category where category_code = 'YARD';


/************************************
Category Code: PRIOR_CHARGE_TYPE
Category Name: Prior Charge Type
*************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'PRIOR_CHARGE_TYPE', 'Prior Charge Type', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'I', 'Internal', '1', category_code, category_id from common_code_category where category_code = 'PRIOR_CHARGE_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'E', 'External', '1', category_code, category_id from common_code_category where category_code = 'PRIOR_CHARGE_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'O', 'Not Applicable', '1', category_code, category_id from common_code_category where category_code = 'PRIOR_CHARGE_TYPE';


/**********************************************************************************
Category Code: FD_HOLD_STATUS
Category Name: FD Hold Status
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'FD_HOLD_STATUS', 'FD Hold Status', 1, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'C', 'Hold - Credit Card', category_id, category_code, '1'  from common_code_category where category_code = 'FD_HOLD_STATUS';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'L', 'Hold - Loan', category_id, category_code, '1'  from common_code_category where category_code = 'FD_HOLD_STATUS';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'M', 'Hold - Manual', category_id, category_code, '1'  from common_code_category where category_code = 'FD_HOLD_STATUS';


/**********************************************************************************
Category Code: MONITOR_TYPE
Category Name: Monitor Type/Document Type for Security Checklist Receipt
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
 values
 (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'MONITOR_TYPE', 'Monitor type for checklist items', 1, 'A'); 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq,'INS_POLICY','Insurance Policy','1', category_code, category_id from common_code_category where category_code = 'MONITOR_TYPE';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq,'PREM_REC','Insurance Receipt','1', category_code, category_id from common_code_category where category_code = 'MONITOR_TYPE';

/**********************************************************************************
Category Code: SEARCH_SOURCE_SEC
Category Name: Search Identifier by Source System - Security
***********************************************************************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'SEARCH_SOURCE_SEC', 'Search Identifier by Source System - Security', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq, 'CMS', 'CMS', '1', category_code, category_id from common_code_category where category_code = 'SEARCH_SOURCE_SEC';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq, 'HOST', 'ARBS', '1', category_code, category_id from common_code_category where category_code = 'SEARCH_SOURCE_SEC';

/**********************************************************************************
Category Code: SEARCH_SOURCE_AA
Category Name: Search Identifier by Source System - AA
***********************************************************************************/

insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'SEARCH_SOURCE_AA', 'Search Identifier by Source System - AA', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq, 'LOS', 'LOS', '1', category_code, category_id from common_code_category where category_code = 'SEARCH_SOURCE_AA';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq, 'HOST', 'ARBS', '1', category_code, category_id from common_code_category where category_code = 'SEARCH_SOURCE_AA';


/***************************
Category Type: 2
***************************/
/************************************
Category Code: AREA_UOM
Category Name: Area Unit of Measure
*************************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'AREA_UOM', 'Area Unit of Measure', 2, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'ACRES', 'Acres', '1', 'AREA_UOM', category_id from common_code_category where category_code = 'AREA_UOM';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'HQT', 'Hectares', '1', 'AREA_UOM', category_id from common_code_category where category_code = 'AREA_UOM';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'SQFT', 'Sq. Feet', '1', 'AREA_UOM', category_id from common_code_category where category_code = 'AREA_UOM';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'SQM', 'Sq. Meter', '1', 'AREA_UOM', category_id from common_code_category where category_code = 'AREA_UOM';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'SQY', 'Sq. Yard', '1', 'AREA_UOM', category_id from common_code_category where category_code = 'AREA_UOM';


/**********************************************************
Category Code: CHEQUE_TYPE
Category Name: Asset Based Post-Dated Cheque - Cheque Type
***********************************************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'CHEQUE_TYPE', 'Asset Based Post-Dated Cheque - Cheque Type', 2, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'CHEQUE01', 'Local/Foreign Drafts', '1', 'CHEQUE_TYPE', category_id from common_code_category where category_code = 'CHEQUE_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'CHEQUE02', 'Local/Foreign Banker''s Cheques', '1', 'CHEQUE_TYPE', category_id from common_code_category where category_code = 'CHEQUE_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) select next value for common_code_category_entry_seq, 'CHEQUE03', 'Local/Foreign Cheques', '1', 'CHEQUE_TYPE', category_id from common_code_category where category_code = 'CHEQUE_TYPE';


/*****************************************
Category Code: DEED_ASSIGNMT_TYPE
Category Name: Deed Assignment Type
*****************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'DEED_ASSIGNMT_TYPE', 'Deed Assignment Type', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'RENTAL', 'Rental Proceeds', category_id, 'DEED_ASSIGNMT_TYPE', '1' from common_code_category where category_code = 'DEED_ASSIGNMT_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'CONTRACT', 'Contract', category_id, 'DEED_ASSIGNMT_TYPE', '1' from common_code_category where category_code = 'DEED_ASSIGNMT_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'HIRE', 'Chartered Hire', category_id, 'DEED_ASSIGNMT_TYPE', '1' from common_code_category where category_code = 'DEED_ASSIGNMT_TYPE';


/*****************************************************************
Category Code: BOND_TYPE_MARKSECBONDLOCAL
Category Name: Bonds Type - Marketable Securities - Bonds Local
*****************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'BOND_TYPE_MARKSECBONDLOCAL', 'Bonds Type - Marketable Securities - Bonds Local', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'BOND01', 'Local', category_id, 'BOND_TYPE_MARKSECBONDLOCAL', '1' from common_code_category where category_code = 'BOND_TYPE_MARKSECBONDLOCAL';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'BOND02', 'Convertible Bonds', category_id, 'BOND_TYPE_MARKSECBONDLOCAL', '1' from common_code_category where category_code = 'BOND_TYPE_MARKSECBONDLOCAL';

/*****************************************************************
Category Code: BOND_TYPE_MARKSECBONDFOREIGN
Category Name: Bonds Type - Marketable Securities - Bonds Foreign
*****************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'BOND_TYPE_MARKSECBONDFOREIGN', 'Bonds Type - Marketable Securities - Bonds Foreign', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'BOND01', 'Bulldog Bond', category_id, 'BOND_TYPE_MARKSECBONDFOREIGN', '1' from common_code_category where category_code = 'BOND_TYPE_MARKSECBONDFOREIGN';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'BOND02', 'Eurobond', category_id, 'BOND_TYPE_MARKSECBONDFOREIGN', '1' from common_code_category where category_code = 'BOND_TYPE_MARKSECBONDFOREIGN';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'BOND03', 'Gilts (UK-Govt Issued Bonds = Gilt Edged Securities)', category_id, 'BOND_TYPE_MARKSECBONDFOREIGN', '1' from common_code_category where category_code = 'BOND_TYPE_MARKSECBONDFOREIGN';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'BOND04', 'JGB = Japanese Govt Issued Bonds', category_id, 'BOND_TYPE_MARKSECBONDFOREIGN', '1' from common_code_category where category_code = 'BOND_TYPE_MARKSECBONDFOREIGN';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'BOND05', 'Samurai Bond', category_id, 'BOND_TYPE_MARKSECBONDFOREIGN', '1' from common_code_category where category_code = 'BOND_TYPE_MARKSECBONDFOREIGN';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'BOND06', 'US T Bond', category_id, 'BOND_TYPE_MARKSECBONDFOREIGN', '1' from common_code_category where category_code = 'BOND_TYPE_MARKSECBONDFOREIGN';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'BOND07', 'Yankee Bond', category_id, 'BOND_TYPE_MARKSECBONDFOREIGN', '1' from common_code_category where category_code = 'BOND_TYPE_MARKSECBONDFOREIGN';


/****************************************
Category Code: CORE_MARKET
Category Name: Core Market - Insurance
*****************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'CORE_MARKET', 'Core Market - Insurance', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'CORE01', 'Asia', category_id, 'CORE_MARKET', '1' from common_code_category where category_code = 'CORE_MARKET';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'CORE02', 'Middle East', category_id, 'CORE_MARKET', '1' from common_code_category where category_code = 'CORE_MARKET';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'CORE03', 'Africa', category_id, 'CORE_MARKET', '1' from common_code_category where category_code = 'CORE_MARKET';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'CORE04', 'Latin America', category_id, 'CORE_MARKET', '1' from common_code_category where category_code = 'CORE_MARKET';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'CORE05', 'UK', category_id, 'CORE_MARKET', '1' from common_code_category where category_code = 'CORE_MARKET';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'CORE06', 'USA', category_id, 'CORE_MARKET', '1' from common_code_category where category_code = 'CORE_MARKET';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'CORE07', 'Others', category_id, 'CORE_MARKET', '1' from common_code_category where category_code = 'CORE_MARKET';


/****************************************
Category Code: DISTRICT
Category Name: District
*****************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS,REF_CATEGORY_CODE)
values
(next value for common_code_category_seq, 'DISTRICT', 'District', 2, 'A', 'STATE'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0001', 'Wilayah Per  (Kl)', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0002', 'Wilayah Per (Labuan)', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0003', 'Others  (Wilayah)', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0004', 'Wilayah Per (Putrajaya)', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0101', 'Batu Pahat', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0102', 'Kluang', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0103', 'Kota Tinggi', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0104', 'Mersing', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0105', 'Muar', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0106', 'Pontian', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0107', 'Johor Bahru', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0108', 'Segamat', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0109', 'Others (Johore)', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0201', 'Baling', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0202', 'Kota Setar', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0203', 'Bandar Baharu', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0204', 'Kuala Muda', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0205', 'Kubang Pasu', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0206', 'Kulim', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0207', 'Langkawi', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0208', 'Padang Terap', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0209', 'Pendang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0210', 'Yan', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0211', 'Sik', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0212', 'Others (Kedah)', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0301', 'Bachok', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0302', 'Kota Bahru', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0303', 'Machang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0304', 'Pasir Mas', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0305', 'Pasir Putih', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0306', 'Tanah Merah', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0307', 'Tumpat', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0308', 'Ulu Kelantan', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0309', 'Others (Kelantan)', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0401', 'Alor Gajah', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0402', 'Melaka Tengah', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0403', 'Melaka Selatan', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0404', 'Others (Melaka)', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0501', 'Jelebu', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0502', 'Kuala Pilah', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0503', 'Port Dickson', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0504', 'Rembau', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0505', 'Seremban', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0506', 'Tampin', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0507', 'Jempul', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0508', 'Others (N. Sembilan)', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0601', 'Bentong', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0602', 'Bera', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0603', 'Cameron Highlands', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0604', 'Jerantut', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0605', 'Kuantan', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0606', 'Lipis', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0607', 'Maran', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0608', 'Pekan', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0609', 'Raub', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0610', 'Rompin', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0611', 'Temerloh', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0612', 'Others (Pahang)', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0701', 'Barat Daya', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0702', 'Timur Laut', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0703', 'Seberang Perai Utara', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0704', 'Seberang Perai Tengah', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0705', 'Sbg Perai Selatan', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0706', 'Others (Penang)', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0801', 'Batang Padang', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0802', 'Manjung', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0803', 'Hilir Perak', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0804', 'Hulu Perak', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0805', 'Kinta', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0806', 'Krian', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0807', 'Kuala Kangsar', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0808', 'Larut & Matang', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0809', 'Perak Tengah', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0810', 'Selama', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0811', 'Others (Perak)', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '0901', 'Perlis', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1022', 'Tambunan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1021', 'Keningau', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1020', 'Persiangan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1019', 'Tenom', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1018', 'Sipitang', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1017', 'Beaufort', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1016', 'Kuala Penyu', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1015', 'Tas', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1014', 'Kota Marudu', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1013', 'Kudat', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1012', 'Papar', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1011', 'Penampang', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1010', 'Kota Kinabalu', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1009', 'Tuaran', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1008', 'Kota Belud', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1007', 'Ranau', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1006', 'Labul & Sugut', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1005', 'Kinabatangan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1004', 'Sandakan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1003', 'Semporna', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1002', 'Lahad Datu', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1001', 'Tawau', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1126', 'Belaga', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1125', 'Song', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1124', 'Kapit', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1123', 'Julau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1122', 'Matu/Daro', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1121', 'Meradong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1120', 'Sarikei', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1119', 'Lawas', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1118', 'Limbang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1117', 'Baram', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1116', 'Bintulu', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1115', 'Miri', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1114', 'Oya/Dalat', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1113', 'Kanowit', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1112', 'Mukah', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1111', 'Sibu (Smc)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1110', 'Kalaka', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1109', 'Saribas', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1108', 'Lubok Antu', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1107', 'Sri Aman', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1106', 'Lundun', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1105', 'Hilir Sdg (Simunjan)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1104', 'Hulu Sadong (Serian)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1103', 'Bau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1102', 'Samarahan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1101', 'Kuching (Incl Kmc)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1307', 'Others (Trengganu)', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1306', 'Ulu Trengganu', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1305', 'Marang', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1304', 'Kuala Trengganu', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1303', 'Kemaman', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1302', 'Dungun', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1301', 'Besut', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1210', 'Others (Selangor)', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1209', 'Ulu Selangor', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1208', 'Ulu Langat', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1207', 'Sepang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1206', 'Sabak Bernam', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1205', 'Petaling', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1204', 'Kuala Selangor', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1203', 'Kuala Langat', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1202', 'Klang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE,  CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1201', 'Gombak', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'DISTRICT';


/****************************************
Category Code: 12
Category Name: Environment Risk
*****************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, '12', 'Environment Risk', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NA', 'Not Applicable', category_id, '12', '1' from common_code_category where category_code = '12';
 
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'Y', 'Yes', category_id, '12', '1' from common_code_category where category_code = '12';
 
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'N', 'No', category_id, '12', '1' from common_code_category where category_code = '12';

/**********************************************************************************
Category Code: EQUITY_MARKSECMAINFOREIGN
Category Name: Equity Type - Equity Type - Marketable Securities - Main Index - Foreign
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'EQUITY_MARKSECMAINFOREIGN', 'Equity Type - Marketable Securities - Main Index - Foreign', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'S', 'Stocks', category_id, category_code, '1' from common_code_category where category_code = 'EQUITY_MARKSECMAINFOREIGN';


/**********************************************************************************
Category Code: EQUITY_MARKSECNONLISTEDLOCAL
Category Name: Equity Type - Marketable Securities - Non Listed Local
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'EQUITY_MARKSECNONLISTEDLOCAL', 'Equity Type - Marketable Securities - Non Listed Local', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'EQUITY01', 'Security Pledge Agreement', category_id, 'EQUITY_MARKSECNONLISTEDLOCAL', '1' from common_code_category where category_code = 'EQUITY_MARKSECNONLISTEDLOCAL';


/**********************************************************************************
Category Code: EQUITY_MARKSECOTHERLISTED
Category Name: Equity Type - Marketable Securities - Other Listed
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'EQUITY_MARKSECOTHERLISTED', 'Equity Type - Marketable Securities - Other Listed', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'S', 'Stocks', category_id, category_code, '1' from common_code_category where category_code = 'EQUITY_MARKSECOTHERLISTED';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'U', 'Unit Trust', category_id, category_code, '1' from common_code_category where category_code = 'EQUITY_MARKSECOTHERLISTED';

/**********************************************************************************
Category Code: EQUITY_MARKSECGOVTFOREIGNSAME
Category Name: Equity Type - Marketable Securities - Govt Foreign - Same currency
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'EQUITY_MARKSECGOVTFOREIGNSAME', 'Equity Type - Marketable Securities - Govt Foreign - Same currency', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'EQUITY01', 'Government Marketable Papers', category_id, 'EQUITY_MARKSECGOVTFOREIGNSAME', '1' from common_code_category where category_code = 'EQUITY_MARKSECGOVTFOREIGNSAME';

/**********************************************************************************
Category Code: EQUITY_MARKSECBILL
Category Name: Equity Type - Marketable Securities - Govt Local - T Bills
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'EQUITY_MARKSECBILL', 'Equity Type - Marketable Securities - Govt Local - T Bills', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'EQUITY01', 'Government', category_id, 'EQUITY_MARKSECBILL', '1' from common_code_category where category_code = 'EQUITY_MARKSECBILL';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'EQUITY02', 'Treasury Bills', category_id, 'EQUITY_MARKSECBILL', '1' from common_code_category where category_code = 'EQUITY_MARKSECBILL';

/**********************************************************************************
Category Code: EQUITY_MARKSECGOVTFOREIGNDIFF
Category Name: Equity Type - Marketable Securities - Govt Foreign - Same currency
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'EQUITY_MARKSECGOVTFOREIGNDIFF', 'Equity Type - Marketable Securities - Govt Foreign - Different Currency', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'EQUITY01', 'Government Marketable Papers', category_id, 'EQUITY_MARKSECGOVTFOREIGNDIFF', '1' from common_code_category where category_code = 'EQUITY_MARKSECGOVTFOREIGNDIFF';


/**********************************************************************************
Category Code: XCHANGE_CONTROL
Category Name: Exchange Control Values
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'XCHANGE_CONTROL', 'Exchange Control Values', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'O', 'Not Applicable', category_id, 'XCHANGE_CONTROL', '1' from common_code_category where category_code = 'XCHANGE_CONTROL';
 
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'Y', 'Yes', category_id, 'XCHANGE_CONTROL', '1' from common_code_category where category_code = 'XCHANGE_CONTROL';
 
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'N', 'No', category_id, 'XCHANGE_CONTROL', '1' from common_code_category where category_code = 'XCHANGE_CONTROL';


/**********************************************************************************
Category Code: ECA
Category Name: Export Credit Agency - Asset Based Aircraft
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'ECA', 'Export Credit Agency - Asset Based Aircraft', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'OEKB/AT', 'Oesterreichische Kontrollbank Aktiengesellschaft', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'JBIC/JAPAN', 'Japan Bank for International Cooperation', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'KEIC/KOREA', 'Korea Export Insurance Corporation', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'KEXIM/KR', 'Export-Import Bank of Korea', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MITI/JP', 'Export-Import Insurance Division, International Trade, MITI JAPAN', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MITI/JPIT', 'International Trade Administration Bureau, MITI JAPAN', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MIGA', 'Multilateral Investment Guarantee Agency', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'OTHER', 'Others', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'OPIC/US', 'Overseas Private Investment Corporation', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'USEXIM/US', 'Export-Import Bank of the United States', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'ECGD/UK', 'Export Credits Guarantee Department', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'ERG/SW', 'Export Risk Guarantee Agency', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'EKN/SWEDEN', 'EKN Exportkreditnamnden', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'CESCE/SP', 'Compania Espanola de Seguros de Credito a la Exportacion, S.A.', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'GIEK/NR', 'Norwegian Guarantee Institute for Export Credits', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NCM/NT', 'Nederlandsche Credietverzekering Maatschappij N.V.', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MECIB/MY', 'Malaysia Export Credit Insurance', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MITI/JAPAN', 'Ministry of International Trade & Industry, Japan', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'SACE/ITALY', 'Istituto per i Servizi Assicurativi e il Credito all'' Esportazione', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'COFACE/FR', 'Compagnie Francaise d''Assurance pour le Commerce Exterieur', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'FVERA/FN', 'Finnish Guarantee Board', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'EDC/CANADA', 'Export Development Corporation', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'OND/BL', 'Office National du Ducroire', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'EFIC/AU', 'Export Finance and Insurance Corporation', category_id, 'ECA', '1' from common_code_category where category_code = 'ECA';

/**********************************************************************************
Category Code: GOODS_STATUS
Category Name: Goods Status
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'GOODS_STATUS', 'Goods Status', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'N', 'New', category_id, 'GOODS_STATUS', '1' from common_code_category where category_code = 'GOODS_STATUS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'U', 'Used', category_id, 'GOODS_STATUS', '1' from common_code_category where category_code = 'GOODS_STATUS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'R', 'Recondition', category_id, 'GOODS_STATUS', '1' from common_code_category where category_code = 'GOODS_STATUS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'I', 'Imported Registered', category_id, 'GOODS_STATUS', '1' from common_code_category where category_code = 'GOODS_STATUS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'G', 'Imported Non-registered', category_id, 'GOODS_STATUS', '1' from common_code_category where category_code = 'GOODS_STATUS';

/*INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'B', 'Rebuilt', category_id, 'GOODS_STATUS', '1' from common_code_category where category_code = 'GOODS_STATUS';*/



/**********************************************************************************
Category Code: ICOM_PRODUCT
Category Name: ICOM Product Terms - Document
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'ICOM_PRODUCT', 'ICOM Product Terms - Document', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'ICOM01', 'For Currency Options Only', category_id, 'ICOM_PRODUCT', '1' from common_code_category where category_code = 'ICOM_PRODUCT';

/**********************************************************************************
Category Code: IFEMA_PRODUCT
Category Name: IFEMA Product List - Document
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'IFEMA_PRODUCT', 'IFEMA Product List - Document', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'IFEMA01', 'For FX Transaction Only', category_id, 'IFEMA_PRODUCT', '1' from common_code_category where category_code = 'IFEMA_PRODUCT';


/**********************************************************************************
Category Code: ISDA_PRODUCT
Category Name: ISDA Product List  - Document
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'ISDA_PRODUCT', 'ISDA Product List  - Document', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'ISDA01', 'Interest Rate Swaps and Options', category_id, 'ISDA_PRODUCT', '1' from common_code_category where category_code = 'ISDA_PRODUCT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'ISDA02', 'Cross-Currency Swaps', category_id, 'ISDA_PRODUCT', '1' from common_code_category where category_code = 'ISDA_PRODUCT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'ISDA03', 'Basis Swaps', category_id, 'ISDA_PRODUCT', '1' from common_code_category where category_code = 'ISDA_PRODUCT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'ISDA04', 'Forward Rate Transactions', category_id, 'ISDA_PRODUCT', '1' from common_code_category where category_code = 'ISDA_PRODUCT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'ISDA05', 'Currency Options', category_id, 'ISDA_PRODUCT', '1' from common_code_category where category_code = 'ISDA_PRODUCT';


/**********************************************************************************
Category Code: LE
Category Name: Legal Enforceability Values
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'LE', 'Legal Enforceability Values', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'O', 'Not Applicable', category_id, 'LE', '1' from common_code_category where category_code = 'LE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'N', 'No', category_id, 'LE', '1' from common_code_category where category_code = 'LE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'Y', 'Yes', category_id, 'LE', '1' from common_code_category where category_code = 'LE';


/**********************************************************************************
Category Code: NAT_OF_CHARGE_ASSETGENCHARGE
Category Name: Nature Of Charge - Asset Based General Charge
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'NAT_OF_CHARGE_ASSETGENCHARGE', 'Nature Of Charge - Asset Based General Charge', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC01', 'Assignment', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC02', 'Charge over Account', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC03', 'Charge Over Deposits', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC04', 'Charge over Machinery', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC05', 'Charge over Securities', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC06', 'Debenture', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC07', 'Equitable Charge', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC08', 'Fixed & Floating Charge', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC09', 'Fixed Charge', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC10', 'Floating Charge', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC11', 'Further Charge', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC12', 'General Charge', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC13', 'General Lien /Pledge', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC14', 'Legal Charge', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC15', 'Specific Charge', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC16', 'Supplementary Debenture', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GENC17', 'Pari Passu', category_id, 'NAT_OF_CHARGE_ASSETGENCHARGE', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGENCHARGE';


/**********************************************************************************
Category Code: NAT_OF_CHARGE_ASSETPDC
Category Name: Nature Of Charge - Asset Based Post Dated Cheque
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'NAT_OF_CHARGE_ASSETPDC', 'Nature Of Charge - Asset Based Post Dated Cheque', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PDC01', 'Assignment', category_id, 'NAT_OF_CHARGE_ASSETPDC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETPDC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PDC02', 'Charge over Account', category_id, 'NAT_OF_CHARGE_ASSETPDC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETPDC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PDC03', 'Charge Over Deposits', category_id, 'NAT_OF_CHARGE_ASSETPDC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETPDC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PDC04', 'Charge over Securities', category_id, 'NAT_OF_CHARGE_ASSETPDC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETPDC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PDC05', 'Cheque Purchase Agreement', category_id, 'NAT_OF_CHARGE_ASSETPDC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETPDC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PDC06', 'Debenture', category_id, 'NAT_OF_CHARGE_ASSETPDC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETPDC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PDC07', 'Equitable Charge', category_id, 'NAT_OF_CHARGE_ASSETPDC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETPDC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PDC08', 'Fixed & Floating Charge', category_id, 'NAT_OF_CHARGE_ASSETPDC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETPDC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PDC09', 'Fixed Charge', category_id, 'NAT_OF_CHARGE_ASSETPDC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETPDC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PDC10', 'Floating Charge', category_id, 'NAT_OF_CHARGE_ASSETPDC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETPDC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PDC11', 'Further Charge', category_id, 'NAT_OF_CHARGE_ASSETPDC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETPDC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PDC12', 'General Charge', category_id, 'NAT_OF_CHARGE_ASSETPDC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETPDC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PDC13', 'General Lien / Pledge', category_id, 'NAT_OF_CHARGE_ASSETPDC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETPDC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PDC14', 'Legal Charge', category_id, 'NAT_OF_CHARGE_ASSETPDC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETPDC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PDC15', 'Specific Charge', category_id, 'NAT_OF_CHARGE_ASSETPDC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETPDC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PDC16', 'Pari Passu', category_id, 'NAT_OF_CHARGE_ASSETPDC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETPDC';

/**********************************************************************************
Category Code: NAT_OF_CHARGE_ASSETREC
Category Name: Nature Of Charge - Asset Based Receivables
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'NAT_OF_CHARGE_ASSETREC', 'Nature Of Charge - Asset Based Receivables', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC01', 'Assignment & Assumption Agreement', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC02', 'Assignment', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC03', 'Assignment Agreement /Letter of Assignment / Deed of Assignment', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC04', 'Assignment of Contract', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC05', 'Assignment of Earnings', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC06', 'Assignment of Lease', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC07', 'Assignment of Proceeds', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC08', 'Assignment of Receivables', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC09', 'Assignment of Receivables - w/ recourse', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC10', 'Assignment of Revenue', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC11', 'Assignment of Sale Proceeds', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC12', 'Assignment of Subordinated Indebtedness', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC13', 'CCC Assignment Agreement', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC14', 'Master Deed Assignment', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC15', 'Pledge / Assignment Agreement', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC16', 'Purchase Agreement Assignment', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC17', 'Security Assignment', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC18', 'Supplementary Assignment', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC19', 'Pari Passu', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC20', 'Assignment of Insurance', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_REC21', 'Assignment of Rental', category_id, 'NAT_OF_CHARGE_ASSETREC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETREC';


/**********************************************************************************
Category Code: NAT_OF_CHARGE_ASSETAIRCRAFT
Category Name: Nature Of Charge - Asset Based Specific Aircraft
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'NAT_OF_CHARGE_ASSETAIRCRAFT', 'Nature Of Charge - Asset Based Specific Aircraft', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_AIR01', 'Aircraft Mortgage & Security Agreement', category_id, 'NAT_OF_CHARGE_ASSETAIRCRAFT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETAIRCRAFT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_AIR02', 'Assignment', category_id, 'NAT_OF_CHARGE_ASSETAIRCRAFT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETAIRCRAFT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_AIR03', 'Debenture', category_id, 'NAT_OF_CHARGE_ASSETAIRCRAFT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETAIRCRAFT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_AIR04', 'Equitable Charge', category_id, 'NAT_OF_CHARGE_ASSETAIRCRAFT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETAIRCRAFT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_AIR05', 'Fixed & Floating Charge', category_id, 'NAT_OF_CHARGE_ASSETAIRCRAFT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETAIRCRAFT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_AIR06', 'Fixed Charge', category_id, 'NAT_OF_CHARGE_ASSETAIRCRAFT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETAIRCRAFT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_AIR07', 'Floating Charge', category_id, 'NAT_OF_CHARGE_ASSETAIRCRAFT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETAIRCRAFT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_AIR08', 'Legal Charge', category_id, 'NAT_OF_CHARGE_ASSETAIRCRAFT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETAIRCRAFT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_AIR09', 'Specific Charge', category_id, 'NAT_OF_CHARGE_ASSETAIRCRAFT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETAIRCRAFT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_AIR10', 'General Charge', category_id, 'NAT_OF_CHARGE_ASSETAIRCRAFT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETAIRCRAFT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_AIR11', 'Pari Passu', category_id, 'NAT_OF_CHARGE_ASSETAIRCRAFT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETAIRCRAFT';


/***********************************************************************
Category Code: NAT_OF_CHARGE_ASSETSPECOTHER
Category Name: Nature Of Charge - Asset Based Specific Other
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'NAT_OF_CHARGE_ASSETSPECOTHER', 'Nature Of Charge - Asset Based Specific Other', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH01', 'Assignment', category_id, 'NAT_OF_CHARGE_ASSETSPECOTHER', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECOTHER';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH02', 'Charge over Machinery', category_id, 'NAT_OF_CHARGE_ASSETSPECOTHER', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECOTHER';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH03', 'Debenture', category_id, 'NAT_OF_CHARGE_ASSETSPECOTHER', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECOTHER';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH04', 'Equitable Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECOTHER', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECOTHER';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH05', 'Fixed & Floating Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECOTHER', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECOTHER';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH06', 'Fixed Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECOTHER', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECOTHER';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH07', 'Floating Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECOTHER', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECOTHER';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH09', 'General Charge ', category_id, 'NAT_OF_CHARGE_ASSETSPECOTHER', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECOTHER';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH10', 'Legal Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECOTHER', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECOTHER';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH11', 'Specific Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECOTHER', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECOTHER';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH12', 'Supplementary Debenture', category_id, 'NAT_OF_CHARGE_ASSETSPECOTHER', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECOTHER';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH13', 'Pari Passu', category_id, 'NAT_OF_CHARGE_ASSETSPECOTHER', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECOTHER';


/***********************************************************************
Category Code: NAT_OF_CHARGE_ASSETSPECPLANT
Category Name: Nature Of Charge - Asset Based Specific Plant and Equipment
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'NAT_OF_CHARGE_ASSETSPECPLANT', 'Nature Of Charge - Asset Based Specific Plant and Equipment', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PLT01', 'Assignment', category_id, 'NAT_OF_CHARGE_ASSETSPECPLANT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECPLANT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PLT02', 'Charge over Equipment', category_id, 'NAT_OF_CHARGE_ASSETSPECPLANT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECPLANT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PLT03', 'Charge over Machinery', category_id, 'NAT_OF_CHARGE_ASSETSPECPLANT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECPLANT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PLT04', 'Charge over Plant & Equipment', category_id, 'NAT_OF_CHARGE_ASSETSPECPLANT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECPLANT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PLT05', 'Debenture', category_id, 'NAT_OF_CHARGE_ASSETSPECPLANT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECPLANT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PLT06', 'Equitable Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECPLANT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECPLANT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PLT07', 'Fixed & Floating Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECPLANT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECPLANT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PLT08', 'Fixed Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECPLANT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECPLANT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PLT09', 'Floating Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECPLANT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECPLANT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PLT10', 'Further Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECPLANT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECPLANT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PLT11', 'General Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECPLANT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECPLANT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PLT12', 'Legal Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECPLANT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECPLANT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PLT13', 'Specific Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECPLANT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECPLANT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PLT14', 'Supplementary Debenture', category_id, 'NAT_OF_CHARGE_ASSETSPECPLANT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECPLANT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PLT15', 'Pari Passu', category_id, 'NAT_OF_CHARGE_ASSETSPECPLANT', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECPLANT';

/***********************************************************************
Category Code: NAT_OF_CHARGE_ASSETSPECVEHICLES
Category Name: Nature Of Charge - Asset Based Specific Vehicles
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'NAT_OF_CHARGE_ASSETSPECVEHICLES', 'Nature Of Charge - Asset Based Specific Vehicles', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VEH01', 'Debenture', category_id, 'NAT_OF_CHARGE_ASSETSPECVEHICLES', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECVEHICLES';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VEH02', 'Equitable Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECVEHICLES', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECVEHICLES';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VEH03', 'Fixed & Floating Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECVEHICLES', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECVEHICLES';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VEH04', 'Fixed Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECVEHICLES', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECVEHICLES';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VEH05', 'Floating Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECVEHICLES', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECVEHICLES';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VEH06', 'Further Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECVEHICLES', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECVEHICLES';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VEH07', 'General Charge ', category_id, 'NAT_OF_CHARGE_ASSETSPECVEHICLES', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECVEHICLES';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VEH08', 'Legal Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECVEHICLES', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECVEHICLES';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VEH09', 'Specific Charge', category_id, 'NAT_OF_CHARGE_ASSETSPECVEHICLES', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECVEHICLES';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VEH10', 'Supplementary Debenture', category_id, 'NAT_OF_CHARGE_ASSETSPECVEHICLES', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECVEHICLES';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VEH11', 'Pari Passu', category_id, 'NAT_OF_CHARGE_ASSETSPECVEHICLES', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETSPECVEHICLES';


/***********************************************************************
Category Code: NAT_OF_CHARGE_ASSETVESSEL
Category Name: Nature Of Charge - Asset Based Specific Vessel
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'NAT_OF_CHARGE_ASSETVESSEL', 'Nature Of Charge - Asset Based Vessel', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VES01', 'Vessel Mortgage & Security Agreement', category_id, 'NAT_OF_CHARGE_ASSETVESSEL', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETVESSEL';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VES02', 'Assignment', category_id, 'NAT_OF_CHARGE_ASSETVESSEL', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETVESSEL';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VES03', 'Debenture', category_id, 'NAT_OF_CHARGE_ASSETVESSEL', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETVESSEL';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VES04', 'Equitable Charge', category_id, 'NAT_OF_CHARGE_ASSETVESSEL', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETVESSEL';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VES05', 'Fixed & Floating Charge', category_id, 'NAT_OF_CHARGE_ASSETVESSEL', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETVESSEL';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VES06', 'Fixed Charge', category_id, 'NAT_OF_CHARGE_ASSETVESSEL', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETVESSEL';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VES07', 'Floating Charge', category_id, 'NAT_OF_CHARGE_ASSETVESSEL', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETVESSEL';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VES08', 'Legal Charge', category_id, 'NAT_OF_CHARGE_ASSETVESSEL', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETVESSEL';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VES09', 'Specific Charge', category_id, 'NAT_OF_CHARGE_ASSETVESSEL', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETVESSEL';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VES10', 'General Charge', category_id, 'NAT_OF_CHARGE_ASSETVESSEL', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETVESSEL';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_VES11', 'Pari Passu', category_id, 'NAT_OF_CHARGE_ASSETVESSEL', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETVESSEL';

/***********************************************************************
Category Code: NAT_OF_CHARGE_ASSETGOLD
Category Name: Nature Of Charge - Asset Based Gold
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'NAT_OF_CHARGE_ASSETGOLD', 'Nature Of Charge - Asset Based Gold', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GOLD01', 'Assignment', category_id, category_code, '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGOLD';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GOLD02', 'Charge over Gold Savings Account', category_id, category_code, '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGOLD';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GOLD03', 'Charge over Assets', category_id, category_code, '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGOLD';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GOLD04', 'Charge over Securities', category_id, category_code, '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGOLD';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GOLD05', 'Debenture', category_id, category_code, '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGOLD';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GOLD06', 'Equitable Charge', category_id, category_code, '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGOLD';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GOLD07', 'Fixed & Floating Charge', category_id, category_code, '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGOLD';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GOLD08', 'Fixed Charge', category_id, category_code, '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGOLD';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GOLD09', 'Floating Charge', category_id, category_code, '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGOLD';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GOLD10', 'Further Charge', category_id, category_code, '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGOLD';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GOLD11', 'General Charge', category_id, category_code, '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGOLD';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GOLD12', 'General Lien / Pledge', category_id, category_code, '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGOLD';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GOLD13', 'Legal Charge', category_id, category_code, '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGOLD';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GOLD14', 'Specific Charge', category_id, category_code, '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGOLD';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_GOLD15', 'Pari Passu', category_id, category_code, '1' from common_code_category where category_code = 'NAT_OF_CHARGE_ASSETGOLD';


/***********************************************************************
Category Code: NAT_OF_CHARGE_CASH
Category Name: Nature Of Charge - Cash
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'NAT_OF_CHARGE_CASH', 'Nature Of Charge - Cash', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_CASH01', 'Assignment', category_id, 'NAT_OF_CHARGE_CASH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_CASH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_CASH02', 'Charge over Account', category_id, 'NAT_OF_CHARGE_CASH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_CASH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_CASH03', 'Charge Over Deposits', category_id, 'NAT_OF_CHARGE_CASH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_CASH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_CASH04', 'Charge over Securities', category_id, 'NAT_OF_CHARGE_CASH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_CASH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_CASH05', 'Debenture', category_id, 'NAT_OF_CHARGE_CASH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_CASH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_CASH06', 'Equitable Charge', category_id, 'NAT_OF_CHARGE_CASH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_CASH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_CASH07', 'Fixed & Floating Charge', category_id, 'NAT_OF_CHARGE_CASH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_CASH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_CASH08', 'Fixed Charge', category_id, 'NAT_OF_CHARGE_CASH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_CASH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_CASH09', 'Floating Charge', category_id, 'NAT_OF_CHARGE_CASH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_CASH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_CASH10', 'Further Charge', category_id, 'NAT_OF_CHARGE_CASH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_CASH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_CASH11', 'General Charge', category_id, 'NAT_OF_CHARGE_CASH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_CASH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_CASH12', 'General Lien / Pledge', category_id, 'NAT_OF_CHARGE_CASH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_CASH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_CASH13', 'Legal Charge', category_id, 'NAT_OF_CHARGE_CASH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_CASH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_CASH14', 'Specific Charge', category_id, 'NAT_OF_CHARGE_CASH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_CASH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_CASH15', 'Pari Passu', category_id, 'NAT_OF_CHARGE_CASH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_CASH';

/***********************************************************************
Category Code: NAT_OF_CHARGE_INS
Category Name: Nature Of Charge - Insurance
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'NAT_OF_CHARGE_INS', 'Nature Of Charge - Insurance', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_INS01', 'Assignment', category_id, 'NAT_OF_CHARGE_INS', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_INS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_INS02', 'Assignment of Insurance', category_id, 'NAT_OF_CHARGE_INS', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_INS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_INS03', 'Assignment of Reinsurances', category_id, 'NAT_OF_CHARGE_INS', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_INS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_INS04', 'Supplementary Assignment', category_id, 'NAT_OF_CHARGE_INS', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_INS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_INS05', 'Pari Passu', category_id, 'NAT_OF_CHARGE_INS', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_INS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_INS06', 'Assignment of Contract', category_id, 'NAT_OF_CHARGE_INS', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_INS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_INS07', 'Assignment of Earnings', category_id, 'NAT_OF_CHARGE_INS', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_INS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_INS08', 'Assignment of Lease', category_id, 'NAT_OF_CHARGE_INS', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_INS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_INS09', 'Assignment of Receivables', category_id, 'NAT_OF_CHARGE_INS', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_INS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_INS10', 'Assignment of Rental', category_id, 'NAT_OF_CHARGE_INS', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_INS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_INS11', 'Assignment of Sale Proceeds', category_id, 'NAT_OF_CHARGE_INS', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_INS';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_INS12', 'Assignment of Subordinated Indebtedness', category_id, 'NAT_OF_CHARGE_INS', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_INS';


/***********************************************************************
Category Code: NAT_OF_CHARGE_MARKSEC
Category Name: Nature Of Charge - Marketable Securities
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'NAT_OF_CHARGE_MARKSEC', 'Nature Of Charge - Marketable Securities', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_MS01', 'Assignment', category_id, 'NAT_OF_CHARGE_MARKSEC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_MS02', 'Charge over Securities', category_id, 'NAT_OF_CHARGE_MARKSEC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_MS03', 'Charge Over Securities -Stocks, Shares, Bonds & Others', category_id, 'NAT_OF_CHARGE_MARKSEC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_MS04', 'Equitable Charge', category_id, 'NAT_OF_CHARGE_MARKSEC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_MS05', 'Fixed & Floating Charge', category_id, 'NAT_OF_CHARGE_MARKSEC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_MS06', 'Fixed Charge', category_id, 'NAT_OF_CHARGE_MARKSEC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_MS07', 'Floating Charge', category_id, 'NAT_OF_CHARGE_MARKSEC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_MS08', 'Further Charge', category_id, 'NAT_OF_CHARGE_MARKSEC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_MS09', 'General  Charge', category_id, 'NAT_OF_CHARGE_MARKSEC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_MS10', 'General  Lien', category_id, 'NAT_OF_CHARGE_MARKSEC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_MS11', 'Legal Charge', category_id, 'NAT_OF_CHARGE_MARKSEC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_MS12', 'Memorandum of Deposit of Security - Stocks, Shares, Bonds  and Others', category_id, 'NAT_OF_CHARGE_MARKSEC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_MS13', 'Security Pledge', category_id, 'NAT_OF_CHARGE_MARKSEC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_MS14', 'Share Pledge', category_id, 'NAT_OF_CHARGE_MARKSEC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_MS15', 'Specific Charge', category_id, 'NAT_OF_CHARGE_MARKSEC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_MS16', 'Pari Passu', category_id, 'NAT_OF_CHARGE_MARKSEC', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_MARKSEC';


/***********************************************************************
Category Code: NAT_OF_CHARGE_OTH
Category Name: Nature Of Charge - Others
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'NAT_OF_CHARGE_OTH', 'Nature Of Charge - Others', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH01', 'Assignment', category_id, 'NAT_OF_CHARGE_OTH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_OTH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH02', 'Charge over Account', category_id, 'NAT_OF_CHARGE_OTH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_OTH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH03', 'Charge Over Deposits', category_id, 'NAT_OF_CHARGE_OTH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_OTH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH04', 'Charge over Machinery', category_id, 'NAT_OF_CHARGE_OTH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_OTH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH05', 'Charge over Securities', category_id, 'NAT_OF_CHARGE_OTH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_OTH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH06', 'Debenture', category_id, 'NAT_OF_CHARGE_OTH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_OTH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH07', 'Equitable Charge', category_id, 'NAT_OF_CHARGE_OTH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_OTH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH08', 'Fixed & Floating Charge', category_id, 'NAT_OF_CHARGE_OTH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_OTH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH09', 'Fixed Charge', category_id, 'NAT_OF_CHARGE_OTH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_OTH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH10', 'Floating Charge', category_id, 'NAT_OF_CHARGE_OTH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_OTH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH11', 'Further Charge', category_id, 'NAT_OF_CHARGE_OTH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_OTH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH12', 'General Charge ', category_id, 'NAT_OF_CHARGE_OTH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_OTH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH13', 'General Lien /Pledge', category_id, 'NAT_OF_CHARGE_OTH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_OTH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH14', 'Legal Charge', category_id, 'NAT_OF_CHARGE_OTH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_OTH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH15', 'Specific Charge', category_id, 'NAT_OF_CHARGE_OTH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_OTH';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_OTH16', 'Supplementary Debenture', category_id, 'NAT_OF_CHARGE_OTH', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_OTH';


/***********************************************************************
Category Code: NAT_OF_CHARGE_PROP
Category Name: Nature Of Charge - Property
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'NAT_OF_CHARGE_PROP', 'Nature Of Charge - Property', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PROP01', 'Charge / Mortgage in Escrow', category_id, 'NAT_OF_CHARGE_PROP', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_PROP';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PROP02', 'Chattel Mortgage', category_id, 'NAT_OF_CHARGE_PROP', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_PROP';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PROP03', 'Debenture', category_id, 'NAT_OF_CHARGE_PROP', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_PROP';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PROP04', 'Equitable Charge over Property', category_id, 'NAT_OF_CHARGE_PROP', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_PROP';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PROP05', 'Equitable Mortgage', category_id, 'NAT_OF_CHARGE_PROP', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_PROP';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PROP06', 'Fixed Charge', category_id, 'NAT_OF_CHARGE_PROP', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_PROP';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PROP07', 'Further Charge', category_id, 'NAT_OF_CHARGE_PROP', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_PROP';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PROP08', 'Legal Charge over Property', category_id, 'NAT_OF_CHARGE_PROP', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_PROP';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PROP09', 'Legal Mortgage', category_id, 'NAT_OF_CHARGE_PROP', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_PROP';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PROP10', 'Memorandum of Deposit of Title Deeds', category_id, 'NAT_OF_CHARGE_PROP', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_PROP';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PROP11', 'Simple Deposit of Title Deeds', category_id, 'NAT_OF_CHARGE_PROP', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_PROP';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PROP12', 'Pari Passu', category_id, 'NAT_OF_CHARGE_PROP', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_PROP';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PROP13', 'Assignment', category_id, 'NAT_OF_CHARGE_PROP', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_PROP';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOC_PROP14', 'Assignment of Rental', category_id, 'NAT_OF_CHARGE_PROP', '1' from common_code_category where category_code = 'NAT_OF_CHARGE_PROP';


/***********************************************************************
Category Code: NOMINEE_MARKSEC
Category Name: Nominee Name - Marketable Securities
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'NOMINEE_MARKSEC', 'Nominee Name - Marketable Securities', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOM_ABGT', 'Alliance Group Nominees (Tempatan) Sdn Bhd', category_id, 'NOMINEE_MARKSEC', '1' from common_code_category where category_code = 'NOMINEE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOM_ABGA', 'Alliance Group Nominees (Asing) Sdn Bhd', category_id, 'NOMINEE_MARKSEC', '1' from common_code_category where category_code = 'NOMINEE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOM_AIBBT', 'AIBB Nominees (Tempatan) Sdn', category_id, 'NOMINEE_MARKSEC', '1' from common_code_category where category_code = 'NOMINEE_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NOM_AIBBA', 'AIBB Nominees (Asing) Sdn', category_id, 'NOMINEE_MARKSEC', '1' from common_code_category where category_code = 'NOMINEE_MARKSEC';


/*******************************************
Category Code: SETTLEMENT_ORG_MARKSEC
Category Name: SettleMent Organisation - Marketable Securities
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'SETTLEMENT_ORG_MARKSEC', 'SettleMent Organisation - Marketable Securities', 2, 'A'); 
 
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'SO01', 'Euroclear', category_id, 'SETTLEMENT_ORG_MARKSEC', '1' from common_code_category where category_code = 'SETTLEMENT_ORG_MARKSEC';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'SO02', 'Cedel', category_id, 'SETTLEMENT_ORG_MARKSEC', '1' from common_code_category where category_code = 'SETTLEMENT_ORG_MARKSEC';


/*******************************************
Category Code: TENURE_PROP
Category Name: Tenure List - Property
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'TENURE_PROP', 'Tenure List - Property', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'F', 'Freehold', category_id, 'TENURE_PROP', '1' from common_code_category where category_code = 'TENURE_PROP';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'L', 'Leasehold', category_id, 'TENURE_PROP', '1' from common_code_category where category_code = 'TENURE_PROP';


/*******************************************
Category Code: INVOICE_TYPE
Category Name: Types of Invoices
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'INVOICE_TYPE', 'Types of Invoices', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'GENERAL', 'General (No Approved Buyer)', category_id, 'INVOICE_TYPE', '1' from common_code_category where category_code = 'INVOICE_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'SPECIFIC', 'Specific', category_id, 'INVOICE_TYPE', '1' from common_code_category where category_code = 'INVOICE_TYPE';


/**********************************
Category Code: VESSEL_TYPE
Category Name: Vessel Type - Asset Based
*****************************************/
insert into common_code_category(CATEGORY_ID,
   CATEGORY_CODE,CATEGORY_NAME,CATEGORY_TYPE,ACTIVE_STATUS) values(	
 NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'VESSEL_TYPE','Vessel Type - Asset Based',2,'A');	

INSERT INTO COMMON_CODE_CATEGORY_ENTRY(ENTRY_ID,ENTRY_CODE,ENTRY_NAME,ACTIVE_STATUS,CATEGORY_CODE, CATEGORY_CODE_ID) 
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'105','BARGES','1',category_code,category_id from common_code_category where category_code = 'VESSEL_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY(ENTRY_ID,ENTRY_CODE,ENTRY_NAME,ACTIVE_STATUS,CATEGORY_CODE, CATEGORY_CODE_ID) 
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'149','OTHERS - WATER TRANSPORT','1',category_code,category_id from common_code_category where category_code = 'VESSEL_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY(ENTRY_ID,ENTRY_CODE,ENTRY_NAME,ACTIVE_STATUS,CATEGORY_CODE, CATEGORY_CODE_ID) 
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'166','TUG BOAT','1',category_code,category_id from common_code_category where category_code = 'VESSEL_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY(ENTRY_ID,ENTRY_CODE,ENTRY_NAME,ACTIVE_STATUS,CATEGORY_CODE, CATEGORY_CODE_ID) 
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'168','VESSEL','1',category_code,category_id from common_code_category where category_code = 'VESSEL_TYPE';


/*******************************************
Category Code: ENERGY_SOURCE
Category Name: Energy Source
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'ENERGY_SOURCE', 'Energy Source', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'PETROL', 'Petrol', category_id, 'ENERGY_SOURCE', '1' from common_code_category where category_code = 'ENERGY_SOURCE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'DIESEL', 'Diesel', category_id, 'ENERGY_SOURCE', '1' from common_code_category where category_code = 'ENERGY_SOURCE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'GAS', 'Gas', category_id, 'ENERGY_SOURCE', '1' from common_code_category where category_code = 'ENERGY_SOURCE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'OTH', 'Other', category_id, 'ENERGY_SOURCE', '1' from common_code_category where category_code = 'ENERGY_SOURCE';


/*****************************
Category Code: GOLD_UOM
Category Name: GOLD UOM
****************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'GOLD_UOM', 'GOLD UOM', 2, 'A');

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '1', 'Gramme', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='GOLD_UOM';


/*********************************
Category Code: VESSEL_STATE
Category Name: Vessel State
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'VESSEL_STATE', 'Vessel State', 2, 'A');

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'U', 'Under Construction', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='VESSEL_STATE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'C', 'Completed', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='VESSEL_STATE';

/*********************************
Category Code: OCCUP_TYPE
Category Name: Occupancy Type
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'OCCUP_TYPE', 'Occupancy Type', 2, 'A');

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'CULTVATE', 'Cultivated', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='OCCUP_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'NA', 'Not Applicable', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='OCCUP_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'OWNOCCPD', 'Owner Occupied', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='OCCUP_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'TENANTED', 'Tenanted', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='OCCUP_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'VACANT', 'Vacant', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='OCCUP_TYPE';


/*********************************
Category Code: CHARTER_PERIOD_UNIT
Category Name: Charter Period Unit
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'CHARTER_PERIOD_UNIT', 'Charter Period Unit', 2, 'A');

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MON', 'Months', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='CHARTER_PERIOD_UNIT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'YRS', 'Years', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='CHARTER_PERIOD_UNIT';


/*********************************
Category Code: CHARTER_RATE_UNIT
Category Name: Charter Rate Unit
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'CHARTER_RATE_UNIT', 'Charter Rate Unit', 2, 'A');

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'DAY', 'Day', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='CHARTER_RATE_UNIT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MNTH', 'Month', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='CHARTER_RATE_UNIT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'OTH', 'Others', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='CHARTER_RATE_UNIT';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'TRIP', 'Trip', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='CHARTER_RATE_UNIT';


/*********************************
Category Code: MUKIM
Category Name: Mukim
*********************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status, ref_category_code)
values                                                                   
(next value for common_code_category_seq, 'MUKIM', 'Mukim', 2, 'A', 'STATE');

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12101', 'Not Available', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00001', 'Sabak', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00002', 'Bagan Nakhoda Omar', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00003', 'Pasir Panjang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00004', 'Hulu Bernam', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00005', 'Tanjung Karang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00006', 'Hulu Tinggi', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00007', 'Kalumpang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00008', 'Kuala Kalumpang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00009', 'Sungai Gumut', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00010', 'Peretak', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00011', 'Sungai Tinggi', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00012', 'Rasa', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00013', 'Batang Kali', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00014', 'Hulu Yam', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00015', 'Serendah', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00016', 'Pasangan', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00017', 'Hujung Permatang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00018', 'Kuala Selangor', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00019', 'Api-Api', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00020', 'Ijuk', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00021', 'Rawang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00022', 'Jeram', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00023', 'Setapak', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00024', 'Selayang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00025', 'Hulu Klang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00026', 'Sungai Buloh', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00027', 'Bukit Raja', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00028', 'Kapar', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00029', 'Klang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00030', 'Jugra', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00031', 'Kelenang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00032', 'Morib', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00033', 'Batu', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00034', 'Teluk Panglima Garang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00035', 'Bandar', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00036', 'Sepang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00037', 'Labu', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00038', 'Tanjung Dua Belas', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00039', 'Dengkil', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00040', 'Beranang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00041', 'Kajang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00042', 'Semenyih', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00043', 'Petaling', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00044', 'Damansara', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00045', 'Ampang', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY00046', 'Hulu Langat', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01002', 'Baung', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01003', 'Sabak', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01004', 'Banggol', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01005', 'Rantau Panjang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01006', 'Semerak', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01007', 'Wakaf Stan', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01008', 'Pasir Hor', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01009', 'Bandar Baru Kubang Kerian', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01011', 'Salor', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01013', 'Kubang Bembang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01014', 'Tujuh', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01015', 'Cherang Melintang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01016', 'Tendung', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01018', 'Langgar', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01019', 'Telipot', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01020', 'Pasir Mas', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01027', 'Selising', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01030', 'Ketereh West (Barat)', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01031', 'Pulai', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01033', 'Pekan Ayer Lanas', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01034', 'Tok Uban', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01035', 'Meranti', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01037', 'Kubang Sepat', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01038', 'Ketereh East (Timur)', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01039', 'Alor Bakat', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01040', 'Bachok', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01041', 'Bator', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01042', 'Chap', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01043', 'Cherang Hangus', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01044', 'Gajah Mati', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01045', 'Gunong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01046', 'Kuau', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01047', 'Kemasin', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01048', 'Kubang Telega', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01049', 'Kuchelong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01050', 'Lubok Tembesu', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01051', 'Mak Lipah', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01052', 'Melawi', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01053', 'Nipah', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01054', 'Pak Pura', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01055', 'Pauh Sembilan', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01056', 'Paya Mengkuang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01057', 'Perupok', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01058', 'Repek', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01059', 'Rusa', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01060', 'Senak', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01061', 'Serdang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01062', 'Takang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01063', 'Tanjong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01064', 'Tanjong Jering', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01065', 'Tanjong Pauh', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01066', 'Telok Mesira', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01067', 'Telong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01068', 'Temu Ranggas', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01069', 'Tepus', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01070', 'Tualang Salak', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01071', 'Bandar Bachok', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01072', 'Bandar Kechil Jelawat', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01073', 'Aur Duri', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01074', 'Badak Mati', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01075', 'Badak', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01076', 'Badang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01077', 'Banggu', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01078', 'Bayang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01079', 'Bechah Mulong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01080', 'Beta Hulu', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01081', 'Beta Hilir', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01082', 'Beting', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01083', 'Biah', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01084', 'Binjai', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01085', 'Buloh Poh', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01086', 'Bunmut Payong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01087', 'But', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01088', 'Chekli', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01089', 'Chekok', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01090', 'Che Latiff', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01091', 'Chicha', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01092', 'Dal', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01093', 'Demit', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01094', 'Dusun Rendah', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01095', 'Guntong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01096', 'Jelutong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01097', 'Kadok', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01098', 'Karang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01099', 'Kampung Sireh', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01100', 'Kedai Buloh', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01101', 'Kijang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01102', 'Kemubu', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01103', 'Kemumin', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01104', 'Kenali', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01105', 'Koh', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01106', 'Kota', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01107', 'Lembu', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01108', 'Lubok Jambu', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01109', 'Lubok Pukol', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01110', 'Lundang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01111', 'Ludang Paku', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01112', 'Mahang West (Barat)', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01113', 'Mahang East (Timur)', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01114', 'Mentuan', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01115', 'Melor', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01116', 'Padang Bongor', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01117', 'Padang Enggang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01118', 'Padang Garong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01119', 'Padang Leban', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01120', 'Padang Raja', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01121', 'Padang Sakar', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01122', 'Padang Tengah', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01123', 'Panchor', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01124', 'Pangkal Pisang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01125', 'Parit', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01126', 'Patek', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01127', 'Pauh', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01128', 'Paya', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01129', 'Pendek', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01130', 'Pengkalan Chepa', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01131', 'Peringat', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01132', 'Perol', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01133', 'Pintu Gang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01134', 'Pulau', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01135', 'Pualu Belanga', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01136', 'Pulau Gajah', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01137', 'Pulau Kundor', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01139', 'Pulau Panjang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01140', 'Pulau Pisang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01141', 'Semut Api', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01142', 'Sering', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01143', 'Seterpa', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01144', 'Tanjong Chat', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01145', 'Tapang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01146', 'Tebing Tinggi', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01147', 'Telok', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01148', 'Telok Bharu', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01149', 'Telok Kitang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01150', 'Tiong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01151', 'Tok Ku', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01152', 'Kota Bharu', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01153', 'Bandar Kecil Mulong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01154', 'Bagan', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01155', 'Bakar', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01156', 'Dewan', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01157', 'Gading Galoh', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01158', 'Jakar', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01159', 'Joh', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01160', 'Kelaweh', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01161', 'Kerawang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01162', 'Kerilla', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01163', 'Kuala Kerak', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01164', 'Labok', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01165', 'Limau Hantu', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01166', 'Machang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01167', 'Padang Kemunchut', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01168', 'Pek', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01169', 'Pemanok', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01170', 'Pulai Chondong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01171', 'Raja', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01172', 'Temangan', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01173', 'Tengah', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01174', 'Tok Bok', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01175', 'Ulu Sat', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01176', 'Bandar Manchang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01177', 'Pekan Labok', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01178', 'Bandar Temangan', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01179', 'Alor Buloh', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01180', 'Alor Pasir', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01181', 'Apa-Apa', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01182', 'Apam', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01183', 'Bakong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01184', 'Bechah Menerong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01185', 'Bechan Palas', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01186', 'Bechah Semak', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01187', 'Bukit Tuku', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01188', 'Chetok', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01189', 'Gelam', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01190', 'Gua', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01191', 'Gual Nering', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01192', 'Gual Periok', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01193', 'Jabo', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01194', 'Jejawi', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01195', 'Kangkong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01196', 'Kala', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01197', 'Kasa', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01198', 'Kedondong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01199', 'Kenak', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01200', 'Kerasak', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01201', 'Kiat', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01202', 'Kuala Lemal', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01203', 'Kubang Batang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01204', 'Kubang Gatal', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01205', 'Kubang Gendang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01206', 'Kubang Ketam', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01207', 'Kubang Terap', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01208', 'Lalang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01209', 'Lubok Aching', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01210', 'Lubok Gong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01211', 'Lubok Kawah', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01212', 'Lubok Tapah', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01213', 'Lubok Setol', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01214', 'Padang Embon', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01215', 'Paloh', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01216', 'Sakar', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01217', 'Tasik Berangan', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01218', 'Teliar', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01219', 'Tok Sangkut', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01220', 'Kuala Kelar', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01221', 'Bandar Pasir Mas', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01222', 'Bandar Kechil Rantau Panjang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01223', 'Banggol Setol', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01224', 'Batu Sebutir', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01225', 'Berangan', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01226', 'Bukit Abal West (Barat)', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01227', 'Bukit Abal East (Timur)', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01228', 'Bukit Merbau', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01229', 'Bukit Tanah', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01230', 'Cherang Ruku', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01231', 'Changgai', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01232', 'Gong Datok West (Barat)', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01233', 'Gong Datok East (Timur)', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01234', 'Gong Chapa', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01235', 'Gong Chengal', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01236', 'Gong Garu', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01237', 'Gong Kulim', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01238', 'Gong Nangka', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01239', 'Gong Pachat', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01240', 'Jeram', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01241', 'Jerus', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01242', 'Kandis', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01243', 'Kampong Wakaf', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01244', 'Kolam Tembusu', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01245', 'Merbol', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01246', 'Merkang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01247', 'Padang Pak Amat', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01248', 'Pasir Puteh', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01249', 'Pengkalan', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01250', 'Permatang Sungkai', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01251', 'Seligi', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01252', 'Tasik', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01253', 'Bandar Pasir Puteh', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01254', 'Pekan Selising', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01255', 'Batang Merbau', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01256', 'Bendang Nyior', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01257', 'Bukit Durian', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01258', 'Ulu Kusial', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01259', 'Jedok', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01260', 'Kuala Paku', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01261', 'Lawang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01262', 'Maka', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01263', 'Nibong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01264', 'Pasir Genda', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01265', 'Rambai', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01266', 'Sokor', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01267', 'Tanah Merah', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01268', 'Bandar Tanah Merah', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01269', 'Pekan Air Lanas', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01270', 'Batu Papan', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01271', 'Gua Musang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01272', 'Ulu Nenggiri', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01273', 'Ketil ( Gua Musang )', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01274', 'Kuala Sungai', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01275', 'Limau Kasturi', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01276', 'Relai', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01277', 'Renok', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01278', 'Bandar Gua Musang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01279', 'Pekan Bertam', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01280', 'Batu Mengkebang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01281', 'Enggong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01282', 'Gajah', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01283', 'Kandek', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01284', 'Kenor', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01285', 'Kuala Geris', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01286', 'Kuala Krai', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01287', 'Kuala Nal', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01288', 'Kuala Pahi', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01289', 'Kuala Pergau', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01290', 'Kuala Stong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01291', 'Mambong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01292', 'Manek Urai', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01293', 'Manjor', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01294', 'Telekong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01295', 'Kuala Balah', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01296', 'Pahi', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01297', 'Pekan Telekong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01298', 'Belimbing', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01299', 'Bunga Tanjong', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01300', 'Jeli', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01301', 'Jeli Tepi Sungai', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01302', 'Kalai', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01303', 'Kuala Balah', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01304', 'Lubok Bongor', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01305', 'Bandar Jeli', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01306', 'Bechah Resak', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01307', 'Bunohan', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01308', 'Bunut Sarang Burung', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01309', 'Chenderong Batu', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01310', 'Geting', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01311', 'Jal', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01312', 'Kampong Laut', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01313', 'Kelaboran', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01314', 'Ketil ( Tumpat )', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01315', 'Kok Keli', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01316', 'Kutang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01317', 'Mak Neralang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01318', 'Morak', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01319', 'Pasir Pekan', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01320', 'Palekbang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01321', 'Periok', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01322', 'Pulau Besar', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01323', 'Selehong Selatan', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01324', 'Selehong Utara', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01325', 'Simpangan', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01326', 'Siungai Pinang', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01327', 'Tabar', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01328', 'Talak', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01329', 'Telok Renjuna', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01330', 'Tumpat', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01331', 'Wakaf Bharu', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01332', 'Wakaf Delima', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01333', 'Bandar Tumput', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY01600', 'Wakaf Siku', '52316', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02001', 'Batu', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02002', 'Bukit Bintang', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02003', 'Segambut', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02004', 'Lembah Pantai', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02005', 'Bandar Tun Razak', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02006', 'Titiwangsa', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02007', 'Wangsa Maju', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02008', 'Setiawangsa', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02009', 'Pekan Kepong', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02010', 'Seputeh', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02011', 'Cheras', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02012', 'Setapak', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02013', 'Bandar Sungai Besi', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02014', 'Pekan Pudu Ulu', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02015', 'Ulu Kelang', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02016', 'Kuala Lumpur', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02017', 'Salak Selatan', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02018', 'Pekan Sungai Pencala', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02019', 'Dato Keramat', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02020', 'Ampang', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02021', 'Petaling', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02022', 'Bandar Kuala Lumpur', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02023', 'Bandar Petaling Jaya', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02024', 'Bandar Baru Sungai Besi', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02025', 'Pekan Batu', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02026', 'Pekan Batu Caves', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02027', 'Pekan Kuala Pauh', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02028', 'Pekan Petaling', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02029', 'Pekan Salak Selantan', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02030', 'Pekan Setapak', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY02031', 'Pekan Sungai Besi', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03001', 'Mukim 13 ( Daerah Timur Laut )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03002', 'Mukim 14 ( Daerah Timur Laut )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03003', 'Mukim 15 ( Daerah Timur Laut )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03004', 'Mukim 16 ( Daerah Timur Laut )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03005', 'Mukim 17 ( Daerah Timur Laut )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03006', 'Mukim 18 ( Daerah Timur Laut )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03009', 'Bandar Bukit Bendera ( Daerah Timur Laut )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03010', 'Gelugor ( Daerah Timur Laut )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03037', 'Bandar Balik Pulau ( Daerah Barat Daya )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03038', 'Bandar Bayan Lepas ( Daerah Barat Daya )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03039', 'Mukim 1 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03040', 'Mukim 2 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03041', 'Mukim 3 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03042', 'Mukim 4 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03043', 'Mukim 5 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03044', 'Mukim 6 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03045', 'Mukim 7 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03046', 'Mukim 8 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03047', 'Mukim 9 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03048', 'Mukim 10 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03049', 'Mukim 11 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03050', 'Mukim 12 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03051', 'Mukim 13 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03052', 'Mukim 14 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03053', 'Mukim 15 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03054', 'Mukim 16 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03055', 'Butterworth - Bandar 1 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03056', 'Butterworth - Bandar 2 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03057', 'Butterworth - Bandar 3 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03058', 'Butterworth - Bandar 4 ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03059', 'Kepala Batas ( Seberang Perai Utara )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03060', 'Mukim 1 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03061', 'Mukim 2 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03062', 'Mukim 3 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03063', 'Mukim 4 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03064', 'Mukim 5 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03065', 'Mukim 6 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03066', 'Mukim 7 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03067', 'Mukim 8 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03068', 'Mukim 9 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03069', 'Mukim 10 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03070', 'Mukim 11 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03071', 'Mukim 12 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03072', 'Mukim 13 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03073', 'Mukim 14 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03074', 'Mukim 15 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03075', 'Mukim 16 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03076', 'Mukim 17 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03077', 'Mukim 18 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03078', 'Mukim 19 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03079', 'Mukim 20 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03080', 'Mukim 21 ( Seberang Perai Tengah )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03083', 'Mukim 1 ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03084', 'Mukim 2 ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03085', 'Mukim 3 ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03086', 'Mukim 4 ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03087', 'Mukim 5 ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03088', 'Mukim 6 ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03089', 'Mukim 7 ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03090', 'Mukim 8 ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03091', 'Mukim 9 ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03092', 'Mukim 10 ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03093', 'Mukim 11 ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03094', 'Mukim 12 ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03095', 'Mukim 13 ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03096', 'Mukim 14 ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03097', 'Mukim 15 ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03098', 'Mukim 16 ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03099', 'Bandar Nibong Tebal ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03100', 'Sungai Bakap Bandar ( Seberang Perai Selatan )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03300', 'Bandar 1 ( Air Itam )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03301', 'Bandar 2 ( Air Itam )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03302', 'Bandar 3 ( Air Itam )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03303', 'Bandar 4 ( Air Itam )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03304', 'Bandar 5 ( Air Itam )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03305', 'Bandar Batu Feringgi - Bandar 1', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03306', 'Bandar Batu Feringgi - Bandar 2', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03307', 'Bandar 1 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03308', 'Bandar 2 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03309', 'Bandar 3 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03310', 'Bandar 4 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03311', 'Bandar 5 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03312', 'Bandar 6 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03313', 'Bandar 7 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03314', 'Bandar 8 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03315', 'Bandar 9 West ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03316', 'Bandar 9 East ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03317', 'Bandar 10 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03318', 'Bandar 11 West ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03319', 'Bandar 11 East ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03320', 'Bandar 12 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03321', 'Bandar 13 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03322', 'Bandar 14 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03323', 'Bandar 15 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03324', 'Bandar 16 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03325', 'Bandar 17 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03326', 'Bandar 18 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03327', 'Bandar 19 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03328', 'Bandar 20 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03329', 'Bandar 21 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03330', 'Bandar 22 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03331', 'Bandar 23 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03332', 'Bandar 24 ( Georgetown )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03333', 'Bandar 1 ( Jelutong )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03334', 'Bandar 2 ( Jelutong )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03335', 'Bandar 3 ( Jelutong )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03336', 'Bandar 4. ( Jelutong )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03337', 'Bandar 1 ( Bandar Tanjong Tokong )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03338', 'Bandar 2 ( Bandar Tanjong Tokong )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03341', 'Bandar Tanjong Bungah', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03342', 'Pantai Acheh', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03343', 'Telok Bahang', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03344', 'Sg Rusa Bt Sg Pinang', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03345', 'Batu Itam', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03346', 'Batu Balik Pulau', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03347', 'Pondok Upeh', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03348', 'Bukit Genting', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03349', 'Bukit Pasir Panjng', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03350', 'Bukit Gemuruh', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03351', 'Bukit Relau', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03352', 'Teluk Kumbar', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03353', 'Bayan Lepas', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03354', 'Sungai Pinang (A)', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03355', 'Sungai Rusa (B)', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03356', 'Permatang Pasir (C )', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03357', 'Bagan Air Itam (D)', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03358', 'Titi Teras (E)', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03359', 'Kongsi (F)', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03360', 'Kampong Paya (G)', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03361', 'SungaiBurung (H)', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03362', 'Pulau Betong (I)', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03363', 'Dataran Genting (J)', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03364', 'Kawasan Perusahaan Mak Mandin', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03365', 'Bukit Mertajam -Bandar I', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03366', 'Bukit Mertajam -Bandar 2', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03367', 'Bukit Mertajam -Bandar 3', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03368', 'Bukit Mertajam -Bandar 4', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03369', 'Bukit Mertajam -Bandar 5', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03370', 'Bukit Mertajam -Bandar 6', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03371', 'Bandar Perai', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03372', 'Chai Leng Park', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03373', 'Kawasan Perusahaan Bandar Seberang Jaya & Kawasan Perusahaan Bagan Serai', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03374', 'Kawasan Perusahaan Perai', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03375', 'Supreme Garden', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03376', 'Palmco Prai', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY03377', 'Kawasan Perusahaan Perai', '52310', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04001', 'Bandar', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04002', 'Plentong', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04003', 'Sedenak', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04004', 'Pulai', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04005', 'Senai Kulai', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04006', 'Jelutong', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04007', 'Tebrau', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04008', 'Tanjung Kupang', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04009', 'Ulu Sungai Johor', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04010', 'Ulu Sg Sedili Besar', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04011', 'Sedili Besar', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04012', 'Sedili Kecil', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04013', 'Kota Tinggi', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04014', 'Johor Lama', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04015', 'Tanjung Surat', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04016', 'Kambau', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04017', 'Pengerang', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04018', 'Kluang 1', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04019', 'Kluang 2', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04020', 'Renggam', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04021', 'Machap', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04022', 'Layang-Layang', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04023', 'Ulu Benut', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04024', 'Paloh', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04025', 'Niyor', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04026', 'Lubok', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04027', 'Bagan', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04028', 'Minyak Beku', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04029', 'Kampung Baharu', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04030', 'Sungai Punggor', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04031', 'Sungai Kluang', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04032', 'Simpang Kiri', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04033', 'Peserai', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04034', 'Simpang Kanan', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04035', 'Sri Gading', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04036', 'Limau', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04037', 'Seri Medan', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04038', 'Chaah Bahru', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04039', 'Tanjung Semberong', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04040', 'Tangkak', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04041', 'Bukit Serampang', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04042', 'Bukit Kepong', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04043', 'Grisek', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04044', 'Lenga', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04045', 'Kundang Serom', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04046', 'Kesang', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04047', 'Sungai Terap', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04048', 'Jorak', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04049', 'Bakri', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04051', 'Parit Bakar', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04052', 'Parit Jawa', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04053', 'Sri Menanti', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04054', 'Air Hitam', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04055', 'Sungai Balang', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04056', 'Sungai Segamat', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04057', 'Jabi', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04058', 'Buluh Kasap', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04059', 'Gemas', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04060', 'Jementah', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04061', 'Gemereh', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04062', 'Pagoh', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04063', 'Chaah', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04064', 'Bekok', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04065', 'Sermin', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04066', 'Labis', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04067', 'Sungai Pinggan', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04068', 'Benut', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04069', 'Air Baloi', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04070', 'Api', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04071', 'Pontian', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04072', 'Pengkalan Raja', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04073', 'Pontian Kechil', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04074', 'Jeram Batu', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04075', 'Rimba Terjun', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04076', 'Sungai Karang', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04077', 'Ayer Masin', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04078', 'Serkat', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04079', 'Pulau-Pulau', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04080', 'Tenglu', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04081', 'Penyabong', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04082', 'Jemaluang', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04083', 'Kahang', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04084', 'Triang', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04085', 'Pandang Endau', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04086', 'Tenggaroh', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04087', 'Sembrong', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04088', 'Lenggor', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY04089', 'Mersing', '52315', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05001', 'Kampung Raja', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05002', 'Jerteh', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05003', 'Kertih', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05004', 'Kijal', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05007', 'Bukit Payung', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05008', 'Alur Limbat', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05009', 'Jengai', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05010', 'Jerangau 1', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05011', 'Jerangau II', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05012', 'Kuala Dungun 1', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05013', 'Kuala Dungun II', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05014', 'Paka', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05015', 'Kumpal', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05016', 'Pasir Raja', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05017', 'Keluang', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05018', 'Kuala Besut', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05019', 'Bukit Puteri', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05020', 'Pengkalan Nangka', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05021', 'Hulu Besut', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05022', 'Jabi', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05023', 'Kerandang', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05024', 'Pelagat', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05025', 'Lubuk Kawah', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05026', 'Pasir Akar', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05027', 'Tembila', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05028', 'Tenang', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05029', 'Kuala Bemban', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05030', 'Bukit Kenak', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05031', 'Hulu Telemong', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05032', 'Kuala Telemong', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05033', 'Hulu Berang', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05034', 'Jenagor', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05035', 'Penghulu Diman', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05036', 'Tanggol', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05037', 'Tersat', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05038', 'Kuala Berang', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05039', 'Losong/Paloh', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05040', 'Bandar', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05041', 'Batu Burok/Kuala Ibai', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05042', 'Batu Rakit/Wakaf Tengah', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05043', 'Batu Rakit/Wakaf Cagak', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05044', 'Batu Rakit/Bukit Cempaka', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05045', 'Belara/Banggol Peradong', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05046', 'Belara/Kesom', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05047', 'Belara/Pulau Bahagia', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05048', 'Bukit Besar', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05049', 'Chabang Tiga/PulauPulau', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05050', 'Chendering', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05051', 'Gelugur/Rengas', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05052', 'Gelugur Raja/Tok Jamal/Kubang Parit', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05053', 'Kuala Nerus/Seberang Takir', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05054', 'Kuala Nerus/Wakaf Tembesu', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05055', 'Kuala Nerus/Tepoh', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05056', 'Manir/Petai Bubus', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05057', 'Manir/Tanah Lot', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05058', 'Kesom/Belara', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05059', 'Kesom/Serada', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05060', 'Pekan Cabang Tiga', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05061', 'Pangadang Buloh/Atas tol', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05062', 'Tasik', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05063', 'Guntung', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05064', 'Pantai', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05065', 'Chaluk 1', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05066', 'Chaluk II', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05067', 'Merang', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05068', 'Hulu Nerus 1', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05069', 'Hulu Nerus II', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05070', 'Rusila', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05071', 'Pulau Kerengga', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05072', 'Jerong', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05073', 'Merchang', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05074', 'Chukai', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05075', 'Teluk Kalung', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05076', 'Kemasik', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05077', 'Hulu Chukai', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05078', 'Tebak', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05079', 'Binjai', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05080', 'Pasir Semut', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05081', 'Bandi', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05082', 'Hulu Jabur', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY05083', 'Banggul', '52317', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06001', 'Durian Sebatang', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06002', 'Changkat Jong', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06003', 'Rungkop', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06004', 'Labu Kubang', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06005', 'Bagan Datoh', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06006', 'Hutan Melintang', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06007', 'Sungai Durian', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06008', 'Teluk Baru', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06009', 'Sungai Manik', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06010', 'Lenggong', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06011', 'Lawin', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06012', 'Grik', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06013', 'Kerunai', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06014', 'Pengkalan Hulu', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06015', 'Belukar Semang', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06016', 'Temelong', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06017', 'Teja', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06018', 'Kampar', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06019', 'Ulu Kinta', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06020', 'Tanjung Tualang', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06021', 'Belanja', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06022', 'Sungai Terap', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06023', 'Sungai Raya', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06024', 'Sayong', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06025', 'Senggang', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06026', 'Kampung Buaia', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06027', 'Chegar Galah', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06028', 'Kota Lama Kiri', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06029', 'Lubok Merbau', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06030', 'Kota Lama Kanan', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06031', 'Pulau Kemiri', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06032', 'Parit Buntar', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06033', 'Tangung Piandang', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06034', 'Bagan Tiang', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06035', 'Kuala Kurau', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06036', 'Bagan Serai', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06037', 'Boriah', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06038', 'Gunung Semanggol', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06039', 'Selinsing', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06040', 'Matang', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06041', 'Terung', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06042', 'Sungai Tinggi', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06043', 'Bukit Gantang', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06044', 'Batu Kurau', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06045', 'Selama', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06046', 'Ulu Selama', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06047', 'Ijok', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06049', 'Bota', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06050', 'Lambor', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06051', 'Layang-Layang', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06052', 'Kampung Gajah', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06053', 'Kota Setia', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06054', 'Pasir Salak', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06055', 'Pasir Panjang Hulu', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06056', 'Bandar', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06057', 'Pulau Tiga', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06058', 'Slim', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06059', 'Hulu Bernam Timur', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06060', 'Hulu Bernam Barat', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06061', 'Chenderiang', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06062', 'Batang Padang', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06063', 'Bidor', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06064', 'Sungkai', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06065', 'Ulu Bernam', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06066', 'Lumut', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06067', 'Setiawan', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06068', 'Beruas', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06069', 'Lekir', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY06070', 'Pengkalan Baru', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07001', 'Sungai Karang', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07002', 'Temerloh', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07003', 'Triang I', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07004', 'Beserah', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07005', 'Batu Hitam', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07006', 'Tasik Cini', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07007', 'Bentong', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07008', 'Sabai', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07009', 'Pelangai', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07010', 'Tanah Rata', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07011', 'Brinchang', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07012', 'Kuala Tahan', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07013', 'Merapoh', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07014', 'Bandar Chenor', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07015', 'Padang Tungku', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07016', 'Seberang Chenor', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07017', 'Benta', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07018', 'Karak', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07019', 'Lanchang', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07020', 'Mentakab', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07021', 'Kerayong', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07022', 'Fraser''s Hill', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07023', 'Mengkuang', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07024', 'Cherating', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07025', 'Gambang', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07026', 'Sungai Lembing', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07100', 'Ulu Telom', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07101', 'Ringlet', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07102', 'Pedah', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07103', 'Teh', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07104', 'Hulu Tembeling', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07105', 'Kuala Tembeling', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07106', 'Tembeling Tengah', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07107', 'Tebing Tinggi', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07108', 'Pulau Tawar', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07109', 'Burau', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07110', 'Ulu Cheka', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07111', 'Kelola', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07112', 'Kuala Kuantan I', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07113', 'Kuala Kuantan II', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07114', 'Ulu Kuantan', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07115', 'Ulu Lepar', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07116', 'Sg. Karang', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07117', 'Beserah', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07118', 'Penor', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07119', 'Cheka I (Mela)', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07120', 'Cheka II (Kerambit)', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07121', 'Tanjung Besar', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07122', 'Batu Yon I (Bukit Betong)', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07123', 'Batu Yon II (Merapuh)', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07124', 'Kuala Lipis', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07125', 'Gua', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07126', 'Kechau', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07127', 'Ulu Jelai', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07128', 'Telang', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07129', 'Penjom', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07130', 'Luit I', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07131', 'Luit II', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07132', 'Jengka I', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07133', 'Jengka II', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07134', 'Kertau', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07135', 'Bukit Segumpal', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07136', 'Pekan I', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07137', 'Pekan II', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07138', 'Penyor I', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07139', 'Penyor II', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07140', 'Langgar I', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07141', 'Langgar II', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07142', 'Kuala Pahang', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07143', 'Bebar', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07144', 'Lepar', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07145', 'Pulau Manis', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07146', 'Ghanchong', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07147', 'Temai', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07148', 'Pahang Tua', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07149', 'Pualu Rusa', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07150', 'Gali I', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07151', 'Gali II', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07152', 'Sega I', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07153', 'Sega II', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07154', 'Dong', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07155', 'Ulu dong', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07156', 'Tras', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07157', 'Semantan Ulu', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07158', 'Rompin', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07159', 'Tioman', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07160', 'Keratong', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07161', 'Endau', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07162', 'Potian', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07163', 'Perak I', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07164', 'Perak II', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07165', 'Jenderak I', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07166', 'Jenderak II', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07167', 'Labak', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07168', 'Semantan I', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07169', 'Semantan II', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07170', 'Songsang', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07171', 'Lipat Kajang', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07172', 'Sanggang I', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07173', 'Sanggang II', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07174', 'Kerdau', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07175', 'Mendakab 1', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07176', 'Mentakab II', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07177', 'Bangau', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07178', 'Triang II', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07179', 'Bera I', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY07180', 'Bera II', '52318', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12102', 'Not Available', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08001', 'Glami Lemi', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08002', 'Ulu Klawang', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08003', 'Ulu Teriang', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08004', 'Kenaboi', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08005', 'Kuala Klawang', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08006', 'Peradong', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08007', 'Pertang', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08008', 'Triang Hilir', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08016', 'Ampang Tinggi', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08017', 'Ulu Jempol', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08018', 'Ulu Muar', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08019', 'Johol', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08020', 'Juasseh', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08021', 'Kepis', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08022', 'Langkap', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08023', 'Parit Tinggi', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08024', 'Pilah', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08025', 'Terachi Sri Menanti', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08040', 'Jimah', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08041', 'Linggi', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08042', 'Pasir Panjang', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08043', 'Port Dickson', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08044', 'Seri Rusa', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08061', 'Batu Hampar', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08062', 'Bongek', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08063', 'Chembong', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08064', 'Chengkau', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08065', 'Gadong', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08066', 'Kundor', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08067', 'Legong Ilir', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08068', 'Legong Ulu', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08069', 'Miku', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08070', 'Nerasau', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08071', 'Pedas', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08072', 'Pilin', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08073', 'Selemak', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08074', 'Semerbok', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08075', 'Sepri', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08076', 'Tanjung Kling', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08077', 'Titian Bintangor', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08089', 'Ampangan Pantai', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08090', 'Labu', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08091', 'Lenggeng', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08093', 'Rantau', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08094', 'Rasah', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08096', 'Setul', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08130', 'Gemencheh', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08139', 'Repah', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08141', 'Jelai', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08142', 'Kuala Jempol', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08143', 'Rompin', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08144', 'Serting Hilir', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08145', 'Serting Ulu', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08146', 'Serting', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08147', 'Jempol', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08155', 'Ayer Kuning', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08156', 'Gemas', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08157', 'Bandar Gemas', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08158', 'Pekan Ayer Kuning', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08159', 'Pekan Pasir Besar', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08300', 'Nilai', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08301', 'Ampangan', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY08302', 'Gemas/Air Kuning', '52313', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12103', 'Not Available', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09001', 'Melimau', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09002', 'Pekan Lobuk China', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09003', 'Masjid Tanah', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09004', 'Jasin', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09005', 'Sungai Udang', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09006', 'Durian Tunggal', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09007', 'Tanjung Keling', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09008', 'Ayer Molek', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09009', 'Batu Berendam', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09010', 'Bembam', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09011', 'Kota Lama', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09012', 'Ayer Keroh', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09013', 'Bandar Hilir', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09014', 'Bandar Kaba', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09015', 'Bandar Masjid Tanah Sek III', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09016', 'Kota Melaka', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09017', 'Ayer Paabas', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09018', 'Belimbing', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09020', 'Brisu', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09021', 'Kelemak', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09022', 'Gadek', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09023', 'Kemuning', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09024', 'Kuala Linggi', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09025', 'Kuala Sungai Baru', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09026', 'Lendu', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09027', 'Machap', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09028', 'Melaka Pindaii', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09030', 'Melekek', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09031', 'Padang Sebang', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09032', 'Parit Melana', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09033', 'Pegoh', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09034', 'Pulau Sebang', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09035', 'Ramuan China Besar', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09036', 'Ramuan China Kechil', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09037', 'Rembia', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09038', 'Sungai Baru Ilir', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09039', 'Sungai Baru Ulu', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09040', 'Sungai Baru Tengah', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09041', 'Sungai Buluh', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09042', 'Sungai Petai', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09043', 'Sungai Siput', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09044', 'Taboh Naning', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09045', 'Tanjong Rimau', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09046', 'Tebong', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09047', 'Bandar Alor Gajah Sek. I', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09048', 'Bandar Alor Gajah Sek. II', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09049', 'Bandar Masjid Tanah Sek.I', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09050', 'Bandar Masjid tanah Sek. II', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09051', 'Bandar Pulau Sebang Sek. I', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09052', 'Bandar Pulau Sebang Sek. II', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09053', 'Pekan Durian Tunggal', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09054', 'Pekan Kuala Sungai Baru', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09055', 'Pekan Rembia', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09056', 'Ayer Panas', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09057', 'Batang Melaka', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09058', 'Bukit Senggeh', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09059', 'Chabau', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09060', 'Chinchin', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09061', 'Chobong', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09062', 'Jus', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09063', 'Kesang', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09064', 'Rim', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09065', 'Sebatu', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09066', 'Selandar', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09067', 'Sempang', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09068', 'Semujok', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09069', 'Serkam', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09070', 'Sungai Rambai', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09071', 'Tedong', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY09072', 'Umbai', '52314', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10001', 'Sungai Petani', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10002', 'Sungai Pasir', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10003', 'Pengkalan Kundor', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10004', 'Kulim', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10005', 'Sik', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10006', 'Gurun', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10007', 'Ayer Puteh', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10008', 'Sungai Seluang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10009', 'Alor Malai', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10010', 'Derga', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10011', 'Kota Setar', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10012', 'Kuah', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10013', 'Kupang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10014', 'Temin', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10015', 'Keladi', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10016', 'Sala Besar', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10017', 'Naga', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10018', 'Pulai', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10019', 'Jitra', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10020', 'Tekai', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10021', 'Tawar', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10022', 'Yan', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10023', 'Jerlun', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10024', 'Teloi Kanan', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10025', 'Pumpong', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10026', 'Kuala Kedah', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10027', 'Mergong', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10028', 'Tajar', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10029', 'Lunas', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10030', 'Semeling', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10031', 'Merbok', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10032', 'Jeneri', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10033', 'Bakai', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10034', 'Bukit Raya', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10035', 'Siong', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10036', 'Sidam Kanan', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10037', 'Bagan Samak', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10038', 'Pekula', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10039', 'Sungai Daun', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10040', 'Serdang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10041', 'Ulu Melaka', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10042', 'Alor Merah', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10043', 'Keplu', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10044', 'Padang Kerbau', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10045', 'Teloi Kiri', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10046', 'Sanglang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10047', 'Gajah Mati', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10048', 'Padang Pusing', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10049', 'Padang China', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10050', 'Ayer Hangat', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10051', 'Sungai Laka', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10052', 'Padang Matsirat', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10053', 'Anak Bukit', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10054', 'Jabi', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10055', 'Kangkong', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10056', 'Belimbing Kanan', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10057', 'Nagalilit', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10058', 'Kedawang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10059', 'Sok', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10060', 'Rambai', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10061', 'Jeram', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10062', 'Karangan', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10063', 'Baling', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10064', 'Sala Kechil', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10065', 'Padang Lalang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10066', 'Telok Kechai', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10067', 'Pinang Tunggal', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10068', 'Guar Kepayang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10069', 'Bujang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10070', 'Sidam Kiri', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10071', 'Hutan Kampong', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10072', 'Gelong', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10073', 'Gunong', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10074', 'Tunjang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10075', 'Padang Meha', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10076', 'Langgar', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10077', 'Pering', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10078', 'Tualang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10079', 'Ah', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10080', 'Telok Chengai', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10081', 'Bagan Sena', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10082', 'Pedu', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10083', 'Bukit Tinggi', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10084', 'Tobiar', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10085', 'Bongor', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10086', 'Bukit Lada', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10087', 'Bukit Meriam', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10088', 'Bukit Pinang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10089', 'Kubang Rotan', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10090', 'Simpor', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10091', 'Bohor', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10092', 'Lesong', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10093', 'Putat', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10094', 'Dulang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10095', 'Padang Temak', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10096', 'Padang Peliang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10097', 'Sungai Ular', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10098', 'Titi Gajah', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10099', 'Selama', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10100', 'Tebengau', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10101', 'Padang Hang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10102', 'Junjong', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10103', 'Terap', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10104', 'Derang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10105', 'Padang Terap Kiri', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10106', 'Sungai Batu', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10107', 'Padang Perahu', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10108', 'Binjal', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10109', 'Mahang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10110', 'Kota', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10111', 'Kuala', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10112', 'Singkir', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10113', 'Hosba', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10114', 'Telaga Mas', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10115', 'Sedim', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10116', 'Malau', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10117', 'Relau', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10118', 'Rantau Panjang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10119', 'Tualak', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10120', 'Kubang Pasu', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10121', 'Kurong Hitam', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10122', 'Lepai', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10123', 'Sungai Kechil Ilir', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10124', 'Belimbing Kiri', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10125', 'Pelubang', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10126', 'Sungai Baru', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10127', 'Wang Tepus', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10128', 'Lengkuas', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10129', 'Padang Terap Kanan', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10130', 'Batang Tunggang Kanan', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10131', 'Limbong', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10132', 'Batang Tunggang Kiri', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10133', 'Haji Kudong', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY10134', 'Permatang Pasir', '52309', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11001', 'Titi Tinggi', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11002', 'Beseri', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11003', 'Chuping', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11004', 'Padang Siding', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11005', 'Kurong Batang', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11006', 'Paya', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11007', 'Abi', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11008', 'Oran', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11009', 'Padang Pauh', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11010', 'Ngolang', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11011', 'Kechor', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11012', 'Sena', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11013', 'Jejawi', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11014', 'Sungai Adam', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11015', 'Arau', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11016', 'Kurong Anai', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11017', 'Utan Aji', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11018', 'Wang Bintong', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11019', 'Pekan Kuala Perlis', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11020', 'Seriap', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11021', 'Kayang', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11022', 'Sanglang', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11023', 'Bandar Arau', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11024', 'Bandar Kangar', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11025', 'Pekan Arau', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11026', 'Pekan Padang Besar', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY11027', 'Pekan Kaki Bukit', '52308', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12001', 'Sapong', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12002', 'Rundum', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12003', 'Tomani', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12004', 'Kemabong', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12005', 'Entabuan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12006', 'Mangkaladoi', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12007', 'Tamparuli', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12008', 'Topokon', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12009', 'Tenghilan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12010', 'Lanas', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12011', 'Tulid', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12012', 'Sook', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12013', 'Dalit', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12015', 'Liwagu', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12016', 'Tagudan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12017', 'Paus', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12018', 'Kundusang-Bunduk Tuhan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12019', 'Perancangan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12020', 'Melinsuh', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12021', 'Ulu Sugut', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12022', 'Mukim I', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12023', 'Mukim II', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12024', 'Mukim III', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12025', 'Mukim IV', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12026', 'Petagas', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12027', 'Pasir Putih', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12028', 'Putatan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12029', 'Lok Kawi', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12030', 'Buit', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12031', 'Karanaan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12032', 'Kedamaian', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12033', 'Usukan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12034', 'Tempasuh', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12035', 'Nangoh', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12036', 'Sapi', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12037', 'Tetabuan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12038', 'Klagan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12039', 'Liwogu', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12040', 'Ulu Labuk', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12041', 'Tongod', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12042', 'Lingkabau', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12043', 'Sungai-Sungai', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12044', 'Jambongan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12045', 'Tangkarason', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12046', 'Beaufort', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12047', 'Malabau/Ran. Klias', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12048', 'Kota Klias', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12049', 'Limbawang', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12050', 'Mentenior/Lajau', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12051', 'Kundasang', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12052', 'Lohan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12053', 'Bongkud', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12054', 'Timbua', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12055', 'Malinsou', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12057', 'Nalapak', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12058', 'Paginatan/Paus', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12059', 'Pangi', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12060', 'Madai', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12061', 'Mangaris', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12062', 'Simpangan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12063', 'Tagaroh', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12064', 'Bongon', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12065', 'Ongkilan', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12066', 'Tingkalanon', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12067', 'Talantang', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12068', 'Ulu Bengkoka', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12069', 'Marak Parak', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12070', 'Luba Palumpong', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12071', 'Gana', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY12100', 'Not Available', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13100', 'Pueh', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13101', 'Gading Lundu', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13102', 'Stungkor', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13103', 'Sampadi', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13104', 'Jagoi', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13105', 'Senggi-Poak', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13106', 'Matang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13107', 'Salak', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13108', 'Pangkalan Ampat', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13109', 'Kuching North', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13110', 'Kuching Central', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13111', 'Kuching Town', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13112', 'Sentah-Segu', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13113', 'Muara Tebas', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13114', 'Batu Kawa', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13115', '8th Mile (Matang Road)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13116', 'Sungai Tengah', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13117', 'Batu Kitang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13118', '15th Mile (Simanggang Road)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13119', '17.5th Mile (Simanggang Road)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13120', '19th Mile (Simanggang Road)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13121', '24th Mile (Simanggang Road)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13122', 'Beliong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13123', 'Kuching Occupation Ticket', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13124', 'Bau Occupation Ticket', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13125', 'Bako', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13126', 'Santubong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13127', 'Sematan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13128', 'Lundu', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13129', 'Jangkar', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13130', 'Rambungan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13131', 'Kranji', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13132', 'Siniawan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13133', 'Paku Town', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13134', 'Jambusan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13135', 'Bau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13136', 'Buso', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13137', 'Tondong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13138', 'Musi', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13139', 'Tai Ton', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13140', 'Bidi', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13141', 'Krokong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13142', 'Pangkalan Tebang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13143', 'Pejiru', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13144', 'Tiang Bekap', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13145', 'Beratok', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13146', 'Tapah', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13147', 'Siburan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13148', '17th Mile (Simanggang Road)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13149', '15th Mile', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13150', 'Undup', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13151', 'Klauh', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13152', 'Bijat', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13153', 'Skrang Town', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13154', 'Kranggas', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13155', 'Marup', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13156', 'Lemanak', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13157', 'Bukit Besai', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13158', 'Ai Engkari', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13159', 'Lesong (Samarahan)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13160', 'Selanjan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13161', 'Silantek', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13162', 'Triso', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13163', 'Awik-Krian', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13164', 'Budu', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13165', 'Seblak', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13166', 'Simanggang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13167', 'Lingga', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13168', 'Lubok Antu', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13169', 'Engkelili', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13170', 'Batu Lintang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13171', 'Kaki Wong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13172', 'Kaba', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13173', 'Grigat', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13174', 'Lidong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13175', 'Banting', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13176', 'Bakong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13177', 'Nanga Ap', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13178', 'Bungin', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13179', 'Lubau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13180', 'Samarang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13181', 'Tebalau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13182', 'Skrang Land', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13183', 'Melugu', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13184', 'Sabu', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13185', 'Padeh', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13186', 'Seduan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13187', 'Engkilo', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13188', 'Pasai-Siong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13189', 'Assan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13190', 'Menyan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13191', 'Kedang (Mukah)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13192', 'Lukut', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13193', 'Mapai', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13194', 'Maroh', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13195', 'Spali', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13196', 'Spapa', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13197', 'Paku Land (Betong)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13198', 'Lalai', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13199', 'Gigis', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13200', 'Selangau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13201', 'Arip', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13202', 'Pelugau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13203', 'Bawan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13204', 'Buloh', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13205', 'Sibu Town', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13206', 'Sungai Merah', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13207', 'Teku', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13208', 'Durin', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13209', 'Kanowit', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13210', 'Dap', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13211', 'Machan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13212', 'Ngemah', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13213', 'Sengayan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13214', 'Sibintek', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13215', 'Miri Concession', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13216', 'Lutong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13217', 'Riam Road Bazaar', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13218', 'Kuala Baram Land', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13219', 'Kuala Baram Town', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13220', 'Lambir', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13221', 'Marudi', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13222', 'Lubok Nibong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13223', 'Beluru', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13224', 'Long Lama', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13225', 'Long Teru', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13226', 'Long Akah', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13227', 'Puyut', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13228', 'Kamunting', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13229', 'Bakong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13230', 'Tinjar', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13231', 'Teraja', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13232', 'Telang Usang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13233', 'Bok', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13234', 'Akah', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13235', 'Dulit', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13236', 'Bekenu', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13237', 'Sibuti', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13238', 'Bukit Kisi', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13239', 'Niah Land', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13240', 'Batu Niah', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13241', 'Suai Town', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13242', 'Niah Town', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13243', 'Suai Land', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13244', 'Sawai', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13245', 'Kuala Nyabor (Miri)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13246', 'Bario', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13247', 'Apoh', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13248', 'Lio Matoh', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13249', 'Silat', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13250', 'Tutoh', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13251', 'Patah', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13252', 'Lepu Leju', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13253', 'Danau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13254', 'Pandaruan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13255', 'Limbang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13256', 'Batu Danau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13257', 'Nanga Medamit', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13258', 'Ukong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13259', 'Sungai Medalam', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13260', 'Long Napir', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13261', 'Sungai Adang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13262', 'Batu Lawi', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13263', 'Trusan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13264', 'Lawas Town', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13265', 'Merapok Land', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13266', 'Trusan Town Land', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13267', 'Lawas Land', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13268', 'Merapok Town', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13269', 'Sundar', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13270', 'Tengoa-Sukang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13271', 'Long Merarap', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13272', 'Long Semado', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13273', 'Ba Kelalan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13274', 'Sarikei', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13275', 'Kedang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13276', 'Buan (Bintulu)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13277', 'Sare', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13278', 'Paloh (Sarikei)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13279', 'Belawai (Mukah)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13280', 'Selalang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13281', 'Rajang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13282', 'Jerijeh (Mukah)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13283', 'Bruit (Mukah)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13284', 'Daro Town (Sarikei)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13285', 'Jemoreng (Mukah)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13286', 'Kedang (Sarikei)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13287', 'Oya-Dalat (Mukah)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13288', 'Matu (Mukah)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13289', 'Igan (Mukah)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13290', 'Seredeng', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13291', 'Maradong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13292', 'Tulai', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13293', 'Binatang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13294', 'Pedanum', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13295', 'Melurun', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13296', 'Jikang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13297', 'Julau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13298', 'Pakan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13299', 'Tekoyong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13300', 'Gunong Ayer', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13301', 'Katibas', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13302', 'Ibau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13303', 'Menuan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13304', 'Suau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13305', 'Oyan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13306', 'Baning', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13307', 'Majau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13308', 'Merirai', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13309', 'Metah', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13310', 'Rirong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13311', 'Mamau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13312', 'Angkuah', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13313', 'Pelagus', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13314', 'Kapit', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13315', 'Song', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13316', 'Bangkit', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13317', 'Batu Laga', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13318', 'Plandok', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13319', 'Entemu', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13320', 'Mengiong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13321', 'Serani', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13322', 'Balui', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13323', 'Kumbong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13324', 'Murum', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13325', 'Punan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13326', 'Danum', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13327', 'Lesong (Sri Aman)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13328', 'Menuku', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13329', 'Kayan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13330', 'Samarahan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13331', 'Muara Tuang Town', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13332', 'Bukar-Sadong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13333', 'Sungai Kedup', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13334', 'Melikin', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13335', 'Sedilu-Gedong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13336', 'Sadong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13337', 'Sebangan-Kepayang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13338', 'Punda-Sabal', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13339', 'Sebuyau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13340', 'Pangkalan Kut', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13341', 'Batu Gong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13342', 'Tanah Merah', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13343', 'Sungai Merang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13344', 'Sungai Palah', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13345', '27th Mile (Simanggang Road)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13346', '29th Mile (Simanggang Road)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13347', '32nd Mile (Simanggang Road)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13348', '34 ½ Mile (Simanggang Road)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13349', 'Serian', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13350', 'Tebakang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13351', 'Muara Mongkos', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13352', 'Tebedu', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13353', 'Balai Ringin', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13354', 'Tambirat', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13355', 'Muara Tuang Land', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13356', 'Simunjan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13357', 'Gedong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13358', 'Sebangan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13359', 'Tebelu', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13360', 'Terbat', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13361', 'Bintulu', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13362', 'Kemena', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13363', 'Sebauh', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13364', 'Lavang Town', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13365', 'Pandan Town', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13366', 'Tubau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13367', 'Lavang Land', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13368', 'Selezu', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13369', 'Batu Kapal', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13370', 'Rasan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13371', 'Pandan Land', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13372', 'Kuala Tatau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13373', 'Tatau', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13374', 'Buan (Mukah)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13375', 'Sangan', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13376', 'Anap', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13377', 'Kakus', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13378', 'Kuala Nyabor (Bintulu)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13379', 'Jelalong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13380', 'Binio', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13381', 'Sadok', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13382', 'Paku Land (Sibu)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13383', 'Sablor', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13384', 'Rimbas', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13385', 'Betong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13386', 'Spaoh', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13387', 'Debak', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13388', 'Pusa', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13389', 'Saratok', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13390', 'Kabong', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13391', 'Roban', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13392', 'Pantu', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13393', 'Maludam', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13394', 'Beladin', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13395', 'Kalaka', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13396', 'Batu Api', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13397', 'Retus', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13398', 'Lassa', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13399', 'Semah', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13400', 'Jemoreng (Sarikei)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13401', 'Bruit (Sarikei)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13402', 'Kedang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13403', 'Buan (Sarikei)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13404', 'Oya-Dalat (Sarikei)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13405', 'Baoh', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13406', 'Mukah', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13407', 'Sikat', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13408', 'Balingian', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13409', 'Bawa And District', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13410', 'Daro Land (Mukah)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13411', 'Matu (Sarikei)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13412', 'Paloh (Mukah)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13413', 'Belawai (Sarikei)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13414', 'Rejang', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13415', 'Jerijeh (Sarikei)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13416', 'Igan (Sarikei)', '52319', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13417', 'Jalan Rancha Rancha', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13418', 'Pekan Kinrara', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13419', 'Kg Rancha-Rancha', '50000', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13420', 'Panchang Bedena', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13421', 'Kota Kinabalu', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13422', 'Kg Pangkalan Abai', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13423', 'Kg Nosoob', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13424', 'Kuala Menggatal', '52320', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13425', 'Simpang', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13426', 'Hulu Kinta', '52311', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, REF_ENTRY_CODE, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, COUNTRY) Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MY13427', 'Bandar Petaling Jaya', '52312', category_id, category_code, '1', 'MY' from common_code_category where category_code = 'MUKIM';

/****************************************************
Category Code: LIQUIDATION_EXPENSE_TYPE
Category Name: Liquidation Expense Type Category
*****************************************************/

INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'LIQUIDATION_EXPENSE_TYPE', 'Liquidation Expense Type Category', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
 SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'AUC_COMM', 'Auction Commission', category_id, 'LIQUIDATION_EXPENSE_TYPE', '1' from common_code_category where category_code = 'LIQUIDATION_EXPENSE_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
 SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'AUC_COST', 'Auction Cost', category_id, 'LIQUIDATION_EXPENSE_TYPE', '1' from common_code_category where category_code = 'LIQUIDATION_EXPENSE_TYPE';
 
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
 SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'INS_PREMIUM', 'Insurance Premium', category_id, 'LIQUIDATION_EXPENSE_TYPE', '1' from common_code_category where category_code = 'LIQUIDATION_EXPENSE_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
 SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'LEGAL_FEE', 'Legal Fees', category_id, 'LIQUIDATION_EXPENSE_TYPE', '1' from common_code_category where category_code = 'LIQUIDATION_EXPENSE_TYPE';
  
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
 SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'LIQ_FEE', 'Liquidation Fees', category_id, 'LIQUIDATION_EXPENSE_TYPE', '1' from common_code_category where category_code = 'LIQUIDATION_EXPENSE_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
 SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'OTH_EXP', 'Other Expenses', category_id, 'LIQUIDATION_EXPENSE_TYPE', '1' from common_code_category where category_code = 'LIQUIDATION_EXPENSE_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
 SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'QUIT_RENT', 'Quit Rent/Assessment Fees', category_id, 'LIQUIDATION_EXPENSE_TYPE', '1' from common_code_category where category_code = 'LIQUIDATION_EXPENSE_TYPE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
 SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'REC_FEE', 'Receiver''s Fees', category_id, 'LIQUIDATION_EXPENSE_TYPE', '1' from common_code_category where category_code = 'LIQUIDATION_EXPENSE_TYPE';


/****************************************************
Category Code: LIQUIDATION_RECOVERY_TYPE
Category Name: Liquidation Recovery Type - Purpose of Recovery
*****************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
 values
 (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'LIQUIDATION_RECOVERY_TYPE', 'Liquidation Recovery Type - Purpose of Recovery', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
 SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'BOR', 'Borrower', category_id, 'LIQUIDATION_RECOVERY_TYPE', '1' from common_code_category where category_code = 'LIQUIDATION_RECOVERY_TYPE';
 
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
 SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'FAC', 'Facility', category_id, 'LIQUIDATION_RECOVERY_TYPE', '1' from common_code_category where category_code = 'LIQUIDATION_RECOVERY_TYPE';
 
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
 SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'COL', 'Collateral', category_id, 'LIQUIDATION_RECOVERY_TYPE', '1' from common_code_category where category_code = 'LIQUIDATION_RECOVERY_TYPE';
 
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
 SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'OTH', 'Other Costs', category_id, 'LIQUIDATION_RECOVERY_TYPE', '1' from common_code_category where category_code = 'LIQUIDATION_RECOVERY_TYPE';

 
/****************************************************
Category Code: PHYSICAL_INSPECTION_STATUS
Category Name: Physical Inspection Status
*****************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
 values
 (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'PHYSICAL_INSPECTION_STATUS', 'Physical Inspection Status', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
 SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'S', 'Satisfactory', category_id, 'PHYSICAL_INSPECTION_STATUS', '1' from common_code_category where category_code = 'PHYSICAL_INSPECTION_STATUS';
 
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
 SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'N', 'Not Satisfactory', category_id, 'PHYSICAL_INSPECTION_STATUS', '1' from common_code_category where category_code = 'PHYSICAL_INSPECTION_STATUS';
 
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
 SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'D', 'Not Done', category_id, 'PHYSICAL_INSPECTION_STATUS', '1' from common_code_category where category_code = 'PHYSICAL_INSPECTION_STATUS';
 

/****************************************************
Category Code: SCHEDULED_LOCATION
Category Name: Scheduled Location
*****************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
 values
 (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'SCHEDULED_LOCATION', 'Scheduled Location', 2, 'A'); 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq, 'HS', 'Hillslopes/Hillsides/Hilltops', '1','SCHEDULED_LOCATION', 'MY', category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq, 'LS', 'Limestone Soil', '1','SCHEDULED_LOCATION', 'MY', category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq, 'PS', 'Peat Soil', '1','SCHEDULED_LOCATION', 'MY', category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq, 'EL', 'Ex-mining Land', '1','SCHEDULED_LOCATION', 'MY', category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq, 'RB', 'River Banks', '1','SCHEDULED_LOCATION', 'MY', category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq, 'CA', 'Coastal Areas', '1','SCHEDULED_LOCATION', 'MY', category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq, 'SL', 'Sanitary Landfills/Dumpsites', '1','SCHEDULED_LOCATION', 'MY', category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq, 'FA', 'Flood-prone Areas', '1','SCHEDULED_LOCATION', 'MY', category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';

-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'JN', 'Junction', '1', category_code, category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'CFP', 'Cemetery / Funeral Parlour', '1', category_code, category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'HS', 'Hillslope', '1', category_code, category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'POS', 'Power Station', '1', category_code, category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'PES', 'Petrol Station', '1', category_code, category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'POW', 'Place of Worship', '1', category_code, category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'RL', 'Remaining lease<20 years upon maturity of loan', '1', category_code, category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'SCH', 'Schools', '1', category_code, category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'EFP', 'Earthquake / Flood prone', '1', category_code, category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'SP', 'Sewerage Plant', '1', category_code, category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'SQT', 'Squatters', '1', category_code, category_id from common_code_category where category_code = 'SCHEDULED_LOCATION';

 
/****************************************************
Category Code: DEV_GRP_CO
Category Name: Property - Developer Group Company
*****************************************************/ 
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'DEV_GRP_CO', 'Property - Developer Group Company', 2, 'A'); 

 
/*********************************
Category Code: AIRCRAFT_TYPE
Category Name: Aircraft Type
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'AIRCRAFT_TYPE', 'Aircraft Type', 2, 'A');

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, '101', 'AIR TRANSPORT', CATEGORY_ID, CATEGORY_CODE, '1'
FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE='AIRCRAFT_TYPE';


/*********************************
Category Code: AB_OTHERS_TYPE
Category Name: Asset Based: Others Type (Asset Type field)
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'AB_OTHERS_TYPE', 'Asset Based: Others Type (Asset Type field)', 2, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, '099', 'OTHERS - VEHICLES/EQUIPMENT', '1', category_code, category_id from common_code_category where category_code = 'AB_OTHERS_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, '143', 'MOTOR VEHICLES - OTHERS', '1', category_code, category_id from common_code_category where category_code = 'AB_OTHERS_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, '146', 'OTHERS - AGRICULTURAL', '1', category_code, category_id from common_code_category where category_code = 'AB_OTHERS_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, '147', 'OTHERS INDUSTRIAL/CONSTRUCTION', '1', category_code, category_id from common_code_category where category_code = 'AB_OTHERS_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, '148', 'OTHERS - RETAIL & W/SALE', '1', category_code, category_id from common_code_category where category_code = 'AB_OTHERS_TYPE';


/*********************************
Category Code: COVENANT_CONDITION
Category Name: Covenant / Condition
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'COVENANT_CONDITION', 'Covenant / Condition', 2, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'SINKING_FUND', 'Sinking Fund', '1', category_code, category_id from common_code_category where category_code = 'COVENANT_CONDITION';


/*******************************************
Category Code: EXTENSION_WALL_TYPE
Category Name: Extension Wall Type
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'EXTENSION_WALL_TYPE', 'Extension Wall Type', 2, 'A'); 

--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'1','Brick',category_id, category_code, '1', '' from common_code_category where category_code = 'EXTENSION_WALL_TYPE';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'2','Concrete',category_id, category_code, '1', '' from common_code_category where category_code = 'EXTENSION_WALL_TYPE';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'3','Wooden',category_id, category_code, '1', '' from common_code_category where category_code = 'EXTENSION_WALL_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'W01','Brick',category_id, category_code, '1', '' from common_code_category where category_code = 'EXTENSION_WALL_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'W02','Concrete',category_id, category_code, '1', '' from common_code_category where category_code = 'EXTENSION_WALL_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'W03','Brick/Concrete',category_id, category_code, '1', '' from common_code_category where category_code = 'EXTENSION_WALL_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'W04','Others',category_id, category_code, '1', '' from common_code_category where category_code = 'EXTENSION_WALL_TYPE';


/*******************************************
Category Code: EXTENSION_ROOF_TYPE
Category Name: Extension Roof Type
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'EXTENSION_ROOF_TYPE', 'Extension Roof Type', 2, 'A'); 

--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'1','Tiles',category_id, category_code, '1', '' from common_code_category where category_code = 'EXTENSION_ROOF_TYPE';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'2','Concrete',category_id, category_code, '1', '' from common_code_category where category_code = 'EXTENSION_ROOF_TYPE';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'3','Asbestos',category_id, category_code, '1', '' from common_code_category where category_code = 'EXTENSION_ROOF_TYPE';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'4','Zinc',category_id, category_code, '1', '' from common_code_category where category_code = 'EXTENSION_ROOF_TYPE';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'5','Others',category_id, category_code, '1', '' from common_code_category where category_code = 'EXTENSION_ROOF_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'R01','Tiles',category_id, category_code, '1', '' from common_code_category where category_code = 'EXTENSION_ROOF_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'R02','Concrete',category_id, category_code, '1', '' from common_code_category where category_code = 'EXTENSION_ROOF_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'R03','Tile/Concrete',category_id, category_code, '1', '' from common_code_category where category_code = 'EXTENSION_ROOF_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'R04','Others',category_id, category_code, '1', '' from common_code_category where category_code = 'EXTENSION_ROOF_TYPE';


/*******************************************
Category Code: BUILDING_TYPE
Category Name: Building Type
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'BUILDING_TYPE', 'Building Type', 2, 'A'); 

--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'1','Flat/ Apartment/ Condominium',category_id, category_code, '1', '' from common_code_category where category_code = 'BUILDING_TYPE';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'2','Terraced House',category_id, category_code, '1', '' from common_code_category where category_code = 'BUILDING_TYPE';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'3','Semi Detached House/ Detached House ',category_id, category_code, '1', '' from common_code_category where category_code = 'BUILDING_TYPE';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'4','Shophouse/ Commercial',category_id, category_code, '1', '' from common_code_category where category_code = 'BUILDING_TYPE';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'5','Factory/ Industrial Premises',category_id, category_code, '1', '' from common_code_category where category_code = 'BUILDING_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select next value for common_code_category_entry_seq, 'B01', 'TERRACE RES. HOUSE', category_id, category_code, '1', '' from common_code_category where category_code = 'BUILDING_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select next value for common_code_category_entry_seq, 'B02', 'SEMI DETACHED HOUSE', category_id, category_code, '1', '' from common_code_category where category_code = 'BUILDING_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select next value for common_code_category_entry_seq, 'B03', 'BUNGALOW', category_id, category_code, '1', '' from common_code_category where category_code = 'BUILDING_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select next value for common_code_category_entry_seq, 'B04', 'FLAT/APT/CONDO/T HSE', category_id, category_code, '1', '' from common_code_category where category_code = 'BUILDING_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select next value for common_code_category_entry_seq, 'B05', 'SHOP HOUSE', category_id, category_code, '1', '' from common_code_category where category_code = 'BUILDING_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select next value for common_code_category_entry_seq, 'B06', 'SHOP OFFICE', category_id, category_code, '1', '' from common_code_category where category_code = 'BUILDING_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select next value for common_code_category_entry_seq, 'B08', 'COM.COMPLEX/BUILDING', category_id, category_code, '1', '' from common_code_category where category_code = 'BUILDING_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select next value for common_code_category_entry_seq, 'B07', 'SHOP LOT', category_id, category_code, '1', '' from common_code_category where category_code = 'BUILDING_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select next value for common_code_category_entry_seq, 'B09', 'IND.BUILDING/FACTORY', category_id, category_code, '1', '' from common_code_category where category_code = 'BUILDING_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select next value for common_code_category_entry_seq, 'B10', 'OTHERS', category_id, category_code, '1', '' from common_code_category where category_code = 'BUILDING_TYPE';


/*******************************************
Category Code: BO
Category Name: Building Occupation
******************************************	**/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'BO', 'Building Occupation', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'O01','OWNER OCCUPIED',category_id, category_code, '1', '' from common_code_category where category_code = 'BO';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'O02','RENT',category_id, category_code, '1', '' from common_code_category where category_code = 'BO';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'O03','LEASE',category_id, category_code, '1', '' from common_code_category where category_code = 'BO';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'O04','OTHERS',category_id, category_code, '1', '' from common_code_category where category_code = 'BO';


/*******************************************
Category Code: PERILS_TYPE
Category Name: Perils Type
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'PERILS_TYPE','Perils Type', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'1','Aircraft Damage',category_id, category_code, '1', '' from common_code_category where category_code = 'PERILS_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'2','Earthquake and Volcanic Eruption',category_id, category_code, '1', '' from common_code_category where category_code = 'PERILS_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'3','Storm Tempest',category_id, category_code, '1', '' from common_code_category where category_code = 'PERILS_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'4','Flood',category_id, category_code, '1', '' from common_code_category where category_code = 'PERILS_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'5','Explosion',category_id, category_code, '1', '' from common_code_category where category_code = 'PERILS_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'6','Impact Damage',category_id, category_code, '1', '' from common_code_category where category_code = 'PERILS_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'7','Bursting or Overflowing of Water tanks Apparatus or Pipes',category_id, category_code, '1', '' from common_code_category where category_code = 'PERILS_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'8','Electrical Installations',category_id, category_code, '1', '' from common_code_category where category_code = 'PERILS_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'9','Bushlalang Fire',category_id, category_code, '1', '' from common_code_category where category_code = 'PERILS_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'10','Subsidence and Landslip',category_id, category_code, '1', '' from common_code_category where category_code = 'PERILS_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'11','Spontaneous Combustion',category_id, category_code, '1', '' from common_code_category where category_code = 'PERILS_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'12','Riot Strike and Malicious Damage',category_id, category_code, '1', '' from common_code_category where category_code = 'PERILS_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'13','Damage by Falling Trees or Branches and Objects Therefrom',category_id, category_code, '1', '' from common_code_category where category_code = 'PERILS_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'14','Cold Storage',category_id, category_code, '1', '' from common_code_category where category_code = 'PERILS_TYPE';


/*******************************************
Category Code: ROOF_TYPE
Category Name: Roof Type
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'ROOF_TYPE', 'Roof Type', 2, 'A'); 

--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'1','Tiles',category_id, category_code, '1', '' from common_code_category where category_code = 'ROOF_TYPE';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'2','Concrete',category_id, category_code, '1', '' from common_code_category where category_code = 'ROOF_TYPE';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'3','Asbestos',category_id, category_code, '1', '' from common_code_category where category_code = 'ROOF_TYPE';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'4','Zinc',category_id, category_code, '1', '' from common_code_category where category_code = 'ROOF_TYPE';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'5','Others',category_id, category_code, '1', '' from common_code_category where category_code = 'ROOF_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'R01','Tiles',category_id, category_code, '1', '' from common_code_category where category_code = 'ROOF_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'R02','Concrete',category_id, category_code, '1', '' from common_code_category where category_code = 'ROOF_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'R03','Tile/Concrete',category_id, category_code, '1', '' from common_code_category where category_code = 'ROOF_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'R04','Others',category_id, category_code, '1', '' from common_code_category where category_code = 'ROOF_TYPE';


/*******************************************
Category Code: WALL_TYPE
Category Name: Wall Type
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'WALL_TYPE', 'Wall Type', 2, 'A'); 

--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'1','Brick',category_id, category_code, '1', '' from common_code_category where category_code = 'WALL_TYPE';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'2','Concrete',category_id, category_code, '1', '' from common_code_category where category_code = 'WALL_TYPE';
--INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'3','Wooden',category_id, category_code, '1', '' from common_code_category where category_code = 'WALL_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'W01','Brick',category_id, category_code, '1', '' from common_code_category where category_code = 'WALL_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'W02','Concrete',category_id, category_code, '1', '' from common_code_category where category_code = 'WALL_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'W03','Brick/Concrete',category_id, category_code, '1', '' from common_code_category where category_code = 'WALL_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'W04','Others',category_id, category_code, '1', '' from common_code_category where category_code = 'WALL_TYPE';


/*******************************************
Category Code: FLOOR_TYPE
Category Name: Floor Type
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'FLOOR_TYPE', 'Floor Type', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'CEMENT','Cement',category_id, category_code, '1', '' from common_code_category where category_code = 'FLOOR_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'CONCRETE','Concrete',category_id, category_code, '1', '' from common_code_category where category_code = 'FLOOR_TYPE';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'OTH','Others',category_id, category_code, '1', '' from common_code_category where category_code = 'FLOOR_TYPE';


/*******************************************
Category Code: NATURE_WORK
Category Name: Nature of Work
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'NATURE_WORK', 'Nature of Work', 2, 'A'); 


/*******************************************
Category Code: ARR_INSURER
Category Name: Arr Insurer
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'ARR_INSURER', 'Arr Insurer', 2, 'A'); 
 
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'B','Bank','1',category_code, category_id from common_code_category where category_code = 'ARR_INSURER';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'C','Customer','1',category_code, category_id from common_code_category where category_code = 'ARR_INSURER';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'D','Developer','1',category_code, category_id from common_code_category where category_code = 'ARR_INSURER'; 

/*****************************
Category Code: REC_COVENANT_ACTION_PARTY
Category Name: Recurrent / Covenant Action Party
******************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'REC_COVENANT_ACTION_PARTY', 'Recurrent / Covenant Action Party', 2, 'A'); 


/************************************
Category Code: MANUFACTURE_YEAR
Category Name: Year of Manufacture
*************************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'MANUFACTURE_YEAR', 'Year of Manufacture', 2, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'2000','2000','1',category_code, category_id from common_code_category where category_code = 'MANUFACTURE_YEAR'; 
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'2001','2001','1',category_code, category_id from common_code_category where category_code = 'MANUFACTURE_YEAR'; 
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'2002','2002','1',category_code, category_id from common_code_category where category_code = 'MANUFACTURE_YEAR'; 
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'2003','2003','1',category_code, category_id from common_code_category where category_code = 'MANUFACTURE_YEAR'; 
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'2004','2004','1',category_code, category_id from common_code_category where category_code = 'MANUFACTURE_YEAR'; 
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'1999','1999','1',category_code, category_id from common_code_category where category_code = 'MANUFACTURE_YEAR'; 
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'1998','1998','1',category_code, category_id from common_code_category where category_code = 'MANUFACTURE_YEAR'; 
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'1997','1997','1',category_code, category_id from common_code_category where category_code = 'MANUFACTURE_YEAR'; 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'2005','2005','1',category_code, category_id from common_code_category where category_code = 'MANUFACTURE_YEAR'; 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'2006','2006','1',category_code, category_id from common_code_category where category_code = 'MANUFACTURE_YEAR'; 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'2007','2007','1',category_code, category_id from common_code_category where category_code = 'MANUFACTURE_YEAR'; 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'2008','2008','1',category_code, category_id from common_code_category where category_code = 'MANUFACTURE_YEAR'; 

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)
select next value for common_code_category_entry_seq,'2009','2009','1',category_code, category_id from common_code_category where category_code = 'MANUFACTURE_YEAR'; 


/************************************
Category Code: STOREY_NO
Category Name: Number of Storey
*************************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'STOREY_NO', 'No. of Storey', 2, 'A');


/*******************************************
Category Code: SEC_ENVELOPE_ADDRESS, SEC_ENVELOPE_CABINET, SEC_ENVELOPE_DRAWER
Category Name: Security Envelope Address, Cabinet, Drawer
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS) VALUES
( next value for common_code_category_seq, 'SEC_ENVELOPE_ADDRESS', 'Security Envelope Address', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS) VALUES
( next value for common_code_category_seq, 'SEC_ENVELOPE_CABINET', 'Security Envelope Cabinet', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS) VALUES
( next value for common_code_category_seq, 'SEC_ENVELOPE_DRAWER', 'Security Envelope Drawer', 2, 'A'); 


/************************************
Category Code: AREA_UOM
Category Name: Area Unit of Measure
*************************************/
insert into common_code_category(category_id,category_code,category_name,category_type,active_status)
values(NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'EQUIP_RISK_GRADING','Equipment Risk Grading',1,'A');

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'X',
'X','1','EQUIP_RISK_GRADING', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_RISK_GRADING';


INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'Y',
'Y','1','EQUIP_RISK_GRADING', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_RISK_GRADING';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'Z',
'Z','1','EQUIP_RISK_GRADING', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_RISK_GRADING';


/*********************************
Category Code: EQUIP_MF
Category Name: Equipment MF
********************************/
insert into common_code_category(category_id,category_code,category_name,category_type,active_status)
values(NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'EQUIP_MF','Equipment MF',2,'A');

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'A',
'A','1','EQUIP_MF', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_MF';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'B',
'B','1','EQUIP_MF', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_MF';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'C',
'C','1','EQUIP_MF', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_MF';



/*********************************
Category Code: EQUIP_CODE
Category Name: Equipment Code
********************************/
insert into common_code_category(category_id,category_code,category_name,category_type,active_status)
values(NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'EQUIP_CODE','Equipment Code',2,'A');

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC1',
'Agriculture Equipment','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC2',
'Aircraft (Fixed Wing)','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC3',
'Aircraft (Helicopter)','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC4',
'Amusement & Recreation','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC5',
'Chemical Manufacturing','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC6',
'Communication Equipment','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC7',
'Computers','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC8',
'Construction Equipment','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC9',
'Logging Equipment','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC10',
'Mining & Quarrying','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC11',
'Food & Beverage Manufacturing','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC12',
'Furnitures','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC13',
'Material Handling','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC14',
'Warehouse','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC15',
'Machine Tool','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC16',
'Metal Manufacturing','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC17',
'Medical Equipment','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC18',
'Office Equipment','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC19',
'Oil & Gas','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC20',
'Printing & Packaging','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC21',
'Paper Based Packaging','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC22',
'Plastic Based Packaging','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC23',
'Packaging - N.E.C.','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC24',
'Restaurant Equipment','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC25',
'Motor Vehicles','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC26',
'Trailers & Tankers','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC27',
'Trucks','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC28',
'Bus & Coach','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC29',
'Vans','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC30',
'Special Purpose Vehicle (Rubbish Compactors)','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC31',
'Sea Transportation','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC32',
'Power Generating & Distribution','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC33',
'Plastic Injection','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC34',
'Plastic Manufacturing (NEC)','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC35',
'Woodworking','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC36',
'Electrical & Electronics (E & E)','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC37',
'Rubber Manufacturing','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC38',
'Recycling Equipment','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC39',
'Garage Equipment','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC40',
'Textile & Apparel','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC41',
'Photography Equipment','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC42',
'Photograph Processsing Equipment','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC43',
'Poultry Equipment','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC44',
'Optical Equipment','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC45',
'Air Compressor','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC46',
'For future use','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC47',
'Software','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC48',
'Measurement & Analyzing','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC49',
'Testing & Quality Control','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC50',
'Mould & Die','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC51',
'Ancillary Equipment','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC52',
'Manufacturing Equipment (Specialized)','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC53',
'Manufacturing Equipment (Complete Line)','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC54',
'Manufacturing Equipment (Others)','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID)
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'EC55',
'Miscellaneous Equipment','1','EQUIP_CODE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'EQUIP_CODE';

/***********************************
Category Code: SEC_CUSTODIAN
Category Name: Security Custodian
***********************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values                                                                   
(next value for common_code_category_seq, 'SEC_CUSTODIAN', 'Security Custodian', 2, 'A');

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'AIBBT', 'AIBB Nominees (Tempatan) Sdn', category_id, category_code, '1' from common_code_category where category_code = 'SEC_CUSTODIAN';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'AIBBA', 'AIBB Nominees (Asing) Sdn', category_id, category_code, '1' from common_code_category where category_code = 'SEC_CUSTODIAN';

/*********************************
Category Code: PLANT_EQUIP_PURPOSE
Category Name: Purpose
********************************/
insert into common_code_category(category_id,category_code,category_name,category_type,active_status) 
values(NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'PLANT_EQUIP_PURPOSE','Purpose',2,'A');

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'FIN', 
'Finance','1','PLANT_EQUIP_PURPOSE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'PLANT_EQUIP_PURPOSE';
 
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, ACTIVE_STATUS, CATEGORY_CODE, COUNTRY,CATEGORY_CODE_ID) 
SELECT NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'REF', 
'Re-Finance','1','PLANT_EQUIP_PURPOSE', 'MY',
CATEGORY_ID FROM COMMON_CODE_CATEGORY WHERE CATEGORY_CODE = 'PLANT_EQUIP_PURPOSE';

/***********************************************************************
Category Code: REAL_ESTATE_USAGE
Category Name: Real Estate Usage
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'REAL_ESTATE_USAGE', 'Real Estate Usage', 2, 'A'); 

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'OFF', 'Office Premises', category_id, 'REAL_ESTATE_USAGE', '1' from common_code_category where category_code = 'REAL_ESTATE_USAGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MUL', 'Multi Purpose Premises', category_id, 'REAL_ESTATE_USAGE', '1' from common_code_category where category_code = 'REAL_ESTATE_USAGE';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
Select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'RES', 'Residential', category_id, 'REAL_ESTATE_USAGE', '1' from common_code_category where category_code = 'REAL_ESTATE_USAGE';


/*******************************************
Category Code: RISK_MITIGATION_CATEGORY
Category Name: Risk Mitigation Category
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'RISK_MITIGATION_CATEGORY', 'Risk Mitigation Category', 2, 'A'); 
 
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'FL', 'First Loss', category_id, 'RISK_MITIGATION_CATEGORY', '1' from common_code_category where category_code = 'RISK_MITIGATION_CATEGORY';
 
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'PR', 'Pro-Rata', category_id, 'RISK_MITIGATION_CATEGORY', '1' from common_code_category where category_code = 'RISK_MITIGATION_CATEGORY';
 
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS)
select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MS', 'Most Senior', category_id, 'RISK_MITIGATION_CATEGORY', '1' from common_code_category where category_code = 'RISK_MITIGATION_CATEGORY';
 

/*******************************************
 Other Setups Relating to Standard Codes
*******************************************/
/************************************
 Setup the transaction records 
 for UI maintenance of the 
 Category 2 common code and entries
*************************************/

insert into stage_common_code_entry
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id, entry_source, country, group_id,
	ref_entry_code, staging_reference_id, is_new)
(select next value for COMM_CODE_ENTRY_STG_SEQ, ccce.ENTRY_ID, ccce.entry_code, ccce.entry_name, ccce.ACTIVE_STATUS, ccce.CATEGORY_CODE,
	ccce.CATEGORY_CODE_ID, ccce.ENTRY_SOURCE, ccce.country, ccce.GROUP_ID, ccce.REF_ENTRY_CODE, ccce.CATEGORY_CODE_ID, 'Y'
from common_code_category_entry ccce, common_code_category ccc
where ((ccc.CATEGORY_TYPE = 2
	AND ccc.ACTIVE_STATUS = 'A')
OR ccc.REF_CATEGORY_CODE IS NOT NULL)
and ccc.category_code = ccce.CATEGORY_CODE);

INSERT INTO TRANSACTION 
(TRANSACTION_ID, FROM_STATE, USER_ID, 
TRANSACTION_TYPE, REFERENCE_ID, STATUS, 
TEAM_ID, TRX_REFERENCE_ID, LEGAL_ID, 
CUSTOMER_ID, LIMIT_PROFILE_ID, TEAM_TYPE_ID, 
TO_GROUP_TYPE_ID, TO_GROUP_ID, TO_USER_ID)
SELECT (TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)),
'PENDING_CREATE', -999999999, 'COMMON_CODE_TYPE', C.CATEGORY_ID, 'ACTIVE', 
20040319000116, -999999999,'-999999999',
-999999999,-999999999, 2,
CHAR(-999999999),-999999999,-999999999
FROM COMMON_CODE_CATEGORY C 
WHERE CATEGORY_TYPE = 2
AND ACTIVE_STATUS = 'A';


INSERT INTO TRANSACTION 
(TRANSACTION_ID, FROM_STATE, USER_ID, 
TRANSACTION_TYPE, REFERENCE_ID, STAGING_REFERENCE_ID, STATUS, 
TEAM_ID, TRX_REFERENCE_ID, 
LEGAL_ID, CUSTOMER_ID, LIMIT_PROFILE_ID, TEAM_TYPE_ID, 
TO_GROUP_TYPE_ID, TO_GROUP_ID, TO_USER_ID)
SELECT (TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)),
'PENDING_CREATE', -999999999, 'COMMON_CODE_ENTRY', C.CATEGORY_ID, C.CATEGORY_ID, 'ACTIVE', 
20040319000116,-999999999,'-999999999',
-999999999,-999999999, 2,
CHAR(-999999999),-999999999,-999999999
FROM COMMON_CODE_CATEGORY C 
WHERE (CATEGORY_TYPE = 2 
AND ACTIVE_STATUS = 'A')
OR REF_CATEGORY_CODE IS NOT NULL;


/************************************
 Default value in Common Code table
 COMMON_CODE_CATEGORY - VERSION_TIME column
 COMMON_CODE_CATEGORY_ENTRY - GROUP_ID column
*************************************/

Update COMMON_CODE_CATEGORY set VERSION_TIME = 0 where VERSION_TIME is null;

Update COMMON_CODE_CATEGORY_ENTRY set GROUP_ID = 0 where GROUP_ID is null;
