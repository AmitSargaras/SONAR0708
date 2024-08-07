-----------------------------
-- Cleanup
-----------------------------
DELETE FROM MAN_MIG_QC_REPORT;

-- AB100
call 'gen_mig_qc_report_2a'('AB100', 'TSPR','MG_AB100', 'CORPTSPRAB10002901');
call 'gen_mig_qc_report_2a'('AB100', 'QUAN','MG_AB100', 'CORPQUANAB10002901');

-- CS
call 'gen_mig_qc_report_2a'('CS', 'TSPR','MG_CS', 'CORPTSPRCS20202901');
call 'gen_mig_qc_report_2a'('CS', 'QUAN','MG_CS', 'CORPQUANAB10002901');

--DC
call 'gen_mig_qc_report_2a'('DC', 'TSPR','MG_DC', 'CORPTSPRDC30202901');
call 'gen_mig_qc_report_2a'('DC', 'QUAN','MG_DC', 'CORPQUANDC30202901');

-- GT
call 'gen_mig_qc_report_2a'('GT', 'TSPR','MG_GT', 'CORPTSPRGT40402901');
call 'gen_mig_qc_report_2a'('GT', 'QUAN','MG_GT', 'CORPQUANGT40402901');

-- OT
call 'gen_mig_qc_report_2a'('OT', 'TSPR','MG_OT', 'CORPTSPROT90002901');
call 'gen_mig_qc_report_2a'('OT', 'QUAN','MG_OT', 'CORPQUANOT90002901');

-- PT
call 'gen_mig_qc_report_2a'('PT', 'TSPR','MG_PT', 'CORPTSPRPT70102901');
call 'gen_mig_qc_report_2a'('PT', 'QUAN','MG_PT', 'CORPQUANPT70102901');

COMMIT;