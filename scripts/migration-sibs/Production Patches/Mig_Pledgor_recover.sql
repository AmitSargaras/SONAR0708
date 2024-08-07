drop table SCI_PLEDGOR_DTL_MAX_PLDGR_TEMP1;
drop table SCI_PLEDGOR_DTL_MAX_PLDGR_TEMP1_READD;
drop table STAGE_PLEDGOR_DTL_MAX_PLDGR_TEMP1;
drop table STAGE_PLEDGOR_DTL_MAX_PLDGR_TEMP1_READD;

create table SCI_PLEDGOR_DTL_MAX_PLDGR_TEMP1 (
    CMS_PLEDGOR_DTL_ID BIGINT,
    PLG_LE_ID VARCHAR(20),
    SOURCE_ID VARCHAR(10)
);

create table SCI_PLEDGOR_DTL_MAX_PLDGR_TEMP1_READD (
    CMS_PLEDGOR_DTL_ID BIGINT,
    PLG_LE_ID VARCHAR(20),
    SOURCE_ID VARCHAR(10)
);		

create table STAGE_PLEDGOR_DTL_MAX_PLDGR_TEMP1 (
    CMS_PLEDGOR_DTL_ID BIGINT,
    PLG_LE_ID VARCHAR(20),
    SOURCE_ID VARCHAR(10)
);

create table STAGE_PLEDGOR_DTL_MAX_PLDGR_TEMP1_READD (
    CMS_PLEDGOR_DTL_ID BIGINT,
    PLG_LE_ID VARCHAR(20),
    SOURCE_ID VARCHAR(10)
);		

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

insert into SCI_PLEDGOR_DTL_MAX_PLDGR_TEMP1 (select max(CMS_PLEDGOR_DTL_ID), PLG_LE_ID, SOURCE_ID from SCI_PLEDGOR_DTL_TEMP plg1 
		                                        where plg1.PLG_LE_ID in (
		                                            select plg.PLG_LE_ID from SCI_PLEDGOR_DTL_TEMP plg, SCI_SEC_PLDGR_MAP_TEMP spm
		                                            where plg.CMS_PLEDGOR_DTL_ID = spm.CMS_PLEDGOR_DTL_ID
		                                            and plg.source_id = 'SIBS'
		                                            group by plg.PLG_LE_ID, spm.CMS_COLLATERAL_ID
		                                            having count(plg.PLG_LE_ID) > 1)
		                                        group by PLG_LE_ID, SOURCE_ID);
										
insert into SCI_PLEDGOR_DTL_MAX_PLDGR_TEMP1_READD (
											select max(CMS_PLEDGOR_DTL_ID), PLG_LE_ID, SOURCE_ID from SCI_PLEDGOR_DTL_TEMP plg1 
											where not exists (select 1 from SCI_PLEDGOR_DTL_MAX_PLDGR_TEMP1 temp1
                                                            where plg1.PLG_LE_ID = temp1.PLG_LE_ID)
                                            and not exists (select 1 from SCI_PLEDGOR_DTL plgact
                                                            where plg1.CMS_PLEDGOR_DTL_ID = plgact.CMS_PLEDGOR_DTL_ID)
											group by PLG_LE_ID, SOURCE_ID
                                            order by PLG_LE_ID);						
										
insert into STAGE_PLEDGOR_DTL_MAX_PLDGR_TEMP1 (select max(CMS_PLEDGOR_DTL_ID), PLG_LE_ID, SOURCE_ID from STAGE_PLEDGOR_DTL_TEMP plg1 
		                                        where plg1.PLG_LE_ID in (
		                                            select plg.PLG_LE_ID from STAGE_PLEDGOR_DTL_TEMP plg, STAGE_SEC_PLDGR_MAP_TEMP spm
		                                            where plg.CMS_PLEDGOR_DTL_ID = spm.CMS_PLEDGOR_DTL_ID
		                                            and plg.source_id = 'SIBS'
		                                            group by plg.PLG_LE_ID, spm.CMS_COLLATERAL_ID
		                                            having count(plg.PLG_LE_ID) > 1)
		                                        group by PLG_LE_ID, SOURCE_ID);
										
insert into STAGE_PLEDGOR_DTL_MAX_PLDGR_TEMP1_READD (
											select max(CMS_PLEDGOR_DTL_ID), PLG_LE_ID, SOURCE_ID from STAGE_PLEDGOR_DTL_TEMP plg1 
											where not exists (select 1 from STAGE_PLEDGOR_DTL_MAX_PLDGR_TEMP1 temp1
                                                            where plg1.PLG_LE_ID = temp1.PLG_LE_ID)
                                            and not exists (select 1 from STAGE_PLEDGOR_DTL plgact
                                                            where plg1.CMS_PLEDGOR_DTL_ID = plgact.CMS_PLEDGOR_DTL_ID)
											group by PLG_LE_ID, SOURCE_ID
                                            order by PLG_LE_ID);	
											
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------											
										
insert into SCI_PLEDGOR_DTL (select * from SCI_PLEDGOR_DTL_TEMP temp
								where exists (select 1 from SCI_PLEDGOR_DTL_MAX_PLDGR_TEMP1_READD temp1
							                where temp1.CMS_PLEDGOR_DTL_ID = temp.CMS_PLEDGOR_DTL_ID));

insert into STAGE_PLEDGOR_DTL (select * from STAGE_PLEDGOR_DTL_TEMP temp
								where exists (select 1 from STAGE_PLEDGOR_DTL_MAX_PLDGR_TEMP1_READD temp1
							                where temp1.CMS_PLEDGOR_DTL_ID = temp.CMS_PLEDGOR_DTL_ID));

insert into SCI_SEC_PLDGR_MAP (select * from SCI_SEC_PLDGR_MAP_TEMP temp
								where exists (select 1 from SCI_PLEDGOR_DTL_MAX_PLDGR_TEMP1_READD temp1
								                where temp1.CMS_PLEDGOR_DTL_ID = temp.CMS_PLEDGOR_DTL_ID)
                                and not exists (select 1 from SCI_SEC_PLDGR_MAP temp2
							                where temp2.CMS_SEC_PLDGR_MAP_ID = temp.CMS_SEC_PLDGR_MAP_ID));
											
insert into STAGE_SEC_PLDGR_MAP (select * from STAGE_SEC_PLDGR_MAP_TEMP temp
								where exists (select 1 from STAGE_PLEDGOR_DTL_MAX_PLDGR_TEMP1_READD temp1
							                where temp1.CMS_PLEDGOR_DTL_ID = temp.CMS_PLEDGOR_DTL_ID)
								and not exists (select 1 from STAGE_SEC_PLDGR_MAP temp2
							                where temp2.CMS_SEC_PLDGR_MAP_ID = temp.CMS_SEC_PLDGR_MAP_ID));											

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------												

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
    and not exists (select 1 from CMS_LSM_1X1_MISS_EXP_TEMP lsmmiss1x1
                    where lsmmiss1x1.SCI_LAS_SEC_ID = lsm.SCI_LAS_SEC_ID)
    and sec.SECURITY_SUB_TYPE_ID <> 'CL001'
    group by sec.SCI_SECURITY_DTL_ID, plg.PLG_LE_ID
    order by sec.SCI_SECURITY_DTL_ID;
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------			

create table SCI_SEC_PLDGR_MAP_TEMP_DUP like SCI_SEC_PLDGR_MAP;

-- duplicate case
insert into SCI_SEC_PLDGR_MAP_TEMP_DUP (
	select * from SCI_SEC_PLDGR_MAP_TEMP spmtemp1 where spmtemp1.CMS_COLLATERAL_ID in (
	    select spmtemp.CMS_COLLATERAL_ID from SCI_SEC_PLDGR_MAP_TEMP spmtemp, SCI_PLEDGOR_DTL_TEMP plgtemp
	    where spmtemp.CMS_PLEDGOR_DTL_ID = plgtemp.CMS_PLEDGOR_DTL_ID
	    and not exists (select 1 from SCI_SEC_PLDGR_MAP plg
	                       where plg.CMS_COLLATERAL_ID = spmtemp.CMS_COLLATERAL_ID)
	    and spmtemp.SOURCE_ID = 'SIBS'
	    group by spmtemp.CMS_COLLATERAL_ID
	    having count(*) > 1)
	and spmtemp1.SOURCE_ID = 'SIBS'
);

create table SCI_SEC_PLDGR_MAP_TEMP_DUP_EXP (
    CMS_SEC_PLDGR_MAP_ID BIGINT,
	CMS_COLLATERAL_ID BIGINT,
    SOURCE_ID VARCHAR(10)
);	

insert into SCI_SEC_PLDGR_MAP_TEMP_DUP_EXP (
	select max(CMS_SEC_PLDGR_MAP_ID), CMS_COLLATERAL_ID, SOURCE_ID from SCI_SEC_PLDGR_MAP_TEMP_DUP
	where SOURCE_ID = 'SIBS'
	group by SPM_SEC_ID, CMS_COLLATERAL_ID, SOURCE_ID
);

insert into SCI_SEC_PLDGR_MAP (select spmtemp.* from SCI_SEC_PLDGR_MAP_TEMP spmtemp 
                                    where exists (select 1 from SCI_SEC_PLDGR_MAP_TEMP_DUP_EXP spmtempdup
                                                    where spmtemp.CMS_SEC_PLDGR_MAP_ID = spmtempdup.CMS_SEC_PLDGR_MAP_ID
                                                    and spmtemp.CMS_COLLATERAL_ID = spmtempdup.CMS_COLLATERAL_ID)
                                    and not exists (select 1 from SCI_SEC_PLDGR_MAP spm1
                                                    where spm1.CMS_SEC_PLDGR_MAP_ID = spmtemp.CMS_SEC_PLDGR_MAP_ID));	
	
	
create table SCI_SEC_PLDGR_MAP_TEMP_SIG like SCI_SEC_PLDGR_MAP;	
	
-- non duplicate case	
insert into SCI_SEC_PLDGR_MAP_TEMP_SIG (
	select * from SCI_SEC_PLDGR_MAP_TEMP spmtemp1 where spmtemp1.CMS_COLLATERAL_ID in (
	    select spmtemp.CMS_COLLATERAL_ID from SCI_SEC_PLDGR_MAP_TEMP spmtemp, SCI_PLEDGOR_DTL_TEMP plgtemp
	    where spmtemp.CMS_PLEDGOR_DTL_ID = plgtemp.CMS_PLEDGOR_DTL_ID
	    and not exists (select 1 from SCI_SEC_PLDGR_MAP plg
	                       where plg.CMS_COLLATERAL_ID = spmtemp.CMS_COLLATERAL_ID)
	    and spmtemp.SOURCE_ID = 'SIBS'
	    group by spmtemp.CMS_COLLATERAL_ID
	    having count(*) = 1)
	and spmtemp1.SOURCE_ID = 'SIBS'
);
	
insert into SCI_SEC_PLDGR_MAP (select spmtemp.* from SCI_SEC_PLDGR_MAP_TEMP spmtemp 
                                    where exists (select 1 from SCI_SEC_PLDGR_MAP_TEMP_SIG spmtempsig
                                                    where spmtemp.CMS_SEC_PLDGR_MAP_ID = spmtempsig.CMS_SEC_PLDGR_MAP_ID
                                                    and spmtemp.CMS_COLLATERAL_ID = spmtempsig.CMS_COLLATERAL_ID)
                                    and not exists (select 1 from SCI_SEC_PLDGR_MAP spm1
                                                    where spm1.CMS_SEC_PLDGR_MAP_ID = spmtemp.CMS_SEC_PLDGR_MAP_ID));		
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
	
create table STAGE_SEC_PLDGR_MAP_TEMP_DUP like STAGE_SEC_PLDGR_MAP;

-- duplicate case
insert into STAGE_SEC_PLDGR_MAP_TEMP_DUP (
	select * from STAGE_SEC_PLDGR_MAP_TEMP spmtemp1 where spmtemp1.CMS_COLLATERAL_ID in (
	    select spmtemp.CMS_COLLATERAL_ID from STAGE_SEC_PLDGR_MAP_TEMP spmtemp, STAGE_PLEDGOR_DTL_TEMP plgtemp
	    where spmtemp.CMS_PLEDGOR_DTL_ID = plgtemp.CMS_PLEDGOR_DTL_ID
	    and not exists (select 1 from STAGE_SEC_PLDGR_MAP plg
	                       where plg.CMS_COLLATERAL_ID = spmtemp.CMS_COLLATERAL_ID)
	    and spmtemp.SOURCE_ID = 'SIBS'
	    group by spmtemp.CMS_COLLATERAL_ID
	    having count(*) > 1)
	and spmtemp1.SOURCE_ID = 'SIBS'
);

create table STAGE_SEC_PLDGR_MAP_TEMP_DUP_EXP (
    CMS_SEC_PLDGR_MAP_ID BIGINT,
	CMS_COLLATERAL_ID BIGINT,
    SOURCE_ID VARCHAR(10)
);	

insert into STAGE_SEC_PLDGR_MAP_TEMP_DUP_EXP (
	select max(CMS_SEC_PLDGR_MAP_ID), CMS_COLLATERAL_ID, SOURCE_ID from STAGE_SEC_PLDGR_MAP_TEMP_DUP
	where SOURCE_ID = 'SIBS'
	group by SPM_SEC_ID, CMS_COLLATERAL_ID, SOURCE_ID
);

insert into STAGE_SEC_PLDGR_MAP (select spmtemp.* from STAGE_SEC_PLDGR_MAP_TEMP spmtemp 
                                    where exists (select 1 from STAGE_SEC_PLDGR_MAP_TEMP_DUP_EXP spmtempdup
                                                    where spmtemp.CMS_SEC_PLDGR_MAP_ID = spmtempdup.CMS_SEC_PLDGR_MAP_ID
                                                    and spmtemp.CMS_COLLATERAL_ID = spmtempdup.CMS_COLLATERAL_ID)
                                    and not exists (select 1 from STAGE_SEC_PLDGR_MAP spm1
                                                    where spm1.CMS_SEC_PLDGR_MAP_ID = spmtemp.CMS_SEC_PLDGR_MAP_ID));


create table STAGE_SEC_PLDGR_MAP_TEMP_SIG like STAGE_SEC_PLDGR_MAP;	
	
-- non duplicate case	
insert into STAGE_SEC_PLDGR_MAP_TEMP_SIG (
	select * from STAGE_SEC_PLDGR_MAP_TEMP spmtemp1 where spmtemp1.CMS_COLLATERAL_ID in (
	    select spmtemp.CMS_COLLATERAL_ID from STAGE_SEC_PLDGR_MAP_TEMP spmtemp, STAGE_PLEDGOR_DTL_TEMP plgtemp
	    where spmtemp.CMS_PLEDGOR_DTL_ID = plgtemp.CMS_PLEDGOR_DTL_ID
	    and not exists (select 1 from STAGE_SEC_PLDGR_MAP plg
	                       where plg.CMS_COLLATERAL_ID = spmtemp.CMS_COLLATERAL_ID)
	    and spmtemp.SOURCE_ID = 'SIBS'
	    group by spmtemp.CMS_COLLATERAL_ID
	    having count(*) = 1)
	and spmtemp1.SOURCE_ID = 'SIBS'
);
	
insert into STAGE_SEC_PLDGR_MAP (select spmtemp.* from STAGE_SEC_PLDGR_MAP_TEMP spmtemp 
                                    where exists (select 1 from STAGE_SEC_PLDGR_MAP_TEMP_SIG spmtempsig
                                                    where spmtemp.CMS_SEC_PLDGR_MAP_ID = spmtempsig.CMS_SEC_PLDGR_MAP_ID
                                                    and spmtemp.CMS_COLLATERAL_ID = spmtempsig.CMS_COLLATERAL_ID)
                                    and not exists (select 1 from STAGE_SEC_PLDGR_MAP spm1
                                                    where spm1.CMS_SEC_PLDGR_MAP_ID = spmtemp.CMS_SEC_PLDGR_MAP_ID));	

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

insert into SCI_PLEDGOR_DTL (
	select * from SCI_PLEDGOR_DTL_TEMP plgtemp 
	where exists (select 1 from SCI_SEC_PLDGR_MAP_TEMP_DUP_EXP spmtempdup, SCI_SEC_PLDGR_MAP_TEMP spmtemp
	                where spmtempdup.CMS_SEC_PLDGR_MAP_ID = spmtemp.CMS_SEC_PLDGR_MAP_ID
	                and plgtemp.CMS_PLEDGOR_DTL_ID = spmtemp.CMS_PLEDGOR_DTL_ID)
	and not exists (select 1 from SCI_PLEDGOR_DTL plg
	                where plg.CMS_PLEDGOR_DTL_ID = plgtemp.CMS_PLEDGOR_DTL_ID)
);				

insert into SCI_PLEDGOR_DTL (
	select * from SCI_PLEDGOR_DTL_TEMP plgtemp 
	where exists (select 1 from SCI_SEC_PLDGR_MAP_TEMP_SIG spmtempdup, SCI_SEC_PLDGR_MAP_TEMP spmtemp
	                where spmtempdup.CMS_SEC_PLDGR_MAP_ID = spmtemp.CMS_SEC_PLDGR_MAP_ID
	                and plgtemp.CMS_PLEDGOR_DTL_ID = spmtemp.CMS_PLEDGOR_DTL_ID)
	and not exists (select 1 from SCI_PLEDGOR_DTL plg
	                where plg.CMS_PLEDGOR_DTL_ID = plgtemp.CMS_PLEDGOR_DTL_ID)	
);				
	
insert into STAGE_PLEDGOR_DTL (	
	select * from STAGE_PLEDGOR_DTL_TEMP plgtemp 
	where exists (select 1 from STAGE_SEC_PLDGR_MAP_TEMP_DUP_EXP spmtempdup, STAGE_SEC_PLDGR_MAP_TEMP spmtemp
	                where spmtempdup.CMS_SEC_PLDGR_MAP_ID = spmtemp.CMS_SEC_PLDGR_MAP_ID
	                and plgtemp.CMS_PLEDGOR_DTL_ID = spmtemp.CMS_PLEDGOR_DTL_ID)
	and not exists (select 1 from STAGE_PLEDGOR_DTL plg
	                where plg.CMS_PLEDGOR_DTL_ID = plgtemp.CMS_PLEDGOR_DTL_ID)
);

insert into STAGE_PLEDGOR_DTL (
	select * from STAGE_PLEDGOR_DTL_TEMP plgtemp 
	where exists (select 1 from STAGE_SEC_PLDGR_MAP_TEMP_SIG spmtempdup, STAGE_SEC_PLDGR_MAP_TEMP spmtemp
	                where spmtempdup.CMS_SEC_PLDGR_MAP_ID = spmtemp.CMS_SEC_PLDGR_MAP_ID
	                and plgtemp.CMS_PLEDGOR_DTL_ID = spmtemp.CMS_PLEDGOR_DTL_ID)
	and not exists (select 1 from STAGE_PLEDGOR_DTL plg
	                where plg.CMS_PLEDGOR_DTL_ID = plgtemp.CMS_PLEDGOR_DTL_ID)
);	
	
	
	
	
	
	