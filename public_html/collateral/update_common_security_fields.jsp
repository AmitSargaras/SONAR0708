<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetspecgold.AssetSpecGoldForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
String systemDate= df.format(new Date());
String s="AssetSpecGoldForm";

String amt=colForm.getValuationAmount();
Amount valAmt = new Amount(ICMSConstant.DOUBLE_INVALID_VALUE, colForm.getValuationAmount());

String strCamStartDate ="";
if(iCol.getCollateralCode()!=null){
collCode = iCol.getCollateralCode();

}

if("COL0000139".equalsIgnoreCase(collCode))
{
	strCamStartDate =  (String)request.getAttribute("camStartDate");
	//out.println("From Database : "+strCamStartDate);
	if(strCamStartDate==null)
	{
		strCamStartDate =colForm.getValuationDate();
		//out.println("From collateral form: "+strCamStartDate);
	}
	

}



%>


<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>


<%@page import="com.integrosys.base.businfra.currency.Amount"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html>
<head>
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

    function CheckType(val){
    	
    	if(val=='SECOND_CHARGE'){
    		
    		document.getElementById("otherBankCharge").disabled=false;
    	}
    	else{
    		
    		document.getElementById("otherBankCharge").disabled=true;
    	}
    }

    function calNextDate(){
    	var frequency=document.getElementById("commonRevalFreq").value;
    	var day=document.forms[0].valuationDate.value;
	
		if(frequency==''){
			document.getElementById('nextValDate').value ='';
		}
		else if(frequency!='DAILY' && frequency!='FORTNIGHTLY' && frequency!='HALF_YEARLY' && frequency!='MONTH' && frequency!='QUARTERLY'
			&& frequency!='WEEKLY' && frequency!='YEARLY' && frequency!='BI_MONTH' && frequency!='TWO_YEARLY' && frequency!='THREE_YEARLY' && frequency!='FOUR_YEARLY'){
		
		 document.getElementById('nextValDate').value = day;
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
     	 document.getElementById('nextValDate').value = final_date;
    	}

		}
    	  
    }
    
    
</script>
<style type="text/css">
.hiddenDiv {display: none;}.visibleDiv {display: block;	border: 1px grey solid;}.style1 {color: #FF0000}.style5 {color: #FF0000}.style11 {color: #FF0000}</style>
</head>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >

<tbody>
<tr>&nbsp;</tr>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
       
        <%if(!"PropCommGeneralForm".equals(formName)){ %>
	        <tr >   
	        	
	           
	            <td class="fieldname">
					Valuation Amount<font color="red">*</font>&nbsp;</td>
					
	            <td class="even" width="30%"><html:text	property="valuationAmount" name="<%=formName %>" maxlength="21" size="31" styleId="valuationAmount" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
	            <html:errors property="valuationAmount" />        
	          </td>
	          <%
	          if("COL0000139".equalsIgnoreCase(collCode))
	          {
	        	 %>
	        	 <td class="fieldname"> CAM Start Date<font color="red">*</font>&nbsp;</td>
	        	 <td class="even" width="20%"><input type="text" value="<%=strCamStartDate%>" readonly="readonly"/>
	        	 	<html:hidden property="valuationDate" value="<%=strCamStartDate%>" name="<%=formName %>" />
	        	 	<html:errors property="valuationDate" />
	        	 </td>
	         	 <%
	          }
	          else{
	          %>
	         <td class="fieldname">	Date of Valuation <font color="red">*</font>&nbsp;</td>
	            <td class="even" width="20%">
	            		<html:text property="valuationDate" name="<%=formName %>" readonly="true" onchange="calNextDate();"/> 
	            		<img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725" onclick="showCalendar('valuationDate', 'dd/mm/y')"
						onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
						onmouseout="MM_swapImgRestore()" />&nbsp;
						<html:errors property="valuationDate" />
				</td>
				<%} %>
	        </tr>
	        <%} %>
	        
	        <tr>
			   <td class="fieldname">Revaluation Frequency<font color="red">*</font>&nbsp;</td>
	           <td class="odd" width="30%">
	          <%if(!"PropCommGeneralForm".equals(formName)){ %>  
	        <html:select property="commonRevalFreq" styleId="commonRevalFreq"  onchange="calNextDate()">
			            <integro:common-code
									categoryCode="<%=CategoryCodeConstant.FREQUENCY%>"
									descWithCode="false" />
			        </html:select>&nbsp;
			        <%}else{ %> 
			         <html:select property="commonRevalFreq" styleId="commonRevalFreq"  onchange="calNextDate2()">
			            <integro:common-code
									categoryCode="<%=CategoryCodeConstant.FREQUENCY%>"
									descWithCode="false" />
									 </html:select>&nbsp;
			        <%} %>
			         <html:errors property="commonRevalFreq" />
	               </td>
			    <%
			    if("COL0000139".equalsIgnoreCase(collCode))
			    {
			    	%>
			    	<td class="fieldname"> CAM Expiry Date <font color="red">*</font>&nbsp;</td>
			    	<%
			    }
			    else{
			    %>
	            <td class="fieldname">Next Valuation Date<font color="red">*</font>&nbsp;</td>
	            <%
				}
			    %>	
				<td class="odd" width="20%"><html:text property="nextValDate" styleId="nextValDate" name="<%=formName %>" readonly="true"  />		
					<input type="image" src="img/calendara.gif" name="Image723" id="nextDate" onclick="return showCalendar('nextValDate', 'dd/mm/y')"
   			    	onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
   			    	<html:errors property="nextValDate" />
				</td>
										
	        </tr>
			

	        <tr >
	            <td class="fieldname">
					Type Of Charge<font color="red">*</font>&nbsp;</td>
	            <td class="even" width="30%">
	            <html:select property="typeOfChange" onchange='CheckType(this.value);' >
			           <integro:common-code
									categoryCode="<%=CategoryCodeConstant.CommonCode_TYPE_CHARGE %>"
									descWithCode="false" />
			        </html:select>&nbsp;
			        <html:errors property="typeOfChange" />
	                </td>
	                <td class="fieldname">
	                % of First Charge by Other Bank<font color="red">*</font>&nbsp;
	                </td>
	                 <td class="even" width="30%">
	                 <%if(colForm.getTypeOfChange().equalsIgnoreCase("SECOND_CHARGE")){ %>
	                 <html:text property="otherBankCharge" styleId="otherBankCharge" disabled="false" value="<%=colForm.getOtherBankCharge() %>" maxlength="5" size="5"></html:text>
	                 <%}else{ %>
	                 <html:text property="otherBankCharge" styleId="otherBankCharge" disabled="true" value="<%=colForm.getOtherBankCharge() %>" maxlength="5" size="5"></html:text>
	                 <%} %>
	                <html:errors property="otherBankCharge" />
	                </td>
	        </tr>
        
       
        </tbody>
		</table>
	</td>
</tr>
</tbody>
<html:hidden property="commonRevalFreq" />
<html:hidden property="typeOfChange" />
</table>
</html>