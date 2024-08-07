@echo off

call setenv.cmd

set DB_NAME=CLIMS_LC
set DB_USER=db2admin
set DB_PASSWD=db2admin
set DB_SCHEMA=CLIMS_LOCAL

db2 connect to "%DB_NAME%" user "%DB_USER%" using "%DB_PASSWD%"

db2 set current schema = "%DB_SCHEMA%"

db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,"%DB_SCHEMA%"
