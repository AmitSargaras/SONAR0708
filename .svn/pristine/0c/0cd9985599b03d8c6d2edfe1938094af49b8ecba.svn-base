OUTPUT_DIR=/opt/IBM/WebSphere/cmsuat/simessage/DW
LOG_PATH=/opt/IBM/WebSphere/cmsuat/simessage/DW/export_dw_`date '+%m%Y'`.log
SYSTEM_INTERFACE_HOME=/opt/IBM/WebSphere/cmsuat/batch

export OUTPUT_DIR
export LOG_PATH
export SYSTEM_INTERFACE_HOME

# if [ -z $DB_SCHEMA ]; then
	. $SYSTEM_INTERFACE_HOME/set_db2_env.sh
# fi

. si_export_dw001.sh $OUTPUT_DIR $LOG_PATH
. si_export_dw002.sh $OUTPUT_DIR $LOG_PATH
. si_export_dw003.sh $OUTPUT_DIR $LOG_PATH
. si_export_dw004.sh $OUTPUT_DIR $LOG_PATH
. si_export_dw005.sh $OUTPUT_DIR $LOG_PATH
. si_export_dw006.sh $OUTPUT_DIR $LOG_PATH

# ----------- Ftp Batch File ----------- Outgoing
. /opt/IBM/WebSphere/cmsuat/batch/system-interface/cms_ftp.sh outgoing /opt/IBM/WebSphere/cmsuat/simessage/DW /data/cmsuat/simessage/dw