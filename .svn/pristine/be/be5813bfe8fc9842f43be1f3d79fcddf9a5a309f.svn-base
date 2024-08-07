#!/bin/sh

. /app/EONCMS/batch/setclassenv.sh

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


# Conc Adhoc
"$JAVA_HOME"/bin/java $JAVA_OPTS com.integrosys.cms.ui.eventmonitor.EventMonitorClient adhocReportBatchJob


echo "------------";
echo "Script ends.";
