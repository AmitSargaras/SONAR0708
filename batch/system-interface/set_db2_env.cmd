@echo off
set DB_NAME=ABCLIMS
set DB_USER=db2admin
set DB_PASSWD=db2admin
set DB_SCHEMA=ABCLIMS

db2 connect to "%DB_NAME%" user "%DB_USER%" using "%DB_PASSWD%"

db2 set current schema = "%DB_SCHEMA%"

db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,"%DB_SCHEMA%"