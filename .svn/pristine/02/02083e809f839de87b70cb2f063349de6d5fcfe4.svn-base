/* Patch application date = approval date  EONCMSPRD-973 */

drop table PATCH_APPLICATION_DATE_HP;

CREATE TABLE PATCH_APPLICATION_DATE_HP (
	CMS_LSP_APPR_LMTS_ID	BIGINT,
	CIF_ID 					VARCHAR(19),  
	AA_NUMBER				VARCHAR(35),
	LOS_AA_NUMBER			VARCHAR(35),
	LIMIT_ID				VARCHAR(43),
	APPROVED_DATE			TIMESTAMP,
	APPLICATION_DATE		TIMESTAMP
) in CMS_MIG index in CMS_MIG_INDEX;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 6396 Records
select lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, lmt.APPROVED_DATE, lmt.APPLICATION_DATE 
from MIG_CO019_PL_TEMP lsm, MIG_CA003_1_TEMP lmt  
where lsm.LIMIT_ID = lmt.LIMIT_ID    
and lsm.APPLICATION_NO = lmt.AA_NUMBER 
and lmt.APPROVED_DATE < lmt.APPLICATION_DATE 
and lmt.APPROVED_DATE is not null  
and lmt.APPLICATION_DATE is not null 
and lsm.APPLICATION_TYPE = 'HP';

-- 6396 Records
select count(*) from PATCH_APPLICATION_DATE_HP pth, cms_facility_master facmas, cms_fac_general facgen
where pth.CMS_LSP_APPR_LMTS_ID = facmas.CMS_LSP_APPR_LMTS_ID
and facmas.ID = facgen.CMS_FAC_MASTER_ID;

-- 6396 Records
select count(*) from PATCH_APPLICATION_DATE_HP pth, cms_stg_facility_master facmas, cms_stg_fac_general facgen
where pth.CMS_LSP_APPR_LMTS_ID = facmas.CMS_LSP_APPR_LMTS_ID
and facmas.ID = facgen.CMS_FAC_MASTER_ID;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Insert into temporary patching table
insert into PATCH_APPLICATION_DATE_HP (CIF_ID, AA_NUMBER, LOS_AA_NUMBER, LIMIT_ID, APPROVED_DATE, APPLICATION_DATE)
(select lmt.CIF_ID, lmt.AA_NUMBER, lmt.LOS_AA_NUMBER, lmt.LIMIT_ID, lmt.APPROVED_DATE, lmt.APPLICATION_DATE 
	from MIG_CO019_PL_TEMP lsm, MIG_CA003_1_TEMP lmt  
	where lsm.LIMIT_ID = lmt.LIMIT_ID    
	and lsm.APPLICATION_NO = lmt.AA_NUMBER 
	and lmt.APPROVED_DATE < lmt.APPLICATION_DATE 
	and lmt.APPROVED_DATE is not null  
	and lmt.APPLICATION_DATE is not null 
	and lsm.APPLICATION_TYPE = 'HP');

-- Update primary key for limit tables
update PATCH_APPLICATION_DATE_HP pth
set CMS_LSP_APPR_LMTS_ID = (select CMS_LSP_APPR_LMTS_ID from SCI_LSP_APPR_LMTS lmt
                            where lmt.LMT_LE_ID = pth.CIF_ID
                            and lmt.LMT_BCA_REF_NUM = pth.AA_NUMBER
                            and lmt.LMT_ID = pth.LIMIT_ID)
where exists (select 1 from SCI_LSP_APPR_LMTS lmt
                where lmt.LMT_LE_ID = pth.CIF_ID
                and lmt.LMT_BCA_REF_NUM = pth.AA_NUMBER
                and lmt.LMT_ID = pth.LIMIT_ID fetch first row only);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Update actual table 
update cms_fac_general facgen
set APPLICATION_DATE = (select pth.APPROVED_DATE
                        from PATCH_APPLICATION_DATE_HP pth, CMS_FACILITY_MASTER facmas 
                        where pth.CMS_LSP_APPR_LMTS_ID = facmas.CMS_LSP_APPR_LMTS_ID
                        and facmas.ID = facgen.CMS_FAC_MASTER_ID)
where exists (select 1 from PATCH_APPLICATION_DATE_HP pth1, CMS_FACILITY_MASTER facmas1
                where pth1.CMS_LSP_APPR_LMTS_ID = facmas1.CMS_LSP_APPR_LMTS_ID
                and facmas1.ID = facgen.CMS_FAC_MASTER_ID);

-- Update staging table
update cms_stg_fac_general facgen
set APPLICATION_DATE = (select pth.APPROVED_DATE
                        from PATCH_APPLICATION_DATE_HP pth, CMS_STG_FACILITY_MASTER facmas
                        where pth.CMS_LSP_APPR_LMTS_ID = facmas.CMS_LSP_APPR_LMTS_ID
                        and facmas.ID = facgen.CMS_FAC_MASTER_ID)
where exists (select 1 from PATCH_APPLICATION_DATE_HP pth1, CMS_STG_FACILITY_MASTER facmas1
                where pth1.CMS_LSP_APPR_LMTS_ID = facmas1.CMS_LSP_APPR_LMTS_ID
                and facmas1.ID = facgen.CMS_FAC_MASTER_ID);
