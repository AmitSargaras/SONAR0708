/* Patching for credit line indicator to blank - Only patch for migrated data only */

create table CMS_FACILITY_MASTER_TEMP like CMS_FACILITY_MASTER;
create table CMS_STG_FACILITY_MASTER_TEMP like CMS_STG_FACILITY_MASTER;

insert into CMS_FACILITY_MASTER_TEMP (select * from CMS_FACILITY_MASTER);
insert into CMS_STG_FACILITY_MASTER_TEMP (select * from CMS_STG_FACILITY_MASTER);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select CREDIT_LINE_IND, count(*) from CMS_FACILITY_MASTER
where char(ID) like '20090801%' or char(ID) like '20090808%'
group by CREDIT_LINE_IND;
/*
 CREDIT_LINE_IND     	Count      
 ------------------  		--------------- 
				435394 
 N                   			64696  
 (null)              			3
*/

select CREDIT_LINE_IND, count(*) from CMS_STG_FACILITY_MASTER
where char(ID) like '20090801%' or char(ID) like '20090808%'
group by CREDIT_LINE_IND;
/*
 CREDIT_LINE_IND     	Count      
 ------------------  		------ 
				435396 
 N                   			64694  
 (null)              			3   
*/

-- Count: 23
select count(*) from CMS_STG_FACILITY_MASTER facmas
where CREDIT_LINE_IND <> ''
and exists (select 1 from SCI_LSP_APPR_LMTS lmt
            where facmas.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID
            and lmt.CMS_LSP_APPR_LMTS_ID between (20090801000000000) and (20090808999999999));

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Update credit line indicator as blank when null
update CMS_FACILITY_MASTER
set CREDIT_LINE_IND = ''
where CREDIT_LINE_IND is null;

-- Update credit line indicator as blank when null for staging table
update CMS_STG_FACILITY_MASTER
set CREDIT_LINE_IND = ''
where CREDIT_LINE_IND is null;

-- Update credit line indicator to blank for migrated record
update CMS_FACILITY_MASTER
set CREDIT_LINE_IND = ''
where char(ID) like '20090801%' or char(ID) like '20090808%'
and CREDIT_LINE_IND <> '';

update CMS_STG_FACILITY_MASTER
set CREDIT_LINE_IND = ''
where char(ID) like '20090801%' or char(ID) like '20090808%'
and CREDIT_LINE_IND <> '';

update CMS_STG_FACILITY_MASTER facmas
set CREDIT_LINE_IND = ''
where CREDIT_LINE_IND <> ''
and exists (select 1 from SCI_LSP_APPR_LMTS lmt
            where facmas.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID
            and lmt.CMS_LSP_APPR_LMTS_ID between (20090801000000000) and (20090808999999999));