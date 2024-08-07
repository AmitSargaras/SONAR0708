###################################################################
#
# Auto Deployment Jython script for deploying cms.ear into 
# WebSphere. 
#
# 1. It uninstalls application if it found there is any
# 2. Install application from 'release_ear' and configure shared 
#	 library
# 3. Stop application server if it is running
# 4. Trigger start application server externally
#
# Notes: the process will be stopped for 30s before application 
# 		 really getting started. This is to accommodate the 
#		 expansion of ear file to base node after sync. Feel free
#		 to change if found it's not working. Or else restart the 
#		 application from the console.
#
# Dev Notes: As not to disrupt this file by showing modification
#			 by SVN, we can copy this file to somewhere and modify 
#			 the variables below. And pointing to the full path of 
#			 copied version of this when running wsadmin command
#
###################################################################

# Jython specific
import time

release_ear='/usr/IBM/WebSphere/cms_sit/release/cms.ear'
app_name='cms'
cell_name='AppSvrNode02Cell'
node_name='AppSvrNode02'
server_name='server1'
shared_lib_name='cms_3rd_party'

# Change the value above to suit your environment

sleepMSAfterInstall=30000
install_options=['-node', node_name, '-cell', cell_name, '-server', server_name, '-appname', app_name, '-MapSharedLibForMod', [['.*', '.*', shared_lib_name]], '-usedefaultbindings']

def syncNode(nodeSync, sleepMS):
	global AdminControl
	if (nodeSync != ""):
		AdminControl.invoke(nodeSync, 'sync')

	if sleepMS > 0:
		sleepS = sleepMS / 1000
		print 'Sleep for '+ str(sleepS) +' seconds'
		time.sleep(sleepS)

nodeSync=AdminControl.completeObjectName('type=NodeSync,node='+node_name+',*')

# Setting Start Time
tstart=time.strftime("%H:%M:%S", time.gmtime())

print '==================================================================='
print ''
print 'Application Name: ' + app_name
print 'Server name: ' + server_name
print 'Release EAR file: ' + release_ear
print ''
print '==================================================================='

deployment=AdminConfig.getid('/Deployment:'+app_name+'/')

if len(deployment) > 0:

	print '==================================================================='
	print ''
	print 'Uninstalling ' + app_name
	print ''
	print '==================================================================='
	
	AdminApp.uninstall(app_name)
	AdminConfig.save()
	syncNode(nodeSync,0)

print '==================================================================='
print ''
print 'Installing ' + app_name
print ''
print '==================================================================='

AdminApp.install(release_ear, install_options)
AdminConfig.save()
syncNode(nodeSync,sleepMSAfterInstall)

#print '==================================================================='
#print ''
#print 'Starting application ' + app_name
#print ''
#print '==================================================================='

appServerId=AdminControl.completeObjectName('cell='+cell_name+',node='+node_name+',name='+server_name+',type=Server,*')
serverState=AdminControl.getAttribute(appServerId, 'state')
serverState=serverState.upper()

# It wont happen on a Application Server edition
# as you need server to be up to run wsadmin command
if serverState=='STOPPED':
	print server_name + ' is stopped, to start again.'
	AdminControl.startServer(server_name, node_name)
else:
	pid=AdminControl.getAttribute(appServerId, 'pid')
	print 'Stopping ' + server_name + '. Process Id ' + pid
	AdminControl.stopServer(server_name, node_name)
	print '==================================================================='

#appManager = AdminControl.queryNames('cell='+cell_name+',node='+node_name+',type=ApplicationManager,process='+server_name+',*')
#AdminControl.invoke(appManager, 'startApplication', app_name)

# Setting Done time
tdone=time.strftime("%H:%M:%S", time.gmtime())

print 'Done! Start from ' + tstart + ', finish at ' + tdone + '.'