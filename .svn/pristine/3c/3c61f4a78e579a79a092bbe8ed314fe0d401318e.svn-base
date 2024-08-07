TCP Simulator Steps:
--------------------------------------------------------------------------------------------------------

1. SIBS:
========================================================================================================
a. Configure the HostServices.xml in the root\config directory.
	- SIBS: value in <args> which map to transaction code. 
	- No need to change the value of <startPosition> and <endPosition>.
	- simlulator will read the value in directory of <output_dir> and <dest> when matched.
	- Create a new <transaction> root under <transactions> if got new transaction.
c. make sure the config/jibx folder: field in request and response xml need to be same.
d. put the binding name in all request and response xml in config/jibx folder
e. value <FixedLength code=""> in fixed_length_main_map.xml need to same as <tempCdRQ> or <tempCdRS>.
f. run start.bat will help to deploy the class to become TCPSimulator.jar.jar


2. Others
=========================================================================================================
a. Configure the HostServices.xml in the root\config directory.
	- Others: value in <args> which map to any value of request String.
	- simlulator will read the value in directory of <output_dir> and <dest> when matched.
	- Create a new <transaction> root under <transactions> if got new transaction.
b. run start.bat will help to deploy the class to become TCPSimulator.jar.jar

**note
=========

3. Program environment setup
========================================================================================================
a. Configure start.bat int he root directory.
	- PROGRAM_HOME: directory of this simulator
	- ANT_HOME: Ant directory path
	- JAVA_HOME: Java directory path
===================================================


Start.bat (For TCP) - 9001
startSSL.bat (For TCPS) - 9002

//JVM Server
set EXTRA_PROP1=-Djavax.net.ssl.keyStore=%PROGRAM_HOME%\config\mySrvKeystore
set EXTRA_PROP2=-Djavax.net.ssl.keyStorePassword=123456

//JVM Client
set EXTRA_PROP1 = -Djavax.net.ssl.trustStore=D:\integro\TCPSimulator\config\mySrvKeystore 
set EXTRA_PROP2= -Djavax.net.ssl.trustStorePassword=123456

MQ Simulator
--------------------------------------------------------------------------------------------------------
1. MQ:
========================================================================================================
a. Configure the MQServices.xml in the root\config directory.
	- value in <args> which map to the received xml. 
	- No need to change the value of <startPosition> and <endPosition>.
	- simlulator will read the value in directory of <output_dir> and <dest> when matched.
	- Create a new <transaction> root under <transactions> if got new transaction.
  - replaceArgs are use for identify to replace any value in the response xml (use for one reply file for many different type of message).
  - replicateArgs are use to replicate any value from received xml to the response xml (example MessageRefNum).
b. Configure the mq.properties file
c. to add new listener, open com.integrosys.simulator.host.mq.MQMessageCenter.java, 
   add into MQ_IN_QUEUE_KEYS and MQ_OUT_QUEUE_KEYS for the system to know a new queue is added
d. if castor marshall/ unmarshall are require, put in the xml mapping into \config\castor\mapping, 
   configure MQServices.xml correctly and implement the TODO part in MQMessageHandler.java 
e. run startMQ.bat will help to deploy the class to become TCPSimulator.jar.jar

**note
=========

2. Program environment setup
========================================================================================================
a. Configure start.bat int he root directory.
	- PROGRAM_HOME: directory of this simulator
	- ANT_HOME: Ant directory path
	- JAVA_HOME: Java directory path
b. MQ jar file require
  - com.ibm.mq.jar
  - com.ibm.mq.jmqi.jar
  - com.ibm.mqjms.jar
  - dhbcore.jar
  - jms.jar
  - jta.jar
  - spring-jms-2.5.6.jar
  - spring.jar
c. support jar file require
  - castor.jar
  - jcl-over-slf4j.jar
  - jdom.jar
  - log4j.jar
  - slf4j-api.jar
  - slf4j-log4j12.jar
===================================================