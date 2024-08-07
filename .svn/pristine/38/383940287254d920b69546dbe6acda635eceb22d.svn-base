-----------------------------
-- Cleanup
-----------------------------
DELETE FROM MAN_MIG_QC_REPORT;

---------------------------------------
--Generate migration report 3d
----------------------------------------
-- AB100
call 'gen_mig_qc_report_5'('AB100', 'TSPR','MG_AB100', 'CORPTSPRAB10002901');
call 'gen_mig_qc_report_5'('AB100', 'QUAN','MG_AB100', 'CORPQUANAB10002901');

-- CS
call 'gen_mig_qc_report_5'('CS', 'TSPR','MG_CS', 'CORPTSPRCS20202901');
call 'gen_mig_qc_report_5'('CS', 'QUAN','MG_CS', 'CORPQUANAB10002901');

--DC
call 'gen_mig_qc_report_5'('DC', 'TSPR','MG_DC', 'CORPTSPRDC30202901');
call 'gen_mig_qc_report_5'('DC', 'QUAN','MG_DC', 'CORPQUANDC30202901');

-- GT
call 'gen_mig_qc_report_5'('GT', 'TSPR','MG_GT', 'CORPTSPRGT40402901');
call 'gen_mig_qc_report_5'('GT', 'QUAN','MG_GT', 'CORPQUANGT40402901');

-- OT
call 'gen_mig_qc_report_5'('OT', 'TSPR','MG_OT', 'CORPTSPROT90002901');
call 'gen_mig_qc_report_5'('OT', 'QUAN','MG_OT', 'CORPQUANOT90002901');

-- PT
call 'gen_mig_qc_report_5'('PT', 'TSPR','MG_PT', 'CORPTSPRPT70102901');
call 'gen_mig_qc_report_5'('PT', 'QUAN','MG_PT', 'CORPQUANPT70102901');

COMMIT;