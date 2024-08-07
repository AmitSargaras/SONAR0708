if [ -z "$1" ]; then
	echo "[error] No file to backup, exit."
	return
fi

if [ ! -e "$1" ]; then
	echo "[error] $1 not exists, exit."
	return
fi

TO_DIR=$2
if [ "$2" = "" ]; then
	echo "[warn] No directory specified, default to current directory."
	TO_DIR=.
else
	if [ ! -e "$2" ]; then
		echo "[warn] $2 not exists, attempting to create"
		mkdir -p $2
	else 
		if [ ! -d "$2" ]; then
			echo "[error] $2 is not a directory, exit"
			return
		fi
	fi
fi

DT_SUFFIX=`date '+%Y%m%d_%H%M'`
FILE_NAME=`basename $1`

cp "$1" "${TO_DIR}"/"$FILE_NAME""_""${DT_SUFFIX}"