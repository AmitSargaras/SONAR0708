#!/bin/sh


. /usr/IBM/WebSphere/cms/batch/setclassenv.sh

#  added to refresh customer location fam view for event monitoring and reports

# sqlplus -S $ORA_PW < refresh_fam_tab.sql;

#  added to refresh no of business days between system date and llp_bca_ref_appr_date for limit profile for which tat create date is null for event monitoring
 
# sqlplus -S $ORA_PW < refresh_lmt_profile_biz_days.sql


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



for  country in `/bin/cat "$COUNTRY_LIST_FILE"`
do 
echo $country "------------" 
"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.batch.rv.RealisableValueMain $country;
done