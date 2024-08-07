-----------------------------
-- QC 3
-----------------------------
-- VL
export to QC_3_CV031SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO015' AND RECORD_TYPE='Error' order by MIG_ID;

-- INS Policy
export to QC_3_CV032SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO016' AND RECORD_TYPE='Error' order by MIG_ID;

-- CD
export to QC_3_CV033SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO017' AND RECORD_TYPE='Error' order by MIG_ID;

-- Pledgor
export to QC_3_CV034SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO018' AND RECORD_TYPE='Error' order by MIG_ID;

-- Pledge
export to QC_3_CV035SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO019' AND RECORD_TYPE='Error' order by MIG_ID;


-----------------------------
-- QC 4
-----------------------------
-- VL
export to QC_4_CV031SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO015' AND RECORD_TYPE='IsValid' order by MIG_ID;

-- INS Policy
export to QC_4_CV032SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO016' AND RECORD_TYPE='IsValid' order by MIG_ID;

-- CD
export to QC_4_CV033SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO017' AND RECORD_TYPE='IsValid' order by MIG_ID;

-- Pledgor
export to QC_4_CV034SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO018' AND RECORD_TYPE='IsValid' order by MIG_ID;

-- Pledge
export to QC_4_CV035SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO019' AND RECORD_TYPE='IsValid' order by MIG_ID;


-----------------------------
-- QC 5
-----------------------------
-- VL
export to QC_5_CV031SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO015' AND RECORD_TYPE='Migrated' order by MIG_ID;

-- INS Policy
export to QC_5_CV032SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO016' AND RECORD_TYPE='Migrated' order by MIG_ID;

-- CD
export to QC_5_CV033SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO017' AND RECORD_TYPE='Migrated' order by MIG_ID;

-- Pledgor
export to QC_5_CV034SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO018' AND RECORD_TYPE='Migrated' order by MIG_ID;

-- Pledge
export to QC_5_CV035SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CO019' AND RECORD_TYPE='Migrated' order by MIG_ID;

