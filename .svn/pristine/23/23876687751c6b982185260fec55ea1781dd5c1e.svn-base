#!/bin/sh

. /usr/IBM/WebSphere/cms/batch/setclassenv.sh

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


# Prepare the data required before the actual valuation run - currently only used for MS valuation.
"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient valuationPreparationBatchJob


for  country in `/bin/cat "$COUNTRY_LIST_FILE"`
do 
echo $country "------------" 
"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient valuationBatchJob country=$country sectype=CS;

"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient valuationBatchJob country=$country sectype=GT;

"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient valuationBatchJob country=$country sectype=IN;

"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient valuationBatchJob country=$country sectype=MS;

"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient valuationBatchJob country=$country sectype=PT;

"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient valuationBatchJob country=$country sectype=AB;

done

"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient valuationBatchJob country=$country specialhandle=AB102 region=LKW;

"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient valuationBatchJob country=$country specialhandle=AB102 region=EM;

"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient valuationBatchJob country=$country specialhandle=AB102 region=WM;

"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient valuationBatchJob country=$country specialhandle=GT409;


echo "------------ RV ----------------"
. /usr/IBM/WebSphere/cms/batch/valuation/RV.sh > /usr/IBM/WebSphere/cms/batch/valuation/RV.log

