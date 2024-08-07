/*********************
 Unit Trust Setup
*********************/ 

insert into cms_feed_group (feed_group_id, group_type, group_subtype, cms_version_time, group_stock_type)
select next value for cms_feed_group_seq, 'UNIT_TRUST', c.CTR_CNTRY_ISO_CODE, 1, '005'
from sci_country c;

INSERT INTO TRANSACTION 
( TRANSACTION_ID, FROM_STATE, USER_ID, TRANSACTION_TYPE, CREATION_DATE,
TRANSACTION_DATE, REFERENCE_ID, STATUS, TEAM_ID, OPSDESC)
select char(20070131  + next value for trx_seq) , 'ND', 0, 'UNITTRUST_FEED_GROUP',  current timestamp,  current timestamp, 
f.feed_group_id, 'ACTIVE',  0, 'SYSTEM_CREATION' 
from cms_feed_group f
where group_type = 'UNIT_TRUST';

/*************************
 Exchange Rate Setup
*************************/
 
insert into cms_feed_group (feed_group_id, group_type, cms_version_time)
values
(next value for cms_feed_group_seq, 'FOREX', 1);

INSERT INTO TRANSACTION 
( TRANSACTION_ID, FROM_STATE, USER_ID, TRANSACTION_TYPE, CREATION_DATE,
TRANSACTION_DATE, REFERENCE_ID, STATUS, TEAM_ID, OPSDESC)
select char(20070131  + next value for trx_seq) , 'ND', 0, 'FOREX_FEED_GROUP',  current timestamp,  current timestamp, 
f.feed_group_id, 'ACTIVE',  0, 'SYSTEM_CREATION' 
from cms_feed_group f
where group_type = 'FOREX';

/*************************
 Gold Setup
*************************/
insert into cms_feed_group (feed_group_id, group_type, cms_version_time)
values
(next value for cms_feed_group_seq, 'GOLD', 1);

INSERT INTO TRANSACTION 
( TRANSACTION_ID, FROM_STATE, USER_ID, TRANSACTION_TYPE, CREATION_DATE,
TRANSACTION_DATE, REFERENCE_ID, STATUS, TEAM_ID, OPSDESC)
select char(20070131  + next value for trx_seq) , 'ND', 0, 'GOLD_FEED_GROUP',  current timestamp,  current timestamp, 
f.feed_group_id, 'ACTIVE',  0, 'SYSTEM_CREATION' 
from cms_feed_group f
where group_type = 'GOLD';

/*********************
 Bond Setup
*********************/ 
insert into cms_feed_group (feed_group_id, group_type, cms_version_time, group_stock_type)
values
(next value for cms_feed_group_seq, 'BOND', 1, '004');


INSERT INTO TRANSACTION 
( TRANSACTION_ID, FROM_STATE, USER_ID, TRANSACTION_TYPE, CREATION_DATE,
TRANSACTION_DATE, REFERENCE_ID, STATUS,  TEAM_ID, OPSDESC)
select char(20070131  + next value for trx_seq) , 'ND', 0, 'BOND_FEED_GROUP',  current timestamp,  current timestamp, 
f.feed_group_id, 'ACTIVE',  0, 'SYSTEM_CREATION' 
from cms_feed_group f
where group_type = 'BOND';


/***********************
 Stock Setup
***********************/
insert into cms_stock_exchange 
select entry_code, entry_name, country
from common_code_category_entry
where category_code = 'STOCK_EXCHANGE';

begin atomic

	for i as select entry_code from common_code_category_entry where category_code = 'STOCK_EXCHANGE' 
	do
		for j as select entry_code from common_code_category_entry where category_code = 'SHARE_TYPE' and ref_entry_code = 'STOCK_TYPE'
		do
			insert into cms_feed_group (feed_group_id, group_type, group_subtype, cms_version_time, group_stock_type)
			values
			(next value for cms_feed_group_seq, 'STOCK', i.entry_code, 1, j.entry_code);--
			
		end for;--
	end for;--
	
	INSERT INTO TRANSACTION 
	( TRANSACTION_ID, FROM_STATE, USER_ID, TRANSACTION_TYPE, CREATION_DATE,
	TRANSACTION_DATE, REFERENCE_ID, STATUS,  TEAM_ID, OPSDESC)
	select char(20070131  + next value for trx_seq) , 'ND', 0, 'STOCK_FEED_GROUP',  current timestamp,  current timestamp, 
	f.feed_group_id, 'ACTIVE',  0, 'SYSTEM_CREATION' 
	from cms_feed_group f
	where group_type = 'STOCK';--

end;	

/**********************
 Stock Index Setup
**********************/
insert into cms_feed_group (feed_group_id, group_type, cms_version_time, group_subtype)
select next value for cms_feed_group_seq, 'STOCK_INDEX', 1, c.CTR_CNTRY_ISO_CODE
from sci_country c;


INSERT INTO TRANSACTION 
( TRANSACTION_ID, FROM_STATE, USER_ID, TRANSACTION_TYPE, CREATION_DATE,
TRANSACTION_DATE, REFERENCE_ID, STATUS, TEAM_ID, OPSDESC)
select char(20070131  + next value for trx_seq) , 'ND', 0, 'STOCKIDX_FEED_GROUP',  current timestamp,  current timestamp, 
f.feed_group_id, 'ACTIVE',  0, 'SYSTEM_CREATION' 
from cms_feed_group f
where group_type = 'STOCK_INDEX';