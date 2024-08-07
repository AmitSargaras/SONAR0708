/* Patching to soft delete the pledge from cms since SIL make a mistake when pulling the records 
resulting collateral become shared collateral while it wasnt in actual case */

DROP TABLE PATCH_REMOVE_PLEDGED;

CREATE TABLE PATCH_REMOVE_PLEDGED (
	SECURITY_ID			VARCHAR(20),
	LIMIT_ID			VARCHAR(40),
	CMS_ACT_COL_ID		BIGINT,
	CMS_STG_COL_ID		BIGINT,
	CMS_LIMIT_ID		BIGINT
) in CMS_MIG index in CMS_MIG_INDEX;



CREATE INDEX IDX_PATCH_01 ON "CMS_LIMIT_SECURITY_MAP" 
("SECURITY_ID" ASC, "LIMIT_ID" ASC) 
ALLOW REVERSE SCANS ; 

CREATE INDEX IDX_PATCH_02 ON "CMS_STAGE_LIMIT_SECURITY_MAP" 
("CMS_COLLATERAL_ID" ASC, "CMS_LSP_APPR_LMTS_ID" DESC) 
ALLOW REVERSE SCANS ; 

CREATE INDEX IDX_PATCH_03 ON "PATCH_REMOVE_PLEDGED" 
("CMS_LIMIT_ID" ASC, "CMS_STG_COL_ID" ASC, "CMS_ACT_COL_ID" ASC) 
ALLOW REVERSE SCANS ; 

drop INDEX IDX_PATCH_01;
drop INDEX IDX_PATCH_02;
drop INDEX IDX_PATCH_03;

--------------------------------------------------------------------------------------------------------------------
="insert into PATCH_REMOVE_PLEDGED (SECURITY_ID, LIMIT_ID) values ('"&trim(B1)&"', '"&trim(C1)&"');"

--------------------------------------------------------------------------------------------------------------------
-- Update collateral id and limit id for actual table
update PATCH_REMOVE_PLEDGED pth
set (CMS_ACT_COL_ID, CMS_LIMIT_ID) = (select lsm.CMS_COLLATERAL_ID, lsm.CMS_LSP_APPR_LMTS_ID FROM CMS_LIMIT_SECURITY_MAP lsm
										where pth.SECURITY_ID = lsm.SECURITY_ID
										and pth.LIMIT_ID = lsm.LIMIT_ID)
where exists (select 1 FROM CMS_LIMIT_SECURITY_MAP lsm1
				where pth.SECURITY_ID = lsm1.SECURITY_ID
				and pth.LIMIT_ID = lsm1.LIMIT_ID);

-- Update collateral id and limit id for staging table
update PATCH_REMOVE_PLEDGED pth
set (CMS_STG_COL_ID) = (select lsm.CMS_COLLATERAL_ID FROM transaction trx, CMS_STAGE_LIMIT_SECURITY_MAP lsm
						where pth.CMS_LIMIT_ID = lsm.CMS_LSP_APPR_LMTS_ID
						and pth.CMS_ACT_COL_ID = trx.reference_id
						and trx.transaction_type = 'COL'
						and trx.staging_reference_id = lsm.CMS_COLLATERAL_ID)
where exists (select 1 FROM transaction trx1, CMS_STAGE_LIMIT_SECURITY_MAP lsm1
				where pth.CMS_LIMIT_ID = lsm1.CMS_LSP_APPR_LMTS_ID
				and pth.CMS_ACT_COL_ID = trx1.reference_id
				and trx1.transaction_type = 'COL'
				and trx1.staging_reference_id = lsm1.CMS_COLLATERAL_ID);
				
--------------------------------------------------------------------------------------------------------------------	
create table CMS_LIMIT_SECURITY_MAP_REM_TEMP like CMS_LIMIT_SECURITY_MAP;
insert into CMS_LIMIT_SECURITY_MAP_REM_TEMP (select * from CMS_LIMIT_SECURITY_MAP lsm
											where exists (select 1 from PATCH_REMOVE_PLEDGED pth
															where pth.CMS_ACT_COL_ID = lsm.CMS_COLLATERAL_ID
															and pth.CMS_LIMIT_ID = lsm.CMS_LSP_APPR_LMTS_ID
															and pth.SECURITY_ID = lsm.SECURITY_ID
															and pth.LIMIT_ID = lsm.LIMIT_ID
															and pth.CMS_LIMIT_ID is not null));

--------------------------------------------------------------------------------------------------------------------			
-- Soft delete limit security map actual table				
/* update CMS_LIMIT_SECURITY_MAP lsm
set UPDATE_STATUS_IND = 'D'
where exists (select 1 from PATCH_REMOVE_PLEDGED pth
				where pth.CMS_ACT_COL_ID = lsm.CMS_COLLATERAL_ID
				and pth.CMS_LIMIT_ID = lsm.CMS_LSP_APPR_LMTS_ID
				and pth.SECURITY_ID = lsm.SECURITY_ID
				and pth.LIMIT_ID = lsm.LIMIT_ID
				and pth.CMS_LIMIT_ID is not null); */

-- Hard delete 				
delete from CMS_LIMIT_SECURITY_MAP lsm where exists (select 1 from PATCH_REMOVE_PLEDGED pth
														where pth.CMS_ACT_COL_ID = lsm.CMS_COLLATERAL_ID
														and pth.CMS_LIMIT_ID = lsm.CMS_LSP_APPR_LMTS_ID
														and pth.SECURITY_ID = lsm.SECURITY_ID
														and pth.LIMIT_ID = lsm.LIMIT_ID
														and pth.CMS_LIMIT_ID is not null);			

update CMS_STAGE_LIMIT_SECURITY_MAP lsm
set UPDATE_STATUS_IND = 'D'
where exists (select 1 from PATCH_REMOVE_PLEDGED pth
				where pth.CMS_STG_COL_ID = lsm.CMS_COLLATERAL_ID
				and pth.CMS_LIMIT_ID = lsm.CMS_LSP_APPR_LMTS_ID
				and pth.CMS_LIMIT_ID is not null);



