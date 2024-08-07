insert into cms_earmark_group 
(earmark_group_id, feed_id, source_system_id, cms_actual_holding, version_time, LAST_BATCH_UPDATE, total_no_of_units) 
select 20070101000000 + next value for CMS_EARMARK_GROUP_SEQ, cms_price_feed.feed_id, 'STBG', 0, -1, current timestamp ,0 
from cms_price_feed where name = 'Sateras';

update cms_price_feed set listedshare_quantity =  20000000, par_value = 0.10 where name = 'Sateras';
update cms_price_feed set paid_up_capital = listedshare_quantity * par_value where name = 'Sateras';

-- Maybank
insert into cms_earmark_group 
(earmark_group_id, feed_id, source_system_id, cms_actual_holding, version_time, LAST_BATCH_UPDATE, total_no_of_units) 
select 20070101000000 + next value for CMS_EARMARK_GROUP_SEQ, cms_price_feed.feed_id, 'STBG', 0, -1, current timestamp ,0 
from cms_price_feed where name = 'Maybank';

update cms_price_feed set listedshare_quantity = 500000000 , par_value = 1.00, paid_up_capital = 500000000, unit_price = 11.1 where name = 'Maybank';

-- OpenSys
insert into cms_earmark_group 
(earmark_group_id, feed_id, source_system_id, cms_actual_holding, version_time, LAST_BATCH_UPDATE, total_no_of_units) 
select 20070101000000 + next value for CMS_EARMARK_GROUP_SEQ, cms_price_feed.feed_id, 'STBG', 0, -1, current timestamp ,0 
from cms_price_feed where name = 'Opensys';

update cms_price_feed set listedshare_quantity= 15000000, par_value=0.10, paid_up_capital =  1500000, unit_price=0.1 where name ='Opensys';

-- PetDag
insert into cms_earmark_group 
(earmark_group_id, feed_id, source_system_id, cms_actual_holding, version_time, LAST_BATCH_UPDATE, total_no_of_units) 
select 20070101000000 + next value for CMS_EARMARK_GROUP_SEQ, cms_price_feed.feed_id, 'STBG', 0, -1, current timestamp ,0 
from cms_price_feed where name = 'PetDag';

update cms_price_feed set listedshare_quantity=  300000000, par_value=1.0, paid_up_capital= 300000000, unit_price=8.5 where name ='PetDag';

-- Astro
insert into cms_earmark_group 
(earmark_group_id, feed_id, source_system_id, cms_actual_holding, version_time, LAST_BATCH_UPDATE, total_no_of_units) 
select 20070101000000 + next value for CMS_EARMARK_GROUP_SEQ, cms_price_feed.feed_id, 'STBG', 0, -1, current timestamp ,0 
from cms_price_feed where name = 'Astro';

update cms_price_feed set listedshare_quantity=150000000, par_value=1.0, paid_up_capital= 150000000, unit_price=3.26 where name ='Astro';

-- CNLT
insert into cms_earmark_group 
(earmark_group_id, feed_id, source_system_id, cms_actual_holding, version_time, LAST_BATCH_UPDATE, total_no_of_units) 
select 20070101000000 + next value for CMS_EARMARK_GROUP_SEQ, cms_price_feed.feed_id, 'STBG', 0, -1, current timestamp ,0 
from cms_price_feed where name = 'CNLT';

update cms_price_feed set listedshare_quantity= 10000000, par_value=0.1, paid_up_capital=1000000, unit_price=0.04 where name ='CNLT';

-- Shell
insert into cms_earmark_group 
(earmark_group_id, feed_id, source_system_id, cms_actual_holding, version_time, LAST_BATCH_UPDATE, total_no_of_units) 
select 20070101000000 + next value for CMS_EARMARK_GROUP_SEQ, cms_price_feed.feed_id, 'STBG', 0, -1, current timestamp ,0 
from cms_price_feed where name = 'Shell';

update cms_price_feed set listedshare_quantity=  250000000, par_value=1.0, paid_up_capital= 250000000, unit_price=11.2 where name ='Shell';

-- Zecon
insert into cms_earmark_group 
(earmark_group_id, feed_id, source_system_id, cms_actual_holding, version_time, LAST_BATCH_UPDATE, total_no_of_units) 
select 20070101000000 + next value for CMS_EARMARK_GROUP_SEQ, cms_price_feed.feed_id, 'STBG', 0, -1, current timestamp ,0 
from cms_price_feed where name = 'Zecon';

update cms_price_feed set listedshare_quantity=25000000, par_value=1.0, paid_up_capital=  25000000, unit_price=1.19 where name ='Zecon';

-- Genting-CD
insert into cms_earmark_group 
(earmark_group_id, feed_id, source_system_id, cms_actual_holding, version_time, LAST_BATCH_UPDATE, total_no_of_units) 
select 20070101000000 + next value for CMS_EARMARK_GROUP_SEQ, cms_price_feed.feed_id, 'STBG', 0, -1, current timestamp ,0 
from cms_price_feed where name = 'Genting-CD';

update cms_price_feed set listedshare_quantity=2000000, par_value=0.01, paid_up_capital=  20000, unit_price=0.01 where name ='Genting-CD';

-- Bursa-CF
insert into cms_earmark_group \
(earmark_group_id, feed_id, source_system_id, cms_actual_holding, version_time, LAST_BATCH_UPDATE, total_no_of_units) \
select 20070101000000 + next value for CMS_EARMARK_GROUP_SEQ, cms_price_feed.feed_id, 'STBG', 0, -1, current timestamp ,0 \
from cms_price_feed where name = 'Bursa-CF';

update cms_price_feed set listedshare_quantity=3000000, par_value=0.05, paid_up_capital=  150000, unit_price=0.21 where name ='Bursa-CF';

-- Tenaga-LA
insert into cms_earmark_group 
(earmark_group_id, feed_id, source_system_id, cms_actual_holding, version_time, LAST_BATCH_UPDATE, total_no_of_units) 
select 20070101000000 + next value for CMS_EARMARK_GROUP_SEQ, cms_price_feed.feed_id, 'STBG', 0, -1, current timestamp ,0 
from cms_price_feed where name = 'Tenaga-LA';

update cms_price_feed set listedshare_quantity=2000000, par_value=1.00, paid_up_capital=2000000, unit_price=1.11 where name ='Tenaga-LA';

-- Commerz-LA
insert into cms_earmark_group 
(earmark_group_id, feed_id, source_system_id, cms_actual_holding, version_time, LAST_BATCH_UPDATE, total_no_of_units) 
select 20070101000000 + next value for CMS_EARMARK_GROUP_SEQ, cms_price_feed.feed_id, 'STBG', 0, -1, current timestamp ,0 
from cms_price_feed where name = 'Commerz-LA';

update cms_price_feed set listedshare_quantity= 5000000, par_value=1.00, paid_up_capital=5000000, unit_price=1.67 where name ='Commerz-LA';

/*********************************** Patch for build #12 starts ********************************************/

-- PetDag
insert into cms_earmark_group 
(earmark_group_id, feed_id, source_system_id, cms_actual_holding, version_time, LAST_BATCH_UPDATE, total_no_of_units) 
select 20070101000000 + next value for CMS_EARMARK_GROUP_SEQ, cms_price_feed.feed_id, 'ARBS', 0, -1, current timestamp , 3000000  
from cms_price_feed where name = 'PetDag';

insert into cms_earmark_group 
(earmark_group_id, feed_id, source_system_id, cms_actual_holding, version_time, LAST_BATCH_UPDATE, total_no_of_units) 
select 20070101000000 + next value for CMS_EARMARK_GROUP_SEQ, cms_price_feed.feed_id, 'BOST', 0, -1, current timestamp ,  3900000  
from cms_price_feed where name = 'PetDag';

update cms_earmark_group set total_no_of_units=6000000 
where feed_id = (select feed_id from cms_price_feed where name = 'PetDag')
and source_system_id = 'STBG';

update cms_earmark_group set total_no_of_units=5000  
where feed_id = (select feed_id from cms_price_feed where name = 'CNLT')
and source_system_id = 'STBG';

update cms_earmark_group set total_no_of_units=24500000  
where feed_id = (select feed_id from cms_price_feed where name = 'Maybank')
and source_system_id = 'STBG';

update cms_earmark_group set total_no_of_units=748500    
where feed_id = (select feed_id from cms_price_feed where name = 'OpenSys')
and source_system_id = 'STBG';

update cms_earmark_group set total_no_of_units= 200000     
where feed_id = (select feed_id from cms_price_feed where name = 'Sateras')
and source_system_id = 'STBG';

update cms_earmark_group set total_no_of_units=  10750000 
where feed_id = (select feed_id from cms_price_feed where name = 'Shell')
and source_system_id = 'STBG';

update cms_earmark_group set total_no_of_units=1000000 
where feed_id = (select feed_id from cms_price_feed where name = 'Zecon')
and source_system_id = 'STBG';

update cms_earmark_group set total_no_of_units= 600000 
where feed_id = (select feed_id from cms_price_feed where name = 'Genting-CD')
and source_system_id = 'STBG';

update cms_earmark_group set total_no_of_units=  153000  
where feed_id = (select feed_id from cms_price_feed where name = 'Bursa-CF')
and source_system_id = 'STBG';

update cms_earmark_group set total_no_of_units= 40000  
where feed_id = (select feed_id from cms_price_feed where name = 'Tenaga-LA')
and source_system_id = 'STBG';

update cms_earmark_group set total_no_of_units= 400000
where feed_id = (select feed_id from cms_price_feed where name = 'Commerz-LA')
and source_system_id = 'STBG';

/*********************************** Patch for build #12 ends ********************************************/
