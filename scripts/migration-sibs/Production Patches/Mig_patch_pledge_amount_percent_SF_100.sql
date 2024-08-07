/* Patching for pledge percentage where both amount and percentage was empty and application type = 'SF' */

-- Count 293
select aa.LLP_BCA_REF_NUM, sec.SCI_SECURITY_DTL_ID, lsm.CMS_COLLATERAL_ID, lsm.PLEDGE_AMOUNT, lsm.PLEDGE_AMOUNT_PERCENTAGE 
from SCI_LSP_LMT_PROFILE aa, SCI_LSP_APPR_LMTS lmt, CMS_LIMIT_SECURITY_MAP lsm, CMS_SECURITY sec
where aa.LLP_BCA_REF_NUM = lmt.LMT_BCA_REF_NUM
and lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
and lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
and sec.IS_MIGRATED_IND = 'Y'
and aa.APPLICATION_TYPE = 'SF'
and (lsm.PLEDGE_AMOUNT = 0 and lsm.PLEDGE_AMOUNT_PERCENTAGE = 0);

-- Count 293
select lsm.CMS_COLLATERAL_ID
from SCI_LSP_LMT_PROFILE aa, SCI_LSP_APPR_LMTS lmt, CMS_STAGE_LIMIT_SECURITY_MAP lsm, CMS_STAGE_SECURITY sec
where aa.LLP_BCA_REF_NUM = lmt.LMT_BCA_REF_NUM
and lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
and lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
and (char(sec.CMS_COLLATERAL_ID) like '20090801%' or char(sec.CMS_COLLATERAL_ID) like '20090808%')
and aa.APPLICATION_TYPE = 'SF'
and (lsm.PLEDGE_AMOUNT = 0 and lsm.PLEDGE_AMOUNT_PERCENTAGE = 0)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

update CMS_STAGE_LIMIT_SECURITY_MAP lsm
set lsm.PLEDGE_AMOUNT_PERCENTAGE = 100
where exists (
        select 1 from SCI_LSP_LMT_PROFILE aa, SCI_LSP_APPR_LMTS lmt, CMS_STAGE_SECURITY sec
        where aa.LLP_BCA_REF_NUM = lmt.LMT_BCA_REF_NUM
        and lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
        and lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
        and (char(sec.CMS_COLLATERAL_ID) like '20090801%' or char(sec.CMS_COLLATERAL_ID) like '20090808%')
        and aa.APPLICATION_TYPE = 'SF'
        and (lsm.PLEDGE_AMOUNT = 0 and lsm.PLEDGE_AMOUNT_PERCENTAGE = 0));		
		
update CMS_LIMIT_SECURITY_MAP lsm
set lsm.PLEDGE_AMOUNT_PERCENTAGE = 100
where exists (
        select 1 from SCI_LSP_LMT_PROFILE aa, SCI_LSP_APPR_LMTS lmt, CMS_SECURITY sec
        where aa.LLP_BCA_REF_NUM = lmt.LMT_BCA_REF_NUM
        and lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
        and lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
        and sec.IS_MIGRATED_IND = 'Y'
        and aa.APPLICATION_TYPE = 'SF'
        and (lsm.PLEDGE_AMOUNT = 0 and lsm.PLEDGE_AMOUNT_PERCENTAGE = 0));		