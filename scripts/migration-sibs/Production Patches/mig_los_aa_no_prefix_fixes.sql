-- Patching for LOS AANumber prefix for all HP Isl (788 - AT, 422 - HN)

drop table SCI_LSP_LMT_PROFILE_TEMP;
drop table STAGE_LIMIT_PROFILE_TEMP;
drop table SCI_LSP_APPR_LMTS_TEMP;
drop table STAGE_LIMIT_TEMP;
drop table SCI_LSP_JOINT_BORROWER_TEMP;
drop table CMS_LIMIT_SECURITY_MAP_TEMP;
drop table CMS_STAGE_LIMIT_SECURITY_MAP_TEMP;

-- backup SCI_LSP_LMT_PROFILE data
create table SCI_LSP_LMT_PROFILE_TEMP like SCI_LSP_LMT_PROFILE;
insert into SCI_LSP_LMT_PROFILE_TEMP (select * from SCI_LSP_LMT_PROFILE);

-- backup STAGE_LIMIT_PROFILE data
create table STAGE_LIMIT_PROFILE_TEMP like STAGE_LIMIT_PROFILE;
insert into STAGE_LIMIT_PROFILE_TEMP (select * from STAGE_LIMIT_PROFILE);

-- backup SCI_LSP_APPR_LMTS data
create table SCI_LSP_APPR_LMTS_TEMP like SCI_LSP_APPR_LMTS;
insert into SCI_LSP_APPR_LMTS_TEMP (select * from SCI_LSP_APPR_LMTS);

-- backup STAGE_LIMIT data
create table STAGE_LIMIT_TEMP like STAGE_LIMIT;
insert into STAGE_LIMIT_TEMP (select * from STAGE_LIMIT);

-- backup SCI_LSP_JOINT_BORROWER data
create table SCI_LSP_JOINT_BORROWER_TEMP like SCI_LSP_JOINT_BORROWER;
insert into SCI_LSP_JOINT_BORROWER_TEMP (select * from SCI_LSP_JOINT_BORROWER);

-- backup CMS_LIMIT_SECURITY_MAP data
create table CMS_LIMIT_SECURITY_MAP_TEMP like CMS_LIMIT_SECURITY_MAP;
insert into CMS_LIMIT_SECURITY_MAP_TEMP (select * from CMS_LIMIT_SECURITY_MAP);

-- backup CMS_STAGE_LIMIT_SECURITY_MAP data
create table CMS_STAGE_LIMIT_SECURITY_MAP_TEMP like CMS_STAGE_LIMIT_SECURITY_MAP;
insert into CMS_STAGE_LIMIT_SECURITY_MAP_TEMP (select * from CMS_STAGE_LIMIT_SECURITY_MAP);

-- Add additional column to be appended with correct prefix
alter table SCI_LSP_LMT_PROFILE
add column LOS_BCA_REF_NUM_TEMP VARCHAR(35);

alter table STAGE_LIMIT_PROFILE
add column LOS_BCA_REF_NUM_TEMP VARCHAR(35);

alter table SCI_LSP_APPR_LMTS
add column LOS_BCA_REF_NUM_TEMP VARCHAR(35);

alter table STAGE_LIMIT
add column LOS_BCA_REF_NUM_TEMP VARCHAR(35);

alter table SCI_LSP_JOINT_BORROWER
add column LJB_BCA_REF_NUM_TEMP VARCHAR(35);

alter table CMS_LIMIT_SECURITY_MAP
add column SCI_LAS_BCA_REF_NUM_TEMP VARCHAR(35);

alter table CMS_STAGE_LIMIT_SECURITY_MAP
add column SCI_LAS_BCA_REF_NUM_TEMP VARCHAR(35);

-- Update the correct value to newly created column
update SCI_LSP_LMT_PROFILE aa
set aa.LOS_BCA_REF_NUM_TEMP = (select (CASE WHEN lmt.LMT_FAC_CODE = '788' THEN 'AT'
							            WHEN lmt.LMT_FAC_CODE = '422' THEN 'HN' END) 
							        || substr(aa.LOS_BCA_REF_NUM, 3, length(aa.LOS_BCA_REF_NUM)) from SCI_LSP_APPR_LMTS lmt
								where aa.APPLICATION_TYPE = 'HP'
								and aa.CMS_LSP_LMT_PROFILE_ID = lmt.CMS_LIMIT_PROFILE_ID
								and lmt.LMT_FAC_CODE in ('788', '422')
								and substr(aa.LOS_BCA_REF_NUM, 1, 2) = 'HP');

update SCI_LSP_APPR_LMTS lmt
set lmt.LOS_BCA_REF_NUM_TEMP = (select (CASE WHEN lmt.LMT_FAC_CODE = '788' THEN 'AT'
							            WHEN lmt.LMT_FAC_CODE = '422' THEN 'HN' END) 
							        || substr(lmt.LOS_BCA_REF_NUM, 3, length(lmt.LOS_BCA_REF_NUM)) from SCI_LSP_LMT_PROFILE aa
								where aa.APPLICATION_TYPE = 'HP'
								and aa.CMS_LSP_LMT_PROFILE_ID = lmt.CMS_LIMIT_PROFILE_ID
								and lmt.LMT_FAC_CODE in ('788', '422')
								and substr(lmt.LOS_BCA_REF_NUM, 1, 2) = 'HP');								

update STAGE_LIMIT_PROFILE aa
set aa.LOS_BCA_REF_NUM_TEMP = (select (CASE WHEN lmt.LMT_FAC_CODE = '788' THEN 'AT'
							            WHEN lmt.LMT_FAC_CODE = '422' THEN 'HN' END) 
							        || substr(aa.LOS_BCA_REF_NUM, 3, length(aa.LOS_BCA_REF_NUM)) from STAGE_LIMIT lmt
								where aa.APPLICATION_TYPE = 'HP'
								and aa.CMS_LSP_LMT_PROFILE_ID = lmt.CMS_LIMIT_PROFILE_ID
								and lmt.LMT_FAC_CODE in ('788', '422')
								and substr(aa.LOS_BCA_REF_NUM, 1, 2) = 'HP');
								
update STAGE_LIMIT lmt
set lmt.LOS_BCA_REF_NUM_TEMP = (select (CASE WHEN lmt.LMT_FAC_CODE = '788' THEN 'AT'
							            WHEN lmt.LMT_FAC_CODE = '422' THEN 'HN' END) 
							        || substr(lmt.LOS_BCA_REF_NUM, 3, length(lmt.LOS_BCA_REF_NUM)) from STAGE_LIMIT_PROFILE aa
								where aa.APPLICATION_TYPE = 'HP'
								and aa.CMS_LSP_LMT_PROFILE_ID = lmt.CMS_LIMIT_PROFILE_ID
								and lmt.LMT_FAC_CODE in ('788', '422')
								and substr(lmt.LOS_BCA_REF_NUM, 1, 2) = 'HP');									
								
update SCI_LSP_JOINT_BORROWER jb
set jb.LJB_BCA_REF_NUM_TEMP = (select (CASE WHEN lmt.LMT_FAC_CODE = '788' THEN 'AT'
							            WHEN lmt.LMT_FAC_CODE = '422' THEN 'HN' END) 
							        || substr(jb.LJB_BCA_REF_NUM, 3, length(jb.LJB_BCA_REF_NUM)) from SCI_LSP_LMT_PROFILE aa, SCI_LSP_APPR_LMTS lmt
								where aa.APPLICATION_TYPE = 'HP'
								and aa.CMS_LSP_LMT_PROFILE_ID = lmt.CMS_LIMIT_PROFILE_ID
								and aa.CMS_LSP_LMT_PROFILE_ID = jb.CMS_LMP_LIMIT_PROFILE_ID
								and lmt.LMT_FAC_CODE in ('788', '422')
								and substr(jb.LJB_BCA_REF_NUM, 1, 2) = 'HP');		
								
update CMS_LIMIT_SECURITY_MAP lsm
set lsm.SCI_LAS_BCA_REF_NUM_TEMP = (select (CASE WHEN lmt.LMT_FAC_CODE = '788' THEN 'AT'
							            WHEN lmt.LMT_FAC_CODE = '422' THEN 'HN' END) 
							        || substr(lsm.SCI_LAS_BCA_REF_NUM, 3, length(lsm.SCI_LAS_BCA_REF_NUM)) from SCI_LSP_LMT_PROFILE aa, SCI_LSP_APPR_LMTS lmt
									where aa.APPLICATION_TYPE = 'HP'
									and aa.CMS_LSP_LMT_PROFILE_ID = lmt.CMS_LIMIT_PROFILE_ID
									and lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
									and lmt.LMT_FAC_CODE in ('788', '422')
									and substr(lsm.SCI_LAS_BCA_REF_NUM, 1, 2) = 'HP');

update CMS_STAGE_LIMIT_SECURITY_MAP lsm
set lsm.SCI_LAS_BCA_REF_NUM_TEMP = (select (CASE WHEN lmt.LMT_FAC_CODE = '788' THEN 'AT'
							            WHEN lmt.LMT_FAC_CODE = '422' THEN 'HN' END) 
							        || substr(lsm.SCI_LAS_BCA_REF_NUM, 3, length(lsm.SCI_LAS_BCA_REF_NUM)) from STAGE_LIMIT_PROFILE aa, STAGE_LIMIT lmt
									where aa.APPLICATION_TYPE = 'HP'
									and aa.CMS_LSP_LMT_PROFILE_ID = lmt.CMS_LIMIT_PROFILE_ID
									and lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
									and lmt.LMT_FAC_CODE in ('788', '422')
									and substr(lsm.SCI_LAS_BCA_REF_NUM, 1, 2) = 'HP');
						
-- Patch the los aa number with the correct prefix						
update SCI_LSP_LMT_PROFILE aa
set LOS_BCA_REF_NUM = (select LOS_BCA_REF_NUM_TEMP from SCI_LSP_LMT_PROFILE aa1
						where aa1.CMS_LSP_LMT_PROFILE_ID = aa.CMS_LSP_LMT_PROFILE_ID
						and aa1.LOS_BCA_REF_NUM_TEMP <> '')
where aa.LOS_BCA_REF_NUM_TEMP <> '';

update SCI_LSP_APPR_LMTS lmt
set LOS_BCA_REF_NUM = (select LOS_BCA_REF_NUM_TEMP from SCI_LSP_APPR_LMTS lmt1
						where lmt1.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID
						and lmt1.LOS_BCA_REF_NUM_TEMP <> '')
where lmt.LOS_BCA_REF_NUM_TEMP <> '';

update STAGE_LIMIT_PROFILE aa
set LOS_BCA_REF_NUM = (select LOS_BCA_REF_NUM_TEMP from STAGE_LIMIT_PROFILE aa1
						where aa1.CMS_LSP_LMT_PROFILE_ID = aa.CMS_LSP_LMT_PROFILE_ID
						and aa1.LOS_BCA_REF_NUM_TEMP <> '')
where aa.LOS_BCA_REF_NUM_TEMP <> '';

update STAGE_LIMIT lmt
set LOS_BCA_REF_NUM = (select LOS_BCA_REF_NUM_TEMP from STAGE_LIMIT lmt1
						where lmt1.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID
						and lmt1.LOS_BCA_REF_NUM_TEMP <> '')
where lmt.LOS_BCA_REF_NUM_TEMP <> '';

update SCI_LSP_JOINT_BORROWER jb
set LJB_BCA_REF_NUM = (select LJB_BCA_REF_NUM_TEMP from SCI_LSP_JOINT_BORROWER jb1
						where jb1.CMS_LSP_JOINT_BORROWER_ID = jb.CMS_LSP_JOINT_BORROWER_ID
						and jb1.LJB_BCA_REF_NUM_TEMP <> '')
where jb.LJB_BCA_REF_NUM_TEMP <> '';

update CMS_LIMIT_SECURITY_MAP lsm
set SCI_LAS_BCA_REF_NUM = (select SCI_LAS_BCA_REF_NUM_TEMP from CMS_LIMIT_SECURITY_MAP lsm1
							where lsm1.CHARGE_ID = lsm.CHARGE_ID
							and lsm1.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
							and lsm1.SCI_LAS_BCA_REF_NUM_TEMP <> '')
where lsm.SCI_LAS_BCA_REF_NUM_TEMP <> '';

update CMS_STAGE_LIMIT_SECURITY_MAP lsm
set SCI_LAS_BCA_REF_NUM = (select SCI_LAS_BCA_REF_NUM_TEMP from CMS_STAGE_LIMIT_SECURITY_MAP lsm1
							where lsm1.CHARGE_ID = lsm.CHARGE_ID
							and lsm1.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
							and lsm1.SCI_LAS_BCA_REF_NUM_TEMP <> '')
where lsm.SCI_LAS_BCA_REF_NUM_TEMP <> '';

-- Remove the temporary column
alter table SCI_LSP_LMT_PROFILE
drop column LOS_BCA_REF_NUM_TEMP;

alter table STAGE_LIMIT_PROFILE
drop column LOS_BCA_REF_NUM_TEMP;

alter table SCI_LSP_APPR_LMTS
drop column LOS_BCA_REF_NUM_TEMP;

alter table STAGE_LIMIT
drop column LOS_BCA_REF_NUM_TEMP;

alter table SCI_LSP_JOINT_BORROWER
drop column LJB_BCA_REF_NUM_TEMP;

alter table CMS_LIMIT_SECURITY_MAP
drop column SCI_LAS_BCA_REF_NUM_TEMP;

alter table CMS_STAGE_LIMIT_SECURITY_MAP
drop column SCI_LAS_BCA_REF_NUM_TEMP;

-- Reorg table 
call admin_cmd (' REORG TABLE SCI_LSP_LMT_PROFILE ');
call admin_cmd (' REORG TABLE STAGE_LIMIT_PROFILE ');
call admin_cmd (' REORG TABLE SCI_LSP_APPR_LMTS ');
call admin_cmd (' REORG TABLE STAGE_LIMIT ');
call admin_cmd (' REORG TABLE SCI_LSP_JOINT_BORROWER ');
call admin_cmd (' REORG TABLE CMS_LIMIT_SECURITY_MAP ');
call admin_cmd (' REORG TABLE CMS_STAGE_LIMIT_SECURITY_MAP ');