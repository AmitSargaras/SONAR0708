#!/bin/sh

. /usr/WebSphere/cms/batch/setclassenv.sh

# INTEGRO_HOME property must not be empty.
if test "$INTEGRO_HOME" = ""; then
    echo "INTEGRO_HOME property must not be empty.";
    exit 1;
fi

# JAVA_HOME property must not be empty.
if test "$JAVA_HOME" = ""; then
    echo "JAVA_HOME property must not be empty.";
    exit 1;
fi

# WEBSPHERE_HOME property must not be empty.
if test "$WEBSPHERE_HOME" = ""; then
    echo "WEBSPHERE_HOME property must not be empty.";
    exit 1;
fi

if [ "$1" ]
then
  echo "$1 to be generated with an encrypted version"
else
  echo "Needs one argument to generate encrypted version" ;
  exit 1;  
fi


CLASSPATH=/usr/IBM/WebSphere/cms/3rdpartylib/log4j.jar:/usr/IBM/WebSphere/cms/3rdpartylib/java-lib.jar:$CLASSPATH


export CLASSPATH;

# Generate encrypted password
"$JAVA_HOME"/bin/java com.integrosys.cms.ui.security.EncryptUtilReport e p $1 ;

echo "------------";
echo "Script ends.";

