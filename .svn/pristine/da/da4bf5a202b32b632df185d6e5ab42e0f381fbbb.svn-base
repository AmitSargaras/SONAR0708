-- Security Allocation extraction
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP INDEX TEMP_IDX_001;
DROP INDEX TEMP_IDX_002;
DROP INDEX TEMP_IDX_003;
DROP INDEX TEMP_IDX_004;

CREATE UNIQUE INDEX TEMP_IDX_001 ON "SCI_LSP_APPR_LMTS" 
("CMS_LSP_APPR_LMTS_ID" ASC) 
INCLUDE ( "UPDATE_STATUS_IND") 
ALLOW REVERSE SCANS ; 

CREATE INDEX TEMP_IDX_002 ON "SCI_LSP_LMTS_XREF_MAP" 
("CMS_LSP_APPR_LMTS_ID" ASC, "UPDATE_STATUS_IND" ASC) 
ALLOW REVERSE SCANS ; 

CREATE INDEX TEMP_IDX_003 ON "CMS_LIMIT_SECURITY_MAP" 
("CMS_LSP_APPR_LMTS_ID" ASC, "SECURITY_ID" ASC, "SCI_LAS_BCA_REF_NUM" ASC, "SCI_LAS_LE_ID" ASC, "CMS_SEC_ALLOCATED_AMT" ASC) 
ALLOW REVERSE SCANS ; 

CREATE INDEX TEMP_IDX_004 ON "SCI_LSP_SYS_XREF" 
("CMS_OUTSTANDING_AMT" ASC, "LSX_EXT_SYS_ACCT_NUM" DESC) 
ALLOW REVERSE SCANS ; 

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sample A: Collateral Value < Account Outstanding
-- 1 Collateral, 1 Limit, 1 Account
----------------------------------------------------
select lsm2.SCI_LAS_LE_ID as CIF_ID, lsm2.SCI_LAS_BCA_REF_NUM as AA_NUMBER
from SCI_LSP_SYS_XREF acc, SCI_LSP_LMTS_XREF_MAP accmap,
    (select lsm1.CMS_LSP_APPR_LMTS_ID, lsm1.CMS_SEC_ALLOCATED_AMT, lsm1.SCI_LAS_LE_ID, lsm1.SCI_LAS_BCA_REF_NUM, sec.CMV
    from CMS_LIMIT_SECURITY_MAP lsm1, CMS_SECURITY sec 
    where lsm1.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
    and lsm1.CMS_LSP_APPR_LMTS_ID in 
        (select lmt.CMS_LSP_APPR_LMTS_ID from SCI_LSP_APPR_LMTS lmt, CMS_LIMIT_SECURITY_MAP lsm
                where lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
                and lsm.UPDATE_STATUS_IND <> 'D'
                and lmt.UPDATE_STATUS_IND <> 'D'
                group by lmt.CMS_LSP_APPR_LMTS_ID
                having count(lmt.CMS_LSP_APPR_LMTS_ID) = 1)) as lsm2
where acc.CMS_LSP_SYS_XREF_ID = accmap.CMS_LSP_SYS_XREF_ID
and accmap.CMS_LSP_APPR_LMTS_ID = lsm2.CMS_LSP_APPR_LMTS_ID
and accmap.UPDATE_STATUS_IND <> 'D'
and lsm2.CMV < acc.CMS_OUTSTANDING_AMT
group by lsm2.SCI_LAS_LE_ID, lsm2.SCI_LAS_BCA_REF_NUM
having count(*) = 1;

----------------------------------------------------
-- Sample B: Collateral Value > Account Outstanding
-- 1 Collateral, 1 Limit, 1 Account
----------------------------------------------------
select lsm2.SCI_LAS_LE_ID as CIF_ID, lsm2.SCI_LAS_BCA_REF_NUM as AA_NUMBER
from SCI_LSP_SYS_XREF acc, SCI_LSP_LMTS_XREF_MAP accmap,
    (select lsm1.CMS_LSP_APPR_LMTS_ID, lsm1.CMS_SEC_ALLOCATED_AMT, lsm1.SCI_LAS_LE_ID, lsm1.SCI_LAS_BCA_REF_NUM, sec.CMV
    from CMS_LIMIT_SECURITY_MAP lsm1, CMS_SECURITY sec 
    where lsm1.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
    and lsm1.CMS_LSP_APPR_LMTS_ID in 
        (select lmt.CMS_LSP_APPR_LMTS_ID from SCI_LSP_APPR_LMTS lmt, CMS_LIMIT_SECURITY_MAP lsm
                where lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
                and lsm.UPDATE_STATUS_IND <> 'D'
                and lmt.UPDATE_STATUS_IND <> 'D'
                group by lmt.CMS_LSP_APPR_LMTS_ID
                having count(lmt.CMS_LSP_APPR_LMTS_ID) = 1)) as lsm2
where acc.CMS_LSP_SYS_XREF_ID = accmap.CMS_LSP_SYS_XREF_ID
and accmap.CMS_LSP_APPR_LMTS_ID = lsm2.CMS_LSP_APPR_LMTS_ID
and accmap.UPDATE_STATUS_IND <> 'D'
and lsm2.CMV > acc.CMS_OUTSTANDING_AMT
group by lsm2.SCI_LAS_LE_ID, lsm2.SCI_LAS_BCA_REF_NUM
having count(*) = 1;

----------------------------------------------------
-- Sample C: Collateral Value > Account Outstanding
-- 1 Collateral, 1 Limit, MultiAccount
----------------------------------------------------
select lsm3.LMT_LE_ID as CIF_ID, lsm3.LMT_BCA_REF_NUM as AA_NUMBER from SCI_LSP_APPR_LMTS lsm3
where lsm3.CMS_LSP_APPR_LMTS_ID in
	(select accmap.CMS_LSP_APPR_LMTS_ID
	from SCI_LSP_SYS_XREF acc, SCI_LSP_LMTS_XREF_MAP accmap,
	    (select lsm1.CMS_LSP_APPR_LMTS_ID, lsm1.CMS_SEC_ALLOCATED_AMT, lsm1.SCI_LAS_LE_ID, lsm1.SCI_LAS_BCA_REF_NUM, sec.CMV 
	    from CMS_LIMIT_SECURITY_MAP lsm1, CMS_SECURITY sec 
	    where lsm1.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
        and lsm1.CMS_LSP_APPR_LMTS_ID in 
	        (select lmt.CMS_LSP_APPR_LMTS_ID from SCI_LSP_APPR_LMTS lmt, CMS_LIMIT_SECURITY_MAP lsm
	                where lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
	                and lsm.UPDATE_STATUS_IND <> 'D'
	                and lmt.UPDATE_STATUS_IND <> 'D'
	                group by lmt.CMS_LSP_APPR_LMTS_ID
	                having count(lmt.CMS_LSP_APPR_LMTS_ID) = 1)) as lsm2
	where acc.CMS_LSP_SYS_XREF_ID = accmap.CMS_LSP_SYS_XREF_ID
	and accmap.CMS_LSP_APPR_LMTS_ID = lsm2.CMS_LSP_APPR_LMTS_ID
	and accmap.UPDATE_STATUS_IND <> 'D'
	and lsm2.CMV > acc.CMS_OUTSTANDING_AMT
	group by accmap.CMS_LSP_APPR_LMTS_ID
	having count(accmap.CMS_LSP_APPR_LMTS_ID) > 1
	and count(accmap.CMS_LSP_SYS_XREF_ID) > 1);

----------------------------------------------------
-- Sample D: Collateral Value < Account Outstanding
-- 1 Collateral, 1 Limit, MultiAccount
----------------------------------------------------
select lsm3.LMT_LE_ID as CIF_ID, lsm3.LMT_BCA_REF_NUM as AA_NUMBER from SCI_LSP_APPR_LMTS lsm3
where lsm3.CMS_LSP_APPR_LMTS_ID in
	(select accmap.CMS_LSP_APPR_LMTS_ID
	from SCI_LSP_SYS_XREF acc, SCI_LSP_LMTS_XREF_MAP accmap,
	    (select lsm1.CMS_LSP_APPR_LMTS_ID, lsm1.CMS_SEC_ALLOCATED_AMT, lsm1.SCI_LAS_LE_ID, lsm1.SCI_LAS_BCA_REF_NUM, sec.CMV 
	    from CMS_LIMIT_SECURITY_MAP lsm1, CMS_SECURITY sec 
	    where lsm1.CMS_COLLATERAL_ID = sec.CMS_COLLATERAL_ID
        and lsm1.CMS_LSP_APPR_LMTS_ID in 
	        (select lmt.CMS_LSP_APPR_LMTS_ID from SCI_LSP_APPR_LMTS lmt, CMS_LIMIT_SECURITY_MAP lsm
	                where lmt.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
	                and lsm.UPDATE_STATUS_IND <> 'D'
	                and lmt.UPDATE_STATUS_IND <> 'D'
	                group by lmt.CMS_LSP_APPR_LMTS_ID
	                having count(lmt.CMS_LSP_APPR_LMTS_ID) = 1)) as lsm2
	where acc.CMS_LSP_SYS_XREF_ID = accmap.CMS_LSP_SYS_XREF_ID
	and accmap.CMS_LSP_APPR_LMTS_ID = lsm2.CMS_LSP_APPR_LMTS_ID
	and accmap.UPDATE_STATUS_IND <> 'D'
	and lsm2.CMV < acc.CMS_OUTSTANDING_AMT
	group by accmap.CMS_LSP_APPR_LMTS_ID
	having count(accmap.CMS_LSP_APPR_LMTS_ID) > 1
	and count(accmap.CMS_LSP_SYS_XREF_ID) > 1);

----------------------------------------------------	
-- Sample E: Collateral Value < Account Outstanding
-- 1 Collateral, Multi Limit, MultiAccount
----------------------------------------------------	
select lmt.LMT_LE_ID, lmt.LMT_BCA_REF_NUM 
from SCI_LSP_APPR_LMTS lmt, CMS_LIMIT_SECURITY_MAP lsm, SCI_LSP_LMTS_XREF_MAP accmap, SCI_LSP_SYS_XREF acc, CMS_SECURITY sec
where sec.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
and lsm.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID
and lmt.CMS_LSP_APPR_LMTS_ID = accmap.CMS_LSP_APPR_LMTS_ID
and accmap.CMS_LSP_SYS_XREF_ID = acc.CMS_LSP_SYS_XREF_ID
and lmt.CMS_LSP_APPR_LMTS_ID in (
    select lsm1.CMS_LSP_APPR_LMTS_ID from CMS_LIMIT_SECURITY_MAP lsm1
            where exists (select 1 from CMS_LIMIT_SECURITY_MAP templsm
                            where templsm.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
                            and templsm.UPDATE_STATUS_IND <> 'D'
                            group by templsm.CMS_COLLATERAL_ID 
                            having count(templsm.CMS_COLLATERAL_ID) > 1)    
            and exists (select 1 from CMS_LIMIT_SECURITY_MAP templsm
                            where templsm.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
                            and templsm.UPDATE_STATUS_IND <> 'D'
                            group by templsm.CMS_LSP_APPR_LMTS_ID 
                            having count(templsm.CMS_LSP_APPR_LMTS_ID) = 1))
    and lmt.CMS_LSP_APPR_LMTS_ID in (
    select accmap1.CMS_LSP_APPR_LMTS_ID from SCI_LSP_LMTS_XREF_MAP accmap1
        where exists (select 1 from SCI_LSP_LMTS_XREF_MAP tempaccmap
                        where tempaccmap.CMS_LSP_APPR_LMTS_ID = accmap.CMS_LSP_APPR_LMTS_ID
                        and tempaccmap.UPDATE_STATUS_IND <> 'D'
                        group by tempaccmap.CMS_LSP_APPR_LMTS_ID
                        having count(tempaccmap.CMS_LSP_APPR_LMTS_ID) > 1)
        and exists (select 1 from SCI_LSP_LMTS_XREF_MAP tempaccmap
                    where tempaccmap.CMS_LSP_SYS_XREF_ID = accmap.CMS_LSP_SYS_XREF_ID
                    and tempaccmap.UPDATE_STATUS_IND <> 'D'
                    group by tempaccmap.CMS_LSP_SYS_XREF_ID
                    having count(tempaccmap.CMS_LSP_SYS_XREF_ID) = 1))
and sec.CMV < acc.CMS_OUTSTANDING_AMT;

----------------------------------------------------	
-- Sample F: Collateral Value > Account Outstanding	
-- 1 Collateral, Multi Limit, MultiAccount
----------------------------------------------------		
select lmt.LMT_LE_ID, lmt.LMT_BCA_REF_NUM 
from SCI_LSP_APPR_LMTS lmt, CMS_LIMIT_SECURITY_MAP lsm, SCI_LSP_LMTS_XREF_MAP accmap, SCI_LSP_SYS_XREF acc, CMS_SECURITY sec
where sec.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
and lsm.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID
and lmt.CMS_LSP_APPR_LMTS_ID = accmap.CMS_LSP_APPR_LMTS_ID
and accmap.CMS_LSP_SYS_XREF_ID = acc.CMS_LSP_SYS_XREF_ID
and lmt.CMS_LSP_APPR_LMTS_ID in (
    select lsm1.CMS_LSP_APPR_LMTS_ID from CMS_LIMIT_SECURITY_MAP lsm1
            where exists (select 1 from CMS_LIMIT_SECURITY_MAP templsm
                            where templsm.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
                            and templsm.UPDATE_STATUS_IND <> 'D'
                            group by templsm.CMS_COLLATERAL_ID 
                            having count(templsm.CMS_COLLATERAL_ID) > 1)    
            and exists (select 1 from CMS_LIMIT_SECURITY_MAP templsm
                            where templsm.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
                            and templsm.UPDATE_STATUS_IND <> 'D'
                            group by templsm.CMS_LSP_APPR_LMTS_ID 
                            having count(templsm.CMS_LSP_APPR_LMTS_ID) = 1))
    and lmt.CMS_LSP_APPR_LMTS_ID in (
    select accmap1.CMS_LSP_APPR_LMTS_ID from SCI_LSP_LMTS_XREF_MAP accmap1
        where exists (select 1 from SCI_LSP_LMTS_XREF_MAP tempaccmap
                        where tempaccmap.CMS_LSP_APPR_LMTS_ID = accmap.CMS_LSP_APPR_LMTS_ID
                        and tempaccmap.UPDATE_STATUS_IND <> 'D'
                        group by tempaccmap.CMS_LSP_APPR_LMTS_ID
                        having count(tempaccmap.CMS_LSP_APPR_LMTS_ID) > 1)
        and exists (select 1 from SCI_LSP_LMTS_XREF_MAP tempaccmap
                    where tempaccmap.CMS_LSP_SYS_XREF_ID = accmap.CMS_LSP_SYS_XREF_ID
                    and tempaccmap.UPDATE_STATUS_IND <> 'D'
                    group by tempaccmap.CMS_LSP_SYS_XREF_ID
                    having count(tempaccmap.CMS_LSP_SYS_XREF_ID) > 1))
and sec.CMV > acc.CMS_OUTSTANDING_AMT;
	
----------------------------------------------------	
-- Sample G: Collateral Value > Account Outstanding
-- Multi Collateral, 1 Limit, MultiAccount
----------------------------------------------------		
select lmt.LMT_LE_ID, lmt.LMT_BCA_REF_NUM 
from SCI_LSP_APPR_LMTS lmt, CMS_LIMIT_SECURITY_MAP lsm, SCI_LSP_LMTS_XREF_MAP accmap, SCI_LSP_SYS_XREF acc, CMS_SECURITY sec
where sec.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
and lsm.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID
and lmt.CMS_LSP_APPR_LMTS_ID = accmap.CMS_LSP_APPR_LMTS_ID
and accmap.CMS_LSP_SYS_XREF_ID = acc.CMS_LSP_SYS_XREF_ID
and lmt.CMS_LSP_APPR_LMTS_ID in (
    select lsm1.CMS_LSP_APPR_LMTS_ID from CMS_LIMIT_SECURITY_MAP lsm1
            where exists (select 1 from CMS_LIMIT_SECURITY_MAP templsm
                            where templsm.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
                            and templsm.UPDATE_STATUS_IND <> 'D'
                            group by templsm.CMS_COLLATERAL_ID 
                            having count(templsm.CMS_COLLATERAL_ID) = 1)    
            and exists (select 1 from CMS_LIMIT_SECURITY_MAP templsm
                            where templsm.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
                            and templsm.UPDATE_STATUS_IND <> 'D'
                            group by templsm.CMS_LSP_APPR_LMTS_ID 
                            having count(templsm.CMS_LSP_APPR_LMTS_ID) > 1))
    and lmt.CMS_LSP_APPR_LMTS_ID in (
    select accmap1.CMS_LSP_APPR_LMTS_ID from SCI_LSP_LMTS_XREF_MAP accmap1
        where exists (select 1 from SCI_LSP_LMTS_XREF_MAP tempaccmap
                        where tempaccmap.CMS_LSP_APPR_LMTS_ID = accmap.CMS_LSP_APPR_LMTS_ID
                        and tempaccmap.UPDATE_STATUS_IND <> 'D'
                        group by tempaccmap.CMS_LSP_APPR_LMTS_ID
                        having count(tempaccmap.CMS_LSP_APPR_LMTS_ID) = 1)
        and exists (select 1 from SCI_LSP_LMTS_XREF_MAP tempaccmap
                    where tempaccmap.CMS_LSP_SYS_XREF_ID = accmap.CMS_LSP_SYS_XREF_ID
                    and tempaccmap.UPDATE_STATUS_IND <> 'D'
                    group by tempaccmap.CMS_LSP_SYS_XREF_ID
                    having count(tempaccmap.CMS_LSP_SYS_XREF_ID) = 1))
and sec.CMV > acc.CMS_OUTSTANDING_AMT;
	
----------------------------------------------------	
-- Sample H: Collateral Value < Account Outstanding
-- Multi Collateral, 1 Limit, MultiAccount
----------------------------------------------------			
select lmt.LMT_LE_ID, lmt.LMT_BCA_REF_NUM 
from SCI_LSP_APPR_LMTS lmt, CMS_LIMIT_SECURITY_MAP lsm, SCI_LSP_LMTS_XREF_MAP accmap, SCI_LSP_SYS_XREF acc, CMS_SECURITY sec
where sec.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
and lsm.CMS_LSP_APPR_LMTS_ID = lmt.CMS_LSP_APPR_LMTS_ID
and lmt.CMS_LSP_APPR_LMTS_ID = accmap.CMS_LSP_APPR_LMTS_ID
and accmap.CMS_LSP_SYS_XREF_ID = acc.CMS_LSP_SYS_XREF_ID
and lmt.CMS_LSP_APPR_LMTS_ID in (
    select lsm1.CMS_LSP_APPR_LMTS_ID from CMS_LIMIT_SECURITY_MAP lsm1
            where exists (select 1 from CMS_LIMIT_SECURITY_MAP templsm
                            where templsm.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID
                            and templsm.UPDATE_STATUS_IND <> 'D'
                            group by templsm.CMS_COLLATERAL_ID 
                            having count(templsm.CMS_COLLATERAL_ID) = 1)    
            and exists (select 1 from CMS_LIMIT_SECURITY_MAP templsm
                            where templsm.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
                            and templsm.UPDATE_STATUS_IND <> 'D'
                            group by templsm.CMS_LSP_APPR_LMTS_ID 
                            having count(templsm.CMS_LSP_APPR_LMTS_ID) > 1))
    and lmt.CMS_LSP_APPR_LMTS_ID in (
    select accmap1.CMS_LSP_APPR_LMTS_ID from SCI_LSP_LMTS_XREF_MAP accmap1
        where exists (select 1 from SCI_LSP_LMTS_XREF_MAP tempaccmap
                        where tempaccmap.CMS_LSP_APPR_LMTS_ID = accmap.CMS_LSP_APPR_LMTS_ID
                        and tempaccmap.UPDATE_STATUS_IND <> 'D'
                        group by tempaccmap.CMS_LSP_APPR_LMTS_ID
                        having count(tempaccmap.CMS_LSP_APPR_LMTS_ID) = 1)
        and exists (select 1 from SCI_LSP_LMTS_XREF_MAP tempaccmap
                    where tempaccmap.CMS_LSP_SYS_XREF_ID = accmap.CMS_LSP_SYS_XREF_ID
                    and tempaccmap.UPDATE_STATUS_IND <> 'D'
                    group by tempaccmap.CMS_LSP_SYS_XREF_ID
                    having count(tempaccmap.CMS_LSP_SYS_XREF_ID) = 1))
and sec.CMV > acc.CMS_OUTSTANDING_AMT;	

