#!/bin/sh

# All JARs and ZIPs in 3rdpartylib dir to be prepended to the CLASSPATH.


HOSTNAME=`/usr/bin/hostname`


INTEGRO_HOME=/usr/IBM/WebSphere/cms_sit
JAVA_HOME=/usr/IBM/WebSphere/AppServer/java
WEBSPHERE_HOME=/usr/IBM/WebSphere/AppServer

DB2_HOME=/usr/opt/db2/V9.1
DB2_PW=climssit/climssit@172.16.106.129
TDE_HOME=/usr/tde

CMS_JARPATH=${WEBSPHERE_HOME}/profiles/AppSrv02/installedApps/AppSvrNode02Cell/cms.ear

PATH=$DB2_HOME/bin:$TDE_HOME:$PATH
CLASSPATH=;
CLASSPATH=$CMS_JARPATH/cms.jar:$CMS_JARPATH/properties.jar:$CMS_JARPATH/integrobase.jar:$DB2_HOME
CLASSPATH=$INTEGRO_HOME/config/notificationtemplates:$CLASSPATH

COUNTRY_LIST_FILE=$INTEGRO_HOME/batch/countrylist.txt

JAVA_OPTS=" -ms128m -mx640m "

export JAVA_OPTS;
export PATH;
export TDE_HOME;
export DB2_HOME;
export DB2_PW;
export CLASSPATH;
export INTEGRO_HOME;
export JAVA_HOME;
export COUNTRY_LIST_FILE;

#Basel Application Related.
CDW_DATA=/usr/IBM/WebSphere/cms/data/cdw
export CDW_DATA

SQL_LOC=/usr/IBM/WebSphere/cms/batch/basel
export SQL_LOC

QUEUE_NAME=LNCMS1U1
export QUEUE_NAME

# Following is cut and paste from ISIS .profile Any change in the env of ISIS shoudl be replicated here

FTF_CONFIG_FILE=/isis/sit/tde/ftfconfig.ini
FTF_EXIT_PATH=/usr/tde

export FTF_CONFIG_FILE
export FTF_EXIT_PATH

#/isis/sit/std_env_var.ksh
#PATH=$PATH:/ISIS_OPS/scripts:$ISIS_MQ/ins/aix:$ISIS_OAM/ins/aix
export PATH


