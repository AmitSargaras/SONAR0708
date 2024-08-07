@echo off
rem -----------------------------------------------------------------------------------------------------------------------------------------
rem -- @KLYong
rem -- This is the copy scripts for Migration Sibs scripts
rem -- Option 1 for copying all production related scripts
rem -- Option 2 for copying all mock related scripts
rem -- Option 3 for copying all uat related scripts
rem -- Option 4 for copying all sit related scripts
rem -- Those scripts that was different e.g. connect.sh, setenv.sh, etc would need to be organize into different folder
rem -----------------------------------------------------------------------------------------------------------------------------------------

set dbservpath="migration-sibs"\copy_scripts\mig_sibs
set dbscrpath=%dbservpath%\scripts
set dbpatches=%dbservpath%\dbpatches
set dbaftermigpatches=%dbservpath%\dbpatches-after-migrate
set dbcleanup=%dbservpath%\cleanup
set data_cleanup=%dbservpath%\data_cleanup

echo.
echo.                               --------------------Menu------------------
echo.
echo.                               1. - Production Environment (SH Scripts)
echo.
echo                                2. - Mock Environment  		(SH Scripts)
echo.
echo                                3. - UAT Environment 		(Batch Scripts)
echo.
echo                                4. - SIT Environment  		(Batch Scripts)
echo. 
echo.                               5. - Exit     
echo.     
echo.                               -------------------------------------------
echo.

set choice=
set /p choice=Migration scripts for environment: 

if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto share 
if '%choice%'=='2' goto share 
if '%choice%'=='3' goto share 
if '%choice%'=='4' goto share 
if '%choice%'=='5' goto end
if not '%choice%'==choice goto end

:selection
if '%choice%'=='1' goto prod_env 
if '%choice%'=='2' goto mock_env 
if '%choice%'=='3' goto uat_env 
if '%choice%'=='4' goto sit_env 


:prod_env
copy "migration-sibs"\dbpatches\*.sh %dbpatches%
copy "migration-sibs"\batch-script\*.sh %dbscrpath%
copy "migration-sibs"\batch-script\SIBS\*.sh %dbscrpath%
copy "migration-sibs"\dbpatches-after-migrate\*.* %dbaftermigpatches%
copy "migration-sibs"\batch-script\env_scripts\production\setenv.sh %dbservpath%
copy "migration-sibs"\db2-script\qc-reports\sh\gen_qc_2.sh %dbscrpath%
copy "migration-sibs"\db2-script\qc-reports\sh\gen_qc_6.sh %dbscrpath%
copy "migration-sibs"\db2-script\qc-reports\sh\gen_qc_7.sh %dbscrpath%
copy "migration-sibs"\db2-script\qc-reports\sh\gen_qc_8.sh %dbscrpath%
copy "migration-sibs"\db2-script\qc-reports\sh\sort_file_7.sh %dbscrpath%
copy "migration-sibs"\db2-script\qc-reports\sh\sort_file_8.sh %dbscrpath%
copy "migration-sibs"\cleanup\*.* %dbcleanup%
copy "migration-sibs"\data_cleanup\*.* %data_cleanup%
move %dbscrpath%\connect.sh %dbservpath%
move %dbscrpath%\set_mig_env.sh %dbservpath%
move %dbscrpath%\create_backup.sh %dbservpath%
move %dbscrpath%\migration_tablespace_setup.sh %dbservpath%
move %dbscrpath%\hash_total.sh %dbservpath%
move %dbscrpath%\lock_rlos_db.sh %dbservpath%
move %dbscrpath%\unlock_rlos_db.sh %dbservpath%
goto pause


:mock_env
copy "migration-sibs"\dbpatches\*.sh %dbpatches%
copy "migration-sibs"\batch-script\*.sh %dbscrpath%
copy "migration-sibs"\batch-script\SIBS\*.sh %dbscrpath%
copy "migration-sibs"\dbpatches-after-migrate\*.* %dbaftermigpatches%
copy "migration-sibs"\batch-script\env_scripts\mock\setenv.sh %dbservpath%
copy "migration-sibs"\db2-script\qc-reports\sh\gen_qc_2.sh %dbscrpath%
copy "migration-sibs"\db2-script\qc-reports\sh\gen_qc_6.sh %dbscrpath%
copy "migration-sibs"\db2-script\qc-reports\sh\gen_qc_7.sh %dbscrpath%
copy "migration-sibs"\db2-script\qc-reports\sh\gen_qc_8.sh %dbscrpath%
copy "migration-sibs"\db2-script\qc-reports\sh\sort_file_7.sh %dbscrpath%
copy "migration-sibs"\db2-script\qc-reports\sh\sort_file_8.sh %dbscrpath%
copy "migration-sibs"\cleanup\*.* %dbcleanup%
copy "migration-sibs"\data_cleanup\*.* %data_cleanup%
move %dbscrpath%\connect.sh %dbservpath%
move %dbscrpath%\set_mig_env.sh %dbservpath%
move %dbscrpath%\create_backup.sh %dbservpath%
move %dbscrpath%\migration_tablespace_setup.sh %dbservpath%
move %dbscrpath%\hash_total.sh %dbservpath%
move %dbscrpath%\lock_rlos_db.sh %dbservpath%
move %dbscrpath%\unlock_rlos_db.sh %dbservpath%
goto pause


:uat_env
copy "migration-sibs"\batch-script\*.cmd %dbscrpath%
copy "migration-sibs"\batch-script\SIBS\*.cmd %dbscrpath%
move %dbscrpath%\setenv.cmd %dbservpath%
move %dbscrpath%\connect.cmd %dbservpath%
move %dbscrpath%\set_mig_env.cmd %dbservpath%
move %dbscrpath%\create_backup.cmd %dbservpath%
move %dbscrpath%\migration_tablespace_setup.cmd %dbservpath%
goto pause


:sit_env
copy "migration-sibs"\batch-script\*.cmd %dbscrpath%
copy "migration-sibs"\batch-script\SIBS\*.cmd %dbscrpath%
move %dbscrpath%\setenv.cmd %dbservpath%
move %dbscrpath%\connect.cmd %dbservpath%
move %dbscrpath%\set_mig_env.cmd %dbservpath%
move %dbscrpath%\create_backup.cmd %dbservpath%
move %dbscrpath%\migration_tablespace_setup.cmd %dbservpath%
goto pause


:share
echo "Creating destination directory..."
mkdir %0\..\dbrestore
mkdir %0\..\dbbackup
mkdir %0\..\mig_sibs\cleanup
mkdir %0\..\mig_sibs\data_cleanup
mkdir %0\..\mig_sibs\dbpatches
mkdir %0\..\mig_sibs\dbpatches-after-migrate
mkdir %0\..\mig_sibs\scripts
mkdir %0\..\mig_sibs\scripts\source_file
mkdir %0\..\mig_sibs\scripts\load_log
mkdir %0\..\mig_sibs\scripts\qc_reports
mkdir %0\..\mig_sibs\scripts\qc_reports\log

REM echo "Creating dummy files"
REM echo off > %0\..\mig_sibs\db_patches\dummy.txt
REM echo off > %0\..\dbbackup\dummy.txt


echo "Changing path..."
cd \
cd %0\..\mig_sibs
cd ..
cd ..
cd ..


echo "Copying scripts..."
copy "migration-sibs"\dbpatches\*.sql %dbpatches%
copy "migration-sibs"\db2-script\*.sql %dbscrpath%
copy "migration-sibs"\db2-script\qc-reports\sql\*.sql %dbscrpath%
copy "migration-sibs"\db2-script\qc-reports\sh\*.txt %dbscrpath%
copy "migration-sibs"\batch-script\*.pl %dbscrpath%
move %dbscrpath%\gather_info.pl %dbservpath%
move %dbscrpath%\hash_total.pl %dbservpath%
goto selection


:pause
echo off
pause
echo Copying scripts was completed.
goto end


:end
echo Terminated.