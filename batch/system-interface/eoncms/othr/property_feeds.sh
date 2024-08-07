#!/bin/sh

. /opt/IBM/WebSphere/cmsuat/batch/setclassenv.sh

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
. /opt/IBM/WebSphere/cmsuat/batch/system-interface/cms_ftp.sh incoming /data/cmsuat/simessage/othr /opt/IBM/WebSphere/cmsuat/simessage/othr

"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient propertyPlFileLoaderBatchJob;

"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient propertyNplFileLoaderBatchJob;


echo "------------";
echo "Script ends.";