#!/bin/sh

. /usr/WebSphere/cms/batch/setclassenv.sh

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

# CIF Update.
"$JAVA_HOME"/bin/java com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.batch.customer.CustomerFusionMain;


echo "------------";
echo "Script ends.";