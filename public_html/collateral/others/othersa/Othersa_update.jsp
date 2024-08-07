<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 java.util.Collection,
                 com.integrosys.cms.app.collateral.bus.type.others.subtype.othersa.IOthersa,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.collateral.others.RankList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.CollateralHelper,
                 com.integrosys.cms.ui.collateral.CollateralConstant,
                 com.integrosys.cms.ui.collateral.others.othersa.OthersaForm" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>
<%@page import="com.integrosys.cms.ui.collateral.others.othersa.OthersaAction"%>


<%--@ include file="/collateral/locale.jsp" --%>

<% ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.serviceColObj");

    IOthersa iCol = (IOthersa) itrxValue.getStagingCollateral();
    pageContext.setAttribute("obj", iCol);

    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();

    String prefix = "Other";
    String prefix1 = "Other";
    String subtype = "Othersa";
    String formName = subtype + "Form";
    String from_event="prepare_update" ;
    String formActionName = subtype+"Collateral.do";
	String event = itrxValue.getCollateral()==null ? "create" : "update";
    OthersaForm colForm = (OthersaForm) request.getAttribute(formName);
   
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.others.othersa.OthersaAction.from");
	String insuranceCheck = (String) session.getAttribute("com.integrosys.cms.ui.collateral.others.othersa.OthersaAction.insuranceCheck");
	String totalPolicyAmt = (String) session.getAttribute(OthersaAction.class.getName() +"."+CollateralConstant.SESSION_TOTAL_INSURANCE_POLICY_AMT);

%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
<script type="text/javascript" src="js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--

function updateInternal() {
    document.forms[0].secCustodianExt.value = '';
    document.forms[0].secCustodianExt.disabled = true;
    document.forms[0].secCustodianInt.disabled = false;
}

function updateExternal() {
    document.forms[0].secCustodianInt.value = '';
    document.forms[0].secCustodianInt.disabled = true;
    document.forms[0].secCustodianExt.disabled = false;
}
function disable(){
	document.getElementById('datePhyInspec').disabled=true;
	document.getElementById('datePhy').disabled=true;
	document.getElementById('nextPhysInspDate').disabled=true;
	document.getElementById('dateIns').disabled=true;
	document.getElementById('physInspFreqUOM').disabled=true;
	
	document.getElementById('datePhyInspec').value='';
	document.getElementById('datePhy').value='';
	document.getElementById('nextPhysInspDate').value='';
	document.getElementById('dateIns').value='';
	document.getElementById('physInspFreqUOM').value='';
}

function enable(){
	document.getElementById('datePhyInspec').disabled=false;
	document.getElementById('datePhy').disabled=false;
	document.getElementById('nextPhysInspDate').disabled=false;
	document.getElementById('dateIns').disabled=false;
	document.getElementById('physInspFreqUOM').disabled=false;
}


function submitPage(num, index) {
    enableAllFormElements();
    
    if (num == 1) {
    	document.forms[0].event.value="submit";
    }
	if (num == 2) {
    	document.forms[0].event.value="update";
    }
    if (num == 3) {
        document.forms[0].event.value="prepare";
        document.forms[0].indexID.value="-1";
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
    }
    if (num == 4) {
        document.forms[0].event.value="prepare_update_sub";
        document.forms[0].indexID.value=index;
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
    }
    if (num == 5) {
        document.forms[0].event.value="itemDelete";
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
    }
    if (num == 6) {
        document.forms[0].event.value="prepare";
        document.forms[0].indexID.value="-1";
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";	    
    }
    if (num == 7) {
        document.forms[0].event.value="prepare_update_sub";
        document.forms[0].indexID.value=index;
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
    }
    if (num == 8) {
        document.forms[0].event.value="itemDelete";
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
    }
    if (num == 9) {
        document.forms[0].event.value="update_read_valuation_from_los";
    	document.forms[0].indexID.value=index;
    	document.forms[0].from_page.value="prepare_update";
    }
    document.forms[0].submit();

}

     months = new Array();
     months['Jan'] = 0;
     months['Feb'] = 1;
     months['Mar'] = 2;
     months['Apr'] = 3;
     months['May'] = 4;
     months['Jun'] = 5;
     months['Jul'] = 6;
     months['Aug'] = 7;
     months['Sep'] = 8;
     months['Oct'] = 9;
     months['Nov'] = 10;
     months['Dec'] = 11;

     month = new Array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');

    function getMonthLength(month,year) {
       var ml;
       if(month==1 || month==3 || month==5 || month==7 || month==8 || month==10||month==12)
          {ml = 31;}
       else {
           if(month==2) {
              ml = 28;
              if(((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0))
                 ml++;
           }
           else
              {ml = 30;}
       }
       return ml;
    }

    function mandatory(obj){
      //  alert("dfsfsfsf");
        if (obj == "true"){
          //document.getElementById('show1').innerText = "* ";
          document.getElementById('chknumBulk').style.display = '';
          document.getElementById(' chknumBulk2').style.display = '';
          document.getElementById(' chknumBulk2').style.display = 'none';
          }
        else {
           
             document.getElementById('show1').innerText = " ";
             document.getElementById('chknumBulk').style.display = 'none';
             document.getElementById(' chknumBulk2').style.display = '';
         
        }
     }

    function setDatePhyInspec(){
		if(document.forms[0].physInspecDone[0].checked){
			showCalendarWithCustomHandling('datePhyInspec', 'dd/mm/y', getNextPhyDate);
		}else{
			return null;
		}
    }
  
     function getRemainPeriod(cal, date) {
        cal.sel.value = date;
        baseDate = document.forms[0].collateralMaturityDate.value;
     	currentDate = new Date();
     	base = new Date();
     	base.setFullYear(baseDate.substring(7,11));
     	base.setMonth(months[baseDate.substring(3,6)]);
     	base.setDate(baseDate.substring(0,2));
        numOfDays = 0;

        if (base.getTime() <= currentDate.getTime()) {
            document.forms[0].remainTenureYear.value = 0;
            document.forms[0].remainTenureMonth.value = 0;
            document.forms[0].remainTenureDay.value = 0;
            return;
        }

       var yc = currentDate.getFullYear();
       var mc = currentDate.getMonth() + 1;
       var dc = currentDate.getDate();

       var yb = base.getFullYear();
       var mb = base.getMonth() + 1;
       var db = base.getDate();
       // Month length 0->use calendar length

       var ma=0;
       var ya=0;

       var da = db-dc;
       // This is the all-important day borrowing code.
       if(da < 0) {
            mb--;
       // Borrow months from the year if necesssary.
            if(mb < 1) {
	            yb--;
	            mb = mb + 12;
		    }
            ml = getMonthLength(mb,yb);
    	    da = da + ml;
       }

       ma = mb - mc;
       // Month borrowing code - borrows months from years.
       if(ma < 0) {
            yb--;
	        ma = ma + 12;
       }
       ya = yb - yc;

       document.forms[0].remainTenureYear.value = ya;
       document.forms[0].remainTenureMonth.value = ma;
       document.forms[0].remainTenureDay.value = da;
     }

    function getNextPhyDate(cal, date) {
        if (cal != "" && date != "") {
            cal.sel.value = date;
        }
        lastPhyDateValue = document.forms[0].datePhyInspec.value;
        frequency = document.forms[0].physInspFreq.value;
        frequencyUOM = document.forms[0].physInsFreqUOM.value;

        if (lastPhyDateValue != "" && frequency != "" && frequencyUOM != "") {
            frequency = parseFloat(frequency.split(' ').join(''));
            lastDate = new Date();
     	    lastDate.setDate(lastPhyDateValue.substring(0,2));
     	    lastDate.setMonth(months[lastPhyDateValue.substring(3,6)]);
     	    lastDate.setFullYear(lastPhyDateValue.substring(7,11));
            nextDate = new Date();
            if (frequencyUOM == 'D') {
                nextDate = lastDate.add(Date.DAY, frequency);
            }
            if (frequencyUOM == 'W') {
                nextDate = lastDate.add(Date.DAY, (frequency * 7));
            }
            if (frequencyUOM == 'M') {
                nextDate = lastDate.add(Date.MONTH, frequency);
            }
            if (frequencyUOM == 'Y') {
                nextDate = lastDate.add(Date.YEAR, frequency);
            }
            nextDateStr = "";
            if (nextDate.getDate() < 10) {
                nextDateStr = "0";
            }
            nextDateStr = nextDateStr + nextDate.getDate()+"/"+month[nextDate.getMonth()]+"/"+nextDate.getFullYear();
            document.forms[0].nextPhyInspecDate.value = nextDateStr;
        }
    }

  
	
//-->
</script>
<script language="JavaScript" type="text/JavaScript">
   
    function calNextDate1(){
    	var frequency=document.getElementById("physInspFreqUOM").value;
    	var day=document.forms[0].datePhyInspec.value;
	
		if(frequency==''){
			document.getElementById('nextPhysInspDate').value ='';
		}
		else if(frequency!='DAILY' && frequency!='FORTNIGHTLY' && frequency!='HALF_YEARLY' && frequency!='MONTH' && frequency!='QUARTERLY'
			&& frequency!='WEEKLY' && frequency!='YEARLY' && frequency!='BI_MONTH'  && frequency!='TWO_YEARLY' && frequency!='THREE_YEARLY' && frequency!='FOUR_YEARLY'){
		
		 document.getElementById('nextPhysInspDate').value = day;
		}
		else{
			
			
    	if(isNaN(day)){
    		
    	
    	var udate_month = day.substring(3,6);  
    	
    	 switch(udate_month)
   		 {
   		 case 'Jan':
   			 udate_month='00';
   			
                break;
   		 case 'Feb':
   			 udate_month='01';
   			 break;
   		 case 'Mar':
   			 udate_month='02';
   			
   			 break;
   		 case 'Apr':
   			 udate_month='03';
   			 break;
   		 case 'May':
   			 udate_month='04';
   			
   			 break;
   		 case 'Jun':
   			 udate_month='05';
   			 break;
   		 case 'Jul':
   			 udate_month='06';
   			
   			 break;
   		 case 'Aug':
   			 udate_month='07';
   			
   			 break;
   		 case 'Sep':
   			 udate_month='08';
   			 break;
   		 case 'Oct':
   			 udate_month='09';
   			
   			 break;
   		 case 'Nov':
   			 udate_month='10';
   			 break;
   		 case 'Dec':
   			 udate_month='11';
   			
   			 break;
   			
   			
   			 }
    	 
    	var thisDate = new Date(day.substring(7,11),udate_month,day.substring(0,2));

    	
    	}
    	if(thisDate!=null && isNaN(frequency)){
    	
    	if(frequency == 'DAILY'){
       thisDate.setDate(thisDate.getDate() + 1);
   		 }
    	if(frequency == 'FORTNIGHTLY'){
    	       thisDate.setDate(thisDate.getDate() + 15);
    	   		 }
    	if(frequency == 'HALF_YEARLY'){      	
        	if(thisDate.getMonth()==7){
        		var mn=thisDate.getMonth();        
        		var yr=thisDate.getYear();        	
        				mn=mn+6;
        		        	if(mn>11){
        		            mn=mn-11;
        		            mn--;        		       
        					yr++; 
        					   			
        					var dy=thisDate.getDate();
					if(mn==1){		
						if(dy>28){
							dy=28;
							if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
								dy++;
						}			
						
						}       	
        					thisDate.setYear(yr) ;
        					thisDate.setDate(dy) ;
        					thisDate.setMonth(mn) ;
        					
        	}}else{
            	
            	var dy=thisDate.getDate();
            	var mn=thisDate.getMonth();  
            	
            	if(thisDate.getMonth()==4 || thisDate.getMonth()==9){
                	if(dy==31){
                		dy--;
                	}
                	
                	
            	}
            	
            	thisDate.setDate(dy) ;
        		thisDate.setMonth(thisDate.getMonth()+ 6) ; 
        		 
        	}	
		  	
    	   		 
    	}
    	if(frequency == 'MONTH'){
        	if(thisDate.getMonth()==00){
        		
        		var mn=thisDate.getMonth();        
        		var yr=thisDate.getYear();
        		mn=mn+1;
        		if(mn==1){
            		
            		
            		var dy=thisDate.getDate();
            				
    					if(dy>28){
    						dy=28;
    						if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
    							dy++;
    					}			
    					
    					       	
        					thisDate.setYear(yr) ;
        					thisDate.setDate(dy) ;
        					thisDate.setMonth(mn) ;
        					
        	}
            	}else{
        		

            		
                	var dy=thisDate.getDate();
                	var mn=thisDate.getMonth();  
                
                	if(thisDate.getMonth()==0 || thisDate.getMonth()==2 ||thisDate.getMonth()==4 ||thisDate.getMonth()==7 ||thisDate.getMonth()==9){
                    	if(dy==31){
                    		dy--;
                    	}
                    
                    	
                	}
                
                	thisDate.setDate(dy) ;
            		thisDate.setMonth(thisDate.getMonth()+ 1) ; 
        		}
   		      	
    	   		 }
    	if(frequency == 'QUARTERLY'){
        	if(thisDate.getMonth()==10){
    		
    		var mn=thisDate.getMonth();        
    		var yr=thisDate.getYear();
    		mn=mn+3;
    		if(mn==13){
        		mn=mn-11;
        		mn--;
        		yr++;
        		
        		var dy=thisDate.getDate();
        		if(mn==1){		
					if(dy>28){
						dy=28;
						if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
							dy++;
					}			
					
					}       	
    					thisDate.setYear(yr) ;
    					thisDate.setDate(dy) ;
    					thisDate.setMonth(mn) ;
    					
    	}
        	}else{
    		
        		
            	var dy=thisDate.getDate();
            	var mn=thisDate.getMonth();  
            
            	if(thisDate.getMonth()==0 || thisDate.getMonth()==2 ||thisDate.getMonth()==7){
                	if(dy==31){
                		dy--;
                	}
                
                	
            	}
        
            	thisDate.setDate(dy) ;
        		thisDate.setMonth(thisDate.getMonth()+ 3) ; 
    		}
         	
    	   		 }
    	if(frequency == 'WEEKLY'){
    	       thisDate.setDate(thisDate.getDate() + 7);
    	   		 }
    	
    	if(frequency == 'TWO_YEARLY'){
    		
    		var dy=thisDate.getDate();
        	var mn=thisDate.getMonth();  
        	var yr=thisDate.getFullYear();
        	
        		thisDate.setYear(yr + 2) ;
    			thisDate.setDate(dy) ;
    			thisDate.setMonth(mn) ;
        	
    	}
    	if(frequency == 'THREE_YEARLY'){
    	    
    		var dy=thisDate.getDate();
        	var mn=thisDate.getMonth();  
        	var yr=thisDate.getFullYear();

        		thisDate.setYear(yr + 3) ;
    			thisDate.setDate(dy) ;
    			thisDate.setMonth(mn) ;
        	
    	}
    	if(frequency == 'FOUR_YEARLY'){
    	    
    		var dy=thisDate.getDate();
        	var mn=thisDate.getMonth();  
        	var yr=thisDate.getFullYear();

        		thisDate.setYear(yr + 4) ;
    			thisDate.setDate(dy) ;
    			thisDate.setMonth(mn) ;
        	
    	}
    	if(frequency == 'YEARLY'){
    		alert("called");
    		if(thisDate.getMonth()==1){
            	var dy=thisDate.getDate();
            	var mn=thisDate.getMonth();  
            	var yr=thisDate.getYear();  
            	yr++;
            	if(dy>28){
					dy=28;
					if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
						dy++;
				}
        		thisDate.setYear(thisDate.getYear() + 1) ;
				thisDate.setDate(dy) ;
				thisDate.setMonth(mn) ;
        	}else{
    	       thisDate.setYear(thisDate.getYear() + 1);
    	   		 }
    	   		 }
    	if(frequency == 'BI_MONTH'){
    		if(thisDate.getMonth()==11){
        		var mn=thisDate.getMonth();        
        		var yr=thisDate.getYear();        	
        				mn=mn+2;
        		        	if(mn>11){
        		            mn=mn-11;
        		            mn--;        		       
        					yr++; 
        				 			
        					var dy=thisDate.getDate();
					if(mn==1){		
						if(dy>28){
							dy=28;
							if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
								dy++;
						}			
						
						}       	
        					thisDate.setYear(yr) ;
        					thisDate.setDate(dy) ;
        					thisDate.setMonth(mn) ;
        					
        	}}else{
            	
            	var dy=thisDate.getDate();
            	var mn=thisDate.getMonth();  
            	
            	if(thisDate.getMonth()==6){
                	if(dy==31){
                		dy--;
                	}              	
                	
            	}
            	
            	thisDate.setDate(dy) ;
        		thisDate.setMonth(thisDate.getMonth()+ 2) ; 
        		 
        	}	
		  	
 	   		 }
    	
    	
      var cal_month=thisDate.getMonth();  
   
      switch(cal_month.toString())
		 {
      
		 case '0':
			 cal_month='Jan';
             break;
		 case '1':
			 cal_month='Feb';
			 break;
		 case '2':
			 cal_month='Mar';
			 break;
		 case '3':
			 cal_month='Apr';
			 break;
		 case '4':
			 cal_month='May';
			 break;
		 case '5':
			 cal_month='Jun';
			 break;
		 case '6':
			 cal_month='Jul';
			 break;
		 case '7':
			 cal_month='Aug';
			 break;
		 case '8':
			 cal_month='Sep';
			 break;
		 case '9':
			 cal_month='Oct';
			 break;
		 case '10':
			 cal_month='Nov';
			 break;
		 case '11':
			 cal_month='Dec';
			 break;		
			
			 }

		
      if(thisDate.getDate()<10){
			var date=thisDate.getDate().toString();
			var date1='0'+date;
			}
		
		if(date1 != null){
		 var final_date=date1+'/'+cal_month+'/'+thisDate.getFullYear().toString();
		}else{
			 var final_date=thisDate.getDate().toString()+'/'+cal_month+'/'+thisDate.getFullYear().toString();
		}
	
      document.getElementById('nextPhysInspDate').value = final_date;
    	}

		}
     }
</script>


</head>

<body>
<%@ include file="/collateral/ssc.jsp" %>
<%@ include file="/collateral/check_user.jsp" %>

<html:form action="OthersaCollateral.do">
<input type="hidden" name="event">
<input type="hidden" name="indexID"/>
<input type="hidden" name="subtype" value="Othersa"/>
<input type="hidden" name="itemType"/>
<input type="hidden" name="from_page"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td colspan="2"><h3>
			<% if (event.equals("create")) { %>
				<bean:message key="label.security.title.create.others"/>
			<% } else { %>
				<bean:message key="label.security.title.edit.others"/>
			<% } %>
		</h3></td>
    </tr>
</thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>	
    <tr>
        <td><h3><bean:message key="label.security.general"/></h3></td>
        <td width="50%" align="right">
            <% if (isDeleting) { %>
                <p class="deletedItem"> DELETED </p>
            <% } %>
        </td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
<!--  Added by Pramod Katkar for New Filed CR on 22-08-2013-->
    <tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
			<%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
		</tbody>
		</table>
	</td>
	</tr>
	<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
			<%@ include file="/collateral/update_common_security_fields.jsp" %>
			<%@ include file="/collateral/collateral_general_common_field.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
</tbody>
</table>

<!--CERSAI Fields JSP @Required actionPathName from update_basic_security_fields jsp and prefix -->
 	<%@ include file="/collateral/common/update_common_cersai_fields.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
      <td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
</thead>
<tbody>
	<tr>

	<td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
   <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.phy.verification"/><font color="red">*</font>&nbsp;</td>
    <td>
    <%if( null!=colForm.getIsPhysInsp() || !"".equals(colForm.getIsPhysInsp())){ %>
          <html:radio property="isPhysInsp" value="true" onclick="enable()" ><bean:message key="label.common.yes"/></html:radio> &nbsp;&nbsp;
        <html:radio property="isPhysInsp" value="false" onclick="disable()">
        <bean:message key="label.common.no"/></html:radio>
       <%}else{ %>
       <input type="radio" name="isPhysInsp" value="true" onclick="enable()" checked="checked">Yes</input>
			<input type="radio" name="isPhysInsp" value="false" onclick="disable()" >No</input>
       <%} %>
        <html:errors property="isPhysInsp"/></td>
    <td class="fieldname">
        <bean:message key="label.security.phy.verification.frequency"/><font color="red">*</font>&nbsp;
         <font color="#0000FF"><span id="show1" class="mandatoryPerfection">&nbsp;</span></font></td>
         <%if("true".equalsIgnoreCase(colForm.getIsPhysInsp())){ %>
    <td id="chknumBulk" >
         <html:select property="physInspFreqUOM" styleId="physInspFreqUOM" onchange="calNextDate1()">
			            <integro:common-code
									categoryCode="<%=CategoryCodeConstant.FREQUENCY%>"
									descWithCode="false" />
			        </html:select>&nbsp;
        <html:errors property="physInspFreqUOM"/></td>
        <%}else if("false".equalsIgnoreCase(colForm.getIsPhysInsp())){ %>
        <td id="chknumBulk" >
   
         <html:select property="physInspFreqUOM" styleId="physInspFreqUOM" disabled="true" onchange="calNextDate1()">
			            <integro:common-code
									categoryCode="<%=CategoryCodeConstant.FREQUENCY%>"
									descWithCode="false" />
			        </html:select>&nbsp;
        <html:errors property="physInspFreqUOM"/></td>
        <%}else if("".equalsIgnoreCase(colForm.getIsPhysInsp())){ %>
        <td id="chknumBulk" >
   
         <html:select property="physInspFreqUOM" styleId="physInspFreqUOM" disabled="true" onchange="calNextDate1()">
			            <integro:common-code
									categoryCode="<%=CategoryCodeConstant.FREQUENCY%>"
									descWithCode="false" />
			        </html:select>&nbsp;
        <html:errors property="physInspFreqUOM"/></td>
        <%} %>
        
        
            
</tr>

  <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname">
        <bean:message key="label.security.last.phy.verification.date"/><font color="red">*</font>&nbsp;
        <span id="spanPID" style="visibility:hidden"></span></td>
       <td>  <%if("true".equalsIgnoreCase(colForm.getIsPhysInsp())){ %>   			
   			
         <html:text property="datePhyInspec" styleId="datePhyInspec" readonly="true" size="15" maxlength="11"  onchange="calNextDate1();"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="datePhy" onclick="return showCalendar('datePhyInspec', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"></input>
        <html:errors property="datePhyInspec"/>
        <%}else if("false".equalsIgnoreCase(colForm.getIsPhysInsp())){  %>
           <html:text property="datePhyInspec" styleId="datePhyInspec" readonly="true" size="15" maxlength="11" disabled="true"  onchange="calNextDate1();"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="datePhy" onclick="return showCalendar('datePhyInspec', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" disabled="true" ></input>
        <html:errors property="datePhyInspec"/>
    <%}else if("".equalsIgnoreCase(colForm.getIsPhysInsp())){  %>
     <html:text property="datePhyInspec" styleId="datePhyInspec" readonly="true" size="15" maxlength="11"  onchange="calNextDate1();"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="datePhy" onclick="return showCalendar('datePhyInspec', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"></input>
        <html:errors property="datePhyInspec"/>
    <%} %></td>
    <td class="fieldname"><bean:message key="label.security.next.phy.verification.date"/><font color="red">*</font>
    </td>
  <td>  <%if("true".equalsIgnoreCase(colForm.getIsPhysInsp())){ %>   			
   			
         <html:text property="nextPhysInspDate" styleId="nextPhysInspDate" readonly="true" size="15" maxlength="11"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="dateIns" onclick="return showCalendar('nextPhysInspDate', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
        <html:errors property="nextPhysInspDateError"/>
        <%}else if("false".equalsIgnoreCase(colForm.getIsPhysInsp())){  %>
           <html:text property="nextPhysInspDate" styleId="nextPhysInspDate" readonly="true" size="15" maxlength="11" disabled="true"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="dateIns" onclick="return showCalendar('nextPhysInspDate', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" disabled="true"></input>
        <html:errors property="nextPhysInspDateError"/>
    <%}else if("".equalsIgnoreCase(colForm.getIsPhysInsp())){  %>
     <html:text property="nextPhysInspDate" styleId="nextPhysInspDate" readonly="true" size="15" maxlength="11"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="dateIns" onclick="return showCalendar('nextPhysInspDate', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
        <html:errors property="nextPhysInspDateError"/>
    <%} %></td>
   
	 <%--<td><html:text property="nextPhysInspDate" size="15" maxlength="11" disabled="true"/></td>--%>
</tr> 
<!--End by Pramod Katkar-->

	        <%@ include file="/collateral/common/common_environmental_risky_update.jsp" %>
	        <%@ include file="/collateral/common/common_fields_update.jsp" %>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					Goods Status</td>
				<td>
				
				<html:select name="OthersaForm"   property="goodStatus" >
		        <integro:common-code categoryCode="<%=CategoryCodeConstant.GOODS_STATUS%>" descWithCode="false" />
                   </html:select>
				
				
        </td>

				
				
				  <td class="fieldname">&nbsp;
				  
				</td>
				<td>&nbsp;
				 </td>
					
			</tr>
			<%-- FSVBalance field is used for asset Value at the time of
			 collateral booking & reservePrice field is used for 
			 Residual scrap value  By Sachin patil --%>
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.asset.asset.value.collat.booking"/>
				</td>
			    <td><html:text property="FSVBalance" maxlength="15" size="23" styleId="FSVBalance" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
			    <html:errors property="FSVBalance"  /></td>
			    
			    <td class="fieldname"><bean:message key="label.security.asset.residual.scrap.value.new"/></td>
				    <td><html:text property="reservePrice" maxlength="23" size="34" styleId="reservePrice" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
				        &nbsp;<html:errors property="reservePrice"/></td>
            </tr>
			

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="fieldname">
	                <bean:message key="label.security.collateral.description"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	            <td colspan="3">
	                <html:textarea property="description" rows="5" cols="120" style="width:100%" />&nbsp;
	                <html:errors property="description"/></td>
	        </tr>

        </tbody>
        </table>
     </td>
    </tr>
</tbody>
</table>


<%@ include file="/collateral/insurancepolicy/update_insurance_summary.jsp" %>
<%
if(!"no".equals(insuranceCheck))
{
%>

<%@ include file="/collateral/update_security_coverage.jsp" %>
<%
}
%>
<%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>
<jsp:include page="/collateral/common/common_maker_remarks.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="trxRemarks" value="<%=itrxValue.getRemarks() %>"/>
	<jsp:param name="trxUserInfo" value="<%=itrxValue.getUserInfo() %>"/>
</jsp:include>

<jsp:include page="/collateral/common/common_maker_update_button.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="actionName" value="<%=formActionName%>"/>
	<jsp:param name="collateralID" value="<%=(itrxValue.getCollateral() != null) ? itrxValue.getCollateral().getCollateralID(): ICMSConstant.LONG_INVALID_VALUE%>" />
</jsp:include>
</html:form>



<%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %>

</body>

</html>
