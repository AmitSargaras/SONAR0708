/* Patch missing pledgor into LNHCHR */

drop table CMS_LSM_1XM_TEMP;
drop table CMS_LSM_1XM_EXP_TEMP;
drop table CMS_LSM_1XM_EXP_FINAL_TEMP;
drop table CMS_LSM_MXM_TEMP;
drop table CMS_LSM_MXM_EXP_TEMP;
drop table CMS_LSM_1X1_TEMP;
drop table CMS_LSM_1X1_EXP_TEMP;
drop table CMS_LSM_1X1_MISS_EXP_TEMP;
drop table CMS_LSM_MX1_MISS_EXP_TEMP;

create table CMS_LSM_1XM_TEMP (
	SCI_LAS_SEC_ID VARCHAR (50),
	SCI_LAS_LE_ID VARCHAR (20)
);

create table CMS_LSM_1XM_EXP_TEMP (
	SCI_LAS_SEC_ID VARCHAR (50),
	SCI_LAS_LE_ID VARCHAR (20)
);

create table CMS_LSM_1XM_EXP_FINAL_TEMP (
	SCI_LAS_SEC_ID VARCHAR (50),
	SCI_LAS_LE_ID1 VARCHAR (20),
	SCI_LAS_LE_ID2 VARCHAR (20),
	SCI_LAS_LE_ID3 VARCHAR (20),
	SCI_LAS_LE_ID4 VARCHAR (20),
	SCI_LAS_LE_ID5 VARCHAR (20)
);

create table CMS_LSM_MXM_TEMP (
	SCI_LAS_SEC_ID VARCHAR (50),
	SCI_LAS_LE_ID VARCHAR (20)
);

create table CMS_LSM_MXM_EXP_TEMP (
	SCI_LAS_SEC_ID VARCHAR (50),
	SCI_LAS_LE_ID VARCHAR (20)
);

create table CMS_LSM_1X1_TEMP (
	SCI_LAS_SEC_ID VARCHAR (50),
	SCI_LAS_LE_ID VARCHAR (20)
);

create table CMS_LSM_1X1_EXP_TEMP (
	SCI_LAS_SEC_ID VARCHAR (50),
	SCI_LAS_LE_ID VARCHAR (20)
);

create table CMS_LSM_1X1_MISS_EXP_TEMP (
	SCI_LAS_SEC_ID VARCHAR (50),
	SCI_LAS_LE_ID VARCHAR (20)
);

create table CMS_LSM_MX1_MISS_EXP_TEMP (
	SCI_LAS_SEC_ID VARCHAR (50),
	SCI_LAS_LE_ID VARCHAR (20)
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1 Security multiple pledgor
insert into CMS_LSM_1XM_TEMP (SCI_LAS_SEC_ID, SCI_LAS_LE_ID) (
	select lsm1.SCI_LAS_SEC_ID, lsm1.SCI_LAS_LE_ID from CMS_LIMIT_SECURITY_MAP lsm1
	where lsm1.SCI_LAS_SEC_ID in (
	    select temp1.SCI_LAS_SEC_ID from (
	        select lsm.SCI_LAS_SEC_ID, lsm.SCI_LAS_LE_ID from CMS_LIMIT_SECURITY_MAP lsm
	            group by lsm.SCI_LAS_SEC_ID, SCI_LAS_LE_ID
	            having count(lsm.SCI_LAS_SEC_ID) > 1) temp1
	    group by temp1.SCI_LAS_SEC_ID
	    having count(*) > 1)
	order by lsm1.SCI_LAS_SEC_ID);
	
insert into CMS_LSM_1XM_EXP_TEMP (SCI_LAS_SEC_ID, SCI_LAS_LE_ID)
	(select sec.SCI_SECURITY_DTL_ID, plg.PLG_LE_ID from SCI_PLEDGOR_DTL plg, SCI_SEC_PLDGR_MAP spm, CMS_SECURITY sec
		where plg.CMS_PLEDGOR_DTL_ID = spm.CMS_PLEDGOR_DTL_ID
		and spm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
		and (char(plg.CMS_PLEDGOR_DTL_ID) like '20090801%' or char(plg.CMS_PLEDGOR_DTL_ID) like '20090808%' or char(plg.CMS_PLEDGOR_DTL_ID) like '200908091%')
		and sec.SCI_SECURITY_DTL_ID in (
		    select SCI_LAS_SEC_ID from CMS_LSM_1XM_TEMP
	) order by sec.SCI_SECURITY_DTL_ID);	
	
-- MxM duplicate pledgor	
insert into CMS_LSM_MXM_TEMP (SCI_LAS_SEC_ID, SCI_LAS_LE_ID) (
	select lsm1.SCI_LAS_SEC_ID, lsm1.SCI_LAS_LE_ID from CMS_LIMIT_SECURITY_MAP lsm1
	where lsm1.SCI_LAS_SEC_ID in (
	    select temp1.SCI_LAS_SEC_ID from (
	        select lsm.SCI_LAS_SEC_ID, lsm.SCI_LAS_LE_ID from CMS_LIMIT_SECURITY_MAP lsm
	            group by lsm.SCI_LAS_SEC_ID, SCI_LAS_LE_ID
	            having count(lsm.SCI_LAS_SEC_ID) > 1) temp1
	    group by temp1.SCI_LAS_SEC_ID
	    having count(*) = 1)
	order by lsm1.SCI_LAS_SEC_ID);	
	
insert into CMS_LSM_MXM_EXP_TEMP (SCI_LAS_SEC_ID, SCI_LAS_LE_ID)
	(select sec.SCI_SECURITY_DTL_ID, plg.PLG_LE_ID from SCI_PLEDGOR_DTL plg, SCI_SEC_PLDGR_MAP spm, CMS_SECURITY sec
		where plg.CMS_PLEDGOR_DTL_ID = spm.CMS_PLEDGOR_DTL_ID
		and spm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
		and (char(plg.CMS_PLEDGOR_DTL_ID) like '20090801%' or char(plg.CMS_PLEDGOR_DTL_ID) like '20090808%' or char(plg.CMS_PLEDGOR_DTL_ID) like '200908091%')
		and sec.SCI_SECURITY_DTL_ID in (
		    select SCI_LAS_SEC_ID from CMS_LSM_MXM_TEMP
	) order by sec.SCI_SECURITY_DTL_ID);		
	
-- 1x1 pledgor	
insert into CMS_LSM_1X1_TEMP (SCI_LAS_SEC_ID, SCI_LAS_LE_ID) (
    select lsm.SCI_LAS_SEC_ID, lsm.SCI_LAS_LE_ID from CMS_LIMIT_SECURITY_MAP lsm
    group by lsm.SCI_LAS_SEC_ID, SCI_LAS_LE_ID
    having count(lsm.SCI_LAS_SEC_ID) = 1 
    order by lsm.SCI_LAS_SEC_ID);		
	
insert into CMS_LSM_1X1_EXP_TEMP (SCI_LAS_SEC_ID, SCI_LAS_LE_ID)
	(select sec.SCI_SECURITY_DTL_ID, plg.PLG_LE_ID from SCI_PLEDGOR_DTL plg, SCI_SEC_PLDGR_MAP spm, CMS_SECURITY sec
		where plg.CMS_PLEDGOR_DTL_ID = spm.CMS_PLEDGOR_DTL_ID
		and spm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
		and (char(plg.CMS_PLEDGOR_DTL_ID) like '20090801%' or char(plg.CMS_PLEDGOR_DTL_ID) like '20090808%' or char(plg.CMS_PLEDGOR_DTL_ID) like '200908091%')
		and sec.SCI_SECURITY_DTL_ID in (
		    select SCI_LAS_SEC_ID from CMS_LSM_1X1_TEMP
	) order by sec.SCI_SECURITY_DTL_ID);	
	
	
insert into CMS_LSM_MX1_MISS_EXP_TEMP (SCI_LAS_SEC_ID, SCI_LAS_LE_ID)
(select spmmiss.SPM_SEC_ID, plgmiss.PLG_LE_ID from SCI_SEC_PLDGR_MAP spmmiss, SCI_PLEDGOR_DTL plgmiss
	where spmmiss.CMS_PLEDGOR_DTL_ID = plgmiss.CMS_PLEDGOR_DTL_ID
	and spmmiss.SPM_SEC_ID in (
	    select t1.SCI_SECURITY_DTL_ID from (
	        select sec.SCI_SECURITY_DTL_ID, plg.PLG_LE_ID from CMS_LIMIT_SECURITY_MAP lsm, SCI_PLEDGOR_DTL plg, SCI_SEC_PLDGR_MAP spm, CMS_SECURITY sec
	        where lsm.CMS_COLLATERAL_ID = spm.CMS_COLLATERAL_ID
	        and lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
	        and spm.CMS_PLEDGOR_DTL_ID = plg.CMS_PLEDGOR_DTL_ID
	        and sec.IS_MIGRATED_IND = 'Y'
	        and not exists (select 1 from CMS_LSM_1XM_EXP_TEMP lsm1xm
	                        where lsm1xm.SCI_LAS_SEC_ID = lsm.SCI_LAS_SEC_ID)
	        and not exists (select 1 from CMS_LSM_MXM_EXP_TEMP lsmmxm
	                        where lsmmxm.SCI_LAS_SEC_ID = lsm.SCI_LAS_SEC_ID)
	        and not exists (select 1 from CMS_LSM_1X1_EXP_TEMP lsm1x1
	                        where lsm1x1.SCI_LAS_SEC_ID = lsm.SCI_LAS_SEC_ID)
	        group by sec.SCI_SECURITY_DTL_ID, plg.PLG_LE_ID) as t1
	    group by t1.SCI_SECURITY_DTL_ID
	    having count(t1.SCI_SECURITY_DTL_ID) > 1)
	group by spmmiss.SPM_SEC_ID, plgmiss.PLG_LE_ID
	order by spmmiss.SPM_SEC_ID);
	
	
insert into CMS_LSM_1X1_MISS_EXP_TEMP (SCI_LAS_SEC_ID, SCI_LAS_LE_ID)
(
    select sec.SCI_SECURITY_DTL_ID, plg.PLG_LE_ID from CMS_LIMIT_SECURITY_MAP lsm, SCI_PLEDGOR_DTL plg, SCI_SEC_PLDGR_MAP spm, CMS_SECURITY sec
    where lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
    and sec.CMS_COLLATERAL_ID = spm.CMS_COLLATERAL_ID
    and spm.CMS_PLEDGOR_DTL_ID = plg.CMS_PLEDGOR_DTL_ID
    and sec.IS_MIGRATED_IND = 'Y'
    and not exists (select 1 from CMS_LSM_1XM_EXP_TEMP lsm1xm
                    where lsm1xm.SCI_LAS_SEC_ID = lsm.SCI_LAS_SEC_ID)
    and not exists (select 1 from CMS_LSM_MXM_EXP_TEMP lsmmxm
                    where lsmmxm.SCI_LAS_SEC_ID = lsm.SCI_LAS_SEC_ID)
    and not exists (select 1 from CMS_LSM_1X1_EXP_TEMP lsm1x1
                    where lsm1x1.SCI_LAS_SEC_ID = lsm.SCI_LAS_SEC_ID)
    and not exists (select 1 from CMS_LSM_MX1_MISS_EXP_TEMP lsmmiss
                    where lsmmiss.SCI_LAS_SEC_ID = lsm.SCI_LAS_SEC_ID)
    and sec.SECURITY_SUB_TYPE_ID <> 'CL001'
    group by sec.SCI_SECURITY_DTL_ID, plg.PLG_LE_ID);	
	
-- Export the data to GIT	
select * from CMS_LSM_1XM_EXP_TEMP order by SCI_LAS_SEC_ID, cast (SCI_LAS_LE_ID as BIGINT);		
select * from CMS_LSM_MXM_EXP_TEMP order by SCI_LAS_SEC_ID;	
select * from CMS_LSM_1X1_EXP_TEMP order by SCI_LAS_SEC_ID;	
select * from CMS_LSM_MX1_MISS_EXP_TEMP order by SCI_LAS_SEC_ID, cast (SCI_LAS_LE_ID as BIGINT);	 	
select * from CMS_LSM_1X1_MISS_EXP_TEMP order by SCI_LAS_SEC_ID;	