perl /opt/IBM/WebSphere/cmsuat/batch/hash_total.pl $*

if [ ! -e "$FILE_PATH.htgo" ]; then
	echo "[error] Hash Total Checking fail."
	IS_PROCEED=false
fi

if [ -e "$FILE_PATH.htgo" ]; then
	rm "$FILE_PATH.htgo"
fi

if [ -e "$FILE_PATH.ht" ]; then
	rm "$FILE_PATH.ht"
fi
