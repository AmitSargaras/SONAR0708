/*************************
Category type: 1
**************************/
/*******************************
Category Code: PRIME_REVIEW_TERM_CODE
Category Name: Prime Review Term Code
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'PRIME_REVIEW_TERM_CODE', 'Prime Review Term Code', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name,  active_status, country, category_code, category_code_id) select next value for common_code_category_entry_seq, 'D', 'Day',  '1', 'MY', category_code, category_id from common_code_category where category_code = 'PRIME_REVIEW_TERM_CODE';
insert into common_code_category_entry (entry_id, entry_code, entry_name,  active_status, country, category_code, category_code_id) select next value for common_code_category_entry_seq, 'M', 'Month', '1', 'MY', category_code, category_id from common_code_category where category_code = 'PRIME_REVIEW_TERM_CODE';

/*******************************
Category Code: NAME_CONJUNCTION
Category Name: Name Conjunction
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'NAME_CONJUNCTION', 'Name Conjunction', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name,  active_status, country, category_code, category_code_id) select next value for common_code_category_entry_seq, '*AND', 'And',  '1', 'MY', category_code, category_id from common_code_category where category_code = 'NAME_CONJUNCTION';
insert into common_code_category_entry (entry_id, entry_code, entry_name,  active_status, country, category_code, category_code_id) select next value for common_code_category_entry_seq, '*OR', 'Or',  '1', 'MY', category_code, category_id from common_code_category where category_code = 'NAME_CONJUNCTION';
insert into common_code_category_entry (entry_id, entry_code, entry_name,  active_status, country, category_code, category_code_id) select next value for common_code_category_entry_seq, '*ANDOR', 'AndOr', '1', 'MY', category_code, category_id from common_code_category where category_code = 'NAME_CONJUNCTION';
insert into common_code_category_entry (entry_id, entry_code, entry_name,  active_status, country, category_code, category_code_id) select next value for common_code_category_entry_seq, 'B', 'Before',  '1', 'MY', category_code, category_id from common_code_category where category_code = 'NAME_CONJUNCTION';
insert into common_code_category_entry (entry_id, entry_code, entry_name,  active_status, country, category_code, category_code_id) select next value for common_code_category_entry_seq, 'E', 'End', '1', 'MY', category_code, category_id from common_code_category where category_code = 'NAME_CONJUNCTION';

/*******************************
Category Code: FACILITY_STATUS
Category Name: Facility Status
********************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'FACILITY_STATUS', 'Facility Status', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq, 'A', 'Approve', '1',category_code, 'MY', category_id from common_code_category where category_code = 'FACILITY_STATUS';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq, 'C', 'Cancel', '1',category_code, 'MY', category_id from common_code_category where category_code = 'FACILITY_STATUS';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq, 'F', 'Frozen', '1',category_code, 'MY', category_id from common_code_category where category_code = 'FACILITY_STATUS';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq, 'L', 'Appeal', '1',category_code, 'MY', category_id from common_code_category where category_code = 'FACILITY_STATUS';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq, 'P', 'Pending Approval', '0',category_code, 'MY', category_id from common_code_category where category_code = 'FACILITY_STATUS';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq, 'R', 'Reject', '1',category_code, 'MY', category_id from common_code_category where category_code = 'FACILITY_STATUS';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq, 'S', 'Suspense', '1',category_code, 'MY', category_id from common_code_category where category_code = 'FACILITY_STATUS';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq, 'T', 'Pending Acceptance', '0',category_code, 'MY', category_id from common_code_category where category_code = 'FACILITY_STATUS';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq, 'Z', 'Terminate', '1',category_code, 'MY', category_id from common_code_category where category_code = 'FACILITY_STATUS';

/*******************************
Category Code: COMMISSION_BASIS
Category Name: Commission Basis
********************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'COMMISSION_BASIS', 'Commission Basis', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq, 'F', 'FLAT', '1',category_code, 'MY', category_id from common_code_category where category_code = 'COMMISSION_BASIS';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq, 'M', 'PER MONTH', '1',category_code, 'MY', category_id from common_code_category where category_code = 'COMMISSION_BASIS';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq, 'A', 'PER ANNUM', '1',category_code, 'MY', category_id from common_code_category where category_code = 'COMMISSION_BASIS';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq, 'Q', 'PER QUARTER', '1',category_code, 'MY', category_id from common_code_category where category_code = 'COMMISSION_BASIS';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) 
select next value for common_code_category_entry_seq, 'B', 'P.ANNUM/12', '1',category_code, 'MY', category_id from common_code_category where category_code = 'COMMISSION_BASIS';

/*******************************
Category Code: SOURCE_SEC_TYPE
Category Name: Source Security Type
********************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'SOURCE_SEC_TYPE', 'Source Security Type', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '760', 'DEBENTURE ON SPECIFIC ASSETS OF COMPANY', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '761', 'DEBENTURE ON ALL ASSETS OF CO. (FIXED & FLOATING)', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '762', 'DEBENTURE ON COMPANY''S STOCK', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '779', 'DEBENTURE - OTHERS', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '708', 'DEBENTURE - CRYSTALLIZATION (UNDER RECEIVESHIP)', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '301', 'IHP ON FACTORY PLANT & MACHINERY', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '302', 'IHP ON OFFICE EQUIPMENT & MACHINERY', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '303', 'IHP ON NON-MOBILE CONSTRUCTION MACHINERY', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '304', 'IHP ON BULLDOZER AND EXCAVATOR', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '763', 'DEBENTURE ON PLANT & MACHINERY', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '055', 'CHARGE ON PLANT AND MACHINERY', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '300', 'CAR', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '306', 'IHP ON COMMERCIAL VEHICLES', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '310', 'HP ON COMMERCIAL VEHICLES', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '312', 'HP ON VEHICLES', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '309', 'HP ON CONSUMER GOODS', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '311', 'HP ON OTHERS', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '305', 'IHP ON OTHERS', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '099', 'CHARGE ON OTHER FIXED ASSETS', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '500', 'PROMISSORY NOTE/CHEQUES COLLATERAL', 'AB', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '732', 'CASH HELD AS MARGIN F', 'CS', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '731', 'EARMARKING OF ACCOUNT''S CREDIT BALANCE F', 'CS', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '730', 'LIEN ON FIXED DEPOSITS', 'CS', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '734', 'REPO (REPURCHASE AGREEMENT)', 'CS', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '871', 'LETTER OF UNDERTAKING', 'DC', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '870', 'LETTER OF COMFORT/AWARENESS', 'DC', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '810', 'NEGATIVE PLEDGE', 'DC', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '510', 'ASSIGNMENT OF LEASE AGREEMENT', 'DC', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '780', 'ASSIGNMENT OF CONTRACT PROCEEDS/BILL OF SALES', 'DC', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '781', 'ASSIGNMENT OF LIFE POLICIES', 'DC', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '782', 'ASSIGNMENT OF BOOK DEBTS', 'DC', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '783', 'ASSIGNMENT OF BANCASSURANCE POLICY', 'DC', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '799', 'ASSIGNMENT - OTHERS', 'DC', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '800', 'GEN SEC AGREEMENT RELATING TO GOODS', 'DC', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '801', 'BLOCK DISCCOUNTING ASSIGNMENT ON AGREEMENTS', 'DC', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '802', 'FLOOR STOCKING ASSIGNMENT ON AGREEMENTS', 'DC', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '824', 'LEASE/RENTAL AGREEMENT', 'DC', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '825', 'ASSIGMENT - CRYSTALLIZATION (UNDER RECEIVERSHIP)', 'DC', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '906', 'GUARANTEE - BY BANK INST', 'GT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '907', 'GUARANTEE - BY DEVT BANK', 'GT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '820', 'STANDYBY LETTER OF CREDIT', 'GT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '902', 'GUARANTEE - BY COMPANIES', 'GT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '919', 'GUARANTEE - OTHERS', 'GT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '903', 'GUARANTEE - BY FEDERAL GOV''T', 'GT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '904', 'GUARANTEE - BY STATE GOV''T', 'GT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '909', 'GUARANTEE BY GOVERNMENT/STATUTORY BODY(IES) G', 'GT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '901', 'GUARANTEE - BY JOINT & SEVERAL GUARANTORS', 'GT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '908', 'GUARANTEE - BY INDIVIDUAL', 'GT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '905', 'GUARANTEE - BY CGC', 'GT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '821', 'MERCHANT LCS', 'GT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '822', 'RED CLAUSE LC FROM BANKS', 'GT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '882', 'MRTA (MORTGAGE REDUCING TERM ASSURANCE)', 'IN', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '881', 'ODLA (OD AGS LIFE ASSURANCE)', 'IN', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '400', 'PLEDGE ON STOCKS & SHARES', 'MS', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '700', 'CAGAMAS BONDS', 'MS', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '705', 'MALAYSIAN GOV''T SECURITIES', 'MS', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '403', 'PLEDGE OF UNIT TRUST', 'MS', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '706', 'AMANAH SAHAM NASIONAL', 'MS', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '402', 'SIMPLE DEPOSIT OF QUOTED & UNQUOTED SHARES S', 'MS', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '401', 'PLEDGE OF UNQUOTED SHARES S', 'MS', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '707', 'PLEDGE OF MARKET SEC. (OTHER THAN SHARES)', 'MS', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '998', 'OTHER SECURITIES', 'OT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '001', 'CHARGE ON ESTATES - RUBBER', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '002', 'CHARGE ON ESTATES - RICE FIELD', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '003', 'CHARGE ON ESTATES - PALM OIL', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '004', 'CHARGE ON ESTATES - COCONUT & COCONUT PRODUCTS', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '005', 'CHARGE ON ESTATES - PINEAPPLE', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '006', 'CHARGE ON ESTATES - TEA', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '007', 'CHARGE ON ESTATES - COCOA', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '008', 'CHARGE/LIEN''S HLDR''S CAV.ON CULTIVATED AGRI.LAND P', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '048', 'CHARGE ON ESTATES - OTHER AGRICULTURE', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '053', 'CHARGE ON LAND WITH COMMERCIAL BUILDING', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '058', 'CHRG/LIEN HLDR''S CAV.ON LAND WITH COMM.& RES.BLD P', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '206', 'ASSIGNMENT ON SHOPLOT', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '052', 'CHARGE ON LAND AND FACTORY', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '054', 'CHARGE/LIEN HOLDER''S CAV. ON VACANT IND. LAND P', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '057', 'CHARGE/LIEN HLDR''S CAV.ON LAND WITH RES.HOUSE(S) P', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '060', 'CHARGE ON LAND & BUILDING - SS TH(I)', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '061', 'CHARGE ON LAND & BUILDING - SS TH(C)', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '062', 'CHARGE ON LAND & BUILDING - SS SD', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '063', 'CHARGE ON LAND & BUILDING - SS D', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '064', 'CHARGE ON LAND & BUILDING - DS TH(I)', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '065', 'CHARGE ON LAND & BUILDING - DS TH(C)', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '066', 'CHARGE ON LAND & BUILDING - DS SD', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '067', 'CHARGE ON LAND & BUILDING - DS D', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '068', 'CHARGE ON FLATS', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '069', 'CHARGE ON APARTMENT', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '070', 'CHARGE ON SHOPHOUSES', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '071', 'CHARGE ON CONDOMINIUM', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '072', 'CHARGE ON TOWNHOUSES', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '200', 'ASSIGNMENT ON FLATS', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '201', 'ASSIGNMENT ON RESIDENTIAL HOUSES', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '202', 'ASSIGNMENT ON SHOPHOUSES', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '203', 'ASSIGNMENT ON APARTMENT', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '204', 'ASSIGNMENT ON CONDOMINIUM', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '205', 'ASSIGNMENT ON TOWNHOUSES', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '150', 'DEPOSIT OF TITLE', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '210', 'ASSIGNMENT ON LAND & BUILDING ONLY', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '211', 'CHARGE-IN-ESCROW OVER LANDED PROPERTY(IES) P', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '880', 'CAVEAT ON LAND TITLE', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '073', 'CHARGE ON LAND & BLDG - HOTEL/RESORT', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '049', 'CHARGE/LIEN HOLDER''S CAV.ON VAC. BUILDING LOT(S) P', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '050', 'CHARGE ON LAND ONLY', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '051', 'CHARGE/LIEN HOLDER''S CAV. ON VACANT AGR. LAND P', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '209', 'ASSIGNMENT ON LAND ONLY', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '047', 'CHARGE ON ESTATES - FOREST', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '056', 'CHARGE/LIEN HOLDER''S CAV.ON MINING LAND P', 'PT', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '823', 'CLEAN LOAN', 'CL', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_SEC_TYPE';


/*******************************************
Category Code: SOURCE_CMS_SEC_TYPE_MAP
Category Name: Source and CMS Security Subtype mapping
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'SOURCE_CMS_SEC_TYPE_MAP', 'Source and CMS Security Subtype mapping', 1, 'A'); 

insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '760', 'AB100', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '761', 'AB100', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '762', 'AB100', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '779', 'AB100', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '708', 'AB100', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '301', 'AB101', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '302', 'AB101', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '303', 'AB101', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '304', 'AB101', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '763', 'AB101', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '055', 'AB101', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '300', 'AB102', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '306', 'AB102', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '310', 'AB102', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '312', 'AB102', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '309', 'AB103', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '311', 'AB103', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '305', 'AB103', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '099', 'AB103', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '500', 'AB108', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '732', 'CS200', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '731', 'CS200', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '730', 'CS202', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '734', 'CS203', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '871', 'DC303', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '870', 'DC304', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '810', 'DC305', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '510', 'DC308', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '780', 'DC308', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '781', 'DC308', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '782', 'DC308', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '783', 'DC308', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '799', 'DC308', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '800', 'DC308', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '801', 'DC308', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '802', 'DC308', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '824', 'DC308', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '825', 'DC308', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '906', 'GT400', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '907', 'GT400', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '820', 'GT402', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '902', 'GT405', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '919', 'GT405', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '903', 'GT406', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '904', 'GT406', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '909', 'GT406', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '901', 'GT408', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '908', 'GT408', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '905', 'GT409', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '821', 'GT410', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '822', 'GT410', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '882', 'IN500', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '881', 'IN501', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '400', 'MS600', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '400', 'MS601', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '700', 'MS602', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '705', 'MS602', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '400', 'MS605', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '403', 'MS605', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '706', 'MS605', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '402', 'MS605', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '400', 'MS606', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '402', 'MS606', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '401', 'MS607', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '402', 'MS607', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '707', 'MS610', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '707', 'MS611', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '998', 'OT900', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
--insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '998', 'OT900', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '001', 'PT700', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '002', 'PT700', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '003', 'PT700', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '004', 'PT700', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '005', 'PT700', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '006', 'PT700', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '007', 'PT700', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '008', 'PT700', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '048', 'PT700', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '053', 'PT701', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '058', 'PT701', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '206', 'PT702', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '052', 'PT703', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '054', 'PT703', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '057', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '060', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '061', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '062', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '063', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '064', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '065', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '066', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '067', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '068', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '069', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '070', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '071', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '072', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '200', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '201', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '202', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '203', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '204', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '205', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '150', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '210', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '211', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '880', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '073', 'PT706', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '049', 'PT707', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '050', 'PT707', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '051', 'PT707', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '209', 'PT707', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '047', 'PT709', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '056', 'PT709', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id)  select next value for common_code_category_entry_seq, '823', 'CL001', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';

update common_code_category_entry c1
set entry_name = (select c2.entry_name from common_code_category_entry c2 where c2.entry_code = c1.entry_code and c2.category_code = 'SOURCE_SEC_TYPE')
where c1.category_code = 'SOURCE_CMS_SEC_TYPE_MAP';


/******************************
Category Code: PARTY_CHARGE
Category Name: Party Charge
*******************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS, VERSION_TIME)
values
( NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'PARTY_CHARGE','Party Charge', 1, 'A', 0);

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)select next value for common_code_category_entry_seq, '1', '1st party charge', '1', category_code, category_id from common_code_category where category_code = 'PARTY_CHARGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id)select next value for common_code_category_entry_seq, '3', '3rd party charge', '1', category_code, category_id from common_code_category where category_code = 'PARTY_CHARGE';

/******************************
Category Code: REVOLVE_OS_BAL
Category Name: Rev on O/S Bal
*******************************/

INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'REVOLVE_OS_BAL', 'Rev on O/S Bal', 1, 'A');
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'O', 'Org Amt', 'REVOLVE_OS_BAL', '1', 'MY', category_code, category_id from common_code_category where category_code = 'REVOLVE_OS_BAL';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'P', 'Prin O/S Bal', 'REVOLVE_OS_BAL', '1', 'MY', category_code, category_id from common_code_category where category_code = 'REVOLVE_OS_BAL';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'S', 'O/S Bal', 'REVOLVE_OS_BAL', '1', 'MY', category_code, category_id from common_code_category where category_code = 'REVOLVE_OS_BAL';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'B', 'Prin+Int', 'REVOLVE_OS_BAL', '1', 'MY', category_code, category_id from common_code_category where category_code = 'REVOLVE_OS_BAL';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'T', 'Org Amt Bal', 'REVOLVE_OS_BAL', '1', 'MY', category_code, category_id from common_code_category where category_code = 'REVOLVE_OS_BAL';


/******************************
Category Code: GPP_PAYMENT_MODE
Category Name: GPP Payment Mode
*******************************/

INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'GPP_PAYMENT_MODE', 'GPP Payment Mode', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'Y', 'Payment after grace period expiry/full release', '', '1', 'MY', category_code, category_id from common_code_category where category_code = 'GPP_PAYMENT_MODE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'N', 'No service grace period', '', '1', 'MY', category_code, category_id from common_code_category where category_code = 'GPP_PAYMENT_MODE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'I', 'Start payment Immediately', '', '1', 'MY', category_code, category_id from common_code_category where category_code = 'GPP_PAYMENT_MODE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'E', 'Payment after grace period expiry', '', '1', 'MY', category_code, category_id from common_code_category where category_code = 'GPP_PAYMENT_MODE';


/************************************
Category Code: GPP_CALCULATION_METHOD
Category Name: GPP Calculation Method
*************************************/

INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'GPP_CALCULATION_METHOD', 'GPP Calculation Method', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'A', 'pay profit', 'GPP_CALCULATION_METHOD', '1', 'MY', category_code, category_id from common_code_category where category_code = 'GPP_CALCULATION_METHOD';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'D', 'no calculation', 'GPP_CALCULATION_METHOD', '1', 'MY', category_code, category_id from common_code_category where category_code = 'GPP_CALCULATION_METHOD';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'F', 'no calculation will be done', 'GPP_CALCULATION_METHOD', '1', 'MY', category_code, category_id from common_code_category where category_code = 'GPP_CALCULATION_METHOD';

/***************************
Category Code: GPP_TERM_CODE
Category Name: GPP Term Code
*****************************/

-- INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
-- VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'GPP_TERM_CODE', 'GPP Term Code', 1, 'A');

-- insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'M', 'Month', '', '1', 'MY', category_code, category_id from common_code_category where 
-- category_code = 'GPP_TERM_CODE';

/******************************************
Category Code: FULREL_PROFIT_CALC_METHOD
Category Name: FULREL PROFIT CALCULATION METHOD
*******************************************/

INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'FULREL_PROFIT_CALC_METHOD', 'Fulrel Profit Calculation Method', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'F', 'Flat Rate', '', '1', 'MY', category_code, category_id 
from common_code_category where category_code = 'FULREL_PROFIT_CALC_METHOD';


/******************************************
Category Code: REFUND_GPP_PROFIT
Category Name: REFUND GPP PROFIT
*******************************************/

INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'REFUND_GPP_PROFIT', 'Refund GPP Profit', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'E', 'Upon expiry of GPP', '', '1', 'MY', category_code, category_id from common_code_category where 
category_code = 'REFUND_GPP_PROFIT';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'F', 'Upon full release', '', '1', 'MY', category_code, category_id from common_code_category where 
category_code = 'REFUND_GPP_PROFIT';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'P', 'Upon payment', '', '1', 'MY', category_code, category_id from common_code_category where 
category_code = 'REFUND_GPP_PROFIT';

/******************************************
Category Code: REFUND_FULREL_PROFIT
Category Name: REFUND FULREL PROFIT
*******************************************/

INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'REFUND_FULREL_PROFIT', 'Refund FulRel Profit', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'P', 'Upon payment', '', '1', 'MY', category_code, category_id from common_code_category where 
category_code = 'REFUND_FULREL_PROFIT';

/******************************************
Category Code: SPTF_DUAL_PAYMENT_MODE
Category Name: SPTF DUAL PAYMENT MODE
*******************************************/

INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'SPTF_DUAL_PAYMENT_MODE', 'Sptf Dual Payment Mode', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'X', 'Pay principle at maturity', '', '1', 'MY', category_code, category_id from common_code_category where 
category_code = 'SPTF_DUAL_PAYMENT_MODE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'Q', 'Pay principle quarterly', '', '1', 'MY', category_code, category_id from common_code_category where 
category_code = 'SPTF_DUAL_PAYMENT_MODE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'H', 'Pay principle half-yearly', '', '1', 'MY', category_code, category_id from common_code_category where 
category_code = 'SPTF_DUAL_PAYMENT_MODE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'A', 'Pay principle yearly', '', '1', 'MY', category_code, category_id from common_code_category where 
category_code = 'SPTF_DUAL_PAYMENT_MODE';


/******************************************
Category Code: REBATE_METHOD
Category Name: REBATE METHOD
*******************************************/

INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'REBATE_METHOD', 'Rebate Method', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'E', 'Upon expiry of GPP', '', '1', 'MY', category_code, category_id from common_code_category where 
category_code = 'REBATE_METHOD';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'F', 'Upon full release', '', '1', 'MY', category_code, category_id from common_code_category where 
category_code = 'REBATE_METHOD';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'P', 'Upon payment', '', '1', 'MY', category_code, category_id from common_code_category where 
category_code = 'REBATE_METHOD';
insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) 
select next value for common_code_category_entry_seq, 'NA', 'N/A', '', '1', 'MY', category_code, category_id from common_code_category where 
category_code = 'REBATE_METHOD';

/*******************************************
Category Code: APPLICATION_TYPE
Category Name: Application Type
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'APPLICATION_TYPE', 'Application Type', 1, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,category_code , category_code_id, ENTRY_SOURCE, COUNTRY) select next value for common_code_category_entry_seq, 'CO', 'Corporate', '1', category_code, category_id, 'GLOS', 'MY' from common_code_category where category_code = 'APPLICATION_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,category_code , category_code_id, ENTRY_SOURCE, COUNTRY) select next value for common_code_category_entry_seq, 'COM', 'Commercial', '1', category_code, category_id, 'GLOS', 'MY' from common_code_category where category_code = 'APPLICATION_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,category_code , category_code_id, ENTRY_SOURCE, COUNTRY) select next value for common_code_category_entry_seq, 'MG', 'Consumer MG', '1', category_code, category_id, 'GLOS', 'MY' from common_code_category where category_code = 'APPLICATION_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,category_code , category_code_id, ENTRY_SOURCE, COUNTRY) select next value for common_code_category_entry_seq, 'HP', 'Hire Purchase', '1', category_code, category_id, 'GLOS', 'MY' from common_code_category where category_code = 'APPLICATION_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status,category_code , category_code_id, ENTRY_SOURCE, COUNTRY) select next value for common_code_category_entry_seq, 'PL', 'Consumer PLoan', '1', category_code, category_id, 'GLOS', 'MY' from common_code_category where category_code = 'APPLICATION_TYPE';




/*************************
Category type: 3
**************************/
/*******************************
Category Code: CAR_CODE
Category Name: Car Code
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'CAR_CODE', 'Car Code', 3, 'A');



/***********************************
Category Code: 40
Category Name: Organisation Code
***********************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values                                                                   
(next value for common_code_category_seq, '40', 'Organisation / Branch Code', 3, 'A');

-- Branch setting for MIMB
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq,'MIMB_IB','MIMB Bank Berhad HQ','1','40', 'MY', category_id, 'MIMB' from common_code_category where category_code = '40';

-- Branch for head office - reference entry code = 18 (KL) 

-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, ref_entry_code, category_code_id, entry_source) select next value for common_code_category_entry_seq,'901','Head Office (Bank)','1','40', 'MY','18', category_id, 'ARBS' from common_code_category where category_code = '40';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, ref_entry_code, category_code_id, entry_source) select next value for common_code_category_entry_seq,'904','Head Office - Finance Dept','1','40', 'MY','18', category_id, 'ARBS' from common_code_category where category_code = '40';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, ref_entry_code, category_code_id, entry_source) select next value for common_code_category_entry_seq,'905','Share Margin Finance','1','40', 'MY','18', category_id, 'ARBS' from common_code_category where category_code = '40';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, ref_entry_code, category_code_id, entry_source) select next value for common_code_category_entry_seq,'906','Credit Supervision & Control','1','40', 'MY','18', category_id, 'ARBS' from common_code_category where category_code = '40';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, ref_entry_code, category_code_id, entry_source) select next value for common_code_category_entry_seq,'908','Consumer Banking','1','40', 'MY','18', category_id, 'ARBS' from common_code_category where category_code = '40';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, ref_entry_code, category_code_id, entry_source) select next value for common_code_category_entry_seq,'909','Commercial Banking','1','40', 'MY','18', category_id, 'ARBS' from common_code_category where category_code = '40';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, ref_entry_code, category_code_id, entry_source) select next value for common_code_category_entry_seq,'910','Corporate Banking','1','40', 'MY','18', category_id, 'ARBS' from common_code_category where category_code = '40';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, ref_entry_code, category_code_id, entry_source) select next value for common_code_category_entry_seq,'911','Retail Marketing','1','40', 'MY','18', category_id, 'ARBS' from common_code_category where category_code = '40';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, ref_entry_code, category_code_id, entry_source) select next value for common_code_category_entry_seq,'913','Credit Card','1','40', 'MY','18', category_id, 'ARBS' from common_code_category where category_code = '40';

/*******************************************
HOST_BRANCH
Due to setup for Category Code = '40'
********************************************/
-- insert into host_branch (branch_num, branch_name, conventional_islamic_ind, country, state, CAC_CODE) values ('901','Head Office (Bank)', 'I', 'MY', '14', '18');
-- insert into host_branch (branch_num, branch_name, conventional_islamic_ind, country, state, CAC_CODE) values ('904','Head Office - Finance Dept', 'I', 'MY', '14', '18');
-- insert into host_branch (branch_num, branch_name, conventional_islamic_ind, country, state, CAC_CODE) values ('905','Share Margin Finance', 'I', 'MY', '14', '18');
-- insert into host_branch (branch_num, branch_name, conventional_islamic_ind, country, state, CAC_CODE) values ('906','Credit Supervision & Control', 'I', 'MY', '14', '18');
-- insert into host_branch (branch_num, branch_name, conventional_islamic_ind, country, state, CAC_CODE) values ('908','Consumer Banking', 'I', 'MY', '14', '18');
-- insert into host_branch (branch_num, branch_name, conventional_islamic_ind, country, state, CAC_CODE) values ('909','Commercial Banking', 'I', 'MY', '14', '18');
-- insert into host_branch (branch_num, branch_name, conventional_islamic_ind, country, state, CAC_CODE) values ('910','Corporate Banking', 'I', 'MY', '14', '18');
-- insert into host_branch (branch_num, branch_name, conventional_islamic_ind, country, state, CAC_CODE) values ('911','Retail Marketing', 'I', 'MY', '14', '18');
-- insert into host_branch (branch_num, branch_name, conventional_islamic_ind, country, state, CAC_CODE) values ('913','Credit Card', 'I', 'MY', '14', '18');
 

/*****************************
Category Code: ID_TYPE
Category Name: ID Type
******************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'ID_TYPE', 'ID Type', 3, 'A');


/**************************
Category Code: 27
Category Name: Product Type
****************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, '27', 'Product Type', 3, 'A');

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'OMNI', 'OMNI', category_id, category_code, '1', 'FINS' from common_code_category where category_code = '27';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'CCC', 'Credit Card', category_id, category_code, '1', 'SEMA' from common_code_category where category_code = '27';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'M2T8', 'Margin - 2T8', category_id, category_code, '1', 'BOST' from common_code_category where category_code = '27';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MMU', 'Margin - Maxi Margin', category_id, category_code, '1', 'BOST' from common_code_category where category_code = '27';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'MMS', 'Margin - M-Switch', category_id, category_code, '1', 'BOST' from common_code_category where category_code = '27';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'M', 'Normal Margin', category_id, category_code, '1', 'BOST' from common_code_category where category_code = '27';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'FX', 'Foreign Exchange', category_id, category_code, '1', 'QUAN' from common_code_category where category_code = '27';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ, 'FX_TEMP', 'Foreign Exchange (Temporary)', category_id, category_code, '1', 'QUAN' from common_code_category where category_code = '27';

/**************************
Category Code: PRODUCT_TYPE
Category Name: Product Type
****************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'PRODUCT_TYPE', 'Distinct Product Type List', 3, 'A');

/*******************************
Category Code: 26
Category Name: Facility Type
********************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, '26', 'Facility Type', 3, 'A');

INSERT INTO common_code_category_entry (entry_id, entry_code, entry_name, category_code_id, category_code, active_status, entry_source) select NEXT VALUE FOR common_code_category_entry_seq, 'OMN', 'OMNI', category_id, category_code, '1', 'FINS' from common_code_category where category_code = '26';
INSERT INTO common_code_category_entry (entry_id, entry_code, entry_name, category_code_id, category_code, active_status, entry_source) select NEXT VALUE FOR common_code_category_entry_seq, 'CCC', 'Credit Card', category_id, category_code, '1', 'SEMA' from common_code_category where category_code = '26';
INSERT INTO common_code_category_entry (entry_id, entry_code, entry_name, category_code_id, category_code, active_status, entry_source) select NEXT VALUE FOR common_code_category_entry_seq, 'M2T8', 'Margin - 2T8', category_id, category_code, '1', 'BOST' from common_code_category where category_code = '26';
INSERT INTO common_code_category_entry (entry_id, entry_code, entry_name, category_code_id, category_code, active_status, entry_source) select NEXT VALUE FOR common_code_category_entry_seq, 'MMU', 'Margin - Maxi Margin', category_id, category_code, '1', 'BOST' from common_code_category where category_code = '26';
INSERT INTO common_code_category_entry (entry_id, entry_code, entry_name, category_code_id, category_code, active_status, entry_source) select NEXT VALUE FOR common_code_category_entry_seq, 'MMS', 'Margin - M-Switch', category_id, category_code, '1', 'BOST' from common_code_category where category_code = '26';
INSERT INTO common_code_category_entry (entry_id, entry_code, entry_name, category_code_id, category_code, active_status, entry_source) select NEXT VALUE FOR common_code_category_entry_seq, 'M', 'Normal Margin', category_id, category_code, '1', 'BOST' from common_code_category where category_code = '26';
INSERT INTO common_code_category_entry (entry_id, entry_code, entry_name, category_code_id, category_code, active_status, entry_source) select NEXT VALUE FOR common_code_category_entry_seq, 'FX', 'Foreign Exchange', category_id, category_code, '1', 'QUAN' from common_code_category where category_code = '26';


/*******************************************
Category Code: 4
Category Name: Address Type
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, '4', 'Address Type', 3, 'A'); 

/**********************************************************************************
Category Code: INSURANCE_TYPE
Category Name: Insurance Type
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'INSURANCE_TYPE', 'Insurance Type', 3, 'A'); 

/*********************************
Category Code: VEHICLE_BRAND
Category Name: Vehicle Brand - Make
********************************/ 
insert into common_code_category(category_id,category_code,category_name,category_type,active_status) 
values(NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'VEHICLE_BRAND','Vehicle Brand - Make',3,'A');


/*********************************
Category Code: MODEL
Category Name: Model
********************************/ 
insert into common_code_category(category_id,category_code,category_name,category_type,active_status) 
values(NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'MODEL','Model',3,'A');

/*********************************
Category Code: MODEL_YEAR_MAP
Category Name: Model
********************************/ 
insert into common_code_category(category_id,category_code,category_name,category_type,active_status) 
values(NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'MODEL_YEAR_MAP','Model and Year of Manufacture Map',3,'A');


/*******************************************
Category Code: LEASE_TYPE
Category Name: Extension Lease Type
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'LEASE_TYPE', 'Lease Type', 3, 'A'); 


/*****************************
Category Code: 17
Category Name: ISIC Code / Nature of Business
******************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, '17', 'ISIC Code / Nature of Business', 3, 'A');


/******************************
Category Code: CENTRE
Category Name: Centre
*******************************/
-- Andy 19 May 2010: centre is not applicable in Alliance
--INSERT INTO COMMON_CODE_CATEGORY
--(CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, REF_CATEGORY_CODE, ACTIVE_STATUS)
--values( NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'CENTRE','Centre', 3, 'REGION', 'A');

-- insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) select next value for common_code_category_entry_seq, '18', 'Kuala Lumpur', 'ARBS', '1', 'MY', category_code, category_id from common_code_category where category_code = 'CENTRE';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, entry_source, active_status, country, category_code, category_code_id) select next value for common_code_category_entry_seq, 'M001', 'MIMB Investment Bank', 'MIMB', '1', 'MY', category_code, category_id from common_code_category where category_code = 'CENTRE';


/******************************
Category Code: CENTRE_TYPE_MAP
Category Name: Centre Type Map
*******************************/
--INSERT INTO COMMON_CODE_CATEGORY
--(CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
--values( NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'CENTRE_TYPE_MAP','Centre Type Map', 3, 'A');

-- insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, entry_source, active_status, country, category_code, category_code_id) select next value for common_code_category_entry_seq, '18', 'Kuala Lumpur', 'CAC', 'ARBS', '1', 'MY', category_code, category_id from common_code_category where category_code = 'CENTRE_TYPE_MAP';
-- insert into common_code_category_entry (entry_id, entry_code, entry_name, ref_entry_code, entry_source, active_status, country, category_code, category_code_id) select next value for common_code_category_entry_seq, '18', 'Kuala Lumpur', 'RC', 'ARBS', '1', 'MY', category_code, category_id from common_code_category where category_code = 'CENTRE_TYPE_MAP';


/*******************************************
Category Code: RANK
Category Name: Rank List
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'RANK', 'Rank List', 3, 'A'); 


/*****************************
Category Code: 8
Category Name: Customer Type
******************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, '8', 'Customer Type', 3, 'A');

-- Andy 18 May 2010: insert sema and bostrac customer type, partial category 1
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code,  category_code_id, ENTRY_SOURCE) select next value for common_code_category_entry_seq, 'I', 'Individual', '1', category_code, category_id, 'SEMA' from common_code_category where category_code = '8';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code,  category_code_id, ENTRY_SOURCE) select next value for common_code_category_entry_seq, 'C', 'Corporate', '1', category_code, category_id, 'SEMA' from common_code_category where category_code = '8';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code,  category_code_id, ENTRY_SOURCE) select next value for common_code_category_entry_seq, 'I', 'Individual', '1', category_code, category_id, 'BOST' from common_code_category where category_code = '8';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code,  category_code_id, ENTRY_SOURCE) select next value for common_code_category_entry_seq, 'C', 'Corporate', '1', category_code, category_id, 'BOST' from common_code_category where category_code = '8';

/**********************************************
Category Code: LAND_USE_CAT
Category Name: Category of Land Use
**********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'LAND_USE_CAT', 'Category of Land Use', 2, 'A'); 

/***********************************************************************
Category Code: PROPERTY_TYPE
Category Name: Property Type
***********************************************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
(next value for common_code_category_seq, 'PROPERTY_TYPE', 'Property Type', 3, 'A'); 

/*******************************************
Category Code: STATE
Category Name: State
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'STATE', 'State', 3, 'A'); 

/*******************************************
Category Code: PLANT_EQUIP
Category Name: Type of Plant and Equipment - Asset Based
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'PLANT_EQUIP', 'Type of Plant and Equipment - Asset Based', 3, 'A'); 

/*******************************************
Category Code: VEHICLE_TYPE
Category Name: Vehicle Type
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'VEHICLE_TYPE', 'Vehicle Type - Asset Based', 3, 'A'); 
    
/****************************
Category Code: GOLD_GRADE
Category Name: GOLD_GRADE
*******************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'GOLD_GRADE', 'GOLD GRADE', 3, 'A');

/*********************************
Category Code: GOLD_TYPE
Category Name: GOLD TYPE
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'GOLD_TYPE', 'GOLD TYPE', 3, 'A');


/****************************************************
Category Code: SCHEME
Category Name: Scheme
*****************************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
 values
 (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'SCHEME', 'Scheme', 2, 'A'); 


/*******************************************
Category Code: RELATIONSHIP
Category Name: Relationship
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'RELATIONSHIP','Relationship', 3, 'A'); 



/*******************************
Category Code: LOAN_PURPOSE 
Category Name: Loan Purpose
********************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'LOAN_PURPOSE', 'Loan Purpose', 3, 'A');


/*******************************
Category Code: APPROVED_BY 
Category Name: Approving Authority
********************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'APPROVED_BY', 'Approving Authority', 3, 'A');



/*******************************
Category Code: CANC_REJ_CODE 
Category Name: Cancel / Reject Code
********************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'CANC_REJ_CODE', 'Cancel / Reject Code', 3, 'A');


/*******************************************
Category Code: OFFICER
Category Name: Officer 
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'OFFICER', 'Officer', 3, 'A'); 



/*******************************************
Category Code: OFFICER_TYPE
Category Name: Officer Type
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'OFFICER_TYPE', 'Officer Type', 3, 'A'); 



/*******************************************
Category Code: OFFICER_TYPE_LOS_MAP
Category Name: Officer Type and Type of LOS Map
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, REF_CATEGORY_CODE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'OFFICER_TYPE_LOS_MAP', 'Officer Type and Type of LOS Map', 3, 'OFFICER_CATEGORY', 'A'); 


/*******************************************
Category Code: LMT_STATUS
Category Name: Limit Status 
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'LMT_STATUS', 'Limit Status', 3, 'A');
 

/*******************************************
Category Code: FAC_RATE
Category Name: Master Rate
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'FAC_RATE', 'Master Rate', 3, 'A');


/*********************************
Category Code: APPLICATION_SOURCE
Category Name: Source Code
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'APPLICATION_SOURCE', 'Source Code', 3, 'A');


/*********************************
Category Code: PRODUCT_PACKAGE
Category Name: Product Package Code
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'PRODUCT_PACKAGE', 'Product Package Code', 3, 'A');



/*********************************
Category Code: DEPARTMENT
Category Name: Department Code
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'DEPARTMENT', 'Department Code', 3, 'A');


/*********************************
Category Code: REFINANCE_BANK
Category Name: Refinance Bank
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'REFINANCE_BANK', 'Refinance Bank', 3, 'A');


/*******************************
Category Code: BNM_INDUSTRY 
Category Name: BNM Industry Code
********************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'BNM_INDUSTRY', 'BNM Industry Code', 3, 'A');


/*********************************
Category Code: BNM_STATE
Category Name: BNM State Code
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'BNM_STATE', 'BNM State Code', 3, 'A');


/*********************************
Category Code: BNM_BUMI_NRCC
Category Name: BNM State Code
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'BNM_BUMI_NRCC', 'BNM State Code', 3, 'A');


/*********************************
Category Code: BNM_SML_SCALE
Category Name: BNM small scale code
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'BNM_SML_SCALE', 'BNM small scale code', 3, 'A');


/*********************************
Category Code: BNM_PRSCB_RT
Category Name: BNM Prescribed Rate Code
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'BNM_PRSCB_RT', 'BNM Prescribed Rate Code', 3, 'A');


/*********************************
Category Code: BNM_RELSHIP
Category Name: BNM Relationship Code
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'BNM_RELSHIP', 'BNM Relationship Code', 3, 'A');


/*********************************
Category Code: BNM_GOOD_FINANCE_1
Category Name: BNM Goods Financed Cd1
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'BNM_GOOD_FINANCE_1', 'BNM Goods Financed Cd1', 3, 'A');


/*********************************
Category Code: BNM_GOOD_FINANCE_2
Category Name: BNM Goods Financed Cd2
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'BNM_GOOD_FINANCE_2', 'BNM Goods Financed Cd2', 3, 'A');


/*********************************
Category Code: BNM_EXMPT_CODE
Category Name: BNM Exempt Code
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'BNM_EXMPT_CODE', 'BNM Exempt Code', 3, 'A');



/*********************************
Category Code: BNM_PURPOSE
Category Name: BNM PURPOSE CODE
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'BNM_PURPOSE', 'BNM PURPOSE CODE', 3, 'A');


/*********************************
Category Code: OFFICER_RELATIONSHIP
Category Name: Relationship code
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'OFFICER_RELATIONSHIP', 'Relationship code', 3, 'A');



/*********************************
Category Code: HOLD_MAIL
Category Name: Hold Mail Code
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'HOLD_MAIL', 'Hold Mail Code', 3, 'A');


/*********************************
Category Code: ETHNIC
Category Name: Race/Country of heritage
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'ETHNIC', 'Race/Country of heritage', 3, 'A');


/*********************************
Category Code: REIMBURSEMENT_BANK
Category Name: Reimbursement Bank
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'REIMBURSEMENT_BANK', 'Reimbursement Bank', 3, 'A');


/*******************************************
Category Code: INSURER_TAG
Category Name: Insurer Tagging
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'INSURER_TAG','Insurer Tagging', 3, 'A'); 


/*******************************************
Category Code: ENDORSEMENT
Category Name: Endorsement Code
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'ENDORSEMENT','Endorsement Code', 3, 'A'); 


/*******************************************
Category Code: UNIT_TRUST_FUND
Category Name: Unit Trust Parameter
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'UNIT_TRUST_FUND','Unit Trust Parameter', 3, 'A'); 

/*********************************
Category Code: DEVELOPER_CODE
Category Name: Developer Name
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'DEVELOPER_CODE', 'Developer Name', 3, 'A');

/*******************************************
Category Code: INSURER_NAME
Category Name: Insurer Name
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'INSURER_NAME', 'Insurer Name', 3, 'A'); 

/*******************************
Category Code: SOLICITOR
Category Name: Solicitor
*******************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'SOLICITOR', 'Solicitor', 3, 'A');

/*********************************
Category Code: DEALER
Category Name: Dealer
********************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
VALUES (NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, 'DEALER', 'Dealer', 3, 'A');

/*******************************************
Category Code: VALUER
Category Name: Valuer
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'VALUER', 'Valuer', 3, 'A'); 

/******************************
Category Code: BASEL_IRB
Category Name: Basel II Field: IRB CODE
*******************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS, VERSION_TIME)
values
( NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'BASEL_IRB','Basel II Field: IRB CODE', 3, 'A', 0);


/******************************
Category Code: BASEL_SA_FINALIST
Category Name: Basel II Field:SA CODE Finalist
*******************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS, VERSION_TIME)
values
( NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'BASEL_SA_FINALIST','Basel II Field:SA CODE Finalist', 3, 'A', 0);


/******************************
Category Code: REQUEST_REASON
Category Name: Request Reason Code
*******************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS, VERSION_TIME)
values
( NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'REQUEST_REASON','Request Reason Code', 3, 'A', 0);


/******************************
Category Code: BASEL_SA_CONCEPT
Category Name: Basel II Field: SA Concept
*******************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS, VERSION_TIME)
values
( NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'BASEL_SA_CONCEPT','Basel II Field: SA Concept', 3, 'A', 0);

/*****************************
Category Code: 5
Category Name: Customer Segment
******************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, '5', 'Customer Segment', 3, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id, country, entry_source) select next value for common_code_category_entry_seq,'CC01','Credit Card','1', '5', category_id, 'MY', 'SEMA' from common_code_category where category_code = '5';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id, country, entry_source)select next value for common_code_category_entry_seq,'AIB01','Alliance Invesement Bank - BOS-TRACS','1', '5', category_id, 'MY', 'BOST' from common_code_category where category_code = '5';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, category_code_id, country, entry_source) select next value for common_code_category_entry_seq,'AIB02','Alliance Invesement Bank - Corporate','1', '5', category_id, 'MY', 'FINS' from common_code_category where category_code = '5';

/*****************************
Category Code: 56
Category Name: Legal Constitution
******************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, '56', 'Legal Constitution', 3, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, country, category_code, category_code_id, entry_source)
select next value for common_code_category_entry_seq, 'MCORP', 'CORPORATE', '1', 'MY', category_code, category_id, 'BOST' from common_code_category where category_code = '56';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, country, category_code, category_code_id, entry_source)
select next value for common_code_category_entry_seq, 'M', 'INDIVIDUAL', '1', 'MY', category_code, category_id, 'BOST' from common_code_category where category_code = '56';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, country, category_code, category_code_id, entry_source)
select next value for common_code_category_entry_seq, '0', 'ISLAMIC BANK', '1', 'MY', category_code, category_id, 'QUAN' from common_code_category where category_code = '56';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, country, category_code, category_code_id, entry_source)
select next value for common_code_category_entry_seq, '1', 'MERCHANT BANK', '1', 'MY', category_code, category_id, 'QUAN' from common_code_category where category_code = '56';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, country, category_code, category_code_id, entry_source)
select next value for common_code_category_entry_seq, '6', 'DOMESTIC BUSINESS ENT', '1', 'MY', category_code, category_id, 'QUAN' from common_code_category where category_code = '56';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, country, category_code, category_code_id, entry_source)
select next value for common_code_category_entry_seq, '8', 'FOREIGN BANKING INST', '1', 'MY', category_code, category_id, 'QUAN' from common_code_category where category_code = '56';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, country, category_code, category_code_id, entry_source)
select next value for common_code_category_entry_seq, 'I', 'Individual', '1', 'MY', category_code, category_id, 'SEMA' from common_code_category where category_code = '56';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, country, category_code, category_code_id, entry_source)
select next value for common_code_category_entry_seq, 'C', 'Corporate', '1', 'MY', category_code, category_id, 'SEMA' from common_code_category where category_code = '56';



/*****************************
Category Code: 19
Category Name: Credit Risk Grade
******************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, '19', 'Credit Risk Grade', 3, 'A');

/**********************************************************************************
Category Code: CAR
Category Name: NPL - Car
***********************************************************************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'CAR', 'NPL - Car', 3, 'A');

/*****************************
Category Code: INCOME_RANGE
Category Name: Income Range
******************************/
insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
values
(next value for common_code_category_seq, 'INCOME_RANGE', 'Income Range', 3, 'A');

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '01','LESS THAN OR EQUAL TO 1,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '02','1,001 TO 2,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '03','2,001 TO 3,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '04','3,001 TO 4,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '05','4,001 TO 5,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '06','5,001 TO 6,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '07','6,001 TO 7,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '08','7,001 TO 8,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '09','8,001 TO 9,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '10','9,001 TO 10,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '11','10,001 TO 11,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '12','11,001 TO 12,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '13','12,001 TO 13,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '14','13,001 TO 14,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '15','14,001 TO 15,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '16','15,001 TO 16,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '17','16,001 TO 17,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '18','17,001 TO 18,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '19','18,001 TO 19,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '20','19,001 TO 20,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '21','20,001 TO 21,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '22','21,001 TO 22,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '23','22,001 TO 23,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '24','23,001 TO 24,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '25','24,001 TO 25,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '26','25,001 TO 26,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '27','26,001 TO 27,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '28','27,001 TO 28,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '29','28,001 TO 29,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '30','29,001 TO 30,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '31','30,001 TO 31,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '32','31,001 TO 32,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '33','32,001 TO 33,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '34','33,001 TO 34,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '35','34,001 TO 35,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '36','35,001 TO 36,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '37','36,001 TO 37,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '38','37,001 TO 38,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '39','38,001 TO 39,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '40','39,001 TO 40,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '41','40,001 TO 41,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '42','41,001 TO 42,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '43','42,001 TO 43,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '44','43,001 TO 44,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '45','44,001 TO 45,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '46','45,001 TO 46,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '47','46,001 TO 47,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '48','47,001 TO 48,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '49','48,001 TO 49,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '50','49,001 TO 50,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '51','50,001 TO 51,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '52','51,001 TO 52,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '53','52,001 TO 53,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '54','53,001 TO 54,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '55','54,001 TO 55,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '56','55,001 TO 56,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '57','56,001 TO 57,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '58','57,001 TO 58,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '59','58,001 TO 59,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '60','59,001 TO 60,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '61','60,001 TO 61,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '62','61,001 TO 62,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '63','62,001 TO 63,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '64','63,001 TO 64,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '65','64,001 TO 65,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '66','65,001 TO 66,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '67','66,001 TO 67,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '68','67,001 TO 68,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '69','68,001 TO 69,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '70','69,001 TO 70,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '71','70,001 TO 71,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '72','71,001 TO 72,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '73','72,001 TO 73,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '74','73,001 TO 74,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '75','74,001 TO 75,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '76','75,001 TO 76,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '77','76,001 TO 77,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '78','77,001 TO 78,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '79','78,001 TO 79,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '80','79,001 TO 80,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '81','80,001 TO 81,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '82','81,001 TO 82,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '83','82,001 TO 83,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '84','83,001 TO 84,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '85','84,001 TO 85,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '86','85,001 TO 86,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '87','86,001 TO 87,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '88','87,001 TO 88,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '89','88,001 TO 89,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '90','89,001 TO 90,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '91','90,001 TO 91,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '92','91,001 TO 92,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '93','92,001 TO 93,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '94','93,001 TO 94,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '95','94,001 TO 95,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '96','95,001 TO 96,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '97','96,001 TO 97,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '98','97,001 TO 98,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '99','98,001 TO 99,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq,'100','99,001 TO 100,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq,'101','ABOVE 100,000','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '00','ZERO','1', category_code, 'MY', category_id, 'SEMA' from common_code_category where category_code = 'INCOME_RANGE';

insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '01','LESS THAN OR EQUAL TO 1,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '02','1,001 TO 2,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '03','2,001 TO 3,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '04','3,001 TO 4,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '05','4,001 TO 5,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '06','5,001 TO 6,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '07','6,001 TO 7,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '08','7,001 TO 8,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '09','8,001 TO 9,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '10','9,001 TO 10,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '11','10,001 TO 11,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '12','11,001 TO 12,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '13','12,001 TO 13,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '14','13,001 TO 14,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '15','14,001 TO 15,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '16','15,001 TO 16,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '17','16,001 TO 17,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '18','17,001 TO 18,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '19','18,001 TO 19,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '20','19,001 TO 20,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '21','20,001 TO 21,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '22','21,001 TO 22,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '23','22,001 TO 23,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '24','23,001 TO 24,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '25','24,001 TO 25,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '26','25,001 TO 26,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '27','26,001 TO 27,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '28','27,001 TO 28,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '29','28,001 TO 29,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '30','29,001 TO 30,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '31','30,001 TO 31,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '32','31,001 TO 32,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '33','32,001 TO 33,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '34','33,001 TO 34,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '35','34,001 TO 35,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '36','35,001 TO 36,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '37','36,001 TO 37,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '38','37,001 TO 38,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '39','38,001 TO 39,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '40','39,001 TO 40,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '41','40,001 TO 41,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '42','41,001 TO 42,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '43','42,001 TO 43,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '44','43,001 TO 44,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '45','44,001 TO 45,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '46','45,001 TO 46,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '47','46,001 TO 47,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '48','47,001 TO 48,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '49','48,001 TO 49,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '50','49,001 TO 50,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '51','50,001 TO 51,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '52','51,001 TO 52,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '53','52,001 TO 53,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '54','53,001 TO 54,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '55','54,001 TO 55,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '56','55,001 TO 56,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '57','56,001 TO 57,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '58','57,001 TO 58,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '59','58,001 TO 59,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '60','59,001 TO 60,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '61','60,001 TO 61,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '62','61,001 TO 62,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '63','62,001 TO 63,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '64','63,001 TO 64,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '65','64,001 TO 65,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '66','65,001 TO 66,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '67','66,001 TO 67,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '68','67,001 TO 68,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '69','68,001 TO 69,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '70','69,001 TO 70,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '71','70,001 TO 71,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '72','71,001 TO 72,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '73','72,001 TO 73,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '74','73,001 TO 74,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '75','74,001 TO 75,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '76','75,001 TO 76,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '77','76,001 TO 77,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '78','77,001 TO 78,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '79','78,001 TO 79,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '80','79,001 TO 80,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '81','80,001 TO 81,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '82','81,001 TO 82,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '83','82,001 TO 83,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '84','83,001 TO 84,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '85','84,001 TO 85,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '86','85,001 TO 86,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '87','86,001 TO 87,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '88','87,001 TO 88,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '89','88,001 TO 89,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '90','89,001 TO 90,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '91','90,001 TO 91,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '92','91,001 TO 92,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '93','92,001 TO 93,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '94','93,001 TO 94,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '95','94,001 TO 95,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '96','95,001 TO 96,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '97','96,001 TO 97,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '98','97,001 TO 98,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '99','98,001 TO 99,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq,'100','99,001 TO 100,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq,'101','ABOVE 100,000','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id, entry_source) select next value for common_code_category_entry_seq, '00','ZERO','1', category_code, 'MY', category_id, 'ARBS' from common_code_category where category_code = 'INCOME_RANGE';

/*******************************************
Category Code: FAC_PRODUCT_MAP
Category Name: Facility and Product Relationship
********************************************/
INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
values
( next value for common_code_category_seq, 'FAC_PRODUCT_MAP', 'Facility and Product Relationship', 3, 'A'); 


/*************************
Category type: 4
**************************/

/*******************************************
Category Code: OCCUPATION
Category Name: Occupation
********************************************/
-- INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
-- values
-- ( next value for common_code_category_seq, 'OCCUPATION', 'Occupation', 4, 'A'); 


-- /*******************************************
-- Category Code: CITY
-- Category Name: City/State/Zip Code
-- ********************************************/
-- INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS)
-- values
-- ( next value for common_code_category_seq, 'CITY', 'City/State/Zip Code', 4, 'A'); 


-- /*******************************
-- Category Code: VIP
-- Category Name: CIF VIP Code
-- ********************************/
-- insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
-- values
-- (next value for common_code_category_seq, 'VIP', 'CIF VIP Code', 4, 'A');


-- /*******************************
-- Category Code: DESIGNATION
-- Category Name: Job designation code
-- ********************************/
-- insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
-- values
-- (next value for common_code_category_seq, 'DESIGNATION', 'Job designation code', 4, 'A');


-- /*******************************
-- Category Code: INSIDER
-- Category Name: Insider code
-- ********************************/
-- insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
-- values
-- (next value for common_code_category_seq, 'INSIDER', 'Insider code', 4, 'A');


-- /*******************************
-- Category Code: ELEC_ADDR_CODE
-- Category Name: Electronic Address Code
-- ********************************/
-- insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
-- values
-- (next value for common_code_category_seq, 'ELEC_ADDR_CODE', 'Electronic Address Code', 4, 'A');


-- /*******************************
-- Category Code: SALUTATION
-- Category Name: Salutation
-- ********************************/
-- insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
-- values
-- (next value for common_code_category_seq, 'SALUTATION', 'Salutation', 4, 'A');


-- /*******************************
-- Category Code: BUMI_LIST 
-- Category Name: Bumi / Residence Code
-- ********************************/
-- insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
-- values
-- (next value for common_code_category_seq, 'BUMI_LIST', 'Bumi / Residence Code', 4, 'A');


-- /*******************************
-- Category Code: MARITAL_STATUS 
-- Category Name: Marital status code
-- ********************************/
-- insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
-- values
-- (next value for common_code_category_seq, 'MARITAL_STATUS', 'Marital status code', 4, 'A');


-- /*******************************
-- Category Code: EMPLYMT_STATUS 
-- Category Name: Employment status
-- ********************************/
-- insert into common_code_category (category_id, category_code, category_name, category_type, active_status)
-- values
-- (next value for common_code_category_seq, 'EMPLYMT_STATUS', 'Employment status', 4, 'A');

 
/*******************************************
HOST_CENTRE
Due to setup for Category Code = '40'
********************************************/

--insert into host_centre(centre_type, centre_code, name, has_branch) values ('CAC', '18', 'Kuala Lumpur', 'Y');
--insert into host_centre(centre_type, centre_code, name, has_branch) values ('RC', '18', 'Kuala Lumpur', 'Y');


/******************************
Category Code: RELATION_JOINT_GUARANTOR
Category Name: Joint Borrower / Guarantor Relation With Main
*******************************/
-- INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS, VERSION_TIME)
-- values
-- ( NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'RELATION_JOINT_GUARANTOR','Joint Borrower / Guarantor Relation With Main', 4, 'A', 0);


-- /******************************
-- Category Code: RC_BRANCH
-- Category Name: RC Branch
-- *******************************/
-- INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS, VERSION_TIME)
-- values
-- ( NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'RC_BRANCH','RC Branch', 4, 'A', 0);


/******************************
Category Code: MESSAGE_TYPE
Category Name: Message Type code
*******************************/
-- INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS, VERSION_TIME)
-- values
-- ( NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'MESSAGE_TYPE','Message Type code', 4, 'A', 0);


-- /******************************
-- Category Code: MESSAGE_SEVERITY
-- Category Name: Message Severity
-- *******************************/
-- INSERT INTO COMMON_CODE_CATEGORY (CATEGORY_ID, CATEGORY_CODE, CATEGORY_NAME, CATEGORY_TYPE, ACTIVE_STATUS, VERSION_TIME)
-- values
-- ( NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ,'MESSAGE_SEVERITY','Message Severity', 4, 'A', 0);
