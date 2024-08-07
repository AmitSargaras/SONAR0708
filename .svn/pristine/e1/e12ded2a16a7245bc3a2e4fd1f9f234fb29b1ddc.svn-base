#!/bin/sh

. /opt/IBM/WebSphere/cmsuat/batch/setclassenv.sh
SOURCE_PATH=/opt/IBM/WebSphere/cmsuat/simessage/sibs

# INTEGRO_HOME property must not be empty.
if test "$INTEGRO_HOME" = ""; then
    echo "INTEGRO_HOME property must not be empty.";
    exit 1;
fi

# JAVA_HOME property must not be empty.
if test "$JAVA_HOME" = ""; then
    echo "JAVA_HOME property must not be empty.";
    exit 1;
fi

# WEBSPHERE_HOME property must not be empty.
if test "$WEBSPHERE_HOME" = ""; then
    echo "WEBSPHERE_HOME property must not be empty.";
    exit 1;
fi

# ----------- Ftp Batch File ----------- incoming
. /opt/IBM/WebSphere/cmsuat/batch/system-interface/cms_ftp.sh incoming /data/cmsuat/simessage/sibs /opt/IBM/WebSphere/cmsuat/simessage/sibs

# ----------- START SIBS CU003 -------------
. /opt/IBM/WebSphere/cmsuat/batch/set_si_env.sh $SOURCE_PATH/CU003SIBS
IS_PROCEED_CU003=$IS_PROCEED
# ----------- END SIBS CU003 ---------------

# ----------- START SIBS CU001 -------------
. /opt/IBM/WebSphere/cmsuat/batch/set_si_env.sh $SOURCE_PATH/CU001SIBS
IS_PROCEED_CU001=$IS_PROCEED
# ----------- END SIBS CU001 ---------------

# ----------- START SIBS CA001 -------------
. /opt/IBM/WebSphere/cmsuat/batch/set_si_env.sh $SOURCE_PATH/CA001SIBS

if [ -e $FILE_PATH.ht ]; then
	. /opt/IBM/WebSphere/cmsuat/batch/hash_total.sh check $FILE_PATH $FILE_PATH.ht 129,17 146,18
fi
IS_PROCEED_CA001=$IS_PROCEED
# ----------- END SIBS CA001 ---------------

# ----------- START SIBS CA004 -------------
. /opt/IBM/WebSphere/cmsuat/batch/set_si_env.sh $SOURCE_PATH/CA004SIBS
IS_PROCEED_CA004=$IS_PROCEED
# ----------- END SIBS CA004 ---------------

# ----------- START SIBS CO001 -------------
. /opt/IBM/WebSphere/cmsuat/batch/set_si_env.sh $SOURCE_PATH/CO001SIBS

if [ -e $FILE_PATH.ht ]; then
	. /opt/IBM/WebSphere/cmsuat/batch/hash_total.sh check $FILE_PATH $FILE_PATH.ht 40,19 63,17
fi
IS_PROCEED_CO001=$IS_PROCEED
# ----------- END SIBS CO001 ---------------

# ----------- START SIBS CO002 -------------
. /opt/IBM/WebSphere/cmsuat/batch/set_si_env.sh $SOURCE_PATH/CO002SIBS

if [ -e $FILE_PATH.ht ]; then
	. /opt/IBM/WebSphere/cmsuat/batch/hash_total.sh check $FILE_PATH $FILE_PATH.ht 2,19 91,17
fi
IS_PROCEED_CO002=$IS_PROCEED
# ----------- END SIBS CO002 ---------------

# ---------------------------------------------------------------------------------------------------------

echo "[Info] -- Process SIBS CU003 Batch Job ?? -- $IS_PROCEED_CU003";
echo "[Info] -- Process SIBS CU001 Batch Job ?? -- $IS_PROCEED_CU001";
echo "[Info] -- Process SIBS CA001 Batch Job ?? -- $IS_PROCEED_CA001";
echo "[Info] -- Process SIBS CA004 Batch Job ?? -- $IS_PROCEED_CA004";
echo "[Info] -- Process SIBS CO001 Batch Job ?? -- $IS_PROCEED_CO001";
echo "[Info] -- Process SIBS CO002 Batch Job ?? -- $IS_PROCEED_CO002";


if [ ! "$IS_PROCEED_CU003" = "true" ]; then
    echo "[Info] -- Exit SIBS CU003 Batch Job ! --";
else
    echo "[Info] -- Process SIBS CU003 Batch Job ! --";
    "$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient sibsCustomerFusinFeedsLoaderBatchJob;
fi

if [ ! "$IS_PROCEED_CU001" = "true" ]; then
    echo "[Info] -- Exit SIBS CU001 Batch Job ! --";
else
    echo "[Info] -- Process SIBS CU001 Batch Job ! --";
    "$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient sibsCustomerUpdateFeedsLoaderBatchJob;
fi

if [ ! "$IS_PROCEED_CA001" = "true" ]; then
    echo "[Info] -- Exit SIBS CA001 Batch Job ! --";
else
    echo "[Info] -- Process SIBS CA001 Batch Job ! --";
    "$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient sibsOverdrafAndTermLoanFeedsLoaderBatchJob;
fi

if [ ! "$IS_PROCEED_CA004" = "true" ]; then
    echo "[Info] -- Exit SIBS CA004 Batch Job ! --";
else
    echo "[Info] -- Process SIBS CA004 Batch Job ! --";
    "$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient sibsClosedAndNplAccountFeedsLoaderBatchJob;
fi

if [ ! "$IS_PROCEED_CO001" = "true" ]; then
    echo "[Info] -- Exit SIBS CO001 Batch Job ! --";
else
    echo "[Info] -- Process SIBS CO001 Batch Job ! --";
    "$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient sibsFixedDepositFeedsLoaderBatchJob;
fi

if [ ! "$IS_PROCEED_CO002" = "true" ]; then
    echo "[Info] -- Exit SIBS CO002 Batch Job ! --";
else
    echo "[Info] -- Process SIBS CO002 Batch Job ! --";
    "$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient sibsShareMarginFinanceFeedsLoaderBatchJob
fi
