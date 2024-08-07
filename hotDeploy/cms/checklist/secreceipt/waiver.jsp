<%@page import="com.integrosys.cms.ui.checklist.ITagUntagImageConstant"%>
<%@page import="com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction"%>
<%@ page import="com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptForm,
				 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="org.apache.struts.util.LabelValueBean"%>

<%

ICMSCustomer cust = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);

Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
	String status = (String) request.getAttribute("status");

    SecurityReceiptForm form = (SecurityReceiptForm)request.getAttribute("SecurityReceiptForm");
    
    String hdfcAmt="";
    if(form.getHdfcAmt()!=null && !form.getHdfcAmt().trim().equals("")){
    	hdfcAmt=form.getHdfcAmt();
    }
    
    String docAmt="";
    if(form.getDocAmt()!=null && !form.getDocAmt().trim().equals("")){
    	docAmt=form.getDocAmt();
    }
    String docDate=form.getDocDate();
    String expiryDate=form.getDocExpDate();
    String lableDocDate = "Doc Expiry Date";
    
    List waiverCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction.waiverCreditApproverList");
    //System.out.println("::::waiverCreditApproverList:::::::"+waiverCreditApproverList);
    if(waiverCreditApproverList!=null){
    	pageContext.setAttribute("waiverCreditApproverList",waiverCreditApproverList);
    }
    
    List currencyList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction.currencyList");
    if(currencyList!=null){
    	pageContext.setAttribute("currencyList",currencyList);
    }
    DateFormat df1 = new SimpleDateFormat("dd/MMM/yyyy");
    String nextDate="";
    String deferDate="";
    String otdDate="";
    if(form.getExpectedReturnDate()!=null && !form.getExpectedReturnDate().equals("")){
    	nextDate=form.getExpectedReturnDate();
    }
    if(form.getDeferDate()!=null && !form.getDeferDate().equals("")){
    	deferDate=form.getDeferDate();	
    }
    if(form.getOriginalTargetDate()!=null && !form.getOriginalTargetDate().equals("")){
    	otdDate=form.getOriginalTargetDate();
    }
    String defaultDate="";
    defaultDate=df1.format(new Date());
    /*String monitorType = (String) request.getAttribute("monitorType");
	String isPolicy = request.getParameter("isPolicy");
	if(isPolicy == null|| isPolicy.trim().length()==0){
		isPolicy = (monitorType!=null && monitorType.equals(ICMSConstant.INSURANCE_POLICY)) ? "true" : "";
	}
	if((isPolicy !=null && isPolicy.equals("false") )
                        || (monitorType!=null && monitorType.equals(ICMSConstant.PREMIUM_RECEIPT))){
        isPolicy = "false";
        lableDocDate = "Due Date to Receive Premium Receipt";
	}*/
	
	List rocChargeList = (List)session.getAttribute(SecurityReceiptAction.class.getName() + "." + "rocChargeList" );
    if(rocChargeList!=null){
    	pageContext.setAttribute("rocChargeList",rocChargeList);
    }
    
	Boolean isCustomerCorporate = (Boolean) session.getAttribute(SecurityReceiptAction.class.getName() + "." + "isCustomerCorporate");
	Boolean isImageTagPending = (Boolean) session.getAttribute(SecurityReceiptAction.class.getName() + "." + ITagUntagImageConstant.IS_IMAGE_TAG_PENDING);
%>


<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>
<script language="JavaScript" src="js/validation.js"></script>

<style>
table.tblInput tbody tr td.fieldname {
	width : 150 px;
}
</style>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
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

function saveForm() {
	
	var isImageTagPending = <%=isImageTagPending%>;
    var rocChargeVal = document.getElementsByName("rocCharge")[0].value;
	if(isImageTagPending && (rocChargeVal == 'Y')){
		alert('<bean:message key="label.tagging.not.completed"/>');
		return;
	}
	else{
		document.forms["SecurityReceiptForm"].event.value="save_waiver";
		document.forms["SecurityReceiptForm"].submit();	
	}
}

function cancelForm() {
	document.forms["SecurityReceiptForm"].event.value="view_ok";
	document.forms["SecurityReceiptForm"].submit();
}


//-->
</script>

<script language="JavaScript" type="text/JavaScript">
function setDifferenceBetDate() {
    
	
    
	   var user_date ="<%=deferDate%>";
	
		//alert("deferDate :"+user_date);
	
	var today_date ="<%=otdDate%>";
	//alert("today_date :"+today_date);
	
	 if((isNaN(user_date))&&(isNaN(today_date)))
  {
	 
	  var udate_month = user_date.substring(3,6);
	  var tdate_month = today_date.substring(3,6);
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
	
	  var toDate = new Date(user_date.substring(7,11),
			  udate_month,
			  user_date.substring(0,2));
	  //alert("fromDate"+toDate);

	  switch(tdate_month)
		 {
		 case 'Jan':
			 tdate_month='00';
             break;
		 case 'Feb':
			 tdate_month='01';
			 break;
		 case 'Mar':
			 tdate_month='02';
			 break;
		 case 'Apr':
			 tdate_month='03';
			 break;
		 case 'May':
			 tdate_month='04';
			 break;
		 case 'Jun':
			 tdate_month='05';
			 break;
		 case 'Jul':
			 tdate_month='06';
			 break;
		 case 'Aug':
			 tdate_month='07';
			 break;
		 case 'Sep':
			 tdate_month='08';
			 break;
		 case 'Oct':
			 tdate_month='09';
			 break;
		 case 'Nov':
			 tdate_month='10';
			 break;
		 case 'Dec':
			 tdate_month='11';
			 break;
			
			
			 }
	  var fromDate   = new Date(today_date.substring(7,11),
			  tdate_month,
			  today_date.substring(0,2));
	  
	//  alert("toDate"+fromDate);
	  if(fromDate <= toDate)
	  {
	//var ts =  timeSpan(fromDate, toDate,  "years,months,days");
	//document.getElementById('valExchangeRateINRCal').innerHTML = ts.days +" Day "+ ts.months +" Month "+ ts.years+" Year";
		  var difference_ms = Math.abs(toDate - fromDate);
		   

		  document.getElementById('valTotalDeferedDays').innerHTML = (Math.round(difference_ms/(1000 * 60 * 60 * 24))) + " days";
          

			  }
	  else if(toDate<fromDate){
		  var difference_ms = Math.abs(toDate - fromDate);
		   

		  document.getElementById('valTotalDeferedDays').innerHTML ="-"+(Math.round(difference_ms/(1000 * 60 * 60 * 24))) + " days";
	  }
	  else{
		  document.getElementById('valTotalDeferedDays').innerHTML = "-";
		  }
 


  }
  else
  {
  document.getElementById('valTotalDeferedDays').innerHTML = "-";
  }
	
}


function originalDeferedDaysCal() {
    
    
    
	   var user_date ="<%=nextDate%>";
	
	//alert("user_date :"+user_date);
	
	var today_date ="<%=otdDate%>";
	//alert("today_date :"+today_date);
	
	 if((isNaN(user_date))&&(isNaN(today_date)))
	  {
		 
		  var udate_month = user_date.substring(3,6);
		  var tdate_month = today_date.substring(3,6);
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
		
		  var toDate = new Date(user_date.substring(7,11),
				  udate_month,
				  user_date.substring(0,2));
		  //alert("fromDate"+toDate);

		  switch(tdate_month)
			 {
			 case 'Jan':
				 tdate_month='00';
	             break;
			 case 'Feb':
				 tdate_month='01';
				 break;
			 case 'Mar':
				 tdate_month='02';
				 break;
			 case 'Apr':
				 tdate_month='03';
				 break;
			 case 'May':
				 tdate_month='04';
				 break;
			 case 'Jun':
				 tdate_month='05';
				 break;
			 case 'Jul':
				 tdate_month='06';
				 break;
			 case 'Aug':
				 tdate_month='07';
				 break;
			 case 'Sep':
				 tdate_month='08';
				 break;
			 case 'Oct':
				 tdate_month='09';
				 break;
			 case 'Nov':
				 tdate_month='10';
				 break;
			 case 'Dec':
				 tdate_month='11';
				 break;
				
				
				 }
		  var fromDate   = new Date(today_date.substring(7,11),
				  tdate_month,
				  today_date.substring(0,2));
		  
		//  alert("toDate"+fromDate);
		  if(fromDate <= toDate)
		  {
		//var ts =  timeSpan(fromDate, toDate,  "years,months,days");
		//document.getElementById('valExchangeRateINRCal').innerHTML = ts.days +" Day "+ ts.months +" Month "+ ts.years+" Year";
			  var difference_ms = Math.abs(toDate - fromDate);
			   

			  document.getElementById('valOriginalDeferedDays').innerHTML = (Math.round(difference_ms/(1000 * 60 * 60 * 24))) + " days";
           

				  }
		  else{
			  
			  document.getElementById('valOriginalDeferedDays').innerHTML = "-";
			  }
	 
	
	
	  }
	  else
	  {
		  
	  document.getElementById('valOriginalDeferedDays').innerHTML = "-";
	  }
	
}




</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/ok2.gif','img/cancel2.gif')">
<html:form action="SecurityReceipt" >
<html:hidden property="event" />

<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="actionTypeName" />
<html:hidden property="index" />
<html:hidden property="secType" />
<html:hidden property="secSubType" />
<html:hidden property="secName"/>
<html:hidden property="collateralID" />
<html:hidden property="collateralRef" />
<html:hidden property="tenureCount" value="<%=form.getTenureCount() %>" />
<html:hidden property="tenureType" value="<%=form.getTenureType() %>" />
<!--to keep fields value when error come -->
<html:hidden property="docCode" />
<html:hidden property="deferCount"/>
<html:hidden property="docNo"/>
<html:hidden property="docDesc" />
<html:hidden property="docRef" />
<html:hidden property="formNo" />
<!--<html:hidden property="docDate" />
<html:hidden property="docExpDate" />
--><html:hidden property="receivedDate" />
<!--<html:hidden property="originalTargetDate"/>
    --><html:hidden property="isEffDateChanged"/>
     <%if(form.getItemStatus().equalsIgnoreCase("DEFERRED") ){ %>
 <html:hidden property="originalTargetDate"/>
  
<%} %>
<html:hidden property="expectedReturnDate" />
<html:hidden property="deferDate" />

<!-- <html:hidden property="identifyDate" /> -->

<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Update Security Doc Receipt </h3></td>
    </tr>
    <tr>
      <td><h3> Doc Description - Waive</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Code</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docCode" /></td>
            </tr>
<!--            <tr class="even">-->
<!--              <td class="fieldname">Doc No</td>-->
<!--              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docNo" /></td>-->
<!--            </tr>-->
            <tr class="odd">
              <td class="fieldname">Description</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docDesc" /></td>
            </tr>
                <tr class="even">
              <td class="fieldname">Doc Amount</td>
              <td><html:text property="docAmt" size="31" maxlength="21" styleId="docAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
               
                <html:errors property="docAmt" />
              </td>
            </tr>
            
            <tr class="even">
              <td class="fieldname">HDFC Amount</td>
              <td><html:text property="hdfcAmt" size="31" maxlength="21" styleId="hdfcAmt" onblur="javascript:formatAmountAsCommaSeparated(this)" />
               
                <html:errors property="hdfcAmt" />
              </td>
            </tr>
            
            <tr class="even">
              <td class="fieldname">Currency</td>
              <td>
              <html:select property="currency">
              <option value="">Please Select </option>	
                       <%
              
              String selected="INR";
              
              
              if(form.getCurrency()!=null && !form.getCurrency().trim().equals("")){
            	  selected=form.getCurrency();
              }
              for(int i =0;i<currencyList.size();i++){ 
              
              LabelValueBean labelValueBean=(LabelValueBean)currencyList.get(i);
              
              %>
              
              <%if(labelValueBean.getValue().trim().equalsIgnoreCase(selected.trim())){ 
            	 // System.out.println("=======================:"+labelValueBean.getLabel());
              %>
               <option value="<%=labelValueBean.getValue()%>" selected="selected"><%=labelValueBean.getLabel()%></option>	
              
              <%}else{ %>
              <option value="<%=labelValueBean.getValue()%>"><%=labelValueBean.getLabel()%></option>	
              
              <%}} %>
<!--                      <html:options collection="currencyList" property="value" labelProperty="label" filter="" />-->
              </html:select>
              </td>
            </tr>
<!--           <tr class="even">-->
<!--              <td class="fieldname">Document Type</td>-->
<!--              <%if(form.getMonitorType()==null||form.getMonitorType().equals("")){ %>-->
<!--              <td>-</td>-->
<!--              <%}else{ %>-->
<!--              <td>&nbsp;<integro:common-code categoryCode="MONITOR_TYPE" entryCode="<%=form.getMonitorType()%>" display="true" descWithCode="false"/></td>-->
<!--            	<%} %>-->
<!--            </tr>-->
<!--             <tr class="odd">-->
<!--              <td class="fieldname">Form No</td>-->
<!--              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="formNo" /></td>-->
<!--            </tr>-->
           <tr class="odd">
                        <td class="fieldname">Doc Date </td>
                        <td><html:text property="docDate" size="12" maxlength="12" readonly="true" value="<%=docDate %>"/>
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1" onclick="return showCalendar('docDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                            <html:errors property="docDate"/>
                        </td>
                    </tr>
              <tr class="even">
              <td class="fieldname">Original Target Date &nbsp;</td>
               <%if(form.getItemStatus().equalsIgnoreCase("DEFERRED") ){ %>
               <%if(form.getOriginalTargetDate()!=null && !form.getOriginalTargetDate().trim().equals("")){ %>
               <td>&nbsp;<%=form.getOriginalTargetDate() %></td>
               <%}else{ %>
               <td>&nbsp;-</td>
               <%} }else{%>
              <td><html:text property="originalTargetDate" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('originalTargetDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
<!--                <html:errors property="originalTargetDate" />-->
              </td>
              <%} %>
              </tr>
 <%--
            <% 	if(isPolicy!=null && isPolicy.equals("true")){	%>
			<tr class="odd">
              <td class="fieldname">Document Effective Date&nbsp;<font color="#0000FF">* </font></td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docEffDate" /></td>
            </tr>
            <%  }  %>
--%>
 			 <tr class="even">
                        <td class="fieldname"><%=lableDocDate%></td>
                        <td><html:text property="docExpDate" size="12" maxlength="12" readonly="true" value="<%=expiryDate %>"/>
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1" onclick="return showCalendar('docExpDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                            <html:errors property="docExpDate"/>
                        </td>
                    </tr>
             
            
            
            <tr class="even">
                  <td class="fieldname">Date Waived<font color="RED">*</font></td>
                  <td><html:text property="waivedDate" size="12" maxlength="12" readonly="true"  value="<%=defaultDate %>" />
                    <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('waivedDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                  	<html:errors property="waivedDate" />
                  </td>
             </tr>
                  <%if(form.getItemStatus().equalsIgnoreCase("DEFERRED")||(form.getDeferDate()!=null && !form.getDeferDate().equals("") )  ){ %>
               <tr>
               <td class="fieldname">Date Deferred&nbsp; </td>
               <%if(form.getDeferDate()!=null && !form.getDeferDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getDeferDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
               </tr>
               <tr>
               <td class="fieldname">Next Due Date </td>
               <%if(form.getExpectedReturnDate()!=null && !form.getExpectedReturnDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getExpectedReturnDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
               </tr>
               <tr class="even">
              <td class="fieldname">Defer Counter</td>
              <td><bean:write name="SecurityReceiptForm" property="deferCount"/>&nbsp; 
               
              </td>
            </tr>
              <tr class="even">
              <td class="fieldname">Aging of Deferred date from Original Target date</td>
               <td class="even" >
											&nbsp;
										<p><b id='valTotalDeferedDays'></b> </p>
               <script type="text/javascript">
               setDifferenceBetDate();
               </script>
								            
								            </td>
            </tr>
              <tr class="even">
              <td class="fieldname">Aging of Next Due date from Original Target date</td>
              <td class="even" >
											&nbsp;
											
											
											<p><b id='valOriginalDeferedDays'></b> </p>
               <script type="text/javascript">
               originalDeferedDaysCal();
               </script>
											
								            
								            </td>
            </tr>
           <%} %>
           
           <tr class="odd">
		                 <td class="fieldname"><bean:message key="label.roc.charge"/>&nbsp;</td>
		                 <td>
		                 <html:select property="rocCharge" disabled="<%=!isCustomerCorporate%>">
							<option value="">Please Select</option>
							<html:options collection="rocChargeList" labelProperty="label" property="value" />
					 	 </html:select>
			    		 <html:hidden property="rocCharge" />
		                 </td>
		  	</tr>
           
            <tr class="odd">
              <td class="fieldname">Credit Approver &nbsp;<font color="RED">* </font></td>
              <td><html:select property="creditApprover"  >
											<option value="">Please Select</option>
											<html:options collection="waiverCreditApproverList" labelProperty="label" property="value" />
											</html:select>
                  <html:errors property="creditApprover" />
                </td>
            </tr>
<%-- start here for cr-17
            <tr class="even">
              <td class="fieldname" >Shared</td>
              <td >                    
                    <html:radio property="shared" value="true" />Yes
                    <html:radio property="shared" value="false"  />No
                    <html:errors property="shared" />
              </td>
              </tr>
--%>
            </tbody>
        </table>
        <html:hidden property="actionParty" />
<%--
         <jsp:include page="/checklist/secreceipt/update_sharechecklist.jsp" />
--%>
        <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
                    <tbody>
                <tr class="even">
                  <td class="fieldname">Remarks</td>
                  <td><html:textarea name="SecurityReceiptForm" rows="5" cols="80" property="docRemarks" onkeyup="limitTextInput(this,1600,'Narration')"/><html:errors property="docRemarks" /></td>
                </tr>
              </tbody>
        </table>
        <table width="100%">
                <tr>
				<td>
				<br></br>
 <jsp:include page="view_audit_details_individual.jsp"></jsp:include>
				</td>
				<html:hidden property="documentStatus"  value="PENDING_WAIVER"/>
					<html:hidden property="itemStatus" />
			</tr>
			</table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="center" valign="middle">
                    <a href="#" onclick = "saveForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image1"  border="0" id="Image1" /></a>
                    <a href="#" onclick="cancelForm()"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4" border="0" id="Image4" /></a>
                </td>
              </tr>
        </table>
    <%-- End here for cr-17 --%>
        </td>
    </tr>
  </tbody>
</table>

<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
