--------------------------------------------------------------------------------------------------------------------------
-- Backup the transaction table into temporary table in case of recovery --
--------------------------------------------------------------------------------------------------------------------------
create table TRANSACTION_TEMP like transaction;
insert into TRANSACTION_TEMP (select * from transaction);

create table TRANS_HISTORY_TEMP like trans_history;
insert into TRANS_HISTORY_TEMP (select * from trans_history);

--------------------------------------------------------------------------------------------------------------------------
-- Count the effected cases to be deleted. The total count should be the same for all 3 query. --
--------------------------------------------------------------------------------------------------------------------------
-- Count: 439665
select count(*) from TRANSACTION 
where char(REFERENCE_ID) like '20090801%'
and TRANSACTION_TYPE = 'LIMITPROFILE'
and char(TRANSACTION_ID) like '20090808%'; 

-- Count: 439665
select count(*) from TRANSACTION 
where char(REFERENCE_ID) like '20090801%'
and TRANSACTION_TYPE = 'TAT_DOC'
and char(TRANSACTION_ID) like '20090808%'; 

-- Count: 439665
select count(*) from TRANS_HISTORY trxhis
where exists (select 1 from TRANSACTION trx
                where char(trx.REFERENCE_ID) like '20090801%'
                and trx.TRANSACTION_TYPE = 'LIMITPROFILE'
                and char(trx.TRANSACTION_ID) like '20090808%'
                and trxhis.TRANSACTION_ID = trx.TRANSACTION_ID); 
				
--------------------------------------------------------------------------------------------------------------------------
-- Delete these duplicate record from transaction and transaction history table -- 
--------------------------------------------------------------------------------------------------------------------------
delete from TRANSACTION 
where char(REFERENCE_ID) like '20090801%'
and TRANSACTION_TYPE = 'LIMITPROFILE'
and char(TRANSACTION_ID) like '20090808%'; 

delete from TRANSACTION 
where char(REFERENCE_ID) like '20090801%'
and TRANSACTION_TYPE = 'TAT_DOC'
and char(TRANSACTION_ID) like '20090808%'; 

delete from TRANS_HISTORY trxhis
where exists (select 1 from TRANSACTION trx
                where char(trx.REFERENCE_ID) like '20090801%'
                and trx.TRANSACTION_TYPE = 'LIMITPROFILE'
                and char(trx.TRANSACTION_ID) like '20090808%'
                and trxhis.TRANSACTION_ID = trx.TRANSACTION_ID); 			
				
--------------------------------------------------------------------------------------------------------------------------
--  Remove the temporary table  after tested working properly in CMS screen --
--------------------------------------------------------------------------------------------------------------------------		
drop table TRANSACTION_TEMP;
drop table TRANS_HISTORY_TEMP;		