/* Patch approved limit from 341106 to 341016 due to user input error in SIBS but migrated */

update SCI_LSP_APPR_LMTS
set LMT_AMT = 341016
where LMT_LE_ID = '160087603';

update STAGE_LIMIT
set LMT_AMT = 341016
where LMT_LE_ID = '160087603';

commit;