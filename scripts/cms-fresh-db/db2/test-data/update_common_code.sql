delete from common_code_category_entry ccce 
where exists (select 1 
	from common_code_category ccc 
	where ccc.category_code = ccce.category_code and ccc.category_type in ( 3, 4) fetch first rows only) 
and ccce.entry_source = 'ARBS';


insert into common_code_category_entry 
	(entry_id, entry_code, entry_name,  ref_entry_code, entry_source, active_status, country, category_code, category_code_id)
select next value for common_code_category_entry_seq, entry_code, entry_name, ref_entry_code, entry_source, ce.active_status, country, 
	ce.category_code, category_id
from temp_common_code_category_entry ce, common_code_category cc
where cc.category_type in (3,4)
and cc.category_code = ce.category_code
and ce.category_code <> 'PRODUCT_TYPE'
and ce.entry_source = 'ARBS';

-- set all branches to tie to KL centre (18)
update COMMON_CODE_CATEGORY_ENTRY set REF_ENTRY_CODE = '18' where CATEGORY_CODE = '40';

--------------------------------------------
-- setup sys admin team organisation code
--------------------------------------------
insert into cms_team_organisation_code
select 20070101000000 + next value for TEAM_ORGANISATION_SEQ, entry_code, 20070101000001
from common_code_category_entry where category_code = '40';
	
insert into stage_team_organisation_code
select 20070101000000 + next value for TEAM_ORGANISATION_SEQ, entry_code, 20070101000001
from common_code_category_entry where category_code = '40';

insert into cms_team_org_group_code
select 20070101000000 + next value for TEAM_ORG_GROUP_CODE_SEQ, entry_code, 20070101000001
from common_code_category_entry where category_code = 'CENTRE';

insert into stage_team_org_group_code
select 20070101000000 + next value for TEAM_ORG_GROUP_CODE_SEQ, entry_code, 20070101000001
from common_code_category_entry where category_code = 'CENTRE';