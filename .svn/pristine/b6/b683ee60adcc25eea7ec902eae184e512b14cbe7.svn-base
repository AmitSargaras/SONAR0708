#!/bin/sh


. /usr/IBM/WebSphere/cms_uat/batch/setclassenv.sh


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


# Exposure Aggregation Batch job(ExposureAggregationMain) is changed to be executed via RunEventMonitor interface. No notification is generated.
"$JAVA_HOME"/bin/java $JAVA_OPTS com.integrosys.cms.ui.eventmonitor.EventMonitorClient ExposureAggregationMainBatchJob;

echo "------------";
echo "Script ends.";


