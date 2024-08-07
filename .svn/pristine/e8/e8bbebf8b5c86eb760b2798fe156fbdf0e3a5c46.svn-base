#!/bin/sh

. /opt/IBM/WebSphere/cmsuat/batch/setclassenv.sh
SOURCE_PATH=/opt/IBM/WebSphere/cmsuat/simessage/ccrd

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
. /opt/IBM/WebSphere/cmsuat/batch/system-interface/cms_ftp.sh incoming /data/cmsuat/simessage/ccrd /opt/IBM/WebSphere/cmsuat/simessage/ccrd

# ----------- START SEMA CA002 -------------
. /opt/IBM/WebSphere/cmsuat/batch/set_si_env.sh $SOURCE_PATH/CCCMSOU
if [ -e $FILE_PATH.ht ]; then
	. /opt/IBM/WebSphere/cmsuat/batch/hash_total.sh check $FILE_PATH $FILE_PATH.ht 70,19
fi

if [ ! "$IS_PROCEED" = "true" ]; then
    echo "[Info] -- Exit SEMA CA002 Batch Job ! --";
	exit 1;
fi
# ----------- END SEMA CA002 ---------------

"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient semaFacilityLoaderBatchJob;


