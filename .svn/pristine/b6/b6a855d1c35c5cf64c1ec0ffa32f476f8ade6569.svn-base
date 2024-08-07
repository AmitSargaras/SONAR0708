@SETLOCAL

@echo # # Please use Sun's JDK 1.4 and above to run this # #

echo "*******Starting... %1******";
pushd %INTEGRO_HOME%\config\ejb\weblogic\%1

set CP=%INTEGRO_HOME%\3rdpartylib\dd.jar;%INTEGRO_HOME%\3rdpartylib\ofacomp.jar

set WLCP=%INTEGRO_HOME%\build\dist\cms.jar;%INTEGRO_HOME%\3rdpartylib\ofacomp.jar;%INTEGRO_HOME%\3rdpartylib\integrobase.jar

FOR %%i IN (%WAS_APP_HOME%) DO SET WAS_APP_HOME=%%~i

rem --------
if exist tmp rmdir /S/Q tmp
if exist Deployed_%1.jar del /Q Deployed_%1.jar
echo "Finished clear temp files."
rem --------

mkdir tmp
cd tmp

mkdir META-INF
copy ..\META-INF\*.xml META-INF
attrib -R *.* /S

"%JAVA_HOME%\bin\java" -cp "%CP%" com.integrosys.dd.app.Parser . modifyejbjar DB2UDBNT_V72
"%JAVA_HOME%\bin\java" -cp "%CP%" com.integrosys.dd.app.Parser . generatebinder DB2UDBNT_V72

:stage2

"%JAVA_HOME%\bin\jar" cf %1.jar *.*
echo "Finished modification of Jars ";

CALL "%WAS_APP_HOME%\bin\ejbdeploy.bat" %1.jar . Deployed_%1.jar -cp "%WLCP%" -codegen -dbvendor DB2UDB_V72 -quiet -noinform
echo "Finished Top Down approach of %1 ";
"%JAVA_HOME%\bin\jar" xf Deployed_%1.jar

cd ..
rename tmp tmp2
mkdir tmp
cd tmp
mkdir META-INF
xcopy ..\tmp2\META-INF META-INF /S/E
attrib -R *.* /S

echo "Finished extra meta-inf. ";

:stage3 
"%JAVA_HOME%\bin\java" -cp "%CP%" com.integrosys.dd.app.Parser . replaceschema DB2UDBNT_V72
"%JAVA_HOME%\bin\jar" cf %1.jar *.*
echo "Finished schema replacement of %1 ";

:stage4
		
CALL "%WAS_APP_HOME%\bin\ejbdeploy.bat" %1.jar . Deployed_%1.jar -cp "%WLCP%" -dbvendor DB2UDB_V72 -keep
echo "Finished redeployment of %1 ";
copy Deployed_%1.jar ..
cd ..
if exist tmp rmdir /S/Q tmp 
if exist tmp2 rmdir /S/Q tmp2 

copy Deployed_%1.jar %2
popd
echo "*******COMPLETED %1******";

:end
@ENDLOCAL