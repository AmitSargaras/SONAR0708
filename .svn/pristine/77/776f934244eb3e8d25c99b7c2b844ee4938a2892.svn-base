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



DATE=`/usr/bin/date +"%d/%m/%Y" `;


# Common Report Irrespective of countries.

# Conc Adhoc
"$JAVA_HOME"/bin/java $JAVA_OPTS com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.batch.reports.AdhocReportInvoker

# For reports that are global in nature.
for  country in `/bin/cat "$INTEGRO_HOME"/batch/countrylist.txt`
do
	#MIS Report
	"$JAVA_HOME"/bin/java $JAVA_OPTS com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.batch.reports.ReportScheduler MIS $DATE $country;

	#System Report
	"$JAVA_HOME"/bin/java  $JAVA_OPTS com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.batch.reports.ReportScheduler SYS $DATE $country;

	# Conc Country Report
	"$JAVA_HOME"/bin/java $JAVA_OPTS com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.batch.reports.ReportScheduler Country $DATE $country;

done

echo "------------";
echo "Script ends.";