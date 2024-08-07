select 'Record loaded: ' || char(count(*)) as TEMPTABLE_CUSTOMER_INFO 
from SI_TEMP_MIMB_CU002 where IS_VALID = 'Y' union
select 'Record rejected: ' || char(count(*)) as TEMPTABLE_CUSTOMER_INFO 
from SI_TEMP_MIMB_CU002 where IS_VALID = 'N';

select 'Record loaded: ' || char(count(*)) as TEMPTABLE_LIMIT_INFO 
from SI_TEMP_MIMB_CA003 where IS_VALID = 'Y' union
select 'Record rejected: ' || char(count(*)) as TEMPTABLE_LIMIT_INFO 
from SI_TEMP_MIMB_CA003 where IS_VALID = 'N';

select 'Record loaded: ' || char(count(*)) as TEMPTABLE_MARKETABLE_SEC
from SI_TEMP_MIMB_CO003 where IS_VALID = 'Y' union
select 'Record rejected: ' || char(count(*)) as TEMPTABLE_MARKETABLE_SEC 
from SI_TEMP_MIMB_CO003 where IS_VALID = 'N';

select 'Record loaded: ' || char(count(*)) as TEMPTABLE_COLLATERAL_CASH
from SI_TEMP_MIMB_CO004 where IS_VALID = 'Y' union
select 'Record rejected: ' || char(count(*)) as TEMPTABLE_COLLATERAL_CASH 
from SI_TEMP_MIMB_CO004 where IS_VALID = 'N';

select 'Record loaded: ' || char(count(*)) as TEMPTABLE_PRICE_FEED
from SI_TEMP_MIMB_PF002 where IS_VALID = 'Y' union
select 'Record rejected: ' || char(count(*)) as TEMPTABLE_PRICE_FEED 
from SI_TEMP_MIMB_PF002 where IS_VALID = 'N';