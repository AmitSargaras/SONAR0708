drop table SCI_PLEDGOR_DTL_TEMP;
drop table STAGE_PLEDGOR_DTL_TEMP;
drop table SCI_SEC_PLDGR_MAP_TEMP;
drop table STAGE_SEC_PLDGR_MAP_TEMP;

drop table SCI_PLEDGOR_DTL_MAX_PLDGR_TEMP;
drop table STAGE_PLEDGOR_DTL_MAX_PLDGR_TEMP;

drop table SCI_PLEDGOR_DTL_DEL_TEMP;
drop table STAGE_PLEDGOR_DTL_DEL_TEMP;
drop table SCI_SEC_PLDGR_MAP_DEL_TEMP;
drop table STAGE_SEC_PLDGR_MAP_DEL_TEMP;

create table SCI_PLEDGOR_DTL_TEMP like SCI_PLEDGOR_DTL;
create table STAGE_PLEDGOR_DTL_TEMP like STAGE_PLEDGOR_DTL;
create table SCI_SEC_PLDGR_MAP_TEMP like SCI_SEC_PLDGR_MAP;
create table STAGE_SEC_PLDGR_MAP_TEMP like STAGE_SEC_PLDGR_MAP;

insert into SCI_PLEDGOR_DTL_TEMP (select * from SCI_PLEDGOR_DTL);
insert into STAGE_PLEDGOR_DTL_TEMP (select * from STAGE_PLEDGOR_DTL);
insert into SCI_SEC_PLDGR_MAP_TEMP (select * from SCI_SEC_PLDGR_MAP);
insert into STAGE_SEC_PLDGR_MAP_TEMP (select * from STAGE_SEC_PLDGR_MAP);

---------------------------------------------------------------------------------------------------------------------
-- Attemp to remove duplicate pledgor where source id = SIBS  and RLOS. SMF remains
-- Select count pledgor actual table where data flow from migration/rlos to be patched
-- count = 1999
select count(*) from SCI_PLEDGOR_DTL plg2 where plg2.PLG_LE_ID in(
    select plg1.PLG_LE_ID from SCI_PLEDGOR_DTL plg1 
    where plg1.PLG_LE_ID in (select plg.PLG_LE_ID from SCI_PLEDGOR_DTL plg
                                        where plg.source_id = 'SMF'
										and plg.UPDATE_STATUS_IND <> 'D')
    group by plg1.PLG_LE_ID
    having count(plg1.PLG_LE_ID) > 1)
and plg2.source_id in ('SIBS', 'RLOS');

-- Select count pledgor staging table where data flow from migration/rlos to be patched
-- count = 544
select count(*) from STAGE_PLEDGOR_DTL plg2 where plg2.PLG_LE_ID in(
    select plg1.PLG_LE_ID from STAGE_PLEDGOR_DTL plg1 
    where plg1.PLG_LE_ID in (select plg.PLG_LE_ID from STAGE_PLEDGOR_DTL plg
                                        where plg.source_id = 'SMF'
										and plg.UPDATE_STATUS_IND <> 'D')
    group by plg1.PLG_LE_ID
    having count(plg1.PLG_LE_ID) > 1)
and plg2.source_id in ('SIBS', 'RLOS');

-- Select count pledgor security map  actual table where data flow from migration/rlos to be patched
-- count = 2208
select count(*) from SCI_SEC_PLDGR_MAP spm2 where spm2.CMS_PLEDGOR_DTL_ID in(
    select plg2.CMS_PLEDGOR_DTL_ID from SCI_PLEDGOR_DTL plg2 where plg2.PLG_LE_ID in(
        select plg1.PLG_LE_ID from SCI_PLEDGOR_DTL plg1 
        where plg1.PLG_LE_ID in (select plg.PLG_LE_ID from SCI_PLEDGOR_DTL plg
                                            where plg.source_id = 'SMF'
                                            and plg.UPDATE_STATUS_IND <> 'D')
        group by plg1.PLG_LE_ID
        having count(plg1.PLG_LE_ID) > 1)
    and plg2.source_id in ('SIBS', 'RLOS'))
and spm2.SOURCE_ID in ('SIBS', 'RLOS');

-- Select count pledgor security map  staging table where data flow from migration/rlos to be patched
-- count = 743
select count(*) from STAGE_SEC_PLDGR_MAP spm2 where spm2.CMS_PLEDGOR_DTL_ID in(
    select plg2.CMS_PLEDGOR_DTL_ID from STAGE_PLEDGOR_DTL plg2 where plg2.PLG_LE_ID in(
        select plg1.PLG_LE_ID from STAGE_PLEDGOR_DTL plg1 
        where plg1.PLG_LE_ID in (select plg.PLG_LE_ID from STAGE_PLEDGOR_DTL plg
                                            where plg.source_id = 'SMF'
                                            and plg.UPDATE_STATUS_IND <> 'D')
        group by plg1.PLG_LE_ID
        having count(plg1.PLG_LE_ID) > 1)
    and plg2.source_id in ('SIBS', 'RLOS'))
and spm2.SOURCE_ID in ('SIBS', 'RLOS');


-- Select record not to be deleted where source id = SIBS for pledgor actual table
-- 79173
select count(*) from (
	select max(CMS_PLEDGOR_DTL_ID), PLG_LE_ID, SOURCE_ID from SCI_PLEDGOR_DTL plg1 
	where plg1.PLG_LE_ID in (
	    select plg.PLG_LE_ID from SCI_PLEDGOR_DTL plg
	    where source_id = 'SIBS'
	    group by plg.PLG_LE_ID
	    having count(plg.PLG_LE_ID) > 1)
	group by PLG_LE_ID, SOURCE_ID) as temp; 

-- Select record not to be deleted where source id = SIBS for pledgor staging table
-- 78983
select count(*) from (
	select max(CMS_PLEDGOR_DTL_ID), PLG_LE_ID, SOURCE_ID from STAGE_PLEDGOR_DTL plg1 
	where plg1.PLG_LE_ID in (
	    select plg.PLG_LE_ID from STAGE_PLEDGOR_DTL plg
	    where source_id = 'SIBS'
	    group by plg.PLG_LE_ID
	    having count(plg.PLG_LE_ID) > 1)
	group by PLG_LE_ID, SOURCE_ID) as temp; 

-- List to be deleted
-- 168482 
select count(*) from SCI_PLEDGOR_DTL plg1 
where plg1.PLG_LE_ID in (
    select plg.PLG_LE_ID from SCI_PLEDGOR_DTL plg
    where plg1.source_id = 'SIBS'
    group by plg.PLG_LE_ID
    having count(plg.PLG_LE_ID) > 1)
and not exists (select 1 from SCI_PLEDGOR_DTL_MAX_PLDGR_TEMP plgmax
				where plgmax.CMS_PLEDGOR_DTL_ID = plg1.CMS_PLEDGOR_DTL_ID)
and plg1.source_id = 'SIBS';
				
-- 168254				
select count(*) from STAGE_PLEDGOR_DTL plg1 
where plg1.PLG_LE_ID in (
    select plg.PLG_LE_ID from STAGE_PLEDGOR_DTL plg
    where source_id = 'SIBS'
    group by plg.PLG_LE_ID
    having count(plg.PLG_LE_ID) > 1)
and not exists (select 1 from STAGE_PLEDGOR_DTL_MAX_PLDGR_TEMP plgmax
				where plgmax.CMS_PLEDGOR_DTL_ID = plg1.CMS_PLEDGOR_DTL_ID)
and plg1.source_id = 'SIBS';				

---------------------------------------------------------------------------------------------------------------------
-- Delete duplicate pledgor and will only take SMF for piority
-- delete from STAGE_SEC_PLDGR_MAP spm2 where spm2.CMS_PLEDGOR_DTL_ID in(
    -- select plg2.CMS_PLEDGOR_DTL_ID from STAGE_PLEDGOR_DTL plg2 where plg2.PLG_LE_ID in(
        -- select plg1.PLG_LE_ID from STAGE_PLEDGOR_DTL plg1 
        -- where plg1.PLG_LE_ID in (select plg.PLG_LE_ID from STAGE_PLEDGOR_DTL plg
                                            -- where plg.source_id = 'SMF'
                                            -- and plg.UPDATE_STATUS_IND <> 'D')
        -- group by plg1.PLG_LE_ID
        -- having count(plg1.PLG_LE_ID) > 1)
    -- and plg2.source_id in ('SIBS', 'RLOS'))
-- and spm2.SOURCE_ID in ('SIBS', 'RLOS');

-- delete from SCI_SEC_PLDGR_MAP spm2 where spm2.CMS_PLEDGOR_DTL_ID in(
    -- select plg2.CMS_PLEDGOR_DTL_ID from SCI_PLEDGOR_DTL plg2 where plg2.PLG_LE_ID in(
        -- select plg1.PLG_LE_ID from SCI_PLEDGOR_DTL plg1 
        -- where plg1.PLG_LE_ID in (select plg.PLG_LE_ID from SCI_PLEDGOR_DTL plg
                                            -- where plg.source_id = 'SMF'
                                            -- and plg.UPDATE_STATUS_IND <> 'D')
        -- group by plg1.PLG_LE_ID
        -- having count(plg1.PLG_LE_ID) > 1)
    -- and plg2.source_id in ('SIBS', 'RLOS'))
-- and spm2.SOURCE_ID in ('SIBS', 'RLOS');

-- delete from STAGE_PLEDGOR_DTL plg2 where plg2.PLG_LE_ID in(
    -- select plg1.PLG_LE_ID from STAGE_PLEDGOR_DTL plg1 
    -- where plg1.PLG_LE_ID in (select plg.PLG_LE_ID from STAGE_PLEDGOR_DTL plg
                                        -- where plg.source_id = 'SMF'
										-- and plg.UPDATE_STATUS_IND <> 'D')
    -- group by plg1.PLG_LE_ID
    -- having count(plg1.PLG_LE_ID) > 1)
-- and plg2.source_id in ('SIBS', 'RLOS');

-- delete from SCI_PLEDGOR_DTL plg2 where plg2.PLG_LE_ID in(
    -- select plg1.PLG_LE_ID from SCI_PLEDGOR_DTL plg1 
    -- where plg1.PLG_LE_ID in (select plg.PLG_LE_ID from SCI_PLEDGOR_DTL plg
                                        -- where plg.source_id = 'SMF'
										-- and plg.UPDATE_STATUS_IND <> 'D')
    -- group by plg1.PLG_LE_ID
    -- having count(plg1.PLG_LE_ID) > 1)
-- and plg2.source_id in ('SIBS', 'RLOS');


-- Create the temporary table storing the values that must be keeped
create table SCI_PLEDGOR_DTL_MAX_PLDGR_TEMP (
    CMS_PLEDGOR_DTL_ID BIGINT,
    PLG_LE_ID VARCHAR(20),
    SOURCE_ID VARCHAR(10),
);

create table STAGE_PLEDGOR_DTL_MAX_PLDGR_TEMP (
    CMS_PLEDGOR_DTL_ID BIGINT,
    PLG_LE_ID VARCHAR(20),
    SOURCE_ID VARCHAR(10),
);

-- List to be deleted
create table SCI_PLEDGOR_DTL_DEL_TEMP (
	CMS_PLEDGOR_DTL_ID BIGINT
);

create table STAGE_PLEDGOR_DTL_DEL_TEMP (
	CMS_PLEDGOR_DTL_ID BIGINT
);

create table SCI_SEC_PLDGR_MAP_DEL_TEMP (
	CMS_SEC_PLDGR_MAP_ID BIGINT
);

create table STAGE_SEC_PLDGR_MAP_DEL_TEMP (
	CMS_SEC_PLDGR_MAP_ID BIGINT
);

-- Insert into  the temporary table
-- 79173
insert into SCI_PLEDGOR_DTL_MAX_PLDGR_TEMP (select max(plg1.CMS_PLEDGOR_DTL_ID), plg1.PLG_LE_ID, spm1.SOURCE_ID, count(*) from SCI_PLEDGOR_DTL plg1, SCI_SEC_PLDGR_MAP spm1 
											where plg1.PLG_LE_ID in (
											    select plg.PLG_LE_ID from SCI_PLEDGOR_DTL plg, SCI_SEC_PLDGR_MAP spm
											    where plg.CMS_PLEDGOR_DTL_ID = spm.CMS_PLEDGOR_DTL_ID
                                                and plg.source_id = 'SIBS'
                                                and spm.UPDATE_STATUS_IND is null
											    group by plg.PLG_LE_ID, spm.CMS_COLLATERAL_ID
											    having count(plg.PLG_LE_ID) > 1)
                                            and plg1.CMS_PLEDGOR_DTL_ID = spm1.CMS_PLEDGOR_DTL_ID
                                            and spm1.source_id = 'SIBS'
											group by plg1.PLG_LE_ID, spm1.CMS_COLLATERAL_ID, spm1.SOURCE_ID
											having count(*) > 1);
					
-- 78982					
insert into STAGE_PLEDGOR_DTL_MAX_PLDGR_TEMP (select max(plg1.CMS_PLEDGOR_DTL_ID), plg1.PLG_LE_ID, spm1.SOURCE_ID, count(*) from STAGE_PLEDGOR_DTL plg1, STAGE_SEC_PLDGR_MAP spm1 
												where plg1.PLG_LE_ID in (
												    select plg.PLG_LE_ID from STAGE_PLEDGOR_DTL plg, STAGE_SEC_PLDGR_MAP spm
												    where plg.CMS_PLEDGOR_DTL_ID = spm.CMS_PLEDGOR_DTL_ID
	                                                and plg.source_id = 'SIBS'
	                                                and spm.UPDATE_STATUS_IND is null
												    group by plg.PLG_LE_ID, spm.CMS_COLLATERAL_ID
												    having count(plg.PLG_LE_ID) > 1)
	                                            and plg1.CMS_PLEDGOR_DTL_ID = spm1.CMS_PLEDGOR_DTL_ID
	                                            and spm1.source_id = 'SIBS'
												group by plg1.PLG_LE_ID, spm1.CMS_COLLATERAL_ID, spm1.SOURCE_ID
												having count(*) > 1);		
												
select min(CMS_SEC_PLDGR_MAP_ID), spm.CMS_PLEDGOR_DTL_ID, spm.CMS_COLLATERAL_ID from SCI_SEC_PLDGR_MAP spm
where exists (select 1 from SCI_PLEDGOR_DTL_MAX_PLDGR_TEMP temp
                where spm.CMS_PLEDGOR_DTL_ID = temp.CMS_PLEDGOR_DTL_ID)
and spm.SOURCE_ID = 'SIBS'
and spm.UPDATE_STATUS_IND is null
group by spm.CMS_PLEDGOR_DTL_ID, spm.CMS_COLLATERAL_ID, spm.SOURCE_ID
having count (spm.CMS_COLLATERAL_ID) > 1;			

select min(CMS_SEC_PLDGR_MAP_ID), spm.CMS_PLEDGOR_DTL_ID, spm.CMS_COLLATERAL_ID from STAGE_SEC_PLDGR_MAP spm
where exists (select 1 from STAGE_PLEDGOR_DTL_MAX_PLDGR_TEMP temp
                where spm.CMS_PLEDGOR_DTL_ID = temp.CMS_PLEDGOR_DTL_ID)
and spm.SOURCE_ID = 'SIBS'
and spm.UPDATE_STATUS_IND is null
group by spm.CMS_PLEDGOR_DTL_ID, spm.CMS_COLLATERAL_ID, spm.SOURCE_ID
having count (spm.CMS_COLLATERAL_ID) > 1;									

-- Delete the pledgor sec map where source_id = SIBS			
insert into SCI_SEC_PLDGR_MAP_DEL_TEMP (								
select CMS_SEC_PLDGR_MAP_ID from SCI_SEC_PLDGR_MAP spm where spm.CMS_PLEDGOR_DTL_ID in
    (select plg1.CMS_PLEDGOR_DTL_ID from SCI_PLEDGOR_DTL plg1 
        where plg1.PLG_LE_ID in (
            select plg.PLG_LE_ID from SCI_PLEDGOR_DTL plg
            where source_id = 'SIBS'
            group by plg.PLG_LE_ID
            having count(plg.PLG_LE_ID) > 1)
    and not exists (select 1 from SCI_PLEDGOR_DTL_MAX_PLDGR_TEMP plgmax
                    where plgmax.CMS_PLEDGOR_DTL_ID = plg1.CMS_PLEDGOR_DTL_ID))
and spm.source_id = 'SIBS');						

insert into STAGE_SEC_PLDGR_MAP_DEL_TEMP (	
select CMS_SEC_PLDGR_MAP_ID from STAGE_SEC_PLDGR_MAP spm where spm.CMS_PLEDGOR_DTL_ID in
    (select plg1.CMS_PLEDGOR_DTL_ID from STAGE_PLEDGOR_DTL plg1 
        where plg1.PLG_LE_ID in (
            select plg.PLG_LE_ID from STAGE_PLEDGOR_DTL plg
            where plg.source_id = 'SIBS'
            group by plg.PLG_LE_ID
            having count(plg.PLG_LE_ID) > 1)
    and not exists (select 1 from STAGE_PLEDGOR_DTL_MAX_PLDGR_TEMP plgmax
                    where plgmax.CMS_PLEDGOR_DTL_ID = plg1.CMS_PLEDGOR_DTL_ID))
and spm.source_id = 'SIBS');					
											
-- Delete the pledgor where source id = SIBS 			
insert into SCI_PLEDGOR_DTL_DEL_TEMP (								
select CMS_PLEDGOR_DTL_ID from SCI_PLEDGOR_DTL plg1 
where plg1.PLG_LE_ID in (
    select plg.PLG_LE_ID from SCI_PLEDGOR_DTL plg
    where plg.source_id = 'SIBS'
    group by plg.PLG_LE_ID
    having count(plg.PLG_LE_ID) > 1)
and not exists (select 1 from SCI_PLEDGOR_DTL_MAX_PLDGR_TEMP plgmax
				where plgmax.CMS_PLEDGOR_DTL_ID = plg1.CMS_PLEDGOR_DTL_ID)
and plg1.source_id = 'SIBS');				

insert into STAGE_PLEDGOR_DTL_DEL_TEMP (
select CMS_PLEDGOR_DTL_ID from STAGE_PLEDGOR_DTL plg1 
where plg1.PLG_LE_ID in (
    select plg.PLG_LE_ID from STAGE_PLEDGOR_DTL plg
    where plg.source_id = 'SIBS'
    group by plg.PLG_LE_ID
    having count(plg.PLG_LE_ID) > 1)
and not exists (select 1 from STAGE_PLEDGOR_DTL_MAX_PLDGR_TEMP plgmax
				where plgmax.CMS_PLEDGOR_DTL_ID = plg1.CMS_PLEDGOR_DTL_ID)
and plg1.source_id = 'SIBS');				


delete from STAGE_SEC_PLDGR_MAP spm
where exists (select 1 from STAGE_SEC_PLDGR_MAP_DEL_TEMP spmtmp
                where spm.CMS_SEC_PLDGR_MAP_ID = spmtmp.CMS_SEC_PLDGR_MAP_ID);

delete from SCI_SEC_PLDGR_MAP spm
where exists (select 1 from SCI_SEC_PLDGR_MAP_DEL_TEMP spmtmp
                where spm.CMS_SEC_PLDGR_MAP_ID = spmtmp.CMS_SEC_PLDGR_MAP_ID);

delete from STAGE_PLEDGOR_DTL plg
where exists (select 1 from STAGE_PLEDGOR_DTL_DEL_TEMP plgtmp
                where plg.CMS_PLEDGOR_DTL_ID = plgtmp.CMS_PLEDGOR_DTL_ID);

delete from SCI_PLEDGOR_DTL plg
where exists (select 1 from SCI_PLEDGOR_DTL_DEL_TEMP plgtmp
                where plg.CMS_PLEDGOR_DTL_ID = plgtmp.CMS_PLEDGOR_DTL_ID);
