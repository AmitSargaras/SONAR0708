export to QC_3c_ARBS_CA003.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'ARBS' AND INTERFACE_ID = 'CA003' AND RECORD_TYPE='ErrLMT' order by MIG_ID;

export to QC_3c_SEMA_CA012.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SEMA' AND INTERFACE_ID = 'CA012' AND RECORD_TYPE='ErrLMT' order by MIG_ID;

export to QC_3c_BOST_CA015.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'BOST' AND INTERFACE_ID = 'CA015' AND RECORD_TYPE='ErrLMT' order by MIG_ID;

export to QC_3c_FINS_CA017.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'FINS' AND INTERFACE_ID = 'CA017' AND RECORD_TYPE='ErrLMT' order by MIG_ID;

export to QC_3c_FINS_CA018.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'FINS' AND INTERFACE_ID = 'CA018' AND RECORD_TYPE='ErrLMT' order by MIG_ID;
