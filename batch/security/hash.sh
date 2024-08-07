#!/bin/bash

REF_HOME=/usr/IBM/WebSphere/cms_uat

if [ -z $1 ]; then
	echo "[error] Please specify Key 1 file name"
	return
fi

if [ -z $2 ]; then
	echo "[error] Please specify Key 2 file name"
	return
fi

if [ ! -f $1 ]; then
	echo "[error] Key 1 file is not exist"
	return
fi

if [ ! -f $2 ]; then
	echo "[error] Key 2 file is not exist"
	return
fi

KEY1=$(cat $1)
KEY2=$(cat $2)
KEY=$KEY1$KEY2
HK=$(/usr/java14/bin/java -cp $REF_HOME/3rdpartylib/hashkey.jar HashThis $KEY)
mkdir $REF_HOME/batch/security/sec
echo "package sec;public class StoredHashKey{private String key=\"$HK\";public String getKey(){return key;}}" > $REF_HOME/batch/security/sec/StoredHashKey.java
/usr/java14/bin/javac $REF_HOME/batch/security/sec/StoredHashKey.java
cd $REF_HOME/batch/security
/usr/java14/bin/jar -cf java-lib.jar sec/StoredHashKey.class
rm $REF_HOME/batch/security/sec/*
rmdir $REF_HOME/batch/security/sec
rm $1
rm $2

echo "Backup old hash key..."
cp $REF_HOME/3rdpartylib/java-lib.jar $REF_HOME/batch/security/backup/`date '+%Y%m%d_%H%M%S'`.jar
mv java-lib.jar $REF_HOME/3rdpartylib
echo "New hash key successfully stored."
