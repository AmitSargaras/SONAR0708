#!/bin/sh

. /usr/IBM/WebSphere/cms_sit/batch/setclassenv.sh

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

CP=/usr/IBM/WebSphere/AppServer/profiles/AppSrv02/installedApps/AppSvrNode02Cell/cms.ear/properties.jar:/usr/IBM/WebSphere/AppServer/profiles/AppSrv02/installedApps/AppSvrNode02Cell/cms.ear/cms.jar:/usr/IBM/WebSphere/AppServer/profiles/AppSrv02/installedApps/AppSvrNode02Cell/cms.ear/integrobase.jar

# For reports that are global in nature.
for country in `/bin/cat "$COUNTRY_LIST_FILE"`
do
	"$JAVA_HOME"/bin/java $JAVA_OPTS -cp $CP com.integrosys.cms.ui.eventmonitor.EventMonitorClient reportBatchJob GRP $DATE $country
done

echo "------------";
echo "Script ends.";