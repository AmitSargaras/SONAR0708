OUTPUT_DIR=/cms/simessage/DW
LOG_PATH=/cms/simessage/DW/export_dw_`date '+%m%Y'`.log

export OUTPUT_DIR
export LOG_PATH

if [ -z $DB_SCHEMA ]; then
	. ../set_db2_env.sh
fi

. si_export_dw001.sh $OUTPUT_DIR $LOG_PATH
. si_export_dw002.sh $OUTPUT_DIR $LOG_PATH
. si_export_dw003.sh $OUTPUT_DIR $LOG_PATH
. si_export_dw004.sh $OUTPUT_DIR $LOG_PATH
. si_export_dw005.sh $OUTPUT_DIR $LOG_PATH
. si_export_dw006.sh $OUTPUT_DIR $LOG_PATH
