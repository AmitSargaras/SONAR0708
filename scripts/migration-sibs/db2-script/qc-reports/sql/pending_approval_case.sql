-----------------------------
-- Cleanup
-----------------------------
-- DELETE FROM MIG_QC_REPORT;		//Use drop and recreate mig report - much faster

-----------------------------
-- Pending Approval Case
-----------------------------
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ShowDetail', 'CIF ID | Customer Name Short | AA Number | Limit ID | Facility Code | Facility Sequence ', 'SIBS', 'CA003');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT 'ShowDetail', COALESCE(lmp.LMP_LE_ID,'-') || ' | ' || COALESCE(lmp.LMP_SHORT_NAME,'-') || ' | ' || COALESCE(lmts.LMT_BCA_REF_NUM,'-') || ' | ' || COALESCE(lmts.LMT_ID,'-') || ' | ' || COALESCE(lmts.LMT_FAC_CODE,'-') || ' | ' || COALESCE(lmts.LMT_FAC_SEQ,'-'), 'SIBS', 'CA003' 
     from SCI_LE_MAIN_PROFILE lmp, SCI_LSP_APPR_LMTS lmts, CMS_FACILITY_MASTER fac, CMS_FAC_GENERAL facG where lmp.LMP_LE_ID = lmts.LMT_LE_ID and lmts.CMS_LSP_APPR_LMTS_ID = fac.CMS_LSP_APPR_LMTS_ID and fac.ID = facG.CMS_FAC_MASTER_ID and facG.FAC_STATUS_CODE_VALUE IN ('P','T'));


export to PENDING_APPROVAL_FACILTIY.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA003' AND RECORD_TYPE='ShowDetail' order by MIG_ID desc;
