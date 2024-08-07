/* Patch pledge amount = 0 where both pledge amount and pledge percentage was exist for HP cases */

drop table CMS_LIMIT_SECURITY_MAP_TEMP;
drop table CMS_STAGE_LIMIT_SECURITY_MAP_TEMP;

create table CMS_LIMIT_SECURITY_MAP_TEMP like CMS_LIMIT_SECURITY_MAP;
create table CMS_STAGE_LIMIT_SECURITY_MAP_TEMP like CMS_STAGE_LIMIT_SECURITY_MAP;

insert into CMS_LIMIT_SECURITY_MAP_TEMP (select * from CMS_LIMIT_SECURITY_MAP);
insert into CMS_STAGE_LIMIT_SECURITY_MAP_TEMP (select * from CMS_STAGE_LIMIT_SECURITY_MAP);

----------------------------------------------------------------------------------------------------------------------------------------------------
-- View count of Pledgor with both pledge amount and pledge percent
-- 623
select count(*) from MIG_CO019_PL_TEMP pl 
where (pl.AMOUNT_PLEDGED > 0 and pl.PERCENT_PLEDGED > 0)
and pl.APPLICATION_TYPE = 'HP';

----------------------------------------------------------------------------------------------------------------------------------------------------
-- Update  actual limit security map pledge amount = 0 when both values found
update CMS_LIMIT_SECURITY_MAP lsm
set lsm.PLEDGE_AMOUNT = 0
where exists (select 1 from MIG_CO019_PL_TEMP pl 
                where lsm.SCI_LAS_SEC_ID = pl.SECURITY_ID
                and (pl.AMOUNT_PLEDGED > 0 and pl.PERCENT_PLEDGED > 0)
                and pl.APPLICATION_TYPE = 'HP');

-- Update staging limit security map pledge amount = 0 when both values found				
update CMS_STAGE_LIMIT_SECURITY_MAP lsm
set lsm.PLEDGE_AMOUNT = 0
where exists (select 1 from MIG_CO019_PL_TEMP pl 
                where lsm.SCI_LAS_SEC_ID = pl.SECURITY_ID
                and (pl.AMOUNT_PLEDGED > 0 and pl.PERCENT_PLEDGED > 0)
                and pl.APPLICATION_TYPE = 'HP');				
				
-- Update pledge temporary table				
UPDATE MIG_CO019_PL_TEMP T 
SET AMOUNT_PLEDGED = 0
WHERE EXISTS (select 1 from MIG_CO019_PL_TEMP pl  
				where T.SECURITY_ID = pl.SECURITY_ID
				and T.LIMIT_ID = pl.LIMIT_ID
				and (pl.AMOUNT_PLEDGED > 0 and pl.PERCENT_PLEDGED > 0)
				and pl.APPLICATION_TYPE = 'HP');				