-- Convert customer profit rate to (values * 100) for those migrated data only.

-- create the temp field (actual)
alter table CMS_FAC_ISLAMIC_MASTER
add column CUSTOMER_INTEREST_RATE_TEMP DECIMAL (11,7);

-- create the temp field (staging)
alter table CMS_STG_FAC_ISLAMIC_MASTER
add column CUSTOMER_INTEREST_RATE_TEMP DECIMAL (11,7);

-- copy value * 100 to temp field (actual)
update CMS_FAC_ISLAMIC_MASTER a
set CUSTOMER_INTEREST_RATE_TEMP = (select (b.CUSOTMER_INTEREST_RATE * 100) from CMS_FAC_ISLAMIC_MASTER b
                                    where a.CMS_FAC_MASTER_ID = b.CMS_FAC_MASTER_ID)
where char(CMS_FAC_MASTER_ID) like '20090801%';

-- copy value * 100 to temp field (staging)
update CMS_STG_FAC_ISLAMIC_MASTER a
set CUSTOMER_INTEREST_RATE_TEMP = (select (b.CUSOTMER_INTEREST_RATE * 100) from CMS_STG_FAC_ISLAMIC_MASTER b
                                    where a.CMS_FAC_MASTER_ID = b.CMS_FAC_MASTER_ID)
where char(CMS_FAC_MASTER_ID) like '20090801%';

-- update fac master (actual) interest rate to blank
update CMS_FAC_ISLAMIC_MASTER
set CUSOTMER_INTEREST_RATE = null
where char(CMS_FAC_MASTER_ID) like '20090801%';

-- update fac master (staging) interest rate to blank
update CMS_STG_FAC_ISLAMIC_MASTER
set CUSOTMER_INTEREST_RATE = null
where char(CMS_FAC_MASTER_ID) like '20090801%';

-- Update the correct value to CUSTOMER_INTEREST_RATE (actual)
update CMS_FAC_ISLAMIC_MASTER a
set CUSOTMER_INTEREST_RATE = (select b.CUSTOMER_INTEREST_RATE_TEMP from CMS_FAC_ISLAMIC_MASTER b
                                    where a.CMS_FAC_MASTER_ID = b.CMS_FAC_MASTER_ID)
where char(CMS_FAC_MASTER_ID) like '20090801%';

-- Update the correct value to CUSTOMER_INTEREST_RATE (actual)
update CMS_STG_FAC_ISLAMIC_MASTER a
set CUSOTMER_INTEREST_RATE = (select b.CUSTOMER_INTEREST_RATE_TEMP from CMS_FAC_ISLAMIC_MASTER b
                                    where a.CMS_FAC_MASTER_ID = b.CMS_FAC_MASTER_ID)
where char(CMS_FAC_MASTER_ID) like '20090801%';

-- drop the temp field (actual)
alter table CMS_FAC_ISLAMIC_MASTER
drop column CUSTOMER_INTEREST_RATE_TEMP;

-- drop the temp field (staging)
alter table CMS_STG_FAC_ISLAMIC_MASTER
drop column CUSTOMER_INTEREST_RATE_TEMP;

call admin_cmd(' reorg table CMS_FAC_ISLAMIC_MASTER ');
call admin_cmd(' reorg table CMS_STG_FAC_ISLAMIC_MASTER ');