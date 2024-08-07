/* Matching  the security property mukim, district, taman based on the extraction listgiven by GIT.  */

DROP TABLE LOAD_CO009_PT;
DROP TABLE PATCH_CO009_PT;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SCHEMA for COLLATERAL PROPERTY PATCHING
--------------------------------------------------------
-- This table was used during loading to store the sibs property address
CREATE TABLE LOAD_CO009_PT (
	IS_VALID                        CHAR(1) DEFAULT 'Y',  
	SECURITY_ID                     VARCHAR(25),
	ERROR_MSG						VARCHAR(100),
	SIBS_PROPERTY_ADDRESS			VARCHAR(100)
) in CMS_MIG index in CMS_MIG_INDEX;

-- This table was used to be patching update into cms property table
CREATE TABLE PATCH_CO009_PT (
    CMS_ACT_COL_ID                  BIGINT,
    CMS_STG_COL_ID                  BIGINT, 
    IS_VALID                        CHAR(1) DEFAULT 'Y',    
	
	CIF_ID 							VARCHAR(19),
	AA_NUMBER 		                VARCHAR(19),
	
    SECURITY_ID                     VARCHAR(25),
    PROPERTY_ADDRESS                VARCHAR(150),
    PROPERTY_ADDRESS_2              VARCHAR(50),
    PROPERTY_ADDRESS_3              VARCHAR(50),	
    POST_CODE                       VARCHAR(6),
    STATE_CODE                      VARCHAR(40),
	MUKIM_CODE                      VARCHAR(10),
	DISTRICT_CODE                   VARCHAR(10),
	TAMAN							VARCHAR(50),
	
	STATE							VARCHAR(30),
	MUKIM							VARCHAR(80),
	DISTRICT						VARCHAR(80),
	
	APPLICATION_TYPE				VARCHAR(2),
	APPLICATION_LAW_TYPE			VARCHAR(3),		
	LOC_ORG_CODE					VARCHAR(5),
	CENTER_CODE						VARCHAR(5),
	SIBS_PROPERTY_ADDRESS			VARCHAR(200),
	LPP_DEALER_CODE					VARCHAR(40),
	LPP_DEALER_NAME					VARCHAR(40),
	LPP_DEALER_CAT					VARCHAR(20) DEFAULT 'DEALER'
	STATE_CAT                       VARCHAR(20) DEFAULT 'STATE',
    DISTRICT_CAT                    VARCHAR(20) DEFAULT 'DISTRICT',
    MUKIM_CAT                       VARCHAR(20) DEFAULT 'MUKIM'
) in CMS_MIG index in CMS_MIG_INDEX;

drop index LOAD_IDX_001 on LOAD_CO009_PT;
create index LOAD_IDX_001 on LOAD_CO009_PT
("SECURITY_ID" ASC, "IS_VALID" ASC) 
ALLOW REVERSE SCANS;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POPULATE  PROPERTY DETAILS INTO TEMP TABLE
--------------------------------------------------------
-- 98347
select count(*) from CMS_SECURITY sec, CMS_PROPERTY pty
where sec.CMS_COLLATERAL_ID = pty.CMS_COLLATERAL_ID 
and sec.IS_MIGRATED_IND = 'Y'

-- Valid property address for migration record 
select sec.CMS_COLLATERAL_ID, pty.POSTCODE, pty.STATE, pty.MUKIM, pty.DISTRICT, pty.TAMAN 
from CMS_SECURITY sec, CMS_PROPERTY pty
where sec.CMS_COLLATERAL_ID = pty.CMS_COLLATERAL_ID 
and sec.IS_MIGRATED_IND = 'Y'
and length(pty.POSTCODE) > 0 
and pty.POSTCODE <> '00000'
and length(pty.STATE) > 0
and length(pty.MUKIM) > 0 
and length(pty.DISTRICT) > 0
and length(pty.TAMAN) > 0 
order by POSTCODE;

-- This will be the list need to be updated by the user
select sec.CMS_COLLATERAL_ID, sec.SCI_SECURITY_DTL_ID, pty.PROPERTY_ADDRESS, pty.PROPERTY_ADDRESS_2, pty.PROPERTY_ADDRESS_3, pty.POSTCODE, pty.STATE, pty.MUKIM, pty.DISTRICT, pty.TAMAN 
from CMS_SECURITY sec, CMS_PROPERTY pty
where sec.CMS_COLLATERAL_ID = pty.CMS_COLLATERAL_ID 
and sec.IS_MIGRATED_IND = 'Y'
order by POSTCODE;
	
-- Patching the security property detail into temporary table	
insert into PATCH_CO009_PT (CMS_ACT_COL_ID, SECURITY_ID, PROPERTY_ADDRESS, PROPERTY_ADDRESS_2, PROPERTY_ADDRESS_3, 
							POST_CODE, STATE_CODE, MUKIM_CODE, DISTRICT_CODE, TAMAN, LOC_ORG_CODE) 
(select sec.CMS_COLLATERAL_ID, sec.SCI_SECURITY_DTL_ID, pty.PROPERTY_ADDRESS, pty.PROPERTY_ADDRESS_2, pty.PROPERTY_ADDRESS_3, pty.POSTCODE, pty.STATE, 
		pty.MUKIM, pty.DISTRICT, pty.TAMAN, sec.SECURITY_ORGANISATION
from CMS_SECURITY sec, CMS_PROPERTY pty
where sec.CMS_COLLATERAL_ID = pty.CMS_COLLATERAL_ID 
and sec.IS_MIGRATED_IND = 'Y'
order by POSTCODE);

-- Update staging collateral id
update PATCH_CO009_PT pt 
set CMS_STG_COL_ID = (select trx.STAGING_REFERENCE_ID from transaction trx
                        where trx.REFERENCE_ID = pt.CMS_ACT_COL_ID
                        and trx.TRANSACTION_TYPE = 'COL')
where exists (select 1 from transaction trx
                where trx.REFERENCE_ID = pt.CMS_ACT_COL_ID
                and trx.TRANSACTION_TYPE = 'COL' fetch first row only);

				
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VALIDATION  - Matching security id in cms vs sibs
--------------------------------------------------------
-- Update is_valid = 'N' when not found in the actual security table
update LOAD_CO009_PT loadpt
set loadpt.IS_VALID = 'N'
where not exists (select 1 from CMS_SECURITY sec
					where trim(loadpt.SECURITY_ID) = sec.SCI_SECURITY_DTL_ID fetch first row only);

update LOAD_CO009_PT loadpt
	set loadpt.ERROR_MSG = 'Security given was not found in actual table'
where loadpt.IS_VALID = 'N'
and loadpt.ERROR_MSG is null;

-- Check for duplicate security id
UPDATE LOAD_CO009_PT a set is_valid = 'N'
where trim(a.SECURITY_ID) in (select t.SECURITY_ID
	from LOAD_CO009_PT t
	group by t.SECURITY_ID
	having count(*) > 1)
and a.is_valid = 'Y';

update LOAD_CO009_PT loadpt
	set loadpt.ERROR_MSG = 'Duplicate security info for Property Security ID'
where loadpt.IS_VALID = 'N'
and loadpt.ERROR_MSG is null;

-- Check for duplicate collateral name
UPDATE LOAD_CO009_PT a set is_valid = 'N'
where a.SECURITY_REF_NOTE in (select t.SECURITY_REF_NOTE
	from LOAD_CO009_PT t
	group by t.SECURITY_REF_NOTE
	having count(*) > 1)
and a.is_valid = 'Y';

update LOAD_CO009_PT loadpt
	set loadpt.ERROR_MSG = 'Duplicate security info for Property Collateral Name'
where loadpt.IS_VALID = 'N'
and loadpt.ERROR_MSG is null;

-- Update application type and application law type - for data extraction purpose
update PATCH_CO009_PT pt
set (APPLICATION_TYPE, APPLICATION_LAW_TYPE) = 
	(select aa.APPLICATION_TYPE, aa.APPLICATION_LAW_TYPE 
		from CMS_LIMIT_SECURITY_MAP lsm, SCI_LSP_APPR_LMTS lmt, SCI_LSP_LMT_PROFILE aa
		where pt.CMS_ACT_COL_ID = lsm.CMS_COLLATERAL_ID
		and lsm.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID
		and lmt.CMS_LIMIT_PROFILE_ID = aa.CMS_LSP_LMT_PROFILE_ID fetch first row only)
where exists (select 1 from CMS_LIMIT_SECURITY_MAP lsm1, SCI_LSP_APPR_LMTS lmt1, SCI_LSP_LMT_PROFILE aa1
		where pt.CMS_ACT_COL_ID = lsm1.CMS_COLLATERAL_ID
		and lsm1.CMS_LSP_APPR_LMTS_ID = lmt1.CMS_LSP_APPR_LMTS_ID
		and lmt1.CMS_LIMIT_PROFILE_ID = aa1.CMS_LSP_LMT_PROFILE_ID fetch first row only);
		
update PATCH_CO009_PT pt
set (CIF_ID, AA_NUMBER) = (select lmt.LMT_LE_ID, lmt.LMT_BCA_REF_NUM 
                            from CMS_SECURITY sec, CMS_LIMIT_SECURITY_MAP lsm, SCI_LSP_APPR_LMTS lmt
                            where pt.SECURITY_ID = sec.SCI_SECURITY_DTL_ID 
                            and sec.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
                            and lsm.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID fetch first row only)
where exists (select 1 from CMS_SECURITY sec1, CMS_LIMIT_SECURITY_MAP lsm1, SCI_LSP_APPR_LMTS lmt1
                where sec1.SCI_SECURITY_DTL_ID = pt.SECURITY_ID
                and sec1.CMS_COLLATERAL_ID = lsm1.CMS_COLLATERAL_ID
                and lsm1.CMS_LSP_APPR_LMTS_ID = lmt1.CMS_LSP_APPR_LMTS_ID fetch first row only);
				
update PATCH_CO009_PT
set (STATE_CODE, STATE) = ('', '') 
where (POST_CODE = '' or POST_CODE = '00000')
and STATE = 'SELANGOR';			

update PATCH_CO009_PT pt
set CENTER_CODE = (select REF_ENTRY_CODE from common_code_category_entry comm
                    where comm.ENTRY_CODE = pt.LOC_ORG_CODE
                    and comm.category_code = '40')
where exists (select 1 from common_code_category_entry comm1
                where comm1.ENTRY_CODE = pt.LOC_ORG_CODE
                and comm1.category_code = '40');			

-- Update dealer lpp code				
update PATCH_CO009_PT pt
set LPP_DEALER_CODE = (select facmas.DEALER_NUM_LPP_CODE_VALUE 
                        from CMS_SECURITY sec, CMS_LIMIT_SECURITY_MAP lsm, sci_lsp_appr_lmts lmt, CMS_FACILITY_MASTER facmas
                        where pt.SECURITY_ID = sec.SCI_SECURITY_DTL_ID
                        and sec.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
                        and lsm.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID
                        and lmt.CMS_LSP_APPR_LMTS_ID = facmas.CMS_LSP_APPR_LMTS_ID fetch first row only)
where exists (select 1 from CMS_SECURITY sec1, CMS_LIMIT_SECURITY_MAP lsm1, sci_lsp_appr_lmts lmt1, CMS_FACILITY_MASTER facmas1
                        where pt.SECURITY_ID = sec1.SCI_SECURITY_DTL_ID
                        and sec1.CMS_COLLATERAL_ID = lsm1.CMS_COLLATERAL_ID
                        and lsm1.CMS_LSP_APPR_LMTS_ID = lmt1.CMS_LSP_APPR_LMTS_ID
                        and lmt1.CMS_LSP_APPR_LMTS_ID = facmas1.CMS_LSP_APPR_LMTS_ID fetch first row only);		

-- Update lpp dealer name						
update PATCH_CO009_PT pt
set LPP_DEALER_NAME = (select comm.ENTRY_NAME
                        from COMMON_CODE_CATEGORY_ENTRY comm
                        where pt.LPP_DEALER_CODE = comm.ENTRY_CODE
                        and comm.CATEGORY_CODE = pt.LPP_DEALER_CAT)
where exists (select 1 from COMMON_CODE_CATEGORY_ENTRY comm1
                where pt.LPP_DEALER_CODE = comm1.ENTRY_CODE
                and comm1.CATEGORY_CODE = pt.LPP_DEALER_CAT);
				
-- Patch empty application type				
update PATCH_CO009_PT
set (APPLICATION_TYPE, APPLICATION_LAW_TYPE) = ('MO', 'CON')
where SECURITY_ID in ('4347382', '2284010', '97294', '2391800')
and APPLICATION_TYPE is null;				

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE SIBS Property Address
--------------------------------------------------
-- update  sibs property detail to temporary patching tables
update PATCH_CO009_PT pt
set pt.SIBS_PROPERTY_ADDRESS = (select tmppt.SIBS_PROPERTY_ADDRESS 
								from LOAD_CO009_PT tmppt
								where tmppt.SECURITY_ID = pt.SECURITY_ID
								and tmppt.IS_VALID = 'Y')
where exists (select 1 from LOAD_CO009_PT tmppt1
				where tmppt1.SECURITY_ID = pt.SECURITY_ID
				and tmppt1.IS_VALID = 'Y');
				
update PATCH_CO009_PT pt
set STATE = (select ENTRY_NAME from common_code_category_entry comm
                where comm.entry_code = pt.STATE_CODE
                and comm.category_code = 'STATE')
where exists (select 1 from common_code_category_entry comm1
                where comm1.entry_code = pt.STATE_CODE
                and comm1.category_code = 'STATE'
                and length(pt.STATE_CODE) > 0);		

update PATCH_CO009_PT pt
set MUKIM = (select ENTRY_NAME from common_code_category_entry comm
                where comm.entry_code = pt.MUKIM_CODE
                and comm.category_code = 'MUKIM')
where exists (select 1 from common_code_category_entry comm1
                where comm1.entry_code = pt.MUKIM_CODE
                and comm1.category_code = 'MUKIM'
                and length(pt.MUKIM_CODE) > 0);				

update PATCH_CO009_PT pt
set DISTRICT = (select ENTRY_NAME from common_code_category_entry comm
                where comm.entry_code = pt.DISTRICT_CODE
                and comm.category_code = 'DISTRICT')
where exists (select 1 from common_code_category_entry comm1
                where comm1.entry_code = pt.DISTRICT_CODE
                and comm1.category_code = 'DISTRICT'
                and length(pt.DISTRICT_CODE) > 0);	
		
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EXTRACT list to the user to fill-in
--------------------------------------------------		
select APPLICATION_TYPE, APPLICATION_LAW_TYPE, CENTER_CODE, LOC_ORG_CODE as BRANCH_CODE, SECURITY_ID, PROPERTY_ADDRESS, PROPERTY_ADDRESS_2, PROPERTY_ADDRESS_3, 
SIBS_PROPERTY_ADDRESS as SIBS_MUKIM_DISTRICT, POST_CODE, STATE, MUKIM, DISTRICT, TAMAN, LPP_DEALER_CODE, LPP_DEALER_NAME 
from PATCH_CO009_PT 
where APPLICATION_TYPE = 'HP'
and APPLICATION_LAW_TYPE = 'CON' 
order by CENTER_CODE, cast (LOC_ORG_CODE as bigint), POST_CODE;

select APPLICATION_TYPE, APPLICATION_LAW_TYPE, CENTER_CODE, LOC_ORG_CODE as BRANCH_CODE, SECURITY_ID, PROPERTY_ADDRESS, PROPERTY_ADDRESS_2, PROPERTY_ADDRESS_3, 
SIBS_PROPERTY_ADDRESS as SIBS_MUKIM_DISTRICT, POST_CODE, STATE, MUKIM, DISTRICT, TAMAN, LPP_DEALER_CODE, LPP_DEALER_NAME 
from PATCH_CO009_PT 
where APPLICATION_TYPE = 'MO'
and APPLICATION_LAW_TYPE = 'CON' 
order by CENTER_CODE, cast (LOC_ORG_CODE as bigint), POST_CODE;

select APPLICATION_TYPE, APPLICATION_LAW_TYPE, CENTER_CODE, LOC_ORG_CODE as BRANCH_CODE, SECURITY_ID, PROPERTY_ADDRESS, PROPERTY_ADDRESS_2, PROPERTY_ADDRESS_3, 
SIBS_PROPERTY_ADDRESS as SIBS_MUKIM_DISTRICT, POST_CODE, STATE, MUKIM, DISTRICT, TAMAN, LPP_DEALER_CODE, LPP_DEALER_NAME 
from PATCH_CO009_PT 
where APPLICATION_TYPE = 'SF'
and APPLICATION_LAW_TYPE = 'CON' 
order by CENTER_CODE, cast (LOC_ORG_CODE as bigint), POST_CODE;

select APPLICATION_TYPE, APPLICATION_LAW_TYPE, CENTER_CODE, LOC_ORG_CODE as BRANCH_CODE, SECURITY_ID, PROPERTY_ADDRESS, PROPERTY_ADDRESS_2, PROPERTY_ADDRESS_3, 
SIBS_PROPERTY_ADDRESS as SIBS_MUKIM_DISTRICT, POST_CODE, STATE, MUKIM, DISTRICT, TAMAN, LPP_DEALER_CODE, LPP_DEALER_NAME 
from PATCH_CO009_PT 
where APPLICATION_TYPE = 'MO'
and APPLICATION_LAW_TYPE = 'ISL' 
order by CENTER_CODE, cast (LOC_ORG_CODE as bigint), POST_CODE;
				
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE  Collateral Property 
--------------------------------------------------
update CMS_PROPERTY pty
set (POSTCODE, STATE, MUKIM, DISTRICT, TAMAN) = 
	(select POST_CODE, STATE_CODE, DISTRICT_CODE, MUKIM_CODE, TAMAN from PATCH_CO009_PT pt
		where pt.CMS_ACT_COL_ID = pty.CMS_COLLATERAL_ID
		and pt.IS_VALID = 'Y')
where exists (select 1 from PATCH_CO009_PT pt
				where pt.CMS_ACT_COL_ID = pty.CMS_COLLATERAL_ID
				and pt.IS_VALID = 'Y');

update CMS_STAGE_PROPERTY pty
set (POSTCODE, STATE, MUKIM, DISTRICT, TAMAN) = 
	(select POST_CODE, STATE_CODE, DISTRICT_CODE, MUKIM_CODE, TAMAN from PATCH_CO009_PT pt
		where pt.CMS_ACT_COL_ID = pty.CMS_COLLATERAL_ID
		and pt.IS_VALID = 'Y')
where exists (select 1 from PATCH_CO009_PT pt
				where pt.CMS_ACT_COL_ID = pty.CMS_COLLATERAL_ID
				and pt.IS_VALID = 'Y');

				