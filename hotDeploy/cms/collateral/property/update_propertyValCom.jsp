<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<script type="text/javascript" src="js/ajaxDropdown.js"></script>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>
<script language="JavaScript" type="text/JavaScript">

function MM_swapImgRestore() { //v3.0
    var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
  }

  function MM_jumpMenu(targ,selObj,restore){ //v3.0
	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	  if (restore) selObj.selectedIndex=0;
	 
	}
  
	
  function MM_preloadImages() { //v3.0
    var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
      var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
      if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
  }

  function MM_findObj(n, d) { //v4.01
    var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
      d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
    if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
    for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
    if(!x && d.getElementById) x=d.getElementById(n); return x;
  }

  function MM_swapImage() { //v3.0
    var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
     if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
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

    function getNextPhyDate(cal, date) {
        if (cal != "" && date != "") {
            cal.sel.value = date;
        }
        lastPhyDateValue = document.forms[0].datePhyInspec_v1.value;
        frequency = document.forms[0].physInspFreq.value;
        frequencyUOM = document.forms[0].physInspFreqUOM_v1.value;

        if(!isInt(frequency))
        {
       
        document.forms[0].nextPhysInspDate_v1.value = "";
        return;
        }

        if (lastPhyDateValue != "" && frequency != "" && frequencyUOM != "") {
            frequency = parseFloat(frequency.split(' ').join(''));
            lastDate = new Date();
            lastDate.setDate(lastPhyDateValue.substring(0, 2));
            lastDate.setMonth(months[lastPhyDateValue.substring(3, 6)]);
            lastDate.setFullYear(lastPhyDateValue.substring(7, 11));
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
            nextDateStr = nextDateStr + nextDate.getDate() + "/" + month[nextDate.getMonth()] + "/" + nextDate.getFullYear();
            document.forms[0].nextPhysInspDate_v1.value = nextDateStr;
        }
    }

    function setPhysInsp(val){
        if (val == '1') {
            document.getElementById("spanPIF").style.visibility = "visible";
            document.getElementById("spanPID").style.visibility = "visible";
            document.getElementById("physInspFreqUOM_v1").disabled = false;
            document.getElementById("physInspFreq").disabled = false;
        } else if (val == '0') {
            document.getElementById("spanPIF").style.visibility = "hidden";
            document.getElementById("spanPID").style.visibility = "hidden";
            document.getElementById("physInspFreqUOM_v1").value = "";
            document.getElementById("physInspFreq").value = "";
            document.getElementById("datePhyInspec_v1").value = "";
            document.getElementById("nextPhysInspDate_v1").value = "";
            document.getElementById("physInspFreqUOM_v1").disabled = true;
            document.getElementById("physInspFreq").disabled = true;
        }
    }

    function setDatePhyInspec(){
		if(document.forms[0].isPhysInsp[0].checked){
			showCalendarWithCustomHandling('datePhyInspec_v1', 'dd/mm/y', getNextPhyDate);
		}else{
			return null;
		}
    }

	if(document.forms[0].isPhysInsp[0].checked){
		setPhysInsp('1');
		}else{
		setPhysInsp('0');
	}

	function disable(idx){
		if(cantEditChanges(idx)) return;
		document.getElementById('datePhyInspec_v' + idx).disabled=true;
		document.getElementById('datePhy' + idx).disabled=true;
		document.getElementById('nextPhysInspDate_v' + idx).disabled=true;
		document.getElementById('dateIns' + idx).disabled=true;
		document.getElementById('physInspFreqUOM_v' + idx).disabled=true;
		
		document.getElementById('datePhyInspec_v' + idx).value='';
		document.getElementById('datePhy' + idx).value='';
		document.getElementById('nextPhysInspDate' + idx).value='';
		document.getElementById('dateIns' + idx).value='';
		document.getElementById('physInspFreqUOM_v' + idx).value='';
	}

	function enable(idx){
		if(cantEditChanges(idx)) return;
		document.getElementById('datePhyInspec_v' + idx).disabled=false;
		document.getElementById('datePhy' + idx).disabled=false;
		document.getElementById('nextPhysInspDate_v' + idx).disabled=false;
		document.getElementById('dateIns' + idx).disabled=false;
		document.getElementById('physInspFreqUOM_v' + idx).disabled=false;
	}
	
	function cantEditChanges(idx) {
		if(idx != "1") {
			var valcreationdate_v1 = document.getElementById('valcreationdate_v1');
			if(valcreationdate_v1){
				var v1Date = new Date(valcreationdate_v1);
				var compareDate = document.getElementById('valcreationdate_v' + idx);
				if(compareDate){
					compareDate = new Date(compareDate.value);
					var noOfYears = 1000 * 60 * 60 * 24 * 365;
					var consideringYrs = 3;
					var actualYrs = (v1Date.getTime() - compareDate.getTime()) / noOfYears;
					if(actualYrs >= consideringYrs) return true;
				}
			}
		}
		return false;
	}
</script>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
    <tr>
      <td> <h3><bean:message key="label.security.additional.information"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
	</thead>
	<tbody>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
<!--  Added by Pramod Katkar for New Filed CR on 23-08-2013-->

	
<!--End by Pramod Katkar-->	
	
		<%@ include file="/collateral/common/common_environmental_risky_update.jsp" %>
		
<!--Start CR - Tightening of property fields -->	
	 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		<td class="fieldname"><bean:message key="label.security.date.tsr"/><font color="red">*</font>&nbsp;</td>
	            <td >
	            		<html:text property="tsrDate" readonly="true" onchange="calNextDateTsr();"/> 
	            		<img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725" onclick="return showCalendar('tsrDate', 'dd/mm/y')"
						onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
						onmouseout="MM_swapImgRestore()" /> <html:errors property="tsrDateError"/>
						<html:errors property="tsrDate"/>
				</td>
		<td class="fieldname">
				<bean:message key="label.security.tsr.frequency"/><font color="red">*</font>&nbsp; </td>	
				 <td>
	             <html:select property="tsrFrequency" styleId="tsrFrequency"  onchange="calNextDateTsr()">
			            <integro:common-code
									categoryCode="<%=CategoryCodeConstant.FREQUENCY%>"
									descWithCode="false" />
			        </html:select><html:errors property="tsrFrequencyError"/>&nbsp;
			        </td> 		
	</tr> 
	 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	 <td class="fieldname"><bean:message key="label.security.next.tsr.date"/><font color="red">*</font>&nbsp;</td>
	 			<td>
	            		<html:text property="nextTsrDate" styleId="nextTsrDate" readonly="readonly"/> 
	            		<img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725" onclick="return showCalendar('nextTsrDate', 'dd/mm/y')"
						onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
						onmouseout="MM_swapImgRestore()" /><html:errors property="nextTsrDateError"/>&nbsp;
				</td>
				
	 <td class="fieldname"><bean:message key="label.security.cersia.registration.date"/>&nbsp;</td>
	 			<td>
	            		<html:text property="cersiaRegistrationDate" styleId="cersiaRegistrationDate" readonly="readonly"/> 
	            		<img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725" onclick="return showCalendar('cersiaRegistrationDate', 'dd/mm/y')"
						onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
						onmouseout="MM_swapImgRestore()" />&nbsp;
						<html:errors property="cersiaDate"/>
				</td>
	</tr> 
<!--End CR - Tightening of property fields -->	

		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">

			<td class="fieldname">Constitution<font color="#FF0000">*
			</font>
			</td>
		    
		    	<td>
		            <html:select property ="constitution" styleId="constitution" value ="<%=iCol.getConstitution()%>" >
					<integro:common-code categoryCode="<%=CategoryCodeConstant.ENTITY%>" descWithCode="false" />
					</html:select>
					<html:errors property="constitution" />
				</td>
		</tr>

		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				<bean:message key="label.security.asset.remarks.sec.env.risk"/> </td>
			<td colspan="3"><html:textarea property="remarkEnvRisk" rows="5" cols="120" style="width:100%" />&nbsp;
		                <html:errors property="remarkEnvRisk"/>&nbsp;</td>
		</tr>
  	<span id="span_tenure_period" style="visibility:hidden" ><span class="mandatory">*</span></span>

	

		
		</table>
	</td></tr>
	</tbody>
</table>
<script language="JavaScript" type="text/JavaScript">

function calNextDateTsr(){
	
	var frequency=document.getElementById("tsrFrequency").value;
	var day=document.forms[0].tsrDate.value;
	
	if(frequency==''){
		document.getElementById('nextTsrDate').value ='';
	}
	else if(frequency!='DAILY' && frequency!='FORTNIGHTLY' && frequency!='HALF_YEARLY' && frequency!='MONTH' && frequency!='QUARTERLY'
		&& frequency!='WEEKLY' && frequency!='YEARLY' && frequency!='BI_MONTH' && frequency!='TWO_YEARLY' && frequency!='THREE_YEARLY' && frequency!='FOUR_YEARLY'){
	
	 document.getElementById('nextTsrDate').value = day;
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
	if(frequency == 'YEARLY'){
alert("yearly");
		var dy=thisDate.getDate();
    	var mn=thisDate.getMonth();  
    	var yr=thisDate.getFullYear();

    		thisDate.setYear(yr + 1) ;
			thisDate.setDate(dy) ;
			thisDate.setMonth(mn) ;
    	
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
 	 document.getElementById('nextTsrDate').value = final_date;
 	document.all.nextTsrDate.value = final_date;
	}

	}
	  
}
function calNextDate(idx){
	
	var frequency=document.getElementById("physInspFreqUOM_v" + idx).value;
	var day=document.forms[0]['datePhyInspec_v' + idx].value;
	
	if(frequency==''){
		document.getElementById('nextPhysInspDate_v' + idx).value ='';
	}
	else if(frequency!='DAILY' && frequency!='FORTNIGHTLY' && frequency!='HALF_YEARLY' && frequency!='MONTH' && frequency!='QUARTERLY'
		&& frequency!='WEEKLY' && frequency!='YEARLY' && frequency!='BI_MONTH' && frequency!='TWO_YEARLY' && frequency!='THREE_YEARLY' && frequency!='FOUR_YEARLY'){
	
	 document.getElementById('nextPhysInspDate_v' + idx).value = day;
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
	if(frequency == 'YEARLY'){
alert("yearly");
		var dy=thisDate.getDate();
    	var mn=thisDate.getMonth();  
    	var yr=thisDate.getFullYear();

    		thisDate.setYear(yr + 1) ;
			thisDate.setDate(dy) ;
			thisDate.setMonth(mn) ;
    	
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
 	 document.getElementById('nextPhysInspDate_v' + idx).value = final_date;
 	document.all['nextPhysInspDate_v' + idx].value = final_date;
	}

	}
	  
}
</script>
