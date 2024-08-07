/* Patches to fix staging table reference id on charge detail */

-- Multiple charges
select lcm.CMS_COLLATERAL_ID, lcm.CMS_LSP_APPR_LMTS_ID
from CMS_CHARGE_DETAIL chrg1, TRANSACTION trx1, CMS_STAGE_CHARGE_DETAIL stgchrg, CMS_LIMIT_CHARGE_MAP lcm
                    where chrg1.CMS_COLLATERAL_ID = trx1.REFERENCE_ID
                    and trx1.STAGING_REFERENCE_ID = stgchrg.CMS_COLLATERAL_ID
                    and trx1.TRANSACTION_TYPE = 'COL'
                    and lcm.CMS_COLLATERAL_ID = chrg1.CMS_COLLATERAL_ID
                    and stgchrg.CMS_REF_ID <> chrg1.CMS_REF_ID
and char(stgchrg.CHARGE_DETAIL_ID) like '200908091%'
group by lcm.CMS_COLLATERAL_ID, lcm.CMS_LSP_APPR_LMTS_ID
having count(lcm.CMS_COLLATERAL_ID) > 1;

select lcm.CMS_COLLATERAL_ID, lcm.CMS_LSP_APPR_LMTS_ID
from CMS_CHARGE_DETAIL chrg1, TRANSACTION trx1, CMS_STAGE_CHARGE_DETAIL stgchrg, CMS_LIMIT_CHARGE_MAP lcm
                    where chrg1.CMS_COLLATERAL_ID = trx1.REFERENCE_ID
                    and trx1.STAGING_REFERENCE_ID = stgchrg.CMS_COLLATERAL_ID
                    and trx1.TRANSACTION_TYPE = 'COL'
                    and lcm.CMS_COLLATERAL_ID = chrg1.CMS_COLLATERAL_ID
                    and stgchrg.CMS_REF_ID <> chrg1.CMS_REF_ID
and char(stgchrg.CHARGE_DETAIL_ID) like '200908091%'
group by lcm.CMS_COLLATERAL_ID, lcm.CMS_LSP_APPR_LMTS_ID
having count(lcm.CMS_COLLATERAL_ID) = 1;

----------------------------------------------------------------------------------------------------------------------------
DROP TABLE PATCH_CMS_CHARGE_DETAIL;

CREATE TABLE PATCH_CMS_CHARGE_DETAIL (
	CMS_LIMIT_ID			BIGINT,
	CMS_ACT_COL_ID			BIGINT,
	CMS_STG_COL_ID			BIGINT,
	CMS_ACT_CHARGE_DTL		BIGINT,
	CMS_STG_CHARGE_DTL		BIGINT,
	CMS_ACT_REF_ID			BIGINT,
	CMS_STG_REF_ID			BIGINT
) in CMS_MIG index in CMS_MIG_INDEX;

create index IDX_PATCH_01 ON PATCH_CMS_CHARGE_DETAIL (CMS_ACT_CHARGE_DTL asc, CMS_ACT_COL_ID asc) ALLOW REVERSE SCANS;

CREATE INDEX IDX_PATCH_02 ON "CMS_CHARGE_DETAIL" 
("STATUS" ASC, "CMS_COLLATERAL_ID" ASC, "CMS_REF_ID" ASC, "CHARGE_DETAIL_ID" ASC) 
ALLOW REVERSE SCANS; 

CREATE INDEX IDX_PATCH_03 ON "PATCH_CMS_CHARGE_DETAIL" 
("CMS_STG_CHARGE_DTL" ASC, "CMS_STG_COL_ID" ASC, "CMS_LIMIT_ID" ASC, "CMS_STG_REF_ID" ASC) 
ALLOW REVERSE SCANS ; 
;
CREATE INDEX IDX_PATCH_04 ON "CMS_STAGE_CHARGE_DETAIL" 
("CMS_COLLATERAL_ID" ASC, "CHARGE_DETAIL_ID" ASC) 
ALLOW REVERSE SCANS ; 
;
CREATE INDEX IDX_PATCH_05 ON "PATCH_CMS_CHARGE_DETAIL" 
("CMS_STG_COL_ID" ASC, "CMS_STG_CHARGE_DTL" DESC) 
ALLOW REVERSE SCANS ; 
;
CREATE INDEX IDX_PATCH_06 ON "CMS_STAGE_LIMIT_CHARGE_MAP" 
("CMS_COLLATERAL_ID" ASC) 
ALLOW REVERSE SCANS ; 

CREATE UNIQUE INDEX IDX_PATCH_07 ON "CMS_STAGE_CHARGE_DETAIL" 
("CHARGE_DETAIL_ID" ASC) 
INCLUDE ( "CMS_COLLATERAL_ID", "CMS_REF_ID") 
ALLOW REVERSE SCANS ; 

drop index IDX_PATCH_01;
drop index IDX_PATCH_02;
drop index IDX_PATCH_03;
drop index IDX_PATCH_04;
drop index IDX_PATCH_05;
drop index IDX_PATCH_06;
drop index IDX_PATCH_07;

----------------------------------------------------------------------------------------------------------------------------
-- Insert all from limit charge map
insert into PATCH_CMS_CHARGE_DETAIL (CMS_LIMIT_ID, CMS_ACT_COL_ID, CMS_ACT_CHARGE_DTL)
(select CMS_LSP_APPR_LMTS_ID, CMS_COLLATERAL_ID, CHARGE_DETAIL_ID from CMS_LIMIT_CHARGE_MAP
where status = 'ACTIVE');

-- Update staging table from staging limit charge map
update PATCH_CMS_CHARGE_DETAIL pth
set (CMS_STG_COL_ID, CMS_STG_CHARGE_DTL) = 
    (select stglcm.CMS_COLLATERAL_ID , stglcm.CHARGE_DETAIL_ID
        from CMS_STAGE_LIMIT_CHARGE_MAP stglcm, transaction trx
        where pth.CMS_ACT_COL_ID = trx.REFERENCE_ID
        and trx.TRANSACTION_TYPE = 'COL'
        and stglcm.CMS_COLLATERAL_ID = trx.STAGING_REFERENCE_ID
        and stglcm.CMS_LSP_APPR_LMTS_ID = pth.CMS_LIMIT_ID
        and stglcm.STATUS = 'ACTIVE' fetch first row only)
where exists (select 1 from CMS_STAGE_LIMIT_CHARGE_MAP stglcm1, transaction trx1
                where pth.CMS_ACT_COL_ID = trx1.REFERENCE_ID
                and trx1.TRANSACTION_TYPE = 'COL'
                and stglcm1.CMS_COLLATERAL_ID = trx1.STAGING_REFERENCE_ID
                and stglcm1.CMS_LSP_APPR_LMTS_ID = pth.CMS_LIMIT_ID
                and stglcm1.STATUS = 'ACTIVE');

-- Update cms reference id for actual table				
update PATCH_CMS_CHARGE_DETAIL pth
set CMS_ACT_REF_ID = (select chrg.CMS_REF_ID from CMS_CHARGE_DETAIL chrg
                        where chrg.CHARGE_DETAIL_ID = pth.CMS_ACT_CHARGE_DTL
                        and chrg.CMS_COLLATERAL_ID = pth.CMS_ACT_COL_ID
						and chrg.STATUS = 'ACTIVE')
where exists (select 1 from CMS_CHARGE_DETAIL chrg1
				where chrg1.CHARGE_DETAIL_ID = pth.CMS_ACT_CHARGE_DTL
				and chrg1.CMS_COLLATERAL_ID = pth.CMS_ACT_COL_ID
				and chrg1.STATUS = 'ACTIVE');

-- Update cms reference id for staging table
update PATCH_CMS_CHARGE_DETAIL pth
set CMS_STG_REF_ID = CMS_ACT_REF_ID;

----------------------------------------------------------------------------------------------------------------------------
-- Update staging table to correct the cms ref id
update CMS_STAGE_CHARGE_DETAIL stgchrg
set CMS_REF_ID = (select pth.CMS_STG_REF_ID from PATCH_CMS_CHARGE_DETAIL pth, CMS_STAGE_LIMIT_CHARGE_MAP stglcm 
                    where pth.CMS_LIMIT_ID = stglcm.CMS_LSP_APPR_LMTS_ID
                    and pth.CMS_STG_COL_ID = stglcm.CMS_COLLATERAL_ID
                    and stglcm.CHARGE_DETAIL_ID = stgchrg.CHARGE_DETAIL_ID
                    and stglcm.CMS_COLLATERAL_ID = stgchrg.CMS_COLLATERAL_ID
                    and pth.CMS_STG_CHARGE_DTL = stgchrg.CHARGE_DETAIL_ID
                    and pth.CMS_STG_COL_ID = stgchrg.CMS_COLLATERAL_ID
                    and char(stgchrg.CHARGE_DETAIL_ID) like '200908091%')
where exists (select 1 from PATCH_CMS_CHARGE_DETAIL pth1, CMS_STAGE_LIMIT_CHARGE_MAP stglcm1 
                    where pth1.CMS_LIMIT_ID = stglcm1.CMS_LSP_APPR_LMTS_ID
                    and pth1.CMS_STG_COL_ID = stglcm1.CMS_COLLATERAL_ID
                    and stglcm1.CHARGE_DETAIL_ID = stgchrg.CHARGE_DETAIL_ID
                    and stglcm1.CMS_COLLATERAL_ID = stgchrg.CMS_COLLATERAL_ID
                    and pth1.CMS_STG_CHARGE_DTL = stgchrg.CHARGE_DETAIL_ID
                    and pth1.CMS_STG_COL_ID = stgchrg.CMS_COLLATERAL_ID
                    and char(stgchrg.CHARGE_DETAIL_ID) like '200908091%');

