#!/bin/sh

. /usr/IBM/WebSphere/cms_uat/batch/setclassenv.sh

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

DIR=/$INTEGRO_HOME/batch

if [ "$1" ]
then
  if [ -f $DIR/$1 ]
    then
      echo "$1 File  exist"
    else
      echo "$1 File  does not exist"
      exit 1;
  fi
else
  echo "Batch job needs one argument to run" ;
  exit 1;  
fi


COUNTRY_LIST=$INTEGRO_HOME/batch/$1
  

# This notification should be removed, according to Kui Lin's email "FW: Obsolete Notifications." on 11/21/2005
# "$JAVA_HOME"/bin/java $JAVA_OPTS com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.bflacceptanceexpiry.MonBFLAcceptanceExpiry &

# sleep 120

# for  country in `/bin/cat "$COUNTRY_LIST"`
# do 
# echo $country "------------" 
# "$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.cleantypebfldue.MonCleanTypeBFLDue $country;
# done
#&
# sleep 120

for  country in `/bin/cat "$COUNTRY_LIST"`
do 
echo $country "------------" 
"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.collateralevaluationdue.MonEvaluationDue $country;
done

for  country in `/bin/cat "$COUNTRY_LIST"`
do 
echo $country "------------" 
"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.collateralmaturity.MonCollateralMaturity $country;
done

for  country in `/bin/cat "$COUNTRY_LIST"`
do 
echo $country "------------" 
"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.marketindexdown.MonMarketIndexDown;
done

for  country in `/bin/cat "$COUNTRY_LIST"`
do 
echo $country "------------" 
"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.marketindex.MonMarketIndex;
done

for  country in `/bin/cat "$COUNTRY_LIST"`
do 
echo $country "------------" 
"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.coverageexcess.MonCoverageExcess $country;
done

for  country in `/bin/cat "$COUNTRY_LIST"`
do 
echo $country "------------" 
"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.coverageshortfall.MonCoverageShortfall $country;
done

for  country in `/bin/cat "$COUNTRY_LIST"`
do 
echo $country "------------" 
"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.riskparamexceed.MonRiskParamExceed $country;
done

for  country in `/bin/cat "$COUNTRY_LIST"`
do 
echo $country "------------" 
"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.securityfsv.MonSecurityFsv $country;
done

for  country in `/bin/cat "$COUNTRY_LIST"`
do 
echo $country "------------" 
"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.feedue.MonFeeDue.java $country;
done

# Removed as per request from KL on 28 May 2004
# "$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.collaborationtask.MonCollaborationTask;

# Removed as per the request from KL temp.


# This notification should be removed, according to Kui Lin's email "FW: Obsolete Notifications." on 11/21/2005
# "$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.ddndue.MonDDNDue &

# This notification should be removed, according to Kui Lin's email "FW: Obsolete Notifications." on 11/21/2005
# "$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.ddnexpired.MonDDNExpired;

# This notification should be removed, according to Kui Lin's email "FW: Obsolete Notifications." on 11/21/2005
# "$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.ddnexpiry.MonDDNExpiry;

#for  country in `/bin/cat "$COUNTRY_LIST"`
#do 
#echo $country "------------" 
#"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.documentexpiry.MonDocumentExpiry $country;
#done
#&
#sleep 120

#for  country in `/bin/cat "$COUNTRY_LIST"`
#do 
#echo $country "------------" 
#"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.draftbfldue.MonDraftBFLDue $country;
#done
#&
#sleep 120

#for  country in `/bin/cat "$COUNTRY_LIST"`
#do 
#echo $country "------------" 
#"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.fulldocreview.MonFullDocReview $country;
#done
#&

# This notification should be removed, according to Kui Lin's email "FW: Obsolete Notifications." on 11/21/2005
# "$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.guarantornotice.MonGuarantorNotice;

# This notification should be removed, according to Kui Lin's email "FW: Obsolete Notifications." on 11/21/2005
# "$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.insuranceexpiry.MonInsuranceExpiry;


# Security Coverage Calculation Batch job(CollateralThresholdMain) is changed to be executed via RunEventMonitor interface. No notification is generated.
# Security Coverage Caculation batch job is temporarily turned off due to the timeout and calculation probloems -- 11/29/2005 by Integro
# "$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.batch.collateralthreshold.CollateralThresholdMain;

#for  country in `/bin/cat "$COUNTRY_LIST"`
#do 
#echo $country "------------" 
#"$JAVA_HOME"/bin/java com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.commoditydeallevel.MonCMDDeal $country;
#done


#for  country in `/bin/cat "$COUNTRY_LIST"`
#do 
#echo $country "------------" 
#"$JAVA_HOME"/bin/java com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.commoditylimitlevel.MonCMDLimit $country;
#done



#for  country in `/bin/cat "$COUNTRY_LIST"`
#do 
#echo $country "------------" 
#"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.batch.recurrent.RecurrentDueDateMain $country;
#done


#run_event_monitor.sh:"$JAVA_HOME"/bin/java com.integrosys.cms.ui.eventmonitor.EventMonitorClient $1;

# Commented by Jitendra
#"$JAVA_HOME"/bin/java $JAVA_OPTS  com.integrosys.cms.ui.eventmonitor.EventMonitorClient com.integrosys.cms.app.eventmonitor.quitrent.MonQuitRent;

