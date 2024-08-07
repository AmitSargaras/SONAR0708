@SET CLASSPATH=%CLASSPATH%;%INTEGRO_HOME%\config\spring;%INTEGRO_HOME%\config\hibernate;%INTEGRO_HOME%\config\properties;%INTEGRO_HOME%\config\message;%INTEGRO_HOME%\config\castor\compare;%INTEGRO_HOME%\config\castor\mapping;%INTEGRO_HOME%\config\stp

@SET LOCALCLASSPATH=
@for %%i in ("%INTEGRO_HOME%\3rdpartylib\*.jar") do call "%ANT_HOME%\bin\lcp.bat" %%i

@SET CLASSPATH=%INTEGRO_HOME%\build\classes;%LOCALCLASSPATH%;%CLASSPATH%