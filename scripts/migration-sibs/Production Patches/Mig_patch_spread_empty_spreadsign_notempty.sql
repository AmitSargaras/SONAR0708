/* Patch facility interest for those spread sign had values but spread is empty or null */

-- 3880
select COUNT(*) from CMS_FAC_INTEREST
where SPREAD_SIGN is not null
and (spread = 0 or spread is null);

-- 3885
select COUNT(*) from CMS_STG_FAC_INTEREST
where SPREAD_SIGN is not null
and (spread = 0 or spread is null);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

update CMS_FAC_INTEREST facint
set SPREAD_SIGN = null
where exists (select 1 from CMS_FAC_INTEREST facint1
                where facint1.CMS_FAC_MASTER_ID = facint.CMS_FAC_MASTER_ID
                and facint1.SPREAD_SIGN is not null
                and (facint1.spread = 0 or facint1.spread is null));
				
update CMS_STG_FAC_INTEREST facint
set SPREAD_SIGN = null
where exists (select 1 from CMS_STG_FAC_INTEREST facint1
                where facint1.CMS_FAC_MASTER_ID = facint.CMS_FAC_MASTER_ID
                and facint1.SPREAD_SIGN is not null
                and (facint1.spread = 0 or facint1.spread is null));	