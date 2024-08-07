-----------------------------
-- QC 3
-----------------------------
-- Customer
export to QC_3_CV001SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CU001' AND RECORD_TYPE='Error' order by MIG_ID;

-- AA
export to QC_3_CV002SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA001' AND RECORD_TYPE='Error' order by MIG_ID;

-- JB
export to QC_3_CV003SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA002' AND RECORD_TYPE='Error' order by MIG_ID;


-----------------------------
-- QC 4
-----------------------------
-- Customer
export to QC_4_CV001SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CU001' AND RECORD_TYPE='IsValid' order by MIG_ID;

-- AA
export to QC_4_CV002SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA001' AND RECORD_TYPE='IsValid' order by MIG_ID;

-- JB
export to QC_4_CV003SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA002' AND RECORD_TYPE='IsValid' order by MIG_ID;


-----------------------------
-- QC 5
-----------------------------
-- Customer
export to QC_5_CV001SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CU001' AND RECORD_TYPE='Migrated' order by MIG_ID;

-- AA
export to QC_5_CV002SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA001' AND RECORD_TYPE='Migrated' order by MIG_ID;

-- JB
export to QC_5_CV003SIBS.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SIBS' AND INTERFACE_ID = 'CA002' AND RECORD_TYPE='Migrated' order by MIG_ID;
