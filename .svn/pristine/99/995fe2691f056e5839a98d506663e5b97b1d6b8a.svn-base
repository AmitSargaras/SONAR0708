<%@ page import="java.util.Locale,
				 java.util.Collection,
				 java.util.Iterator,
				 java.util.List,
				 org.apache.struts.util.LabelValueBean,
				 com.integrosys.base.techinfra.diff.CompareResult,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.ICustomerSysXRef,
            	com.integrosys.cms.ui.manualinput.limit.LmtDetailForm,
                 java.text.DecimalFormat,
                  java.math.BigDecimal,
                 com.integrosys.cms.ui.manualinput.limit.EventConstant" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%

String context = request.getContextPath() + "/";

List<LimitCalculationItem> newLimitDashboardList=(List)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.newLimitDashboardList");
//String totalInrValue=(String)request.getAttribute("totalInrValue");
String totalFdRequired=(String)request.getAttribute("totalFdRequired");

String totalLienAmount=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.totalLienAmount");
//DefaultLogger.debug(this,totalInrValue+":"+totalFdRequired);
DefaultLogger.debug(this,"newLimitDashboardList:"+newLimitDashboardList);
if(null!=newLimitDashboardList){
	pageContext.setAttribute("newLimitDashboardList",newLimitDashboardList);
	DefaultLogger.debug(this,"newLimitDashboardList.size():"+newLimitDashboardList.size());	
	
}
else{
	
	DefaultLogger.debug(this,"newLimitDashboardList is null creating empty list");	
	pageContext.setAttribute("newLimitDashboardList",new ArrayList());
}

String totalLimitInOs=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.totalLimitInOs");

String facCoBorrowerLiabIds =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.facCoBorrowerLiabIds");
pageContext.setAttribute("facCoBorrowerLiabIds",facCoBorrowerLiabIds);
%>



<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.ui.manualinput.limit.LimitCalculationItem"%>
<%@page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <!-- InstanceBeginEditable name="head" -->
    
    <script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
	<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
	<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />
    
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>

    <script type="text/javascript" src="js/ajaxDropdown.js"></script>
    <script type="text/javascript" src="js/ajaxList.js"></script>
    <script type="text/javascript" src="js/ajaxSancAmount.js"></script>

    <script language="javascript" type="text/javascript">

	function cancelSubmit(){
		
	     document.forms[0].event.value = 'cancel';
	     document.forms[0].submit();
    }
	function deleteLimit(){
		 document.forms[0].event.value = 'delete_limit_dashboard_item';
	     document.forms[0].submit();
	}
	function addLimitDetails(totalLienAmount,totalFdRequired){
		 var limitAmount=document.getElementById("limitAmount").value;
		 var currencyRate=document.getElementById("currencyRate").value;
		
		 var fdMargin=document.getElementById("fdMargin").value;
		if(limitAmount=='' || currencyRate=='' || fdMargin==''){
		alert("Please enter value for Limit Amount, INR value and Fd Margin");
		}
		else{
		//alert("totalLienAmount:totalFdRequired:"+totalLienAmount+" , "+totalFdRequired);

		if('null'==totalFdRequired){
			totalFdRequired=0.00;
		}
		fdRequired= replaceComma(document.getElementById("fdRequired"));
		var diff=totalLienAmount-totalFdRequired-fdRequired;
		var msg="";
		var diffNew=diff;
		
		diffNew += '';
		x = diffNew.split('.');
		 x1 = x[0];
		  if(x.length > 1){
		    if(x[1].length == 2){
		    	x2= '.' + x[1];
		    }else if(x[1].length == 1){
		    	x2= '.' + x[1]+'0';
		    }else{
		    	x2= '.' + x[1];
		    }
		    }
		    else{
		    	 x2 ='.00';
		    } 
		    
		if(diff < 0){
			 msg="Shortfall: "+formatAmountAsCommaSeparated1(x1)+x2;
		}
		else{
			 msg="Surplus: "+formatAmountAsCommaSeparated1(x1)+x2;
		}
		 
		 alert(msg);
		 document.forms[0].event.value = 'add_limit_detail';
	     document.forms[0].submit();
		}
	}

	function calculateLimitInInr(){
	//	alert("calculateLimitInInr");
		 var limitAmount=document.getElementById("limitAmount").value;
		var currencyRate=document.getElementById("currencyRate").value;
		limitAmount= replaceComma(document.getElementById("limitAmount"));
		currencyRate=replaceComma(document.getElementById("currencyRate"));
	//	alert(limitAmount);
	//	alert(currencyRate); 
		var limitInInr=limitAmount*currencyRate;

		limitInInr=formatAmountAsCommaSeparated1(limitInInr.toFixed(2));
		document.getElementById("limitInInr").value=limitInInr; 
		calculateFdRequired()
	}

	function calculateFdRequired(){
		 var limitInInr=document.getElementById("limitInInr").value;
		 var fdMargin=document.getElementById("fdMargin").value;
		 limitInInr= replaceComma(document.getElementById("limitInInr"));
		 fdMargin=replaceComma(document.getElementById("fdMargin"));
			var fdRequired=limitInInr*(fdMargin/100);

			fdRequired=formatAmountAsCommaSeparated1(fdRequired.toFixed(2));	
		 document.getElementById("fdRequired").value=fdRequired;
	
	}

	function replaceComma(field){
	//	alert("inside replaceComma");
		var fieldValue = field.value,
		fieldValue = fieldValue.replace(/,/g, "");
		return fieldValue;
			
	}
	
	window.onload = function(){
	//alert("Inside clearTextField");
    document.getElementById("currency").value="";
	document.getElementById("dashboardLineNo").value="";  
	document.getElementById("limitAmount").value="";
	document.getElementById("currencyRate").value="";
	document.getElementById("limitInInr").value="";
	document.getElementById("fdMargin").value="";
	document.getElementById("fdRequired").value=""; 

	}
    </script>
</head>

<body>

<html:form action="MILimit.do">
    <input type="hidden" name="event" value="<%=request.getAttribute("event") %>"/>
     <html:hidden name="LmtDetailForm" property="facCoBorrowerLiabIds" styleId="facCoBorrowerIds" value="<%=facCoBorrowerLiabIds%>"/>
     <html:hidden property="fromEvent"/>
	<html:hidden property="limitProfileID"/>
	<html:hidden property="customerID"/>
    <html:hidden property="limitId"/>
     <html:hidden property="lineNo"/>
     <html:hidden property="purpose"/>
     <html:hidden property="otherPurpose"/>
     <html:hidden property="facilitySystem"/>
      <html:hidden property="facilityType"/>
     <html:hidden property="facilityCat"/>
     <html:hidden property="isReleased"/>
     <html:hidden property="isSecured"/>
     <html:hidden property="isAdhoc"/>
     
     <html:hidden property="grade"/>
     <html:hidden property="bankingArrangement"/>
      <html:hidden property="clauseAsPerPolicy"/>
      <html:hidden property="isDPRequired"/>
   <jsp:include page="scod_detail_hidden.jsp"></jsp:include>
   
<bean:define id="formObj" name="LmtDetailForm" scope="request" type="com.integrosys.cms.ui.manualinput.limit.LmtDetailForm"/>
 

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3><bean:message key="title.limit.details"/></h3></td>
       
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
<tr>
<td colspan="2">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
<tr class="even"><td class="fieldname"><bean:message key="label.facility.name"/></td>
                  <td><bean:write name="LmtDetailForm" property="facilityName"/>&nbsp;
        			<html:hidden property="facilityName"/>                  
				  </td></tr>
				  <tr class="odd">
                  <td class="fieldname"> Currency</td>
                   <td><html:text property="currency" styleId="currency"/></td>
                </tr>
                <tr class="even">
                  <td class="fieldname"> Line No</td>
                   <td><html:text property="dashboardLineNo" styleId="dashboardLineNo"/></td>
                </tr>
                
                <tr class="odd">
                  <td class="fieldname"> Limit Amount <font color="#FF0000">*</font> </td>
                   <td><html:text property="limitAmount" onkeyup="javascript:amountFormat(this),calculateLimitInInr()" onkeydown="javascript:amountFormat(this),calculateLimitInInr()" onchange="javascript:calculateLimitInInr()" styleId="limitAmount" onblur="javascript:formatAmountAsCommaSeparated(this)"/></td>
                </tr>
                <tr class="even">
                  <td class="fieldname"> INR Value <font color="#FF0000">*</font> </td>
                   <td><html:text property="currencyRate" onkeyup="javascript:amountFormat(this),calculateLimitInInr()" onkeydown="javascript:amountFormat(this),calculateLimitInInr()" onchange="javascript:calculateLimitInInr()" styleId="currencyRate" onblur="javascript:formatAmountAsCommaSeparated(this)"/></td>
                </tr>
                <tr class="odd">
                  <td class="fieldname"> Limit In INR</td>
                   <td><html:text property="limitInInr" readonly="true" onkeyup="javascript:amountFormat(this),calculateFdRequired()" onkeydown="javascript:amountFormat(this),calculateFdRequired()" onchange="javascript:amountFormat(this),calculateFdRequired()" styleId="limitInInr"/></td>
                </tr>
                <tr class="even">
                  <td class="fieldname"> FD Margin <font color="#FF0000">*</font></td>
                   <td><html:text property="fdMargin" onkeyup="javascript:amountFormat(this),calculateFdRequired()" onkeydown="javascript:amountFormat(this),calculateFdRequired()" onchange="javascript:calculateFdRequired()" styleId="fdMargin"/></td>
                </tr>
                <tr class="odd">
                  <td class="fieldname"> FD Required</td>
                   <td><html:text property="fdRequired" readonly="true" styleId="fdRequired"/></td>
                </tr>
                <tr>
                <td>&nbsp;</td>
                <td>
                <input class="btnNormal" type="button" name="btnAddLimitDetails" styleId="btnAddLimitDetails" value="ADD" onclick="javascript:addLimitDetails('<%=totalLienAmount %>','<%=totalFdRequired %>')" />
                </td>
                </tr>
 
</tbody>
</table>
</td>
</tr>
</tbody>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead><tr><td colspan="2"><h3>Limit Dashboard</h3></td></tr>
<tr><td colspan="2"><hr/></td></tr>
</thead>
<tbody>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
<tr><td width="15%" class="fieldname">Facility</td>
<td width="5%" class="fieldname">Currency</td>
<td width="10%" class="fieldname">Line No</td>
<td width="14%" class="fieldname">Limit Amount</td>
<td width="10%" class="fieldname">INR Value</td>
<td width="14%" class="fieldname">Limit in INR</td>
<td width="14%" class="fieldname">FD Margin</td>
<td width="14%" class="fieldname">FD Required</td></tr>
<tr><td></td></tr>
</thead>
<tbody>

<logic:present name="newLimitDashboardList">

<logic:iterate id="limitItem" name="newLimitDashboardList" type="com.integrosys.cms.ui.manualinput.limit.LimitCalculationItem" scope="page">

<%System.out.println("Inside limitDashboardList:");
System.out.println("limitItem.getCurrencyRate():"+limitItem.getCurrency()+":"+limitItem.getCurrencyRate()+":"+limitItem.getFdMargin());


%>
<tr><td align="center"><%=limitItem.getFacilityName()%>&nbsp;</td>
<td align="center"><%= limitItem.getCurrency()%>&nbsp;</td>
<td align="center"><%= limitItem.getLineNo()%>&nbsp;</td>
<td align="center"><%= UIUtil.formatWithCommaAndDecimal(limitItem.getLimitAmount())%>&nbsp;</td>
<td align="center"><%= limitItem.getCurrencyRate()%>&nbsp;</td>
<td align="center"><%= UIUtil.formatWithCommaAndDecimal(limitItem.getLimitInInr())%>&nbsp;</td>
<td align="center"><%= limitItem.getFdMargin()%>&nbsp;</td>
<td align="center"><%= UIUtil.formatWithCommaAndDecimal(limitItem.getFdRequired())%>&nbsp;</td></tr>
</logic:iterate>
</logic:present>
<%if((null==newLimitDashboardList) || (null!=newLimitDashboardList && newLimitDashboardList.isEmpty())) {%>
<tr><td colspan="8"> No Records Found</td></tr>
<%} %>
<tr><td class="fieldname" colspan="5">Total Limit O/S</td>
<%if(null==totalLimitInOs){ %>
<td>-</td>
<%}else{ %>
<td><%=UIUtil.formatWithCommaAndDecimal(totalLimitInOs) %></td>
<%} %>
<td class="fieldname">Total FD Required</td>
<%if(null==totalFdRequired){ %>
<td>-</td>
<%}else{ %>
<td><%=UIUtil.formatWithCommaAndDecimal(totalFdRequired) %></td>
<%} %>
</tr>
<tr><td class="fieldname" colspan="5">FDR Available</td>
<td><%=UIUtil.formatWithCommaAndDecimal(totalLienAmount) %></td>
<td>&nbsp;</td><td>&nbsp;</td>
</tr>


</tbody>
</table>
</tbody>
</table>

<table align="center" border="0" cellpadding="0" cellspacing="0">
	<tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
    	<td><a href="javascript:deleteLimit()"><img src="img/delete1.gif" name="Image8"  align="center"  border="0" id="Image8" /></a></td>
        <td><a href="javascript:cancelSubmit()"><img src="img/cancel1.gif" name="Image51" align="center"  border="0" id="Image5"/></a></td>
      
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>

</table>
</html:form>
</body>
</html>