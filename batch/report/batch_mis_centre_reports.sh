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


DATE=`/usr/bin/date +"%d/%m/%Y" `;

for country in `/bin/cat "$COUNTRY_LIST_FILE"`
do
	"$JAVA_HOME"/bin/java $JAVA_OPTS com.integrosys.cms.ui.eventmonitor.EventMonitorClient reportBatchJob scope=MIS date=$DATE country=$country centre=CENTRE;
done

echo "------------";
echo "Script ends.";
