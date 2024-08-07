<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.type.insurance.subtype.keymaninsurance.IKeymanInsurance,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.ui.collateral.insprotection.inskeyman.InsKeymanForm,
                 com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/insprotection/inskeyman/InsKeyman_update.jsp,v 1.47 2006/11/23 02:55:45 jzhan Exp $
*
* Purpose: Update Collateral
* Description: Type - Insurance, Subtype - Keyman Insurance
*
* @author $Author: jzhan $<br>
* @version $Revision: 1.47 $ 
* Date: $Date: 2006/11/23 02:55:45 $
* Tag: $Name: DEV_20061123_B286V1 $
*/
%>

<%	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.serviceColObj");

    IKeymanInsurance iCol = (IKeymanInsurance) itrxValue.getStagingCollateral();

    pageContext.setAttribute("obj", iCol);
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();


    String prefix = "Ins";
    String subtype = "InsKeyman";
    String formName = subtype + "Form";
    String from_event = "prepare_update";
    String formActionName = subtype + "Collateral.do";
    InsKeymanForm colForm = (InsKeymanForm) request.getAttribute(formName);
	String event = itrxValue.getCollateral()==null ? "create" : "update";
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.from");

	String prefix1 = "Ins";
	List insurerList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.insurerList");
 	if (insurerList != null) {
		      pageContext.setAttribute("insurerList",insurerList);
    }
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
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
<script type="text/javascript" src="js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/JavaScript">

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

/*function selectLists(){
    List = document.forms[0].secInstrument;
    for (i=0;i<List.length;i++){
	List.options[i].selected = true;
    }
}*/

function submitPage(num) {
    enableAllFormElements();
    //selectLists();

    if (num == 1) {
    	document.forms[0].event.value="submit";
    }
	if (num == 2) {
    	document.forms[0].event.value="update";
    }
    document.forms[0].submit();

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
</head>

<body>
<%@ include file="/collateral/ssc.jsp"%>
<%@ include file="/collateral/check_user.jsp"%>

<html:form action="InsKeymanCollateral.do">
<input type="hidden" name="event" />
<input type="hidden" name="itemType"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="InsKeyman"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
		<td colspan="2"><h3>
			<% if (event.equals("create")) { %>
				<bean:message key="label.security.title.create.insurance.protection"/>
			<% } else { %>
				<bean:message key="label.security.title.edit.insurance.protection"/>
			<% } %>
		</h3></td>
    </tr>
  </thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td > <h3><bean:message key="label.security.general"/></h3></td>
      <td width="50%" align="right">
            <%    if (isDeleting) {             %>
                    <p class="deletedItem">
                    DELETED
                    </p>
            <% } %>
      </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>

    <tbody>
    <tr>
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
			<%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
<%--              <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">

              <td class="fieldname"><bean:message key="label.security.fsv"/>V</td>
              <td>
              <integro:currency amount="<%=iCol.getSCIFSV()%>" param="amount" />&nbsp;
              </td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>--%>
          </tbody>
        </table></td>
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

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<%-- 
	<thead>
		<tr>
			<td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
		</tr>
		<tr>
			<td><hr/></td>  
		</tr>
	</thead>
	--%>
	<tbody>  
    <tr>
      <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
			<% rowIdx++; %>
            <tr class="even">
              	<td width="20%" class="fieldname">
					<bean:message key="label.insurer.company.name"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
				<td width="30%">
					  <html:select name="InsKeymanForm" property="insureName"  onchange="javascript:getBankCode(this)">
                               <option value="" >select</option>
                               <html:options collection="insurerList" labelProperty="label" property="value"  />
                               </html:select><html:errors property="insureName"/>
                          </td>
              	
              	<td class="fieldname"><bean:message key="label.policy.num"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
              	<td><html:text property="policyNo" maxlength="30"/>&nbsp;
              		<html:errors property="policyNo"/> </td>
<%--
              	<html:text property="insureName" maxlength="100"/>&nbsp;
              		<html:errors property="insureName"/> 
--%>
				</td>
				<%--commented on 06/07/2011 
              	<td class="fieldname">
					<bean:message key="label.insurance.type"/>&nbsp;<span class="mandatory">*</span></td>
              	<td><html:select property="insurType">
					      <integro:common-code categoryCode="<%=CategoryCodeConstant.INSURANCE_TYPE %>" 
							refEntryCode="<%=ICMSConstant.COLTYPE_INS_KEYMAN_INS %>" onlyMatchRefEntry="true"/>                            
					</html:select>
              		<html:errors property="insurType" /> </td>
              	--%>
              
            </tr>
            
            <tr class="even">
            <td class="fieldname">
					<bean:message key="label.insured.amt"/>&nbsp;</td>
              	<td colspan="3"><html:text property="insuredAmt" maxlength="20" size="29" styleId="insuredAmt" onblur="javascript:formatAmountAsCommaSeparatedWithoutDefaultDecimal(this)"/>&nbsp;
              		<html:errors property="insuredAmt"/> </td>
            </tr>
            
            <tr class="even">
              	
              	<td class="fieldname"><bean:message key="label.insurance.effective.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
              	<td><html:text property="effDateInsurance" readonly="true" size="15" maxlength="11" />
              		<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('effDateInsurance', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              		<html:errors property="effDateInsurance"/> </td>
                <td class="fieldname"><bean:message key="label.insurance.maturity.dat"/>&nbsp;<span class="mandatoryPerfection">*</span><%--<bean:message key="label.insurance.expiry.dat"/>&nbsp;--%></td>
              	<td><html:text property="expiryDateInsure" readonly="true" size="15" maxlength="11" />
              		<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('expiryDateInsure', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              		 <html:errors property="expiryDateInsure"/></td>
            </tr>
            
            <tr class="odd">	
              	<td class="fieldname"><bean:message key="label.security.maturity.date"/>&nbsp;
					</td>
              	<td colspan="3"><html:text property="collateralMaturityDate" readonly="true" size="15" maxlength="11" />
              		<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('collateralMaturityDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              		<html:errors property="collateralMaturityDate"/> </td>
            </tr>
            <%System.out.println("///////////////////////////************************** colForm.getIsPhysInsp() "+colForm.getIsPhysInsp()); %>
<!--  Added by Pramod Katkar for New Filed CR on 23-08-2013-->            
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
           <html:text property="datePhyInspec" styleId="datePhyInspec" readonly="true" size="15" maxlength="11" onchange="calNextDate1();"/>
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
            <%--commented on 06/07/2011
            <tr class="odd">
             
              	<td width="20%" class="fieldname">
              		<bean:message key="label.bank.interest.duly.noted"/></td>
              	<td width="30%" colspan="3">
              		<html:radio property="bankInterestNoted" value="false"/><bean:message key="label.security.primary"/>
              		&nbsp;&nbsp;
              		<html:radio property="bankInterestNoted" value="true"/><bean:message key="label.security.secondary"/> </td>
              		
            </tr>
          
			<%@ include file="/collateral/common/common_exchange_control_update.jsp" %>
			--%>
<%--              <tr class="even">
              	<td width="20%"  class="fieldname"><bean:message key="label.security.exchange.ctr.app"/>&nbsp;</td>
              	<td width="30%">
                	<html:select property="exchangeControl">
		                <option value="" ><bean:message key="label.please.select"/> </option>
		                <html:options name="ExchangeControlID" labelName="ExchangeControlValue"/>
                    </html:select>
                	<html:errors property="exchangeControl"/> </td>
            </tr>--%>
            <%--commented on 06/07/2011
            <tr class="odd">
              	<td class="fieldname">
              		<bean:message key="label.security.asset.nature.assignment"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
              	<td><html:select property="natureOfCharge">
	            		<option value="" ><bean:message key="label.please.select"/> </option>
	               		<html:options name="natureOfChargeID" labelName="natureOfChargeValue"/>
                  	</html:select>
                  	<html:errors property="natureOfCharge"/> </td>
              	<td class="fieldname"><bean:message key="label.security.asset.amountdesc.assignment"/>&nbsp;
					<span class="mandatory">*</span>&nbsp;</td>
              	<td>
              	<html:text property="amtCharge" maxlength="14"/>&nbsp;
              	<html:errors property="amtCharge"/> </td>
            </tr>
            
            <tr class="even">
	            <td class="fieldname"><bean:message key="label.security.asset.date.legally"/>&nbsp;
					<span class="mandatory">*</span>&nbsp; </td>
              	<td><html:text property="legalChargeDate" readonly="true" size="15" maxlength="11" />
              		<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('legalChargeDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              		<html:errors property="legalChargeDate"/> </td>
           		<td class="fieldname"><bean:message key="label.confirmation.assignmnt.date"/> </td>
              	<td><html:text property="confirmChargeDate" readonly="true" size="15" maxlength="11" />
              		<img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('confirmChargeDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              		<html:errors property="confirmChargeDate"/> </td>
            </tr>
            
            <tr class="odd">
	            <td class="fieldname"><bean:message key="label.security.charge.type"/>&nbsp;
					<span class="mandatory">*</span>&nbsp;</td>
	            <td><html:select property="chargeType">
		                <option value="" ><bean:message key="label.please.select"/> </option>
		                <html:options name="chargeID" labelName="chargeValue"/>
	                    </html:select>
	                <html:errors property="chargeType"/> </td>
	            <td class="fieldname">
	            	<bean:message key="label.credit.arr.insurer"/>&nbsp;</td>
	            <td><html:select property="arrInsurer">
			            <option value=""><bean:message key="label.please.select"/></option>
			            <html:options name="arrInsurerID" labelName="arrInsurerValue"/>
			        </html:select> <html:errors property="arrInsurer"/> &nbsp;</td>
            </tr>
            
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              	<td class="fieldname">
					<bean:message key="label.security.perfection.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
			    <td><html:text property="perfectionDate" readonly="true" maxlength="15"/>
			        <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
			             onclick="showCalendar('perfectionDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>&nbsp;<html:errors property="perfectionDate"/></td>
              	<td class="fieldname">
					<bean:message key="label.security.borrower.collateral" /> </td>
				<td><html:radio property="borrowerDependency" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/> </html:radio> &nbsp; 
					<html:radio property="borrowerDependency" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/> </html:radio> &nbsp; </td>
            </tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              	<td class="fieldname"><bean:message key="label.insurance.premium.amount"/></td>
              	<td><html:text property="premiumAmount" maxlength="20" />&nbsp;
					<html:errors property="premiumAmount"/> </td>
              	<td class="fieldname">&nbsp;</td>
              	<td>&nbsp;</td>
            </tr>
			<%@ include file="/collateral/common/common_legal_enforceability_update.jsp" %>
			
			<%@ include file="/collateral/common/common_fields_update.jsp" %>   
--%>
            <%--<%@ include file="/collateral/common/update_security_instrument.jsp" %>--%>

          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%--Govind S: Comment for Insurence(Life Insurence) security 06/07/2011
<%@ include file="/collateral/view_pledgor.jsp" %>

<%@ include file="/collateral/view_pledge.jsp" %>    
--%>
<%--Govind S: Comment for Insurence(Life Insurence) security 06/07/2011
<%@ include file="/collateral/common/view_system_valuation.jsp"%>

<%@ include file="/collateral/common/update_netRV.jsp" %>
--%>


<jsp:include page="/collateral/common/common_maker_remarks.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="trxRemarks" value="<%=itrxValue.getRemarks() %>"/>
	<jsp:param name="trxUserInfo" value="<%=itrxValue.getUserInfo() %>"/>
</jsp:include>
<%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>


<jsp:include page="/collateral/common/common_maker_update_button.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="actionName" value="<%=formActionName%>"/>
	<jsp:param name="collateralID" value="<%=(itrxValue.getCollateral() != null) ? itrxValue.getCollateral().getCollateralID(): ICMSConstant.LONG_INVALID_VALUE%>" />
</jsp:include>


</html:form>

<%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %>

</body>
</html>
