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

for  country in `/bin/cat "$COUNTRY_LIST_FILE"`
do
echo $country "------------" 
"$JAVA_HOME"/bin/java $JAVA_OPTS com.integrosys.cms.ui.eventmonitor.EventMonitorClient recurrentDueDateBatchJob country=$country;
done