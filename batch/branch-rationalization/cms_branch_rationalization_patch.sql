-- patched AA No = 1414900002400093577, Branch No = 84 changed to 79.

update SCI_LSP_LMT_PROFILE set CMS_ORIG_ORGANISATION = '079'
where LLP_BCA_REF_NUM = '1414900002400093577'
and source_id = 'ARBS';

update STAGE_LIMIT_PROFILE set CMS_ORIG_ORGANISATION = '079'
where LLP_BCA_REF_NUM = '1414900002400093577'
and source_id = 'ARBS';


