-----------------------------
-- Cleanup
-----------------------------
DELETE FROM MIG_QC_REPORT;

-----------------------------
-- STBG CO022
-----------------------------
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrAcc', 'QC Report 3a for Migration - Settlement Account No not matched between ARBS and Stock Banking', 'STBG', 'CO022');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrAcc', 'Report for migration template: CO022', 'STBG', 'CO022');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrAcc', 'Report Date: ' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), 'STBG', 'CO022');
INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ('ErrAcc', 'Settlement Account No', 'STBG', 'CO022');

INSERT INTO MIG_QC_REPORT (RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID)
	(SELECT DISTINCT 'ErrAcc', '''' || KEY1_VALUE, 'STBG', 'CO022' FROM SI_ERROR_LOG WHERE SYSTEM_ID = 'STBG' AND INTERFACE_ID= 'CO022' AND ERROR_CODE = 'BizErr003');

COMMIT;
