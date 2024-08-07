/*  Update  spread sign confirm by SIL and user extracted from excel */ 

-- 97 record effected
select lmt.LOS_LMT_ID, lsm.SCI_LAS_SEC_ID as SECURITY_ID, facint.CMS_FAC_MASTER_ID
from SCI_LSP_LMT_PROFILE aa, SCI_LSP_APPR_LMTS lmt, CMS_FACILITY_MASTER facmas, CMS_FAC_INTEREST facint, CMS_LIMIT_SECURITY_MAP lsm 
where aa.CMS_LSP_LMT_PROFILE_ID = lmt.CMS_LIMIT_PROFILE_ID and lmt.CMS_LSP_APPR_LMTS_ID = facmas.CMS_LSP_APPR_LMTS_ID 
and lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID and facmas.ID = facint.CMS_FAC_MASTER_ID and facint.SPREAD > 0 
and facint.SPREAD_SIGN is null and (char(ID) like '20090801%' or char(ID) like '20090808%');

------------------------------------------------------------------------------------------------------------------------------------------------------------------
drop table CMS_FAC_INTEREST_PATCH_TEMP;
drop table CMS_STG_FAC_INTEREST_PATCH_TEMP;

create table CMS_FAC_INTEREST_PATCH_TEMP (
    CMS_FAC_MASTER_ID BIGINT,
    LOS_LMT_ID VARCHAR (43),
    SCI_LAS_SEC_ID VARCHAR (50),
    SPREAD DECIMAL, 
    SPREAD_SIGN CHARACTER(1),
    EMPTY_SPREAD_AND_SIGN_IND CHARACTER(1)
);

create table CMS_STG_FAC_INTEREST_PATCH_TEMP (
    CMS_FAC_MASTER_ID BIGINT,
    LOS_LMT_ID VARCHAR (43),
    SCI_LAS_SEC_ID VARCHAR (50),
    SPREAD DECIMAL, 
    SPREAD_SIGN CHARACTER(1),
    EMPTY_SPREAD_AND_SIGN_IND CHARACTER(1)
);

insert into CMS_FAC_INTEREST_PATCH_TEMP (CMS_FAC_MASTER_ID, LOS_LMT_ID, SCI_LAS_SEC_ID) (
	select facint.CMS_FAC_MASTER_ID, lmt.LOS_LMT_ID, lsm.SCI_LAS_SEC_ID 
	from SCI_LSP_LMT_PROFILE aa, SCI_LSP_APPR_LMTS lmt, CMS_FACILITY_MASTER facmas, CMS_FAC_INTEREST facint, CMS_LIMIT_SECURITY_MAP lsm 
	where aa.CMS_LSP_LMT_PROFILE_ID = lmt.CMS_LIMIT_PROFILE_ID and lmt.CMS_LSP_APPR_LMTS_ID = facmas.CMS_LSP_APPR_LMTS_ID 
	and lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID and facmas.ID = facint.CMS_FAC_MASTER_ID and facint.SPREAD > 0 
	and facint.SPREAD_SIGN is null and (char(ID) like '20090801%' or char(ID) like '20090808%'));

-- Update  spread sign extraction from excel
="update CMS_FAC_INTEREST_PATCH_TEMP factmp set factmp.SPREAD_SIGN = '"&N5&"' where factmp.LOS_LMT_ID = '"&E5&"' and factmp.SCI_LAS_SEC_ID = '"&H5&"';"

-- Update spread and spread sign into empty extract from excel
="update CMS_FAC_INTEREST_PATCH_TEMP factmp set EMPTY_SPREAD_AND_SIGN_IND = 'Y' where factmp.LOS_LMT_ID = '"&E57&"' and factmp.SCI_LAS_SEC_ID = '"&H57&"';"
			
-- Update spread to predefine value			
update CMS_FAC_INTEREST facint
set facint.SPREAD_SIGN = (select factmp.SPREAD_SIGN from CMS_FAC_INTEREST_PATCH_TEMP factmp
							where facint.CMS_FAC_MASTER_ID = factmp.CMS_FAC_MASTER_ID
							and factmp.SPREAD_SIGN is not null
							and factmp.EMPTY_SPREAD_AND_SIGN_IND is null fetch first row only)
where facint.SPREAD_SIGN is null
and facint.SPREAD > 0;

-- Update spread and spread sign to empty
update CMS_FAC_INTEREST
set SPREAD = null
where CMS_FAC_MASTER_ID in (20090801000259118, 20090801000081584)
and SPREAD > 0
and SPREAD_SIGN is null;
		


insert into CMS_STG_FAC_INTEREST_PATCH_TEMP (CMS_FAC_MASTER_ID, LOS_LMT_ID, SCI_LAS_SEC_ID) (
	select facint.CMS_FAC_MASTER_ID, lmt.LOS_LMT_ID, lsm.SCI_LAS_SEC_ID 
	from SCI_LSP_LMT_PROFILE aa, SCI_LSP_APPR_LMTS lmt, CMS_STG_FACILITY_MASTER facmas, CMS_STG_FAC_INTEREST facint, CMS_LIMIT_SECURITY_MAP lsm 
	where aa.CMS_LSP_LMT_PROFILE_ID = lmt.CMS_LIMIT_PROFILE_ID and lmt.CMS_LSP_APPR_LMTS_ID = facmas.CMS_LSP_APPR_LMTS_ID 
	and lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID and facmas.ID = facint.CMS_FAC_MASTER_ID and facint.SPREAD > 0 
	and facint.SPREAD_SIGN is null and (char(ID) like '20090801%' or char(ID) like '20090808%'));		
	
-- Update  spread sign extraction from excel
="update CMS_STG_FAC_INTEREST_PATCH_TEMP factmp set factmp.SPREAD_SIGN = '"&N5&"' where factmp.LOS_LMT_ID = '"&E5&"' and factmp.SCI_LAS_SEC_ID = '"&H5&"';"

-- Update spread and spread sign into empty extract from excel
="update CMS_STG_FAC_INTEREST_PATCH_TEMP factmp set EMPTY_SPREAD_AND_SIGN_IND = 'Y' where factmp.LOS_LMT_ID = '"&E57&"' and factmp.SCI_LAS_SEC_ID = '"&H57&"';"	
	
-- Update spread to predefine value			
update CMS_STG_FAC_INTEREST facint
set facint.SPREAD_SIGN = (select factmp.SPREAD_SIGN from CMS_STG_FAC_INTEREST_PATCH_TEMP factmp
							where facint.CMS_FAC_MASTER_ID = factmp.CMS_FAC_MASTER_ID
							and factmp.SPREAD_SIGN is not null
							and factmp.EMPTY_SPREAD_AND_SIGN_IND is null fetch first row only)
where facint.SPREAD_SIGN is null
and facint.SPREAD > 0;

-- Update spread and spread sign to empty
update CMS_STG_FAC_INTEREST
set SPREAD = null
where CMS_FAC_MASTER_ID in (20090801000569300, 20090801000746750)
and SPREAD > 0
and SPREAD_SIGN is null;	
	
	
	
	
	