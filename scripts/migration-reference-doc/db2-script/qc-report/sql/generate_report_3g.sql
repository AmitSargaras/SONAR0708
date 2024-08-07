export to QC_3g_ARBS_CA001.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'ARBS' AND INTERFACE_ID = 'CA001' AND RECORD_TYPE='ErrAA' order by MIG_ID;

export to QC_3g_SEMA_CA001.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'SEMA' AND INTERFACE_ID = 'CA001' AND RECORD_TYPE='ErrAA' order by MIG_ID;

export to QC_3g_BOST_CA001.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'BOST' AND INTERFACE_ID = 'CA001' AND RECORD_TYPE='ErrAA' order by MIG_ID;

export to QC_3g_FINS_CA001.csv of del modified by nochardel coldel0x2C select TEXT from MIG_QC_REPORT where SYSTEM_ID = 'FINS' AND INTERFACE_ID = 'CA001' AND RECORD_TYPE='ErrAA' order by MIG_ID;
