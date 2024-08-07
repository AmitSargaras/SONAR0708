<%@ page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargeplant.ISpecificChargePlant"%>
<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetspecplant.AssetSpecPlantForm"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	int rowIdx = Integer.parseInt(request.getParameter("rowIdx"));
	String formName = request.getParameter("formName");
	String goodStatus = request.getParameter("goodStatus");
	AssetSpecPlantForm colForm = (AssetSpecPlantForm) request.getAttribute(formName);
%>
<script type="text/javascript" src="js/ajaxDropdown.js"></script>
<script type="text/javascript">
<!--
	function refreshModel(brand) {
		var brandValue = brand.options[brand.selectedIndex].value;
		var dropDownToBeRefresh = 'modelNo';
		
		var url = '<%=request.getContextPath()%>/commoncode/' + "get_common_code.jsp" + '?dropdown_name=modelOptions&brand='+brandValue+'&code=MODEL&ref='+brandValue+'&desc=true';
		
		sendLoadDropdownReq(dropDownToBeRefresh, url);
	}
	
	function refreshYearOfManufacture(model) {
		var modelValue = model.options[model.selectedIndex].value;
		var dropDownToBeRefresh = 'yearOfManufacture';
		
		var makeObject = document.forms[0].brand;
		var makeValue = makeObject.options[makeObject.selectedIndex].value;
		
		var url = '<%=request.getContextPath()%>/commoncode/' + "get_common_code.jsp" + '?dropdown_name=yearOfManufactureOptions&brand='+modelValue+'&code=MODEL_YEAR_MAP&ref='+makeValue + '|' +modelValue;
		
		sendLoadDropdownReq(dropDownToBeRefresh, url);
	}
	function YearCalculate()
{
  	var PD = document.getElementById("perfectionDate").value;
	var RD = document.getElementById("repossessionDate").value;	
	var year = PD.substring(7,11);
	var year2 = RD.substring(7,11);
	//alert(year);
	
	var YOM = document.getElementById("yearOfManufacture").value;
		
	PD1=parseInt(year);
	RD1=parseInt(year2);
	YOM2=parseInt(YOM);
	
	
	var age = PD1 - YOM2;
	var FinalAnswer= age;
	/*if (isNaN(FinalAnswer)) {
		document.getElementById("spanDocPerfectAge").innerText= '' ;
		document.getElementById("docPerfectAge").value='';
	} else {
		document.getElementById("spanDocPerfectAge").innerText= FinalAnswer ;
		document.getElementById("docPerfectAge").value=FinalAnswer;
	}*/
	
	age = RD1 - YOM2;
	FinalAnswer= age;
	if (isNaN(FinalAnswer)) {
		document.getElementById("spanRepossessionAge").innerText= '' ;
		document.getElementById("repossessionAge").innerText= '' ;
	} else {
		document.getElementById("spanRepossessionAge").innerText= FinalAnswer ;
		document.getElementById("repossessionAge").innerText= FinalAnswer ;
	}
}


function closeHandler(cal) {
  cal.hide();   // hide the calendar
 // YearCalculate();
  // don't check mousedown on document anymore (used to be able to hide the
  // calendar when someone clicks outside it, see the showCalendar function).
  Calendar.removeEvent(document, "mousedown", checkCalendar);

  Calendar.removeEvent(document, "scroll", checkCalendar);
  Calendar.removeEvent(document, "mousewheel", checkCalendar);
  Calendar.removeEvent(document, "keydown", checkCalendar);
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
	    lastPhyDateValue = document.forms[0].datePhyInspec.value;
	    frequency = document.forms[0].physInspFreq.value;
	    frequencyUOM = document.forms[0].physInspFreqUOM.value;
	
	    if(!isInt(frequency))
	    {
	    if(document.forms[0].isPhysInsp[0].checked){
	    alert("Physical Inspection Frequency should be a Integer!");
	    }
	    document.forms[0].nextPhysInspDate.value = "";
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
	        document.forms[0].nextPhysInspDate.value = nextDateStr;
	    }
	}
	
	function setPhysInsp(val){
	    if (val == '1') {
	        document.getElementById("spanPIF").style.visibility = "visible";
	        document.getElementById("spanPID").style.visibility = "visible";
	    } else if (val == '0') {
	        document.getElementById("spanPIF").style.visibility = "hidden";
	        document.getElementById("spanPID").style.visibility = "hidden";
	        document.getElementById("physInspFreqUOM").value = "";
	    }
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

	function calNextDate1(){
    	var frequency=document.getElementById("physInspFreqUOM").value;
    	var day=document.forms[0].datePhyInspec.value;
	
		if(frequency==''){
			document.getElementById('nextPhysInspDate').value ='';
		}
		else if(frequency!='DAILY' && frequency!='FORTNIGHTLY' && frequency!='HALF_YEARLY' && frequency!='MONTH' && frequency!='QUARTERLY'
			&& frequency!='WEEKLY' && frequency!='YEARLY' && frequency!='BI_MONTH'){
		
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
    	if(frequency == 'YEARLY'){
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
-->
</script>

<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.serial.no"/></td>
    <td><html:text property="serialNumber" maxlength="15"/>&nbsp;
        <html:errors property="serialNumber"/></td>
    <td class="fieldname"><bean:message key="label.security.invoice.no"/> &nbsp;</td>
    <td><html:text property="invoiceNumber" maxlength="20"/>
        &nbsp;<html:errors property="invoiceNumber"/></td>
</tr>

--%>
<tr>
                        
							<td class="amount" colspan="4"><input onclick="javascript : dispNonMandatoryField()"
								name="AddNew12" type="button" id="AddNew12" value="Additional Details"
								class="btnNormal" />&nbsp;<input onclick="javascript : hideNonMandatoryField()"
								name="AddNew13" type="button" id="AddNew13" value="Hide Additional Details"
								class="btnNormal" /></td>
								
</tr>

<tbody id="disp1" style="display: none;">
  <!--  Added by Pramod Katkar for New Filed CR on 21-08-2013-->
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
   			
         <html:text property="datePhyInspec" styleId="datePhyInspec" readonly="true" size="15" maxlength="11" onchange="calNextDate1();"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="datePhy" onclick="return showCalendar('datePhyInspec', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
        <html:errors property="datePhyInspec"/>
        <%}else if("false".equalsIgnoreCase(colForm.getIsPhysInsp())){  %>
           <html:text property="datePhyInspec" styleId="datePhyInspec" readonly="true" size="15" maxlength="11" onchange="calNextDate1();" />
        <input type="image" src="img/calendara.gif" name="Image723" id="datePhy" onclick="return showCalendar('datePhyInspec', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" disabled="true"></input>
        <html:errors property="datePhyInspec"/>
    <%}else if("".equalsIgnoreCase(colForm.getIsPhysInsp())){  %>
     <html:text property="datePhyInspec" styleId="datePhyInspec" readonly="true" size="15" maxlength="11" onchange="calNextDate1();"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="datePhy" onclick="return showCalendar('datePhyInspec', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
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
           <html:text property="nextPhysInspDate" styleId="nextPhysInspDate" readonly="true" size="15" maxlength="11" />
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
<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.registration.fee"/></td>
    <td><html:text property="registrationFee" maxlength="23"/>&nbsp;
        &nbsp;<html:errors property="registrationFee"/></td>
    <td class="fieldname"><bean:message key="label.security.asset.registration.date"/></td>
    <td><html:text property="registrationDate" readonly="true" size="15" maxlength="11"/>
        <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('registrationDate', 'dd/mm/y')"
                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
        &nbsp;<html:errors property="registrationDate"/></td>
</tr>

--%><tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">

<td class="fieldname" width="20"><span><bean:message key="label.security.asset.makebrand"/></span> &nbsp;
            </td>
    <td width="30"><html:text property="brand" maxlength="30"/>&nbsp;
         &nbsp; <html:errors property="brand"/></td>

    <%--<td class="fieldname">
		<span class=stp><bean:message key="label.security.asset.make"/></span>&nbsp;<bean:message key="label.mandatory"/></td>
	<td><html:select property="brand" onchange="refreshModel(this)">
			<integro:common-code categoryCode="<%=CategoryCodeConstant.VEHICLE_BRAND%>" />
		</html:select>&nbsp;<html:errors property="brand"/></td>
		 
		 --%><td class="fieldname" width="20"><span><bean:message key="label.security.asset.modelno"/></span> &nbsp;
            </td>
    <td width="30"><html:text property="modelNo" maxlength="30"/>&nbsp;
         &nbsp; <html:errors property="modelNo"/></td>
		
		
    <%--<td class="fieldname">
		<span class=stp><bean:message key="label.security.asset.model"/></span>&nbsp;<bean:message key="label.mandatory"/></td>
	<td><html:select property="modelNo" >
			<logic:notEmpty name="AssetSpecPlantForm" property="brand">
				<integro:common-code categoryCode="<%=CategoryCodeConstant.ASSET_MODEL_TYPE%>" refEntryCode="<%=form.getBrand()%>" />
			</logic:notEmpty>
			<logic:empty name="AssetSpecPlantForm" property="brand">
				<option label="Please Select" value="" />
			</logic:empty>
		</html:select>&nbsp;<html:errors property="modelNo"/></td>
--%><%--    <td class="tooltips"><bean:message key="label.security.asset.typeofplant"/>&nbsp;<span class="style2">&nbsp;<bean:message key="label.mandatory"/></span>
		<a href="#"><font color="#0000FF" style="text-decoration:none">Host Ref.<span class="Float"><integro:empty-if-null value="<%=iCol.getAssetTypeHostRef()%>"/></span></font></a></td>--%>
</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname">
		<bean:message key="label.security.asset.yearofmanufacture"/> &nbsp;</td>
    <td><%-- <html:text property="yearOfManufacture" maxlength="4" onkeyup="YearCalculate()" /> --%>
	   	<html:select property="yearOfManufacture" onchange="YearCalculate()">
			<option value=""><bean:message key="label.please.select"/></option>
            <html:options collection="yearOfManufactureOptions" property="value" labelProperty="label"/>
    	</html:select>
        &nbsp;<html:errors property="yearOfManufacture"/></td>
         
         <%-- residualAssetLife field is used as year of installation by sachin patil --%>
    <td class="fieldname">
		<bean:message key="label.security.asset.yearofinstallation"/> &nbsp;</td>
    <td><%-- <html:text property="yearOfManufacture" maxlength="4" onkeyup="YearCalculate()" /> --%>
	   	<html:select property="residualAssetLife" onchange="YearCalculate()">
			<option value=""><bean:message key="label.please.select"/></option>
            <html:options collection="yearOfManufactureOptions" property="value" labelProperty="label"/>
    	</html:select>
        &nbsp;<html:errors property="residualAssetLife"/></td>
	<%--<td class="fieldname"><bean:message key="label.security.asset.typeofplant"/>&nbsp;<bean:message key="label.mandatory"/></td>
	<td><html:select property="assetType">
            <option value="">Please Select </option>
            <html:options name="plantEquipID" labelName="plantEquipValue"/>
        </html:select>
        &nbsp;<html:errors property="assetType"/></td>
--%></tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><span><bean:message key="label.security.asset.purchase.price"/></span> &nbsp;
            </td>
    <td><html:text property="purchasePrice" maxlength="18" size="17" styleId="purchasePrice" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
         &nbsp; <html:errors property="purchasePrice"/></td>
    <td class="fieldname">
		<span><bean:message key="label.security.asset.date.purchase"/></span>&nbsp;</td>
    <td><html:text property="datePurchase" readonly="true" size="15" maxlength="11"/>
                <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('datePurchase', 'dd/mm/y')"
                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                    &nbsp;<html:errors property="datePurchase"/></td>
</tr>

<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.residual.asset.life"/>
        <!--<span id="spanASSETLIFE"><bean:message key="label.mandatory"/></span>--></td>
    <td><bean:write name="<%=formName %>" property="residualAssetLife"/>&nbsp;<bean:write name="<%=formName %>" property="residualAssetLifeUOM"/></td>
    
    
   
    
    
    <td class="fieldname">
		<span class=stp><bean:message key="label.security.asset.residual.scrap.value"/></span>
        <!--<span id="spanSCRAPVALUE" ><bean:message key="label.mandatory"/></span>--></td>
    <td><html:text property="scrapValue" maxlength="18"/>
        &nbsp;<html:errors property="scrapValue"/></td>
</tr>

--%><!--<html:hidden property="assetValue"/>-->
 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
   <td class="fieldname"><bean:message key="label.security.asset.asset.value.collat.booking"/>
		<!--<span id="spanASSETVALUE" >   <bean:message key="label.mandatory"/></span>--></td>
    <td><html:text property="assetValue" maxlength="15" size="24" styleId="assetValue" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
        <html:errors property="assetValue"  /></td>
    <%--<td class="fieldname"><bean:message key="label.security.asset.ageofasset"/> &nbsp;</td>
    <td><span id="spanDocPerfectAge">0</span>&nbsp;Year(s)</td>
		<html:hidden property="docPerfectAge"/>
		
		--%>
		
    <td class="fieldname"><bean:message key="label.security.asset.inspector.name"/> </td>
    <td><html:text property="prevOwnerName" maxlength="50"/></td>
    <%--<td class="fieldname"><bean:message key="label.security.asset.previous.financier.name"/> </td>
    <td><html:text property="prevFinancierName" maxlength="50"/></td>
--%>
			        
</tr>



<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <%--<td class="fieldname">
		<span class=stp><bean:message key="label.security.asset.repossession.date"/></span></td>
    <td><html:text property="repossessionDate" readonly="true" size="15" maxlength="11"/>
        <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('repossessionDate', 'dd/mm/y')"
                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                    &nbsp;<html:errors property="repossessionDate"/></td>
    --%><td class="fieldname">
		<bean:message key="label.security.asset.ageofplant.equipment.date"/> </td>
    <%--<td><span id="spanRepossessionAge">0</span>&nbsp;Year(s)</td>
	<html:text property="repossessionAge"/>
	
	--%> 
	<%-- yard is used as physical inspection dropdown value field by sachin patil--%>
	<td><html:text property="repossessionAge" size="2" maxlength="2" value=""/>&nbsp;<html:errors property="repossessionAge"/>
			        <html:select property="yard" >
			            <option value=""><bean:message key="label.please.select"/> </option>
			            <html:options name="freqValue" labelName="freqValue"/>
			        </html:select>&nbsp;
			        <html:errors property="yard"/></td>
			       <%-- registrationCardNo is used as document Perfect Age dropdown value field by sachin patil--%>
		<td class="fieldname">
		<bean:message key="label.security.asset.ageofassetdoc"/> </td>
		<td><html:text property="docPerfectAge" size="2" maxlength="2" value=""/>&nbsp;<html:errors property="docPerfectAge"/>
			        <html:select property="registrationCardNo" >
			            <option value=""><bean:message key="label.please.select"/> </option>
			            <html:options name="freqValue" labelName="freqValue"/>
			        </html:select>&nbsp;
			        <html:errors property="registrationCardNo"/></td>
</tr>




<%-- prevOwnerName field is used for inspector name  by Scahin Patil
--%>
<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname">
		<bean:message key="label.security.asset.yard"/> </td>
    <td><html:text property="yard"  />
 	<html:errors property="yard"  /></td>
    <td class="fieldname">
		<span class=stp><bean:message key="label.security.asset.sales.proceed"/></span></td>
    <td><html:text property="salesProceed" maxlength="18"/>&nbsp;
        <html:errors property="salesProceed"  /></td>
</tr>

--%>
<%--<%@ include file="/collateral/common/common_exchange_control_update.jsp" %>
				
--%>
<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="fieldname">
		<bean:message key="label.security.asset.cgc.pledged"/> </td>
	<td><html:radio property="cgcPledged" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/> </html:radio> &nbsp;
		<html:radio property="cgcPledged" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/> </html:radio> &nbsp; </td>
	<td class="fieldname">
		<span class=stp><bean:message key="label.security.asset.date.chattel.sold"/></span>&nbsp;</td>
	<td><html:text property="chattelSoldDate" readonly="true" size="15" maxlength="11"/>
		<img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
			 onclick="showCalendar('chattelSoldDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			 onmouseout="MM_swapImgRestore()"/>&nbsp;<html:errors property="chattelSoldDate"/></td>
</tr>
				
--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="fieldname">
		<span class=stp><bean:message key="label.security.asset.downpayment.tradein"/></span>&nbsp;</td>
	<td><html:text property="dptradein" onchange="checkTradein(this);" />&nbsp;<html:errors property="dptradein"/></td>
	<td class="fieldname">
		<span class=stp> <bean:message key="label.security.asset.tradein.value"/></span>&nbsp;
		<span id="spanTrade" ><bean:message key="label.mandatory"/></span></td>
	<td><html:text property="tradeinValue" />&nbsp;<html:errors property="tradeinValue"/></td>
</tr>
				
--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="fieldname">
		<span class=stp><bean:message key="label.security.asset.rl.serialno"/></span>&nbsp;</td>
	<td><html:text property="rlSerialNumber"  />&nbsp;<html:errors property="rlSerialNumber"/></td>
	<td class="fieldname">
		<span class=stp> <bean:message key="label.security.asset.downpayment.cash"/></span>&nbsp;</td>
	<td><html:text property="dpcash"  />&nbsp;<html:errors property="dpcash"/></td>
</tr>
				
--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="fieldname">
		<span class=stp><bean:message key="label.security.asset.public.transport"/></span>
		<bean:message key="label.mandatory"/></td>
	<td><html:radio property="pubTransport" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/> </html:radio> &nbsp; 
		<html:radio property="pubTransport" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/> </html:radio> &nbsp;  
		<html:errors property="pubTransport"/></td>
    <td class="fieldname">
		<span class=stp><bean:message key="label.security.asset.registration.no"/></span>&nbsp;
		<bean:message key="label.mandatory"/></td>
    <td><html:text property="registrationNo" />&nbsp;
        <html:errors property="registrationNo"/></td>
</tr>

--%>
<%-- remarkEnvRisk field is used as Purpose field by sachin patil --%>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="fieldname"><bean:message key="label.security.asset.purpose" /></td>
	<td colspan="3">
		<html:textarea property="remarkEnvRisk" rows="3"   style="width:100%" onkeyup="limitTextInput(this,200,'Purpose ')" />&nbsp;
		<html:errors property="remarkEnvRisk"/></td>
		
		
</tr>

<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.purpose"/> </td>
	<td><html:select property="purpose" >
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="purposeID" labelName="purposeValue"/>
        </html:select>&nbsp;
        <html:errors property="purpose"/></td> 
     <td class="fieldname"></td><td></td>
    <td class="fieldname"><bean:message key="label.security.asset.equipment.mf"/>&nbsp;<bean:message key="label.mandatory"/> </td>

    <td><html:select property="equipmf" >
			<option value=""><bean:message key="label.please.select"/></option>
            <html:options name="equipmfID" labelName="equipmfValue"/>
        </html:select>&nbsp;
        <html:errors property="equipmf"/></td>
</tr>

--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.equip.risk.grading"/> &nbsp;<bean:message key="label.mandatory"/></td>
	<td><html:select property="equipriskgrading" >
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="equipriskgradingID" labelName="equipriskgradingValue"/>
        </html:select>&nbsp;
        <html:errors property="equipriskgrading"/></td>
    <td class="fieldname"><bean:message key="label.security.asset.equipment.code"/>&nbsp;<bean:message key="label.mandatory"/> </td>
    <td><html:select property="equipcode" >
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="equipcodeID" labelName="equipcodeValue"/>
        </html:select>&nbsp;
        <html:errors property="equipcode"/></td>
</tr>

--%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.quantity"/> </td>
	<td><html:text property="quantity" maxlength="15"/>&nbsp;
        <html:errors property="quantity"  /></td>
    <td class="fieldname">&nbsp;</td>
    <td>&nbsp;</td>
</tr>

--%>

<script language="JavaScript" type="text/JavaScript">
YearCalculate();
 <!--

	
    function setGoodStatus(val){
           /* if (val == 'N' || val =='') {
                document.getElementById("spanASSETLIFE").style.visibility = "hidden";
                document.getElementById("spanSCRAPVALUE").style.visibility = "hidden";
                document.getElementById("spanASSETVALUE").style.visibility = "hidden";
             }else {
                document.getElementById("spanASSETLIFE").style.visibility = "visible";
                document.getElementById("spanSCRAPVALUE").style.visibility = "visible";
                document.getElementById("spanASSETVALUE").style.visibility = "visible";
            }
			if (val == 'N') {                
                document.getElementById("spanPURCHASEPRICE").style.visibility = "visible";				
            }else {                
				document.getElementById("spanPURCHASEPRICE").style.visibility = "hidden";		
            }*/                                                                                                                        
    }

    var goodStatus = "<%=goodStatus%>";W

 //-->
 
 
 
</script>

