

<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>

<script language="JavaScript" type="text/JavaScript">
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
		&& frequency!='WEEKLY' && frequency!='YEARLY' && frequency!='BI_MONTH' && frequency!='TWO_YEARLY' && frequency!='THREE_YEARLY' && frequency!='FOUR_YEARLY'){
	
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

  document.getElementById('nextPhysInspDate').value = final_date;
	}

	}
	  	  
}

</script>
<%
String strSubType = (String)pageContext.getAttribute("strSubType");
if(strSubType==null)
{
strSubType = "";
}
%>
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
           <html:text property="datePhyInspec" styleId="datePhyInspec" readonly="true" size="15" maxlength="11"  onchange="calNextDate1();"/>
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
