/* Patch charge security rank from 0 to rank =1  for personal guarantee */

-- Count: 60
select sec.CMS_COLLATERAL_ID, sec.SCI_SECURITY_DTL_ID, lmt.LMT_BCA_REF_NUM, lmt.LOS_BCA_REF_NUM, lmt.SOURCE_ID, chrg.SECURITY_RANK
from CMS_SECURITY sec, CMS_CHARGE_DETAIL chrg, CMS_LIMIT_SECURITY_MAP lsm, SCI_LSP_APPR_LMTS lmt
where lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
and lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
and sec.CMS_COLLATERAL_ID = chrg.CMS_COLLATERAL_ID
and sec.SECURITY_SUB_TYPE_ID = 'GT408'
and chrg.SECURITY_RANK = 0;

-- Count: 140
select sec.CMS_COLLATERAL_ID, sec.SCI_SECURITY_DTL_ID, lmt.LMT_BCA_REF_NUM, lmt.LOS_BCA_REF_NUM, lmt.SOURCE_ID, chrg.SECURITY_RANK
from CMS_STAGE_SECURITY sec, CMS_STAGE_CHARGE_DETAIL chrg, CMS_STAGE_LIMIT_SECURITY_MAP lsm, SCI_LSP_APPR_LMTS lmt
where lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
and lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
and sec.CMS_COLLATERAL_ID = chrg.CMS_COLLATERAL_ID
and sec.SECURITY_SUB_TYPE_ID = 'GT408'
and chrg.SECURITY_RANK = 0;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select CMS_COLLATERAL_ID, SECURITY_RANK from cms_charge_detail 
where CMS_COLLATERAL_ID in (20090811001176980, 20090925001233019, 20090903001206322);
select CMS_COLLATERAL_ID, SECURITY_RANK from cms_stage_charge_detail 
where CMS_COLLATERAL_ID in (20090512000008123, 20090513000008285, 20090906001210245);
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

update CMS_CHARGE_DETAIL chrg
set SECURITY_RANK = 1
where exists (select 1 from CMS_SECURITY sec, CMS_LIMIT_SECURITY_MAP lsm, SCI_LSP_APPR_LMTS lmt
                where lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
                and lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
                and sec.CMS_COLLATERAL_ID = chrg.CMS_COLLATERAL_ID
                and sec.SECURITY_SUB_TYPE_ID = 'GT408'
                and chrg.SECURITY_RANK = 0);

update CMS_STAGE_CHARGE_DETAIL chrg
set SECURITY_RANK = 1
where exists (select 1 from CMS_STAGE_SECURITY sec, CMS_STAGE_LIMIT_SECURITY_MAP lsm, SCI_LSP_APPR_LMTS lmt
                where lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
                and lsm.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
                and sec.CMS_COLLATERAL_ID = chrg.CMS_COLLATERAL_ID
                and sec.SECURITY_SUB_TYPE_ID = 'GT408'
                and chrg.SECURITY_RANK = 0);