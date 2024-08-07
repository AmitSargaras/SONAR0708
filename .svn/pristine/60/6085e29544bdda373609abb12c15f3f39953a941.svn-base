/* Patch issue date to a value pulled from SIBS since during migration this value was not migrated and was required for STP */

drop table CMS_CASH_DEPOSIT_XLS_TEMP;
drop table CMS_CASH_DEPOSIT_TEMP;

create table CMS_CASH_DEPOSIT_TEMP like CMS_CASH_DEPOSIT;

insert into CMS_CASH_DEPOSIT_TEMP (select * from CMS_CASH_DEPOSIT);

---------------------------------------------------------------------------------------------------------------------------------------------
-- Count number of cash to be updated
select count(*) from CMS_LIMIT_SECURITY_MAP lsm, CMS_CASH_DEPOSIT_XLS_TEMP cashtmp
where lsm.SCI_LAS_SEC_ID = cashtmp.SCI_LAS_SEC_ID;

select count(*) from CMS_CASH_DEPOSIT lsm, CMS_CASH_DEPOSIT_XLS_TEMP cashtmp
where lsm.CMS_COLLATERAL_ID = cashtmp.CMS_COLLATERAL_ID;

---------------------------------------------------------------------------------------------------------------------------------------------
-- Create a temporary table to store the issue date loaded from xls
create table CMS_CASH_DEPOSIT_XLS_TEMP (
	SCI_LAS_SEC_ID VARCHAR (50),
	CMS_COLLATERAL_ID BIGINT,
	CMS_STG_COLLATERAL_ID BIGINT,
	ISSUE_DATE TIMESTAMP
);

-- To be used as a xls formula to extract insert script from xls
="insert into CMS_CASH_DEPOSIT_XLS_TEMP (SCI_LAS_SEC_ID, ISSUE_DATE) values ('"&A1&"', '"&B1&"');"

CREATE INDEX IDX908241046270000 ON CMS_CASH_DEPOSIT_XLS_TEMP
("CMS_COLLATERAL_ID" ASC, "ISSUE_DATE" DESC) 
ALLOW REVERSE SCANS; 

CREATE INDEX IDX908241046300000 ON CMS_CASH_DEPOSIT
("ISSUE_DATE" ASC, "CMS_COLLATERAL_ID" DESC) 
ALLOW REVERSE SCANS; 

CREATE INDEX IDX908241049070000 ON CMS_LIMIT_SECURITY_MAP
("SCI_LAS_SEC_ID" ASC) 
ALLOW REVERSE SCANS ; 

CREATE INDEX IDX908241049110000 ON CMS_LIMIT_SECURITY_MAP
("SCI_LAS_SEC_ID" ASC, "CMS_COLLATERAL_ID" DESC) 
ALLOW REVERSE SCANS ; 

CREATE INDEX IDX908241052400000 ON CMS_CASH_DEPOSIT_XLS_TEMP
("CMS_STG_COLLATERAL_ID" ASC, "ISSUE_DATE" DESC) 
ALLOW REVERSE SCANS ; 

CREATE INDEX IDX908241052430000 ON CMS_STAGE_CASH_DEPOSIT
("ISSUE_DATE" ASC, "CMS_COLLATERAL_ID" DESC) 
ALLOW REVERSE SCANS ; 

CREATE INDEX IDX908241103060000 ON CMS_STAGE_LIMIT_SECURITY_MAP
("SCI_LAS_SEC_ID" ASC) 
ALLOW REVERSE SCANS ; 

CREATE INDEX IDX908241103100000 ON CMS_STAGE_LIMIT_SECURITY_MAP
("SCI_LAS_SEC_ID" ASC, "CMS_COLLATERAL_ID" DESC) 
ALLOW REVERSE SCANS ; 

---------------------------------------------------------------------------------------------------------------------------------------------

-- Update to actual table
update CMS_CASH_DEPOSIT_XLS_TEMP cashtmp
set cashtmp.CMS_COLLATERAL_ID = (select lsm.CMS_COLLATERAL_ID from CMS_LIMIT_SECURITY_MAP lsm
                                    where lsm.SCI_LAS_SEC_ID = cashtmp.SCI_LAS_SEC_ID fetch first row only)
where exists (select 1 from CMS_LIMIT_SECURITY_MAP lsm1
                where lsm1.SCI_LAS_SEC_ID = cashtmp.SCI_LAS_SEC_ID fetch first row only);

update CMS_CASH_DEPOSIT cash
set cash.ISSUE_DATE = (select cashtmp.ISSUE_DATE from CMS_CASH_DEPOSIT_XLS_TEMP cashtmp
                            where cashtmp.CMS_COLLATERAL_ID = cash.CMS_COLLATERAL_ID
							and cashtmp.ISSUE_DATE is not null)
where cash.ISSUE_DATE is null
and exists (select 1 from CMS_CASH_DEPOSIT_XLS_TEMP cashtmp1
			where cashtmp1.CMS_COLLATERAL_ID = cash.CMS_COLLATERAL_ID
			and cashtmp1.ISSUE_DATE is not null fetch first row only);
			
-- Update to staging table			
update CMS_CASH_DEPOSIT_XLS_TEMP cashtmp
set cashtmp.CMS_STG_COLLATERAL_ID = (select lsm.CMS_COLLATERAL_ID from CMS_STAGE_LIMIT_SECURITY_MAP lsm
                                    where lsm.SCI_LAS_SEC_ID = cashtmp.SCI_LAS_SEC_ID fetch first row only)
where exists (select 1 from CMS_STAGE_LIMIT_SECURITY_MAP lsm1
                where lsm1.SCI_LAS_SEC_ID = cashtmp.SCI_LAS_SEC_ID fetch first row only);	

update CMS_STAGE_CASH_DEPOSIT cash
set cash.ISSUE_DATE = (select cashtmp.ISSUE_DATE from CMS_CASH_DEPOSIT_XLS_TEMP cashtmp
                            where cashtmp.CMS_STG_COLLATERAL_ID = cash.CMS_COLLATERAL_ID
							and cashtmp.ISSUE_DATE is not null)
where cash.ISSUE_DATE is null
and exists (select 1 from CMS_CASH_DEPOSIT_XLS_TEMP cashtmp1
			where cashtmp1.CMS_STG_COLLATERAL_ID = cash.CMS_COLLATERAL_ID
			and cashtmp1.ISSUE_DATE is not null fetch first row only);				
				
				
drop INDEX IDX908241046270000;
drop INDEX IDX908241046300000;
drop INDEX IDX908241049070000;
drop INDEX IDX908241049110000;
drop INDEX IDX908241052400000;
drop INDEX IDX908241052430000;				
drop INDEX IDX908241103060000;
drop INDEX IDX908241103100000;