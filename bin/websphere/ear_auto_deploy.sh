#!/bin/sh

WAS_HOME=/usr/IBM/WebSphere/AppServer
WAS_PROFILE=AppSrv02
WAS_USER=
WAS_PASSWD=
DEPLOY_SCRIPT=/usr/IBM/WebSphere/cms_sit/deployment.py

$WAS_HOME/bin/wsadmin.sh -user $WAS_USER -password $WAS_PASSWD -lang jython -f $DEPLOY_SCRIPT
# applicable for standalone Websphere where starting server via wsadmin is impossible
$WAS_HOME/profiles/$WAS_PROFILE/bin/startServer.sh server1
echo "Deployment completed with application server restarted!"