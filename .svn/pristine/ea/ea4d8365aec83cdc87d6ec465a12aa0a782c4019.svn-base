#!/bin/sh

# All JARs and ZIPs in 3rdpartylib dir to be prepended to the CLASSPATH.

INTEGRO_HOME=/opt/IBM/WebSphere/cmsuat
WEBSPHERE_HOME=/opt/IBM/WebSphere/AppServer
JAVA_HOME=$WEBSPHERE_HOME/java

DB2_HOME=/opt/IBM/db2/V9.1
DB2_PW=cmsuat/cmsuat123@cmsuat

CMS_JARPATH=$WEBSPHERE_HOME/profiles/AppSrv01/installedApps/rlosdev1Node01Cell/cms.ear
PATH=$DB2_HOME/bin:$PATH
CLASSPATH=$CMS_JARPATH/cms.jar:$CMS_JARPATH/properties.jar:$CMS_JARPATH/integrobase.jar:$CMS_JARPATH/log4j.jar:$CLASSPATH;
CLASSPATH=$INTEGRO_HOME/config/notificationtemplates:$CLASSPATH
CLASSPATH=$INTEGRO_HOME/config/spring:$INTEGRO_HOME/config/hibernate:$INTEGRO_HOME/config/properties:$INTEGRO_HOME/config/message:$INTEGRO_HOME/config/castor/compare:$INTEGRO_HOME/config/castor/mapping:$INTEGRO_HOME/config/stp:$INTEGRO_HOME/config/batch:$CLASSPATH

COUNTRY_LIST_FILE=$INTEGRO_HOME/batch/countrylist.txt

JAVA_OPTS=" -ms128m -mx640m "

export JAVA_OPTS;
export PATH;
export DB2_HOME;
export DB2_PW;
export CLASSPATH;
export INTEGRO_HOME;
export JAVA_HOME;
export COUNTRY_LIST_FILE;

#Basel Application Related.
CDW_DATA=/usr/WebSphere/cms/data/cdw
export CDW_DATA

export PATH
