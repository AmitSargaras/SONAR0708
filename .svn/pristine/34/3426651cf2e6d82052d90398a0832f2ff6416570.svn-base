README * Build And Deployment

	This readme cover only build and deployment process required for WebSphere(AIX) environment only

	* [H1] Ant Process setup (build.properties and build.xml)
	* [H2] Properties and Context File setup
	* [H3] Actual run 
	* [H4] Deployment into WebSphere

[H1] Ant Process setup (build.properties and build.xml)

	Item to be changed in the build.properties for different environment

	i) websphere.unix.home
		to control the path of 3rdpartylib, config and report folder

	ii) websphere.unix.feed.path
		to control the path of feed required for the batch job

[H2] Properties and Context File setup

	1. /config/properties/report.properties (for settings of using crystal report server)

		Basically all item are important, *EXCEPT*
			i) dll.driver
			ii) db.server.type

	2. /config/websphere/ofa_env.properties

		Items to be changed for different environment
		i) cms.app.url 
			can be 'localhost' or the full name of the app server

		ii) authentication.manager.bean.name
			the spring context bean name of authentication manager, specify which one to be used by CMS, got 2 options
			a) cmsAuthenticationManager
			b) as400AuthenticationManager

		iii) authentication.verify.force.password.change
			state whether system need verify force password change, normally, if authentication manager is other system, we dont do.

		iv) authentication.as400.system.name
			AS400 system name, normally is the host name of the authentication manager.
		
		v) integrosys.login.single.signon.enabled
			To control whether password fields at edit user page and change password button should be hidden, locally should be 'false'.

		vi) session.factory.external.bean.name
			To specify which bean name of session factory to be used when connecting to external database system (eg, AS400 DB2), got 2 options
			a) ofaSessionFactory
			b) sibsSessionFactory

	3. /config/websphere/batch.properties

		All the item are important, just specify the file name enough, path taken care by build.properties#websphere.unix.feed.path

	4. /config/websphere/AppContext_Master.xml

		If the environment are not configured to interface with external database system (eg. AS400 DB2).
		Remove <import resource="AppContext_DataSource_Ext_SIBS.xml" />

	4. /config/spring/AppContext_Core.xml

		This can control which module to be autowired by Spring context.
		Just comment those unwanted module 'AppContext_Master.xml', then that module will not be autowired

	6. /public_html/WEB-INF/struts/struts-config.xml

		Take note of <plug-in className="org.springframework.web.struts.ContextLoaderPlugIn">
		values is 'contextConfigLocation' can control which UI module to be autowired.

[H3] Actual run

	After all the above settings are changed, then we continue to do actual run of build.

	Similiar to development, just need to do a single 'dist' ant task, as below

	1. [dev dist-unix]
		to build the end cms.ear file which ready to be deployed into WebSphere Application Server
		(all will be done in /build/dist)

		This process involved
		i) construct manifest file
		ii) compile all classes and pack into cms.jar
		iii) compile and prepare all EJBs
		iv) copy properties, xml files (from /config/websphere) to specific folder (/config/properties and /config/spring)
		v) prepare jar for .class, .properties, .xml
		vi) prepare war for all files in /public_html
		vii) prepare ear (pack all the jars, ejb jars, war)

	After a while, we will notice that actually we dont need to do a full 'dev dist-unix' task, because we might not need to compile ejb, etc.

	1. changes on EJBs,
		i) run command, [dev ws-ejbc] -Dejb=[folder_name_of_ejb], eg. dev ws-ejb -Dejb=collateral (this will be using WAS6.1 to do ejbdeploy)
		ii) rebuild the ear, [dev dist-cms-ear]

	2. Changes on source code,
		i) [dev dist-cms-jar]
		ii) [dev dist-cms-ear]

	3. Changes on properties or xml files,
		i) [dev deploy-was], *note* this include running 'buildnumber' task
		ii) [dev dist-cms-ear]

	4. Changes on any files in /public_html
		i) [dev dist-cms-war]
		ii) [dev dist-cms-ear]

	5. Combination of above
		i) compile EJB can do separately (as above 1.; i) and ii) only)
		ii) compile source code can do separately [dev dist-cms-jar]
		ii) [dev dist]

[H4] Deployment into WebSphere

	Just follow the AIG doc, found in eoncms-doc svn, path /technical/installation guide/CMS_AIG.doc