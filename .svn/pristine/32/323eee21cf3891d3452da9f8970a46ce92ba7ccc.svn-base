#!/bin/sh

. /opt/IBM/WebSphere/cmsuat/batch/setclassenv.sh
SOURCE_PATH=/opt/IBM/WebSphere/cmsuat/simessage/mimb
FILE_TYPE=csv

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
. /opt/IBM/WebSphere/cmsuat/batch/system-interface/cms_ftp.sh incoming /data/cmsuat/simessage/mimb /opt/IBM/WebSphere/cmsuat/simessage/mimb

## ----------- START MIMB CU002 -------------
. /opt/IBM/WebSphere/cmsuat/batch/set_si_env.sh $SOURCE_PATH/CU002MIM $FILE_TYPE
IS_PROCEED_CU002=$IS_PROCEED 
## ----------- END MIMB CU002 ---------------

## ----------- START MIMB CA003 -------------
. /opt/IBM/WebSphere/cmsuat/batch/set_si_env.sh $SOURCE_PATH/CA003MIM $FILE_TYPE
if [ -e $FILE_PATH.ht ]; then
	. /opt/IBM/WebSphere/cmsuat/batch/hash_total.sh check $FILE_PATH $FILE_PATH.ht 8 9 10:11
fi
IS_PROCEED_CA003=$IS_PROCEED 
## ----------- END MIMB CA003 ---------------

## ----------- START MIMB CO003 -------------
. /opt/IBM/WebSphere/cmsuat/batch/set_si_env.sh $SOURCE_PATH/CO003MIM $FILE_TYPE
if [ -e $FILE_PATH.ht ]; then
	. /opt/IBM/WebSphere/cmsuat/batch/hash_total.sh check $FILE_PATH $FILE_PATH.ht 24
fi
IS_PROCEED_CO003=$IS_PROCEED 
## ----------- END MIMB CO003 ---------------

## ----------- START MIMB CO004 -------------
. /opt/IBM/WebSphere/cmsuat/batch/set_si_env.sh $SOURCE_PATH/CO004MIM $FILE_TYPE
if [ -e $FILE_PATH.ht ]; then
	. /opt/IBM/WebSphere/cmsuat/batch/hash_total.sh check $FILE_PATH $FILE_PATH.ht 18
fi
IS_PROCEED_CO004=$IS_PROCEED 
## ----------- END MIMB CO004 ---------------

# ---------------------------------------------------------------------------------------------------------
if [ ! "$IS_PROCEED_CU002" = "true" ]; then
	IS_PROCEED_CA003="false";
	IS_PROCEED_CO003="false";
	IS_PROCEED_CO004="false";
fi
if [ ! "$IS_PROCEED_CA003" = "true" ]; then
	IS_PROCEED_CO003="false";
	IS_PROCEED_CO004="false";
fi

echo "[Info] -- Process SIBS CU002 Batch Job ?? -- $IS_PROCEED_CU002";
echo "[Info] -- Process SIBS CA003 Batch Job ?? -- $IS_PROCEED_CA003";
echo "[Info] -- Process SIBS CO003 Batch Job ?? -- $IS_PROCEED_CO003";
echo "[Info] -- Process SIBS CO004 Batch Job ?? -- $IS_PROCEED_CO004";

if [ ! "$IS_PROCEED_CU002" = "true" ]; then
    echo "[Info] -- Exit SIBS CU002 Batch Job ! --";
else
    echo "[Info] -- Process SIBS CU002 Batch Job ! --";
    "$JAVA_HOME"/bin/java $JAVA_OPTS -classpath $CLASSPATH com.integrosys.cms.ui.eventmonitor.EventMonitorClient mimbCustomerInfoLoaderBatchJob;
	
	if [ ! "$IS_PROCEED_CA003" = "true" ]; then
	    echo "[Info] -- Exit SIBS CA003 Batch Job ! --";
	else
	    echo "[Info] -- Process SIBS CA003 Batch Job ! --";
	    "$JAVA_HOME"/bin/java $JAVA_OPTS -classpath $CLASSPATH com.integrosys.cms.ui.eventmonitor.EventMonitorClient mimbLimitInfoLoaderBatchJob;
		
		if [ ! "$IS_PROCEED_CO003" = "true" ]; then
			echo "[Info] -- Exit SIBS CO003 Batch Job ! --";
		else
		    echo "[Info] -- Process SIBS CO003 Batch Job ! --";
		    "$JAVA_HOME"/bin/java $JAVA_OPTS -classpath $CLASSPATH com.integrosys.cms.ui.eventmonitor.EventMonitorClient mimbCollateralMarketableSecLoaderBatchJob;
		fi	
		
		if [ ! "$IS_PROCEED_CO004" = "true" ]; then
			echo "[Info] -- Exit SIBS CO004 Batch Job ! --";
		else
		    echo "[Info] -- Process SIBS CO004 Batch Job ! --";
		    "$JAVA_HOME"/bin/java $JAVA_OPTS -classpath $CLASSPATH com.integrosys.cms.ui.eventmonitor.EventMonitorClient mimbCollateralCashFileBatchJob;
		fi	
	fi	
fi