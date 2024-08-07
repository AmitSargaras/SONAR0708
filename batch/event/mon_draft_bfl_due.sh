#!/bin/sh

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

# All JARs and ZIPs in 3rdpartylib dir to be prepended to the CLASSPATH.
for jarFile in $INTEGRO_HOME/wsjars/*jar; do
    CLASSPATH=$jarFile:$CLASSPATH;
done

# Include CMS classes and property files.
#CLASSPATH=$INTEGRO_HOME/wsjars/cms.jar:$INTEGRO_HOME/wsjars/properties.jar:$CLASSPATH;
#
# Include IBM jndi impl JAR.
CLASSPATH=$WEBSPHERE_HOME/lib/naming.jar:$WEBSPHERE_HOME/lib/namingclient.jar:$WEBSPHERE_HOME/lib/ecutils.jar:$WEBSPHERE_HOME/properties:$CLASSPATH;


# For converting from unix style to windows style if this script is run in
# windows environment, using Cygwin for example.
if test "echo $OS | grep 'Windows'" != ""; then
    CLASSPATH=`echo $CLASSPATH | sed -e 's/\//\\\/g' -e 's/:\([a-z]\)/;\1/g'`;
fi

export CLASSPATH;

# Collateral Valuation Feed.
for  country in `/bin/cat /usr/WebSphere/cms/batch/countrylist.txt`
do 
echo $country "------------"
"$JAVA_HOME"/bin/java com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.draftbfldue.MonDraftBFLDue $country;
done

echo "------------";
echo "Script ends.";


