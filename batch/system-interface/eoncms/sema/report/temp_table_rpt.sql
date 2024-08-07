select 'Record loaded: ' || char(count(*)) as TEMPTABLE_CA002_INFO 
from SI_TEMP_SEMA_CA002 where IS_VALID = 'Y' union
select 'Record rejected: ' || char(count(*)) as TEMPTABLE_CA002_INFO 
from SI_TEMP_SEMA_CA002 where IS_VALID = 'N';


