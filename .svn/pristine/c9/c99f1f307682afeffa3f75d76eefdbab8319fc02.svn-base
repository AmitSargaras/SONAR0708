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



# Set the value for property file.
#PROP_FILE_VALUE=$INTEGRO_HOME/config/reports.properties:$INTEGRO_HOME/config/ofa.properties:$INTEGRO_HOME/config/ofa_env.properties;

DATE=`/usr/bin/date +"%d/%m/%Y" `;


# For reports that are global in nature.
"$JAVA_HOME"/bin/java  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.batch.reports.ReportScheduler Global


# For reports that are region specific (South East Asia, Asia)
"$JAVA_HOME"/bin/java  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.batch.reports.ReportScheduler Region SEA
"$JAVA_HOME"/bin/java  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.batch.reports.ReportScheduler Region ASA


# For reports that are country specific (SG, HK)
"$JAVA_HOME"/bin/java  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.batch.reports.ReportScheduler Country SG
"$JAVA_HOME"/bin/java  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.batch.reports.ReportScheduler Country HK

# For reports that are stock exchange
"$JAVA_HOME"/bin/java  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.batch.reports.ReportScheduler Exchange SGX

echo "------------";
echo "Script ends.";
