#!/bin/sh

. /opt/IBM/WebSphere/cmsuat/batch/setclassenv.sh
SOURCE_PATH=/opt/IBM/WebSphere/cmsuat/simessage/mimb

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
. /opt/IBM/WebSphere/cmsuat/batch/set_si_env.sh $SOURCE_PATH/PF002MIM csv
IS_PROCEED_PF002=$IS_PROCEED 
## ----------- END MIMB CU002 ---------------

echo "[Info] -- Process SIBS PF002 Batch Job ?? -- $IS_PROCEED_PF002";

if [ ! "$IS_PROCEED_PF002" = "true" ]; then
	echo "[Info] -- Exit SIBS PF002 Batch Job ! --";
else
	echo "[Info] -- Process SIBS PF002 Batch Job ! --";
	"$JAVA_HOME"/bin/java $JAVA_OPTS -classpath $CLASSPATH com.integrosys.cms.ui.eventmonitor.EventMonitorClient stockPriceFileLoaderBatchJob;
fi	