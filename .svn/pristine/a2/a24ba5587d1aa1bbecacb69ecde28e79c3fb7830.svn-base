@echo off
SETLOCAL

REM ----------------------------------------------------------------------------
REM Utility to update build.number and build.date properties
REM in cms.ear!/properties.jar!/ofa_env.properties
REM 
REM Usage: 
REM 	update_buildnumber.cmd [value of build.number] [full path of cms.ear]
REM Example 
REM		update_buildnumber.cmd "R1.0 UAT B333" d:\some\path\to\cms.ear
REM
REM Required environment variable
REM 1. JAVA_HOME (for jar command)
REM ----------------------------------------------------------------------------

SET BUILD_NUMBER=%~1
SET BUILD_DATE=%DATE%
SET EAR_FILE=%~f2

IF not exist %EAR_FILE% (
	echo [error] Please Provide a valid cms.ear file
	goto :end
)

echo [info] build.number provided is [%BUILD_NUMBER%]
echo [info] build.date will be [%DATE%]

pushd %~dp2
%JAVA_HOME%\bin\jar -xf cms.ear properties.jar
%JAVA_HOME%\bin\jar -xf properties.jar ofa_env.properties

echo [info] existing build.number :
findstr build\.number ofa_env.properties

findstr /V build\.number ofa_env.properties > ofa_env.temp.properties
del ofa_env.properties

findstr /V build\.date ofa_env.temp.properties > ofa_env.properties
del ofa_env.temp.properties

echo. >> ofa_env.properties
echo. >> ofa_env.properties
echo build.number=%BUILD_NUMBER% >> ofa_env.properties
echo. >> ofa_env.properties
echo build.date=%BUILD_DATE% >> ofa_env.properties

%JAVA_HOME%\bin\jar -uf properties.jar ofa_env.properties
%JAVA_HOME%\bin\jar -uf cms.ear properties.jar

del /Q ofa_env.properties
del /Q properties.jar

popd

:end
ENDLOCAL