IF "%MMYYYY%" == "" (
  call set_mmyyyy.cmd
)

set OUTPUT_DIR="C:\CLIMS\SI\DW"
set LOG_PATH="C:\CLIMS\SI\DW\export_dw_%MMYYYY%.log"

call si_export_dw001.cmd %OUTPUT_DIR% %LOG_PATH%
call si_export_dw002.cmd %OUTPUT_DIR% %LOG_PATH%
call si_export_dw003.cmd %OUTPUT_DIR% %LOG_PATH%
call si_export_dw004.cmd %OUTPUT_DIR% %LOG_PATH%
call si_export_dw005.cmd %OUTPUT_DIR% %LOG_PATH%
call si_export_dw006.cmd %OUTPUT_DIR% %LOG_PATH%
