-----------------------------
-- Cleanup
-----------------------------
DELETE FROM MAN_MIG_QC_REPORT;

---------------------------------------
--Generate migration report 3d
----------------------------------------
-- AB100
call 'gen_mig_qc_report_3d'('AB100', 'TSPR','MG_AB100', 'CORPTSPRAB10002901');
call 'gen_mig_qc_report_3d'('AB100', 'QUAN','MG_AB100', 'CORPQUANAB10002901');

-- CS
call 'gen_mig_qc_report_3d'('CS', 'TSPR','MG_CS', 'CORPTSPRCS20202901');
call 'gen_mig_qc_report_3d'('CS', 'QUAN','MG_CS', 'CORPQUANAB10002901');

--DC
call 'gen_mig_qc_report_3d'('DC', 'TSPR','MG_DC', 'CORPTSPRDC30202901');
call 'gen_mig_qc_report_3d'('DC', 'QUAN','MG_DC', 'CORPQUANDC30202901');

-- GT
call 'gen_mig_qc_report_3d'('GT', 'TSPR','MG_GT', 'CORPTSPRGT40402901');
call 'gen_mig_qc_report_3d'('GT', 'QUAN','MG_GT', 'CORPQUANGT40402901');

-- OT
call 'gen_mig_qc_report_3d'('OT', 'TSPR','MG_OT', 'CORPTSPROT90002901');
call 'gen_mig_qc_report_3d'('OT', 'QUAN','MG_OT', 'CORPQUANOT90002901');

-- PT
call 'gen_mig_qc_report_3d'('PT', 'TSPR','MG_PT', 'CORPTSPRPT70102901');
call 'gen_mig_qc_report_3d'('PT', 'QUAN','MG_PT', 'CORPQUANPT70102901');

COMMIT;
